Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1981D8C17;
	Mon, 21 Aug 2023 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692641213; x=1724177213;
  h=date:from:cc:subject:message-id:mime-version;
  bh=F+ucGAnR8j3IaLj4FrNEh+VtBeH8ATYgwe+W/ET3rW8=;
  b=lPSBogeIbgCnq7Er4wXdkVYAueTh591bZ/ucrtaNs+xXmxbSIgT8uW4I
   mpaWCJDSygpFMiiTuH5XCbakGid862Vkff1Sv+8X531xld+ladZpt11Ru
   ap8GVNpfnjFKBt6ekYhCtYNaJtCV1cwMK54gx2CP9jasnw9FXRO1h6PGq
   R/4ZbEtiiIaHNqvBmlsSZKdf2Jd3lOy92a4/Hp8A1i0AtYeojq2jw9/Yb
   GPNC3UhIUwttASGgo+MBJpaoB7WzrAAGX5HMK1MfgEgOri5q1SdYGoa7H
   eeU1NPhUw1IMGBFFikTxLN5Ya+wKVz24Ld8kJYyy79rkYt4dk/3uHmSqd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460027367"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="460027367"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 11:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="735928905"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="735928905"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 11:06:48 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY9Id-0000lk-35;
	Mon, 21 Aug 2023 18:06:47 +0000
Date: Tue, 22 Aug 2023 02:06:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] x86/srso: Use CALL-based return thunks to reduce
 overhead
Message-ID: <202308220129.AcqINgTs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230821112723.3995187-5-andrew.cooper3@citrix.com>
References: <20230821112723.3995187-5-andrew.cooper3@citrix.com>
TO: Andrew Cooper <andrew.cooper3@citrix.com>

Hi Andrew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6405b72e8d17bd1875a56ae52d23ec3cd51b9d66]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Cooper/x86-srso-Rename-srso_alias_-to-srso_fam19_/20230821-192855
base:   6405b72e8d17bd1875a56ae52d23ec3cd51b9d66
patch link:    https://lore.kernel.org/r/20230821112723.3995187-5-andrew.cooper3%40citrix.com
patch subject: [PATCH RFC 4/4] x86/srso: Use CALL-based return thunks to reduce overhead
config: x86_64-randconfig-071-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220129.AcqINgTs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220129.AcqINgTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220129.AcqINgTs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: srso_fam17_return_thunk(): can't find starting instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
