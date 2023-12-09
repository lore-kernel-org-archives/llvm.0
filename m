Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B41FCE;
	Sat,  9 Dec 2023 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgH18sDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702113348; x=1733649348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gU2/00/LutHSOOyezz7zvEAYgxQXDKtmgQhWbEtOXgk=;
  b=mgH18sDB65um9auJnOnGT9m9C7vznEgMFmZDbZDJGaz9jGAvxgnBUhW9
   f70xjG13mfFLvc1k3AtwJ9/1zNEKGrlKGPjfYSaNyxIWC/7RKSPnIVQEC
   UoOhQQ6NrGmok9ud5ClKE7YhgLtuwS+OvPYQbpQ7aY0epDIGghsFJK0YQ
   rsEEypML2QyfrBbwIEvNqhxj1UkvrAAS1e8pIEKwDQlBvRV64WVRVbYEt
   qQGzE2vm4vjmyia9wS/pEM6gpsX8Z62UuwnGZVsBW1GoEbw7bjm1bf8sH
   cvQKMSX9pUVDmjbmWBOn6cn6aBL44PjtNp2zeOjUI81qKFnwGEzWSMijz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="393370080"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="393370080"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 01:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="842888759"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="842888759"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2023 01:15:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBtR2-000F8O-1p;
	Sat, 09 Dec 2023 09:15:44 +0000
Date: Sat, 9 Dec 2023 17:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/cfi 7/7] net/bpf/test_run.c:607:1: error: expected
 string literal in 'asm'
Message-ID: <202312091700.WCUWaDXz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/cfi
head:   1b448648ec2efe567e99d4181c46349cc003bd8d
commit: 1b448648ec2efe567e99d4181c46349cc003bd8d [7/7] bpf: Fix dtor CFI
config: i386-randconfig-014-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091700.WCUWaDXz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312091700.WCUWaDXz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312091700.WCUWaDXz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bpf/test_run.c:607:1: error: expected string literal in 'asm'
   CFI_NOSEAL(bpf_kfunc_call_test_release_dtor);
   ^
   arch/x86/include/asm/cfi.h:142:53: note: expanded from macro 'CFI_NOSEAL'
   #define CFI_NOSEAL(x)   asm(IBT_NOSEAL(__stringify(x)))
                                                         ^
   net/bpf/test_run.c:616:1: error: expected string literal in 'asm'
   CFI_NOSEAL(bpf_kfunc_call_memb_release_dtor);
   ^
   arch/x86/include/asm/cfi.h:142:53: note: expanded from macro 'CFI_NOSEAL'
   #define CFI_NOSEAL(x)   asm(IBT_NOSEAL(__stringify(x)))
                                                         ^
   2 errors generated.
--
>> kernel/bpf/helpers.c:2157:1: error: expected string literal in 'asm'
   CFI_NOSEAL(bpf_task_release_dtor);
   ^
   arch/x86/include/asm/cfi.h:142:53: note: expanded from macro 'CFI_NOSEAL'
   #define CFI_NOSEAL(x)   asm(IBT_NOSEAL(__stringify(x)))
                                                         ^
   kernel/bpf/helpers.c:2187:1: error: expected string literal in 'asm'
   CFI_NOSEAL(bpf_cgroup_release_dtor);
   ^
   arch/x86/include/asm/cfi.h:142:53: note: expanded from macro 'CFI_NOSEAL'
   #define CFI_NOSEAL(x)   asm(IBT_NOSEAL(__stringify(x)))
                                                         ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/asm +607 net/bpf/test_run.c

   602	
   603	__bpf_kfunc void bpf_kfunc_call_test_release_dtor(void *p)
   604	{
   605		bpf_kfunc_call_test_release(p);
   606	}
 > 607	CFI_NOSEAL(bpf_kfunc_call_test_release_dtor);
   608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
