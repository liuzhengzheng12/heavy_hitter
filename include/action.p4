action find_min0() {
    min(hh_meta.cnt_tmp, hh_meta.cnt0, hh_meta.cnt1);
}

action find_min1() {
    min(hh_meta.cnt_min, hh_meta.cnt_tmp, hh_meta.cnt2);
}

action update_hh() {
    modify_field(eg_intr_md.egress_qid, HEAVY_HITTER_QID);
}