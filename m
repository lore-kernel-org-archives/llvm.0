Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06A45023;
	Wed, 31 Jul 2024 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722455522; cv=none; b=CL2Y5QM/u9QNmMHJdB9e2PieduqEIHgchn2lQmvaayZakbZpakpiTu17IG4eXvjaTWgr3xvJWkaMuxr7K4KrYkhf5A1+QpeyRGEtYJamd7WabDaKydZNnGdysGz97i8ClnmRoO+oXL8XuBk2R1b09mPKLOMEYtc+ZvwhdDLceJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722455522; c=relaxed/simple;
	bh=+Gw53KXPUZWkPBvZbxz/fOusdyr0wwtllS6KT8hf1QM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYVqKxcdTIO9dzoCxc4KsCup4fXsFPno7VgmDouN64acnMcx0ngVyKgeVsq49BN2DrCDdRkQs/F93x7jAV2bDrotxD6wTqMNcT37c13e5CXiEL5KZNrAnt8MjWP2VHZT33Un5pDJhxfTsHtFppMt9Z3PZ90swVk7NJEAlB4BNtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3GVpvE1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3GVpvE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722455520; x=1753991520;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+Gw53KXPUZWkPBvZbxz/fOusdyr0wwtllS6KT8hf1QM=;
  b=Z3GVpvE1/bVbo8omRXbmyNTWj139WHqmtcEm1tKAA4aLoPghEfi+IisO
   gsKBDqgkEgNc5VNjInWjC4k5VaMfFiCpl+cLOAw2cifGilmrjN99PPg7k
   GLUVr1vtb9zB8qSZpJH+JO+ON/I1ORDTF/R4rb6/bG3r6IZzAQappvTQG
   /LoSJdg6j36iYAN3pR/4VWzbv11MWNc52sclrUwCsb8TqUvx7EYbaum12
   vcvEZmiOjjdJ8P35EswTnC6cgQp1ydHDO5xgnpWbM61F4Sq14TMZloZHT
   2zYQXaDUxCNgsfWhkVqSagEGaxAraaV9o3qFa5/bjfadm7MBskmug8xdw
   w==;
X-CSE-ConnectionGUID: GCQPtMmURI6H6bJgYG2+Jw==
X-CSE-MsgGUID: keRRLWt7Sj20VTr5kfCUfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31023417"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="31023417"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 12:51:59 -0700
X-CSE-ConnectionGUID: AXpWN90VSGaGiHyBVQh7gA==
X-CSE-MsgGUID: S0nY7f5UTnm/pjdzAtMhDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59113210"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2024 12:51:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZFMa-000ulQ-0V;
	Wed, 31 Jul 2024 19:51:56 +0000
Date: Thu, 1 Aug 2024 03:51:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [rust:rust-dev 4/16] vmlinux.o: warning: objtool:
 _RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0x10b:
 missing int3 after ret
Message-ID: <202408010344.F02wwCeR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Miguel Ojeda <ojeda@kernel.org>
TO: Wedson Almeida Filho <wedsonaf@gmail.com>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Alice Ryhl <aliceryhl@google.com>
CC: Matt Gilbride <mattgilbride@google.com>

tree:   https://github.com/Rust-for-Linux/linux rust-dev
head:   6dc5ff2a9a87b5f6e3b8ab11ee4835d7d82fc01e
commit: 80990d23b7c75687e06051a5ae69edb2e38f8ae6 [4/16] rust: rbtree: add red-black tree implementation backed by the C version
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240801/202408010344.F02wwCeR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010344.F02wwCeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010344.F02wwCeR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs3o_Cs2dcoKnfGXnn_4uapiNtB6_10rhashtableNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3B_Cs2dcoKnfGXnn_4uapiNtB6_11maple_allocNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3M_Cs2dcoKnfGXnn_4uapiNtB6_12rw_semaphoreNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3X_Cs2dcoKnfGXnn_4uapiNtB6_12delayed_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs43_Cs2dcoKnfGXnn_4uapiNtB6_9srcu_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs44_Cs2dcoKnfGXnn_4uapiNtB6_9srcu_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
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
>> vmlinux.o: warning: objtool: _RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0x10b: missing int3 after ret
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
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_0+0x1f9: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_1+0x629: missing int3 after ret
>> vmlinux.o: warning: objtool: rust_doctest_kernel_rbtree_rs_2+0x3f: missing int3 after ret
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


