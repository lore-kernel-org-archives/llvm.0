Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C711662EF;
	Thu, 27 Feb 2025 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740665964; cv=none; b=mPjqNjHadCtJG5sjq6R9ZxJQoZuSxRlHlYlXmTLJpmenR1QpPR4bYotHS9Op6Nvel8M8xaT8nEWx33CH9xUO4TdshLv/5LyJPzk3BZt5fNlQAgXiQqUgjGJtb/RDHGYaCnWv2bKYP6d48vOcrXlbeE567S4AcdWq93Y6KJOwFgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740665964; c=relaxed/simple;
	bh=Sjuc5haFTHrW3rg3fDV9aylKQ863wlMVOJaIXTFhh5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XrczteuvHucsvSHWlHJ2UVO383YenMDhSmSf6isz2ywXXk/tJzohapd7qgop6T5lejOJJ+RuDtymq0q9A/bB5qevagN7xBlF0GhfTObr1MsCBM1Lz806/JQTMzigD8BxPjwUAMgKZHaPt1fcx55yQdMnEFcKatqAvO4rFiuYhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLKfvJDc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLKfvJDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740665962; x=1772201962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sjuc5haFTHrW3rg3fDV9aylKQ863wlMVOJaIXTFhh5k=;
  b=DLKfvJDc9HzcLo2dLcQxwb+RG/cYA+4bDVDBMs6Ho9BQFoTlfwDdG+1j
   F/RrVSINBkqs+bfe9w1SVPLDDFVx3a9zsvnE9uGN2+SyhybzwxJyxaFOs
   0jmUU9AJqykZ6fSLfFVbaULgUfL8D9qhk18GtxuH3B7XrAItZPifS9iBQ
   bly257Jd8oGc6sHJj+oRej8R2wcB/qIIA3ZvfzUH6X2dhyIKUZ77G8bZ8
   tbRibQHM+mIHhCBhQVcz/GdTZfvs6u0Gyz1xmqdQvdfz+ajB0F6wDofCm
   i9QBIAfYuTWA7+DBrmhZxHKZki9B420EDeKrdyOEwTTDZDwrDa7j/vFS2
   A==;
X-CSE-ConnectionGUID: u7H9+64FTRWfgjOuEXgqOA==
X-CSE-MsgGUID: /6eaXlGkQJqqGUJq9H3aUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52196524"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52196524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:19:22 -0800
X-CSE-ConnectionGUID: KSU65rk2RhKNfzzkBHeaIA==
X-CSE-MsgGUID: JDw3eqBDSgiuFHVXRXhBFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="122158471"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2025 06:19:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnej6-000DTc-1F;
	Thu, 27 Feb 2025 14:19:00 +0000
Date: Thu, 27 Feb 2025 22:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Zheyun Shen <szy0127@sjtu.edu.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: [sean-jc:svm/sev_cache_opts 7/8] arch/x86/include/asm/smp.h:175:15:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
Message-ID: <202502272237.Jjp49UKY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux svm/sev_cache_opts
head:   0abca5ad72cf2bc8ebbb6b93be9a5c768f463d48
commit: 3c2b47771dc542fbdb237bd5218112905717dfae [7/8] x86, lib: Add wbinvd and wbnoinvd helpers to target multiple CPUs
config: i386-randconfig-012-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272237.Jjp49UKY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272237.Jjp49UKY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272237.Jjp49UKY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:12:
>> arch/x86/include/asm/smp.h:175:15: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     175 | static inline wbnoinvd_on_many_cpus(struct cpumask *cpus)
         | ~~~~~~~~~~~~~ ^
         | int
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3738855156
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=3738855156
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3738855156
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3738855156
   make: Target 'prepare' not remade because of errors.


vim +/int +175 arch/x86/include/asm/smp.h

   174	
 > 175	static inline wbnoinvd_on_many_cpus(struct cpumask *cpus)
   176	{
   177		wbnoinvd();
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
