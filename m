Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5B723CB;
	Sat,  3 Aug 2024 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722683803; cv=none; b=geuLwszB9KzyTYWrffdhkKJ76Pd8sLKCqX+vm9MceUi6vCwqHrlyAEiDielQqh4VowJK/KyC4tkjJVgQNbk0PRCm5I+SozBiC1oBfQ8aOyiua+hsqoW2IfYVRYqHCf9WFy55ObpENehmtMTC5syZK09SPP2cK75NcCvYn7jNZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722683803; c=relaxed/simple;
	bh=pctDb45RUEG4ziraQ6sfkIWvjV3F7vQF8p7e+VuYV+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3LOBDDWSCUiz0jmo29W2apq0jl5jNfUaRxaBtUV6Dcg2CfQ61OZv93t0s6P67E6/poNAzNXhHWnZSa1c72zVCjHNQ2yxW1r6jxopu0/zvRO911fk0DgAV2jFYbl6aie4HRCUvm5Ponmqo0lOCxxLCL328XLOC/cxvxgGAnu0yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzlmN6mi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzlmN6mi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722683800; x=1754219800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pctDb45RUEG4ziraQ6sfkIWvjV3F7vQF8p7e+VuYV+c=;
  b=UzlmN6mi57yE/USK7Z+KiZue1KQT6ohyeBn5Q8CczJEFmHLNZ7sxiFiD
   e11uYCfcIcbK/nr/8iYkNx1yjBzI9t9sEK5B+rEvsGwV8rQWubJwobqwp
   K0Tg2hYtYMjl7Fxc9CQ5EJDTiS2EfLi7dQOV6A6wgQ5MGp5duYoObn6fU
   5aK0IO+uWM1ENqT6m/JCsAlA1k4bKxXynKno0FldI3ayChPcJSILY3KTS
   +zfCjax6CQaOWO0u/jqk3kYGVZ7jya0FgmstM9RQm4atEPLDyXqvHNcs2
   vDb5QsDR8h2J3XSkW+mWP2UaYvi9c1GgnJlwztamlM27YYcjtG0W0iNkR
   A==;
X-CSE-ConnectionGUID: Tok14vLoQ3W//U5CoHAizw==
X-CSE-MsgGUID: gGAgwupOTbuVis5++tnIsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20277714"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20277714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 04:16:39 -0700
X-CSE-ConnectionGUID: xd6mutX8QxKFE5R473WTBA==
X-CSE-MsgGUID: /prwVh/UQbeXj/+yBark3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="55339810"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Aug 2024 04:16:38 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saCiv-0000PG-1r;
	Sat, 03 Aug 2024 11:15:21 +0000
Date: Sat, 3 Aug 2024 19:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.11-rc1 114/128]
 arch/x86/include/asm/resctrl.h:53:20: error: static declaration of
 'resctrl_arch_alloc_capable' follows non-static declaration
