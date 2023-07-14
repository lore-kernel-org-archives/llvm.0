Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056426FC8;
	Fri, 14 Jul 2023 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689332501; x=1720868501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X29VMDXXngBPtH6nrRm63JxpoYmKY8QxT78tbYKzgUg=;
  b=ahomLMXcSx81et925qD0TLgPkEwq46+NBw/e48q2BWjVf3uvy5qwwmdQ
   XGkELmoL/K606wn3fqk50wWgAbr3PqXThdqM8O5et9/6ASkGkDXrxlVPj
   lwqhQ9G02dNEZSfcrXtMyNySqnTknfC65PKPONx0YhZTMRG2c+SRuB+1R
   pITy7OPq7bkJzQCpwQslVjwrJ+a/l2sFpKTfrS2pafrXaPa4sSUgkTzLA
   EtQC1+QJHVTvvQIvrrGuU67jjA2kahPnW1qVsKmTySA0h69OQgWsiazDV
   XLa1PQ8hqhgZKYGMvutUecvEbSJtLJa3EyubsBwdyn7tGLct9g2C/KJaJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368086381"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="368086381"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 04:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725674675"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="725674675"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2023 04:01:30 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKGYE-0007O7-04;
	Fri, 14 Jul 2023 11:01:30 +0000
Date: Fri, 14 Jul 2023 19:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 41/198] error[E0063]: missing field `evict`
 in initializer of `drm_gem_object_funcs`
Message-ID: <202307141856.rEbXoxiy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   c2bbe7fe79da5dff6da45eb1d4a5a582db740429
commit: 4dc30fa2c7b1971ebaf41433565fbd95b9d9703d [41/198] rust: drm: gem: Add GEM object abstraction
config: x86_64-randconfig-x002-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141856.rEbXoxiy-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141856.rEbXoxiy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141856.rEbXoxiy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `evict` in initializer of `drm_gem_object_funcs`
   --> rust/kernel/drm/gem/mod.rs:203:58
   |
   203 |     const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `evict`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
