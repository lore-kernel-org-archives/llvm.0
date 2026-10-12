Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88246DFEE;
	Mon, 12 Oct 2026 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795192; cv=none; b=DtiGcZLd2AcOdseAXe5/3LPQF306O3meGFgRf5L1QsQL5bLPUYb/ROTtr4Ei05teWwib843dPruX6JS1PW19dzPHNH9hvj/85r0QRDGwPt81RKVuUvk++gYV66zNUd0Tk9VYhL5eEh/wenqr6N/7dnzwFKB58M59/Gp0MIWEBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795192; c=relaxed/simple;
	bh=+s7hEjworOHhNb0b2A452OZm1DnkwBzB1PdtrLn27VM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RsaS+sQT8czWv3mxuCy5Yw6Mm7zGIR3eHyKG6viPFcfwNJMCoxt+pH+bYiMXj4SDI/MzBNqwAPOnSW5BJvOpoJb9NYQeQdGNMav+3AcJfagZz1g6zd23FQDMu+KBAeqvkBYGFICGVQ6qmRMyypFXcg0wM2S9OIwXasHZyn8atyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXsQxkK6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXsQxkK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791795191; x=1823331191;
  h=date:from:to:cc:subject:message-id;
  bh=+s7hEjworOHhNb0b2A452OZm1DnkwBzB1PdtrLn27VM=;
  b=SXsQxkK6zWK0Kg/mzb4o92Bsg0GZPiIXTIirYzf8yYSWDIFkGQwi3JdH
   Vbna86nq+5tW1zdvtqZmIsRGE6i5BFI4ryy2ikWoEv29TntZY6UwawbUL
   WtQV5xMELUhJ5oM8zbHgub5yzEfDw/9UqgPlhU3pTTW11nYPyUr0kdX/j
   1Z/yqwAxvAECKcZn4U0XdWMmp3KI8eTb997bqjWqdQ+PXQJI66zq5KSbi
   UDfDobUAXH1TsmY6wCXygIKor3HJv+EFJb0EcrGOcrKQ+OKTTqs6WNGwX
   6HOZh57QOtDjy/z/n5t2Mns3Ws+hR8pQlpQc01Sa3xtgeM5ACcYiUvs3H
   g==;
X-CSE-ConnectionGUID: 8jX9oqueSjm8u92OKb2LeQ==
X-CSE-MsgGUID: woOgcAkRTUuFbxL4eEh3tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="383182"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="383182"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 01:53:10 -0700
X-CSE-ConnectionGUID: RIDsohrxSC+sHHbzshCCPg==
X-CSE-MsgGUID: 6hGqDbTgTWiAIlNIeggCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="821385"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Oct 2026 01:53:09 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGBmM-00000000BGL-37mu;
	Mon, 12 Oct 2026 08:53:06 +0000
Date: Mon, 12 Oct 2026 16:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 30/30]
 fs/netfs/direct_write.c:125:6: warning: variable 'fpos2' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202610121621.oAIK4kei-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   870d31c7b4cbee9e73019466181a2e0c2c1094f8