Message-ID: <202408031925.AutFsRLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.11-rc1
head:   063bc546005302904092c158fe3228dc8af798a9
commit: f6cf53b477a878020ffbcbfcfc4bc520d6b5332a [114/128] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: x86_64-buildonly-randconfig-006-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031925.AutFsRLT-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031925.AutFsRLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031925.AutFsRLT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:53:20: error: static declaration of 'resctrl_arch_alloc_capable' follows non-static declaration
      53 | static inline bool resctrl_arch_alloc_capable(void)
         |                    ^
   include/linux/arm_mpam.h:54:6: note: previous declaration is here
      54 | bool resctrl_arch_alloc_capable(void);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:58:20: error: redefinition of 'resctrl_arch_enable_alloc'
      58 | static inline void resctrl_arch_enable_alloc(void)
         |                    ^
   include/linux/arm_mpam.h:92:20: note: previous definition is here
      92 | static inline void resctrl_arch_enable_alloc(void) { }
         |                    ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:64:20: error: redefinition of 'resctrl_arch_disable_alloc'
      64 | static inline void resctrl_arch_disable_alloc(void)
         |                    ^
   include/linux/arm_mpam.h:93:20: note: previous definition is here
      93 | static inline void resctrl_arch_disable_alloc(void) { }
         |                    ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:70:20: error: static declaration of 'resctrl_arch_mon_capable' follows non-static declaration
      70 | static inline bool resctrl_arch_mon_capable(void)
         |                    ^
   include/linux/arm_mpam.h:55:6: note: previous declaration is here
      55 | bool resctrl_arch_mon_capable(void);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:75:20: error: redefinition of 'resctrl_arch_enable_mon'
      75 | static inline void resctrl_arch_enable_mon(void)
         |                    ^
   include/linux/arm_mpam.h:90:20: note: previous definition is here
      90 | static inline void resctrl_arch_enable_mon(void) { }
         |                    ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:81:20: error: redefinition of 'resctrl_arch_disable_mon'
      81 | static inline void resctrl_arch_disable_mon(void)
         |                    ^
   include/linux/arm_mpam.h:91:20: note: previous definition is here
      91 | static inline void resctrl_arch_disable_mon(void) { }
         |                    ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:87:20: error: static declaration of 'resctrl_arch_is_llc_occupancy_enabled' follows non-static declaration
      87 | static inline bool resctrl_arch_is_llc_occupancy_enabled(void)
         |                    ^
   include/linux/arm_mpam.h:56:6: note: previous declaration is here
      56 | bool resctrl_arch_is_llc_occupancy_enabled(void);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:92:20: error: static declaration of 'resctrl_arch_is_mbm_total_enabled' follows non-static declaration
      92 | static inline bool resctrl_arch_is_mbm_total_enabled(void)
         |                    ^
   include/linux/arm_mpam.h:58:6: note: previous declaration is here
      58 | bool resctrl_arch_is_mbm_total_enabled(void);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:97:20: error: static declaration of 'resctrl_arch_is_mbm_local_enabled' follows non-static declaration
      97 | static inline bool resctrl_arch_is_mbm_local_enabled(void)
         |                    ^
   include/linux/arm_mpam.h:57:6: note: previous declaration is here
      57 | bool resctrl_arch_is_mbm_local_enabled(void);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:146:28: error: redefinition of 'resctrl_arch_round_mon_val'
     146 | static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
         |                            ^
   include/linux/arm_mpam.h:43:28: note: previous definition is here
      43 | static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
         |                            ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:155:20: error: static declaration of 'resctrl_arch_set_cpu_default_closid_rmid' follows non-static declaration
     155 | static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
         |                    ^
   include/linux/arm_mpam.h:65:6: note: previous declaration is here
      65 | void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 pmg);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:162:20: error: static declaration of 'resctrl_arch_set_closid_rmid' follows non-static declaration
     162 | static inline void resctrl_arch_set_closid_rmid(struct task_struct *tsk,
         |                    ^
   include/linux/arm_mpam.h:64:6: note: previous declaration is here
      64 | void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:169:20: error: static declaration of 'resctrl_arch_match_closid' follows non-static declaration
     169 | static inline bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
         |                    ^
   include/linux/arm_mpam.h:69:6: note: previous declaration is here
      69 | bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:174:20: error: static declaration of 'resctrl_arch_match_rmid' follows non-static declaration
     174 | static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
         |                    ^
   include/linux/arm_mpam.h:70:6: note: previous declaration is here
      70 | bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:180:20: error: static declaration of 'resctrl_arch_sched_in' follows non-static declaration
     180 | static inline void resctrl_arch_sched_in(struct task_struct *tsk)
         |                    ^
   include/linux/arm_mpam.h:66:6: note: previous declaration is here
      66 | void resctrl_arch_sched_in(struct task_struct *tsk);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:186:19: error: static declaration of 'resctrl_arch_system_num_rmid_idx' follows non-static declaration
     186 | static inline u32 resctrl_arch_system_num_rmid_idx(void)
         |                   ^
   include/linux/arm_mpam.h:73:5: note: previous declaration is here
      73 | u32 resctrl_arch_system_num_rmid_idx(void);
         |     ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:192:20: error: static declaration of 'resctrl_arch_rmid_idx_decode' follows non-static declaration
     192 | static inline void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
         |                    ^
   include/linux/arm_mpam.h:72:6: note: previous declaration is here
      72 | void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
         |      ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:198:19: error: static declaration of 'resctrl_arch_rmid_idx_encode' follows non-static declaration
     198 | static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
         |                   ^
   include/linux/arm_mpam.h:71:5: note: previous declaration is here
      71 | u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
         |     ^
   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:15:
   In file included from include/linux/resctrl.h:13:
>> arch/x86/include/asm/resctrl.h:205:21: error: static declaration of 'resctrl_arch_mon_ctx_alloc' follows non-static declaration
     205 | static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid)
         |                     ^
   include/linux/arm_mpam.h:76:7: note: previous declaration is here
      76 | void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
         |       ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/resctrl_arch_alloc_capable +53 arch/x86/include/asm/resctrl.h

