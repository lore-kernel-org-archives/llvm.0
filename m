Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DED2030A;
	Sat, 28 Mar 2026 00:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774656723; cv=none; b=kSEZTFlH68wFO+SueXitif7PCYDsf9HaW73/+tBczDRkjI1ZpGvpgFPbFlwz7kfNDghd8FrfTssQIWGbLr6jMtlA7Y8O9MwXa5QgZjhMVzZoJjFAa0UnCRcYx52r1mtD6ov16eSBgLEJbWpW/8N3j2ioM0zA8/a7gVcEVuYicX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774656723; c=relaxed/simple;
	bh=AyszHiWdziRoLb1iWHS1cjg93d0BaTifdC9H7Ou4Yug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fsbv1BAULqdMO+Pech+3DrTzGJLuWxR8E+FmB8PpvzAs/oDtClUYKYK/bGha1fGGQbPbpPiMgCKTaGSc9zgyT+PTXvkwG7fOlL74tF/iIAxZBbSC2fh9r0DbXxGo8u2t0P8b7wmp3ifERopXP2A1nid1g8VlSuuzcPKUkP+jt9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0ev9nLA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0ev9nLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774656721; x=1806192721;
  h=date:from:to:cc:subject:message-id;
  bh=AyszHiWdziRoLb1iWHS1cjg93d0BaTifdC9H7Ou4Yug=;
  b=i0ev9nLAh+ARyOYEafwzZlvY/dcW2kJ4jnNtwSJZkHy//kdN3Pd8q5Y9
   QqNTbKDK5f/KkwGU79vt52PJtzHd9JhUVt/mpYB5Nx2uT6sPRU3jejptx
   i0QSg+q0XNXT/SRF5J/bI4Vc+ymlxvZu8q43FsvwQR/+JFxXUt3EMZmUt
   sm9EiX/ZC8jYSfuRNDpFv7SAGU3kjZs9aIIpb+wBEpomlAjSkDZvynMD7
   WiI27T7G6+ys56aMoFilXUbrVKPnKlnoX2z7P/f8I0+VqYv4lsOnxbsbD
   0i6FPvHMcm5FtRWqH4LlFoFQIecwvcb/7BpP9HanF+FYpV7uq3ZVh1RSY
   g==;
X-CSE-ConnectionGUID: qhbLVYEkQS+A8xDDe3Sb2g==
X-CSE-MsgGUID: oKQbPCI+R0qU1moUwLfGVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74767992"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="74767992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 17:12:00 -0700
X-CSE-ConnectionGUID: u+F67PG8S0iHkQHtwbVIcA==
X-CSE-MsgGUID: SNyrNkVgQaWl9sRQQCvXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="220608112"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Mar 2026 17:11:58 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6HHQ-000000007aX-0zwr;
	Sat, 28 Mar 2026 00:11:56 +0000
Date: Sat, 28 Mar 2026 01:11:18 +0100
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 26/26] fs/9p/vfs_addr.c:79:6:
 warning: variable 'len' is used uninitialized whenever 'if' condition is true
Message-ID: <202603280121.jYMFC0hC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   13e05ee43d1290bb487ef5318b4d2d27be8ce4b5
commit: 13e05ee43d1290bb487ef5318b4d2d27be8ce4b5 [26/26] netfs: Combine prepare and issue ops and grab the buffers on request
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260328/202603280121.jYMFC0hC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280121.jYMFC0hC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280121.jYMFC0hC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/9p/vfs_addr.c:79:6: warning: variable 'len' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
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
   1 warning generated.
--
   fs/netfs/buffered_read.c:226:26: warning: unused variable 'stream' [-Wunused-variable]
     226 |         struct netfs_io_stream *stream = &rreq->io_streams[0];
         |                                 ^~~~~~
>> fs/netfs/buffered_read.c:223:6: warning: no previous prototype for function 'netfs_mark_read_submission' [-Wmissing-prototypes]
     223 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq)
         |      ^
   fs/netfs/buffered_read.c:223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     223 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq)
         | ^
         | static 
   2 warnings generated.


vim +79 fs/9p/vfs_addr.c

    66	
    67	/*
    68	 * Issue a subrequest to write to the server.
    69	 */
    70	static void v9fs_issue_write(struct netfs_io_subrequest *subreq)
    71	{
    72		struct iov_iter iter;
    73		struct p9_fid *fid = subreq->rreq->netfs_priv;
    74		int err, len;
    75	
    76		subreq->len = umin(subreq->len, fid->clnt->msize - P9_IOHDRSZ);
    77	
    78		err = netfs_prepare_write_buffer(subreq, INT_MAX);
  > 79		if (err < 0)
    80			goto term;
    81	
    82		iov_iter_bvec_queue(&iter, ITER_SOURCE, subreq->content.bvecq,
    83				    subreq->content.slot, subreq->content.offset, subreq->len);
    84	
    85		len = p9_client_write(fid, subreq->start, &iter, &err);
    86		if (len > 0)
    87			__set_bit(NETFS_SREQ_MADE_PROGRESS, &subreq->flags);
    88	
    89	term:
    90		return netfs_write_subrequest_terminated(subreq, len ?: err);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
