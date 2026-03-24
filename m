Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609B39DBFF;
	Tue, 24 Mar 2026 03:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323176; cv=none; b=BuRQSRrM+C2XfLPiH8r8YK3WA1OU6PKaRdXR4+s07LqtFWkTQk4GLp5nRRPGd8p0HlR5tA0CJehNh3aDqc/kMiQEJaXaUXHODyKGyAUcgfNlM/DWUNGcAbBQxa4ZUyToJ3VRtzIobrPZ4MmJwtXe7tHs24iah8aEpyUpwSdXt3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323176; c=relaxed/simple;
	bh=omnRc6MIwnbZ8CivN0YpMMDodGb1JaNpI4qqo+h7G00=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EveI7plb8b0ab2PcnDDQR08hRLmNqqPLKQNKSRIoMADxPv4kcuL9DBYuPTF8/IeQWnioc9Cxuvzkjp1RamcgsK1VJttEuMOOfBpzHZWczL97QXytJwW+yuQniIizO8+0QFtdFFMlWHBDZVY8cOvo1JH8gSOOqQQhi0vZBU4CG4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeKOUNRO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeKOUNRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774323175; x=1805859175;
  h=date:from:to:cc:subject:message-id;
  bh=omnRc6MIwnbZ8CivN0YpMMDodGb1JaNpI4qqo+h7G00=;
  b=UeKOUNROvcfQ6mlGfO6YrrI2qK0WLxQ15zI57V8cSHQmbhdKIB+PO1V2
   ofKBqTiRjS0YP+zJU2a9bk6tvsD9rpi5opmusvmMn+1TLWnFSbkbK9ZRZ
   85eCphWAwx7xsdXxiFtugFAdxqbr6423eCpmDI+aX+GR113QRvxbqMbzO
   j0qNEdc/p5ot/C4/EHmYienD0wbmG9ccYpB3/emUigYfVBrHojxL+9Iri
   HVPDx98WY45K4PSirWDXFeAunAuZP+vJXLdGwoPn/K0pPpLb3XwqlZQ3P
   2man2RbSKJDrIGWB5WkFFwnqnLZcOUWy7ZG2IUdKpgf3kMlXXZFo2VYkT
   w==;
X-CSE-ConnectionGUID: hWPm3zQKSzSo/PvRaBVfyg==
X-CSE-MsgGUID: d82hB/YGSla3ZQthIAHXtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79190031"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="79190031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 20:32:50 -0700
X-CSE-ConnectionGUID: 6GBpeUJvSxaaM2fQd7HJxA==
X-CSE-MsgGUID: tIHrqe6LSJyXNI4H5bsNGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="225889471"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Mar 2026 20:32:48 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4sVa-000000003jf-0Pjd;
	Tue, 24 Mar 2026 03:32:46 +0000
Date: Tue, 24 Mar 2026 11:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 37/42]
 fs/netfs/direct_read.c:86:20: warning: variable 'len' is uninitialized when
 used here
Message-ID: <202603241112.FsdhQVi1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   ae7ccdf83025020c44837849de26fb4546fbf825
commit: e7c8280c95acfbbef1fc569cbb950835ab68c7f2 [37/42] netfs: Implement bounce-buffering for unbuffered/DIO read
config: x86_64-randconfig-011-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241112.FsdhQVi1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241112.FsdhQVi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241112.FsdhQVi1-lkp@intel.com/

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
   113		return 0;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
