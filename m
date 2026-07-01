Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6F436C9C1;
	Wed,  1 Jul 2026 03:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782878249; cv=none; b=hhK31cT1QqqUJD/pWZbNn/ZpBq7+SCu5IU+8uOzIOhn3e7Mi0Cmou8SfIo6aAWXkUYwPVml8oAMgCWO6m0kTsmlbBEUJbLXgolsyg8dLTu/y34OI9TACPRW7iypVa8qdGxlXyxu9IycN0D1aGwBKRaOJ/CkuLRqWKNNmXrfKtus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782878249; c=relaxed/simple;
	bh=/lzxTNKosvsOjwkCLRbwluY6JPtABAogVZ41dpyiXZQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fmhxN+h1vrLIVdcm5WtdYMEeH3O4BZ/5Q1psobN8tHn2C1dmUkBh5mHHbg7rTeuTi0XXM1PamJs97CQ7HZjYy6d3yBc86uADOAcMyD8voEAi/wISOOauHzvhn2YJEK9isqfHq3e3cncvLSdpJ24GqjCDuN98tbzGNAVoTJajVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lojNiOfV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lojNiOfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782878246; x=1814414246;
  h=date:from:to:cc:subject:message-id;
  bh=/lzxTNKosvsOjwkCLRbwluY6JPtABAogVZ41dpyiXZQ=;
  b=lojNiOfV0Pd1fe9GFsObXpt508jmRTTysz+ezBWWdx1Ik/RAe32updZK
   x1M+xfgVJkJv7RLYt0vRmoNS8/zhC/Nsye2dowrGyz0lKvyP0G+S5QZYW
   AJbA15ZK2GlPfDE5pIQTJcRt1ch9XA1F1lerxuFfzjookU9w66AC3sHBU
   jXfRuLmCootNHQShsSZrSZq1qXtAwxkA5spBiX55eEseiSCxOGjS87wbL
   vCm+Aw/v9mksxTUTS/vjoLb4n3LGFSS/fMN8sZiLtsgX+mbOQLQmb0IQm
   dvmCHKDg8iO4LYd9MFMhrBfpl4n86sl0rr7yxcX6okACmiBPwWiGoZkkY
   g==;
X-CSE-ConnectionGUID: VuYTD3VKSJ6wOHaC0EqqrA==
X-CSE-MsgGUID: wzhJGyTdQuKiuLF2O54F7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="82588756"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="82588756"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 20:57:26 -0700
X-CSE-ConnectionGUID: eJLz2smGS8eGUZSyyejiyw==
X-CSE-MsgGUID: B01e4BkoS4CLLBxGB6Nsxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="249077450"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2026 20:57:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wem4a-000000008ul-1Jpt;
	Wed, 01 Jul 2026 03:57:18 +0000
Date: Wed, 01 Jul 2026 11:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 8/13] block/blk-map.c:742:1:
 warning: unused label 'next'
Message-ID: <202607011106.ZWLZT9or-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: b88f2bfe111b8778c8bba9e0309c653966171bdd [8/13] block: bounce passthrough bios through iobuf pool folios
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260701/202607011106.ZWLZT9or-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011106.ZWLZT9or-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011106.ZWLZT9or-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-map.c:742:1: warning: unused label 'next' [-Wunused-label]
     742 | next:
         | ^~~~~
   block/blk-map.c:823:25: warning: unused variable 'bmd' [-Wunused-variable]
     823 |                         struct bio_map_data *bmd = bio->bi_private;
         |                                              ^~~
   2 warnings generated.


vim +/next +742 block/blk-map.c

   670	
   671	/**
   672	 * blk_rq_map_user_iov - map user data to a request, for passthrough requests
   673	 * @q:		request queue where request should be inserted
   674	 * @rq:		request to map data to
   675	 * @map_data:   pointer to the rq_map_data holding pages (if necessary)
   676	 * @iter:	iovec iterator
   677	 * @gfp_mask:	memory allocation flags
   678	 *
   679	 * Description:
   680	 *    Data will be mapped directly for zero copy I/O, if possible. Otherwise
   681	 *    a kernel bounce buffer is used.
   682	 *
   683	 *    A matching blk_rq_unmap_user() must be issued at the end of I/O, while
   684	 *    still in process context.
   685	 */
   686	int blk_rq_map_user_iov(struct request_queue *q, struct request *rq,
   687				struct rq_map_data *map_data,
   688				const struct iov_iter *iter, gfp_t gfp_mask)
   689	{
   690		bool copy = false, map_bvec = false;
   691		unsigned long align = blk_lim_dma_alignment_and_pad(&q->limits);
   692		struct bio *bio = NULL;
   693		struct iov_iter i;
   694		int ret = -EINVAL;
   695	
   696		if (map_data)
   697			copy = true;
   698		else if (iov_iter_alignment(iter) & align)
   699			copy = true;
   700		else if (iov_iter_is_bvec(iter))
   701			map_bvec = true;
   702		else if (!user_backed_iter(iter))
   703			copy = true;
   704		else if (queue_virt_boundary(q))
   705			copy = queue_virt_boundary(q) & iov_iter_gap_alignment(iter);
   706	
   707		if (map_bvec) {
   708			ret = blk_rq_map_user_bvec(rq, iter);
   709			if (!ret)
   710				return 0;
   711			if (ret != -EREMOTEIO)
   712				goto fail;
   713			/* fall back to copying the data on limits mismatches */
   714			copy = true;
   715		}
   716	
   717		i = *iter;
   718		do {
   719			/*
   720			 * Try iobuf pool bounce first when copy is needed and the pool
   721			 * can provide aligned folios for this request.
   722			 */
   723	#ifdef CONFIG_BLK_IOBUF_POOL
   724			if (copy && !map_data && blk_rq_iobuf_eligible(q, &i, gfp_mask)) {
   725				ret = bio_copy_user_iov_iobuf(rq, &i, gfp_mask);
   726				if (!ret)
   727					goto next;
   728				if (ret != -EREMOTEIO)
   729					goto unmap_rq;
   730				/* not eligible after all; fall through to standard copy */
   731			}
   732	#endif
   733			if (copy)
   734				ret = bio_copy_user_iov(rq, map_data, &i, gfp_mask);
   735			else
   736				ret = bio_map_user_iov(rq, &i, gfp_mask);
   737			if (ret) {
   738				if (ret == -EREMOTEIO)
   739					ret = -EINVAL;
   740				goto unmap_rq;
   741			}
 > 742	next:
   743			if (!bio)
   744				bio = rq->bio;
   745		} while (iov_iter_count(&i));
   746	
   747		return 0;
   748	
   749	unmap_rq:
   750		blk_rq_unmap_user(bio);
   751	fail:
   752		rq->bio = NULL;
   753		return ret;
   754	}
   755	EXPORT_SYMBOL(blk_rq_map_user_iov);
   756	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
