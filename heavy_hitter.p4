#include <tofino/intrinsic_metadata.p4>
#include <tofino/stateful_alu_blackbox.p4>

#include "include/macro.p4"
#include "include/header.p4"
#include "include/metadata.p4"
#include "include/parser.p4"
#include "include/hash.p4"
#include "include/action.p4"


register r0 {
    width : 8;
    instance_count : INSTANCE_CNT;
}

register r1 {
    width : 8;
    instance_count : INSTANCE_CNT;
}

register r2 {
    width : 8;
    instance_count : INSTANCE_CNT;
}

blackbox stateful_alu read_and_update_0 {
    reg : r0;
    update_lo_1_value : register_lo + 1;
    output_value : alu_lo;
    output_dst : hh_meta.cnt0;
}

blackbox stateful_alu read_and_update_1 {
    reg : r1;
    update_lo_1_value : register_lo + 1;
    output_value : alu_lo;
    output_dst : hh_meta.cnt1;
}

blackbox stateful_alu read_and_update_2 {
    reg : r2;
    update_lo_1_value : register_lo + 1;
    output_value : alu_lo;
    output_dst : hh_meta.cnt2;
}

action read_and_update_0() {
    read_and_update_0.execute_stateful_alu_from_hash(hash0);
}

action read_and_update_1() {
    read_and_update_1.execute_stateful_alu_from_hash(hash1);
}

action read_and_update_2() {
    read_and_update_2.execute_stateful_alu_from_hash(hash2);
}

table read_and_update_0 {
    actions {
        read_and_update_0;
    }
    size : 1;
}

table read_and_update_1 {
    actions {
        read_and_update_1;
    }
    size : 1;
}

table read_and_update_2 {
    actions {
        read_and_update_2;
    }
    size : 1;
}

table find_min0 {
    actions {
        find_min0;
    }
    size : 1;
}

table find_min1 {
    actions {
        find_min1;
    }
    size : 1;
}

table update_hh {
    reads {
        hh_meta.cnt_min : range;
    }
    actions {
        update_hh;
    }
    size : 1;
}

control ingress {
    apply(read_and_update_0);
    apply(read_and_update_1);
    apply(read_and_update_2);

    apply(find_min0);
    apply(find_min1);

    apply(update_hh);
}
