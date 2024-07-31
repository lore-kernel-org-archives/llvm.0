Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5A51754B;
	Wed, 31 Jul 2024 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722438955; cv=none; b=AOawntTE2+ZjxnAqLv5cx18BgJyQm+NYNfzgu3A1BliqiUZXN/QU9fpvXHymyRvZrwlLvzcGrFcvD/3nVhU1+vceqNk5u9YJoTYQ5XBFwbWd05hRLP6ATlZ1uN4QuioLvo79x/x66/s2Vqj0ZKtNIY7xoTW36iW8XTjuXVH2o+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722438955; c=relaxed/simple;
	bh=zuYboRVfg5KHVBjjU3QKrHA9GR16P9cqK1DB7CeHIKI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CL/pOO/2nPEnK5E0UKBgt/rD0CA6A3DKcw8ShppEaE3AnAj/2X6l7nBgyzqGoBzgiFA3ZNS9IG8C6i2Ja2S4zlgi/VjB9ka6+QGzrIvOyoFXtIHvauvPQmb3+X4yZCx1/mkZWqKo3JBfVF/77cFAQ4vE7jhbR+xPUJj0PDxAr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILq09jfF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILq09jfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722438952; x=1753974952;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zuYboRVfg5KHVBjjU3QKrHA9GR16P9cqK1DB7CeHIKI=;
  b=ILq09jfFVrVrMpBjCjWsKhrSwO5KpYVR/zjY22XA3h9hebguA+O7TpZg
   uVghLZvSQLw+GjTeB2o01xF9Vex4fHw4OOt39rDCHuYSb7yiAvAzFkfzB
   HipaVWG8k5I6VXF1ix4158frMq24Z+/KB89cMrXpMyuxvpTd/9HnATk9d
   cNC7T+O8bEchpC6qbLCpIwo5N0ESAwvK4I7x2yzkw15ORXKXH9Mt6EVpr
   a826TKSxKSFH9s8oRoj3OdAXWjiKiKkxU4yEAmUgGsa8LXz/46T1F5Nar
   y+1i5RbNMpG9osyfqPSQAK9ohSapHtIVe3gIlOfRXuL2P9NzwAD0+5hPf
   A==;
X-CSE-ConnectionGUID: +mJe6tX0QSmK7pdOUfhmug==
X-CSE-MsgGUID: SjTQHIXWTB6dDYuDJ8YfnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31716466"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="31716466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 08:15:51 -0700
X-CSE-ConnectionGUID: 9q8v7McERdGG4Tuhm7Jhig==
X-CSE-MsgGUID: O3rhuzBuSz+5EiQZwxzFLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54618386"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2024 08:15:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZB3H-000uVU-3C;
	Wed, 31 Jul 2024 15:15:43 +0000
Date: Wed, 31 Jul 2024 23:15:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [rust:rust-dev 2/16] vmlinux.o: warning: objtool:
 rust_doctest_kernel_alloc_box_ext_rs_0+0x14d: missing int3 after ret
Message-ID: <202407312314.JfyhFRh9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Miguel Ojeda <ojeda@kernel.org>
TO: Benno Lossin <benno.lossin@proton.me>
CC: Boqun Feng <boqun.feng@gmail.com>

