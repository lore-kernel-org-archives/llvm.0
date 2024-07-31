Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D2624;
	Wed, 31 Jul 2024 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418475; cv=none; b=ZktFmPXniws+/MVy5HFblmLQFmvyl7/Qc0zzLtIxkXi/uBWiQj+g3HMFoBYftOtCcfJn2pP9bjh7mZ00SmwFzcULPouEMLVGJREQnkspnoUSFowr1LcVSZJUgY+iXJUxExKd39AyubNrVmq0PedvtKlQsoeLVLIwkuaXcVKr/NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418475; c=relaxed/simple;
	bh=hLKiW+3GOvfiKnjX5L6MCK3OmZz2gMlDsXcyUEwTOUE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cImtLHpf/wNZNi8VsmmrPLQP0sdP3jbL45A4bgeOC9pJXRvcv4PfkQlYdhEU5AHV3jJt2Fp9WgrEa+lRgQik3dGyxcmgURNfLLziuCi5FJKxAg70UyLIXaC5oUAyFS5clPOA5wsN5wkJz3MGRGk9P6vu+a2TEAxS+50nTwjR7zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYRsHTAK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYRsHTAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722418472; x=1753954472;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hLKiW+3GOvfiKnjX5L6MCK3OmZz2gMlDsXcyUEwTOUE=;
  b=NYRsHTAKU7CUbfYACmcOacH9PdkTrE17lx5mYyQkLm5d33qOrnR/EF26
   4Y6oDybXYffDLsA/jhuIebxyuzY8avlkni/OMNoylku12OQlToQyKuT4r
   v04AOdRlIC85tojdx8sJw7Xho08f0xVL6eh8v38A669WdqU1PoOQhdbKC
   ql3JUdjZ/KTy6Jkh9OoFQRTBCk5AVEWvIYAiCJinglpO7daZ3B0nm3uCz
   HMEu0jKPnQvIZxEEDQggT6rLnLevMTgazCFcbSY5iEJkDNQO77KVYQaIS
   5qvLga/h5GDgs0R53X7h8mztt6VLZKlKL3EFy9qXmU2bW53/o+U15FNOw
   g==;
X-CSE-ConnectionGUID: TLtGw/g/TqWtWd5sGYCF5Q==
X-CSE-MsgGUID: BPVVQLQaTzCgv0OCxREziA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30948871"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="30948871"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:34:31 -0700
X-CSE-ConnectionGUID: 7RUf95gKTdKoey3ncG5amw==
X-CSE-MsgGUID: ITq2Wuh/RqanN+HpOLg0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54683978"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2024 02:34:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ5j1-000u5q-0v;
	Wed, 31 Jul 2024 09:34:27 +0000
Date: Wed, 31 Jul 2024 17:34:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [paulmckrcu:dev.2024.07.18b 78/89] vmlinux.o: warning: objtool:
 _RNvXs4Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14:
 missing int3 after ret
