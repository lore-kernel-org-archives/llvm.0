Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B01EB498;
	Thu,  1 Aug 2024 00:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722472874; cv=none; b=mkwE1Tv1mSCt8rvgYLaI6M/6SkSndiV9LbkrIFQIn0qcPC7F8GqmS+1OLZUToIr8SxCryKdO/Zx4H96P8TPXsTP4EdoX8hjkKAkhNvKeNdUgsRWc5Q7IcCsJximyfcVvjZs4zjSshdjxvlfWy1VgnuUe61g645EXFilpt8n52dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722472874; c=relaxed/simple;
	bh=+66CScwK3sAezj4yfy6YaVrMBqzS2ajJurRE7qGGVu0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qA+QgBKPRS/+wW1p+2dqcG1U0SmQWNJd6CTlX2lELOGS3cu21cQyCqWClJ8K0ObG7ep4ZvS7bHdGFF4JE7EPCTuES2OPb7kAAHYjSMzGO1gCuMqekwQDmBC+CKP+RvM+EMm7Bz+oxzOLQyOERJ7NmTSpMSifCVef4YbYQXbzvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nff6b3dz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nff6b3dz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722472872; x=1754008872;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+66CScwK3sAezj4yfy6YaVrMBqzS2ajJurRE7qGGVu0=;
  b=Nff6b3dz1wkA7X6tINW+h1rX8kcp6FhjTAP5TKuux6KOUS/c3q4EL+Bc
   pd+41lSgMi5rPZ4JjJHE0Tl/2CR/g4MN7/094O+ugAzVwvjenubvrlLzy
   wYtvkwZgYKhWCV+sbb7CIwZXHi8sCJlFNdL9OfZqgEBzYGDbOhFniLZ3+
   8rWqaWB42kkEzWHcXemZxorr+iIbdDcMULnUqvUnN8Z8Rz1Xfdy9eyh3Y
   iwu468lH3Y28nwwSUdA+5+/riQQ/fAX+dD8wwciq6yFI+alnimhByzNmw
   QB2pjAQHEDIT0Mx+Eb//797Gqkcvl1n8B9dyGLQFeb2hrq9fW4etaVw+Z
   g==;
X-CSE-ConnectionGUID: uEueU1hFTvW8bk8K2nrlHQ==
X-CSE-MsgGUID: 91aFb+7XStCyP03ykbkRFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20236880"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20236880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 17:41:11 -0700
X-CSE-ConnectionGUID: uV2WzijWR2W/Z3mC/hitiA==
X-CSE-MsgGUID: 63KUS0BCS2u9oOwI91oWIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="54520679"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jul 2024 17:41:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZJsR-000v2m-14;
	Thu, 01 Aug 2024 00:41:07 +0000
Date: Thu, 1 Aug 2024 08:40:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [paulmckrcu:dev.2024.07.26a 39/45] vmlinux.o: warning: objtool:
 _RNvXs42_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11srcu_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14:
 missing int3 after ret
Message-ID: <202408010802.MLptK0kd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev.2024.07.26a
head:   5cd816c95ea8338d603cdbe75549cf2e406aa70c
commit: 8b0e047e6168102bbba695ce999e4c2b15809ddb [39/45] srcu: Enable Tiny SRCU On all CONFIG_SMP=n kernels
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240801/202408010802.MLptK0kd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010802.MLptK0kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010802.MLptK0kd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs16_NtNtCs5QSdWC790r4_4core3fmt3numnNtB8_6Binary3fmt+0x9c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs17_NtNtCs5QSdWC790r4_4core3fmt3numnNtB8_5Octal3fmt+0x9d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs18_NtNtCs5QSdWC790r4_4core3fmt3numnNtB8_8LowerHex3fmt+0xb2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs19_NtNtCs5QSdWC790r4_4core3fmt3numnNtB8_8UpperHex3fmt+0xb2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1k_NtNtCs5QSdWC790r4_4core3fmt3numhNtB8_5Debug3fmt+0xf1: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1m_NtNtCs5QSdWC790r4_4core3fmt3nummNtB8_5Debug3fmt+0xf2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1p_NtNtCs5QSdWC790r4_4core3fmt3numjNtB8_5Debug3fmt+0xf5: missing int3 after ret
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
>> vmlinux.o: warning: objtool: _RNvXs42_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11srcu_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs46_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_22blocking_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs48_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18srcu_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs49_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_25arch_uprobe__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs4h_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12mm_context_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs4q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4pageNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs4A_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs4X_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13lru_gen_folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs4Z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15lru_gen_mm_walkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs50_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13lru_gen_memcgNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs51_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6lruvecNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs52_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13per_cpu_pagesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs53_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16per_cpu_nodestatNtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs54_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4zoneNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs58_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11pglist_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs5q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10rhashtableNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs5F_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_53___kernel_sockaddr_storage__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs5I_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_22sockaddr__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs5J_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8sockaddrNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs66_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6dentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
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
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device20is_autoneg_completed+0xa: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device9set_speed+0x6: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device10set_duplex+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device4read+0xa7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device5write+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device10read_paged+0x98: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device17genphy_soft_reset+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device7init_hw+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device10start_aneg+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device13genphy_resume+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device14genphy_suspend+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device18genphy_read_status+0x92: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device18genphy_update_link+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device15genphy_read_lpa+0x13: missing int3 after ret


objdump-func vmlinux.o _RNvXs42_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11srcu_structNtNtCs5QSdWC790r4_4core7default7Default7default:
0000 00000000000c0d30 <_RNvXs42_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11srcu_structNtNtCs5QSdWC790r4_4core7default7Default7default>:
0000    c0d30:	53                   	push   %rbx
0001    c0d31:	ba e8 00 00 00       	mov    $0xe8,%edx
0006    c0d36:	31 f6                	xor    %esi,%esi
0008    c0d38:	48 89 fb             	mov    %rdi,%rbx
000b    c0d3b:	e8 00 00 00 00       	call   c0d40 <_RNvXs42_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11srcu_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x10>	c0d3c: R_X86_64_PLT32	memset-0x4
0010    c0d40:	48 89 d8             	mov    %rbx,%rax
0013    c0d43:	5b                   	pop    %rbx
0014    c0d44:	c3                   	ret
0015    c0d45:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
001f    c0d4f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
