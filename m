Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BB352F88;
	Thu, 15 Jan 2026 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461717; cv=none; b=P7mBYiYpVwcPepjl2sPaL3Gl0FxptGHcA5G9Iw38+NJnxYmEjRJ2Ok6yftV4kSIbJlbJEfJglHiiJIqvTO9XtFx8mtj5L1mVugP5ODgrE0CXmTn3PpT/1f1Wua+wgb65G2X2B/6ttCQUcsUGry74IhH+qLf8SDAnQshcBRXccCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461717; c=relaxed/simple;
	bh=7UJ5YL8ll0Sgg8QyfNwF//x3y/n4+5ZGtTpSkHpt0SU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eAmZ/nKB6oCRLsIglocxj+q82sH46iATCH85275VE91eaIwF67FeyFOQe23dvH81orUj5qnanEgvmEq3Qs35nvIfNXWtQWuQlOwmtlvie2XV/b4fzbOGZhfwgk5VeQcWAituoMUlDUqGTI0CP0jKQhLTBgEavKVzIrIWK3TLUzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqzP7wzS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqzP7wzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768461715; x=1799997715;
  h=date:from:to:cc:subject:message-id;
  bh=7UJ5YL8ll0Sgg8QyfNwF//x3y/n4+5ZGtTpSkHpt0SU=;
  b=fqzP7wzSoUeGs1CCdNafffV0emYf4YkiDk61+nCO2PilQD5doTH/+Dg8
   1er+jwEPWkCsBj+Fel2qH+NcK7FoVmNhtH4RD8FLIbp62mCTzO9FyLdPv
   yiwHyqYXIF//dgcBY235G/t3sdusfCk4/X9H1AdsOEtN02JLnfBv8jwTn
   bhF2lj1/32BgfX8LKQTrGVXkpDacMMWdQeo7zXSLccOQum6VJJyNiyW1M
   XViBrZj4aphdTXwwwgqVGhs8deo2VhfV8pa0RefLwpG39oEMVK+qlpHio
   39inmIuENDIZDxCBmvzYBOdDlmCKexLjFddThiJoBMfUxpisBiYR6SQGL
   g==;
X-CSE-ConnectionGUID: 4owd/71xSuyi6bcnrq6Xtg==
X-CSE-MsgGUID: kDcgxlDeR4y2zeMF7c2Zxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92434435"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="92434435"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:21:54 -0800
X-CSE-ConnectionGUID: LH4yjqHcQ2CDMuiBvQEm2A==
X-CSE-MsgGUID: nNmxSAy3SRGhIJiqvXb0QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209039111"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jan 2026 23:21:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgHfx-00000000HhM-281t;
	Thu, 15 Jan 2026 07:21:49 +0000
Date: Thu, 15 Jan 2026 15:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions 14/15]
 io_uring/bpf_filter.c:84:3: error: call to undeclared function
 'io_socket_bpf_populate'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601151524.L32dyU1W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   29ac83fe2b009e9bc007cc44ea21832a904be4fe
commit: 11d1f358bfae44ea49a9c7781e19d9d91eb8551d [14/15] io_uring: add support for BPF filtering for opcode restrictions
config: arm64-randconfig-003-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151524.L32dyU1W-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151524.L32dyU1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151524.L32dyU1W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/bpf_filter.c:84:3: error: call to undeclared function 'io_socket_bpf_populate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |                 io_socket_bpf_populate(bctx, req);
         |                 ^
   1 error generated.


vim +/io_socket_bpf_populate +84 io_uring/bpf_filter.c

    72	
    73	/* Populate BPF context from SQE */
    74	static void io_uring_populate_bpf_ctx(struct io_uring_bpf_ctx *bctx,
    75					      struct io_kiocb *req)
    76	{
    77		memset(bctx, 0, sizeof(*bctx));
    78		bctx->opcode = req->opcode;
    79		bctx->sqe_flags = req->flags & SQE_VALID_FLAGS;
    80		bctx->user_data = req->cqe.user_data;
    81	
    82		switch (req->opcode) {
    83		case IORING_OP_SOCKET:
  > 84			io_socket_bpf_populate(bctx, req);
    85			break;
    86		}
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
