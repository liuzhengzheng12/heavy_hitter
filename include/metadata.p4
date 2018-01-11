header_type hh_metadata_t {
    fields {
        sip : 32;
        dip : 32;
        proto : 8;
        sPort : 16;
        dPort : 16;   //five tuples
        cnt0 : 8;
        cnt1 : 8;
        cnt2 : 8;
        cnt_tmp : 8;
        cnt_min : 8;
    }
}
metadata hh_metadata_t hh_meta;
