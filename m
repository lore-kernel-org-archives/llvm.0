Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E461FD5;
	Wed, 22 Mar 2023 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679472270; x=1711008270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHc3/WLt2TL3wsvFnYitdU5tRcyozOyckhtrWsy8vDE=;
  b=HaauikXZadj8lHZ432NXJ67Ejs2rjshTfbNfKT64wLQR8etFbqMuAe3S
   +7FQFOxAeE0O0BukjfCEhllj2/CU2Yv7i0Lg/uHbFUywncKKfrYvWFk1w
   h3JqVxbn0ZSZ5/9r0JvI7rQwu7E9RX4/QgFA0CMDoyAo76ljHdrd5xm38
   vqGylw9AjmpqL7GVH+0ZT5A0KXQNd6o5sUzlPoe5A5xVx1F/2HWQuiRaS
   lTlY0g1P0ykFUHxtTqlaNbpNv06YDiZhJyMolFZ82+peeV+cFL2Pn8Vfr
   GOyQZmwqFlwWSoBeJee6UTOgmwonHo3R5NcMAylcYsaDWTIJxpsueTfwK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366889387"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="366889387"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:04:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631900088"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="631900088"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Mar 2023 01:04:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1petSM-000D4o-3B;
	Wed, 22 Mar 2023 08:04:26 +0000
Date: Wed, 22 Mar 2023 16:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 11/11]
 arch/x86/include/asm/kvm-x86-ops.h:23:1: error: implicit declaration of
 function '__KVM_X86_OP' is invalid in C99
Message-ID: <202303221551.8XpbctAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   67517470624490a1d82c0b3a5e744a72d325b4af
commit: 67517470624490a1d82c0b3a5e744a72d325b4af [11/11] static_call: Remove DEFINE_STATIC_CALL_RET0()
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230322/202303221551.8XpbctAW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=67517470624490a1d82c0b3a5e744a72d325b4af
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 67517470624490a1d82c0b3a5e744a72d325b4af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221551.8XpbctAW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/x86.c:9325:
>> arch/x86/include/asm/kvm-x86-ops.h:23:1: error: implicit declaration of function '__KVM_X86_OP' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   KVM_X86_OP_OPTIONAL_RET0(vcpu_precreate)
   ^
   arch/x86/kvm/x86.c:9324:40: note: expanded from macro 'KVM_X86_OP_OPTIONAL_RET0'
   #define KVM_X86_OP_OPTIONAL_RET0(func) __KVM_X86_OP
                                          ^
   In file included from arch/x86/kvm/x86.c:9325:
