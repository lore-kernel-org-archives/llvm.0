Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAC34C7D;
	Wed, 31 Jul 2024 00:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722386531; cv=none; b=c2JFNCHcE3Pbdh1s1T4v6r8g5iY3ky6XOXhZMi5cfDheoh0onZh4NxL5kr40oZYmLo5jjTcmUY3ck021EM3DbQ/vJ+xy66dHf7qyAgt3hmc+Xk1GGlTKPwUeHP9lVKv9HTF7dBKS9DA5VCSunUcCW3xX+A2FhUPdpSCjz5D8pgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722386531; c=relaxed/simple;
	bh=ZxlOcCQKwelQANr7ECGg8LP6P9uq2qMhcGE3N6vPNmk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YO8MPeWPH4LM9DwFJUpQg4xeRxX3vCHxOyzv8VNTyNRzQrLS+o36f3xe3Mpj59YFIDEbfgEDUrTHcm0wk9suW5ktY5Q5WCt0+GWBWERo+zm71RaqScnBGagyrs3vnYJbT0T/tlJumUDu1CJifU0G1ZyK2ilwKkXfh/742BlrYtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3LNfvsy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3LNfvsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722386529; x=1753922529;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZxlOcCQKwelQANr7ECGg8LP6P9uq2qMhcGE3N6vPNmk=;
  b=a3LNfvsy8R3yRFWuCL3QydVYXL+MT3hR3G8rk36aK39hS58+6uEjkBN/
   wdsc8tzqwgC1jQ8j0ZEMCL7/W00k5sc0e1lRFJkxVmb6zZxAV8qKxG/we
   o/atAYgH8iBAR4WPu1yRG3rWcigyJfyhBu8xBNMcRWqz4QKozvgYcK/zQ
   X7iZr6haZySIm7bgTo687EcKVpPednPAJn5p6fA4C+HRs9MlGYOIsrFuE
   aLqoE6qCZyeWKKC2lwkV/Kqsqk5ON1RD+QkujSLLIAVn5jcjJSCXidWqG
   G3I1i3S1KpxN0HfXY2GeadHg8c6gzKZJQxuLJsJQhzS+c8ZR6uIQVdchD
   A==;
X-CSE-ConnectionGUID: eds4TllMROqpta0PmAXynQ==
X-CSE-MsgGUID: mWuAVMNcS8WjXzlW8SSyXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20366623"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20366623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 17:42:08 -0700
X-CSE-ConnectionGUID: 7XA/tptxQUSneQHeoEU5ug==
X-CSE-MsgGUID: sqy03o2jTkG6uMrHfxA2cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54205826"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2024 17:42:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYxPo-000tXk-0V;
	Wed, 31 Jul 2024 00:42:04 +0000
Date: Wed, 31 Jul 2024 08:41:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool:
 _RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x224:
 missing int3 after ret
