Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71311DDEE;
	Thu, 13 Jul 2023 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689276311; x=1720812311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pf5lPoMI8641w7iySIvmDvhXCvZ+xRdzx+/9dDP746Y=;
  b=awyPSgCO0Ktvevgo3eV2G0aJSQrIMIY5iXvvwuH3jziPWDgYtLpeV1Pt
   fzzqLOkoRKtawFKEtO7fFWYcJXJZhh1dZMT9FaWjfQcsMBzJUtgwoqwtg
   TsQBvPoSq7jetRVgVElvHE+gwo/UUlkzTBquOdcwBKe02aWH4Rb7sBpgB
   P2DPYNV5dbAdZKT+WW3pvOLqLx1UsQOfXPrPg2b1etwrkELZuLc0t/GQ2
   zg+KBwPpKUtH/qmp1GvkWDvFMxwk8vs4UplJa2XLYinOt1PfrhaL2am0r
   4zILkoseTygrvAorxCf5fuReatZcEAO4Lo2ltmrAVUObpx99K6mUSBxTO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431463716"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="431463716"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 12:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757300932"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="757300932"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Jul 2023 12:25:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK1w3-0006rt-11;
	Thu, 13 Jul 2023 19:25:07 +0000
Date: Fri, 14 Jul 2023 03:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Valente <paolo.valente@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Gabriele Felici <felicigb@gmail.com>,
	Carmine Zaccagnino <carmine@carminezacc.com>
Subject: block/bfq-iosched.c:6171:13: warning: stack frame size (1104)
 exceeds limit (1024) in 'bfq_insert_requests'
Message-ID: <202307140331.d3lMVJiF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb26cbb1a754ccde5d4d74527dad5ba051808fad
commit: 9778369a2d6c5ed2b81a04164c4aa9da1bdb193d block, bfq: split sync bfq_queues on a per-actuator basis
date:   6 months ago
config: riscv-randconfig-r003-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140331.d3lMVJiF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140331.d3lMVJiF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140331.d3lMVJiF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/bfq-iosched.c:6171:13: warning: stack frame size (1104) exceeds limit (1024) in 'bfq_insert_requests' [-Wframe-larger-than]
   static void bfq_insert_requests(struct blk_mq_hw_ctx *hctx,
               ^
   1 warning generated.


vim +/bfq_insert_requests +6171 block/bfq-iosched.c

aee69d78dec0ff Paolo Valente 2017-04-19  6170  
aee69d78dec0ff Paolo Valente 2017-04-19 @6171  static void bfq_insert_requests(struct blk_mq_hw_ctx *hctx,
aee69d78dec0ff Paolo Valente 2017-04-19  6172  				struct list_head *list, bool at_head)
aee69d78dec0ff Paolo Valente 2017-04-19  6173  {
aee69d78dec0ff Paolo Valente 2017-04-19  6174  	while (!list_empty(list)) {
aee69d78dec0ff Paolo Valente 2017-04-19  6175  		struct request *rq;
aee69d78dec0ff Paolo Valente 2017-04-19  6176  
aee69d78dec0ff Paolo Valente 2017-04-19  6177  		rq = list_first_entry(list, struct request, queuelist);
aee69d78dec0ff Paolo Valente 2017-04-19  6178  		list_del_init(&rq->queuelist);
aee69d78dec0ff Paolo Valente 2017-04-19  6179  		bfq_insert_request(hctx, rq, at_head);
aee69d78dec0ff Paolo Valente 2017-04-19  6180  	}
aee69d78dec0ff Paolo Valente 2017-04-19  6181  }
aee69d78dec0ff Paolo Valente 2017-04-19  6182  

:::::: The code at line 6171 was first introduced by commit
:::::: aee69d78dec0ffdf82e35d57c626e80dddc314d5 block, bfq: introduce the BFQ-v0 I/O scheduler as an extra scheduler

:::::: TO: Paolo Valente <paolo.valente@linaro.org>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
