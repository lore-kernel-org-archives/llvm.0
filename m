Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809380;
	b=MLUVjMKfiVbZwMcjF7CGQJ/Ex1V/g8wrhr3Q3m5f+Cf5bpzuYWwjtHnhvvbZMArDSt87
	 YOceLf8/YJW0BiyQz2G3julOkmDt8JB5y2/CFB7tC+AIl7HYWmliefraGZBp3kQkV/DZu
	 hsg0nEZiT4Sg4nfm+72Lyu7lOFqeUCsK5R1WXwn574If5YqfeDyYor6KKGMzj5bbTggE0
	 Ia8Lp1d3ebTFjGydsNFvitDXwsDdbiddEOHVK94aURZcO6u8WuuBKL9itMWuDaP9QjwzM
	 GwMFo12Aylblq1g174mi5QyWMiT4ix2mkaghSnz7zMEnU536/MQBCOxAT5MUU7h7vAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809380;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/UTFFBtcvF6fBQlxwPj4B25zkedomIPEoEabA8WmJ1E=;
	b=duZ0qppL4ZowFthIkIYk5W2OOhhUfXB1XTaqVsIcWCmXwX9UgzU87cOpZkIxR4Ty1D+w
	 /kJDerE5unOKjD5ODVQ2bv0ZqN4bq0SlmkG6smAU6jU3r5W64jt0dResPcJJ9NX/swBCH
	 06KwqEVLHkhmSNdD8ZqJcLOkSYS/sAYkWPeyq+vlgquoflY87BZL8nHLlpl+DzIokCriz
	 zlh77z+QS6+gFniio7MDStK46N55vog6UbCEiA659EK3KUDu1/XGFVYpF6CCOKGJPt9bW
	 R6prrCfLUjCngyFjADuztfPGgnO1pZIzLv6OPpdIwX5WsMq46hopDAeDeA2lKsVlgcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BBy1uR9f;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79A6606B8EB;
	Wed,  4 Nov 2026 16:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79A6606B8EB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BBy1uR9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793809379; x=1825345379;
  h=date:from:to:cc:subject:message-id;
  bh=jwdov69quC0URzQ9ghIuKnIeV2RA/1IlvzCEWqoZS2w=;
  b=BBy1uR9f8Hv4aSen5UhFdAlpmfwNgwwRubAXdmnhycu2MOSwDa6T+Lua
   KZZEsReltfoh6257OcVHVCNLGZn/CYdwuCSQuW6FyeYKym8KX+a+u+sII
   uKysYHpHjH2Prd7PzXXos3jUEaEZXFPto9Jdv1h7M2ipH7gkJRzRZUEwR
   NC8SHm0GqElAtdTUEyl58w88t6U8Stf7b3kB+ZSO5Hd0V1b3EkVjX8lX6
   nfmyMxb3r6AwEyFd9g8WdY+PHDBi5CFGbqvRBYJyCOKGFLTJ3czFJ9tIs
   bTfWN/n8IdCPgMOchrhhcLQGyo4q/MY6Awa5jQdv5j/61JU46I4rSm4u1
   w==;
X-CSE-ConnectionGUID: ZeQ/qQc4RUmJgubi1u2ofg==
X-CSE-MsgGUID: x3ccgnF9ShG4HAbDKFWdCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2445803"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2445803"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 08:22:59 -0800
X-CSE-ConnectionGUID: K+3r3PUxRt2njYOmdZm0Rg==
X-CSE-MsgGUID: sOo/4p5oSBCzEwbEy7smUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6862274"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2026 08:22:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOdlG-00000000ket-3l9U;
	Wed, 04 Nov 2026 16:22:54 +0000
Date: Thu, 05 Nov 2026 00:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 33/34]
 drivers/dma-buf/st-dma-mapping.c:14:44: warning: variable
 'mock_match_exp_arg' set but not used
Message-ID: <202611050047.orzjpfuU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   c37cf2824740d833b21eb816e21f94836100291f
commit: 3256cae07d96cc9fc9c997dec6bd1195289217c6 [33/34] dma-buf: Add kunit tests for mapping type
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611050047.orzjpfuU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050047.orzjpfuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050047.orzjpfuU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/st-dma-mapping.c:14:44: warning: variable 'mock_match_exp_arg' set but not used [-Wunused-but-set-global]
      14 | static const struct dma_buf_mapping_match *mock_match_exp_arg;
         |                                            ^
>> drivers/dma-buf/st-dma-mapping.c:15:44: warning: variable 'mock_match_imp_arg' set but not used [-Wunused-but-set-global]
      15 | static const struct dma_buf_mapping_match *mock_match_imp_arg;
         |                                            ^
   2 warnings generated.


vim +/mock_match_exp_arg +14 drivers/dma-buf/st-dma-mapping.c

    11	
    12	/* Mock tracking state -- reset before each test */
    13	static bool mock_match_called;
  > 14	static const struct dma_buf_mapping_match *mock_match_exp_arg;
  > 15	static const struct dma_buf_mapping_match *mock_match_imp_arg;
    16	static int mock_match_ret;
    17	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