>> arch/x86/include/asm/kvm-x86-ops.h:24:1: error: expected expression
   KVM_X86_OP(vcpu_create)
   ^
   arch/x86/kvm/x86.c:9322:2: note: expanded from macro 'KVM_X86_OP'
           WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
           ^
   include/asm-generic/bug.h:121:29: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                               ^
   In file included from arch/x86/kvm/x86.c:9325:
   arch/x86/include/asm/kvm-x86-ops.h:82:1: error: expected expression
   KVM_X86_OP_OPTIONAL(load_eoi_exitmap)
   ^
   arch/x86/kvm/x86.c:9323:29: note: expanded from macro 'KVM_X86_OP_OPTIONAL'
   #define KVM_X86_OP_OPTIONAL __KVM_X86_OP
                               ^
   arch/x86/kvm/x86.c:9320:2: note: expanded from macro '__KVM_X86_OP'
           static_call_update(kvm_x86_##func, kvm_x86_ops.func);
           ^
   include/linux/static_call.h:191:2: note: expanded from macro 'static_call_update'
   ({                                                                      \
    ^
   In file included from arch/x86/kvm/x86.c:9325:
>> arch/x86/include/asm/kvm-x86-ops.h:87:39: error: expected ';' after expression
   KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
                                         ^
                                         ;
   arch/x86/include/asm/kvm-x86-ops.h:88:48: error: expected ';' after expression
   KVM_X86_OP_OPTIONAL_RET0(set_identity_map_addr)
                                                  ^
                                                  ;
   arch/x86/include/asm/kvm-x86-ops.h:90:1: error: expected expression
   KVM_X86_OP(load_mmu_pgd)
   ^
   arch/x86/kvm/x86.c:9322:2: note: expanded from macro 'KVM_X86_OP'
           WARN_ON(!kvm_x86_ops.func); __KVM_X86_OP(func)
           ^
   include/asm-generic/bug.h:121:29: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                               ^
   In file included from arch/x86/kvm/x86.c:9325:
   arch/x86/include/asm/kvm-x86-ops.h:108:1: error: expected expression
   KVM_X86_OP_OPTIONAL(set_hv_timer)
   ^
   arch/x86/kvm/x86.c:9323:29: note: expanded from macro 'KVM_X86_OP_OPTIONAL'
   #define KVM_X86_OP_OPTIONAL __KVM_X86_OP
                               ^
   arch/x86/kvm/x86.c:9320:2: note: expanded from macro '__KVM_X86_OP'
           static_call_update(kvm_x86_##func, kvm_x86_ops.func);
           ^
   include/linux/static_call.h:191:2: note: expanded from macro 'static_call_update'
   ({                                                                      \
    ^
   7 errors generated.


vim +/__KVM_X86_OP +23 arch/x86/include/asm/kvm-x86-ops.h

9af5471bdbb2a2 Jason Baron         2021-01-14    5  
9af5471bdbb2a2 Jason Baron         2021-01-14    6  /*
e4fc23bad81359 Paolo Bonzini       2021-12-09    7   * KVM_X86_OP() and KVM_X86_OP_OPTIONAL() are used to help generate
e4fc23bad81359 Paolo Bonzini       2021-12-09    8   * both DECLARE/DEFINE_STATIC_CALL() invocations and
e4fc23bad81359 Paolo Bonzini       2021-12-09    9   * "static_call_update()" calls.
e4fc23bad81359 Paolo Bonzini       2021-12-09   10   *
e4fc23bad81359 Paolo Bonzini       2021-12-09   11   * KVM_X86_OP_OPTIONAL() can be used for those functions that can have
37c88ccaa01035 Josh Poimboeuf      2023-03-21   12   * a NULL definition.  KVM_X86_OP_OPTIONAL_RET0() can be used likewise
67517470624490 Josh Poimboeuf      2023-03-21   13   * to make a definition optional.
9af5471bdbb2a2 Jason Baron         2021-01-14   14   */
d83420c2d74e66 Sean Christopherson 2022-11-30   15  KVM_X86_OP(check_processor_compatibility)
e4fc23bad81359 Paolo Bonzini       2021-12-09   16  KVM_X86_OP(hardware_enable)
e4fc23bad81359 Paolo Bonzini       2021-12-09   17  KVM_X86_OP(hardware_disable)
e4fc23bad81359 Paolo Bonzini       2021-12-09   18  KVM_X86_OP(hardware_unsetup)
9af5471bdbb2a2 Jason Baron         2021-01-14   19  KVM_X86_OP(has_emulated_msr)
9af5471bdbb2a2 Jason Baron         2021-01-14   20  KVM_X86_OP(vcpu_after_set_cpuid)
9af5471bdbb2a2 Jason Baron         2021-01-14   21  KVM_X86_OP(vm_init)
e4fc23bad81359 Paolo Bonzini       2021-12-09   22  KVM_X86_OP_OPTIONAL(vm_destroy)
d588bb9be1da6a Chao Gao            2022-04-19  @23  KVM_X86_OP_OPTIONAL_RET0(vcpu_precreate)
9af5471bdbb2a2 Jason Baron         2021-01-14  @24  KVM_X86_OP(vcpu_create)
9af5471bdbb2a2 Jason Baron         2021-01-14   25  KVM_X86_OP(vcpu_free)
9af5471bdbb2a2 Jason Baron         2021-01-14   26  KVM_X86_OP(vcpu_reset)
e27bc0440ebd14 Sean Christopherson 2022-01-28   27  KVM_X86_OP(prepare_switch_to_guest)
9af5471bdbb2a2 Jason Baron         2021-01-14   28  KVM_X86_OP(vcpu_load)
9af5471bdbb2a2 Jason Baron         2021-01-14   29  KVM_X86_OP(vcpu_put)
9af5471bdbb2a2 Jason Baron         2021-01-14   30  KVM_X86_OP(update_exception_bitmap)
9af5471bdbb2a2 Jason Baron         2021-01-14   31  KVM_X86_OP(get_msr)
9af5471bdbb2a2 Jason Baron         2021-01-14   32  KVM_X86_OP(set_msr)
9af5471bdbb2a2 Jason Baron         2021-01-14   33  KVM_X86_OP(get_segment_base)
9af5471bdbb2a2 Jason Baron         2021-01-14   34  KVM_X86_OP(get_segment)
9af5471bdbb2a2 Jason Baron         2021-01-14   35  KVM_X86_OP(get_cpl)
9af5471bdbb2a2 Jason Baron         2021-01-14   36  KVM_X86_OP(set_segment)
e4fc23bad81359 Paolo Bonzini       2021-12-09   37  KVM_X86_OP(get_cs_db_l_bits)
9af5471bdbb2a2 Jason Baron         2021-01-14   38  KVM_X86_OP(set_cr0)
e4fc23bad81359 Paolo Bonzini       2021-12-09   39  KVM_X86_OP_OPTIONAL(post_set_cr3)
9af5471bdbb2a2 Jason Baron         2021-01-14   40  KVM_X86_OP(is_valid_cr4)
9af5471bdbb2a2 Jason Baron         2021-01-14   41  KVM_X86_OP(set_cr4)
9af5471bdbb2a2 Jason Baron         2021-01-14   42  KVM_X86_OP(set_efer)
9af5471bdbb2a2 Jason Baron         2021-01-14   43  KVM_X86_OP(get_idt)
9af5471bdbb2a2 Jason Baron         2021-01-14   44  KVM_X86_OP(set_idt)
9af5471bdbb2a2 Jason Baron         2021-01-14   45  KVM_X86_OP(get_gdt)
9af5471bdbb2a2 Jason Baron         2021-01-14   46  KVM_X86_OP(set_gdt)
9af5471bdbb2a2 Jason Baron         2021-01-14   47  KVM_X86_OP(sync_dirty_debug_regs)
9af5471bdbb2a2 Jason Baron         2021-01-14   48  KVM_X86_OP(set_dr7)
9af5471bdbb2a2 Jason Baron         2021-01-14   49  KVM_X86_OP(cache_reg)
9af5471bdbb2a2 Jason Baron         2021-01-14   50  KVM_X86_OP(get_rflags)
9af5471bdbb2a2 Jason Baron         2021-01-14   51  KVM_X86_OP(set_rflags)
c5063551bfcae4 Marc Orr            2021-12-09   52  KVM_X86_OP(get_if_flag)
e27bc0440ebd14 Sean Christopherson 2022-01-28   53  KVM_X86_OP(flush_tlb_all)
e27bc0440ebd14 Sean Christopherson 2022-01-28   54  KVM_X86_OP(flush_tlb_current)
e4fc23bad81359 Paolo Bonzini       2021-12-09   55  KVM_X86_OP_OPTIONAL(tlb_remote_flush)
e4fc23bad81359 Paolo Bonzini       2021-12-09   56  KVM_X86_OP_OPTIONAL(tlb_remote_flush_with_range)
e27bc0440ebd14 Sean Christopherson 2022-01-28   57  KVM_X86_OP(flush_tlb_gva)
e27bc0440ebd14 Sean Christopherson 2022-01-28   58  KVM_X86_OP(flush_tlb_guest)
fc4fad79fc3d88 Sean Christopherson 2021-12-28   59  KVM_X86_OP(vcpu_pre_run)
e27bc0440ebd14 Sean Christopherson 2022-01-28   60  KVM_X86_OP(vcpu_run)
e4fc23bad81359 Paolo Bonzini       2021-12-09   61  KVM_X86_OP(handle_exit)
e4fc23bad81359 Paolo Bonzini       2021-12-09   62  KVM_X86_OP(skip_emulated_instruction)
e4fc23bad81359 Paolo Bonzini       2021-12-09   63  KVM_X86_OP_OPTIONAL(update_emulated_instruction)
9af5471bdbb2a2 Jason Baron         2021-01-14   64  KVM_X86_OP(set_interrupt_shadow)
9af5471bdbb2a2 Jason Baron         2021-01-14   65  KVM_X86_OP(get_interrupt_shadow)
9af5471bdbb2a2 Jason Baron         2021-01-14   66  KVM_X86_OP(patch_hypercall)
e27bc0440ebd14 Sean Christopherson 2022-01-28   67  KVM_X86_OP(inject_irq)
e27bc0440ebd14 Sean Christopherson 2022-01-28   68  KVM_X86_OP(inject_nmi)
6ad75c5c99f78e Sean Christopherson 2022-08-30   69  KVM_X86_OP(inject_exception)
9af5471bdbb2a2 Jason Baron         2021-01-14   70  KVM_X86_OP(cancel_injection)
9af5471bdbb2a2 Jason Baron         2021-01-14   71  KVM_X86_OP(interrupt_allowed)
9af5471bdbb2a2 Jason Baron         2021-01-14   72  KVM_X86_OP(nmi_allowed)
9af5471bdbb2a2 Jason Baron         2021-01-14   73  KVM_X86_OP(get_nmi_mask)
9af5471bdbb2a2 Jason Baron         2021-01-14   74  KVM_X86_OP(set_nmi_mask)
9af5471bdbb2a2 Jason Baron         2021-01-14   75  KVM_X86_OP(enable_nmi_window)
9af5471bdbb2a2 Jason Baron         2021-01-14   76  KVM_X86_OP(enable_irq_window)
e4fc23bad81359 Paolo Bonzini       2021-12-09   77  KVM_X86_OP_OPTIONAL(update_cr8_intercept)
9af5471bdbb2a2 Jason Baron         2021-01-14   78  KVM_X86_OP(refresh_apicv_exec_ctrl)
abb6d479e22642 Paolo Bonzini       2022-02-08   79  KVM_X86_OP_OPTIONAL(hwapic_irr_update)
abb6d479e22642 Paolo Bonzini       2022-02-08   80  KVM_X86_OP_OPTIONAL(hwapic_isr_update)
5be2226f417d5b Paolo Bonzini       2022-02-15   81  KVM_X86_OP_OPTIONAL_RET0(guest_apic_has_interrupt)
abb6d479e22642 Paolo Bonzini       2022-02-08   82  KVM_X86_OP_OPTIONAL(load_eoi_exitmap)
abb6d479e22642 Paolo Bonzini       2022-02-08   83  KVM_X86_OP_OPTIONAL(set_virtual_apic_mode)
e4fc23bad81359 Paolo Bonzini       2021-12-09   84  KVM_X86_OP_OPTIONAL(set_apic_access_page_addr)
57dfd7b53dec74 Sean Christopherson 2022-01-28   85  KVM_X86_OP(deliver_interrupt)
e4fc23bad81359 Paolo Bonzini       2021-12-09   86  KVM_X86_OP_OPTIONAL(sync_pir_to_irr)
5be2226f417d5b Paolo Bonzini       2022-02-15  @87  KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
5be2226f417d5b Paolo Bonzini       2022-02-15   88  KVM_X86_OP_OPTIONAL_RET0(set_identity_map_addr)
ba28401bb93e5c Sean Christopherson 2022-07-14   89  KVM_X86_OP_OPTIONAL_RET0(get_mt_mask)
9af5471bdbb2a2 Jason Baron         2021-01-14   90  KVM_X86_OP(load_mmu_pgd)
e4fc23bad81359 Paolo Bonzini       2021-12-09   91  KVM_X86_OP(has_wbinvd_exit)
307a94c721fed1 Ilias Stamatis      2021-05-26   92  KVM_X86_OP(get_l2_tsc_offset)
307a94c721fed1 Ilias Stamatis      2021-05-26   93  KVM_X86_OP(get_l2_tsc_multiplier)
edcfe54058114c Ilias Stamatis      2021-05-26   94  KVM_X86_OP(write_tsc_offset)
1ab9287add5e26 Ilias Stamatis      2021-06-07   95  KVM_X86_OP(write_tsc_multiplier)
9af5471bdbb2a2 Jason Baron         2021-01-14   96  KVM_X86_OP(get_exit_info)
9af5471bdbb2a2 Jason Baron         2021-01-14   97  KVM_X86_OP(check_intercept)
9af5471bdbb2a2 Jason Baron         2021-01-14   98  KVM_X86_OP(handle_exit_irqoff)
e4fc23bad81359 Paolo Bonzini       2021-12-09   99  KVM_X86_OP(request_immediate_exit)
9af5471bdbb2a2 Jason Baron         2021-01-14  100  KVM_X86_OP(sched_in)
e4fc23bad81359 Paolo Bonzini       2021-12-09  101  KVM_X86_OP_OPTIONAL(update_cpu_dirty_logging)
e4fc23bad81359 Paolo Bonzini       2021-12-09  102  KVM_X86_OP_OPTIONAL(vcpu_blocking)
e4fc23bad81359 Paolo Bonzini       2021-12-09  103  KVM_X86_OP_OPTIONAL(vcpu_unblocking)
e4fc23bad81359 Paolo Bonzini       2021-12-09  104  KVM_X86_OP_OPTIONAL(pi_update_irte)
e4fc23bad81359 Paolo Bonzini       2021-12-09  105  KVM_X86_OP_OPTIONAL(pi_start_assignment)
abb6d479e22642 Paolo Bonzini       2022-02-08  106  KVM_X86_OP_OPTIONAL(apicv_post_state_restore)
5be2226f417d5b Paolo Bonzini       2022-02-15  107  KVM_X86_OP_OPTIONAL_RET0(dy_apicv_has_pending_interrupt)
e4fc23bad81359 Paolo Bonzini       2021-12-09  108  KVM_X86_OP_OPTIONAL(set_hv_timer)
e4fc23bad81359 Paolo Bonzini       2021-12-09  109  KVM_X86_OP_OPTIONAL(cancel_hv_timer)
9af5471bdbb2a2 Jason Baron         2021-01-14  110  KVM_X86_OP(setup_mce)
31e83e21cf00fe Paolo Bonzini       2022-09-29  111  #ifdef CONFIG_KVM_SMM
9af5471bdbb2a2 Jason Baron         2021-01-14  112  KVM_X86_OP(smi_allowed)
ecc513e5bb7ed5 Sean Christopherson 2021-06-09  113  KVM_X86_OP(enter_smm)
ecc513e5bb7ed5 Sean Christopherson 2021-06-09  114  KVM_X86_OP(leave_smm)
9af5471bdbb2a2 Jason Baron         2021-01-14  115  KVM_X86_OP(enable_smi_window)
31e83e21cf00fe Paolo Bonzini       2022-09-29  116  #endif
e4fc23bad81359 Paolo Bonzini       2021-12-09  117  KVM_X86_OP_OPTIONAL(mem_enc_ioctl)
e4fc23bad81359 Paolo Bonzini       2021-12-09  118  KVM_X86_OP_OPTIONAL(mem_enc_register_region)
e4fc23bad81359 Paolo Bonzini       2021-12-09  119  KVM_X86_OP_OPTIONAL(mem_enc_unregister_region)
e4fc23bad81359 Paolo Bonzini       2021-12-09  120  KVM_X86_OP_OPTIONAL(vm_copy_enc_context_from)
e4fc23bad81359 Paolo Bonzini       2021-12-09  121  KVM_X86_OP_OPTIONAL(vm_move_enc_context_from)
683412ccf61294 Mingwei Zhang       2022-04-21  122  KVM_X86_OP_OPTIONAL(guest_memory_reclaimed)
9af5471bdbb2a2 Jason Baron         2021-01-14  123  KVM_X86_OP(get_msr_feature)
9af5471bdbb2a2 Jason Baron         2021-01-14  124  KVM_X86_OP(can_emulate_instruction)
9af5471bdbb2a2 Jason Baron         2021-01-14  125  KVM_X86_OP(apic_init_signal_blocked)
b83237ad2167a0 Vitaly Kuznetsov    2022-11-01  126  KVM_X86_OP_OPTIONAL(enable_l2_tlb_flush)
e4fc23bad81359 Paolo Bonzini       2021-12-09  127  KVM_X86_OP_OPTIONAL(migrate_timers)
9af5471bdbb2a2 Jason Baron         2021-01-14  128  KVM_X86_OP(msr_filter_changed)
e4fc23bad81359 Paolo Bonzini       2021-12-09  129  KVM_X86_OP(complete_emulated_msr)
a0941a64a97d50 Sean Christopherson 2022-01-28  130  KVM_X86_OP(vcpu_deliver_sipi_vector)
d5fa597ed87047 Maxim Levitsky      2022-03-22  131  KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
9af5471bdbb2a2 Jason Baron         2021-01-14  132  

:::::: The code at line 23 was first introduced by commit
:::::: d588bb9be1da6aa750aa64875fe57369db983d8b KVM: VMX: enable IPI virtualization

:::::: TO: Chao Gao <chao.gao@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
