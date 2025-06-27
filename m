Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE352D29A9;
	Fri, 27 Jun 2025 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027703; cv=none; b=OWWhXLR+95hEKFQkf3hUmr7Sx3I3++f2p8ioHt5k3IirnX+3vR9AOZXu6luFfVuBp5K4F8S2QJkeNmhO27Et/WarivDxeV36b5ZNz+nx4JDYm10WfF0vDe4d4OUSNzkCR0C6ndA/5bhdqSYARY3tBnkdk+dm9xNM516KQb+9+WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027703; c=relaxed/simple;
	bh=lAbjC1rMmOpw3Y5SIUdpktKEiwkYb7MTJbo/4rGAvsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RibeuEMltRTnxsYUw3nwU0ARn1YxAcqGU+nql0lflK/hiNkeLRrq7YFnX0yPcicBAJNxUpKaxHysc1Q/YLnXlFvUtkVcA/vU87A0Q0s+t9kW1IDWiGNRAeJcVzDw40mistaUZ1ENZOwquJOMMfL05IXvm51kVxCfnz4W8gBXmas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OA4U/vcF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OA4U/vcF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751027702; x=1782563702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lAbjC1rMmOpw3Y5SIUdpktKEiwkYb7MTJbo/4rGAvsM=;
  b=OA4U/vcFViWmjx7uPDFhC1n6umjqyTDwZrp2xWc7oo7ATnjmyGwhilhV
   QtudT1R7smj2/t10vfaJ2DB87/3GBouiwjtwSrPPwGuHZ/YVSp1zOb+v8
   dWxfUHjvHHFO5c9RSYUMWEuNldRm0+BTvjJuP58GCRRXGvOgjQs+3GF/1
   gfeFwzbCXgPH0iJACk9YOHZJP6d+QZ9V5wjKq5TrzZdKDiTeBJiDkE2qo
   vXX+DextWmDV8wIfdCxy/TFEGKyuUYF1eXA68d/1cvwZQ/qWCDSaN60nt
   vYxuQWCy2U9ytqD2LS9BSLP99G+MFY3PGrk7wL4ZSt2sRB5ybDHa40cM3
   A==;
X-CSE-ConnectionGUID: 7wsC/UpHTYm78qW9HWAtmg==
X-CSE-MsgGUID: cnOlclHNTPq8IOJd703Tbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52458923"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="52458923"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:35:01 -0700
X-CSE-ConnectionGUID: Ecej+RiLT062BvHRv6nqPA==
X-CSE-MsgGUID: TygrQ0gfTjeljWcCgm8jFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157176713"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2025 05:34:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV8IB-000WA8-1F;
	Fri, 27 Jun 2025 12:34:55 +0000
Date: Fri, 27 Jun 2025 20:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Potapenko <glider@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 07/11] kcov: add trace and trace_size to struct
 kcov_state
Message-ID: <202506271946.HACEE9U0-lkp@intel.com>
References: <20250626134158.3385080-8-glider@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626134158.3385080-8-glider@google.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[cannot apply to akpm-mm/mm-everything tip/sched/core arnd-asm-generic/master akpm-mm/mm-nonmm-unstable masahiroy-kbuild/for-next masahiroy-kbuild/fixes shuah-kselftest/next shuah-kselftest/fixes linus/master mcgrof/modules-next v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenko/x86-kcov-disable-instrumentation-of-arch-x86-kernel-tsc-c/20250626-214703
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250626134158.3385080-8-glider%40google.com
patch subject: [PATCH v2 07/11] kcov: add trace and trace_size to struct kcov_state
config: x86_64-buildonly-randconfig-004-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271946.HACEE9U0-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271946.HACEE9U0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271946.HACEE9U0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kcov.c:1013:15: warning: variable 'trace' set but not used [-Wunused-but-set-variable]
    1013 |         void *area, *trace;
         |                      ^
>> kernel/kcov.c:1014:21: warning: variable 'trace_size' set but not used [-Wunused-but-set-variable]
    1014 |         unsigned int size, trace_size;
         |                            ^
   2 warnings generated.


vim +/trace +1013 kernel/kcov.c

  1006	
  1007	/* See the comment before kcov_remote_start() for usage details. */
  1008	void kcov_remote_stop(void)
  1009	{
  1010		struct task_struct *t = current;
  1011		struct kcov *kcov;
  1012		unsigned int mode;
> 1013		void *area, *trace;
> 1014		unsigned int size, trace_size;
  1015		int sequence;
  1016		unsigned long flags;
  1017	
  1018		if (!in_task() && !in_softirq_really())
  1019			return;
  1020	
  1021		local_lock_irqsave(&kcov_percpu_data.lock, flags);
  1022	
  1023		mode = READ_ONCE(t->kcov_mode);
  1024		barrier();
  1025		if (!kcov_mode_enabled(mode)) {
  1026			local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
  1027			return;
  1028		}
  1029		/*
  1030		 * When in softirq, check if the corresponding kcov_remote_start()
  1031		 * actually found the remote handle and started collecting coverage.
  1032		 */
  1033		if (in_serving_softirq() && !t->kcov_softirq) {
  1034			local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
  1035			return;
  1036		}
  1037		/* Make sure that kcov_softirq is only set when in softirq. */
  1038		if (WARN_ON(!in_serving_softirq() && t->kcov_softirq)) {
  1039			local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
  1040			return;
  1041		}
  1042	
  1043		kcov = t->kcov;
  1044		area = t->kcov_state.area;
  1045		size = t->kcov_state.size;
  1046		trace = t->kcov_state.trace;
  1047		trace_size = t->kcov_state.trace_size;
  1048		sequence = t->kcov_state.sequence;
  1049	
  1050		kcov_stop(t);
  1051		if (in_serving_softirq()) {
  1052			t->kcov_softirq = 0;
  1053			kcov_remote_softirq_stop(t);
  1054		}
  1055	
  1056		spin_lock(&kcov->lock);
  1057		/*
  1058		 * KCOV_DISABLE could have been called between kcov_remote_start()
  1059		 * and kcov_remote_stop(), hence the sequence check.
  1060		 */
  1061		if (sequence == kcov->state.sequence && kcov->remote)
  1062			kcov_move_area(kcov->mode, kcov->state.area, kcov->state.size,
  1063				       area);
  1064		spin_unlock(&kcov->lock);
  1065	
  1066		if (in_task()) {
  1067			spin_lock(&kcov_remote_lock);
  1068			kcov_remote_area_put(area, size);
  1069			spin_unlock(&kcov_remote_lock);
  1070		}
  1071	
  1072		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
  1073	
  1074		/* Get in kcov_remote_start(). */
  1075		kcov_put(kcov);
  1076	}
  1077	EXPORT_SYMBOL(kcov_remote_stop);
  1078	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
