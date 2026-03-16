Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5668538734D;
	Mon, 16 Mar 2026 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773655674; cv=none; b=Tdt3u/2IXYQgEEp4agKyHPDKW0fvcuqpr9UKIC/NjL7MLxKD6e9B19nJSkY4xpJwYk95gjZaI0+yPuQ0l3momy6kB9h9wBgJeKxgIwP+8JIZYF5xFmhCVKFNi8M5g93iCGg7OfJGltpla41t4TB1gFCUTPGuMYf2NhZ92VlAtYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773655674; c=relaxed/simple;
	bh=I3e6pQjacJL2CC/LlYa1aPvv2alogsi3mE2PqaAgWhA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JW16bubqUVTsAJXtXajRz7J95dihng6nbeR3Wo/WAZhAwO0m9mu7YAW1e3iPhnIqonFGdlKPjYENAHxnnJ1JB1UCsiGF3b6Xu59kqBTDkFMFVExrzP8Q5/u4va+1QVCxRko2KgbECIUf5vzzsLG9CK5sFU7cjJAn0mlU0FRk6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTpUzlsp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTpUzlsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773655672; x=1805191672;
  h=date:from:to:cc:subject:message-id;
  bh=I3e6pQjacJL2CC/LlYa1aPvv2alogsi3mE2PqaAgWhA=;
  b=MTpUzlspUbf13pxTWqfc+EUPWBrHb0uDkTYme3UpzbLqpBOyFVAZnktC
   r6GakW416Vn18YCCeKzU8FxSvWrzq5a5NvXdMhol3tLvUUnAOWIM0pc7D
   THZA9g4B1cyOc233RajOEYG4EvkhasIU1AaRMawxTiQkog+iVT2XNOuCU
   4/oaIQ8AUk9kk99+hOG1Y4nHVmvWRtBsA5QeCPQrk05KjZlluJUcvoF0j
   ZOqLfZ2vPX0NsUQp8oYztt2DlojsTidBKJgLIJhR7WaRX7p5sO4FzMmsW
   0nYuTc2jBrrnJWgxF1TQXHGjv/UlGyMmVCAWcwkkMIW0l3YYTnCBFRlXi
   A==;
X-CSE-ConnectionGUID: wavP+F94TPCVBjrBZbhS1Q==
X-CSE-MsgGUID: OpTiQllWSze2ygvwPc70kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85367964"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="85367964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 03:07:51 -0700
X-CSE-ConnectionGUID: xBAPKy3/SH+9NZqqrwM+Zg==
X-CSE-MsgGUID: 6LsVsalCRgaNrXG0TW9xBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="246758780"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Mar 2026 03:07:50 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w24rT-000000000T4-3u7I;
	Mon, 16 Mar 2026 10:07:47 +0000
Date: Mon, 16 Mar 2026 18:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 25/25] fs/ceph/addr.c:273:18:
 warning: declaration of 'struct netfs_read_context' will not be visible
 outside of this function
