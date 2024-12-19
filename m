Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDCF221479;
	Thu, 19 Dec 2024 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603177; cv=none; b=cPp6Mnc/gjJskmSZsRNayDYsQjXybEnoqwYf+iXuybkeqjp5DX3E6FWXyl1DkoB2XCHNScvPTRWGZXr0650rhz30z0PnG9orx3EyhJ/C1Cmq3ccEgAku1xXPeevKA7itaLruU1VTXYFkTYrVRe7MOkHw+s6eBQIihRCWpndZJP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603177; c=relaxed/simple;
	bh=a17Vwd1+D2fks7QR1JmC659fAgpgnv4wTe3Oa6nWqQM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BS15PDE/Nqvxp6cWFHgJXO+V5STuusooaTDnOxMIRVLFSsA8b+Eha+jGgWRJlPZmUszjUsaMMiqo0OQ7sospzEsDhSikjZBxMlK0N6oHLOlnyYjAYgvinxVwmpCEeNBFIT/urnk/vwdA4OW8Dk1kgS/B/zuYM6SVxu/Gy0UhDl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIA/GFRA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIA/GFRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734603176; x=1766139176;
  h=date:from:cc:subject:message-id:mime-version;
  bh=a17Vwd1+D2fks7QR1JmC659fAgpgnv4wTe3Oa6nWqQM=;
  b=GIA/GFRA9H2XDlwdVGdnrFlW/57X8aWmt5oV79+HgCQablZw/VpI753s
   faIchLs/VLW1G7yvHc0xfHp6WcB+Ig1jtNTuLkfuhtkT714bnJHjc97Wa
   jufepX8zMSBghJMQvNYMMteueCqNQjhlV8Jd/ne//UgnduYpg2TB1b9zT
   r8X5cvRHUdjE6DvvQ/r0KWRP9aYvopLipRMVLxYo+CR3E477KaHhspHFL
   FN/6IepiLTxfdvF8MQuWdcfV43QlnEPODjUdO58aJbp60x7IBEA1MS6rF
   jYQEaco7teo7TcAWOiZ1SN1spgpniGxHd7mFBiaCgEbVfzdBbad3bTifX
   A==;
X-CSE-ConnectionGUID: 1/mZyi8vQ1mpGt4TcVpIyw==
X-CSE-MsgGUID: KIuiEafNQ1SKH8QhXcXCeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="39045197"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="39045197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 02:12:55 -0800
X-CSE-ConnectionGUID: xUL10RLJRzOL13Hs9VRWFw==
X-CSE-MsgGUID: QeusZ3ZvRjaP66kAyL6vgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="97974040"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Dec 2024 02:12:54 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tODWW-0000AH-0g;
	Thu, 19 Dec 2024 10:12:52 +0000
Date: Thu, 19 Dec 2024 18:12:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [sudeep-holla:android13-5.10/ffa 9247/9999] vmlinux.o: warning:
 objtool: ftrace_caller()+0x7b: call without frame pointer save/setup
Message-ID: <202412191836.LsaqyiIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: e48efff5cb5fd63a687465347bdbb52ef98dad44 [9247/9999] ANDROID: arch/Kconfig: fix up LTO LLVM_IAS depdency
config: x86_64-buildonly-randconfig-005-20241216 (https://download.01.org/0day-ci/archive/20241219/202412191836.LsaqyiIY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412191836.LsaqyiIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412191836.LsaqyiIY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ftrace_caller()+0x7b: call without frame pointer save/setup
>> vmlinux.o: warning: objtool: ftrace_regs_caller()+0xde: call without frame pointer save/setup
>> vmlinux.o: warning: objtool: ftrace_graph_caller()+0x7c: call without frame pointer save/setup
   vmlinux.o: warning: objtool: aesni_gcm_init_avx_gen2()+0x12: unsupported stack pointer realignment
   vmlinux.o: warning: objtool: aesni_gcm_enc_update_avx_gen2()+0x12: unsupported stack pointer realignment
   vmlinux.o: warning: objtool: aesni_gcm_dec_update_avx_gen2()+0x12: unsupported stack pointer realignment
   vmlinux.o: warning: objtool: aesni_gcm_finalize_avx_gen2()+0x12: unsupported stack pointer realignment
   vmlinux.o: warning: objtool: aesni_gcm_init_avx_gen4()+0x12: unsupported stack pointer realignment
   vmlinux.o: warning: objtool: aesni_gcm_enc_update_avx_gen4()+0x12: unsupported stack pointer realignment
   vmlinux.o: warning: objtool: aesni_gcm_dec_update_avx_gen4()+0x12: unsupported stack pointer realignment
   vmlinux.o: warning: objtool: aesni_gcm_finalize_avx_gen4()+0x12: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: sha1_transform_avx2()+0xc: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: sha1_ni_transform()+0x7: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: sha256_transform_rorx()+0x13: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: sha512_transform_ssse3()+0x14: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: sha512_transform_avx()+0x14: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: sha512_transform_rorx()+0x7: unsupported stack pointer realignment
>> vmlinux.o: warning: objtool: kretprobe_trampoline()+0x25: call without frame pointer save/setup
   vmlinux.o: warning: objtool: machine_real_restart()+0xe4: unsupported instruction in callable function
   vmlinux.o: warning: objtool: __x86_retpoline_rdi()+0x0: stack state mismatch: cfa1=7+8 cfa2=-1+0
   ld.lld: error: relocation refers to a symbol in a discarded section: __brk_reservation_fn_dmi_alloc__.98f1b732067320beede1e8e29a14f5c5
   >>> defined in vmlinux.o
   >>> referenced by fbdev.c
   >>>               vmlinux.o:(exit_amd_microcode.89034ca01daaab48e4eea99779dc83f1.cfi_jt)
--
   In file included from kernel/cfi.c:9:
   In file included from include/linux/kallsyms.h:12:
   In file included from include/linux/mm.h:1593:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/cfi.c:319:6: warning: no previous prototype for function '__cfi_slowpath_diag' [-Wmissing-prototypes]
     319 | void cfi_slowpath_handler(uint64_t id, void *ptr, void *diag)
         |      ^
   kernel/cfi.c:22:30: note: expanded from macro 'cfi_slowpath_handler'
      22 | #define cfi_slowpath_handler    __cfi_slowpath_diag
         |                                 ^
   kernel/cfi.c:319:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     319 | void cfi_slowpath_handler(uint64_t id, void *ptr, void *diag)
         | ^
         | static 
>> kernel/cfi.c:343:6: warning: no previous prototype for function '__ubsan_handle_cfi_check_fail' [-Wmissing-prototypes]
     343 | void cfi_failure_handler(void *data, void *ptr, void *vtable)
         |      ^
   kernel/cfi.c:21:29: note: expanded from macro 'cfi_failure_handler'
      21 | #define cfi_failure_handler     __ubsan_handle_cfi_check_fail
         |                                 ^
   kernel/cfi.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     343 | void cfi_failure_handler(void *data, void *ptr, void *vtable)
         | ^
         | static 
   kernel/cfi.c:349:6: warning: no previous prototype for function '__cfi_check_fail' [-Wmissing-prototypes]
     349 | void __cfi_check_fail(void *data, void *ptr)
         |      ^
   kernel/cfi.c:349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     349 | void __cfi_check_fail(void *data, void *ptr)
         | ^
         | static 
   4 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
