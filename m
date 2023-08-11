Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536BD8833;
	Fri, 11 Aug 2023 21:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691790358; x=1723326358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVnLf4Rv5GN0a5KasCdZ1bV4WOrPhFHkuXXwce9MMjM=;
  b=Y77CV9MFrW2rc7QCGjY5RO+MHyKf1ipheNqsSBr6C1bfr6/+XS7fmheq
   pgggBNyW6pzTv28hga/aVOibzXByhZcUdi/zrWUKeHtt9E0sC55Yjf1N9
   mq6EO+hAuDB2AGJwDlOscOGbHG7ZfoNcv5u6BvsTtBg/BlGwyZIWN4bb8
   mnEtiQQrA++oZelYd1LlyLoIIdZwG1KC2aJDelhT8VIClzIYrhE5UEQIv
   6tRyPfCsr7eD7sPHzP/AsBZMTI6FJqKX8kYsgcbBUYCmjIW4HbHrLpGca
   5UIIdYoT+nT+QDZQ5CnNw4ZNycNXncYpS3KTNGYadmAB2yz6wfsb4XOmL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375482455"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="375482455"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 14:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063435891"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="1063435891"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2023 14:45:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUZxA-00083w-1i;
	Fri, 11 Aug 2023 21:45:52 +0000
Date: Sat, 12 Aug 2023 05:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Hao Luo <haoluo@google.com>
Subject: Cannot find symbol for section 8: .text.bpf_rstat_flush.
Message-ID: <202308120553.IRzzfaXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   29d99aae13cf2713b85bc26a37921e231676ba48
commit: a319185be9f5ad13c2a296d448ac52ffe45d194c cgroup: bpf: enable bpf programs to integrate with rstat
date:   12 months ago
config: mips-randconfig-r014-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120553.IRzzfaXL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120553.IRzzfaXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120553.IRzzfaXL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Cannot find symbol for section 8: .text.bpf_rstat_flush.
   kernel/cgroup/rstat.o: failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
