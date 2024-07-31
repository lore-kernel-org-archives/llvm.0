Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA8179A7;
	Wed, 31 Jul 2024 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722443877; cv=none; b=mia6rcPMLUVNlnwkH3WNC84ArC0kMCupqfSqkvtK584MAA1rWJku1jDiJGZo7vtlQzoB2u/8Akz1O0ER6yPMni7ZeRJTSmBuuqKB86kgPddAy+C+UGgvQB28velkESJkCZr3W666BmS+xDjhnurpMWJMbeCTcghHk4uqjtrU+uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722443877; c=relaxed/simple;
	bh=Bg+2+td0oBWC6E/MVzMnK+JhHi1ql14/jbw3xCziqqU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gGkBtNXQ/Veiz4h5Jhvt8wWItUNNI7cz2eOllJ18WxLlPViz7Wk4eI0CEYGFWaoD9OTRo3bz+WY/WR7hv8/idB2dXBgvnYUHUd/VTzLdZNLr57VdNk/4+Vmw3H6Boyl0aPuZL7Kyoa4veTOUDqoL/xReOsQUOlnRSUeT6s/IDww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESPfHisw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESPfHisw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722443874; x=1753979874;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Bg+2+td0oBWC6E/MVzMnK+JhHi1ql14/jbw3xCziqqU=;
  b=ESPfHiswN7UJZaZhHCCjR6fisWy0XVZa7jh6nCh2HbSZMGM3nbQg/4vf
   MNX/M6jPzmpwmJD49+zU7EDUhJ/OprzbEHig6B/dmmXXFLfHVtwBem97c
   25+fRP8GT7wWYiLo7W0DYd7NFw0H5cNWyj7XgrBipuYnFAeA81NJwNKxh
   NUbzDOyGMgBL0DTco56ZnrOURil08oL0jkzXsud4jXjl7rZG2Mj06JUu8
   W2OR5JjprBhzVr6W0HWu3CU8WVhWUFcwz2aeCK/KxxKJA3fkVeFfEZovq
   oI+vvAWk7qBUdCN29V2iBfZJPlHpaLRekADuQv/tMt7qLDD9CbEkBZH5d
   w==;
X-CSE-ConnectionGUID: FXUK9VmeQruapMboanj4BQ==
X-CSE-MsgGUID: 9hLxwQe8TJK/Y3ViFL1bbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="12808828"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="12808828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 09:37:53 -0700
X-CSE-ConnectionGUID: 8ZU9WpPZQuKltCc5a1AGLA==
X-CSE-MsgGUID: /qu9e+abR6ekIBgQzcBPIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59584047"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jul 2024 09:37:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZCKh-000ucC-2i;
	Wed, 31 Jul 2024 16:37:47 +0000
Date: Thu, 1 Aug 2024 00:37:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [gustavoars:testing/wfamnae-next20240729-cbc-2 2/9] vmlinux.o:
 warning: objtool:
 _RNvXsem_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_34cgroup__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14:
 missing int3 after ret
