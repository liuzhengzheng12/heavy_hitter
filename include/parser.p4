parser start {
    return parse_ethernet;
}

parser parse_ethernet {
    extract(ethernet);
    return select(latest.ethertype) {
        0X0800 : parse_ipv4;
        default : ingress;
    }
}

parser parse_ipv4 {
    extract(ipv4);
    set_metadata(hh_meta.sip, ipv4.sip);
    set_metadata(hh_meta.dip, ipv4.dip);
    return select(latest.proto) {
        6 : parse_tcp;
        17 : parse_udp;
        default: ingress;
    }
}

parser parse_tcp {
    extract(tcp);
    set_metadata(hh_meta.proto, 6);
    set_metadata(hh_meta.sPort, tcp.sPort);
    set_metadata(hh_meta.dPort, tcp.dPort);
    return ingress;
}

parser parse_udp {
    extract(udp);
    set_metadata(hh_meta.proto, 17);
    set_metadata(hh_meta.sPort, udp.sPort);
    set_metadata(hh_meta.dPort, udp.dPort);
    return ingress;
}
