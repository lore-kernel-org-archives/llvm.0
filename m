Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AB23E6DCA;
	Tue,  5 May 2026 07:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967929; cv=none; b=LOdNg2eF84wbfYNTifZdVnv6bhcgY0LJUViZ5zQOMhx/NsE6eZBxUWfi8WRtrkYD7PGBXJ42xMF01RkuFStxIXKfpwYvy9TLkxOcR0gQr94MVlSv7mDxvBYPxjYc2G3gn2cIk3I6OCnoLde3AsVyqvuxuEYuThUXfT2Ou7vcQsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967929; c=relaxed/simple;
	bh=UJCazVjZYOLc7p2oA1KWg3Yh9eEISRBaRFk1xBsb9gE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ro4lLmIdlB9GECOGeEJGWF/ZVksrC17FGI/SxsRcaLohhu8fsv6ftqIHXG1XLhukVGFjOPy5RljvFU9vkf5o7h6hVmqSy2JHu8FXB+qDLemQU41p7IeVn04VERRIa+MLIFa7WrJnCoUyFodZ2B1go7Ek3BH2kv0DhkDcNDCZP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tj30h7OJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tj30h7OJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777967928; x=1809503928;
  h=date:from:to:cc:subject:message-id;
  bh=UJCazVjZYOLc7p2oA1KWg3Yh9eEISRBaRFk1xBsb9gE=;
  b=Tj30h7OJy+PI2GlOR5dhvGd+dr1QJpHNkRRWxGyJdpDTyOO9eaZnTBQ8
   mYN3dfCEDoogLAPi1PFSPlkKuu7+XrSR4zulOm3RteLhZnDeBIMi4T0x/
   didYQYW1jw2y1Ff6KzO35soUSVgYL5VJE5Jel3fMBQvT6iUU2/mJdR4g5
   1/cLAZJ537tfULR2871tIyIjXHvx7qV6IyB4g32Ami395b7niy9gkYfMx
   rlnF5W4sGCVsH6FqlU0vhlO3XtRFp/yLyqZttnWyNMloTjpekDzmz1Azq
   ShuKX9VI43zC2kTKIw96e3UgkzeQlS+B1V4bDEAkDEnxTm5+LEQ3fBDFJ
   g==;
X-CSE-ConnectionGUID: r6fifNGPQ4GUl60JAQwmyg==
X-CSE-MsgGUID: +OHEOKueTWSe3YjphkERgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78692635"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78692635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:58:46 -0700
X-CSE-ConnectionGUID: cJgPkPYERmW/chUWXlA9YQ==
X-CSE-MsgGUID: dwBfolO6T36OXQt9qUihZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="231372118"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2026 00:58:44 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKAfy-000000004Mr-02EJ;
	Tue, 05 May 2026 07:58:42 +0000
Date: Tue, 05 May 2026 15:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-user-acct.v2 2/2] io_uring/rsrc.c:52:46:
 warning: variable 'count' is uninitialized when used here
Message-ID: <202605051516.EwH8GTl5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-user-acct.v2
head:   3db2fc5d524bb4877e39659d0180dfc0112893ac
commit: 3db2fc5d524bb4877e39659d0180dfc0112893ac [2/2] io_uring/rsrc: add huge page accounting for registered buffers
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260505/202605051516.EwH8GTl5-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051516.EwH8GTl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051516.EwH8GTl5-lkp@intel.com/

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
