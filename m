Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2DA3803E7;
	Sat,  2 May 2026 19:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777751833; cv=none; b=QjTXAzwM6c13SgXqDJN0/n1uAAQabyVW8nInGtaKHspW0DEjMhp4xRBllNY2BOk/1PgXIryg1H47P1GMfU8FsmVonl7hlvfqURle4AYHaItX8HLlKWKHyZ19Bf3vweFH4n3OG/f9ghHijqjXETELIUC8FVOdYraII+YjNE1BRug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777751833; c=relaxed/simple;
	bh=w6MCEgcGN02EdSWVxt2XdKSiMBc9rPD2ZjWZfV2sKt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a/ykfWQ2tT6qjwGIe5AqvgmcuB4dMgyuY/4SdK7hULlJTFkWNK8wgMQZJd1sxiBcTb/mLrzI+H7YsvdJLqipHho+q1ZJCHvvSZdy4rlOO+s1sCjPJ0uYMKc2PMzDUCBH1YH7mWfsuNa1w5fYOt92hK208Iboxfi5ke4Q3kyVH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ST6ot1gM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ST6ot1gM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777751831; x=1809287831;
  h=date:from:to:cc:subject:message-id;
  bh=w6MCEgcGN02EdSWVxt2XdKSiMBc9rPD2ZjWZfV2sKt4=;
  b=ST6ot1gMckD77kLimPsuRwcBttTal/rVzQJlnYtDlcMFW9pupQRLwtW1
   okrwVFbVDc/+ywFWNoMFojaNbjJd4ANiYa1F95Zg8UvAz5LIAOaEYiH4K
   Y1NRN7zjoRd+92X92W5JscCrkePqlMLUyzBtcZL3et/+zSLMPBaijYlwt
   ouaozB0i1i3yq9YTLPFNaVKMaklFO8ZDMindICdlQccHlsUEUVuEF+sM+
   +zhhe1obQcBwDZJetS4S4ojKzEn7VcVVQH3XXdlr5EA6mZeUn8DN9qBGm
   JHxRSfz21tAaaJUrc2OwWpWVoIp9TL5mZsBl4zWrAXsQRzAT8phq26HJ8
   Q==;
X-CSE-ConnectionGUID: PrNTCqXLRN2EYn+0dcPDzQ==
X-CSE-MsgGUID: 37DAAzAWRK+oOFJcB1UjzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89364208"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="89364208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 12:57:07 -0700
X-CSE-ConnectionGUID: 5CkYcYptTFuXRmHRPQQFNQ==
X-CSE-MsgGUID: MV81kAOJR9uiFiu/P2Huxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="228654899"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2026 12:57:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJGSW-000000005LJ-1qNM;
	Sat, 02 May 2026 19:57:04 +0000
Date: Sat, 02 May 2026 21:56:22 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 61/68]
 fs/netfs/direct_read.c:86:20: warning: variable 'len' is uninitialized when
 used here
Message-ID: <202605022132.rygxdHu6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   390dd59a3747b71c4dcff11b2cc5240385cbfedf
commit: f4bb7e2028c1ca4880ac08cbba94ccac225eb695 [61/68] netfs: Implement bounce-buffering for unbuffered/DIO read
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260502/202605022132.rygxdHu6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605022132.rygxdHu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605022132.rygxdHu6-lkp@intel.com/

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
