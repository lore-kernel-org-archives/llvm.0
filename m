Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202311D27A8;
	Thu,  1 Aug 2024 00:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722472232; cv=none; b=RyEMW+K6WALJ+bkUNfj4NYWZHxI3UKtKum89AlmeWvJTy7g0y1LnG8kyhkkvOrm+TG0uD/mvsoFGZjlwZGfnJdmvNgU4zeWy0hpPEDyRyYW4keB2xKwi6uZmAM8hLMjVlMwtEhdS824QWZrYeXq5kk3bKu7GVDAvvWEMjwiuWEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722472232; c=relaxed/simple;
	bh=ksYTx4mXRPEzTlZTZnEpge0pmomjRbTPnpDEE0nuRW0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNXyqt3cBvC/Eq5w99xPNvBBCGatwJy5rLpbe8MQDLrPmJnOwIIwrsuU80jhS8WA24gEivRSvTuygZsCM9dSY5a99vSCgiARPmUijz+HYm1wLImb1dyAphpLCeQVqKqlV2xyxDnRHPnlfGHTxUxGqEksyqGtHqeWwBnyKegCSPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvyWMl+G; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvyWMl+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722472228; x=1754008228;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ksYTx4mXRPEzTlZTZnEpge0pmomjRbTPnpDEE0nuRW0=;
  b=LvyWMl+GeMLIEGsvXkV9sFsqwp+DnH9pEWRbUhNTEbivJ43D4GgIZDfB
   YcoB671gCOgxvnr4eHVEdksGY6VvP6t8ELwKHAG+XyXiM7NONQWmm7cjX
   AAadGLIOWWoFBrZC4SQ/I6fIgIPhObBHQQx/p2482TvqSFIC0Hb5tUPFX
   XzOOXcdDexdH92pLmStwM9ffF+IEb+N2h126zfZcs7Xw0U4z+3ivT2MDs
   +CENKsjLQeYRtgnPl8KnPHUhjnpLT/zFwvW1nqS+/cilgCD9sDHpIR+ov
   pKFguWvC00gkEyk8AvjoCzPbSP0OcAMKz3YbehvmOkFrCnTbqNsvOc2Lb
   Q==;
X-CSE-ConnectionGUID: VEa/CpFcRzy7DpeW9ibBmQ==
X-CSE-MsgGUID: XDTZ+FakR1qjUF9kxOEa5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37905232"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="37905232"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 17:30:11 -0700
X-CSE-ConnectionGUID: naNGz09WQxGxIiT/ZMQQVQ==
X-CSE-MsgGUID: o29OHibbTk62b3a4Mg+hIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="59903125"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2024 17:30:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZJhm-000v1i-2K;
	Thu, 01 Aug 2024 00:30:06 +0000
Date: Thu, 1 Aug 2024 08:30:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [rust:rust-dev 7/16] vmlinux.o: warning: objtool:
 rust_doctest_kernel_rbtree_rs_3+0x1f9: missing int3 after ret
Message-ID: <202408010812.q1gXHSfe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Miguel Ojeda <ojeda@kernel.org>
TO: Matt Gilbride <mattgilbride@google.com>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Alice Ryhl <aliceryhl@google.com>

