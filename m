Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB4A157490;
	Thu,  1 Aug 2024 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495025; cv=none; b=kEwuf0tKN0LzoRNRgc/5BSYCIB2thgsOJXfbceTk+ykq64TmLbboKk0j0QhMakbe7/OCeoxuJUr4+sxZijbAkuXp5lKH1WRj4dah0Me0nJCtH4EEOk9+x3Uy7smt4YD1lZdqe1cbyEVI2M2Sc1qIvHFOmZqD2m7U9SDSlL1SKzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495025; c=relaxed/simple;
	bh=msRzht8qdzNV0lKy0LTl7tVJT2ctJSyUGL405yMrHXk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrKn7WkZK2+/AkoUtfKAXyQj3KEVL5Cma6ZFU2WZdPbpUVzKde6mJI8DbJGyB7hkKXq2VF9YPwUCFHpUcSmKMCe6++olgD47wi6YYLMe+5AG6m62mYXRcBpL5dhRtLZgtSAmSo7/5QPICe25yq3pOfhqTAxYFg7F9kfa9KTTmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVRGqBFC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVRGqBFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722495022; x=1754031022;
  h=date:from:cc:subject:message-id:mime-version;
  bh=msRzht8qdzNV0lKy0LTl7tVJT2ctJSyUGL405yMrHXk=;
  b=HVRGqBFCy/79NzNDHoa9zLU55j6v0wZhFGahA9dFaTfMiyZBbXjlUNkE
   7rU/JLLCgKfmIU4lqVVoGQkseO6+kVgcikNe6fbzmTu77SGIFNiMhZzb2
   HsxwngLyHg8jtrI956fm0eTN0TITb5E6XTL3cdkUrTgJo7clA6yNYfUF/
   0nHJjI4tfC9zcoc34Orl5N0w7D3EGkOtnqk6IYMxIlD7pqihU77y35RZV
   OcQz+6CEcvxcQMakyRdhF0uMDeuBkMFTL5PMVZ1+4F5yLCOIzVC81vPKb
   NlIfbNocUN+QqRB95p5JDHYeiIdbwRuG/vPyS1lThOMGzWawwCxCpBeqJ
   A==;
X-CSE-ConnectionGUID: FG0lYOSUQ8mwZHraHw5VuA==
X-CSE-MsgGUID: SkdJw6IpRmGmEtE/gSGP9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20545754"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="20545754"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 23:50:22 -0700
X-CSE-ConnectionGUID: aMMhf44XTaWjWlO+drGUdw==
X-CSE-MsgGUID: czvBKrYpTti302FOuDOtNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; 
   d="scan'208";a="54893890"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2024 23:50:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZPdh-000vIO-2j;
	Thu, 01 Aug 2024 06:50:17 +0000
Date: Thu, 1 Aug 2024 14:49:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [rust:rust-dev 15/16] vmlinux.o: warning: objtool:
 _RNvXsen_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14:
 missing int3 after ret
Message-ID: <202408011456.TEzhsd4K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Miguel Ojeda <ojeda@kernel.org>
TO: Alice Ryhl <aliceryhl@google.com>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Benno Lossin <benno.lossin@proton.me>
CC: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
CC: Trevor Gross <tmgross@umich.edu>