Message-ID: <202407311739.R1SC6oVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev.2024.07.18b
head:   a6c7779283d67a409b81616a5b485ac21637d7e7
commit: 86b3cad52ec824cf98a9babf9b7eae7b37919709 [78/89] EXP rcutorture: Add SRCU-V scenario for preemptible Tiny SRCU
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311739.R1SC6oVT-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311739.R1SC6oVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311739.R1SC6oVT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core3fmt3num3imp7fmt_u64+0x25f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core3fmt3num3imp7exp_u64+0x592: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtCs5QSdWC790r4_4core3fmt3num8exp_u128+0x93d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsD_NtCs5QSdWC790r4_4core3fmtNtB5_5ErrorNtB5_5Debug3fmt+0x18: missing int3 after indirect jump
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRDNtB5_5DebugEL_Bw_3fmtB7_+0xe: missing int3 after indirect jump
   vmlinux.o: warning: objtool: _RNvXsV_NtCs5QSdWC790r4_4core3fmtRtNtB5_8LowerHex3fmtB7_+0x7f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs20_NtNtCs5QSdWC790r4_4core3str4iterNtB6_11EscapeDebugNtNtBa_3fmt7Display3fmt+0x92a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs23_NtNtCs5QSdWC790r4_4core3str4iterNtB6_13EscapeDefaultNtNtBa_3fmt7Display3fmt+0x25d: missing int3 after indirect jump
   vmlinux.o: warning: objtool: _RNvXs26_NtNtCs5QSdWC790r4_4core3str4iterNtB6_13EscapeUnicodeNtNtBa_3fmt7Display3fmt+0x27d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data10alphabetic6lookup+0x12d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data14case_ignorable6lookup+0x12d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data5cased6lookup+0x12d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data2cc6lookup+0x34: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data15grapheme_extend6lookup+0x12d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data9lowercase6lookup+0x41: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data1n6lookup+0x12d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data9uppercase6lookup+0x41: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data11conversions8to_lower+0xb1: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtNtNtCs5QSdWC790r4_4core7unicode12unicode_data11conversions8to_upper+0xbc: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeReECscg2doA4GLaz_5alloc+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCscg2doA4GLaz_5alloc7raw_vec11finish_growNtNtB4_5alloc6GlobalEB4_+0xa1: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1_NtCscg2doA4GLaz_5alloc11collectionsNtB5_15TryReserveErrorNtNtCs5QSdWC790r4_4core3fmt7Display3fmt+0x2b: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCscg2doA4GLaz_5alloc6stringNtB2_6String14into_raw_parts+0x19: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCscg2doA4GLaz_5alloc6stringNtB2_6String11try_reserve+0xdf: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCscg2doA4GLaz_5alloc6stringNtB2_6String17try_reserve_exact+0xbe: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvMNtCscg2doA4GLaz_5alloc6stringNtB5_6String6retainNtB2_12SetLenOnDropNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x1e: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCscg2doA4GLaz_5alloc6stringNtB4_13FromUtf8Error8as_bytes+0xd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4_NtCscg2doA4GLaz_5alloc6stringRNtB5_6StringNtNtNtCs5QSdWC790r4_4core3str7pattern7Pattern13into_searcher+0x23: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsg_NtCscg2doA4GLaz_5alloc6stringNtB5_6StringINtNtCs5QSdWC790r4_4core7convert4FromINtNtB7_5boxed3BoxeEE4from+0xe: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsi_NtCscg2doA4GLaz_5alloc6stringNtB5_5DrainNtNtCs5QSdWC790r4_4core3fmt5Debug3fmt+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsl_NtCscg2doA4GLaz_5alloc6stringNtB5_5DrainNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x6e: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMsm_NtCscg2doA4GLaz_5alloc6stringNtB5_5Drain6as_str+0x10: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsn_NtCscg2doA4GLaz_5alloc6stringNtB5_5DrainINtNtCs5QSdWC790r4_4core7convert5AsRefeE6as_ref+0x10: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsp_NtCscg2doA4GLaz_5alloc6stringNtB5_5DrainNtNtNtNtCs5QSdWC790r4_4core4iter6traits8iterator8Iterator9size_hint+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsi_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB5_6moduleNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXss_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB5_8pi_entryNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXst_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB5_15file_operationsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsF_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB5_13___u128_halvesNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs10_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_21pt_regs__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs11_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7pt_regsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs14_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8idt_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs17_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11pv_lock_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs18_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23paravirt_patch_templateNtNtCs5QSdWC790r4_4core7default7Default7default+0x6a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1b_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_25__fpstate_32__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1d_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11__fpstate_32NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1f_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11__fpstate_64NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1g_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11__ymmh_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1h_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7__xstateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1j_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_26fxregs_state__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1k_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12fxregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1l_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12swregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1m_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11reg_512_bitNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1n_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13reg_1024_byteNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1s_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11xregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1t_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12fpregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1u_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7fpstateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1w_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3fpuNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_25cpuinfo_x86__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x62: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1A_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11cpuinfo_x86NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1C_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11entry_stackNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1D_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16entry_stack_pageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1E_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13x86_io_bitmapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1F_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10tss_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1G_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9irq_stackNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1H_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17fixed_percpu_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1I_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13thread_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1M_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_32___call_single_node__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1N_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18___call_single_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1O_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18___call_single_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1P_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9lock_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1S_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_36spinlock__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1Y_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_28class_raw_spinlock_irqsave_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs28_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14___kernel_timexNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2j_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19kmsan_context_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2k_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9kmsan_ctxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2G_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_21siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2N_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8sigqueueNtNtCs5QSdWC790r4_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2P_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7ksignalNtNtCs5QSdWC790r4_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2U_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_20posix_cputimers_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs30_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9seqlock_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x7a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs33_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9sched_avgNtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs34_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16sched_statisticsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs37_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15sched_dl_entityNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3b_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11task_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3d_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12thread_unionNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3j_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10saved_msrsNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3o_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bpf_raw_event_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3p_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11old_timex32NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14user_namespaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3B_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11maple_allocNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3M_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12rw_semaphoreNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3S_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19system_counterval_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3V_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11work_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs42_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11srcu_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs46_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_22blocking_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs48_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18srcu_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs49_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_25arch_uprobe__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4h_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12mm_context_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4pageNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4A_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs4Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4X_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13lru_gen_folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4Z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15lru_gen_mm_walkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs50_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13lru_gen_memcgNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs51_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6lruvecNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs52_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13per_cpu_pagesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs53_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16per_cpu_nodestatNtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs54_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4zoneNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs58_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11pglist_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10rhashtableNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5F_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_53___kernel_sockaddr_storage__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5I_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_22sockaddr__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5J_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8sockaddrNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs66_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6dentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6a_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18shrinker_info_unitNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6h_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7xa_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3pidNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6y_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19x86_legacy_featuresNtNtCs5QSdWC790r4_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6A_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14___large_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6P_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6U_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16hrtimer_cpu_baseNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs74_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14sighand_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs77_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10core_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs78_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13signal_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7l_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13fs_sysfs_pathNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7v_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10quota_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13address_spaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7E_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5inodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7H_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4fileNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7J_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10sb_writersNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7K_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11super_blockNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18user32_fxsr_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7S_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7V_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_5NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7W_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_28compat_siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x79: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Y_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13compat_direntNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_29compat_sigevent__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x39: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs80_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15compat_sigeventNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs83_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12compat_ifreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs85_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4userNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8h_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19kernfs_global_locksNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8m_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11kernfs_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8n_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16kernfs_open_fileNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8y_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15kobj_uevent_envNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8Y_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11kunit_suiteNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs90_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5kunitNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs94_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11dev_pagemapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9C_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11device_linkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9R_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12sockaddr_in6NtNtCs5QSdWC790r4_4core7default7Default7default+0x21: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9S_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9ipv6_mreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x19: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9V_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_37flow_dissector_key_vlan__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9Y_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_27flow_dissector_key_enc_optsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsb0_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15sk_buff_fclonesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbS_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_tunnel_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbW_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_28bpf_sock_tuple__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x29: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscO_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13bpf_flow_keysNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsd3_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10sock_fprogNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsda_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdb_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3cpuNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdd_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14text_poke_insnNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdy_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9psi_groupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdA_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19cgroup_subsys_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdD_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdE_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11cgroup_rootNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdQ_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16backing_dev_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdR_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12block_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdT_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bio__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseb_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7bpf_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsec_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bpf_offloaded_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsen_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8bpf_ksymNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsep_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15bpf_tramp_imageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseu_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_dispatcherNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseD_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12bpf_prog_auxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseQ_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_struct_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsf6_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_31bpf_iter_aux_info__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfo_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7bpf_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfp_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14compat_rtentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfq_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16compat_group_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsft_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfv_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19compat_group_filterNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfw_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11scm_fp_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfL_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfO_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13ethtool_flashNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfP_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_20ethtool_per_queue_opNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgo_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12dmi_strmatchNtNtCs5QSdWC790r4_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgt_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11mdio_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgz_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12led_classdevNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgJ_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7mii_busNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgK_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10phy_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel3str12RawFormatterEBK_+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placelECs1cdwasc6FUb_6kernel+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvYNtNtCs1cdwasc6FUb_6kernel3str12RawFormatterNtNtCs5QSdWC790r4_4core3fmt5Write10write_charB6_+0x117: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvYNtNtCs1cdwasc6FUb_6kernel3str9FormatterNtNtCs5QSdWC790r4_4core3fmt5Write10write_charB6_+0x125: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VechEINtB2_6VecExthE7reserveB6_+0x136: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs1cdwasc6FUb_6kernel5errorNtB2_5Error4name+0x30: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs1cdwasc6FUb_6kernel5errorNtB4_5ErrorNtNtCs5QSdWC790r4_4core3fmt5Debug3fmt+0x8c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel5error9to_result+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device6phy_id+0x6: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device5state+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device10is_link_up+0xc: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device18is_autoneg_enabled+0xc: missing int3 after ret