tree:   https://github.com/Rust-for-Linux/linux rust-dev
head:   6dc5ff2a9a87b5f6e3b8ab11ee4835d7d82fc01e
commit: ca406741e3d5a2d6fe1aac834edc9ea897e6ff7c [2/16] rust: kernel: add `drop_contents` to `BoxExt`
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240731/202407312314.JfyhFRh9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407312314.JfyhFRh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407312314.JfyhFRh9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs45_Cs2dcoKnfGXnn_4uapiNtB6_10srcu_usageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4c_Cs2dcoKnfGXnn_4uapiNtB6_18srcu_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4d_Cs2dcoKnfGXnn_4uapiNtB6_25arch_uprobe__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4m_Cs2dcoKnfGXnn_4uapiNtB6_12mm_context_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4A_Cs2dcoKnfGXnn_4uapiNtB6_19folio__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4F_Cs2dcoKnfGXnn_4uapiNtB6_5folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4V_Cs2dcoKnfGXnn_4uapiNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs57_Cs2dcoKnfGXnn_4uapiNtB6_53___kernel_sockaddr_storage__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5a_Cs2dcoKnfGXnn_4uapiNtB6_22sockaddr__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5b_Cs2dcoKnfGXnn_4uapiNtB6_8sockaddrNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5d_Cs2dcoKnfGXnn_4uapiNtB6_6msghdrNtNtCs5QSdWC790r4_4core7default7Default7default+0x6a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5C_Cs2dcoKnfGXnn_4uapiNtB6_18shrinker_info_unitNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5L_Cs2dcoKnfGXnn_4uapiNtB6_13lru_gen_folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5M_Cs2dcoKnfGXnn_4uapiNtB6_16lru_gen_mm_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5N_Cs2dcoKnfGXnn_4uapiNtB6_15lru_gen_mm_walkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5O_Cs2dcoKnfGXnn_4uapiNtB6_13lru_gen_memcgNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5P_Cs2dcoKnfGXnn_4uapiNtB6_6lruvecNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5Q_Cs2dcoKnfGXnn_4uapiNtB6_13per_cpu_pagesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5R_Cs2dcoKnfGXnn_4uapiNtB6_16per_cpu_nodestatNtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5S_Cs2dcoKnfGXnn_4uapiNtB6_4zoneNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5W_Cs2dcoKnfGXnn_4uapiNtB6_11pglist_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs63_Cs2dcoKnfGXnn_4uapiNtB6_7xa_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6c_Cs2dcoKnfGXnn_4uapiNtB6_3pidNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6k_Cs2dcoKnfGXnn_4uapiNtB6_19x86_legacy_featuresNtNtCs5QSdWC790r4_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6l_Cs2dcoKnfGXnn_4uapiNtB6_16x86_platform_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6m_Cs2dcoKnfGXnn_4uapiNtB6_14___large_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6L_Cs2dcoKnfGXnn_4uapiNtB6_3keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6Q_Cs2dcoKnfGXnn_4uapiNtB6_16hrtimer_cpu_baseNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs70_Cs2dcoKnfGXnn_4uapiNtB6_14sighand_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs73_Cs2dcoKnfGXnn_4uapiNtB6_10core_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs74_Cs2dcoKnfGXnn_4uapiNtB6_13signal_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7h_Cs2dcoKnfGXnn_4uapiNtB6_13fs_sysfs_pathNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7p_Cs2dcoKnfGXnn_4uapiNtB6_5dquotNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7r_Cs2dcoKnfGXnn_4uapiNtB6_10quota_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7v_Cs2dcoKnfGXnn_4uapiNtB6_13address_spaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7A_Cs2dcoKnfGXnn_4uapiNtB6_5inodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7F_Cs2dcoKnfGXnn_4uapiNtB6_10sb_writersNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7G_Cs2dcoKnfGXnn_4uapiNtB6_11super_blockNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7M_Cs2dcoKnfGXnn_4uapiNtB6_18user32_fxsr_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7O_Cs2dcoKnfGXnn_4uapiNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7R_Cs2dcoKnfGXnn_4uapiNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_5NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7S_Cs2dcoKnfGXnn_4uapiNtB6_28compat_siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x79: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7U_Cs2dcoKnfGXnn_4uapiNtB6_13compat_direntNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
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
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VechEINtB2_6VecExthE4pushCsgxAQYCfdR72_25doctests_kernel_generated+0x177: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE17extend_from_sliceCsgxAQYCfdR72_25doctests_kernel_generated+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE4pushCsgxAQYCfdR72_25doctests_kernel_generated+0x5d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VeclEINtB2_6VecExtlE7reserveCsgxAQYCfdR72_25doctests_kernel_generated+0x150: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRINtNtB7_6option6OptionjENtB5_5Debug3fmtCsgxAQYCfdR72_25doctests_kernel_generated+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsN_NtCs5QSdWC790r4_4core3fmtRTmENtB5_5Debug3fmtCsgxAQYCfdR72_25doctests_kernel_generated+0x48: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_alloc_box_ext_rs_0+0x14d: missing int3 after ret
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
   vmlinux.o: warning: objtool: _RNvXs4_NvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1215_01__NtB7_3FooNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated29rust_doctest_kernel_init_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_init_rs_1215_0NtB2_3FooNtNtCs1cdwasc6FUb_6kernel4init10PinnedDrop4drop+0x52: missing int3 after ret
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


