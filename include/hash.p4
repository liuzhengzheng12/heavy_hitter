field_list hash_fields {
    hh_meta.sip;
    hh_meta.dip;
    hh_meta.proto;
    hh_meta.sPort;
    hh_meta.dPort;
}

field_list_calculation hash0 {
    input {
        hash_fields;
    }
    algorithm : crc32;
    output_width : 16;
}

field_list_calculation hash1 {
    input {
        hash_fields;
    }
    algorithm : crc_32_bzip2;
    output_width : 16;
}

field_list_calculation hash2 {
    input {
        hash_fields;
    }
    algorithm : crc16;
    output_width : 16;
}