--
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device7init_hw+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device10start_aneg+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device13genphy_resume+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device14genphy_suspend+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device18genphy_read_status+0x92: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device18genphy_update_link+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device15genphy_read_lpa+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device21genphy_read_abilities+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs2_NtNtCs1cdwasc6FUb_6kernel3net3phyNtB5_12Registration8register+0x5d: missing int3 after ret
   vmlinux.o: warning: objtool: rust_fmt_argument+0x69: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs1cdwasc6FUb_6kernel3strNtB4_4BStrNtNtCs5QSdWC790r4_4core3fmt7Display3fmt+0x164: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs0_NtCs1cdwasc6FUb_6kernel3strNtB5_4BStrNtNtCs5QSdWC790r4_4core3fmt5Debug3fmt+0x62: missing int3 after indirect jump
   vmlinux.o: warning: objtool: _RNvMs3_NtCs1cdwasc6FUb_6kernel3strNtB5_4CStr19from_bytes_with_nul+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs3_NtCs1cdwasc6FUb_6kernel3strNtB5_4CStr10to_cstring+0xd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs3_NtCs1cdwasc6FUb_6kernel3strNtB5_4CStr20make_ascii_lowercase+0x2c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs3_NtCs1cdwasc6FUb_6kernel3strNtB5_4CStr20make_ascii_uppercase+0x2c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs3_NtCs1cdwasc6FUb_6kernel3strNtB5_4CStr18to_ascii_lowercase+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs3_NtCs1cdwasc6FUb_6kernel3strNtB5_4CStr18to_ascii_uppercase+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4_NtCs1cdwasc6FUb_6kernel3strNtB5_4CStrNtNtCs5QSdWC790r4_4core3fmt7Display3fmt+0x11f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5_NtCs1cdwasc6FUb_6kernel3strNtB5_4CStrNtNtCs5QSdWC790r4_4core3fmt5Debug3fmt+0x17a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsc_NtCs1cdwasc6FUb_6kernel3strNtB5_12RawFormatterNtNtCs5QSdWC790r4_4core3fmt5Write9write_str+0x61: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsf_NtCs1cdwasc6FUb_6kernel3strNtB5_9FormatterNtNtCs5QSdWC790r4_4core3fmt5Write9write_str+0x67: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMsg_NtCs1cdwasc6FUb_6kernel3strNtB5_7CString12try_from_fmt+0x142: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsh_NtCs1cdwasc6FUb_6kernel3strNtB5_7CStringNtNtNtCs5QSdWC790r4_4core3ops5deref5Deref5deref+0xd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsi_NtCs1cdwasc6FUb_6kernel3strNtB5_7CStringNtNtNtCs5QSdWC790r4_4core3ops5deref8DerefMut9deref_mut+0xd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsj_NtCs1cdwasc6FUb_6kernel3strNtB5_7CStringINtNtCs5QSdWC790r4_4core7convert7TryFromRNtB5_4CStrE8try_from+0xcd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4taskNtB5_4Task12group_leader+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4taskNtB5_4Task3pid+0x6: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4taskNtB5_4Task14signal_pending+0xc: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs1cdwasc6FUb_6kernel5typesuNtB4_14ForeignOwnable12into_foreign+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue6system+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue14system_highpri+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue11system_long+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue14system_unbound+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue16system_freezable+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue22system_power_efficient+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue32system_freezable_power_efficient+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsk_Cs2dcoKnfGXnn_4uapiNtB5_13___u128_halvesNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsm_Cs2dcoKnfGXnn_4uapiNtB5_6moduleNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsw_Cs2dcoKnfGXnn_4uapiNtB5_8pi_entryNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsx_Cs2dcoKnfGXnn_4uapiNtB5_15file_operationsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsy_Cs2dcoKnfGXnn_4uapiNtB5_14___kernel_timexNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsS_Cs2dcoKnfGXnn_4uapiNtB5_25__fpstate_32__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsU_Cs2dcoKnfGXnn_4uapiNtB5_11__fpstate_32NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs10_Cs2dcoKnfGXnn_4uapiNtB6_15class_irqsave_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs11_Cs2dcoKnfGXnn_4uapiNtB6_26fxregs_state__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs12_Cs2dcoKnfGXnn_4uapiNtB6_26fxregs_state__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs13_Cs2dcoKnfGXnn_4uapiNtB6_12fxregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs14_Cs2dcoKnfGXnn_4uapiNtB6_12swregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs15_Cs2dcoKnfGXnn_4uapiNtB6_11reg_512_bitNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs16_Cs2dcoKnfGXnn_4uapiNtB6_13reg_1024_byteNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1b_Cs2dcoKnfGXnn_4uapiNtB6_11xregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1c_Cs2dcoKnfGXnn_4uapiNtB6_12fpregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1d_Cs2dcoKnfGXnn_4uapiNtB6_7fpstateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1f_Cs2dcoKnfGXnn_4uapiNtB6_3fpuNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1i_Cs2dcoKnfGXnn_4uapiNtB6_25cpuinfo_x86__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x62: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1j_Cs2dcoKnfGXnn_4uapiNtB6_11cpuinfo_x86NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1l_Cs2dcoKnfGXnn_4uapiNtB6_11entry_stackNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1m_Cs2dcoKnfGXnn_4uapiNtB6_16entry_stack_pageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1n_Cs2dcoKnfGXnn_4uapiNtB6_13x86_io_bitmapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1o_Cs2dcoKnfGXnn_4uapiNtB6_10tss_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1p_Cs2dcoKnfGXnn_4uapiNtB6_9irq_stackNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1q_Cs2dcoKnfGXnn_4uapiNtB6_17fixed_percpu_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1r_Cs2dcoKnfGXnn_4uapiNtB6_13thread_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1A_Cs2dcoKnfGXnn_4uapiNtB6_16codetag_iteratorNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1B_Cs2dcoKnfGXnn_4uapiNtB6_15class_preempt_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1G_Cs2dcoKnfGXnn_4uapiNtB6_32___call_single_node__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1J_Cs2dcoKnfGXnn_4uapiNtB6_9alloc_tagNtNtCs5QSdWC790r4_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1M_Cs2dcoKnfGXnn_4uapiNtB6_41restart_block__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1P_Cs2dcoKnfGXnn_4uapiNtB6_13restart_blockNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1S_Cs2dcoKnfGXnn_4uapiNtB6_19kmsan_context_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1T_Cs2dcoKnfGXnn_4uapiNtB6_9kmsan_ctxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1U_Cs2dcoKnfGXnn_4uapiNtB6_36spinlock__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs26_Cs2dcoKnfGXnn_4uapiNtB6_10timer_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2i_Cs2dcoKnfGXnn_4uapiNtB6_21siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2w_Cs2dcoKnfGXnn_4uapiNtB6_20posix_cputimers_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2C_Cs2dcoKnfGXnn_4uapiNtB6_9seqlock_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x7a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2E_Cs2dcoKnfGXnn_4uapiNtB6_5vtimeNtNtCs5QSdWC790r4_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2F_Cs2dcoKnfGXnn_4uapiNtB6_9sched_avgNtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2G_Cs2dcoKnfGXnn_4uapiNtB6_16sched_statisticsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2J_Cs2dcoKnfGXnn_4uapiNtB6_15sched_dl_entityNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2N_Cs2dcoKnfGXnn_4uapiNtB6_11task_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2P_Cs2dcoKnfGXnn_4uapiNtB6_12thread_unionNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs39_Cs2dcoKnfGXnn_4uapiNtB6_13msr_regs_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3b_Cs2dcoKnfGXnn_4uapiNtB6_10saved_msrsNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3g_Cs2dcoKnfGXnn_4uapiNtB6_17bpf_raw_event_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3h_Cs2dcoKnfGXnn_4uapiNtB6_11old_timex32NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3i_Cs2dcoKnfGXnn_4uapiNtB6_14user_namespaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3n_Cs2dcoKnfGXnn_4uapiNtB6_10rhashtableNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3A_Cs2dcoKnfGXnn_4uapiNtB6_11maple_allocNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3L_Cs2dcoKnfGXnn_4uapiNtB6_12rw_semaphoreNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3W_Cs2dcoKnfGXnn_4uapiNtB6_12delayed_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3Z_Cs2dcoKnfGXnn_4uapiNtB6_12execute_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs42_Cs2dcoKnfGXnn_4uapiNtB6_11srcu_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs46_Cs2dcoKnfGXnn_4uapiNtB6_22blocking_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs48_Cs2dcoKnfGXnn_4uapiNtB6_18srcu_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs49_Cs2dcoKnfGXnn_4uapiNtB6_25arch_uprobe__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4i_Cs2dcoKnfGXnn_4uapiNtB6_12mm_context_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4A_Cs2dcoKnfGXnn_4uapiNtB6_19folio__bindgen_ty_3NtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4B_Cs2dcoKnfGXnn_4uapiNtB6_5folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs4R_Cs2dcoKnfGXnn_4uapiNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs53_Cs2dcoKnfGXnn_4uapiNtB6_53___kernel_sockaddr_storage__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs56_Cs2dcoKnfGXnn_4uapiNtB6_22sockaddr__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs57_Cs2dcoKnfGXnn_4uapiNtB6_8sockaddrNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs59_Cs2dcoKnfGXnn_4uapiNtB6_6msghdrNtNtCs5QSdWC790r4_4core7default7Default7default+0x6a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5u_Cs2dcoKnfGXnn_4uapiNtB6_6dentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs5y_Cs2dcoKnfGXnn_4uapiNtB6_18shrinker_info_unitNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5G_Cs2dcoKnfGXnn_4uapiNtB6_13lru_gen_folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5I_Cs2dcoKnfGXnn_4uapiNtB6_15lru_gen_mm_walkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5J_Cs2dcoKnfGXnn_4uapiNtB6_13lru_gen_memcgNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5K_Cs2dcoKnfGXnn_4uapiNtB6_6lruvecNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5L_Cs2dcoKnfGXnn_4uapiNtB6_13per_cpu_pagesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5M_Cs2dcoKnfGXnn_4uapiNtB6_16per_cpu_nodestatNtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5N_Cs2dcoKnfGXnn_4uapiNtB6_4zoneNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5R_Cs2dcoKnfGXnn_4uapiNtB6_11pglist_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5Y_Cs2dcoKnfGXnn_4uapiNtB6_7xa_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs67_Cs2dcoKnfGXnn_4uapiNtB6_3pidNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6f_Cs2dcoKnfGXnn_4uapiNtB6_19x86_legacy_featuresNtNtCs5QSdWC790r4_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6h_Cs2dcoKnfGXnn_4uapiNtB6_14___large_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6G_Cs2dcoKnfGXnn_4uapiNtB6_3keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6L_Cs2dcoKnfGXnn_4uapiNtB6_16hrtimer_cpu_baseNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6V_Cs2dcoKnfGXnn_4uapiNtB6_14sighand_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6Y_Cs2dcoKnfGXnn_4uapiNtB6_10core_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6Z_Cs2dcoKnfGXnn_4uapiNtB6_13signal_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7c_Cs2dcoKnfGXnn_4uapiNtB6_13fs_sysfs_pathNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7m_Cs2dcoKnfGXnn_4uapiNtB6_10quota_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7q_Cs2dcoKnfGXnn_4uapiNtB6_13address_spaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7v_Cs2dcoKnfGXnn_4uapiNtB6_5inodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7y_Cs2dcoKnfGXnn_4uapiNtB6_4fileNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7A_Cs2dcoKnfGXnn_4uapiNtB6_10sb_writersNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7B_Cs2dcoKnfGXnn_4uapiNtB6_11super_blockNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7H_Cs2dcoKnfGXnn_4uapiNtB6_18user32_fxsr_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7J_Cs2dcoKnfGXnn_4uapiNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7M_Cs2dcoKnfGXnn_4uapiNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_5NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7N_Cs2dcoKnfGXnn_4uapiNtB6_28compat_siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x79: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7P_Cs2dcoKnfGXnn_4uapiNtB6_13compat_direntNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Q_Cs2dcoKnfGXnn_4uapiNtB6_29compat_sigevent__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x39: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7R_Cs2dcoKnfGXnn_4uapiNtB6_15compat_sigeventNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7U_Cs2dcoKnfGXnn_4uapiNtB6_12compat_ifreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7X_Cs2dcoKnfGXnn_4uapiNtB6_11dev_pagemapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8a_Cs2dcoKnfGXnn_4uapiNtB6_19kernfs_global_locksNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8f_Cs2dcoKnfGXnn_4uapiNtB6_11kernfs_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8g_Cs2dcoKnfGXnn_4uapiNtB6_16kernfs_open_fileNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8r_Cs2dcoKnfGXnn_4uapiNtB6_15kobj_uevent_envNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8I_Cs2dcoKnfGXnn_4uapiNtB6_16user_i387_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8J_Cs2dcoKnfGXnn_4uapiNtB6_4userNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8K_Cs2dcoKnfGXnn_4uapiNtB6_14user_ymmh_regsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8M_Cs2dcoKnfGXnn_4uapiNtB6_15user_xstateregsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9o_Cs2dcoKnfGXnn_4uapiNtB6_11device_linkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9D_Cs2dcoKnfGXnn_4uapiNtB6_12sockaddr_in6NtNtCs5QSdWC790r4_4core7default7Default7default+0x21: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9E_Cs2dcoKnfGXnn_4uapiNtB6_9ipv6_mreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x19: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9H_Cs2dcoKnfGXnn_4uapiNtB6_37flow_dissector_key_vlan__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9K_Cs2dcoKnfGXnn_4uapiNtB6_27flow_dissector_key_enc_optsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaM_Cs2dcoKnfGXnn_4uapiNtB6_15sk_buff_fclonesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbE_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_tunnel_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbI_Cs2dcoKnfGXnn_4uapiNtB6_28bpf_sock_tuple__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x29: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscA_Cs2dcoKnfGXnn_4uapiNtB6_13bpf_flow_keysNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscP_Cs2dcoKnfGXnn_4uapiNtB6_10sock_fprogNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscW_Cs2dcoKnfGXnn_4uapiNtB6_4nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscX_Cs2dcoKnfGXnn_4uapiNtB6_3cpuNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscZ_Cs2dcoKnfGXnn_4uapiNtB6_14text_poke_insnNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdk_Cs2dcoKnfGXnn_4uapiNtB6_9psi_groupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdm_Cs2dcoKnfGXnn_4uapiNtB6_19cgroup_subsys_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdp_Cs2dcoKnfGXnn_4uapiNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdq_Cs2dcoKnfGXnn_4uapiNtB6_11cgroup_rootNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdC_Cs2dcoKnfGXnn_4uapiNtB6_16backing_dev_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdD_Cs2dcoKnfGXnn_4uapiNtB6_12block_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdF_Cs2dcoKnfGXnn_4uapiNtB6_17bio__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdX_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdY_Cs2dcoKnfGXnn_4uapiNtB6_17bpf_offloaded_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXse9_Cs2dcoKnfGXnn_4uapiNtB6_8bpf_ksymNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseb_Cs2dcoKnfGXnn_4uapiNtB6_15bpf_tramp_imageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseg_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_dispatcherNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsep_Cs2dcoKnfGXnn_4uapiNtB6_12bpf_prog_auxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseC_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_struct_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseS_Cs2dcoKnfGXnn_4uapiNtB6_31bpf_iter_aux_info__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfa_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfb_Cs2dcoKnfGXnn_4uapiNtB6_14compat_rtentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfc_Cs2dcoKnfGXnn_4uapiNtB6_16compat_group_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsff_Cs2dcoKnfGXnn_4uapiNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfh_Cs2dcoKnfGXnn_4uapiNtB6_19compat_group_filterNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfi_Cs2dcoKnfGXnn_4uapiNtB6_11scm_fp_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfx_Cs2dcoKnfGXnn_4uapiNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfA_Cs2dcoKnfGXnn_4uapiNtB6_13ethtool_flashNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel3str16CStrConvertErrorECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel5error5ErrorECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeRjECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VechEINtB2_6VecExthE4pushCsgxAQYCfdR72_25doctests_kernel_generated+0x177: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE17extend_from_sliceCsgxAQYCfdR72_25doctests_kernel_generated+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE4pushCsgxAQYCfdR72_25doctests_kernel_generated+0x5d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE7reserveCsgxAQYCfdR72_25doctests_kernel_generated+0x150: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRINtNtB7_6option6OptionjENtB5_5Debug3fmtCsgxAQYCfdR72_25doctests_kernel_generated+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRTmENtB5_5Debug3fmtCsgxAQYCfdR72_25doctests_kernel_generated+0x48: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_0+0x3fa: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_1+0x2a4: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_2+0x2e4: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_3+0x288: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_build_assert_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_build_assert_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_1+0xf5: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_3+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_4+0x110: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_6+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_7+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_8+0x70: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_9+0x3f: missing int3 after ret


objdump-func vmlinux.o _RNvXs4Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default:
0000 00000000000c0e40 <_RNvXs4Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default>:
0000    c0e40:	53                   	push   %rbx
0001    c0e41:	ba 00 06 00 00       	mov    $0x600,%edx
0006    c0e46:	31 f6                	xor    %esi,%esi
0008    c0e48:	48 89 fb             	mov    %rdi,%rbx
000b    c0e4b:	e8 00 00 00 00       	call   c0e50 <_RNvXs4Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x10>	c0e4c: R_X86_64_PLT32	memset-0x4
0010    c0e50:	48 89 d8             	mov    %rbx,%rax
0013    c0e53:	5b                   	pop    %rbx
0014    c0e54:	c3                   	ret
0015    c0e55:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
001f    c0e5f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
