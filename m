Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE0E3E3DB3;
	Mon,  4 May 2026 17:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914283; cv=none; b=W2s0m4TQsG9GCnIhiVg1V1DPA0ww08T6ENahpp2xB34oQQXM9rUlBc2AsgohyzmObBQSyI10vX8OrOTnJxAn7Cycspo5bE7DgYPkyDI5xZ0XvTJidtJ74iEG6L9miCgnc4x18GMf8YsksjgeonvY9Kd9Di1I9JSZpTin7CqVlKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914283; c=relaxed/simple;
	bh=S69O50J0iozquXkQB3D6qkqF4OetIxWR1gTCatar3vs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NpFvAjv/Pdcv0u/a5gn13A6bh4jl9ezttCvZFfBfuQWAbQaIj+z3Ma/Awzu97oytfBbQXI26jquYZ9eHQ5+AzrXzTpo++g1PoRgh/aDE2RjSjW8lnYoluERrVCc68037GI97uVOb7JDKJCEuml9Vwe6u40W5bEyLPGsauyY/sJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbkESlKY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbkESlKY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777914281; x=1809450281;
  h=date:from:to:cc:subject:message-id;
  bh=S69O50J0iozquXkQB3D6qkqF4OetIxWR1gTCatar3vs=;
  b=JbkESlKY8fAAiS7NcMkS5Bb1IUzWt3q5hMMKE5j+2s+/V7pldE05Aamh
   VgDvIRsGnX4ZBKygO57vJhAQqZGi6vo1Sy986udKU/DZ4LqTJW8Wh/mde
   IdpYhsHF2u0/Ehe24OGbFAXvObLZQL/TdKcK2BcIf2lh+GPO/3Xz/RkQ7
   xBNhjj9WWxplG/eMdKdl92oIen4QuKt6pd88IQ/+tO6rIMHIIMUfhuhYE
   5nOQTDCe4U+tCmcASJtyBUMdHYfpuc6747bCf5jLZ0QPfHWIYhO1gCoAU
   JzUtgb5G2Xj9i/OeSVTI7I/IRcyG/Dj4VdsGqZ3/EvWMCewPitvOTDqlH
   A==;
X-CSE-ConnectionGUID: CRh+WCVrSCeXt/Zmsgf4CQ==
X-CSE-MsgGUID: qQUtrh8xTRSJ3WTYk1H4QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89361279"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="89361279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 10:04:41 -0700
X-CSE-ConnectionGUID: 0xrYYQLdQ0a8YyS4NFP+1A==
X-CSE-MsgGUID: Cnrylu+4QBqp15GJzZj9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="237341070"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 May 2026 10:04:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJwij-000000005tZ-2GyQ;
	Mon, 04 May 2026 17:04:37 +0000
Date: Mon, 04 May 2026 19:04:17 +0200
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-user-acct.v2 2/2] io_uring/rsrc.c:52:46:
 warning: variable 'count' is uninitialized when used here
Message-ID: <202605041900.orqOdsuT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-user-acct.v2
head:   3db2fc5d524bb4877e39659d0180dfc0112893ac
commit: 3db2fc5d524bb4877e39659d0180dfc0112893ac [2/2] io_uring/rsrc: add huge page accounting for registered buffers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260504/202605041900.orqOdsuT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041900.orqOdsuT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041900.orqOdsuT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/rsrc.c:52:46: warning: variable 'count' is uninitialized when used here [-Wuninitialized]
      52 |         xa_store(&ctx->hpage_acct, key, xa_mk_value(count), GFP_KERNEL_ACCOUNT);
         |                                                     ^~~~~
   io_uring/rsrc.c:37:21: note: initialize the variable 'count' to silence this warning
      37 |         unsigned long count;
         |                            ^
         |                             = 0
   1 warning generated.


vim +/count +52 io_uring/rsrc.c

    29	
    30	static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
    31							   struct iovec *iov);
    32	
    33	static int hpage_acct_ref(struct io_ring_ctx *ctx, struct page *hpage,
    34				  bool *acct_new)
    35	{
    36		unsigned long key = (unsigned long) hpage;
    37		unsigned long count;
    38		void *entry;
    39		int ret;
    40	
    41		lockdep_assert_held(&ctx->uring_lock);
    42	
    43		entry = xa_load(&ctx->hpage_acct, key);
    44		if (entry) {
    45			*acct_new = false;
    46			return 0;
    47		}
    48	
    49		ret = xa_reserve(&ctx->hpage_acct, key, GFP_KERNEL_ACCOUNT);
    50		if (ret)
    51			return ret;
  > 52		xa_store(&ctx->hpage_acct, key, xa_mk_value(count), GFP_KERNEL_ACCOUNT);
    53		*acct_new = true;
    54		return 0;
    55	}
    56	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
