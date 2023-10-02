Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D751BDDC;
	Mon,  2 Oct 2023 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696260027; x=1727796027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KlsCi2P6EbATloKuzNprfWLLxWroXZS57++I5ObNBHc=;
  b=ZNs/MJ0SfwFflWPkwmTDLWpqXyXlliq8ZhmPm4INtiiJiyQQfrokVI3m
   r7hZaCaA0rmwuQB5FGjFXFif7T5Ra2IHQR0BidP5QO4snixf+ypp/ucrb
   F0hHq7uHcU89B9NYFqkwwSQVfwqi3iuxL46pVhqFmfRLM7IT6z/u6Td8C
   m6/0zwgANtVsKRu5tPFya4haWVysefnSkumfKYTRWRc+IcSolWittTthO
   FPwT233RpM6FVf9Vm57iiPFa4vhRKAsjvaTUGfFkat+1nZmSjJZIsZqWQ
   vBWmH6qxwGFoE1i/RLtPr6Si7Dnua4sj7rGJQBhEkjMLFEMcswtTU1Md9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362037519"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="362037519"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 08:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="785806162"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="785806162"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 02 Oct 2023 08:20:01 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnKiG-00069J-0V;
	Mon, 02 Oct 2023 15:20:00 +0000
Date: Mon, 2 Oct 2023 23:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 25/34] fs/netfs/io.c:871:6: warning: variable
 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202310022348.lsNkvm7R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   8b08a7e2d3217f7054808246fc559c867f54a524
commit: 051a41b875d04f931d3416d7b15e4cd3f6ba4edb [25/34] netfs: Implement DIO write support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231002/202310022348.lsNkvm7R-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310022348.lsNkvm7R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310022348.lsNkvm7R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/io.c:871:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (len2 && !netfs_rmw_read_one(rreq, start2, len2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/io.c:898:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   fs/netfs/io.c:871:2: note: remove the 'if' if its condition is always false
           if (len2 && !netfs_rmw_read_one(rreq, start2, len2))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/io.c:869:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (len1 && !netfs_rmw_read_one(rreq, start1, len1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/io.c:898:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   fs/netfs/io.c:869:2: note: remove the 'if' if its condition is always false
           if (len1 && !netfs_rmw_read_one(rreq, start1, len1))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/io.c:849:13: note: initialize the variable 'ret' to silence this warning
           ssize_t ret;
                      ^
                       = 0
   2 warnings generated.


vim +871 fs/netfs/io.c

   837	
   838	/*
   839	 * Begin the process of reading in one or two chunks of data for use by
   840	 * unbuffered write to perform an RMW cycle.  We don't read directly into the
   841	 * write buffer as this may get called to redo the read in the case that a
   842	 * conditional write fails due to conflicting 3rd-party modifications.
   843	 */
   844	ssize_t netfs_rmw_read(struct netfs_io_request *wreq, struct file *file,
   845			       unsigned long long start1, size_t len1,
   846			       unsigned long long start2, size_t len2)
   847	{
   848		struct netfs_io_request *rreq;
   849		ssize_t ret;
   850	
   851		_enter("RMW:R=%x %llx-%llx %llx-%llx",
   852		       rreq->debug_id, start1, start1 + len1 - 1, start2, start2 + len2 - 1);
   853	
   854		rreq = netfs_alloc_request(wreq->mapping, file,
   855					   start1, start2 - start1 + len2, NETFS_RMW_READ);
   856		if (IS_ERR(rreq))
   857			return PTR_ERR(rreq);
   858	
   859		INIT_WORK(&rreq->work, netfs_rreq_work);
   860	
   861		rreq->iter = wreq->io_iter;
   862		__set_bit(NETFS_RREQ_CRYPT_IN_PLACE, &rreq->flags);
   863		__set_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags);
   864	
   865		/* Chop the reads into slices according to what the netfs wants and
   866		 * submit each one.
   867		 */
   868		atomic_set(&rreq->nr_outstanding, 1);
   869		if (len1 && !netfs_rmw_read_one(rreq, start1, len1))
   870			goto out;
 > 871		if (len2 && !netfs_rmw_read_one(rreq, start2, len2))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
