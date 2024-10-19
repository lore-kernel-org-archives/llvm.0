Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2591D0E10;
	Sat, 19 Oct 2024 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729307606; cv=none; b=MoNWy1RbyH+1lieD+47n9DaRLDUufCEJ3gBWKXhjfoJ8K+CUEFiTDk2a3LrifSq8ODUCjLnLy7nIKvySG6+wrquSeFy83myQejqo+P6/uSSMQz+IpM8uuhru5who/Rtd16IATqfC1JsVjjWEjE1TJgB//nbYWMvvDgZzpaUjAg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729307606; c=relaxed/simple;
	bh=K1DDiyyJFmyX3NDcj+7loBjGjsMitL4UrFk5Q+3hEec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ucsj0ldb/I2KfcghJBYcna2AEPcOoLF88z9q9MxZnIVfjFiOaeYr+J+JuyheN7W6KaqaKgAPd2n4OtiujBevg0dZOv8oFE252wfJTRJUYeTkxSHFMOXNxaxd4MK/4l9Er94Q0A9esORLrPr2Lgu7zQLHgtWt6dvdEGtoMxb0LqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Juj86sM9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Juj86sM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729307605; x=1760843605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K1DDiyyJFmyX3NDcj+7loBjGjsMitL4UrFk5Q+3hEec=;
  b=Juj86sM97vyS8vQhCuX//n4i7Tj5EHJ1aK0s3eEvjbPvtEawfHH+mIzL
   scasKTqwYhJU3dUjbfdnYEoOD6lXfvaj4wRvHL+WY9QOR/XQGrELkZ9Gf
   UJN8SFfTn5EIIbrMiBeEdARy1wEe1qllgWrATecIPt408Ky3SvBxDsPki
   HBxNs29SkvGQ6Ii5LRvAvHrqHBV3XJz2H1s6N0BndUdSelZ2NineD+Y6W
   at9Le30bf3wveJMPY5ivIF7l934mncCCuTcTrCu40ggWwgMGlbChtqI95
   HCsmQ+XYVlD65V5KvNf78fdcNQEBuULXqR33+EmSSbajUW36mLYgxOD6c
   Q==;
X-CSE-ConnectionGUID: vnQAJZe5QH6n5+ZoWYyWlw==
X-CSE-MsgGUID: 5S8kilBxRMK7/kAci+WL4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29012316"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29012316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 20:13:22 -0700
X-CSE-ConnectionGUID: 0Yl2qMTZRRixcc56LWcCMg==
X-CSE-MsgGUID: R4Wv5t7DS8CVrTmET+K6Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="116490933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2024 20:13:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1zu1-000OdX-1Y;
	Sat, 19 Oct 2024 03:13:17 +0000
Date: Sat, 19 Oct 2024 11:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bernd Schubert <bschubert@ddn.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v4 08/15] fuse: {uring} Add uring sqe commit and
 fetch support
Message-ID: <202410191037.neVRHnb0-lkp@intel.com>
References: <20241016-fuse-uring-for-6-10-rfc4-v4-8-9739c753666e@ddn.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-fuse-uring-for-6-10-rfc4-v4-8-9739c753666e@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c3836482481200ead7b416ca80c68a29cfdaabd]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-to-fuse_dev_end_requests-and-make-non-static/20241016-084030
base:   0c3836482481200ead7b416ca80c68a29cfdaabd
patch link:    https://lore.kernel.org/r/20241016-fuse-uring-for-6-10-rfc4-v4-8-9739c753666e%40ddn.com
patch subject: [PATCH RFC v4 08/15] fuse: {uring} Add uring sqe commit and fetch support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241019/202410191037.neVRHnb0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191037.neVRHnb0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191037.neVRHnb0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dev_uring.c:533:15: warning: variable 'hash' set but not used [-Wunused-but-set-variable]
     533 |         unsigned int hash;
         |                      ^
   fs/fuse/dev_uring.c:712:3: error: use of undeclared identifier 'ret'
     712 |                 ret = fuse_uring_commit_fetch(cmd, issue_flags, fc);
         |                 ^
   1 warning and 1 error generated.


vim +/hash +533 fs/fuse/dev_uring.c

   521	
   522	/* FUSE_URING_REQ_COMMIT_AND_FETCH handler */
   523	static int fuse_uring_commit_fetch(struct io_uring_cmd *cmd, int issue_flags,
   524					   struct fuse_conn *fc)
   525	{
   526		const struct fuse_uring_cmd_req *cmd_req = io_uring_sqe_cmd(cmd->sqe);
   527		struct fuse_ring_ent *ring_ent;
   528		int err;
   529		struct fuse_ring *ring = fc->ring;
   530		struct fuse_ring_queue *queue;
   531		uint64_t commit_id = cmd_req->commit_id;
   532		struct fuse_pqueue fpq;
 > 533		unsigned int hash;
   534		struct fuse_req *req;
   535	
   536		err = -ENOTCONN;
   537		if (!ring)
   538			return err;
   539	
   540		queue = ring->queues[cmd_req->qid];
   541		if (!queue)
   542			return err;
   543		fpq = queue->fpq;
   544	
   545		spin_lock(&queue->lock);
   546		/* Find a request based on the unique ID of the fuse request
   547		 * This should get revised, as it needs a hash calculation and list
   548		 * search. And full struct fuse_pqueue is needed (memory overhead).
   549		 * As well as the link from req to ring_ent.
   550		 */
   551		hash = fuse_req_hash(commit_id);
   552		req = fuse_request_find(&fpq, commit_id);
   553		err = -ENOENT;
   554		if (!req) {
   555			pr_info("qid=%d commit_id %llu not found\n", queue->qid,
   556				commit_id);
   557			spin_unlock(&queue->lock);
   558			return err;
   559		}
   560		ring_ent = req->ring_entry;
   561		req->ring_entry = NULL;
   562	
   563		err = fuse_ring_ring_ent_unset_userspace(ring_ent);
   564		if (err != 0) {
   565			pr_info_ratelimited("qid=%d commit_id %llu state %d",
   566					    queue->qid, commit_id, ring_ent->state);
   567			spin_unlock(&queue->lock);
   568			return err;
   569		}
   570	
   571		ring_ent->cmd = cmd;
   572		spin_unlock(&queue->lock);
   573	
   574		/* without the queue lock, as other locks are taken */
   575		fuse_uring_commit(ring_ent, issue_flags);
   576	
   577		/*
   578		 * Fetching the next request is absolutely required as queued
   579		 * fuse requests would otherwise not get processed - committing
   580		 * and fetching is done in one step vs legacy fuse, which has separated
   581		 * read (fetch request) and write (commit result).
   582		 */
   583		fuse_uring_next_fuse_req(ring_ent, queue);
   584		return 0;
   585	}
   586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