Message-ID: <202408010005.OSdsYKEy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240729-cbc-2
head:   6f5d5055a2db7061b5978354a25957b759ab3636
commit: 492e22d5e1cb004d6f88cefe2804bbaf3ba4ad36 [2/9] cgroup: Avoid -Wflex-array-member-not-at-end warnings
config: x86_64-randconfig-003-20240731 (https://download.01.org/0day-ci/archive/20240801/202408010005.OSdsYKEy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010005.OSdsYKEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010005.OSdsYKEy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: _RNvXs1T_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_36spinlock__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1Z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_28class_raw_spinlock_irqsave_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs29_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14___kernel_timexNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2k_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19kmsan_context_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2l_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9kmsan_ctxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2H_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_21siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2O_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8sigqueueNtNtCs5QSdWC790r4_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2Q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7ksignalNtNtCs5QSdWC790r4_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2V_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_20posix_cputimers_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs31_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9seqlock_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x7a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs34_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9sched_avgNtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs35_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16sched_statisticsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs38_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15sched_dl_entityNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3c_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11task_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3e_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12thread_unionNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3i_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13msr_regs_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3k_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10saved_msrsNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3p_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bpf_raw_event_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11old_timex32NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3r_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14user_namespaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3A_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14maple_range_64NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3N_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12rw_semaphoreNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3W_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11work_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs43_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9srcu_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs45_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10srcu_usageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4c_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18srcu_notifier_headNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4d_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_25arch_uprobe__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4l_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12mm_context_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4A_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19folio__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4E_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs4U_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_23mm_struct__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs52_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13lru_gen_folioNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs53_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16lru_gen_mm_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs54_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15lru_gen_mm_walkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs55_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13lru_gen_memcgNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs56_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_6lruvecNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs57_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13per_cpu_pagesNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs58_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16per_cpu_nodestatNtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs59_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4zoneNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5d_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11pglist_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5v_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10rhashtableNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5K_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_53___kernel_sockaddr_storage__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5N_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_22sockaddr__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs5O_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8sockaddrNtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6f_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18shrinker_info_unitNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6m_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7xa_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6v_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3pidNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6D_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19x86_legacy_featuresNtNtCs5QSdWC790r4_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6E_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16x86_platform_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6F_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14___large_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6U_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs6Z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16hrtimer_cpu_baseNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs79_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14sighand_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7c_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10core_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x72: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7d_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13signal_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7q_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13fs_sysfs_pathNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7y_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5dquotNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7A_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10quota_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7E_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13address_spaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7J_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5inodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7O_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10sb_writersNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7P_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11super_blockNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7V_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18user32_fxsr_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs7X_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x11: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs80_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_42compat_siginfo__bindgen_ty_1__bindgen_ty_5NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs81_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_28compat_siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x79: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs83_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13compat_direntNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs84_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_29compat_sigevent__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x39: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs85_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15compat_sigeventNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs88_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12compat_ifreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8a_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4userNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8m_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19kernfs_global_locksNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8r_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11kernfs_nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8s_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16kernfs_open_fileNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs8D_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15kobj_uevent_envNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs93_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11kunit_suiteNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs95_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_5kunitNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9J_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11device_linkNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9M_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12block_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9O_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bio__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9S_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7bio_setNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs9Z_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19partition_meta_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x6a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa0_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13blk_integrityNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsa5_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13request_queueNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsam_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7requestNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsar_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17blk_mq_queue_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsax_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12sockaddr_in6NtNtCs5QSdWC790r4_4core7default7Default7default+0x21: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsay_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9ipv6_mreqNtNtCs5QSdWC790r4_4core7default7Default7default+0x19: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaA_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_32tc_fq_codel_xstats__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x29: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaB_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_18tc_fq_codel_xstatsNtNtCs5QSdWC790r4_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaD_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_37flow_dissector_key_vlan__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsaG_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_27flow_dissector_key_enc_optsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXscz_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_tunnel_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x31: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdv_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13bpf_flow_keysNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdK_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10sock_fprogNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdS_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_4nodeNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdU_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_3cpuNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsdV_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14text_poke_insnNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseh_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_9psi_groupNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsej_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19cgroup_subsys_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsem_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_34cgroup__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXseq_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11cgroup_rootNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXseC_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16backing_dev_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXseT_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7bpf_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXseU_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_17bpf_offloaded_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsf5_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_8bpf_ksymNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsf7_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_15bpf_tramp_imageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsfc_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_dispatcherNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsfl_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12bpf_prog_auxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsfy_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14bpf_struct_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfO_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_31bpf_iter_aux_info__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsg7_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_14compat_rtentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsg8_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_16compat_group_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgb_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgd_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_19compat_group_filterNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsge_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_11scm_fp_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgs_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgv_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_13ethtool_flashNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsgw_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_20ethtool_per_queue_opNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXshd_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12dmi_strmatchNtNtCs5QSdWC790r4_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsho_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_12led_classdevNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXshy_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_7mii_busNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXshz_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_10phy_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placeNtNtCs1cdwasc6FUb_6kernel3str12RawFormatterEBK_+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RINvNtCs5QSdWC790r4_4core3ptr13drop_in_placelECs1cdwasc6FUb_6kernel+0x0: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvYNtNtCs1cdwasc6FUb_6kernel3str12RawFormatterNtNtCs5QSdWC790r4_4core3fmt5Write10write_charB6_+0x117: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvYNtNtCs1cdwasc6FUb_6kernel3str9FormatterNtNtCs5QSdWC790r4_4core3fmt5Write10write_charB6_+0x125: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXNtNtCs1cdwasc6FUb_6kernel5alloc7vec_extINtNtCscg2doA4GLaz_5alloc3vec3VechEINtB2_6VecExthE7reserveB6_+0x131: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs1cdwasc6FUb_6kernel6deviceNtB2_6Device8from_raw+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMNtCs1cdwasc6FUb_6kernel5errorNtB2_5Error4name+0x30: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NtCs1cdwasc6FUb_6kernel5errorNtB4_5ErrorNtNtCs5QSdWC790r4_4core3fmt5Debug3fmt+0x8c: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvNtCs1cdwasc6FUb_6kernel5error9to_result+0x8: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel8firmwareNtB4_8Firmware7request+0xb4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel8firmwareNtB4_8Firmware14request_nowarn+0xb4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel8firmwareNtB4_8Firmware4size+0xc: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvMs_NtCs1cdwasc6FUb_6kernel8firmwareNtB4_8Firmware4data+0x1c: missing int3 after ret
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
   vmlinux.o: warning: objtool: _RNvXsy_Cs2dcoKnfGXnn_4uapiNtB5_15file_operationsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsz_Cs2dcoKnfGXnn_4uapiNtB5_14___kernel_timexNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsT_Cs2dcoKnfGXnn_4uapiNtB5_25__fpstate_32__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsV_Cs2dcoKnfGXnn_4uapiNtB5_11__fpstate_32NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs10_Cs2dcoKnfGXnn_4uapiNtB6_11class_irq_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs11_Cs2dcoKnfGXnn_4uapiNtB6_15class_irqsave_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs12_Cs2dcoKnfGXnn_4uapiNtB6_26fxregs_state__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x12: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs13_Cs2dcoKnfGXnn_4uapiNtB6_26fxregs_state__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x32: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs14_Cs2dcoKnfGXnn_4uapiNtB6_12fxregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs15_Cs2dcoKnfGXnn_4uapiNtB6_12swregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs16_Cs2dcoKnfGXnn_4uapiNtB6_11reg_512_bitNtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs17_Cs2dcoKnfGXnn_4uapiNtB6_13reg_1024_byteNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1c_Cs2dcoKnfGXnn_4uapiNtB6_11xregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1d_Cs2dcoKnfGXnn_4uapiNtB6_12fpregs_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
--
   vmlinux.o: warning: objtool: _RNvXs1s_Cs2dcoKnfGXnn_4uapiNtB6_13thread_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1A_Cs2dcoKnfGXnn_4uapiNtB6_17codetag_type_descNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1H_Cs2dcoKnfGXnn_4uapiNtB6_32___call_single_node__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x2: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1K_Cs2dcoKnfGXnn_4uapiNtB6_9alloc_tagNtNtCs5QSdWC790r4_4core7default7Default7default+0x2a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1N_Cs2dcoKnfGXnn_4uapiNtB6_41restart_block__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x1a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1Q_Cs2dcoKnfGXnn_4uapiNtB6_13restart_blockNtNtCs5QSdWC790r4_4core7default7Default7default+0x3a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1T_Cs2dcoKnfGXnn_4uapiNtB6_19kmsan_context_stateNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1U_Cs2dcoKnfGXnn_4uapiNtB6_9kmsan_ctxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs1V_Cs2dcoKnfGXnn_4uapiNtB6_36spinlock__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x42: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs27_Cs2dcoKnfGXnn_4uapiNtB6_10timer_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x52: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2j_Cs2dcoKnfGXnn_4uapiNtB6_21siginfo__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2x_Cs2dcoKnfGXnn_4uapiNtB6_20posix_cputimers_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2D_Cs2dcoKnfGXnn_4uapiNtB6_9seqlock_tNtNtCs5QSdWC790r4_4core7default7Default7default+0x7a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2F_Cs2dcoKnfGXnn_4uapiNtB6_5vtimeNtNtCs5QSdWC790r4_4core7default7Default7default+0x5a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2G_Cs2dcoKnfGXnn_4uapiNtB6_9sched_avgNtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2H_Cs2dcoKnfGXnn_4uapiNtB6_16sched_statisticsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2K_Cs2dcoKnfGXnn_4uapiNtB6_15sched_dl_entityNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2O_Cs2dcoKnfGXnn_4uapiNtB6_11task_structNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs2Q_Cs2dcoKnfGXnn_4uapiNtB6_12thread_unionNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3a_Cs2dcoKnfGXnn_4uapiNtB6_13msr_regs_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3c_Cs2dcoKnfGXnn_4uapiNtB6_10saved_msrsNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3g_Cs2dcoKnfGXnn_4uapiNtB6_10tracepointNtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3h_Cs2dcoKnfGXnn_4uapiNtB6_17bpf_raw_event_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x22: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3i_Cs2dcoKnfGXnn_4uapiNtB6_11old_timex32NtNtCs5QSdWC790r4_4core7default7Default7default+0x82: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3j_Cs2dcoKnfGXnn_4uapiNtB6_14user_namespaceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3o_Cs2dcoKnfGXnn_4uapiNtB6_10rhashtableNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3B_Cs2dcoKnfGXnn_4uapiNtB6_11maple_allocNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3M_Cs2dcoKnfGXnn_4uapiNtB6_12rw_semaphoreNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs3X_Cs2dcoKnfGXnn_4uapiNtB6_12delayed_workNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs43_Cs2dcoKnfGXnn_4uapiNtB6_9srcu_dataNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
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
>> vmlinux.o: warning: objtool: _RNvXsdA_Cs2dcoKnfGXnn_4uapiNtB6_34cgroup__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsdE_Cs2dcoKnfGXnn_4uapiNtB6_11cgroup_rootNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsdQ_Cs2dcoKnfGXnn_4uapiNtB6_16backing_dev_infoNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsdR_Cs2dcoKnfGXnn_4uapiNtB6_12block_deviceNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsdT_Cs2dcoKnfGXnn_4uapiNtB6_17bio__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x0: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXseb_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsec_Cs2dcoKnfGXnn_4uapiNtB6_17bpf_offloaded_mapNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsen_Cs2dcoKnfGXnn_4uapiNtB6_8bpf_ksymNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXsep_Cs2dcoKnfGXnn_4uapiNtB6_15bpf_tramp_imageNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
>> vmlinux.o: warning: objtool: _RNvXseu_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_dispatcherNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseD_Cs2dcoKnfGXnn_4uapiNtB6_12bpf_prog_auxNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXseQ_Cs2dcoKnfGXnn_4uapiNtB6_14bpf_struct_opsNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsf6_Cs2dcoKnfGXnn_4uapiNtB6_31bpf_iter_aux_info__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfo_Cs2dcoKnfGXnn_4uapiNtB6_7bpf_keyNtNtCs5QSdWC790r4_4core7default7Default7default+0x4: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfp_Cs2dcoKnfGXnn_4uapiNtB6_14compat_rtentryNtNtCs5QSdWC790r4_4core7default7Default7default+0x59: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfq_Cs2dcoKnfGXnn_4uapiNtB6_16compat_group_reqNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsft_Cs2dcoKnfGXnn_4uapiNtB6_47compat_group_filter__bindgen_ty_1__bindgen_ty_2NtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfv_Cs2dcoKnfGXnn_4uapiNtB6_19compat_group_filterNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfw_Cs2dcoKnfGXnn_4uapiNtB6_11scm_fp_listNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfK_Cs2dcoKnfGXnn_4uapiNtB6_41ethtool_rx_ntuple_flow_spec__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x4a: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXsfN_Cs2dcoKnfGXnn_4uapiNtB6_13ethtool_flashNtNtCs5QSdWC790r4_4core7default7Default7default+0x14: missing int3 after ret
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
   vmlinux.o: warning: objtool: _RNvNvNvNvCsgxAQYCfdR72_25doctests_kernel_generated30rust_doctest_kernel_types_rs_24main61__doctest_main__kbuild_src_consumer_rust_kernel_types_rs_154_08example3+0x1aa: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_uaccess_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_uaccess_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_0+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: _RNvXs_NvNvNvCsgxAQYCfdR72_25doctests_kernel_generated34rust_doctest_kernel_workqueue_rs_04main64__doctest_main__kbuild_src_consumer_rust_kernel_workqueue_rs_35_0NtB4_8MyStructNtNtCs1cdwasc6FUb_6kernel9workqueue8WorkItem3run+0x85: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_1+0x3f: missing int3 after ret
   vmlinux.o: warning: objtool: rust_doctest_kernel_workqueue_rs_2+0x3f: missing int3 after ret


objdump-func vmlinux.o _RNvXsem_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_34cgroup__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default:
0000 0000000000084050 <_RNvXsem_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_34cgroup__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default>:
0000    84050:	53                   	push   %rbx
0001    84051:	ba b0 05 00 00       	mov    $0x5b0,%edx
0006    84056:	31 f6                	xor    %esi,%esi
0008    84058:	48 89 fb             	mov    %rdi,%rbx
000b    8405b:	e8 00 00 00 00       	call   84060 <_RNvXsem_NtCs1c52SCZ2Jyz_8bindings12bindings_rawNtB6_34cgroup__bindgen_ty_1__bindgen_ty_1NtNtCs5QSdWC790r4_4core7default7Default7default+0x10>	8405c: R_X86_64_PLT32	memset-0x4
0010    84060:	48 89 d8             	mov    %rbx,%rax
0013    84063:	5b                   	pop    %rbx
0014    84064:	c3                   	ret
0015    84065:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
001f    8406f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
