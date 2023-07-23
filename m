Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2841378;
	Sun, 23 Jul 2023 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690115470; x=1721651470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+oOh1J57UQz1BOXNeX2lAwy2AUIjuzoh/kgpBEzf9MI=;
  b=gasdafk9FbhuyYEGJCzST+fnhhkJtf0MLOmyHAHZmFZ6izCJDP9y25e9
   Ep0a+B/t0XAutnVvDeXprvCqxL046iCoe0Dc+zidbcZzYnqibQoXTdSLG
   F9bLfKvqvAYnRMfNkcB/Aeirf7jsYN576UZXVY0vnY/arWh2EVrjrbSWh
   6sB6wZ0lxQZlcwX9aukSTMXCH1gpd26rFVVI/zWfk7+OvLaVizr1hHSGE
   9eE9eRn3FTkiWoHHp2iXKIPy+UkNdph4ZGcVDa5902krEneRoPRxJuXub
   qowXtxAJpW6By20j3ZqAwg7IwYDGg1HaFS2qLmlPMyj3hnA8cqDQ8pMqU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="352169972"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="352169972"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 05:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="868769239"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2023 05:31:09 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNYEt-0008zt-0X;
	Sun, 23 Jul 2023 12:31:07 +0000
Date: Sun, 23 Jul 2023 20:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@fb.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: lib/zstd/compress/zstd_opt.c:1324:15: warning: stack frame size
 (2384) exceeds limit (2048) in 'ZSTD_compressBlock_opt0'
Message-ID: <202307232022.GrGHbMYi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2782531397f5cb19ca3f8f9c17727f1cdf5bee8
commit: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f zstd: import usptream v1.5.2
date:   9 months ago
config: riscv-randconfig-r032-20230723 (https://download.01.org/0day-ci/archive/20230723/202307232022.GrGHbMYi-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307232022.GrGHbMYi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307232022.GrGHbMYi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/zstd/compress/zstd_opt.c:1324:15: warning: stack frame size (2384) exceeds limit (2048) in 'ZSTD_compressBlock_opt0' [-Wframe-larger-than]
   static size_t ZSTD_compressBlock_opt0(
                 ^
>> lib/zstd/compress/zstd_opt.c:1331:15: warning: stack frame size (2320) exceeds limit (2048) in 'ZSTD_compressBlock_opt2' [-Wframe-larger-than]
   static size_t ZSTD_compressBlock_opt2(
                 ^
   2 warnings generated.


vim +/ZSTD_compressBlock_opt0 +1324 lib/zstd/compress/zstd_opt.c

  1323	
> 1324	static size_t ZSTD_compressBlock_opt0(
  1325	        ZSTD_matchState_t* ms, seqStore_t* seqStore, U32 rep[ZSTD_REP_NUM],
  1326	        const void* src, size_t srcSize, const ZSTD_dictMode_e dictMode)
  1327	{
  1328	    return ZSTD_compressBlock_opt_generic(ms, seqStore, rep, src, srcSize, 0 /* optLevel */, dictMode);
  1329	}
  1330	
> 1331	static size_t ZSTD_compressBlock_opt2(
  1332	        ZSTD_matchState_t* ms, seqStore_t* seqStore, U32 rep[ZSTD_REP_NUM],
  1333	        const void* src, size_t srcSize, const ZSTD_dictMode_e dictMode)
  1334	{
  1335	    return ZSTD_compressBlock_opt_generic(ms, seqStore, rep, src, srcSize, 2 /* optLevel */, dictMode);
  1336	}
  1337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
