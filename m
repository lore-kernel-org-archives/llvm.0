Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD53612F;
	Fri,  5 Jan 2024 06:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKlG2WUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704437978; x=1735973978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oDrJhCOQib3iwbbyXgPHIKO1jldLHRvIex3EPul3HMM=;
  b=BKlG2WULdGbbhtYRP4XqHuZ0R0pAGvSB8HMtjSWR3UblQEKjsRxpNM0y
   QyTDLwHVApxJaZ5ifSvZ5BWxiKDldAeOvJejvwzORhW7q5MeZCNz9KJbY
   jDVEmI01R3DWPqiI7FRnwwXbgqaHry6Y0VLnGrSm3Q8eSA/0tTz3ooPWF
   71MHR8XwJUqOV8RI2iaz7yv0IQ71gg3PRrvO+U2VOAZlwYX/bO1wHXUhN
   rAwvCQsME8Yue2jpXJtXcaiAoLQOnuvw3Qry4Vu3O56Hv0ErQEv3SKg4f
   fKGLzhzxnc5qQ1luNhiOuU27bDWbrMEo8Z+a9gMY3/wVkutTBr6jMj+Ad
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="16064930"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="16064930"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 22:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="851050342"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="851050342"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2024 22:45:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLdxc-0000tp-0w;
	Fri, 05 Jan 2024 06:45:40 +0000
Date: Fri, 5 Jan 2024 14:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Vinicius Tavares Petrucci <vtavarespetr@micron.com>
Subject: [gmprice:mempolicy2_mbind2 8/12]
 ./usr/include/linux/mempolicy.h:35:2: error: unknown type name '__u8'
Message-ID: <202401051438.x9jQSlEU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux mempolicy2_mbind2
head:   173851cd37b0391648582c61a781025cfef0e1e1
commit: 5c9761cb87dc28bd728fbf0c550bdec2de5e8e32 [8/12] mm/mempolicy: add userland mempolicy arg structure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240105/202401051438.x9jQSlEU-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051438.x9jQSlEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051438.x9jQSlEU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   ./usr/include/linux/mempolicy.h:31:2: error: unknown type name '__u16'
      31 |         __u16 mode;
         |         ^
   ./usr/include/linux/mempolicy.h:32:2: error: unknown type name '__u16'
      32 |         __u16 mode_flags;
         |         ^
   ./usr/include/linux/mempolicy.h:33:2: error: unknown type name '__s32'
      33 |         __s32 home_node;        /* mbind2: policy home node */
         |         ^
   ./usr/include/linux/mempolicy.h:34:2: error: unknown type name '__u16'
      34 |         __u16 pol_maxnodes;
         |         ^
>> ./usr/include/linux/mempolicy.h:35:2: error: unknown type name '__u8'
      35 |         __u8 resv[6];
         |         ^
   ./usr/include/linux/mempolicy.h:36:2: error: unknown type name '__aligned_u64'
      36 |         __aligned_u64 pol_nodes;
         |         ^
   6 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
