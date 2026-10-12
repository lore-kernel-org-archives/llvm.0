Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C953B18DB1A;
	Mon, 12 Oct 2026 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795013; cv=none; b=PuCiDCswK2WtK7V5SnIjXNuUXX2z/vdQZP4ZFPeql19xxVsd2d32gYhhxUzWecXg0mDK0s8JjpQPNqWXw67SKAELLuj+506tQWGGBMGXMbNVPHGMQxUJqQlvgr2LheSHl2wdCTE/RuZVD6F+CR35eJF0D0ZkWlLFqNiCOGXZhis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795013; c=relaxed/simple;
	bh=7ISCil6EtesuDmXpsnwTWhFBP9AJy83KsX+CKGxVGeo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j6ZENZKwx+HwDKldzrouAVKJYaIba/6EZsZIZ/IbqR7HaseBcHsQk/D4bhqkf4+40689T+cbby8ZsS7SaSy19A+3ocVAEsxRsWP1sSsoYcjgVhmUdaeuYcmJnfxW2SiL8NWJgcIXn0uV5rCPRsMMu8bv7vem7F3Ds/TVJ9tIHkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxTUUhgQ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxTUUhgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791795011; x=1823331011;
  h=date:from:to:cc:subject:message-id;
  bh=7ISCil6EtesuDmXpsnwTWhFBP9AJy83KsX+CKGxVGeo=;
  b=fxTUUhgQz/aKcnUrRmoGY1OG7dffP0bQOfE/sAr/Rnx6UB8zSXc5re0C
   OGWEP0A10NEz3XW58Z6gnp531sssAb7nJMJLmr1VdRU5wY93EcpWiCPrI
   CJELPWtklBnDLdPq++UCOmNRSgY24FRmxadvlBulZ1bbPfHxqaWwVnBVQ
   xrdxVpbpoJ6mv0q3Q3ynIEUVeWGm/KhITQ8A/S4XUO9wwC+VD5kB5puvZ
   /BS06+UPh5PK/Rhx46e9BavbPEV47awXk4uLo5r01HWE2jTCBuGCcj8yP
   bzbkOPKAAI+P59B2TOJrpB33psHV3uo1vAjL7z57tOuf9vnwARVKeONXM
   w==;
X-CSE-ConnectionGUID: DJtUv2hBRDyy1ghPfItA9g==
X-CSE-MsgGUID: QXiB+y7dR466UYH1jUwFVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="405827"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="405827"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 01:50:10 -0700
X-CSE-ConnectionGUID: J5OBVFvgS2mYXYqdTVRUeQ==
X-CSE-MsgGUID: MxEyQm6gTFqmQYA/tnhELw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="757948"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 01:50:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGBjS-00000000BG5-1wdQ;
	Mon, 12 Oct 2026 08:50:06 +0000
Date: Mon, 12 Oct 2026 16:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 30/30]
 fs/netfs/direct_write.c:128:7: warning: variable 'fpos2' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202610121609.YtjUCNyA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   870d31c7b4cbee9e73019466181a2e0c2c1094f8
commit: 870d31c7b4cbee9e73019466181a2e0c2c1094f8 [30/30] netfs: Support encryption on unbuffered/DIO write
config: x86_64-randconfig-1006-20261012 (https://download.01.org/0day-ci/archive/20261012/202610121609.YtjUCNyA-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610121609.YtjUCNyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121609.YtjUCNyA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/direct_write.c:128:7: warning: variable 'fpos2' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
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
   fs/netfs/direct_write.c:125:6: warning: variable 'fpos2' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/direct_write.c:171:53: note: uninitialized use occurs here
     171 |         ret = netfs_rmw_read(wreq, before ?: after, fpos1, fpos2);
         |                                                            ^~~~~
   fs/netfs/direct_write.c:125:2: note: remove the 'if' if its condition is always true
     125 |         if (to == end && subreq->start + subreq->len < to) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/direct_write.c:125:6: warning: variable 'fpos2' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
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
>> fs/netfs/direct_write.c:563:22: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     563 |                 stream->buffered = ret;
         |                                    ^~~
   fs/netfs/direct_write.c:475:13: note: initialize the variable 'ret' to silence this warning
     475 |         ssize_t ret, n;
         |                    ^
         |                     = 0
   4 warnings generated.


vim +128 fs/netfs/direct_write.c

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
 > 128			if (before && part <= 2 * PAGE_SIZE) {
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