0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25   52  
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @53  static inline bool resctrl_arch_alloc_capable(void)
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   54  {
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   55  	return rdt_alloc_capable;
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   56  }
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   57  
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @58  static inline void resctrl_arch_enable_alloc(void)
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   59  {
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   60  	static_branch_enable_cpuslocked(&rdt_alloc_enable_key);
0a2f4d9b548c5b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   61  	static_branch_inc_cpuslocked(&rdt_enable_key);
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   62  }
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   63  
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @64  static inline void resctrl_arch_disable_alloc(void)
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   65  {
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   66  	static_branch_disable_cpuslocked(&rdt_alloc_enable_key);
0a2f4d9b548c5b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   67  	static_branch_dec_cpuslocked(&rdt_enable_key);
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   68  }
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   69  
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @70  static inline bool resctrl_arch_mon_capable(void)
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   71  {
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   72  	return rdt_mon_capable;
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   73  }
30017b60706c2b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   74  
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @75  static inline void resctrl_arch_enable_mon(void)
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   76  {
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   77  	static_branch_enable_cpuslocked(&rdt_mon_enable_key);
0a2f4d9b548c5b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   78  	static_branch_inc_cpuslocked(&rdt_enable_key);
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   79  }
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   80  
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  @81  static inline void resctrl_arch_disable_mon(void)
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   82  {
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   83  	static_branch_disable_cpuslocked(&rdt_mon_enable_key);
0a2f4d9b548c5b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   84  	static_branch_dec_cpuslocked(&rdt_enable_key);
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   85  }
5db6a4a75c95f6 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13   86  
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20  @87  static inline bool resctrl_arch_is_llc_occupancy_enabled(void)
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   88  {
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   89  	return (rdt_mon_features & (1 << QOS_L3_OCCUP_EVENT_ID));
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   90  }
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   91  
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20  @92  static inline bool resctrl_arch_is_mbm_total_enabled(void)
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   93  {
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   94  	return (rdt_mon_features & (1 << QOS_L3_MBM_TOTAL_EVENT_ID));
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   95  }
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   96  
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20  @97  static inline bool resctrl_arch_is_mbm_local_enabled(void)
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   98  {
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20   99  	return (rdt_mon_features & (1 << QOS_L3_MBM_LOCAL_EVENT_ID));
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20  100  }
7c2279f3f6175e arch/x86/include/asm/resctrl.h         James Morse        2019-03-20  101  
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  102  /*
352940ececaca5 arch/x86/include/asm/resctrl_sched.h   Babu Moger         2018-11-21  103   * __resctrl_sched_in() - Writes the task's CLOSid/RMID to IA32_PQR_MSR
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  104   *
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  105   * Following considerations are made so that this has minimal impact
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  106   * on scheduler hot path:
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  107   * - This will stay as no-op unless we are running on an Intel SKU
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  108   *   which supports resource control or monitoring and we enable by
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  109   *   mounting the resctrl file system.
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  110   * - Caches the per cpu CLOSid/RMID values and does the MSR write only
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  111   *   when a task with a different CLOSid/RMID is scheduled in.
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  112   * - We allocate RMIDs/CLOSids globally in order to keep this as
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  113   *   simple as possible.
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  114   * Must be called with preemption disabled.
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  115   */
7fef099702527c arch/x86/include/asm/resctrl.h         Linus Torvalds     2023-03-07  116  static inline void __resctrl_sched_in(struct task_struct *tsk)
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  117  {
352940ececaca5 arch/x86/include/asm/resctrl_sched.h   Babu Moger         2018-11-21  118  	struct resctrl_pqr_state *state = this_cpu_ptr(&pqr_state);
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26  119  	u32 closid = READ_ONCE(state->default_closid);
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26  120  	u32 rmid = READ_ONCE(state->default_rmid);
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  121  	u32 tmp;
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  122  
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  123  	/*
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  124  	 * If this task has a closid/rmid assigned, use it.
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  125  	 * Else use the closid/rmid assigned to this cpu.
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  126  	 */
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  127  	if (static_branch_likely(&rdt_alloc_enable_key)) {
7fef099702527c arch/x86/include/asm/resctrl.h         Linus Torvalds     2023-03-07  128  		tmp = READ_ONCE(tsk->closid);
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  129  		if (tmp)
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  130  			closid = tmp;
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  131  	}
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  132  
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  133  	if (static_branch_likely(&rdt_mon_enable_key)) {
7fef099702527c arch/x86/include/asm/resctrl.h         Linus Torvalds     2023-03-07  134  		tmp = READ_ONCE(tsk->rmid);
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  135  		if (tmp)
6d3b47ddffed70 arch/x86/include/asm/resctrl.h         Valentin Schneider 2020-12-17  136  			rmid = tmp;
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  137  	}
748b6b881ccdda arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  138  
a9110b552d44fe arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-08-09  139  	if (closid != state->cur_closid || rmid != state->cur_rmid) {
a9110b552d44fe arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-08-09  140  		state->cur_closid = closid;
a9110b552d44fe arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-08-09  141  		state->cur_rmid = rmid;
97fa21f65c3eb5 arch/x86/include/asm/resctrl.h         Borislav Petkov    2022-11-06  142  		wrmsr(MSR_IA32_PQR_ASSOC, rmid, closid);
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  143  	}
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  144  }
0583020456cea9 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  145  
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02 @146  static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  147  {
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  148  	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  149  
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  150  	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  151  	val /= scale;
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  152  	return val * scale;
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  153  }
ae2328b5296253 arch/x86/include/asm/resctrl.h         James Morse        2022-09-02  154  
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26 @155  static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26  156  							    u32 rmid)
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26  157  {
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26  158  	WRITE_ONCE(per_cpu(pqr_state.default_closid, cpu), closid);
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26  159  	WRITE_ONCE(per_cpu(pqr_state.default_rmid, cpu), rmid);
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26  160  }
64c5e6c8b1589e arch/x86/include/asm/resctrl.h         James Morse        2024-04-26  161  
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @162  static inline void resctrl_arch_set_closid_rmid(struct task_struct *tsk,
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  163  						u32 closid, u32 rmid)
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  164  {
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  165  	WRITE_ONCE(tsk->closid, closid);
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  166  	WRITE_ONCE(tsk->rmid, rmid);
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  167  }
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  168  
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @169  static inline bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid)
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  170  {
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  171  	return READ_ONCE(tsk->closid) == closid;
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  172  }
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  173  
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @174  static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  175  					   u32 rmid)
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  176  {
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  177  	return READ_ONCE(tsk->rmid) == rmid;
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  178  }
6eca639d8340b5 arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  179  
4d3d23f54d5bd7 arch/x86/include/asm/resctrl.h         James Morse        2024-04-26 @180  static inline void resctrl_arch_sched_in(struct task_struct *tsk)
4be6c078428b08 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  181  {
4be6c078428b08 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  182  	if (static_branch_likely(&rdt_enable_key))
7fef099702527c arch/x86/include/asm/resctrl.h         Linus Torvalds     2023-03-07  183  		__resctrl_sched_in(tsk);
4be6c078428b08 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  184  }
4be6c078428b08 arch/x86/include/asm/intel_rdt_sched.h Vikas Shivappa     2017-07-25  185  
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @186  static inline u32 resctrl_arch_system_num_rmid_idx(void)
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  187  {
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  188  	/* RMID are independent numbers for x86. num_rmid_idx == num_rmid */
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  189  	return boot_cpu_data.x86_cache_max_rmid + 1;
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  190  }
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  191  
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @192  static inline void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  193  {
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  194  	*rmid = idx;
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  195  	*closid = X86_RESCTRL_EMPTY_CLOSID;
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  196  }
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  197  
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @198  static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  199  {
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  200  	return rmid;
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  201  }
6791e0ea30711b arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  202  
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  203  /* x86 can always read an rmid, nothing needs allocating */
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  204  struct rdt_resource;
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13 @205  static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid)
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  206  {
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  207  	might_sleep();
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  208  	return NULL;
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  209  };
e557999f80a5ee arch/x86/include/asm/resctrl.h         James Morse        2024-02-13  210  

:::::: The code at line 53 was first introduced by commit
:::::: 30017b60706c2ba72a0a4da7d5ef8f5fa95a2f01 x86/resctrl: Add helpers for system wide mon/alloc capable

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