tree:   https://github.com/Rust-for-Linux/linux rust-dev
head:   6dc5ff2a9a87b5f6e3b8ab11ee4835d7d82fc01e
commit: b1bcae7da69be6737a17efd3b734789c6984c51d [7/16] rust: rbtree: add `RBTreeCursor`
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240801/202408010812.q1gXHSfe-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010812.q1gXHSfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010812.q1gXHSfe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs7V_Cs2dcoKnfGXnn_4uapiNtB6_29compat_sigevent__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x39: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7W_Cs2dcoKnfGXnn_4uapiNtB6_15compat_sigeventNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Z_Cs2dcoKnfGXnn_4uapiNtB6_12compat_ifreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs89_Cs2dcoKnfGXnn_4uapiNtB6_19kernfs_global_locksNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8e_Cs2dcoKnfGXnn_4uapiNtB6_11kernfs_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8f_Cs2dcoKnfGXnn_4uapiNtB6_16kernfs_open_fileNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8q_Cs2dcoKnfGXnn_4uapiNtB6_15kobj_uevent_envNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8P_Cs2dcoKnfGXnn_4uapiNtB6_16user_i387_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8Q_Cs2dcoKnfGXnn_4uapiNtB6_4userNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8R_Cs2dcoKnfGXnn_4uapiNtB6_14user_ymmh_regsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8T_Cs2dcoKnfGXnn_4uapiNtB6_15user_xstateregsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9v_Cs2dcoKnfGXnn_4uapiNtB6_11device_linkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9K_Cs2dcoKnfGXnn_4uapiNtB6_12sockaddr_in6NtNtCs5QSdWC790r4_4core7default7Default7default+0x21: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9L_Cs2dcoKnfGXnn_4uapiNtB6_9ipv6_mreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x19: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9N_Cs2dcoKnfGXnn_4uapiNtB6_32tc_fq_codel_xstats__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x29: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9O_Cs2dcoKnfGXnn_4uapiNtB6_18tc_fq_codel_xstatsNtNtCs5QSdWC790r4_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9Q_Cs2dcoKnfGXnn_4uapiNtB6_37flow_dissector_key_vlan__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9T_Cs2dcoKnfGXnn_4uapiNtB6_27flow_dissector_key_enc_optsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaV_Cs2dcoKnfGXnn_4uapiNtB6_15sk_buff_fclonesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbN_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_tunnel_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscJ_Cs2dcoKnfGXnn_4uapiNtB6_13bpf_flow_keysNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscY_Cs2dcoKnfGXnn_4uapiNtB6_10sock_fprogNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsd6_Cs2dcoKnfGXnn_4uapiNtB6_4nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsd8_Cs2dcoKnfGXnn_4uapiNtB6_3cpuNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsd9_Cs2dcoKnfGXnn_4uapiNtB6_14text_poke_insnNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdv_Cs2dcoKnfGXnn_4uapiNtB6_9psi_groupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdx_Cs2dcoKnfGXnn_4uapiNtB6_19cgroup_subsys_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdA_Cs2dcoKnfGXnn_4uapiNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdB_Cs2dcoKnfGXnn_4uapiNtB6_11cgroup_rootNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdN_Cs2dcoKnfGXnn_4uapiNtB6_16backing_dev_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdO_Cs2dcoKnfGXnn_4uapiNtB6_12block_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdQ_Cs2dcoKnfGXnn_4uapiNtB6_17bio__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXse8_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXse9_Cs2dcoKnfGXnn_4uapiNtB6_17bpf_offloaded_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsek_Cs2dcoKnfGXnn_4uapiNtB6_8bpf_ksymNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsem_Cs2dcoKnfGXnn_4uapiNtB6_15bpf_tramp_imageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXser_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_dispatcherNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseA_Cs2dcoKnfGXnn_4uapiNtB6_12bpf_prog_auxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseN_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_struct_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsf3_Cs2dcoKnfGXnn_4uapiNtB6_31bpf_iter_aux_info__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfl_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfm_Cs2dcoKnfGXnn_4uapiNtB6_14compat_rtentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfn_Cs2dcoKnfGXnn_4uapiNtB6_16compat_group_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfq_Cs2dcoKnfGXnn_4uapiNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfs_Cs2dcoKnfGXnn_4uapiNtB6_19compat_group_filterNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsft_Cs2dcoKnfGXnn_4uapiNtB6_11scm_fp_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfH_Cs2dcoKnfGXnn_4uapiNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfK_Cs2dcoKnfGXnn_4uapiNtB6_13ethtool_flashNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel3str16CStrConvertErrorECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel5error5ErrorECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeRjECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0x10b: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE6removeCsgxAQYCfdR72_25doctests_kernel_generated+0x92: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VechEINtB2_6VecExthE4pushCsgxAQYCfdR72_25doctests_kernel_generated+0x177: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE17extend_from_sliceCsgxAQYCfdR72_25doctests_kernel_generated+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE4pushCsgxAQYCfdR72_25doctests_kernel_generated+0x5d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE7reserveCsgxAQYCfdR72_25doctests_kernel_generated+0x150: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRINtNtB7_6option6OptionjENtB5_5Debug3fmtCsgxAQYCfdR72_25doctests_kernel_generated+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRTmENtB5_5Debug3fmtCsgxAQYCfdR72_25doctests_kernel_generated+0x48: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_box_ext_rs_0+0x14d: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_0+0x3fa: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_1+0x2a4: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_2+0x2e4: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_3+0x288: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_build_assert_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_build_assert_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_firmware_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_1+0xf5: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_3+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_4+0x110: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_6+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_7+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_8+0x70: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_9+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_10+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_11+0x94: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_12+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_13+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_14+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_15+0xb0: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_16+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_init_rs_17+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_lib_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_net_phy_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_page_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_page_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_prelude_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_0+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_1+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_2+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_3+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_4+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_5+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_6+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_7+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_print_rs_8+0xbf: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_1+0x214: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_2+0xb6c: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_3+0x1f9: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_4+0x1f9: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_5+0x17c: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_6+0x269: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_7+0x1f9: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_8+0x214: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_9+0x1fc: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_static_assert_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_0+0x2a7: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_1+0x399: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_2+0x1f0: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_3+0xfb: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_std_vendor_rs_4+0xfa: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x224: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_1+0x182: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_3+0x3dd: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_4+0x3f8: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_5+0x3e3: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_6+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_7+0x3ed: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_str_rs_8+0x4d0: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_0+0x17d: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_1+0x243: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_2+0x2a7: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_3+0x1a3: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_4+0x18b: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_5+0x37a: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_6+0xa1: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_7+0x99: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_8+0xa1: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_arc_rs_9+0x18b: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_condvar_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_mutex_rs_0+0x47f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_mutex_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_spinlock_rs_0+0x470: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_lock_spinlock_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_sync_locked_by_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_task_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_0+0x11d: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_1+0xd3: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_types_rs_2+0x219: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated30rust_doctest_kernel_types_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_types_rs_199_08example3+0x1aa: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_uaccess_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_uaccess_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_04main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_35_0NtB4_8MyStructNtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItem3run+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_3+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_76_0NtB4_8MyStructINtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItemKy1_E3run+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs0_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_76_0NtB5_8MyStructINtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItemKy2_E3run+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4_NvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1251_01__NtB7_3FooNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_34main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1251_0NtB2_3FooNtNtCs1cdwasc6FUb_6kernel4init10PinnedDrop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNtNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated32rust_doctest_kernel_net_phy_rs_04main63__doctest_main__kbuild_src_consumer_rust_kernel_net_phy_rs_769_024module_phy_driver_sample1__NtB4_6ModuleNtCs1cdwasc6FUb_6kernel6Module4init+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_sample_phy_init+0x66: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeINtNtB4_6option6OptionNtCsxvZyEly3ot_12rust_minimal11RustMinimalEEB14_+0xe7: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeRlECsxvZyEly3ot_12rust_minimal+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE4pushCsxvZyEly3ot_12rust_minimal+0x1c1: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsi_NtCscg2doA4GLaz_5alloc3vecINtB5_3VeclENtNtCs5QSdWC790r4_4core3fmt5Debug3fmtCsxvZyEly3ot_12rust_minimal+0x75: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCsxvZyEly3ot_12rust_minimalNtB2_11RustMinimalNtCs1cdwasc6FUb_6kernel6Module4init+0x142: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_CsxvZyEly3ot_12rust_minimalNtB4_11RustMinimalNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0xab: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_minimal_init+0x24: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCsiTgB7yZxXFm_10rust_printNtB2_9RustPrintNtCs1cdwasc6FUb_6kernel6Module4init+0xa51: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_CsiTgB7yZxXFm_10rust_printNtB4_9RustPrintNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_print_init+0x18: missing int3 after ret


