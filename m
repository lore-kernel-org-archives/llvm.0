Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298F2405FD;
	Fri,  9 May 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746817189; cv=none; b=r5ypADS5DdX++TS05K5oYq7e8f5wMtaSK5qo69vPLq9W4a8LLciMj8q/2DYg3chiEfssQCd5tmjQtL8159Ds7lZLQK2cP/0sSefsr4gjiZqY3k5g5ERuyk8kiimdWRp6Cn6Nr5M3qR7xSkNCB849mWUe66nsyintuv/Wj+Pbanw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746817189; c=relaxed/simple;
	bh=WnKiHbyUvsdpJKSsb1l4VLkU0mUsFfnZsu14FYlH4QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VUOYVYFfahFowe4vqm6ntpv5q6cYZh0tNZRU2FTp6Rr7GxUP4xJc0ScsirZLvW8YrGHEuR1g/Ff7GvJoZtHbBTV5lOyjFgiDWNn7uaYJgOP3UwfKNh4BOYlOrRllh84/1UXm6k3Gey3bAlAEp7K1nybr7bivAisVRtxi0HDP2PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eK0Wr8uI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eK0Wr8uI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746817188; x=1778353188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnKiHbyUvsdpJKSsb1l4VLkU0mUsFfnZsu14FYlH4QU=;
  b=eK0Wr8uIlSS569C5skxKaGKD9mFuluyLOZZTBp9B5q/1qIzS0J9nWndg
   dqOIUTrgzYZslXrgtedhfYrViPm5IeJ8527bkY8SW4dmizOymlxMHCD8p
   AQ1XeiUNUVCk7XIEAs+uYg59WXcNOhEJBPbJcqGrLPwHMy9hX0YAc/w5K
   SSDwCigiKPEH/mNVOal7sWxVMkWE1qqYFZWq1OJ9nItYgOGWdmxnl9NrW
   YiYo8nizN9ophh7HqXS2Qt1WTahFlfypr2ZZI/C0XqJPz7pgx1kSq1bi4
   DWyulfRTDXQ3WbXtMJtJkZiaAjGsDuR3QvU7tgbm0zJ3KMoUdUJeAU40X
   A==;
X-CSE-ConnectionGUID: kfRu82X3Qkqu+jIMh0jKfQ==
X-CSE-MsgGUID: 4aolMa1CSRiW8Lj6INwq2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71166493"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="71166493"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 11:59:47 -0700
X-CSE-ConnectionGUID: 0PmyxdnxRmm6JSPHvu3m3Q==
X-CSE-MsgGUID: pGKXJMC3QeCvrOXiAjJ8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137091795"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 11:59:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDSwh-000CNn-1d;
	Fri, 09 May 2025 18:59:43 +0000
Date: Sat, 10 May 2025 02:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.16/io_uring 40/40] io_uring/io_uring.c:1656:6:
 warning: variable 'nr' set but not used
Message-ID: <202505100200.cyy3V6oJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.16/io_uring
head:   55c28f431651973385c17081bdcdadf8b5c6da91
commit: 55c28f431651973385c17081bdcdadf8b5c6da91 [40/40] io_uring: drain based on allocates reqs
config: s390-randconfig-002-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100200.cyy3V6oJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100200.cyy3V6oJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100200.cyy3V6oJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.c:1656:6: warning: variable 'nr' set but not used [-Wunused-but-set-variable]
    1656 |         int nr = 0;
         |             ^
   1 warning generated.


vim +/nr +1656 io_uring/io_uring.c

  1648	
  1649	static __cold void io_drain_req(struct io_kiocb *req)
  1650		__must_hold(&ctx->uring_lock)
  1651	{
  1652		struct io_ring_ctx *ctx = req->ctx;
  1653		bool drain = req->flags & IOSQE_IO_DRAIN;
  1654		struct io_defer_entry *de;
  1655		struct io_kiocb *tmp;
> 1656		int nr = 0;
  1657	
  1658		de = kmalloc(sizeof(*de), GFP_KERNEL_ACCOUNT);
  1659		if (!de) {
  1660			io_req_defer_failed(req, -ENOMEM);
  1661			return;
  1662		}
  1663	
  1664		io_for_each_link(tmp, req)
  1665			nr++;
  1666		io_prep_async_link(req);
  1667		trace_io_uring_defer(req);
  1668		de->req = req;
  1669	
  1670		ctx->nr_drained += io_linked_nr(req);
  1671		list_add_tail(&de->list, &ctx->defer_list);
  1672		io_queue_deferred(ctx);
  1673		if (!drain && list_empty(&ctx->defer_list))
  1674			ctx->drain_active = false;
  1675	}
  1676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
