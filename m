Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A9315D49;
	Mon, 12 Jan 2026 21:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253340; cv=none; b=h0t/owfXYsuDzCP3iZ+cYTqob4DCLE9nWQxPEKgFSUdHCT/6YJ7c2siU0dDKgsMV42ctdHS7uo2BoBvhHbgjdVdi7dlbuotrFiRifrTBsxjLluQJInhuj6e8f9jmTbgets37N2W0YdNkxzcLDfVz1Md8FBxQaSepGdR2BgB3pS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253340; c=relaxed/simple;
	bh=/hG6GjtvPRYwpj6gwW0kBPgES+TF+Z4/iJD94oTpbO4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TMOTVY+W3HX9yBStM0w/7JOSGIJIJVdlW2olsSft0NSN6dZ2xXck7k5rOwXddTWhuqGvEVUrdRx9GmpZetSzn61v4RdgkyqedAkMGl091XcKKRpMcyXNtAThpNSTOo+4sEKyqPj9X9CBCyEeDD84jGcTo1j++3pck56oqvDEXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBJOI0vG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBJOI0vG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768253339; x=1799789339;
  h=date:from:to:cc:subject:message-id;
  bh=/hG6GjtvPRYwpj6gwW0kBPgES+TF+Z4/iJD94oTpbO4=;
  b=OBJOI0vGLS48niU0ANfL8nVOD8PbqXuJKvrORrCpLjJgd+gO83QWaR1t
   aRqPChd2wjAgNVNceZeyREJhPsxfvnyDsl7E33amo00FZryaAw6yCk8Ip
   0tk7+ImdaPUll+Wt3tUcZHBUHW/G17tUw3+xnMG++eghxgCPDEo1B85mH
   QXyiDJ8rGxzAzCK8VzPKBkjZqw8o0akS2hscei0sewf1xMfncLBp3/OZ0
   I7dqvm7pMsW9LtnmTfOfSfn2CMe/YO7NoyI+6v0AXcRN1FNZFSz0Z/Wiy
   MOPteA8d3oKR7HUrajI6/RMGiZzL8bVGzkG8ePtkFpW/4NZKXCCISeNWn
   A==;
X-CSE-ConnectionGUID: 3KG7QQRoRM69ewH6ZEi+Yg==
X-CSE-MsgGUID: Umm1dBJAT6uEy+DNEGjw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68743148"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68743148"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:28:58 -0800
X-CSE-ConnectionGUID: hwTfw1tvTdiO/iDqnkMs5w==
X-CSE-MsgGUID: U5ofMK/gTIOX/k6IfiJQug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204287916"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jan 2026 13:28:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfPT3-00000000DtY-3j2f;
	Mon, 12 Jan 2026 21:28:53 +0000
Date: Tue, 13 Jan 2026 05:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 6/17] fs/netfs/write_issue.c:800:9:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202601130526.3DYjEbHp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: bff57425b6c4175565f1c28fa1f3d53ef7de7703 [6/17] afs: Use a bvecq to hold dir content rather than folioq
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260113/202601130526.3DYjEbHp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130526.3DYjEbHp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130526.3DYjEbHp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/write_issue.c:800:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     800 |         return ret;
         |                ^~~
   fs/netfs/write_issue.c:750:9: note: initialize the variable 'ret' to silence this warning
     750 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +800 fs/netfs/write_issue.c