objdump-func vmlinux.o rust_doctest_kernel_rbtree_rs_3:
0000 000000000008df00 <rust_doctest_kernel_rbtree_rs_3>:
0000    8df00:	41 56                	push   %r14
0002    8df02:	53                   	push   %rbx
0003    8df03:	48 83 ec 58          	sub    $0x58,%rsp
0007    8df07:	48 89 e7             	mov    %rsp,%rdi
000a    8df0a:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8df0e: R_X86_64_32S	.rodata+0x10958
0012    8df12:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
001b    8df1b:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0024    8df24:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	8df29: R_X86_64_32S	.rodata+0xec58
002d    8df2d:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
0036    8df36:	e8 00 00 00 00       	call   8df3b <rust_doctest_kernel_rbtree_rs_3+0x3b>	8df37: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit4info-0x4
003b    8df3b:	e8 00 00 00 00       	call   8df40 <rust_doctest_kernel_rbtree_rs_3+0x40>	8df3c: R_X86_64_PLT32	_RNvXs2q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7rb_rootNtNtCs5QSdWC790r4_4core7default7Default7default-0x4
0040    8df40:	48 89 e7             	mov    %rsp,%rdi
0043    8df43:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
0048    8df48:	ba 0a 00 00 00       	mov    $0xa,%edx
004d    8df4d:	b9 64 00 00 00       	mov    $0x64,%ecx
0052    8df52:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
0057    8df57:	e8 84 a7 ff ff       	call   886e0 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated>
005c    8df5c:	83 3c 24 00          	cmpl   $0x0,(%rsp)
0060    8df60:	75 70                	jne    8dfd2 <rust_doctest_kernel_rbtree_rs_3+0xd2>
0062    8df62:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0067    8df67:	48 85 ff             	test   %rdi,%rdi
006a    8df6a:	74 0f                	je     8df7b <rust_doctest_kernel_rbtree_rs_3+0x7b>
006c    8df6c:	be 20 00 00 00       	mov    $0x20,%esi
0071    8df71:	ba 08 00 00 00       	mov    $0x8,%edx
0076    8df76:	e8 00 00 00 00       	call   8df7b <rust_doctest_kernel_rbtree_rs_3+0x7b>	8df77: R_X86_64_PLT32	__rust_dealloc-0x4
007b    8df7b:	48 89 e7             	mov    %rsp,%rdi
007e    8df7e:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
0083    8df83:	ba 14 00 00 00       	mov    $0x14,%edx
0088    8df88:	b9 c8 00 00 00       	mov    $0xc8,%ecx
008d    8df8d:	e8 4e a7 ff ff       	call   886e0 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated>
0092    8df92:	83 3c 24 00          	cmpl   $0x0,(%rsp)
0096    8df96:	75 3a                	jne    8dfd2 <rust_doctest_kernel_rbtree_rs_3+0xd2>
0098    8df98:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
009d    8df9d:	48 85 ff             	test   %rdi,%rdi
00a0    8dfa0:	74 0f                	je     8dfb1 <rust_doctest_kernel_rbtree_rs_3+0xb1>
00a2    8dfa2:	be 20 00 00 00       	mov    $0x20,%esi
00a7    8dfa7:	ba 08 00 00 00       	mov    $0x8,%edx
00ac    8dfac:	e8 00 00 00 00       	call   8dfb1 <rust_doctest_kernel_rbtree_rs_3+0xb1>	8dfad: R_X86_64_PLT32	__rust_dealloc-0x4
00b1    8dfb1:	48 89 e7             	mov    %rsp,%rdi
00b4    8dfb4:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
00b9    8dfb9:	ba 1e 00 00 00       	mov    $0x1e,%edx
00be    8dfbe:	b9 2c 01 00 00       	mov    $0x12c,%ecx
00c3    8dfc3:	e8 18 a7 ff ff       	call   886e0 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated>
00c8    8dfc8:	83 3c 24 00          	cmpl   $0x0,(%rsp)
00cc    8dfcc:	0f 84 28 01 00 00    	je     8e0fa <rust_doctest_kernel_rbtree_rs_3+0x1fa>
00d2    8dfd2:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
00d7    8dfd7:	e8 00 00 00 00       	call   8dfdc <rust_doctest_kernel_rbtree_rs_3+0xdc>	8dfd8: R_X86_64_PLT32	rb_first_postorder-0x4
00dc    8dfdc:	48 85 c0             	test   %rax,%rax
00df    8dfdf:	74 34                	je     8e015 <rust_doctest_kernel_rbtree_rs_3+0x115>
00e1    8dfe1:	48 89 c3             	mov    %rax,%rbx
00e4    8dfe4:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
00ee    8dfee:	66 90                	xchg   %ax,%ax
00f0    8dff0:	48 89 df             	mov    %rbx,%rdi
00f3    8dff3:	e8 00 00 00 00       	call   8dff8 <rust_doctest_kernel_rbtree_rs_3+0xf8>	8dff4: R_X86_64_PLT32	rb_next_postorder-0x4
00f8    8dff8:	be 20 00 00 00       	mov    $0x20,%esi
00fd    8dffd:	ba 08 00 00 00       	mov    $0x8,%edx
0102    8e002:	48 89 df             	mov    %rbx,%rdi
0105    8e005:	49 89 c6             	mov    %rax,%r14
0108    8e008:	e8 00 00 00 00       	call   8e00d <rust_doctest_kernel_rbtree_rs_3+0x10d>	8e009: R_X86_64_PLT32	__rust_dealloc-0x4
010d    8e00d:	4d 85 f6             	test   %r14,%r14
0110    8e010:	4c 89 f3             	mov    %r14,%rbx
0113    8e013:	75 db                	jne    8dff0 <rust_doctest_kernel_rbtree_rs_3+0xf0>
0115    8e015:	e8 00 00 00 00       	call   8e01a <rust_doctest_kernel_rbtree_rs_3+0x11a>	8e016: R_X86_64_PLT32	rust_helper_kunit_get_current_test-0x4
011a    8e01a:	48 85 c0             	test   %rax,%rax
011d    8e01d:	0f 85 27 07 00 00    	jne    8e74a <rust_doctest_kernel_rbtree_rs_3+0x84a>
0123    8e023:	48 89 e7             	mov    %rsp,%rdi
0126    8e026:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
012b    8e02b:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e030: R_X86_64_32S	.rodata+0x14128
0134    8e034:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e039: R_X86_64_32S	.text+0x890a0
013d    8e03d:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	8e042: R_X86_64_32S	.rodata+0x14138
0146    8e046:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e04a: R_X86_64_32S	.rodata+0x109a8
014e    8e04e:	48 c7 44 24 08 03 00 00 00 	movq   $0x3,0x8(%rsp)
0157    8e057:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0160    8e060:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	8e065: R_X86_64_32S	_RNvXs2_NtNtNtCs5QSdWC790r4_4core3fmt3num3implNtB9_7Display3fmt
0169    8e069:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
016e    8e06e:	48 c7 44 24 18 02 00 00 00 	movq   $0x2,0x18(%rsp)
0177    8e077:	e8 00 00 00 00       	call   8e07c <rust_doctest_kernel_rbtree_rs_3+0x17c>	8e078: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
017c    8e07c:	48 89 e7             	mov    %rsp,%rdi
017f    8e07f:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e084: R_X86_64_32S	.rodata+0x14140
0188    8e088:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e08c: R_X86_64_32S	.rodata+0xf2c0
0190    8e090:	48 c7 44 24 08 02 00 00 00 	movq   $0x2,0x8(%rsp)
0199    8e099:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
01a2    8e0a2:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
01a7    8e0a7:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e0ac: R_X86_64_32S	.text+0x890a0
01b0    8e0b0:	48 c7 44 24 18 01 00 00 00 	movq   $0x1,0x18(%rsp)
01b9    8e0b9:	e8 00 00 00 00       	call   8e0be <rust_doctest_kernel_rbtree_rs_3+0x1be>	8e0ba: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
01be    8e0be:	48 89 e7             	mov    %rsp,%rdi
01c1    8e0c1:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e0c5: R_X86_64_32S	.rodata+0xf328
01c9    8e0c9:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
01d2    8e0d2:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
01db    8e0db:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	8e0e0: R_X86_64_32S	.rodata+0xec58
01e4    8e0e4:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
01ed    8e0ed:	e8 00 00 00 00       	call   8e0f2 <rust_doctest_kernel_rbtree_rs_3+0x1f2>	8e0ee: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
01f2    8e0f2:	48 83 c4 58          	add    $0x58,%rsp
01f6    8e0f6:	5b                   	pop    %rbx
01f7    8e0f7:	41 5e                	pop    %r14
01f9    8e0f9:	c3                   	ret
01fa    8e0fa:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
01ff    8e0ff:	48 85 ff             	test   %rdi,%rdi
0202    8e102:	74 0f                	je     8e113 <rust_doctest_kernel_rbtree_rs_3+0x213>
0204    8e104:	be 20 00 00 00       	mov    $0x20,%esi
0209    8e109:	ba 08 00 00 00       	mov    $0x8,%edx
020e    8e10e:	e8 00 00 00 00       	call   8e113 <rust_doctest_kernel_rbtree_rs_3+0x213>	8e10f: R_X86_64_PLT32	__rust_dealloc-0x4
0213    8e113:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
0218    8e118:	e8 00 00 00 00       	call   8e11d <rust_doctest_kernel_rbtree_rs_3+0x21d>	8e119: R_X86_64_PLT32	rb_first-0x4
021d    8e11d:	48 85 c0             	test   %rax,%rax
0220    8e120:	0f 84 53 06 00 00    	je     8e779 <rust_doctest_kernel_rbtree_rs_3+0x879>
0226    8e126:	83 78 18 0a          	cmpl   $0xa,0x18(%rax)
022a    8e12a:	48 89 c3             	mov    %rax,%rbx
022d    8e12d:	75 0a                	jne    8e139 <rust_doctest_kernel_rbtree_rs_3+0x239>
022f    8e12f:	83 7b 1c 64          	cmpl   $0x64,0x1c(%rbx)
0233    8e133:	0f 84 dd 00 00 00    	je     8e216 <rust_doctest_kernel_rbtree_rs_3+0x316>
0239    8e139:	e8 00 00 00 00       	call   8e13e <rust_doctest_kernel_rbtree_rs_3+0x23e>	8e13a: R_X86_64_PLT32	rust_helper_kunit_get_current_test-0x4
023e    8e13e:	48 85 c0             	test   %rax,%rax
0241    8e141:	0f 85 62 06 00 00    	jne    8e7a9 <rust_doctest_kernel_rbtree_rs_3+0x8a9>
0247    8e147:	48 89 e7             	mov    %rsp,%rdi
024a    8e14a:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
024f    8e14f:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e154: R_X86_64_32S	.rodata+0x13f10
0258    8e158:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e15d: R_X86_64_32S	.text+0x890a0
0261    8e161:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	8e166: R_X86_64_32S	.rodata+0x13f20
026a    8e16a:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e16e: R_X86_64_32S	.rodata+0x109a8
0272    8e172:	48 c7 44 24 08 03 00 00 00 	movq   $0x3,0x8(%rsp)
027b    8e17b:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0284    8e184:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	8e189: R_X86_64_32S	_RNvXs2_NtNtNtCs5QSdWC790r4_4core3fmt3num3implNtB9_7Display3fmt
028d    8e18d:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
0292    8e192:	48 c7 44 24 18 02 00 00 00 	movq   $0x2,0x18(%rsp)
029b    8e19b:	e8 00 00 00 00       	call   8e1a0 <rust_doctest_kernel_rbtree_rs_3+0x2a0>	8e19c: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
02a0    8e1a0:	48 89 e7             	mov    %rsp,%rdi
02a3    8e1a3:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e1a8: R_X86_64_32S	.rodata+0x13f40
02ac    8e1ac:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e1b0: R_X86_64_32S	.rodata+0xf2c0
02b4    8e1b4:	48 c7 44 24 08 02 00 00 00 	movq   $0x2,0x8(%rsp)
02bd    8e1bd:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
02c6    8e1c6:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
02cb    8e1cb:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e1d0: R_X86_64_32S	.text+0x890a0
02d4    8e1d4:	48 c7 44 24 18 01 00 00 00 	movq   $0x1,0x18(%rsp)
02dd    8e1dd:	e8 00 00 00 00       	call   8e1e2 <rust_doctest_kernel_rbtree_rs_3+0x2e2>	8e1de: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
02e2    8e1e2:	48 89 e7             	mov    %rsp,%rdi
02e5    8e1e5:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e1e9: R_X86_64_32S	.rodata+0xf328
02ed    8e1ed:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
02f6    8e1f6:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
02ff    8e1ff:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	8e204: R_X86_64_32S	.rodata+0xec58
0308    8e208:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
0311    8e211:	e8 00 00 00 00       	call   8e216 <rust_doctest_kernel_rbtree_rs_3+0x316>	8e212: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
0316    8e216:	48 89 df             	mov    %rbx,%rdi
0319    8e219:	e8 00 00 00 00       	call   8e21e <rust_doctest_kernel_rbtree_rs_3+0x31e>	8e21a: R_X86_64_PLT32	rb_next-0x4
031e    8e21e:	48 85 c0             	test   %rax,%rax
0321    8e221:	0f 84 5e 05 00 00    	je     8e785 <rust_doctest_kernel_rbtree_rs_3+0x885>
0327    8e227:	83 78 18 14          	cmpl   $0x14,0x18(%rax)
032b    8e22b:	48 89 c3             	mov    %rax,%rbx
032e    8e22e:	75 0d                	jne    8e23d <rust_doctest_kernel_rbtree_rs_3+0x33d>
0330    8e230:	81 7b 1c c8 00 00 00 	cmpl   $0xc8,0x1c(%rbx)
0337    8e237:	0f 84 dd 00 00 00    	je     8e31a <rust_doctest_kernel_rbtree_rs_3+0x41a>
033d    8e23d:	e8 00 00 00 00       	call   8e242 <rust_doctest_kernel_rbtree_rs_3+0x342>	8e23e: R_X86_64_PLT32	rust_helper_kunit_get_current_test-0x4
0342    8e242:	48 85 c0             	test   %rax,%rax
0345    8e245:	0f 85 73 05 00 00    	jne    8e7be <rust_doctest_kernel_rbtree_rs_3+0x8be>
034b    8e24b:	48 89 e7             	mov    %rsp,%rdi
034e    8e24e:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
0353    8e253:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e258: R_X86_64_32S	.rodata+0x13f70
035c    8e25c:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e261: R_X86_64_32S	.text+0x890a0
0365    8e265:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	8e26a: R_X86_64_32S	.rodata+0x13f80
036e    8e26e:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e272: R_X86_64_32S	.rodata+0x109a8
0376    8e276:	48 c7 44 24 08 03 00 00 00 	movq   $0x3,0x8(%rsp)
037f    8e27f:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0388    8e288:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	8e28d: R_X86_64_32S	_RNvXs2_NtNtNtCs5QSdWC790r4_4core3fmt3num3implNtB9_7Display3fmt
0391    8e291:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
0396    8e296:	48 c7 44 24 18 02 00 00 00 	movq   $0x2,0x18(%rsp)
039f    8e29f:	e8 00 00 00 00       	call   8e2a4 <rust_doctest_kernel_rbtree_rs_3+0x3a4>	8e2a0: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
03a4    8e2a4:	48 89 e7             	mov    %rsp,%rdi
03a7    8e2a7:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e2ac: R_X86_64_32S	.rodata+0x13fa0
03b0    8e2b0:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e2b4: R_X86_64_32S	.rodata+0xf2c0
03b8    8e2b8:	48 c7 44 24 08 02 00 00 00 	movq   $0x2,0x8(%rsp)
03c1    8e2c1:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
03ca    8e2ca:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
03cf    8e2cf:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e2d4: R_X86_64_32S	.text+0x890a0
03d8    8e2d8:	48 c7 44 24 18 01 00 00 00 	movq   $0x1,0x18(%rsp)
03e1    8e2e1:	e8 00 00 00 00       	call   8e2e6 <rust_doctest_kernel_rbtree_rs_3+0x3e6>	8e2e2: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
03e6    8e2e6:	48 89 e7             	mov    %rsp,%rdi
03e9    8e2e9:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e2ed: R_X86_64_32S	.rodata+0xf328
03f1    8e2f1:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
03fa    8e2fa:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0403    8e303:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	8e308: R_X86_64_32S	.rodata+0xec58
040c    8e30c:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
0415    8e315:	e8 00 00 00 00       	call   8e31a <rust_doctest_kernel_rbtree_rs_3+0x41a>	8e316: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
041a    8e31a:	48 89 df             	mov    %rbx,%rdi
041d    8e31d:	e8 00 00 00 00       	call   8e322 <rust_doctest_kernel_rbtree_rs_3+0x422>	8e31e: R_X86_64_PLT32	rb_next-0x4
0422    8e322:	48 85 c0             	test   %rax,%rax
0425    8e325:	0f 84 66 04 00 00    	je     8e791 <rust_doctest_kernel_rbtree_rs_3+0x891>
042b    8e32b:	83 78 18 1e          	cmpl   $0x1e,0x18(%rax)
042f    8e32f:	75 0d                	jne    8e33e <rust_doctest_kernel_rbtree_rs_3+0x43e>
0431    8e331:	81 78 1c 2c 01 00 00 	cmpl   $0x12c,0x1c(%rax)
0438    8e338:	0f 84 dd 00 00 00    	je     8e41b <rust_doctest_kernel_rbtree_rs_3+0x51b>
043e    8e33e:	e8 00 00 00 00       	call   8e343 <rust_doctest_kernel_rbtree_rs_3+0x443>	8e33f: R_X86_64_PLT32	rust_helper_kunit_get_current_test-0x4
0443    8e343:	48 85 c0             	test   %rax,%rax
0446    8e346:	0f 85 87 04 00 00    	jne    8e7d3 <rust_doctest_kernel_rbtree_rs_3+0x8d3>
044c    8e34c:	48 89 e7             	mov    %rsp,%rdi
044f    8e34f:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
0454    8e354:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e359: R_X86_64_32S	.rodata+0x13fd0
045d    8e35d:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e362: R_X86_64_32S	.text+0x890a0
0466    8e366:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	8e36b: R_X86_64_32S	.rodata+0x13fe0
046f    8e36f:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e373: R_X86_64_32S	.rodata+0x109a8
0477    8e377:	48 c7 44 24 08 03 00 00 00 	movq   $0x3,0x8(%rsp)
0480    8e380:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0489    8e389:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	8e38e: R_X86_64_32S	_RNvXs2_NtNtNtCs5QSdWC790r4_4core3fmt3num3implNtB9_7Display3fmt
0492    8e392:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
0497    8e397:	48 c7 44 24 18 02 00 00 00 	movq   $0x2,0x18(%rsp)
04a0    8e3a0:	e8 00 00 00 00       	call   8e3a5 <rust_doctest_kernel_rbtree_rs_3+0x4a5>	8e3a1: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
04a5    8e3a5:	48 89 e7             	mov    %rsp,%rdi
04a8    8e3a8:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e3ad: R_X86_64_32S	.rodata+0x13ff8
04b1    8e3b1:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e3b5: R_X86_64_32S	.rodata+0xf2c0
04b9    8e3b9:	48 c7 44 24 08 02 00 00 00 	movq   $0x2,0x8(%rsp)
04c2    8e3c2:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
04cb    8e3cb:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
04d0    8e3d0:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e3d5: R_X86_64_32S	.text+0x890a0
04d9    8e3d9:	48 c7 44 24 18 01 00 00 00 	movq   $0x1,0x18(%rsp)
04e2    8e3e2:	e8 00 00 00 00       	call   8e3e7 <rust_doctest_kernel_rbtree_rs_3+0x4e7>	8e3e3: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
04e7    8e3e7:	48 89 e7             	mov    %rsp,%rdi
04ea    8e3ea:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e3ee: R_X86_64_32S	.rodata+0xf328
04f2    8e3f2:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
04fb    8e3fb:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0504    8e404:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	8e409: R_X86_64_32S	.rodata+0xec58
050d    8e40d:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
0516    8e416:	e8 00 00 00 00       	call   8e41b <rust_doctest_kernel_rbtree_rs_3+0x51b>	8e417: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
051b    8e41b:	83 7b 18 14          	cmpl   $0x14,0x18(%rbx)
051f    8e41f:	75 0d                	jne    8e42e <rust_doctest_kernel_rbtree_rs_3+0x52e>
0521    8e421:	81 7b 1c c8 00 00 00 	cmpl   $0xc8,0x1c(%rbx)
0528    8e428:	0f 84 dd 00 00 00    	je     8e50b <rust_doctest_kernel_rbtree_rs_3+0x60b>
052e    8e42e:	e8 00 00 00 00       	call   8e433 <rust_doctest_kernel_rbtree_rs_3+0x533>	8e42f: R_X86_64_PLT32	rust_helper_kunit_get_current_test-0x4
0533    8e433:	48 85 c0             	test   %rax,%rax
0536    8e436:	0f 85 af 03 00 00    	jne    8e7eb <rust_doctest_kernel_rbtree_rs_3+0x8eb>
053c    8e43c:	48 89 e7             	mov    %rsp,%rdi
053f    8e43f:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
0544    8e444:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e449: R_X86_64_32S	.rodata+0x14028
054d    8e44d:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e452: R_X86_64_32S	.text+0x890a0
0556    8e456:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	8e45b: R_X86_64_32S	.rodata+0x14038
055f    8e45f:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e463: R_X86_64_32S	.rodata+0x109a8
0567    8e467:	48 c7 44 24 08 03 00 00 00 	movq   $0x3,0x8(%rsp)
0570    8e470:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0579    8e479:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	8e47e: R_X86_64_32S	_RNvXs2_NtNtNtCs5QSdWC790r4_4core3fmt3num3implNtB9_7Display3fmt
0582    8e482:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
0587    8e487:	48 c7 44 24 18 02 00 00 00 	movq   $0x2,0x18(%rsp)
0590    8e490:	e8 00 00 00 00       	call   8e495 <rust_doctest_kernel_rbtree_rs_3+0x595>	8e491: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
0595    8e495:	48 89 e7             	mov    %rsp,%rdi
0598    8e498:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e49d: R_X86_64_32S	.rodata+0x14040
05a1    8e4a1:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e4a5: R_X86_64_32S	.rodata+0xf2c0
05a9    8e4a9:	48 c7 44 24 08 02 00 00 00 	movq   $0x2,0x8(%rsp)
05b2    8e4b2:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
05bb    8e4bb:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
05c0    8e4c0:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e4c5: R_X86_64_32S	.text+0x890a0
05c9    8e4c9:	48 c7 44 24 18 01 00 00 00 	movq   $0x1,0x18(%rsp)
05d2    8e4d2:	e8 00 00 00 00       	call   8e4d7 <rust_doctest_kernel_rbtree_rs_3+0x5d7>	8e4d3: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
05d7    8e4d7:	48 89 e7             	mov    %rsp,%rdi
05da    8e4da:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e4de: R_X86_64_32S	.rodata+0xf328
05e2    8e4e2:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
05eb    8e4eb:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
05f4    8e4f4:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	8e4f9: R_X86_64_32S	.rodata+0xec58
05fd    8e4fd:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
0606    8e506:	e8 00 00 00 00       	call   8e50b <rust_doctest_kernel_rbtree_rs_3+0x60b>	8e507: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
060b    8e50b:	48 89 df             	mov    %rbx,%rdi
060e    8e50e:	e8 00 00 00 00       	call   8e513 <rust_doctest_kernel_rbtree_rs_3+0x613>	8e50f: R_X86_64_PLT32	rb_next-0x4
0613    8e513:	48 85 c0             	test   %rax,%rax
0616    8e516:	0f 84 81 02 00 00    	je     8e79d <rust_doctest_kernel_rbtree_rs_3+0x89d>
061c    8e51c:	83 78 18 1e          	cmpl   $0x1e,0x18(%rax)
0620    8e520:	48 89 c3             	mov    %rax,%rbx
0623    8e523:	75 0d                	jne    8e532 <rust_doctest_kernel_rbtree_rs_3+0x632>
0625    8e525:	81 7b 1c 2c 01 00 00 	cmpl   $0x12c,0x1c(%rbx)
062c    8e52c:	0f 84 dd 00 00 00    	je     8e60f <rust_doctest_kernel_rbtree_rs_3+0x70f>
0632    8e532:	e8 00 00 00 00       	call   8e537 <rust_doctest_kernel_rbtree_rs_3+0x637>	8e533: R_X86_64_PLT32	rust_helper_kunit_get_current_test-0x4
0637    8e537:	48 85 c0             	test   %rax,%rax
063a    8e53a:	0f 85 c3 02 00 00    	jne    8e803 <rust_doctest_kernel_rbtree_rs_3+0x903>
0640    8e540:	48 89 e7             	mov    %rsp,%rdi
0643    8e543:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
0648    8e548:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e54d: R_X86_64_32S	.rodata+0x14070
0651    8e551:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e556: R_X86_64_32S	.text+0x890a0
065a    8e55a:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	8e55f: R_X86_64_32S	.rodata+0x14080
0663    8e563:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e567: R_X86_64_32S	.rodata+0x109a8
066b    8e56b:	48 c7 44 24 08 03 00 00 00 	movq   $0x3,0x8(%rsp)
0674    8e574:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
067d    8e57d:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	8e582: R_X86_64_32S	_RNvXs2_NtNtNtCs5QSdWC790r4_4core3fmt3num3implNtB9_7Display3fmt
0686    8e586:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
068b    8e58b:	48 c7 44 24 18 02 00 00 00 	movq   $0x2,0x18(%rsp)
0694    8e594:	e8 00 00 00 00       	call   8e599 <rust_doctest_kernel_rbtree_rs_3+0x699>	8e595: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
0699    8e599:	48 89 e7             	mov    %rsp,%rdi
069c    8e59c:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e5a1: R_X86_64_32S	.rodata+0x140a0
06a5    8e5a5:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e5a9: R_X86_64_32S	.rodata+0xf2c0
06ad    8e5ad:	48 c7 44 24 08 02 00 00 00 	movq   $0x2,0x8(%rsp)
06b6    8e5b6:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
06bf    8e5bf:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
06c4    8e5c4:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e5c9: R_X86_64_32S	.text+0x890a0
06cd    8e5cd:	48 c7 44 24 18 01 00 00 00 	movq   $0x1,0x18(%rsp)
06d6    8e5d6:	e8 00 00 00 00       	call   8e5db <rust_doctest_kernel_rbtree_rs_3+0x6db>	8e5d7: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
06db    8e5db:	48 89 e7             	mov    %rsp,%rdi
06de    8e5de:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e5e2: R_X86_64_32S	.rodata+0xf328
06e6    8e5e6:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
06ef    8e5ef:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
06f8    8e5f8:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	8e5fd: R_X86_64_32S	.rodata+0xec58
0701    8e601:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
070a    8e60a:	e8 00 00 00 00       	call   8e60f <rust_doctest_kernel_rbtree_rs_3+0x70f>	8e60b: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
070f    8e60f:	48 89 df             	mov    %rbx,%rdi
0712    8e612:	e8 00 00 00 00       	call   8e617 <rust_doctest_kernel_rbtree_rs_3+0x717>	8e613: R_X86_64_PLT32	rb_next-0x4
0717    8e617:	48 85 c0             	test   %rax,%rax
071a    8e61a:	0f 84 dd 00 00 00    	je     8e6fd <rust_doctest_kernel_rbtree_rs_3+0x7fd>
0720    8e620:	e8 00 00 00 00       	call   8e625 <rust_doctest_kernel_rbtree_rs_3+0x725>	8e621: R_X86_64_PLT32	rust_helper_kunit_get_current_test-0x4
0725    8e625:	48 85 c0             	test   %rax,%rax
0728    8e628:	0f 85 ed 01 00 00    	jne    8e81b <rust_doctest_kernel_rbtree_rs_3+0x91b>
072e    8e62e:	48 89 e7             	mov    %rsp,%rdi
0731    8e631:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
0736    8e636:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e63b: R_X86_64_32S	.rodata+0x140d0
073f    8e63f:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e644: R_X86_64_32S	.text+0x890a0
0748    8e648:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	8e64d: R_X86_64_32S	.rodata+0x140e0
0751    8e651:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e655: R_X86_64_32S	.rodata+0x109a8
0759    8e659:	48 c7 44 24 08 03 00 00 00 	movq   $0x3,0x8(%rsp)
0762    8e662:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
076b    8e66b:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	8e670: R_X86_64_32S	_RNvXs2_NtNtNtCs5QSdWC790r4_4core3fmt3num3implNtB9_7Display3fmt
0774    8e674:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
0779    8e679:	48 c7 44 24 18 02 00 00 00 	movq   $0x2,0x18(%rsp)
0782    8e682:	e8 00 00 00 00       	call   8e687 <rust_doctest_kernel_rbtree_rs_3+0x787>	8e683: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
0787    8e687:	48 89 e7             	mov    %rsp,%rdi
078a    8e68a:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8e68f: R_X86_64_32S	.rodata+0x140f8
0793    8e693:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e697: R_X86_64_32S	.rodata+0xf2c0
079b    8e69b:	48 c7 44 24 08 02 00 00 00 	movq   $0x2,0x8(%rsp)
07a4    8e6a4:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
07ad    8e6ad:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
07b2    8e6b2:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	8e6b7: R_X86_64_32S	.text+0x890a0
07bb    8e6bb:	48 c7 44 24 18 01 00 00 00 	movq   $0x1,0x18(%rsp)
07c4    8e6c4:	e8 00 00 00 00       	call   8e6c9 <rust_doctest_kernel_rbtree_rs_3+0x7c9>	8e6c5: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
07c9    8e6c9:	48 89 e7             	mov    %rsp,%rdi
07cc    8e6cc:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8e6d0: R_X86_64_32S	.rodata+0xf328
07d4    8e6d4:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
07dd    8e6dd:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
07e6    8e6e6:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	8e6eb: R_X86_64_32S	.rodata+0xec58
07ef    8e6ef:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
07f8    8e6f8:	e8 00 00 00 00       	call   8e6fd <rust_doctest_kernel_rbtree_rs_3+0x7fd>	8e6f9: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
07fd    8e6fd:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
0802    8e702:	e8 00 00 00 00       	call   8e707 <rust_doctest_kernel_rbtree_rs_3+0x807>	8e703: R_X86_64_PLT32	rb_first_postorder-0x4
0807    8e707:	48 85 c0             	test   %rax,%rax
080a    8e70a:	0f 84 e2 f9 ff ff    	je     8e0f2 <rust_doctest_kernel_rbtree_rs_3+0x1f2>
0810    8e710:	48 89 c3             	mov    %rax,%rbx
0813    8e713:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
081d    8e71d:	0f 1f 00             	nopl   (%rax)
0820    8e720:	48 89 df             	mov    %rbx,%rdi
0823    8e723:	e8 00 00 00 00       	call   8e728 <rust_doctest_kernel_rbtree_rs_3+0x828>	8e724: R_X86_64_PLT32	rb_next_postorder-0x4
0828    8e728:	be 20 00 00 00       	mov    $0x20,%esi
082d    8e72d:	ba 08 00 00 00       	mov    $0x8,%edx
0832    8e732:	48 89 df             	mov    %rbx,%rdi
0835    8e735:	49 89 c6             	mov    %rax,%r14
0838    8e738:	e8 00 00 00 00       	call   8e73d <rust_doctest_kernel_rbtree_rs_3+0x83d>	8e739: R_X86_64_PLT32	__rust_dealloc-0x4
083d    8e73d:	4d 85 f6             	test   %r14,%r14
0840    8e740:	4c 89 f3             	mov    %r14,%rbx
0843    8e743:	75 db                	jne    8e720 <rust_doctest_kernel_rbtree_rs_3+0x820>
0845    8e745:	e9 a8 f9 ff ff       	jmp    8e0f2 <rust_doctest_kernel_rbtree_rs_3+0x1f2>
084a    8e74a:	48 89 c7             	mov    %rax,%rdi
084d    8e74d:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8e750: R_X86_64_32S	.rodata+0x14150
0854    8e754:	31 d2                	xor    %edx,%edx
0856    8e756:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	8e759: R_X86_64_32S	.rodata+0x14160
085d    8e75d:	48 89 c3             	mov    %rax,%rbx
0860    8e760:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	8e763: R_X86_64_32S	kunit_unary_assert_format
0867    8e767:	45 31 c9             	xor    %r9d,%r9d
086a    8e76a:	31 c0                	xor    %eax,%eax
086c    8e76c:	e8 00 00 00 00       	call   8e771 <rust_doctest_kernel_rbtree_rs_3+0x871>	8e76d: R_X86_64_PLT32	__kunit_do_failed_assertion-0x4
0871    8e771:	48 89 df             	mov    %rbx,%rdi
0874    8e774:	e8 00 00 00 00       	call   8e779 <rust_doctest_kernel_rbtree_rs_3+0x879>	8e775: R_X86_64_PLT32	__kunit_abort-0x4
0879    8e779:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8e77c: R_X86_64_32S	.rodata+0x109d8
0880    8e780:	e8 00 00 00 00       	call   8e785 <rust_doctest_kernel_rbtree_rs_3+0x885>	8e781: R_X86_64_PLT32	_RNvNtCs5QSdWC790r4_4core6option13unwrap_failed-0x4
0885    8e785:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8e788: R_X86_64_32S	.rodata+0x109f0
088c    8e78c:	e8 00 00 00 00       	call   8e791 <rust_doctest_kernel_rbtree_rs_3+0x891>	8e78d: R_X86_64_PLT32	_RNvNtCs5QSdWC790r4_4core6option13unwrap_failed-0x4
0891    8e791:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8e794: R_X86_64_32S	.rodata+0x10a08
0898    8e798:	e8 00 00 00 00       	call   8e79d <rust_doctest_kernel_rbtree_rs_3+0x89d>	8e799: R_X86_64_PLT32	_RNvNtCs5QSdWC790r4_4core6option13unwrap_failed-0x4
089d    8e79d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8e7a0: R_X86_64_32S	.rodata+0x10a20
08a4    8e7a4:	e8 00 00 00 00       	call   8e7a9 <rust_doctest_kernel_rbtree_rs_3+0x8a9>	8e7a5: R_X86_64_PLT32	_RNvNtCs5QSdWC790r4_4core6option13unwrap_failed-0x4
08a9    8e7a9:	48 89 c7             	mov    %rax,%rdi
08ac    8e7ac:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8e7af: R_X86_64_32S	.rodata+0x13f50
08b3    8e7b3:	31 d2                	xor    %edx,%edx
08b5    8e7b5:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	8e7b8: R_X86_64_32S	.rodata+0x13f60
08bc    8e7bc:	eb 9f                	jmp    8e75d <rust_doctest_kernel_rbtree_rs_3+0x85d>
08be    8e7be:	48 89 c7             	mov    %rax,%rdi
08c1    8e7c1:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8e7c4: R_X86_64_32S	.rodata+0x13fb0
08c8    8e7c8:	31 d2                	xor    %edx,%edx
08ca    8e7ca:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	8e7cd: R_X86_64_32S	.rodata+0x13fc0
08d1    8e7d1:	eb 8a                	jmp    8e75d <rust_doctest_kernel_rbtree_rs_3+0x85d>
08d3    8e7d3:	48 89 c7             	mov    %rax,%rdi
08d6    8e7d6:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8e7d9: R_X86_64_32S	.rodata+0x14008
08dd    8e7dd:	31 d2                	xor    %edx,%edx
08df    8e7df:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	8e7e2: R_X86_64_32S	.rodata+0x14018
08e6    8e7e6:	e9 72 ff ff ff       	jmp    8e75d <rust_doctest_kernel_rbtree_rs_3+0x85d>
08eb    8e7eb:	48 89 c7             	mov    %rax,%rdi
08ee    8e7ee:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8e7f1: R_X86_64_32S	.rodata+0x14050
08f5    8e7f5:	31 d2                	xor    %edx,%edx
08f7    8e7f7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	8e7fa: R_X86_64_32S	.rodata+0x14060
08fe    8e7fe:	e9 5a ff ff ff       	jmp    8e75d <rust_doctest_kernel_rbtree_rs_3+0x85d>
0903    8e803:	48 89 c7             	mov    %rax,%rdi
0906    8e806:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8e809: R_X86_64_32S	.rodata+0x140b0
090d    8e80d:	31 d2                	xor    %edx,%edx
090f    8e80f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	8e812: R_X86_64_32S	.rodata+0x140c0
0916    8e816:	e9 42 ff ff ff       	jmp    8e75d <rust_doctest_kernel_rbtree_rs_3+0x85d>
091b    8e81b:	48 89 c7             	mov    %rax,%rdi
091e    8e81e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	8e821: R_X86_64_32S	.rodata+0x14108
0925    8e825:	31 d2                	xor    %edx,%edx
0927    8e827:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	8e82a: R_X86_64_32S	.rodata+0x14118
092e    8e82e:	e9 2a ff ff ff       	jmp    8e75d <rust_doctest_kernel_rbtree_rs_3+0x85d>
0933    8e833:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
093d    8e83d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