Message-ID: <202603161823.0DLM0r9w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   1aea2bfdfc039b008ff97eec23c755b5ac4b25a4
commit: 1aea2bfdfc039b008ff97eec23c755b5ac4b25a4 [25/25] netfs: Combine prepare and issue ops and grab the buffers on request
config: x86_64-randconfig-015-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161823.0DLM0r9w-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161823.0DLM0r9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161823.0DLM0r9w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/addr.c:273:18: warning: declaration of 'struct netfs_read_context' will not be visible outside of this function [-Wvisibility]
     273 |                                       struct netfs_read_context *rctx)
         |                                              ^
   fs/ceph/addr.c:297:8: error: call to undeclared function 'netfs_subreq_get_buffer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     297 |         err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
         |               ^
   fs/ceph/addr.c:312:37: error: too many arguments to function call, expected single argument 'subreq', have 2 arguments
     312 |         netfs_mark_read_submission(subreq, rctx);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~
   include/linux/netfs.h:456:6: note: 'netfs_mark_read_submission' declared here
     456 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq);
         |      ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:327:71: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     327 |         err = copy_to_iter(iinfo->inline_data + subreq->start, len, &subreq->io_iter);
         |                                                                      ~~~~~~  ^
   fs/ceph/addr.c:344:13: warning: declaration of 'struct netfs_read_context' will not be visible outside of this function [-Wvisibility]
     344 |                                  struct netfs_read_context *rctx)
         |                                         ^
   fs/ceph/addr.c:363:44: error: incompatible pointer types passing 'struct netfs_read_context *' to parameter of type 'struct netfs_read_context *' [-Werror,-Wincompatible-pointer-types]
     363 |                 err = ceph_netfs_issue_op_inline(subreq, rctx);
         |                                                          ^~~~
   fs/ceph/addr.c:273:38: note: passing argument to parameter 'rctx' here
     273 |                                       struct netfs_read_context *rctx)
         |                                                                  ^
   fs/ceph/addr.c:401:8: error: call to undeclared function 'netfs_subreq_get_buffer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     401 |         err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
         |               ^
   fs/ceph/addr.c:425:11: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     425 |                 subreq->io_iter.count = len;
         |                 ~~~~~~  ^
   fs/ceph/addr.c:427:44: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     427 |                 err = iov_iter_get_pages_alloc2(&subreq->io_iter, &pages, len, &page_off);
         |                                                  ~~~~~~  ^
   fs/ceph/addr.c:443:47: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     443 |                 osd_req_op_extent_osd_iter(req, 0, &subreq->io_iter);
         |                                                     ~~~~~~  ^
   fs/ceph/addr.c:455:37: error: too many arguments to function call, expected single argument 'subreq', have 2 arguments
     455 |         netfs_mark_read_submission(subreq, rctx);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~
   include/linux/netfs.h:456:6: note: 'netfs_mark_read_submission' declared here
     456 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq);
         |      ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^
   fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
   fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
   fs/ceph/addr.c:517:22: error: no member named 'sreq_max_len' in 'struct netfs_io_stream'
     517 |         rreq->io_streams[0].sreq_max_len = fsc->mount_options->rsize;
         |         ~~~~~~~~~~~~~~~~~~~ ^
   fs/ceph/addr.c:545:17: error: incompatible function pointer types initializing 'int (*)(struct netfs_io_subrequest *)' with an expression of type 'int (struct netfs_io_subrequest *, struct netfs_read_context *)' [-Wincompatible-function-pointer-types]
     545 |         .issue_read             = ceph_netfs_issue_read,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   2 warnings and 14 errors generated.


vim +273 fs/ceph/addr.c

   271	
   272	static int ceph_netfs_issue_op_inline(struct netfs_io_subrequest *subreq,
 > 273					      struct netfs_read_context *rctx)
   274	{
   275		struct netfs_io_request *rreq = subreq->rreq;
   276		struct inode *inode = rreq->inode;
   277		struct ceph_mds_reply_info_parsed *rinfo;
   278		struct ceph_mds_reply_info_in *iinfo;
   279		struct ceph_mds_request *req;
   280		struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
   281		struct ceph_inode_info *ci = ceph_inode(inode);
   282		ssize_t err;
   283		size_t len;
   284		int mode;
   285	
   286		if (rreq->origin != NETFS_UNBUFFERED_READ &&
   287		    rreq->origin != NETFS_DIO_READ)
   288			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
   289		__clear_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
   290	
   291		if (subreq->start >= inode->i_size) {
   292			__set_bit(NETFS_SREQ_HIT_EOF, &subreq->flags);
   293			err = 0;
   294			goto out;
   295		}
   296	
   297		err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
   298		if (err < 0)
   299			return err;
   300	
   301		/* We need to fetch the inline data. */
   302		mode = ceph_try_to_choose_auth_mds(inode, CEPH_STAT_CAP_INLINE_DATA);
   303		req = ceph_mdsc_create_request(mdsc, CEPH_MDS_OP_GETATTR, mode);
   304		if (IS_ERR(req))
   305			return PTR_ERR(req);
   306	
   307		req->r_ino1 = ci->i_vino;
   308		req->r_args.getattr.mask = cpu_to_le32(CEPH_STAT_CAP_INLINE_DATA);
   309		req->r_num_caps = 2;
   310	
   311		/* After this point, we're not allowed to return an error. */
   312		netfs_mark_read_submission(subreq, rctx);
   313	
   314		err = ceph_mdsc_do_request(mdsc, NULL, req);
   315		if (err < 0)
   316			goto out;
   317	
   318		rinfo = &req->r_reply_info;
   319		iinfo = &rinfo->targeti;
   320		if (iinfo->inline_version == CEPH_INLINE_NONE) {
   321			/* The data got uninlined */
   322			ceph_mdsc_put_request(req);
   323			return 1;
   324		}
   325	
   326		len = min_t(size_t, iinfo->inline_len - subreq->start, subreq->len);
   327		err = copy_to_iter(iinfo->inline_data + subreq->start, len, &subreq->io_iter);
   328		if (err == 0) {
   329			err = -EFAULT;
   330		} else {
   331			subreq->transferred += err;
   332			err = 0;
   333		}
   334	
   335		ceph_mdsc_put_request(req);
   336	out:
   337		subreq->error = err;
   338		trace_netfs_sreq(subreq, netfs_sreq_trace_io_progress);
   339		netfs_read_subreq_terminated(subreq);
   340		return -EIOCBQUEUED;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
