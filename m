Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2447E224FA;
	Wed,  1 Jul 2026 01:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782867982; cv=none; b=lbOzTC77/Pm8xeHHEJIMch8XM7JGQH8RRiY8kM295uy8NtUpazKBjGm8u85/1D5f6TNcQkTlGA/zHNnc3ee5im0tjwbHrOppAKgG0TfswVhbScwizMqsu5EC9pQ/vwT2tJuAaQbMPITYJphs6StAlyArMbXLrR5aBlwmmEszI14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782867982; c=relaxed/simple;
	bh=RWunq/rIHb3XcS0oXVlnqi4RyTx0jKyJk+eehVreta8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pJl2j8it5YI+EMCz2lPygzEwZFJXHRRSlrtGE4iX4lgtBBsonZJt+YZ8KjnbYSWFgXsNosctufUDTNrPVQUEKG46LUh6kwdJ7FB4WGMp+4zZwwwPrb0o/pSxIBmhyOxcU0JJThqZC0TEKFgrtX2D1m046tCOHaimPSiVsKExK8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ch1bxWMP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ch1bxWMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782867981; x=1814403981;
  h=date:from:to:cc:subject:message-id;
  bh=RWunq/rIHb3XcS0oXVlnqi4RyTx0jKyJk+eehVreta8=;
  b=Ch1bxWMPq4lU4a5iIRb4ui0yq43ty1LKq29U9FXsJEMSmes/1V5CFBNc
   It6gqR46lvhu9cRMhNjpCwzZp8xXfe+uLH+xcpOgHAQtL4ER7/QB2/2jK
   xAtGlH3EppZqx92klzUi7vQPLIBDpomuZzh8Z7nygb8SiZhN5AU6k/lnL
   O67dpt6sjfaqu0DP0KNJ6d3VD4loJYUoUw94W05xJZ8tSxHizvoE7Sr5F
   2fkdbIedzCYBCpcEkorLHmtsC4cwp6t0QHMfVEEfrxnZ9MzkGhNZo+PSG
   rK1FW/04Tmx8mXB/t9xb6EDKP4ZV3QRlFctG8ZoXu4mGBOChiFOqmIgK4
   Q==;
X-CSE-ConnectionGUID: xq5HArubTWiHfqLKNF0qSw==
X-CSE-MsgGUID: QnkNvuH9RuGtGCN9HaR3pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="82708397"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="82708397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:06:21 -0700
X-CSE-ConnectionGUID: Hx2zX2OATlymCelOQfmQWA==
X-CSE-MsgGUID: 8K8MPqzvSB+n9ShbvUEUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="251987301"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Jun 2026 18:06:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wejP6-000000000cz-2jvL;
	Wed, 01 Jul 2026 01:06:16 +0000
Date: Wed, 01 Jul 2026 03:05:50 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 8/13] block/blk-map.c:742:1:
 warning: unused label 'next'
Message-ID: <202607010216.vwudmdmL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: b88f2bfe111b8778c8bba9e0309c653966171bdd [8/13] block: bounce passthrough bios through iobuf pool folios
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260701/202607010216.vwudmdmL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010216.vwudmdmL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010216.vwudmdmL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-map.c:742:1: warning: unused label 'next' [-Wunused-label]
     742 | next:
         | ^~~~~
>> block/blk-map.c:823:25: warning: unused variable 'bmd' [-Wunused-variable]
     823 |                         struct bio_map_data *bmd = bio->bi_private;
         |                                              ^~~
   2 warnings generated.
--
   Warning: block/blk-map.c:371 Excess function parameter 'op' description in 'bio_copy_kern'
>> Warning: block/blk-map.c:540 function parameter 'rq' not described in 'bio_copy_user_iov_iobuf'
>> Warning: block/blk-map.c:540 function parameter 'iter' not described in 'bio_copy_user_iov_iobuf'
>> Warning: block/blk-map.c:540 function parameter 'gfp_mask' not described in 'bio_copy_user_iov_iobuf'
   Warning: block/blk-map.c:371 Excess function parameter 'op' description in 'bio_copy_kern'
>> Warning: block/blk-map.c:540 function parameter 'rq' not described in 'bio_copy_user_iov_iobuf'
>> Warning: block/blk-map.c:540 function parameter 'iter' not described in 'bio_copy_user_iov_iobuf'
>> Warning: block/blk-map.c:540 function parameter 'gfp_mask' not described in 'bio_copy_user_iov_iobuf'


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
   757	int blk_rq_map_user(struct request_queue *q, struct request *rq,
   758			    struct rq_map_data *map_data, void __user *ubuf,
   759			    unsigned long len, gfp_t gfp_mask)
   760	{
   761		struct iov_iter i;
   762		int ret = import_ubuf(rq_data_dir(rq), ubuf, len, &i);
   763	
   764		if (unlikely(ret < 0))
   765			return ret;
   766	
   767		return blk_rq_map_user_iov(q, rq, map_data, &i, gfp_mask);
   768	}
   769	EXPORT_SYMBOL(blk_rq_map_user);
   770	
   771	int blk_rq_map_user_io(struct request *req, struct rq_map_data *map_data,
   772			void __user *ubuf, unsigned long buf_len, gfp_t gfp_mask,
   773			bool vec, int iov_count, bool check_iter_count, int rw)
   774	{
   775		int ret = 0;
   776	
   777		if (vec) {
   778			struct iovec fast_iov[UIO_FASTIOV];
   779			struct iovec *iov = fast_iov;
   780			struct iov_iter iter;
   781	
   782			ret = import_iovec(rw, ubuf, iov_count ? iov_count : buf_len,
   783					UIO_FASTIOV, &iov, &iter);
   784			if (ret < 0)
   785				return ret;
   786	
   787			if (iov_count) {
   788				/* SG_IO howto says that the shorter of the two wins */
   789				iov_iter_truncate(&iter, buf_len);
   790				if (check_iter_count && !iov_iter_count(&iter)) {
   791					kfree(iov);
   792					return -EINVAL;
   793				}
   794			}
   795	
   796			ret = blk_rq_map_user_iov(req->q, req, map_data, &iter,
   797					gfp_mask);
   798			kfree(iov);
   799		} else if (buf_len) {
   800			ret = blk_rq_map_user(req->q, req, map_data, ubuf, buf_len,
   801					gfp_mask);
   802		}
   803		return ret;
   804	}
   805	EXPORT_SYMBOL(blk_rq_map_user_io);
   806	
   807	/**
   808	 * blk_rq_unmap_user - unmap a request with user data
   809	 * @bio:	       start of bio list
   810	 *
   811	 * Description:
   812	 *    Unmap a rq previously mapped by blk_rq_map_user(). The caller must
   813	 *    supply the original rq->bio from the blk_rq_map_user() return, since
   814	 *    the I/O completion may have changed rq->bio.
   815	 */
   816	int blk_rq_unmap_user(struct bio *bio)
   817	{
   818		struct bio *next_bio;
   819		int ret = 0, ret2;
   820	
   821		while (bio) {
   822			if (bio->bi_private) {
 > 823				struct bio_map_data *bmd = bio->bi_private;
   824	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
