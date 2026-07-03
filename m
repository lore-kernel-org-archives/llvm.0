Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67D519B5A3;
	Fri,  3 Jul 2026 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783042517; cv=none; b=PiUKBEJbddm9s9HU3BaJfCT2PeiSVA8RyQMC4auXOIcB2ErGJkX4vu62Ydh7UBbJSug1pmNmyLbtCyJ7X3v/G3T438+MAOW5iaUoNdU2zLd435aSkKX7JPTKgf+jE3tC4sqSSQN0aFg7Stvo+mIYP5IYx80yDdiqgKlZcprXEM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783042517; c=relaxed/simple;
	bh=nUIz3FTRothac2B8MMHLXKWG3Es+HHcQj/RpM4Ws/Hg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sWhs2NECJTKsGrKFAbr2vZjvT98UMR3+ezFoqeK1b6+JZTcRdu7mjKJ7gaT7NSPAEY6Z87z2+CnMqnXDBzqKa+u9rqtw6gfETFLW0LuqMGsoHVPQjuBNPinbzbQDOGwJQeZKMlbHgd9DL09S5YidQ7rmJ5SgO3p6YDUQZpQJvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXlAbq+i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXlAbq+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783042515; x=1814578515;
  h=date:from:to:cc:subject:message-id;
  bh=nUIz3FTRothac2B8MMHLXKWG3Es+HHcQj/RpM4Ws/Hg=;
  b=WXlAbq+ifE72OyJORg6X0/nZ5sKHVrFTGQRkoUFSdZL2EJ0vXJQ7h7R6
   TXd/U8zIv5vubuP8rf+Ew129Kf9E29Vo9/H/KxqGpnUVlW0d0nQkoDjss
   uc6LcPogHYFZyxej+WzwwxrPN2s9/g2LHEHHb3KLKYDZ9xDok//71TasM
   lLrUEtQHQF+LFHOGYKxq1x4hMQQHRNQJbbo68J4pUJSOdOHNtu5GApDxD
   azHFUYWIjhqLaS//FqjRWeRf4/lCJuTl7eZqzZdwisf7B4rpcteKjPKmx
   mfuevajtfAz3L1lJqSLt3ezGInTzb5/8OOr24Vev/zUjMdGAfFjN0gRDc
   w==;
X-CSE-ConnectionGUID: 852Ra/4kQPevU1SdiU5yAQ==
X-CSE-MsgGUID: Ea8ruQArSmmtu8LjEw7ejA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94395404"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="94395404"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 18:35:14 -0700
X-CSE-ConnectionGUID: kLBl3lRURTKZYnRglomzug==
X-CSE-MsgGUID: K700gsyuQmG9zpfUysZ9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="251924388"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2026 18:35:13 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfSo9-000000001N7-2mSE;
	Fri, 03 Jul 2026 01:35:09 +0000
Date: Fri, 03 Jul 2026 03:35:02 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 21/21] fs/9p/vfs_addr.c:106:22:
 warning: unused variable 'n'
Message-ID: <202607030306.D7Uwq0jT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   e291bb0346f243b63b5fca4ef35e440585cda032
commit: e291bb0346f243b63b5fca4ef35e440585cda032 [21/21] netfs: Combine prepare and issue ops and grab the buffers on request
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260703/202607030306.D7Uwq0jT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607030306.D7Uwq0jT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030306.D7Uwq0jT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/9p/vfs_addr.c:79:6: warning: variable 'len' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      79 |         if (err < 0)
         |             ^~~~~~~
   fs/9p/vfs_addr.c:90:51: note: uninitialized use occurs here
      90 |         return netfs_write_subrequest_terminated(subreq, len ?: err);
         |                                                          ^~~
   fs/9p/vfs_addr.c:79:2: note: remove the 'if' if its condition is always false
      79 |         if (err < 0)
         |         ^~~~~~~~~~~~
      80 |                 goto term;
         |                 ~~~~~~~~~
   fs/9p/vfs_addr.c:74:14: note: initialize the variable 'len' to silence this warning
      74 |         int err, len;
         |                     ^
         |                      = 0
>> fs/9p/vfs_addr.c:106:22: warning: unused variable 'n' [-Wunused-variable]
     106 |         int total = 0, err, n;
         |                             ^
   2 warnings generated.


vim +/n +106 fs/9p/vfs_addr.c

    92	
    93	/**
    94	 * v9fs_issue_read - Issue a read from 9P
    95	 * @subreq: The read to make
    96	 * @rctx: Read generation context
    97	 */
    98	static void v9fs_issue_read(struct netfs_io_subrequest *subreq)
    99	{
   100		struct netfs_io_request *rreq = subreq->rreq;
   101		struct iov_iter iter;
   102		struct p9_fid *fid = rreq->netfs_priv;
   103		char *target;
   104		unsigned long long pos = subreq->start + subreq->transferred;
   105		size_t len;
 > 106		int total = 0, err, n;
   107	
   108		err = netfs_prepare_read_buffer(subreq, INT_MAX);
   109		if (err < 0)
   110			goto term;
   111	
   112		iov_iter_bvec_queue(&iter, ITER_DEST, subreq->content.bvecq,
   113				    subreq->content.slot, subreq->content.offset, subreq->len);
   114	
   115		if (S_ISLNK(rreq->inode->i_mode)) {
   116			/* p9_client_readlink() must not be called for legacy protocols
   117			 * 9p2000 or 9p2000.u.
   118			 */
   119			BUG_ON(!p9_is_proto_dotl(fid->clnt));
   120			if (WARN_ON_ONCE(pos)) {
   121				/* reading a link at a non null offset should
   122				 * not happen
   123				 */
   124				err = -EIO;
   125				goto fill_subreq;
   126			}
   127			err = p9_client_readlink(fid, &target);
   128			if (err != 0)
   129				goto fill_subreq;
   130			len = min(strlen(target), subreq->len);
   131			total = copy_to_iter(target, len, &iter);
   132			kfree(target);
   133		} else {
   134			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
   135	
   136			total = p9_client_read(fid, pos, &iter, &err);
   137		}
   138	
   139	fill_subreq:
   140		/* if we just extended the file size, any portion not in
   141		 * cache won't be on server and is zeroes */
   142		if (subreq->rreq->origin != NETFS_UNBUFFERED_READ &&
   143		    subreq->rreq->origin != NETFS_DIO_READ)
   144			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
   145		if (pos + total >= i_size_read(rreq->inode))
   146			__set_bit(NETFS_SREQ_HIT_EOF, &subreq->flags);
   147		if (!err && total) {
   148			subreq->transferred += total;
   149			__set_bit(NETFS_SREQ_MADE_PROGRESS, &subreq->flags);
   150		}
   151	
   152	term:
   153		subreq->error = err;
   154		return netfs_read_subreq_terminated(subreq);
   155	}
   156	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
