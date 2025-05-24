Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4952F2A;
	Sat, 24 May 2025 08:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748073639; cv=none; b=eVK6lT4GobtL7Yk/qdY92B39mexjAvuDToBY4155DmbUA0/hjkbEGVFh6Qa93IL5K/gmeSYehY6ju4MxltdrbOngvHk+51vdsX5VBEHmqWU6aMOVxMfSvTxWwZLX4WrUbdvYuIHoumiAoI9+SejZZIaHXRv4sq25nO7Yuvyz0ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748073639; c=relaxed/simple;
	bh=8h4Sda7ZZVDCmzh5vBGFoBFlnQlDuOJ32LiYd1ofcVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWfg/c9PETepFqdsMhdm7+dxVMfRyGW9sg21z6/KzUq2L2qfa19w9qvxvo0EP/47XdB6SW612lOMbt+T/in6SXS59noWMYzRBARkZqvPzyn5s5t/jn6c7aNt6Km7aVgp0oXenCPrtgKfzpcMKFn+LWZKNM1LFC6FD+MckZdYNcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ch1K6zot; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ch1K6zot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748073637; x=1779609637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8h4Sda7ZZVDCmzh5vBGFoBFlnQlDuOJ32LiYd1ofcVQ=;
  b=Ch1K6zot52uPav1+vGjGJyokN2vhwMJbqGmdF/DvJfGVd2bFceg5aOVm
   xrQILTsZ/axwAyabOPK7HC4cmQgQuB4xcz0m5uHYITil4OgutZguzvasM
   Lkz24yLkfpPbY+CXtN5lg1NaMCvvLG+itPo8+UnfhS44x5MpVtGPHfjZ5
   hP45+K23a+zV6qojmw0AOCnG5u4h6TWg5+eS9VRweRr/kuiSOqwD8xLwP
   m6v/ukudwO7r4W4pArJ8CESqLm95NGKC4rgBpHfXZgA2WwHJx8UlLeJH8
   MXgTs6kRpvJVjWNO5mjGGZwLMamqEI+O3KDuANIannShYxXBTCD7WaEQ+
   w==;
X-CSE-ConnectionGUID: tX0oOAUvQFKkEdUWRHMt1A==
X-CSE-MsgGUID: XXoeG1v3TzCHFgHZBOVJEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49376998"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="49376998"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 01:00:34 -0700
X-CSE-ConnectionGUID: viqMJeQHQii88Crok3CCTw==
X-CSE-MsgGUID: 0Rc10P8YSCKBBYUfVKzjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141390367"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 May 2025 01:00:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIjny-000R2m-1M;
	Sat, 24 May 2025 08:00:30 +0000
Date: Sat, 24 May 2025 15:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Westgaard Ry <hans.westgaard.ry@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LUCI Bot <vijayendra.suman@oracle.com>,
	=?iso-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>,
	Vegard Nossum <vegard.nossum@oracle.com>
Subject: [jlayton:uek-localio 1790/2262] net/rds/rdma.c:596:27: warning:
 variable 'local_vec' set but not used
Message-ID: <202505241500.l5ICS3KH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 26ecf98be5bc33038c1bb44213e4ffa9fe06e5a3 [1790/2262] rds: copy_from_user only once per rds_sendmsg system call
config: arm-randconfig-003-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241500.l5ICS3KH-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241500.l5ICS3KH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241500.l5ICS3KH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/rds/rdma.c:38:
   In file included from net/rds/trace.h:19:
   net/rds/rds.h:940:22: error: no member named 'net' in 'possible_net_t'
     940 |                         return sk->sk_net.net->ns.inum;
         |                                ~~~~~~~~~~ ^
>> net/rds/rdma.c:596:27: warning: variable 'local_vec' set but not used [-Wunused-but-set-variable]
     596 |         struct rds_iovec __user *local_vec;
         |                                  ^
   1 warning and 1 error generated.


vim +/local_vec +596 net/rds/rdma.c