commit: 870d31c7b4cbee9e73019466181a2e0c2c1094f8 [30/30] netfs: Support encryption on unbuffered/DIO write
config: x86_64-randconfig-1007-20261012 (https://download.01.org/0day-ci/archive/20261012/202610121621.oAIK4kei-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610121621.oAIK4kei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121621.oAIK4kei-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/direct_write.c:128:7: warning: variable 'fpos2' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     128 |                 if (before && part <= 2 * PAGE_SIZE) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/direct_write.c:171:53: note: uninitialized use occurs here
     171 |         ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
         |                                                            ^~~~~
   fs/netfs/direct_write.c:128:3: note: remove the 'if' if its condition is always false
     128 |                 if (before && part <= 2 * PAGE_SIZE) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     129 |                         struct bvecq *bq;
         |                         ~~~~~~~~~~~~~~~~~
     130 |                         size_t page0 = PAGE_SIZE - before->bv[0].bv_offset;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     131 |                         int slot;
         |                         ~~~~~~~~~
     132 | 
     133 |                         if (part <= page0) {
         |                         ~~~~~~~~~~~~~~~~~~~~
     134 |                                 before->bv[0].bv_len = part;
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     135 |                                 bvecq_filled_to(before, 1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     136 |                                 goto do_it;
         |                                 ~~~~~~~~~~~
     137 |                         }
         |                         ~
     138 | 
     139 |                         bq = wreq->encrypt_cursor.bvecq;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     140 |                         slot = wreq->encrypt_cursor.slot + 1;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     141 |                         if (slot > bq->nr_slots) {
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
     142 |                                 bq = bq->next;
         |                                 ~~~~~~~~~~~~~~
     143 |                                 slot = 0;
         |                                 ~~~~~~~~~
>> fs/netfs/direct_write.c:125:6: warning: variable 'fpos2' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/direct_write.c:171:53: note: uninitialized use occurs here
     171 |         ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
         |                                                            ^~~~~
   fs/netfs/direct_write.c:125:2: note: remove the 'if' if its condition is always true
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/direct_write.c:125:6: warning: variable 'fpos2' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |             ^~~~~~~~~
   fs/netfs/direct_write.c:171:53: note: uninitialized use occurs here
     171 |         ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
         |                                                            ^~~~~
   fs/netfs/direct_write.c:125:6: note: remove the '&&' if its condition is always true
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |             ^~~~~~~~~~~~
   fs/netfs/direct_write.c:103:21: note: initialize the variable 'fpos2' to silence this warning
     103 |         uoff_t fpos1, fpos2;
         |                            ^
         |                             = 0
   fs/netfs/direct_write.c:563:22: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     563 |                 stream->buffered = ret;
         |                                    ^~~
   fs/netfs/direct_write.c:475:13: note: initialize the variable 'ret' to silence this warning
     475 |         ssize_t ret, n;
         |                    ^
         |                     = 0
   4 warnings generated.


vim +125 fs/netfs/direct_write.c

    93	
    94	/*
    95	 * Read gaps at either end of the bounce buffer that need to be filled for an
    96	 * RMW cycle.
    97	 */
    98	static ssize_t netfs_unbuffered_rmw(struct netfs_io_request *wreq,
    99					    struct netfs_io_subrequest *subreq,
   100					    uoff_t to, uoff_t end)
   101	{
   102		struct bvecq *before = NULL, *after = NULL;
   103		uoff_t fpos1, fpos2;
   104		size_t bsize = wreq->crypto_bsize;
   105		int ret;
   106	
   107		_enter("%llx,%llx", to, end);
   108	
   109		/* Build a buffer chain to cover the gaps.  If we have two gaps, they
   110		 * must be discontiguous and so we will need two separate bvecqs for
   111		 * that; however, if the entire write spans at most two pages, just do
   112		 * one read for both gaps plus the middle.
   113		 */
   114		if (subreq->start < wreq->start) {
   115			before = bvecq_alloc_one(2, wreq->gfp, false);
   116			if (!before)
   117				return -ENOMEM;
   118			fpos1 = subreq->start;
   119			before->bv[0] = wreq->encrypt_cursor.bvecq->bv[wreq->encrypt_cursor.slot];
   120			before->bv[0].bv_offset += wreq->encrypt_cursor.offset;
   121			before->bv[0].bv_len = bsize;
   122			bvecq_filled_to(before, 1);
   123		}
   124	
 > 125		if (to == end && subreq->start + subreq->len < to) {
   126			size_t part = end - subreq->start;
   127	
   128			if (before && part <= 2 * PAGE_SIZE) {
   129				struct bvecq *bq;
   130				size_t page0 = PAGE_SIZE - before->bv[0].bv_offset;
   131				int slot;
   132	
   133				if (part <= page0) {
   134					before->bv[0].bv_len = part;
   135					bvecq_filled_to(before, 1);
   136					goto do_it;
   137				}
   138	
   139				bq = wreq->encrypt_cursor.bvecq;
   140				slot = wreq->encrypt_cursor.slot + 1;
   141				if (slot > bq->nr_slots) {
   142					bq = bq->next;
   143					slot = 0;
   144				}
   145	
   146				before->bv[0].bv_len = page0;
   147				before->bv[1] = bq->bv[slot];
   148				before->bv[1].bv_len = part - page0;
   149				bvecq_filled_to(before, 2);
   150				goto do_it;
   151			}
   152	
   153			after = bvecq_alloc_one(1, wreq->gfp, false);
   154			if (!after) {
   155				ret = -ENOMEM;
   156				goto out;
   157			}
   158			fpos2 = to - bsize;
   159			after->bv[0] = wreq->bounce_alloc.bvecq->bv[wreq->bounce_alloc.slot];
   160			after->bv[0].bv_offset = to & (PAGE_SIZE - 1);
   161			after->bv[0].bv_len = bsize;
   162			bvecq_filled_to(after, 1);
   163		}
   164	
   165		if (before && after) {
   166			before->next = after;
   167			after->prev = before;
   168		}
   169	
   170	do_it:
   171		ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
   172	
   173	out:
   174		bvecq_put(before ?: after);
   175		return ret;
   176	}
   177	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
