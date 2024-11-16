Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3586F191F67;
	Sat, 16 Nov 2024 22:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731797362; cv=none; b=OqhUvefEZQVwaU6unn6/jP6asLuO+bPFGJf8QDuFdCrYuXG5UZway884krM+JHywENosbWWqJ0xZRGsG3m/4Cdwl59dppUK/Mwptrc8KqHuNjhZvPqKbG4NOwYgc3oCHcRxSSaMsN0o+BwNgXb0QuIb7YgXa3fkNu2xwKUWEVXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731797362; c=relaxed/simple;
	bh=xTUaPuBkG9w82IE1gG7z7Yrbtys/OZWLY6SBTOqRuyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQPG/FwzLjUX28UQF7R0wwJy+23WaD3pUuaw+EduschtNY2AdDIWKwN0J71zkEimux3uQ90L97a6d9kP/aahSkfTHySQ8DCXbnkxEenm8ks0KEtPERzRLC1Gg0VvnjfLS6G+6ghZLRrMZTjgHki5eji/m//n+Um2lxvp2LRL4EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/olpUHC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/olpUHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731797360; x=1763333360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTUaPuBkG9w82IE1gG7z7Yrbtys/OZWLY6SBTOqRuyI=;
  b=O/olpUHCKUn9Csxmf5/W7MuVRvfrrSbaNZl4/IlaQjSApzAetdMl8FFm
   +tXxMXivH5rB1vNIkFv0HhRre+CKTQi7gNM6DD6ztGEhtYazDFA86QEXa
   SZDChl6jJ0XWTF1+GjNH8eyHg1XuYIWVO7Hh2RDsb1kAZQfeQ1QUqlf5j
   0obuGLHPBbmAaYPOt9QD7lwcZawnnr73rXbg+L7ghw7qriybHywEcNESQ
   C6+Bc7mCA9voLNVl3VUZph4Km3FRn02/fIaSXztXFeQOHg3hH7FL4/rKd
   CYuyKEIMO0O9uYkDmg4y8Ka6oazoCIG2CW+4SDM/2XyylO9XpQVwVM1Av
   Q==;
X-CSE-ConnectionGUID: FGjeQU1bR+y+EGUCJeqZfg==
X-CSE-MsgGUID: zRcLwIzqQ1iitlSBt7rmSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31918631"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31918631"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 14:49:17 -0800
X-CSE-ConnectionGUID: /T0GO+UiSemjUl790XnQRw==
X-CSE-MsgGUID: gLVvtX6mTaORV/Fwq+Blhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88634292"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 14:49:15 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCRbN-00019f-1c;
	Sat, 16 Nov 2024 22:49:13 +0000
Date: Sun, 17 Nov 2024 06:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:module/namespace 8/8] <inline asm>:1191:93: error:
 unexpected token
Message-ID: <202411170618.NtapXkN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git module/namespace
head:   eddf030901699351844504fd2232ae7ea6d1e787
commit: eddf030901699351844504fd2232ae7ea6d1e787 [8/8] x86/kvm: Testing...
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241117/202411170618.NtapXkN9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170618.NtapXkN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170618.NtapXkN9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/x86.c:20:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> <inline asm>:1191:93: error: unexpected token
    1191 | .section ".export_symbol","a" ; __export_symbol_kvm_caps: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_caps ; .previous
         |                                                                                             ^
   <inline asm>:1192:93: error: unexpected token
    1192 | .section ".export_symbol","a" ; __export_symbol_kvm_host: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_host ; .previous
         |                                                                                             ^
   <inline asm>:2783:104: error: unexpected token
    2783 | .section ".export_symbol","a" ; __export_symbol_report_ignored_msrs: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad report_ignored_msrs ; .previous
         |                                                                                                        ^
   <inline asm>:2784:107: error: unexpected token
    2784 | .section ".export_symbol","a" ; __export_symbol_enable_vmware_backdoor: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad enable_vmware_backdoor ; .previous
         |                                                                                                           ^
   <inline asm>:2785:95: error: unexpected token
    2785 | .section ".export_symbol","a" ; __export_symbol_enable_pmu: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad enable_pmu ; .previous
         |                                                                                               ^
   <inline asm>:2786:101: error: unexpected token
    2786 | .section ".export_symbol","a" ; __export_symbol_kvm_nr_uret_msrs: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_nr_uret_msrs ; .previous
         |                                                                                                     ^
   <inline asm>:2787:109: error: unexpected token
    2787 | .section ".export_symbol","a" ; __export_symbol_allow_smaller_maxphyaddr: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad allow_smaller_maxphyaddr ; .previous
         |                                                                                                             ^
   <inline asm>:2788:97: error: unexpected token
    2788 | .section ".export_symbol","a" ; __export_symbol_enable_apicv: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad enable_apicv ; .previous
         |                                                                                                 ^
   <inline asm>:2789:108: error: unexpected token
    2789 | .section ".export_symbol","a" ; __export_symbol_kvm_add_user_return_msr: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_add_user_return_msr ; .previous
         |                                                                                                            ^
   <inline asm>:2790:109: error: unexpected token
    2790 | .section ".export_symbol","a" ; __export_symbol_kvm_find_user_return_msr: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_find_user_return_msr ; .previous
         |                                                                                                             ^
   <inline asm>:2791:108: error: unexpected token
    2791 | .section ".export_symbol","a" ; __export_symbol_kvm_set_user_return_msr: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_set_user_return_msr ; .previous
         |                                                                                                            ^
   <inline asm>:2792:102: error: unexpected token
    2792 | .section ".export_symbol","a" ; __export_symbol_kvm_get_apic_mode: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_get_apic_mode ; .previous
         |                                                                                                      ^
   <inline asm>:2793:103: error: unexpected token
    2793 | .section ".export_symbol","a" ; __export_symbol_kvm_spurious_fault: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_spurious_fault ; .previous
         |                                                                                                       ^
   <inline asm>:2794:114: error: unexpected token
    2794 | .section ".export_symbol","a" ; __export_symbol_kvm_deliver_exception_payload: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_deliver_exception_payload ; .previous
         |                                                                                                                  ^
   <inline asm>:2795:104: error: unexpected token
    2795 | .section ".export_symbol","a" ; __export_symbol_kvm_queue_exception: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_queue_exception ; .previous
         |                                                                                                        ^
   <inline asm>:2796:106: error: unexpected token
    2796 | .section ".export_symbol","a" ; __export_symbol_kvm_requeue_exception: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_requeue_exception ; .previous
         |                                                                                                          ^
   <inline asm>:2797:106: error: unexpected token
    2797 | .section ".export_symbol","a" ; __export_symbol_kvm_queue_exception_p: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_queue_exception_p ; .previous
         |                                                                                                          ^
   <inline asm>:2798:105: error: unexpected token
    2798 | .section ".export_symbol","a" ; __export_symbol_kvm_complete_insn_gp: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_complete_insn_gp ; .previous
         |                                                                                                         ^
   <inline asm>:2799:115: error: unexpected token
    2799 | .section ".export_symbol","a" ; __export_symbol_kvm_inject_emulated_page_fault: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_inject_emulated_page_fault ; .previous
         |                                                                                                                   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   4 warnings and 20 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