objdump-func vmlinux.o rust_doctest_kernel_alloc_box_ext_rs_0:
0000 0000000000088f60 <rust_doctest_kernel_alloc_box_ext_rs_0>:
0000    88f60:	53                   	push   %rbx
0001    88f61:	48 83 ec 50          	sub    $0x50,%rsp
0005    88f65:	48 89 e7             	mov    %rsp,%rdi
0008    88f68:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	88f6c: R_X86_64_32S	.rodata+0xf190
0010    88f70:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
0019    88f79:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0022    88f82:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	88f87: R_X86_64_32S	.rodata+0xec28
002b    88f8b:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
0034    88f94:	e8 00 00 00 00       	call   88f99 <rust_doctest_kernel_alloc_box_ext_rs_0+0x39>	88f95: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit4info-0x4
0039    88f99:	be 04 00 00 00       	mov    $0x4,%esi
003e    88f9e:	ba 80 00 00 00       	mov    $0x80,%edx
0043    88fa3:	31 ff                	xor    %edi,%edi
0045    88fa5:	b9 c0 0c 00 00       	mov    $0xcc0,%ecx
004a    88faa:	e8 00 00 00 00       	call   88faf <rust_doctest_kernel_alloc_box_ext_rs_0+0x4f>	88fab: R_X86_64_PLT32	_RNvNtNtCs1cdwasc6FUb_6kernel5alloc9allocator16krealloc_aligned-0x4
004f    88faf:	48 85 c0             	test   %rax,%rax
0052    88fb2:	74 17                	je     88fcb <rust_doctest_kernel_alloc_box_ext_rs_0+0x6b>
0054    88fb4:	be 80 00 00 00       	mov    $0x80,%esi
0059    88fb9:	ba 04 00 00 00       	mov    $0x4,%edx
005e    88fbe:	48 89 c7             	mov    %rax,%rdi
0061    88fc1:	48 83 c4 50          	add    $0x50,%rsp
0065    88fc5:	5b                   	pop    %rbx
0066    88fc6:	e9 00 00 00 00       	jmp    88fcb <rust_doctest_kernel_alloc_box_ext_rs_0+0x6b>	88fc7: R_X86_64_PLT32	__rust_dealloc-0x4
006b    88fcb:	e8 00 00 00 00       	call   88fd0 <rust_doctest_kernel_alloc_box_ext_rs_0+0x70>	88fcc: R_X86_64_PLT32	rust_helper_kunit_get_current_test-0x4
0070    88fd0:	48 85 c0             	test   %rax,%rax
0073    88fd3:	0f 85 d5 00 00 00    	jne    890ae <rust_doctest_kernel_alloc_box_ext_rs_0+0x14e>
0079    88fd9:	48 89 e7             	mov    %rsp,%rdi
007c    88fdc:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
0081    88fe1:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	88fe6: R_X86_64_32S	.rodata+0x12428
008a    88fea:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	88fef: R_X86_64_32S	.text+0x88ee0
0093    88ff3:	48 c7 44 24 40 00 00 00 00 	movq   $0x0,0x40(%rsp)	88ff8: R_X86_64_32S	.rodata+0x12438
009c    88ffc:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	89000: R_X86_64_32S	.rodata+0xf1e8
00a4    89004:	48 c7 44 24 08 03 00 00 00 	movq   $0x3,0x8(%rsp)
00ad    8900d:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
00b6    89016:	48 c7 44 24 48 00 00 00 00 	movq   $0x0,0x48(%rsp)	8901b: R_X86_64_32S	_RNvXs2_NtNtNtCs5QSdWC790r4_4core3fmt3num3implNtB9_7Display3fmt
00bf    8901f:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
00c4    89024:	48 c7 44 24 18 02 00 00 00 	movq   $0x2,0x18(%rsp)
00cd    8902d:	e8 00 00 00 00       	call   89032 <rust_doctest_kernel_alloc_box_ext_rs_0+0xd2>	8902e: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
00d2    89032:	48 89 e7             	mov    %rsp,%rdi
00d5    89035:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)	8903a: R_X86_64_32S	.rodata+0x12458
00de    8903e:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	89042: R_X86_64_32S	.rodata+0xf240
00e6    89046:	48 c7 44 24 08 02 00 00 00 	movq   $0x2,0x8(%rsp)
00ef    8904f:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
00f8    89058:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
00fd    8905d:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)	89062: R_X86_64_32S	.text+0x88ee0
0106    89066:	48 c7 44 24 18 01 00 00 00 	movq   $0x1,0x18(%rsp)
010f    8906f:	e8 00 00 00 00       	call   89074 <rust_doctest_kernel_alloc_box_ext_rs_0+0x114>	89070: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
0114    89074:	48 89 e7             	mov    %rsp,%rdi
0117    89077:	48 c7 04 24 00 00 00 00 	movq   $0x0,(%rsp)	8907b: R_X86_64_32S	.rodata+0xf2a8
011f    8907f:	48 c7 44 24 08 01 00 00 00 	movq   $0x1,0x8(%rsp)
0128    89088:	48 c7 44 24 20 00 00 00 00 	movq   $0x0,0x20(%rsp)
0131    89091:	48 c7 44 24 10 00 00 00 00 	movq   $0x0,0x10(%rsp)	89096: R_X86_64_32S	.rodata+0xec28
013a    8909a:	48 c7 44 24 18 00 00 00 00 	movq   $0x0,0x18(%rsp)
0143    890a3:	e8 00 00 00 00       	call   890a8 <rust_doctest_kernel_alloc_box_ext_rs_0+0x148>	890a4: R_X86_64_PLT32	_RNvNtCs1cdwasc6FUb_6kernel5kunit3err-0x4
0148    890a8:	48 83 c4 50          	add    $0x50,%rsp
014c    890ac:	5b                   	pop    %rbx
014d    890ad:	c3                   	ret
014e    890ae:	48 89 c7             	mov    %rax,%rdi
0151    890b1:	48 89 c3             	mov    %rax,%rbx
0154    890b4:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	890b7: R_X86_64_32S	.rodata+0x12468
015b    890bb:	31 d2                	xor    %edx,%edx
015d    890bd:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	890c0: R_X86_64_32S	.rodata+0x12478
0164    890c4:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	890c7: R_X86_64_32S	kunit_unary_assert_format
016b    890cb:	45 31 c9             	xor    %r9d,%r9d
016e    890ce:	31 c0                	xor    %eax,%eax
0170    890d0:	e8 00 00 00 00       	call   890d5 <rust_doctest_kernel_alloc_box_ext_rs_0+0x175>	890d1: R_X86_64_PLT32	__kunit_do_failed_assertion-0x4
0175    890d5:	48 89 df             	mov    %rbx,%rdi
0178    890d8:	e8 00 00 00 00       	call   890dd <rust_doctest_kernel_alloc_box_ext_rs_0+0x17d>	890d9: R_X86_64_PLT32	__kunit_abort-0x4
017d    890dd:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
