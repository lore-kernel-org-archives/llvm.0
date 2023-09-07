Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFC813AD7;
	Thu,  7 Sep 2023 20:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694119842; x=1725655842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7J5q5B9ZEZvXn4oH+75rncwNsntifpVcXRjKeNVo984=;
  b=X4il2250VEXkh9l1cp0EX3QrmYJD+hg/npvb6weRl5WdI1lFiY6wz1o4
   fh2/zRnL5fOOGka4D15gEzZqHlvEM9IQUcfxrnW4Ot0/ubji61kfali+q
   M/ajHLv93DREbszD/2vIQOOXDrDRsLMoGSNL9A3sLnhd3Us+ymImMFXmE
   aD+En/FItCG8m8ILHD4u5KzZXScalGvs9/IfS8xbRhhvyU9J3Z8xNQDnf
   fFzJsc+5CU+9IN6hIoZXpGbIqvxceCUe6qyBcO4yaDZl0HwkUMrZ2zupi
   4cgO88bgpEQn8RRKGBVGdAJh3heu5qGLD98k1jKLOSyfXU6vAFhj+fWAE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="380210084"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="380210084"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 13:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="915877877"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="915877877"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Sep 2023 13:50:32 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeLxO-0001Zr-0T;
	Thu, 07 Sep 2023 20:50:30 +0000
Date: Fri, 8 Sep 2023 04:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-ia64@vger.kernel.org
Subject: [aegl:resctrl2_v65 4/4] fs/resctrl2/arch/x86/amd_mbec.c:189:32:
 warning: unused variable 'bmec_feature'
Message-ID: <202309080444.cQO3Td8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_v65
head:   13c888afbee9f7da0a4a969617dea9889da9d711
commit: 13c888afbee9f7da0a4a969617dea9889da9d711 [4/4] resctrl2: AMD Bandwidth Monitoring Event Configuration
config: x86_64-randconfig-r014-20230908 (https://download.01.org/0day-ci/archive/20230908/202309080444.cQO3Td8s-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080444.cQO3Td8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080444.cQO3Td8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl2/arch/x86/amd_mbec.c:189:32: warning: unused variable 'bmec_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id bmec_feature[] = {
                                  ^
   1 warning generated.


vim +/bmec_feature +189 fs/resctrl2/arch/x86/amd_mbec.c

   188	
 > 189	static const struct x86_cpu_id bmec_feature[] = {
   190		X86_MATCH_FEATURE(X86_FEATURE_BMEC, 0),
   191		{ }
   192	};
   193	MODULE_DEVICE_TABLE(x86cpu, bmec_feature);
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
