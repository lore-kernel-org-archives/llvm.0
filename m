Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE367D507;
	Fri, 14 Jul 2023 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689325653; x=1720861653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+IHg6cgBZRevG4BwODkWCovtb113ZE9XIynivYxkZRo=;
  b=Pcs3mnqg29BIm7u1Xt6qh9mu+3uRxrrHwVxLfM7PybXBWt6nqJ8/2xHw
   oC0IHJKCJzJsHKMvePJJAlBXtmUNQ5V5LZELVuinxf81QSitJcmnCGORP
   HM4r+J1odCddNYaXWhghKj+sM3rQQkS4RRTA1EGgAWUx5g10ZYfTEOIYA
   /3F1EpMkwZWd622pMw03TQWFaXMam/I28A3fiBcaQODHkyxH2Q8n0RM1j
   tBeztmyzbRVn9UYtLRHc5mRIflD/IktRsXa+ahZYuU92m7GEYRcydfbuG
   g0zzKGFDBmXoaVmmMbOADWIbCtEgPCdhnLvrlMH+DH3sF8kyBw2Iy5iDd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364303473"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="364303473"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 02:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="846392359"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="846392359"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Jul 2023 02:07:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKEls-0007LX-1F;
	Fri, 14 Jul 2023 09:07:28 +0000
Date: Fri, 14 Jul 2023 17:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/210-gpu 39/198] error[E0560]: struct `drm_driver`
 has no field named `dumb_destroy`
Message-ID: <202307141735.QUjvrfhF-lkp@intel.com>
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
commit: 8c78d70751e2059f0132b4af485128d8314f0ed8 [39/198] rust: drm: Add Device and Driver abstractions
config: x86_64-randconfig-x002-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141735.QUjvrfhF-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141735.QUjvrfhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141735.QUjvrfhF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `drm_driver` has no field named `dumb_destroy`
   --> rust/kernel/drm/drv.rs:232:9
   |
   232 |         dumb_destroy: T::Object::ALLOC_OPS.dumb_destroy,
   |         ^^^^^^^^^^^^ `drm_driver` does not have this field
   |
   = note: available fields are: `load`, `open`, `postclose`, `lastclose`, `unload` ... and 22 others

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
