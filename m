Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7966329E113;
	Mon, 12 Jan 2026 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261347; cv=none; b=lUxtFKDv/mNs2Y3HiQZj21/WfMFQNHic53kEnk+i6L6wqmjwHGAqFvODyvBa+24AP+4ehcE/a1dnnzZwSP1fBuIrBe+gULzQOMxtVN0gPKM2Y7L1faTRE6O7gOZV9LQ4/d5ssye2YFUE0o5XBHmprOjO4j/GlMsjoHibRNfZbZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261347; c=relaxed/simple;
	bh=WXv/kux0cQ09ezU0dDwnnn+KtrSytsouIRVQ4+wFjRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tb6FVfiNO6ekdL7kmIQyfAqOqTK2D+U9tiVoeqFbVul0y2pPfZSc3k45pjFU6vI/vqsRoWpAQpQwbmQ81nusJ8MmZT811Bxl1nZCTmOVxOMDNckYKcU6V8WRWOkU/7wNdMvV8tfvf6hV3Z6m8U/jfVNH3Uk/Jc/NmsHkQJ0Jy84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3/VYzSI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3/VYzSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768261345; x=1799797345;
  h=date:from:to:cc:subject:message-id;
  bh=WXv/kux0cQ09ezU0dDwnnn+KtrSytsouIRVQ4+wFjRc=;
  b=Z3/VYzSI3mUq8PEu8I4ro0NbcDxPJJwg4TC/TmmEFnexAbRmBDThB1lK
   F4KuTDcyXarqWRYFjPLCpi7PK9vB193M0QyRMEHI2O5lzsV5qgBCGN+PQ
   8/lIdB1stu41lx1Nh+nmiR+VOOW8eh2F0lv/jt1b692yQLnOuB9yEwj9d
   0HyDo6MqXc7vJKtebL++lS/RoANxE20OHIRG8xAAIwN3SdjFodB9tlTOJ
   3SWSDkbObWlN6yzkfJ2d5dD/Q1cyBzFf3Nb2V3dmgTSapsP9TpZXm7OMD
   BMwFNiOjnwfDjgVwyBegTNjnFeZzFdPublxi9Hf1KyhjLFbmy5zebR43x
   A==;
X-CSE-ConnectionGUID: r6zmlVfJSPOXl4w8xOuZfw==
X-CSE-MsgGUID: Rclo0XsZTAKVu6rtZhZhhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69598621"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69598621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 15:42:25 -0800
X-CSE-ConnectionGUID: QfkO/5wZSL25n5XlG3yaog==
X-CSE-MsgGUID: +ODGS18qTn2gIbXOe90KXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="227463261"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 15:42:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfRYD-00000000DzE-0rP4;
	Mon, 12 Jan 2026 23:42:21 +0000
Date: Tue, 13 Jan 2026 07:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 15/17] fs/netfs/rxqueue.c:468:15:
 warning: variable 'got' set but not used
Message-ID: <202601130700.bz0xpWB5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 8a18d8ea965502452510e9bd13addd1058370329 [15/17] netfs: Add some TCP receive queue helpers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260113/202601130700.bz0xpWB5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130700.bz0xpWB5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130700.bz0xpWB5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/rxqueue.c:468:15: warning: variable 'got' set but not used [-Wunused-but-set-variable]
     468 |         unsigned int got = 0;
         |                      ^
   1 warning generated.


vim +/got +468 fs/netfs/rxqueue.c

   449	
   450	/**
   451	 * netfs_rxqueue_tcp_refill - Refill receive queue by TCP splice
   452	 * @tcp_sock: The TCP socket to splice data from
   453	 * @rxq: The Rx queue to splice into
   454	 * @min_size: The amount of data we're interested in
   455	 *
   456	 * Refill the receive queue by splicing network receive buffer segments from a
   457	 * TCP socket, but don't wait for data.  The caller must do any waiting
   458	 * required.
   459	 *
   460	 * Note that whilst the peer may send PDUs in separate TCP packets, it's
   461	 * possible that the local NIC may join them back together if doing receive
   462	 * offload.
   463	 */
   464	int netfs_rxqueue_tcp_refill(struct socket *tcp_sock, struct netfs_rxqueue *rxq,
   465				     size_t min_size)
   466	{
   467		struct bvecq *add_to = rxq->add_to;
 > 468		unsigned int got = 0;
   469		size_t qsize = rxq->qsize;
   470		int rc = 0;
   471	
   472		if (!rxq->refillable) {
   473			WARN_ON(min_size > qsize);
   474			return 0;
   475		}
   476		if (qsize >= min_size && min_size > 0)
   477			return 0;
   478	
   479		do {
   480			if (!add_to || add_to->nr_segs == add_to->max_segs) {
   481				struct bvecq *b;
   482				unsigned int nr_bv = (2048 - sizeof(*add_to)) / sizeof(add_to->bv[0]);
   483	
   484				b = netfs_alloc_rx_bvecq(nr_bv);
   485				b->prev = add_to;
   486				if (!add_to)
   487					rxq->take_from = b;
   488				else
   489					add_to->next = b;
   490				add_to = b;
   491			}
   492	
   493			rc = netfs_tcp_splice_to_bvecq(tcp_sock, add_to, INT_MAX);
   494			//trace_smb3_tcp_splice(rc);
   495			if (rc < 0)
   496				break;
   497	
   498			qsize += rc;
   499			got += rc;
   500			rc = 0;
   501		} while (qsize < min_size);
   502	
   503		rxq->add_to = add_to;
   504		rxq->qsize = qsize;
   505		return rc;
   506	}
   507	EXPORT_SYMBOL(netfs_rxqueue_tcp_refill);
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
