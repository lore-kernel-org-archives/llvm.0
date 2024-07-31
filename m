Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DDC1B374F;
	Wed, 31 Jul 2024 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435225; cv=none; b=TiYIfpcqu0B+4bQajvnlnkl9IZJHD/dqnqgiEJQm0A9ajD/qczXVsY7QAstyFz28FwRjR4PyKI3UktDzlK+Leuk6kZKXjMsxvPe/KJ1Kc/3npUsBkfGdyIsTWj/nvQM930cWEOrtMPiPLtCZFASRXA9BeJg6WOnZjIJJWT37+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435225; c=relaxed/simple;
	bh=qLU5bnumH0Jk3eRJ7ZhlOidqUUt1582MYb3DssDRi2k=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aWvaom+ivdSXQv9h4fVckmgK+f5OEEDSWtR1hkrSQjgMvm8P5gvaSVHx1D9Emtgl0hheOYzXqHwymde+t11znG4LNo5yqT3QBEVosnZH21pGCDam7XLH66N5/EfV/Tw2/gwo1qs4pswwS9ZCNsEpXAxIvZDiM5FulAKbmJar5lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvC+qRgC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvC+qRgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722435222; x=1753971222;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qLU5bnumH0Jk3eRJ7ZhlOidqUUt1582MYb3DssDRi2k=;
  b=RvC+qRgCCW0QUoeFpwfBJGlP7eDcDHd4QCEpY05P1H49HLhEoxek27Ns
   3ydBjwBlcalrfOmZFu5LaZ3crRqap/BsM5mYIsSfLLIJyVpS4O4qaA3dO
   S3h6tvYAr+dU+SmMy1GpgJtOw+DZYn64UllCG1XcMzICEli4FzaxgTL5e
   pyeJ3KLTpxsfC5c7CyO4FwZLXJaZKt5WQwPNGjW0O5IkcckAGuMQ6E8Pv
   AZTIw0EWVbYBGrITkurGlS8yHbkXBRESVL2ehExR4DpizyU2IYOW7L5jP
   25QgVHxmHQBsKOiEdKAR1CTDT5WaxiUFigIflMd/3MFB7MnDTdPKowhdq
   g==;
X-CSE-ConnectionGUID: TN9tg2iHQMuEPtV8oT9bcQ==
X-CSE-MsgGUID: q5p0sdzESY6RwQ3i/1z4kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24181347"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="24181347"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:13:41 -0700
X-CSE-ConnectionGUID: dxEpdBmmQNyDAvNKiq1OSw==
X-CSE-MsgGUID: 5oMYhw3jRzq5fmqD4zeThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="77965022"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2024 07:13:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZA5D-000uPg-0m;
	Wed, 31 Jul 2024 14:13:39 +0000
Date: Wed, 31 Jul 2024 22:13:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool:
 _RNvXs4_NvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1215_01__NtB7_3FooNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x52:
 missin...
Message-ID: <202407312255.anJqJGKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Miguel Ojeda <ojeda@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e4fc196f5ba36eb7b9758cf2c73df49a44199895
commit: dee1396a486cf2b6e7840322f6d104680649f2ff rust: init: simplify from `map_err` to `inspect_err`
date:   3 weeks ago
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407312255.anJqJGKC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312255.anJqJGKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407312255.anJqJGKC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXseV_Cs2dcoKnfGXnn_4uapiNtB6_31bpf_iter_aux_info__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfd_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfe_Cs2dcoKnfGXnn_4uapiNtB6_14compat_rtentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsff_Cs2dcoKnfGXnn_4uapiNtB6_16compat_group_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfi_Cs2dcoKnfGXnn_4uapiNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfk_Cs2dcoKnfGXnn_4uapiNtB6_19compat_group_filterNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfl_Cs2dcoKnfGXnn_4uapiNtB6_11scm_fp_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfA_Cs2dcoKnfGXnn_4uapiNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfD_Cs2dcoKnfGXnn_4uapiNtB6_13ethtool_flashNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
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
   vmlinux.o: warning: objtool: _RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated30rust_doctest_kernel_types_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_types_rs_154_08example3+0x1aa: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_uaccess_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_uaccess_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_04main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_35_0NtB4_8MyStructNtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItem3run+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_3+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_76_0NtB4_8MyStructINtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItemKy1_E3run+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs0_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_76_0NtB5_8MyStructINtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItemKy2_E3run+0x88: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs4_NvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1215_01__NtB7_3FooNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x52: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1215_0NtB2_3FooNtNtCs1cdwasc6FUb_6kernel4init10PinnedDrop4drop+0x52: missing int3 after ret
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


objdump-func vmlinux.o _RNvXs4_NvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1215_01__NtB7_3FooNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop:
0000 00000000000cd700 <_RNvXs4_NvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1215_01__NtB7_3FooNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop>:
0000    cd700:	48 83 ec 38          	sub    $0x38,%rsp
0004    cd704:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
0009    cd709:	ba 15 00 00 00       	mov    $0x15,%edx
000e    cd70e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	cd711: R_X86_64_32S	_RNvNtNtCs1cdwasc6FUb_6kernel5print14format_strings4INFO
0015    cd715:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	cd718: R_X86_64_32S	.rodata+0xf8b8
001c    cd71c:	48 c7 44 24 08 00 00 00 00 	movq   $0x0,0x8(%rsp)	cd721: R_X86_64_32S	.rodata+0x12678
0025    cd725:	48 c7 44 24 10 01 00 00 00 	movq   $0x1,0x10(%rsp)
002e    cd72e:	48 c7 44 24 28 00 00 00 00 	movq   $0x0,0x28(%rsp)
0037    cd737:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)	cd73c: R_X86_64_32S	.rodata+0xebf8
0040    cd740:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0049    cd749:	e8 00 00 00 00       	call   cd74e <_RNvXs4_NvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1215_01__NtB7_3FooNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x4e>	cd74a: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5print11call_printk-0x4
004e    cd74e:	48 83 c4 38          	add    $0x38,%rsp
0052    cd752:	c3                   	ret
0053    cd753:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
005d    cd75d:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