objdump-func vmlinux.o _RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated:
0000 00000000000886e0 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated>:
0000    886e0:	55                   	push   %rbp
0001    886e1:	41 57                	push   %r15
0003    886e3:	41 56                	push   %r14
0005    886e5:	41 54                	push   %r12
0007    886e7:	53                   	push   %rbx
0008    886e8:	48 83 ec 20          	sub    $0x20,%rsp
000c    886ec:	41 89 cc             	mov    %ecx,%r12d
000f    886ef:	89 d5                	mov    %edx,%ebp
0011    886f1:	49 89 f6             	mov    %rsi,%r14
0014    886f4:	48 89 fb             	mov    %rdi,%rbx
0017    886f7:	be 08 00 00 00       	mov    $0x8,%esi
001c    886fc:	ba 20 00 00 00       	mov    $0x20,%edx
0021    88701:	31 ff                	xor    %edi,%edi
0023    88703:	b9 c0 0c 00 00       	mov    $0xcc0,%ecx
0028    88708:	e8 00 00 00 00       	call   8870d <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0x2d>	88709: R_X86_64_PLT32	_RNvNtNtCs1cdwasc6FUb_6kernel5alloc9allocator16krealloc_aligned-0x4
002d    8870d:	48 85 c0             	test   %rax,%rax
0030    88710:	0f 84 91 00 00 00    	je     887a7 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xc7>
0036    88716:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
003b    8871b:	49 89 c7             	mov    %rax,%r15
003e    8871e:	e8 00 00 00 00       	call   88723 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0x43>	8871f: R_X86_64_PLT32	_RNvXs2p_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7rb_nodeNtNtCs5QSdWC790r4_4core7default7Default7default-0x4
0043    88723:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0048    88728:	49 89 47 10          	mov    %rax,0x10(%r15)
004c    8872c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0051    88731:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
0056    88736:	49 89 4f 08          	mov    %rcx,0x8(%r15)
005a    8873a:	49 89 07             	mov    %rax,(%r15)
005d    8873d:	41 89 6f 18          	mov    %ebp,0x18(%r15)
0061    88741:	45 89 67 1c          	mov    %r12d,0x1c(%r15)
0065    88745:	49 8b 0e             	mov    (%r14),%rcx
0068    88748:	48 85 c9             	test   %rcx,%rcx
006b    8874b:	74 6d                	je     887ba <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xda>
006d    8874d:	b8 ff 00 00 00       	mov    $0xff,%eax
0072    88752:	eb 1a                	jmp    8876e <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0x8e>
0074    88754:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
007e    8875e:	66 90                	xchg   %ax,%ax
0080    88760:	ba 08 00 00 00       	mov    $0x8,%edx
0085    88765:	48 8b 0c 16          	mov    (%rsi,%rdx,1),%rcx
0089    88769:	48 85 c9             	test   %rcx,%rcx
008c    8876c:	74 47                	je     887b5 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xd5>
008e    8876e:	48 89 ce             	mov    %rcx,%rsi
0091    88771:	31 c9                	xor    %ecx,%ecx
0093    88773:	39 6e 18             	cmp    %ebp,0x18(%rsi)
0096    88776:	0f 95 c1             	setne  %cl
0099    88779:	0f 4f c8             	cmovg  %eax,%ecx
009c    8877c:	80 f9 01             	cmp    $0x1,%cl
009f    8877f:	74 df                	je     88760 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0x80>
00a1    88781:	0f b6 c9             	movzbl %cl,%ecx
00a4    88784:	ba 10 00 00 00       	mov    $0x10,%edx
00a9    88789:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
00af    8878f:	74 d4                	je     88765 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0x85>
00b1    88791:	48 89 f7             	mov    %rsi,%rdi
00b4    88794:	49 89 f4             	mov    %rsi,%r12
00b7    88797:	4c 89 fe             	mov    %r15,%rsi
00ba    8879a:	4c 89 f2             	mov    %r14,%rdx
00bd    8879d:	e8 00 00 00 00       	call   887a2 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xc2>	8879e: R_X86_64_PLT32	rb_replace_node-0x4
00c2    887a2:	4c 89 e0             	mov    %r12,%rax
00c5    887a5:	eb 2d                	jmp    887d4 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xf4>
00c7    887a7:	b8 01 00 00 00       	mov    $0x1,%eax
00cc    887ac:	c7 43 04 f4 ff ff ff 	movl   $0xfffffff4,0x4(%rbx)
00d3    887b3:	eb 25                	jmp    887da <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xfa>
00d5    887b5:	48 01 f2             	add    %rsi,%rdx
00d8    887b8:	eb 05                	jmp    887bf <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xdf>
00da    887ba:	31 f6                	xor    %esi,%esi
00dc    887bc:	4c 89 f2             	mov    %r14,%rdx
00df    887bf:	4c 89 ff             	mov    %r15,%rdi
00e2    887c2:	e8 00 00 00 00       	call   887c7 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xe7>	887c3: R_X86_64_PLT32	rust_helper_rb_link_node-0x4
00e7    887c7:	4c 89 ff             	mov    %r15,%rdi
00ea    887ca:	4c 89 f6             	mov    %r14,%rsi
00ed    887cd:	e8 00 00 00 00       	call   887d2 <_RNvMs1_NtCs1cdwasc6FUb_6kernel6rbtreeINtB5_6RBTreellE21try_create_and_insertCsgxAQYCfdR72_25doctests_kernel_generated+0xf2>	887ce: R_X86_64_PLT32	rb_insert_color-0x4
00f2    887d2:	31 c0                	xor    %eax,%eax
00f4    887d4:	48 89 43 08          	mov    %rax,0x8(%rbx)
00f8    887d8:	31 c0                	xor    %eax,%eax
00fa    887da:	89 03                	mov    %eax,(%rbx)
00fc    887dc:	48 89 d8             	mov    %rbx,%rax
00ff    887df:	48 83 c4 20          	add    $0x20,%rsp
0103    887e3:	5b                   	pop    %rbx
0104    887e4:	41 5c                	pop    %r12
0106    887e6:	41 5e                	pop    %r14
0108    887e8:	41 5f                	pop    %r15
010a    887ea:	5d                   	pop    %rbp
010b    887eb:	c3                   	ret
010c    887ec:	0f 1f 40 00          	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
