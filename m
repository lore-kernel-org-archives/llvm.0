Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8821439A04A;
	Sun,  3 May 2026 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823822; cv=none; b=hHTw0SxwVo85gUQXaFCPI5aUmcduHMmiKeBcMG0a76pIzTFN8EXkJVjziMPEmEJ2ExQCgM3gu88O6wXo9zC5CcJ3rhUquYym4JKMwW1jlF2u/ndpwYJl/oyp7hUMCm86tWni2gr6j3rS1WmjaECXFm+og2Om03Mg/cdsaDBGqos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823822; c=relaxed/simple;
	bh=99dknMTlQ36PpB7io88p6RWauIRnxW8/whEoC79KnwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cPZGH7H5pkPFahu4zN9M7UHen6Iq7H2rb2u0+9NuD+xCP2HdsXNM+hnCAnfZI0MOad8bj6smtDIvum0HyU0Fhsb5ireAMb3FuOsiaKzEqDrNi27f+NqjluwUXiNooV21Mb0i9Oh5aQOTSumAzuRDo7JJ80sAXaJH/3dAAGDhJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWeUm/mN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWeUm/mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777823821; x=1809359821;
  h=date:from:to:cc:subject:message-id;
  bh=99dknMTlQ36PpB7io88p6RWauIRnxW8/whEoC79KnwE=;
  b=EWeUm/mN34O8CoBKokF6f66PjdXeoLL8HJxc+kyBV3kw50qBFiRuwJJA
   FPcZyZBO5TvVjBXr+LUREdWtoOi1977cM7qH86v8ilYr7JQCHYVmN3Tfl
   OewbPBXA0uaaI6zGG4bQXhnXlgqItV1t+BeHZYsPSBIWMb5ZRANGp/mbT
   Rox/ge0xV6wjVl8C51jnBBEYLmNm3iQlwEIIPoyVbeaN8h6luANRaisMH
   V2MHNUjdZATUVo1L8FBsUA4pcFhWBE1muHFXzYwCCgpSs2qzWu5s5pbUX
   G5CmOrL4u0mbg1I2Kyo9E8/gkB8PFRngALn/iRm5SfdBgzV7xvBqstRxy
   Q==;
X-CSE-ConnectionGUID: 0t7pr1v+SS2KPxyH52KpNw==
X-CSE-MsgGUID: Ee6z1C1gTVyWPyQvmkE26g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="89393162"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="89393162"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 08:56:59 -0700
X-CSE-ConnectionGUID: LREcr6NGTo2WOAG0nFttgg==
X-CSE-MsgGUID: iM+EOubVRi23ak2VpFVdew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235185722"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2026 08:56:57 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJZBe-000000002hh-0Du2;
	Sun, 03 May 2026 15:56:54 +0000
Date: Sun, 03 May 2026 23:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 61/68]
 fs/netfs/direct_read.c:86:20: warning: variable 'len' is uninitialized when
 used here
Message-ID: <202605032336.npxYVN3G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   390dd59a3747b71c4dcff11b2cc5240385cbfedf
commit: f4bb7e2028c1ca4880ac08cbba94ccac225eb695 [61/68] netfs: Implement bounce-buffering for unbuffered/DIO read
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605032336.npxYVN3G-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032336.npxYVN3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605032336.npxYVN3G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/direct_read.c:86:20: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
      86 |                 len = round_down(len, rreq->crypto_bsize);
         |                                  ^~~
   include/linux/math.h:35:28: note: expanded from macro 'round_down'
      35 | #define round_down(x, y) ((x) & ~__round_mask(x, y))
         |                            ^
   fs/netfs/direct_read.c:74:12: note: initialize the variable 'len' to silence this warning
      74 |         size_t len;
         |                   ^
         |                    = 0
   1 warning generated.


vim +/len +86 fs/netfs/direct_read.c

    64	
    65	/*
    66	 * Prepare the buffer for the read RPC.  Limits are applied and the buffer may
    67	 * be rounded down.  Bounce bufferage will be added if necessary.
    68	 */
    69	int netfs_prepare_unbuffered_read_buffer(struct netfs_io_subrequest *subreq,
    70						 unsigned int max_segs)
    71	{
    72		struct netfs_io_request *rreq = subreq->rreq;
    73		struct netfs_io_stream *stream = &rreq->io_streams[0];
    74		size_t len;
    75		int ret;
    76	
    77		bvecq_pos_set(&subreq->dispatch_pos, &stream->dispatch_cursor);
    78		bvecq_pos_set(&subreq->content, &stream->dispatch_cursor);
    79	
    80		/* Limit encrypted reads so that we don't split an encryption block
    81		 * across two subrequests unless the filesystem doesn't support blocks
    82		 * that big.
    83		 */
    84		if (subreq->len > rreq->crypto_bsize &&
    85		    test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags)) {
  > 86			len = round_down(len, rreq->crypto_bsize);
    87			if (WARN_ON_ONCE(len == 0))
    88				return -EIO;
    89		}
    90	
    91		/* Expand the bounce buffer so that we've got something to read into. */
    92		if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
    93			ret = bvecq_buffer_add_space(&rreq->bounce_cursor,
    94						     &rreq->bounce_alloc_to,
    95						     subreq->start + subreq->len,
    96						     round_up(rreq->start + rreq->len,
    97							      rreq->crypto_bsize),
    98						     false, GFP_KERNEL);
    99			if (ret < 0)
   100				return ret;
   101		}
   102	
   103		len = bvecq_slice(&stream->dispatch_cursor, subreq->len, max_segs,
   104				  &subreq->nr_segs);
   105	
   106		if (len < subreq->len) {
   107			subreq->len = len;
   108			trace_netfs_sreq(subreq, netfs_sreq_trace_limited);
   109		}
   110	
   111		stream->buffered   -= subreq->len;
   112		stream->issue_from += subreq->len;
   113		rreq->submitted = stream->issue_from;
   114	
   115		if (stream->buffered == 0)
   116			netfs_all_subreqs_queued(rreq);
   117		return 0;
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