b55cdb771fa421 Andy Grover       2012-02-03  582  
b55cdb771fa421 Andy Grover       2012-02-03  583  /*
b55cdb771fa421 Andy Grover       2012-02-03  584   * The application asks for a RDMA transfer.
b55cdb771fa421 Andy Grover       2012-02-03  585   * Extract all arguments and set up the rdma_op
b55cdb771fa421 Andy Grover       2012-02-03  586   */
784360a037ded7 Ka-Cheong Poon    2020-10-09  587  static int rds_cmsg_rdma_args(struct rds_sock *rs, struct rds_message *rm,
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  588  			      struct cmsghdr *cmsg, struct rds_iov_vector *iov)
b55cdb771fa421 Andy Grover       2012-02-03  589  {
b55cdb771fa421 Andy Grover       2012-02-03  590  	struct rds_rdma_args *args;
b55cdb771fa421 Andy Grover       2012-02-03  591  	struct rm_rdma_op *op = &rm->rdma;
6d337b99d35943 Dan Carpenter     2010-09-18  592  	int nr_pages;
45de215356daa1 Gerd Rausch       2025-04-16  593  	unsigned int nr_bytes;
45de215356daa1 Gerd Rausch       2025-04-16  594  	struct page **pages = NULL;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  595  	struct rds_iovec *vec;
45de215356daa1 Gerd Rausch       2025-04-16 @596  	struct rds_iovec __user *local_vec;
45de215356daa1 Gerd Rausch       2025-04-16  597  	unsigned int i, j;
b55cdb771fa421 Andy Grover       2012-02-03  598  	int ret = 0;
b55cdb771fa421 Andy Grover       2012-02-03  599  
b55cdb771fa421 Andy Grover       2012-02-03  600  	if (cmsg->cmsg_len < CMSG_LEN(sizeof(struct rds_rdma_args))
b55cdb771fa421 Andy Grover       2012-02-03  601  	    || rm->rdma.op_active)
b55cdb771fa421 Andy Grover       2012-02-03  602  		return -EINVAL;
fc8162e3c034af Andy Grover       2010-10-28  603  
b55cdb771fa421 Andy Grover       2012-02-03  604  	args = CMSG_DATA(cmsg);
fc8162e3c034af Andy Grover       2010-10-28  605  
761f0801f71ca0 Ka-Cheong Poon    2017-10-20  606  	if (ipv6_addr_any(&rs->rs_bound_addr)) {
45de215356daa1 Gerd Rausch       2025-04-16  607  		ret = -ENOTCONN; /* XXX not a great errno */
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  608  		goto out_ret;
fc8162e3c034af Andy Grover       2010-10-28  609  	}
fc8162e3c034af Andy Grover       2010-10-28  610  
45de215356daa1 Gerd Rausch       2025-04-16  611  	if (args->nr_local > (u64)UINT_MAX) {
45de215356daa1 Gerd Rausch       2025-04-16  612  		ret = -EMSGSIZE;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  613  		goto out_ret;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  614  	}
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  615  	if (iov->iv_entries != args->nr_local) {
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  616  		ret = -EINVAL;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  617  		goto out_ret;
fc8162e3c034af Andy Grover       2010-10-28  618  	}
fc8162e3c034af Andy Grover       2010-10-28  619  
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  620  	nr_pages = iov->iv_tot_pages;
b55cdb771fa421 Andy Grover       2012-02-03  621  	pages = kcalloc(nr_pages, sizeof(struct page *), GFP_KERNEL);
b55cdb771fa421 Andy Grover       2012-02-03  622  	if (!pages) {
45de215356daa1 Gerd Rausch       2025-04-16  623  		ret = -ENOMEM;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  624  		goto out_ret;
45de215356daa1 Gerd Rausch       2025-04-16  625  	}
2eafa1746f1787 Hans Westgaard Ry 2020-01-15  626  
b55cdb771fa421 Andy Grover       2012-02-03  627  	op->op_write = !!(args->flags & RDS_RDMA_READWRITE);
b55cdb771fa421 Andy Grover       2012-02-03  628  	op->op_fence = !!(args->flags & RDS_RDMA_FENCE);
b55cdb771fa421 Andy Grover       2012-02-03  629  	op->op_notify = !!(args->flags & RDS_RDMA_NOTIFY_ME);
b55cdb771fa421 Andy Grover       2012-02-03  630  	op->op_silent = !!(args->flags & RDS_RDMA_SILENT);
df1f937209703c Bang Nguyen       2012-04-13  631  	op->op_remote_complete = !!(args->flags & RDS_RDMA_REMOTE_COMPLETE);
b55cdb771fa421 Andy Grover       2012-02-03  632  	op->op_active = 1;
b55cdb771fa421 Andy Grover       2012-02-03  633  	op->op_recverr = rs->rs_recverr;
eff5f53bef75c0 Andy Grover       2009-02-24  634  	WARN_ON(!nr_pages);
b55cdb771fa421 Andy Grover       2012-02-03  635  	op->op_sg = rds_message_alloc_sgs(rm, nr_pages);
eff5f53bef75c0 Andy Grover       2009-02-24  636  
5bb487dd85f8a8 Bang Nguyen       2012-12-27  637  	if (op->op_notify || op->op_recverr || rds_async_send_enabled) {
eff5f53bef75c0 Andy Grover       2009-02-24  638  		/* We allocate an uninitialized notifier here, because
eff5f53bef75c0 Andy Grover       2009-02-24  639  		 * we don't want to do that in the completion handler. We
eff5f53bef75c0 Andy Grover       2009-02-24  640  		 * would have to use GFP_ATOMIC there, and don't want to deal
eff5f53bef75c0 Andy Grover       2009-02-24  641  		 * with failed allocations.
eff5f53bef75c0 Andy Grover       2009-02-24  642  		 */
f544722b07d772 Bang Nguyen       2012-02-19  643  		op->op_notifier = kzalloc(sizeof(struct rds_notifier), GFP_KERNEL);
b55cdb771fa421 Andy Grover       2012-02-03  644  		if (!op->op_notifier) {
eff5f53bef75c0 Andy Grover       2009-02-24  645  			ret = -ENOMEM;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  646  			goto out_pages;
eff5f53bef75c0 Andy Grover       2009-02-24  647  		}
b55cdb771fa421 Andy Grover       2012-02-03  648  		op->op_notifier->n_user_token = args->user_token;
f544722b07d772 Bang Nguyen       2012-02-19  649  		op->op_notifier->n_status = RDS_RDMA_SEND_SUCCESS;
eff5f53bef75c0 Andy Grover       2009-02-24  650  	}
eff5f53bef75c0 Andy Grover       2009-02-24  651  
eff5f53bef75c0 Andy Grover       2009-02-24  652  	/* The cookie contains the R_Key of the remote memory region, and
eff5f53bef75c0 Andy Grover       2009-02-24  653  	 * optionally an offset into it. This is how we implement RDMA into
eff5f53bef75c0 Andy Grover       2009-02-24  654  	 * unaligned memory.
eff5f53bef75c0 Andy Grover       2009-02-24  655  	 * When setting up the RDMA, we need to add that offset to the
eff5f53bef75c0 Andy Grover       2009-02-24  656  	 * destination address (which is really an offset into the MR)
eff5f53bef75c0 Andy Grover       2009-02-24  657  	 * FIXME: We may want to move this into ib_rdma.c
eff5f53bef75c0 Andy Grover       2009-02-24  658  	 */
b55cdb771fa421 Andy Grover       2012-02-03  659  	op->op_rkey = rds_rdma_cookie_key(args->cookie);
b55cdb771fa421 Andy Grover       2012-02-03  660  	op->op_remote_addr = args->remote_vec.addr + rds_rdma_cookie_offset(args->cookie);
eff5f53bef75c0 Andy Grover       2009-02-24  661  
eff5f53bef75c0 Andy Grover       2009-02-24  662  	nr_bytes = 0;
eff5f53bef75c0 Andy Grover       2009-02-24  663  
eff5f53bef75c0 Andy Grover       2009-02-24  664  	rdsdebug("RDS: rdma prepare nr_local %llu rva %llx rkey %x\n",
eff5f53bef75c0 Andy Grover       2009-02-24  665  	       (unsigned long long)args->nr_local,
eff5f53bef75c0 Andy Grover       2009-02-24  666  	       (unsigned long long)args->remote_vec.addr,
b55cdb771fa421 Andy Grover       2012-02-03  667  	       op->op_rkey);
b55cdb771fa421 Andy Grover       2012-02-03  668  
b55cdb771fa421 Andy Grover       2012-02-03  669  	local_vec = (struct rds_iovec __user *)(unsigned long) args->local_vec_addr;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  670  	vec = iov->iv_vec;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  671  	for (i = 0; i < args->nr_local; i++, vec++) {
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  672  		/* don't need to check, rds_rdma_pages() verified nr will be +nonzero */
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  673  		unsigned int nr = iov->iv_nr_pages[i];
eff5f53bef75c0 Andy Grover       2009-02-24  674  
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  675  		rs->rs_user_addr  = vec->addr;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  676  		rs->rs_user_bytes = vec->bytes;
eff5f53bef75c0 Andy Grover       2009-02-24  677  
eff5f53bef75c0 Andy Grover       2009-02-24  678  		/* If it's a WRITE operation, we want to pin the pages for reading.
eff5f53bef75c0 Andy Grover       2009-02-24  679  		 * If it's a READ operation, we need to pin the pages for writing.
eff5f53bef75c0 Andy Grover       2009-02-24  680  		 */
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  681  		ret = rds_pin_pages(vec->addr, nr, pages, !op->op_write);
45de215356daa1 Gerd Rausch       2025-04-16  682  		if (ret < 0)
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  683  			goto out_pages;
eff5f53bef75c0 Andy Grover       2009-02-24  684  
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  685  		nr_bytes += vec->bytes;
eff5f53bef75c0 Andy Grover       2009-02-24  686  
eff5f53bef75c0 Andy Grover       2009-02-24  687  		for (j = 0; j < nr; j++) {
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  688  			unsigned int offset = vec->addr & ~PAGE_MASK;
b55cdb771fa421 Andy Grover       2012-02-03  689  			struct scatterlist *sg;
eff5f53bef75c0 Andy Grover       2009-02-24  690  
b55cdb771fa421 Andy Grover       2012-02-03  691  			sg = &op->op_sg[op->op_nents + j];
eff5f53bef75c0 Andy Grover       2009-02-24  692  			sg_set_page(sg, pages[j],
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  693  					min_t(unsigned int, vec->bytes, PAGE_SIZE - offset),
eff5f53bef75c0 Andy Grover       2009-02-24  694  					offset);
eff5f53bef75c0 Andy Grover       2009-02-24  695  
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  696  			vec->addr  += sg->length;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  697  			vec->bytes -= sg->length;
eff5f53bef75c0 Andy Grover       2009-02-24  698  		}
eff5f53bef75c0 Andy Grover       2009-02-24  699  
b55cdb771fa421 Andy Grover       2012-02-03  700  		op->op_nents += nr;
eff5f53bef75c0 Andy Grover       2009-02-24  701  	}
eff5f53bef75c0 Andy Grover       2009-02-24  702  
eff5f53bef75c0 Andy Grover       2009-02-24  703  	if (nr_bytes > args->remote_vec.bytes) {
eff5f53bef75c0 Andy Grover       2009-02-24  704  		rdsdebug("RDS nr_bytes %u remote_bytes %u do not match\n",
eff5f53bef75c0 Andy Grover       2009-02-24  705  				nr_bytes,
eff5f53bef75c0 Andy Grover       2009-02-24  706  				(unsigned int) args->remote_vec.bytes);
eff5f53bef75c0 Andy Grover       2009-02-24  707  		ret = -EINVAL;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  708  		goto out_pages;
eff5f53bef75c0 Andy Grover       2009-02-24  709  	}
b55cdb771fa421 Andy Grover       2012-02-03  710  	op->op_bytes = nr_bytes;
eff5f53bef75c0 Andy Grover       2009-02-24  711  
45de215356daa1 Gerd Rausch       2025-04-16  712  	ret = 0;
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  713  out_pages:
eff5f53bef75c0 Andy Grover       2009-02-24  714  	kfree(pages);
26ecf98be5bc33 Hans Westgaard Ry 2022-03-21  715  out_ret:
b55cdb771fa421 Andy Grover       2012-02-03  716  	if (ret)
eff5f53bef75c0 Andy Grover       2009-02-24  717  		rds_rdma_free_op(op);
45de215356daa1 Gerd Rausch       2025-04-16  718  
45de215356daa1 Gerd Rausch       2025-04-16  719  	rds_stats_inc(s_send_rdma);
b55cdb771fa421 Andy Grover       2012-02-03  720  
b55cdb771fa421 Andy Grover       2012-02-03  721  	return ret;
eff5f53bef75c0 Andy Grover       2009-02-24  722  }
eff5f53bef75c0 Andy Grover       2009-02-24  723  

:::::: The code at line 596 was first introduced by commit
:::::: 45de215356daa1d42d3b51f53cd6833192451a11 net/rds: Rewind RDS to 8cbd9606a636 in order to rebase UEK commits on top of it

:::::: TO: Gerd Rausch <gerd.rausch@oracle.com>
:::::: CC: LUCI Bot <vijayendra.suman@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
