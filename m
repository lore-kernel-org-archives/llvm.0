Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127FD7484;
	Sun, 10 Sep 2023 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694362685; x=1725898685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNbaXDRJ9JPiYNtdMG5FcvwWCLAuc+fyRtnqe2KGVIk=;
  b=l2yyf/tukt8XSaHq71ZNPsh1zUiz+EoqsOUwsQmnwp95n2QZCQ46+oUV
   7MIO3GAysxW2k3WbRn0oDXUUM+cpurGOK9llgWRKwYsXRWbReaMlGGI+W
   bgFaJcfZxKpjfXZDcWePlbp5KAdOzqFt98vb2uKZuYbJWkc0JG5TLC84L
   9JgeTxG3xMsmUdWt4iVqgwp0lMq/xLm1VktQGNiIGRbJMA9Ul0kZu3HTk
   MrDCf9Ir6oX/lGGe5vCBJx963wXmK+QdLInh3+Z2u5+VYiXJDKq7nKGaq
   2gh5GT8qV5EHCp16Dex1LM+V+tluR2w696RMo8391LAGGSyYUusw4Hax4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="464275663"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="464275663"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 09:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="692800137"
X-IronPort-AV: E=Sophos;i="6.02,242,1688454000"; 
   d="scan'208";a="692800137"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Sep 2023 09:18:02 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfN8K-00059A-05;
	Sun, 10 Sep 2023 16:18:00 +0000
Date: Mon, 11 Sep 2023 00:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest 96/136] ld.lld: error: undefined hidden symbol:
 cc_platform_has
Message-ID: <202309110050.EIPzaVfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: de8147285891deeefba5ed0c906101b15ed779e4 [96/136] x86/tdx: Make RDRAND/RDSEED loop forever
config: x86_64-randconfig-013-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110050.EIPzaVfB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110050.EIPzaVfB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110050.EIPzaVfB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: cc_platform_has
   >>> referenced by kaslr.c
   >>>               arch/x86/boot/compressed/kaslr.o:(kaslr_get_random_long)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
