Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E7CF515;
	Mon, 30 Oct 2023 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqnb6XLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698669804; x=1730205804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bltexQ4p+A0qUItQQg7Sl7q9dPxn9AAh4vQFsQSEsOQ=;
  b=gqnb6XLaUkU+zia5ZovPmdl8r1ARc+tkcRbZDlpNQmSfyTUB+GytzB+Q
   SNP4Kf/3HLO+lYHc4e6T1y6YclTQgA5dlsR9DIjUGGFRP/zQoWUMkdG+U
   eZ8IyczYtHM5/6bstWSp9qobGWbsWzqG36SGyNFTk1r07lax3LuXmK+3W
   3RNqMmYWE6wIZRpZFIGFB8U38mPe1jO0Lg942ZBpvvdjrmVyKqI+IDcfc
   nK9lg8Ia4l36yX611Va3HrEedfaM6DHjnzGpA5q78aHNDW1waSKdSX9CP
   8QV2DFBKiq17nuHNTP+6dk9t4HfBJs7da0R2JvV2RPDUw9NSbXpCTluYz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="378434327"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="378434327"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 05:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="789445598"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="789445598"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Oct 2023 05:43:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxRbw-000DGk-16;
	Mon, 30 Oct 2023 12:43:16 +0000
Date: Mon, 30 Oct 2023 20:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>
Subject: [linux-next:master 9417/16121]
 drivers/hwtracing/coresight/coresight-etm4x-core.c:1183:24: warning: result
 of comparison of constant 256 with expression of type 'u8' (aka 'unsigned
 char') is always false
Message-ID: <202310302043.as36UFED-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c503e3eec382ac708ee7adf874add37b77c5d312
commit: 0f55b43dedcdae2b871f0fec59d8c672e62ff5de [9417/16121] coresight: etm: Override TRCIDR3.CCITMIN on errata affected cpus
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231030/202310302043.as36UFED-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310302043.as36UFED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310302043.as36UFED-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-etm4x-core.c:1183:24: warning: result of comparison of constant 256 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
    1183 |                 if (drvdata->ccitmin == 256)
         |                     ~~~~~~~~~~~~~~~~ ^  ~~~
   1 warning generated.


vim +1183 drivers/hwtracing/coresight/coresight-etm4x-core.c

  1172	
  1173	static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
  1174	{
  1175		/*
  1176		 * Erratum affected cpus will read 256 as the minimum
  1177		 * instruction trace cycle counting threshold whereas
  1178		 * the correct value should be 4 instead. Override the
  1179		 * recorded value for 'drvdata->ccitmin' to workaround
  1180		 * this problem.
  1181		 */
  1182		if (is_midr_in_range_list(read_cpuid_id(), etm_wrong_ccitmin_cpus)) {
> 1183			if (drvdata->ccitmin == 256)
  1184				drvdata->ccitmin = 4;
  1185		}
  1186	}
  1187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
