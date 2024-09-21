Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CED126C05;
	Sat, 21 Sep 2024 05:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726897052; cv=none; b=sFItlrYYtzpS7SMuxozVEqIJ9drFK+Krt+FZzet/eYZVfT/4macU92sNr0spBGFveNcQCH/r9mZHpNN3hrJVxOE4Y/kZnpEAUErMf1S+ZWe7xMgNM6rfJx+FAoqz+LWcQfQoAUFGgz9tZ4lNpI2oniC9/kY6FY19GlZZPAvWLHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726897052; c=relaxed/simple;
	bh=OzPfrbHuv8bkhXdtJqj5aXZCbt68fD+trSyswf0TPzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFYMZYQwqwJdz6GZ0sfRVzrWW/S3lV1S8MEeQZ7MXODij69Xjg6TS+YwxCoSlIEp4117kPIFsknrlewm83RFfP908ZOAJ3wptECFg7a5xy/JGappbGg9qALdiIwUBV9mpzDeDIxB5UZqHrTEVrnxvr2jmPNzr3RQ9hPtltCPMo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9Y34+Nt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9Y34+Nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726897051; x=1758433051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OzPfrbHuv8bkhXdtJqj5aXZCbt68fD+trSyswf0TPzk=;
  b=l9Y34+NtgS6TnxgeySbW8hVgGoPBXhctXOeloIVVvExIdVkxypwGQAs4
   qSbdxfJ/PVO6Cru3vzFLjo8bLRmFJF3k9kkqC9WVI9u3N18Tx7XX+FLDe
   U/ZBxyEBtWisJPQiYuUfy5NMP0gnUuL8DB7/TVjkTm0BECTHlrVSHXI1c
   SbsLPZRAer2j7adlahMer30gGLnJVvF8l/fcUepFnN/mKxn92azIjQu5J
   KIiyY3+amVvisKAZvXBzoaSAX3EtjRhX65RN3kKl1m4No+O6/jtjK+E0a
   0sfMNSPW0UPsBWXbxdlsG63CV173pwSXllPRGoUsTLEjF0YV5vbFg36w5
   g==;
X-CSE-ConnectionGUID: QjJfzdFIT4+g6G5G1rj3Lw==
X-CSE-MsgGUID: Xy/FmrVKR2ibaV2xl/gJjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36496109"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="36496109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 22:37:30 -0700
X-CSE-ConnectionGUID: s/fZxp0RStiMB1sMLnVkTA==
X-CSE-MsgGUID: C93V+uMwQB2yTbHPM0m1HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="70112950"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2024 22:37:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srsoA-000F95-21;
	Sat, 21 Sep 2024 05:37:26 +0000
Date: Sat, 21 Sep 2024 13:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] cpu/bugs: cgroup: Add a cgroup knob to bypass
 CPU mitigations
Message-ID: <202409211355.QTGhbQvW-lkp@intel.com>
References: <20240919-selective-mitigation-v1-2-1846cf41895e@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919-selective-mitigation-v1-2-1846cf41895e@linux.intel.com>

Hi Pawan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 98f7e32f20d28ec452afb208f9cffc08448a2652]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawan-Gupta/x86-entry_64-Add-a-separate-unmitigated-entry-exit-path/20240920-055414
base:   98f7e32f20d28ec452afb208f9cffc08448a2652
patch link:    https://lore.kernel.org/r/20240919-selective-mitigation-v1-2-1846cf41895e%40linux.intel.com
patch subject: [PATCH RFC 2/2] cpu/bugs: cgroup: Add a cgroup knob to bypass CPU mitigations
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240921/202409211355.QTGhbQvW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211355.QTGhbQvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211355.QTGhbQvW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/bugs.c:147:36: error: use of undeclared identifier 'entry_SYSCALL_64_unmitigated'
     147 |                 wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64_unmitigated);
         |                                                  ^
>> arch/x86/kernel/cpu/bugs.c:149:36: error: use of undeclared identifier 'entry_SYSCALL_64_mitigated'
     149 |                 wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64_mitigated);
         |                                                  ^
   2 errors generated.


vim +/entry_SYSCALL_64_unmitigated +147 arch/x86/kernel/cpu/bugs.c

   130	
   131	inline void cpu_mitigation_skip(struct task_struct *prev,
   132					struct task_struct *next)
   133	{
   134		bool prev_skip = false, next_skip = false;
   135	
   136		if (prev->mm)
   137			prev_skip = task_dfl_cgroup(prev)->cpu_skip_mitigation;
   138		if (next->mm)
   139			next_skip = task_dfl_cgroup(next)->cpu_skip_mitigation;
   140	
   141		if (!prev_skip && !next_skip)
   142			return;
   143		if (prev_skip == next_skip)
   144			return;
   145	
   146		if (next_skip)
 > 147			wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64_unmitigated);
   148		else
 > 149			wrmsrl(MSR_LSTAR, (unsigned long)entry_SYSCALL_64_mitigated);
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