49866ce7ea8d41 David Howells 2024-12-16  734  
49866ce7ea8d41 David Howells 2024-12-16  735  /**
49866ce7ea8d41 David Howells 2024-12-16  736   * netfs_writeback_single - Write back a monolithic payload
49866ce7ea8d41 David Howells 2024-12-16  737   * @mapping: The mapping to write from
49866ce7ea8d41 David Howells 2024-12-16  738   * @wbc: Hints from the VM
bff57425b6c417 David Howells 2026-01-07  739   * @iter: Data to write.
49866ce7ea8d41 David Howells 2024-12-16  740   *
49866ce7ea8d41 David Howells 2024-12-16  741   * Write a monolithic, non-pagecache object back to the server and/or
49866ce7ea8d41 David Howells 2024-12-16  742   * the cache.
49866ce7ea8d41 David Howells 2024-12-16  743   */
49866ce7ea8d41 David Howells 2024-12-16  744  int netfs_writeback_single(struct address_space *mapping,
49866ce7ea8d41 David Howells 2024-12-16  745  			   struct writeback_control *wbc,
49866ce7ea8d41 David Howells 2024-12-16  746  			   struct iov_iter *iter)
49866ce7ea8d41 David Howells 2024-12-16  747  {
49866ce7ea8d41 David Howells 2024-12-16  748  	struct netfs_io_request *wreq;
49866ce7ea8d41 David Howells 2024-12-16  749  	struct netfs_inode *ictx = netfs_inode(mapping->host);
49866ce7ea8d41 David Howells 2024-12-16  750  	int ret;
49866ce7ea8d41 David Howells 2024-12-16  751  
49866ce7ea8d41 David Howells 2024-12-16  752  	if (!mutex_trylock(&ictx->wb_lock)) {
49866ce7ea8d41 David Howells 2024-12-16  753  		if (wbc->sync_mode == WB_SYNC_NONE) {
49866ce7ea8d41 David Howells 2024-12-16  754  			netfs_stat(&netfs_n_wb_lock_skip);
49866ce7ea8d41 David Howells 2024-12-16  755  			return 0;
49866ce7ea8d41 David Howells 2024-12-16  756  		}
49866ce7ea8d41 David Howells 2024-12-16  757  		netfs_stat(&netfs_n_wb_lock_wait);
49866ce7ea8d41 David Howells 2024-12-16  758  		mutex_lock(&ictx->wb_lock);
49866ce7ea8d41 David Howells 2024-12-16  759  	}
49866ce7ea8d41 David Howells 2024-12-16  760  
49866ce7ea8d41 David Howells 2024-12-16  761  	wreq = netfs_create_write_req(mapping, NULL, 0, NETFS_WRITEBACK_SINGLE);
49866ce7ea8d41 David Howells 2024-12-16  762  	if (IS_ERR(wreq)) {
49866ce7ea8d41 David Howells 2024-12-16  763  		ret = PTR_ERR(wreq);
49866ce7ea8d41 David Howells 2024-12-16  764  		goto couldnt_start;
49866ce7ea8d41 David Howells 2024-12-16  765  	}
49866ce7ea8d41 David Howells 2024-12-16  766  
bff57425b6c417 David Howells 2026-01-07  767  	wreq->buffer.iter = *iter;
bff57425b6c417 David Howells 2026-01-07  768  
2b1424cd131cfa David Howells 2025-05-19  769  	__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &wreq->flags);
20d72b00ca814d David Howells 2025-05-19  770  	trace_netfs_write(wreq, netfs_write_trace_writeback_single);
49866ce7ea8d41 David Howells 2024-12-16  771  	netfs_stat(&netfs_n_wh_writepages);
49866ce7ea8d41 David Howells 2024-12-16  772  
49866ce7ea8d41 David Howells 2024-12-16  773  	if (__test_and_set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))
49866ce7ea8d41 David Howells 2024-12-16  774  		wreq->netfs_ops->begin_writeback(wreq);
49866ce7ea8d41 David Howells 2024-12-16  775  
bff57425b6c417 David Howells 2026-01-07  776  	for (int s = 0; s < NR_IO_STREAMS; s++) {
bff57425b6c417 David Howells 2026-01-07  777  		struct netfs_io_subrequest *subreq;
bff57425b6c417 David Howells 2026-01-07  778  		struct netfs_io_stream *stream = &wreq->io_streams[s];
49866ce7ea8d41 David Howells 2024-12-16  779  
bff57425b6c417 David Howells 2026-01-07  780  		if (!stream->avail)
bff57425b6c417 David Howells 2026-01-07  781  			continue;
49866ce7ea8d41 David Howells 2024-12-16  782  
bff57425b6c417 David Howells 2026-01-07  783  		netfs_prepare_write(wreq, stream, 0);
bff57425b6c417 David Howells 2026-01-07  784  
bff57425b6c417 David Howells 2026-01-07  785  		subreq = stream->construct;
bff57425b6c417 David Howells 2026-01-07  786  		subreq->len = iov_iter_count(iter);
bff57425b6c417 David Howells 2026-01-07  787  		stream->submit_len = subreq->len;
bff57425b6c417 David Howells 2026-01-07  788  
bff57425b6c417 David Howells 2026-01-07  789  		netfs_issue_write(wreq, stream);		
49866ce7ea8d41 David Howells 2024-12-16  790  	}
49866ce7ea8d41 David Howells 2024-12-16  791  
49866ce7ea8d41 David Howells 2024-12-16  792  	smp_wmb(); /* Write lists before ALL_QUEUED. */
49866ce7ea8d41 David Howells 2024-12-16  793  	set_bit(NETFS_RREQ_ALL_QUEUED, &wreq->flags);
49866ce7ea8d41 David Howells 2024-12-16  794  
49866ce7ea8d41 David Howells 2024-12-16  795  	mutex_unlock(&ictx->wb_lock);
2b1424cd131cfa David Howells 2025-05-19  796  	netfs_wake_collector(wreq);
49866ce7ea8d41 David Howells 2024-12-16  797  
20d72b00ca814d David Howells 2025-05-19  798  	netfs_put_request(wreq, netfs_rreq_trace_put_return);
49866ce7ea8d41 David Howells 2024-12-16  799  	_leave(" = %d", ret);
49866ce7ea8d41 David Howells 2024-12-16 @800  	return ret;

:::::: The code at line 800 was first introduced by commit
:::::: 49866ce7ea8d41a3dc198f519cc9caa2d6be1891 netfs: Add support for caching single monolithic objects such as AFS dirs

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
