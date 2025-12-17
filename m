Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B6E2E8B98;
	Wed, 17 Dec 2025 23:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012970; cv=none; b=KDiwXbzklmxMQnaWWlN2eq0q6tn2XHgR7v/7oOPMdNqKPFMKBonKfgJvn40R5k8NDxuO8JYBOPkFOXPpCUOkaFicLTCjaiUUYVleuYWd4Fp+3+PyBF6K/nOVUQqrziGsKNWOXMBzzYwPZskV+XE09Glfvuy87cd/WzU8fXfn71U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012970; c=relaxed/simple;
	bh=gouJaC/yl4u63DgUimNHdlMGsdjyORLZhQGD8GIApPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eivsO5O0cH9jlYlfpXWtWzqX3Bo74NLITZZh8iwl/3RwwNodKv9gW8Wu0Vta9aqMQTJ/UC3z2f+YzkExB8AacRIeLndyhfCE0ESnl9voCfvaY8tZfPcXZ3wyMiH2V9OkvYgGLGSTdhYMDslsG+2AzBs9AE1PgQAr84KQDtqCBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXoeqcY+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXoeqcY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766012968; x=1797548968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gouJaC/yl4u63DgUimNHdlMGsdjyORLZhQGD8GIApPI=;
  b=VXoeqcY+wAIWF+y4JDPMQVDNtDTTOpHSWgVP8u06pJKYE87jLjSZirwy
   4SetPMxqPK61PT+g1lBc++CB3Nsq6LqsOVZZakNtKIo6AAVzsx7SToO96
   4UJtWYiyWatkf8SzI/+jzsDM1YbvDXR78M5/g9K8I0XDYCO0K7RK8A8o4
   jFFtyIh4nNibw8+7y0jHaLqnZHklfn9O2lxeCKE1ahpbOl6VVv4hMFDGo
   Dg9ofoyEHqZNNlj6/CJmXqqeOHNF3QWmYvXoMBRf5o53WaM7KENgHpyOk
   iDBClqMK56YKatkyIZFC8/Kpybu3WmGE+oCzXIe+127nvujGzKXS92I38
   Q==;
X-CSE-ConnectionGUID: q6mPhCy7TFe9T2Sk1u5d5w==
X-CSE-MsgGUID: QPf0aan0RKeU/ujVAXx/3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67157130"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67157130"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:09:28 -0800
X-CSE-ConnectionGUID: B0bumNnUS0SP+ksn83Y5vg==
X-CSE-MsgGUID: wDyE6NV4QTWNnw6DmiCGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198038209"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 15:09:19 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW0dw-000000001Kc-2PO0;
	Wed, 17 Dec 2025 23:09:16 +0000
Date: Thu, 18 Dec 2025 07:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 7/7]
 include/linux/kernel_stat.h:167:2: error: call to undeclared function
 'kcpustat_fetch_default'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202512180737.dUFbRe5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   377cf035e0d76753d72649b16d4d9b693e7f4b86
commit: 377cf035e0d76753d72649b16d4d9b693e7f4b86 [7/7] tick/sched: Consolidate fetching idle time
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251218/202512180737.dUFbRe5i-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180737.dUFbRe5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180737.dUFbRe5i-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
>> include/linux/kernel_stat.h:167:2: error: call to undeclared function 'kcpustat_fetch_default'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     167 |         kcpustat_fetch_default(dst, cpu);
         |         ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/kcpustat_fetch_default +167 include/linux/kernel_stat.h

   164	
   165	static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   166	{
 > 167		kcpustat_fetch_default(dst, cpu);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