tree:   https://github.com/Rust-for-Linux/linux rust-dev
head:   6dc5ff2a9a87b5f6e3b8ab11ee4835d7d82fc01e
commit: 09103460655f980354f99d058775431b699acb1e [15/16] rust: file: add `Kuid` wrapper
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240801/202408011456.TEzhsd4K-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408011456.TEzhsd4K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408011456.TEzhsd4K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs29_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14___kernel_timexNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2i_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13pid_namespaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2l_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19kmsan_context_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2m_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9kmsan_ctxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2I_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_21siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2P_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8sigqueueNtNtCs5QSdWC790r4_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2R_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7ksignalNtNtCs5QSdWC790r4_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2W_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_20posix_cputimers_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs32_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9seqlock_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x7a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs35_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9sched_avgNtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs36_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16sched_statisticsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs39_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15sched_dl_entityNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3d_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11task_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3f_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12thread_unionNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3j_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13msr_regs_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3l_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10saved_msrsNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bpf_raw_event_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3r_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11old_timex32NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3s_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14user_namespaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3B_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14maple_range_64NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3O_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12rw_semaphoreNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3X_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11work_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs44_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9srcu_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs45_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9srcu_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs46_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10srcu_usageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4d_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18srcu_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4e_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_25arch_uprobe__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4A_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19folio__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4F_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4V_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs53_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13lru_gen_folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs54_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16lru_gen_mm_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs55_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15lru_gen_mm_walkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs56_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13lru_gen_memcgNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs57_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6lruvecNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs58_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13per_cpu_pagesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs59_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16per_cpu_nodestatNtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5a_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4zoneNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5e_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11pglist_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5w_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10rhashtableNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5L_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_53___kernel_sockaddr_storage__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5O_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_22sockaddr__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5P_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8sockaddrNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6g_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18shrinker_info_unitNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6n_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7xa_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6w_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3pidNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6E_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19x86_legacy_featuresNtNtCs5QSdWC790r4_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6F_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16x86_platform_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6G_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14___large_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6V_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs70_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16hrtimer_cpu_baseNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7a_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14sighand_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7d_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10core_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7e_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13signal_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7r_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13fs_sysfs_pathNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5dquotNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7B_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10quota_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7F_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13address_spaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7K_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5inodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7P_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10sb_writersNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11super_blockNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7W_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18user32_fxsr_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7Y_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs81_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_5NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs82_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_28compat_siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x79: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs84_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13compat_direntNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs85_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_29compat_sigevent__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x39: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs86_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15compat_sigeventNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs89_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12compat_ifreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8b_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4userNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8n_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19kernfs_global_locksNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8s_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11kernfs_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8t_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16kernfs_open_fileNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8E_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15kobj_uevent_envNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs94_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11kunit_suiteNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs96_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5kunitNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9K_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11device_linkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9N_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12block_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9P_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bio__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9T_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7bio_setNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa0_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19partition_meta_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x6a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa1_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13blk_integrityNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa6_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13request_queueNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsan_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7requestNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsas_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17blk_mq_queue_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsay_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12sockaddr_in6NtNtCs5QSdWC790r4_4core7default7Default7default+0x21: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaz_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9ipv6_mreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x19: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaB_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_32tc_fq_codel_xstats__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x29: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaC_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18tc_fq_codel_xstatsNtNtCs5QSdWC790r4_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaE_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_37flow_dissector_key_vlan__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaH_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_27flow_dissector_key_enc_optsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsbJ_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15sk_buff_fclonesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscA_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_tunnel_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdw_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13bpf_flow_keysNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdL_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10sock_fprogNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdT_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdV_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3cpuNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdW_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14text_poke_insnNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsei_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9psi_groupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsek_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19cgroup_subsys_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsen_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXseo_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11cgroup_rootNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseA_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16backing_dev_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseR_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7bpf_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseS_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bpf_offloaded_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsf3_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8bpf_ksymNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsf5_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15bpf_tramp_imageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfa_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_dispatcherNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfj_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12bpf_prog_auxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfw_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_struct_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfM_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_31bpf_iter_aux_info__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsg5_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14compat_rtentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsg6_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16compat_group_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsg9_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgb_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19compat_group_filterNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgc_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11scm_fp_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgq_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgt_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13ethtool_flashNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgu_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_20ethtool_per_queue_opNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXshb_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12dmi_strmatchNtNtCs5QSdWC790r4_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXshm_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12led_classdevNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXshw_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7mii_busNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXshx_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10phy_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel3str12RawFormatterEBK_+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placelECs1cdwasc6FUb_6kernel+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvYNtNtCs1cdwasc6FUb_6kernel3str12RawFormatterNtNtCs5QSdWC790r4_4core3fmt5Write10write_charB6_+0x117: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvYNtNtCs1cdwasc6FUb_6kernel3str9FormatterNtNtCs5QSdWC790r4_4core3fmt5Write10write_charB6_+0x125: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VechEINtB2_6VecExthE7reserveB6_+0x131: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4credNtB5_10Credential9get_secid+0x18: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4credNtB5_10Credential4euid+0x3: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs1cdwasc6FUb_6kernel6deviceNtB2_6Device8from_raw+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs1cdwasc6FUb_6kernel5errorNtB2_5Error4name+0x30: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs1cdwasc6FUb_6kernel5errorNtB4_5ErrorNtNtCs5QSdWC790r4_4core3fmt5Debug3fmt+0x8c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel5error9to_result+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel8firmwareNtB4_8Firmware7request+0xb4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel8firmwareNtB4_8Firmware14request_nowarn+0xb4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel8firmwareNtB4_8Firmware4size+0xc: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel8firmwareNtB4_8Firmware4data+0x1c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtNtCs1cdwasc6FUb_6kernel2fs4fileNtB5_9LocalFile4cred+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs5_NtNtCs1cdwasc6FUb_6kernel2fs4fileNtB5_25FileDescriptorReservation19get_unused_fd_flags+0x15: missing int3 after ret
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
   vmlinux.o: warning: objtool: _RNvMNtNtCs1cdwasc6FUb_6kernel3net3phyNtB2_6Device21genphy_read_abilities+0x13: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs2_NtNtCs1cdwasc6FUb_6kernel3net3phyNtB5_12Registration8register+0x5d: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4pageNtB5_4Page8read_raw+0x84: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4pageNtB5_4Page9write_raw+0x84: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4pageNtB5_4Page13fill_zero_raw+0x63: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4pageNtB5_4Page24copy_from_user_slice_raw+0xa0: missing int3 after ret
   vmlinux.o: warning: objtool: rust_fmt_argument+0x69: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs1cdwasc6FUb_6kernel8securityNtB2_11SecurityCtx10from_secid+0xc1: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs1cdwasc6FUb_6kernel8securityNtB2_11SecurityCtx8as_bytes+0x19: missing int3 after ret
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
   vmlinux.o: warning: objtool: _RNvMsg_NtCs1cdwasc6FUb_6kernel3strNtB5_7CString12try_from_fmt+0x147: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsh_NtCs1cdwasc6FUb_6kernel3strNtB5_7CStringNtNtNtCs5QSdWC790r4_4core3ops5deref5Deref5deref+0xd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsi_NtCs1cdwasc6FUb_6kernel3strNtB5_7CStringNtNtNtCs5QSdWC790r4_4core3ops5deref8DerefMut9deref_mut+0xd: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsj_NtCs1cdwasc6FUb_6kernel3strNtB5_7CStringINtNtCs5QSdWC790r4_4core7convert7TryFromRNtB5_4CStrE8try_from+0xd2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4taskNtB5_4Task12group_leader+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4taskNtB5_4Task3pid+0x6: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel4taskNtB5_4Task14signal_pending+0xc: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs1cdwasc6FUb_6kernel5typesuNtB4_14ForeignOwnable12into_foreign+0x5: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel7uaccessNtB4_15UserSliceReader4skip+0x1c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel7uaccessNtB4_15UserSliceReader8read_raw+0x4e: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel7uaccessNtB4_15UserSliceReader10read_slice+0x4e: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel7uaccessNtB4_15UserSliceReader8read_all+0x71: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs0_NtCs1cdwasc6FUb_6kernel7uaccessNtB5_15UserSliceWriter11write_slice+0x4b: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue6system+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue14system_highpri+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue11system_long+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue14system_unbound+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue16system_freezable+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue22system_power_efficient+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel9workqueue32system_freezable_power_efficient+0x7: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsk_Cs2dcoKnfGXnn_4uapiNtB5_13___u128_halvesNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsn_Cs2dcoKnfGXnn_4uapiNtB5_6moduleNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsx_Cs2dcoKnfGXnn_4uapiNtB5_8pi_entryNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret


objdump-func vmlinux.o _RNvXsen_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default:
0000 0000000000084090 <_RNvXsen_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default>:
0000    84090:	53                   	push   %rbx
0001    84091:	ba b0 05 00 00       	mov    $0x5b0,%edx
0006    84096:	31 f6                	xor    %esi,%esi
0008    84098:	48 89 fb             	mov    %rdi,%rbx
000b    8409b:	e8 00 00 00 00       	call   840a0 <_RNvXsen_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6cgroupNtNtCs5QSdWC790r4_4core7default7Default7default+0x10>	8409c: R_X86_64_PLT32	memset-0x4
0010    840a0:	48 89 d8             	mov    %rbx,%rax
0013    840a3:	5b                   	pop    %rbx
0014    840a4:	c3                   	ret
0015    840a5:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
001f    840af:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