Message-ID: <202407310823.Qv5ScAO4-lkp@intel.com>
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
CC: Alice Ryhl <aliceryhl@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c91a7dee0555f6f9d3702d86312382e4c4729d0a
commit: 56f64b370612d8967df2c2e0cead805444d4e71a rust: upgrade to Rust 1.78.0
date:   3 months ago
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407310823.Qv5ScAO4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310823.Qv5ScAO4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310823.Qv5ScAO4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs7O_Cs2dcoKnfGXnn_4uapiNtB6_15compat_sigeventNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7R_Cs2dcoKnfGXnn_4uapiNtB6_12compat_ifreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7V_Cs2dcoKnfGXnn_4uapiNtB6_26stack_record__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7W_Cs2dcoKnfGXnn_4uapiNtB6_12stack_recordNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Z_Cs2dcoKnfGXnn_4uapiNtB6_11dev_pagemapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8c_Cs2dcoKnfGXnn_4uapiNtB6_19kernfs_global_locksNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8h_Cs2dcoKnfGXnn_4uapiNtB6_11kernfs_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8i_Cs2dcoKnfGXnn_4uapiNtB6_16kernfs_open_fileNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8t_Cs2dcoKnfGXnn_4uapiNtB6_15kobj_uevent_envNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8L_Cs2dcoKnfGXnn_4uapiNtB6_4userNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8M_Cs2dcoKnfGXnn_4uapiNtB6_14user_ymmh_regsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8O_Cs2dcoKnfGXnn_4uapiNtB6_15user_xstateregsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9o_Cs2dcoKnfGXnn_4uapiNtB6_6deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9q_Cs2dcoKnfGXnn_4uapiNtB6_11device_linkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9I_Cs2dcoKnfGXnn_4uapiNtB6_12sockaddr_in6NtNtCs5QSdWC790r4_4core7default7Default7default+0x21: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9J_Cs2dcoKnfGXnn_4uapiNtB6_9ipv6_mreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x19: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9M_Cs2dcoKnfGXnn_4uapiNtB6_37flow_dissector_key_vlan__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9P_Cs2dcoKnfGXnn_4uapiNtB6_27flow_dissector_key_enc_optsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaR_Cs2dcoKnfGXnn_4uapiNtB6_15sk_buff_fclonesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbD_Cs2dcoKnfGXnn_4uapiNtB6_9___sk_buffNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbI_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_tunnel_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbM_Cs2dcoKnfGXnn_4uapiNtB6_28bpf_sock_tuple__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x29: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscD_Cs2dcoKnfGXnn_4uapiNtB6_13bpf_flow_keysNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscS_Cs2dcoKnfGXnn_4uapiNtB6_10sock_fprogNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscZ_Cs2dcoKnfGXnn_4uapiNtB6_4nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsd0_Cs2dcoKnfGXnn_4uapiNtB6_3cpuNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsd2_Cs2dcoKnfGXnn_4uapiNtB6_14text_poke_insnNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdn_Cs2dcoKnfGXnn_4uapiNtB6_9psi_groupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdp_Cs2dcoKnfGXnn_4uapiNtB6_19cgroup_subsys_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsds_Cs2dcoKnfGXnn_4uapiNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdt_Cs2dcoKnfGXnn_4uapiNtB6_11cgroup_rootNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdF_Cs2dcoKnfGXnn_4uapiNtB6_16backing_dev_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdG_Cs2dcoKnfGXnn_4uapiNtB6_12block_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdH_Cs2dcoKnfGXnn_4uapiNtB6_17bio__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdZ_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXse0_Cs2dcoKnfGXnn_4uapiNtB6_17bpf_offloaded_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseb_Cs2dcoKnfGXnn_4uapiNtB6_8bpf_ksymNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsed_Cs2dcoKnfGXnn_4uapiNtB6_15bpf_tramp_imageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsei_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_dispatcherNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXser_Cs2dcoKnfGXnn_4uapiNtB6_12bpf_prog_auxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseC_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_struct_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseS_Cs2dcoKnfGXnn_4uapiNtB6_31bpf_iter_aux_info__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfa_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfb_Cs2dcoKnfGXnn_4uapiNtB6_14compat_rtentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfc_Cs2dcoKnfGXnn_4uapiNtB6_16compat_group_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfd_Cs2dcoKnfGXnn_4uapiNtB6_23compat_group_source_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsff_Cs2dcoKnfGXnn_4uapiNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfh_Cs2dcoKnfGXnn_4uapiNtB6_19compat_group_filterNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfi_Cs2dcoKnfGXnn_4uapiNtB6_11scm_fp_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfx_Cs2dcoKnfGXnn_4uapiNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfA_Cs2dcoKnfGXnn_4uapiNtB6_13ethtool_flashNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel3str16CStrConvertErrorECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel5error5ErrorECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeRjECsgxAQYCfdR72_25doctests_kernel_generated+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VechEINtB2_6VecExthE4pushCsgxAQYCfdR72_25doctests_kernel_generated+0x170: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE17extend_from_sliceCsgxAQYCfdR72_25doctests_kernel_generated+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE4pushCsgxAQYCfdR72_25doctests_kernel_generated+0x5d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE7reserveCsgxAQYCfdR72_25doctests_kernel_generated+0x149: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRINtNtB7_6option6OptionjENtB5_5Debug3fmtCsgxAQYCfdR72_25doctests_kernel_generated+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRTmENtB5_5Debug3fmtCsgxAQYCfdR72_25doctests_kernel_generated+0x48: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_vec_ext_rs_0+0x3fd: missing int3 after ret
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
>> vmlinux.o: warning: objtool: _RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x224: missing int3 after ret
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
>> vmlinux.o: warning: objtool: _RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated30rust_doctest_kernel_types_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_types_rs_154_08example3+0x1aa: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_0+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_04main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_35_0NtB4_8MyStructNtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItem3run+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_2+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_3+0x3f: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_76_0NtB4_8MyStructINtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItemKy1_E3run+0x88: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXs0_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_34main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_76_0NtB5_8MyStructINtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItemKy2_E3run+0x88: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4_NvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1220_01__NtB7_3FooNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1220_0NtB2_3FooNtNtCs1cdwasc6FUb_6kernel4init10PinnedDrop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNtNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated32rust_doctest_kernel_net_phy_rs_04main63__doctest_main__kbuild_src_consumer_rust_kernel_net_phy_rs_765_024module_phy_driver_sample1__NtB4_6ModuleNtCs1cdwasc6FUb_6kernel6Module4init+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_sample_phy_init+0x66: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeINtNtB4_6option6OptionNtCsxvZyEly3ot_12rust_minimal11RustMinimalEEB14_+0xe7: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeRlECsxvZyEly3ot_12rust_minimal+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE4pushCsxvZyEly3ot_12rust_minimal+0x1ba: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsi_NtCscg2doA4GLaz_5alloc3vecINtB5_3VeclENtNtCs5QSdWC790r4_4core3fmt5Debug3fmtCsxvZyEly3ot_12rust_minimal+0x75: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCsxvZyEly3ot_12rust_minimalNtB2_11RustMinimalNtCs1cdwasc6FUb_6kernel6Module4init+0x142: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_CsxvZyEly3ot_12rust_minimalNtB4_11RustMinimalNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0xab: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_minimal_init+0x24: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXCsiTgB7yZxXFm_10rust_printNtB2_9RustPrintNtCs1cdwasc6FUb_6kernel6Module4init+0xa51: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_CsiTgB7yZxXFm_10rust_printNtB4_9RustPrintNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: __rust_print_init+0x18: missing int3 after ret


objdump-func vmlinux.o _RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial:
0000 00000000000ca3d0 <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial>:
0000    ca3d0:	55                   	push   %rbp
0001    ca3d1:	41 57                	push   %r15
0003    ca3d3:	41 56                	push   %r14
0005    ca3d5:	41 55                	push   %r13
0007    ca3d7:	41 54                	push   %r12
0009    ca3d9:	53                   	push   %rbx
000a    ca3da:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
0011    ca3e1:	83 ff 02             	cmp    $0x2,%edi
0014    ca3e4:	89 fb                	mov    %edi,%ebx
0016    ca3e6:	4c 8d 6c 24 04       	lea    0x4(%rsp),%r13
001b    ca3eb:	48 8d 6c 24 08       	lea    0x8(%rsp),%rbp
0020    ca3f0:	49 bc 20 00 00 00 04 00 00 00 	movabs $0x400000020,%r12
002a    ca3fa:	4c 8d 7c 24 20       	lea    0x20(%rsp),%r15
002f    ca3ff:	4c 8d 74 24 10       	lea    0x10(%rsp),%r14
0034    ca404:	48 8d 4c 24 58       	lea    0x58(%rsp),%rcx
0039    ca409:	ba 15 00 00 00       	mov    $0x15,%edx
003e    ca40e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ca411: R_X86_64_32S	_RNvNtNtCs1cdwasc6FUb_6kernel5print14format_strings4INFO
0045    ca415:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	ca418: R_X86_64_32S	.rodata+0xf7a8
004c    ca41c:	48 c7 44 24 20 02 00 00 00 	movq   $0x2,0x20(%rsp)
0055    ca425:	48 c7 44 24 30 02 00 00 00 	movq   $0x2,0x30(%rsp)
005e    ca42e:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)
0067    ca437:	48 c7 44 24 58 00 00 00 00 	movq   $0x0,0x58(%rsp)	ca43c: R_X86_64_32S	.rodata+0x10768
0070    ca440:	48 c7 44 24 60 02 00 00 00 	movq   $0x2,0x60(%rsp)
0079    ca449:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
007e    ca44e:	4c 89 64 24 48       	mov    %r12,0x48(%rsp)
0083    ca453:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
0088    ca458:	48 c7 84 24 80 00 00 00 01 00 00 00 	movq   $0x1,0x80(%rsp)
0094    ca464:	4c 89 74 24 68       	mov    %r14,0x68(%rsp)
0099    ca469:	0f 92 44 24 04       	setb   0x4(%rsp)
009e    ca46e:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
00a3    ca473:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)	ca478: R_X86_64_32S	.text+0xc7740
00ac    ca47c:	c6 44 24 50 03       	movb   $0x3,0x50(%rsp)
00b1    ca481:	48 c7 44 24 70 01 00 00 00 	movq   $0x1,0x70(%rsp)
00ba    ca48a:	e8 00 00 00 00       	call   ca48f <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0xbf>	ca48b: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5print11call_printk-0x4
00bf    ca48f:	80 7c 24 04 00       	cmpb   $0x0,0x4(%rsp)
00c4    ca494:	0f 84 8d 00 00 00    	je     ca527 <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x157>
00ca    ca49a:	48 8d 8c 24 88 00 00 00 	lea    0x88(%rsp),%rcx
00d2    ca4a2:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
00d7    ca4a7:	48 c7 44 24 20 02 00 00 00 	movq   $0x2,0x20(%rsp)
00e0    ca4b0:	48 c7 44 24 30 02 00 00 00 	movq   $0x2,0x30(%rsp)
00e9    ca4b9:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)
00f2    ca4c2:	4c 89 64 24 48       	mov    %r12,0x48(%rsp)
00f7    ca4c7:	48 c7 84 24 88 00 00 00 00 00 00 00 	movq   $0x0,0x88(%rsp)	ca4cf: R_X86_64_32S	.rodata+0x10850
0103    ca4d3:	48 c7 84 24 90 00 00 00 02 00 00 00 	movq   $0x2,0x90(%rsp)
010f    ca4df:	4c 89 bc 24 a8 00 00 00 	mov    %r15,0xa8(%rsp)
0117    ca4e7:	48 c7 84 24 b0 00 00 00 01 00 00 00 	movq   $0x1,0xb0(%rsp)
0123    ca4f3:	4c 89 b4 24 98 00 00 00 	mov    %r14,0x98(%rsp)
012b    ca4fb:	c7 44 24 04 01 00 00 00 	movl   $0x1,0x4(%rsp)
0133    ca503:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
0138    ca508:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)	ca50d: R_X86_64_32S	.text+0xc7790
0141    ca511:	c6 44 24 50 03       	movb   $0x3,0x50(%rsp)
0146    ca516:	48 c7 84 24 a0 00 00 00 01 00 00 00 	movq   $0x1,0xa0(%rsp)
0152    ca522:	e9 a0 00 00 00       	jmp    ca5c7 <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x1f7>
0157    ca527:	85 db                	test   %ebx,%ebx
0159    ca529:	0f 84 c6 00 00 00    	je     ca5f5 <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x225>
015f    ca52f:	8d 7b ff             	lea    -0x1(%rbx),%edi
0162    ca532:	e8 99 fe ff ff       	call   ca3d0 <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial>
0167    ca537:	89 c1                	mov    %eax,%ecx
0169    ca539:	89 d8                	mov    %ebx,%eax
016b    ca53b:	f7 e1                	mul    %ecx
016d    ca53d:	0f 80 ca 00 00 00    	jo     ca60d <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x23d>
0173    ca543:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
0178    ca548:	48 c7 44 24 20 02 00 00 00 	movq   $0x2,0x20(%rsp)
0181    ca551:	48 c7 44 24 30 02 00 00 00 	movq   $0x2,0x30(%rsp)
018a    ca55a:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)
0193    ca563:	4c 89 64 24 48       	mov    %r12,0x48(%rsp)
0198    ca568:	48 c7 84 24 b8 00 00 00 00 00 00 00 	movq   $0x0,0xb8(%rsp)	ca570: R_X86_64_32S	.rodata+0x10800
01a4    ca574:	48 c7 84 24 c0 00 00 00 02 00 00 00 	movq   $0x2,0xc0(%rsp)
01b0    ca580:	4c 89 bc 24 d8 00 00 00 	mov    %r15,0xd8(%rsp)
01b8    ca588:	48 c7 84 24 e0 00 00 00 01 00 00 00 	movq   $0x1,0xe0(%rsp)
01c4    ca594:	4c 89 b4 24 c8 00 00 00 	mov    %r14,0xc8(%rsp)
01cc    ca59c:	89 44 24 04          	mov    %eax,0x4(%rsp)
01d0    ca5a0:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
01d5    ca5a5:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)	ca5aa: R_X86_64_32S	.text+0xc7790
01de    ca5ae:	c6 44 24 50 03       	movb   $0x3,0x50(%rsp)
01e3    ca5b3:	48 c7 84 24 d0 00 00 00 01 00 00 00 	movq   $0x1,0xd0(%rsp)
01ef    ca5bf:	48 8d 8c 24 b8 00 00 00 	lea    0xb8(%rsp),%rcx
01f7    ca5c7:	ba 15 00 00 00       	mov    $0x15,%edx
01fc    ca5cc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ca5cf: R_X86_64_32S	_RNvNtNtCs1cdwasc6FUb_6kernel5print14format_strings4INFO
0203    ca5d3:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	ca5d6: R_X86_64_32S	.rodata+0xf7a8
020a    ca5da:	e8 00 00 00 00       	call   ca5df <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x20f>	ca5db: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5print11call_printk-0x4
020f    ca5df:	8b 44 24 04          	mov    0x4(%rsp),%eax
0213    ca5e3:	48 81 c4 e8 00 00 00 	add    $0xe8,%rsp
021a    ca5ea:	5b                   	pop    %rbx
021b    ca5eb:	41 5c                	pop    %r12
021d    ca5ed:	41 5d                	pop    %r13
021f    ca5ef:	41 5e                	pop    %r14
0221    ca5f1:	41 5f                	pop    %r15
0223    ca5f3:	5d                   	pop    %rbp
0224    ca5f4:	c3                   	ret
0225    ca5f5:	be 21 00 00 00       	mov    $0x21,%esi
022a    ca5fa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ca5fd: R_X86_64_32S	.rodata+0xeac0
0231    ca601:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	ca604: R_X86_64_32S	.rodata+0x10788
0238    ca608:	e8 00 00 00 00       	call   ca60d <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x23d>	ca609: R_X86_64_PLT32	_RNvNtCs5QSdWC790r4_4core9panicking5panic-0x4
023d    ca60d:	be 21 00 00 00       	mov    $0x21,%esi
0242    ca612:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	ca615: R_X86_64_32S	.rodata+0xea70
0249    ca619:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	ca61c: R_X86_64_32S	.rodata+0x107a0
0250    ca620:	e8 00 00 00 00       	call   ca625 <_RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated35rust_doctest_kernel_std_vendor_rs_44main65__doctest_main__kbuild_src_consumer_rust_kernel_std_vendor_rs_73_09factorial+0x255>	ca621: R_X86_64_PLT32	_RNvNtCs5QSdWC790r4_4core9panicking5panic-0x4
0255    ca625:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
025f    ca62f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
