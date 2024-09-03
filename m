Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56E3C24;
	Tue,  3 Sep 2024 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725370931; cv=none; b=A8lJ64iEeP32uy50FPgY2V+F6wZa7VAX7QRo/O3g+e5Bp+LjaOXKhxtMPhnw9Egf3EPJ/LPcWWMK35rO9dqGrdsL6KI78cbBaBrHHLPNHmHpOEl7+coE/Gr+clMcbu/NUbVrc5wdheKQR5ok0laESYk7cyk72vg0sg938dIuGfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725370931; c=relaxed/simple;
	bh=u8DeD3PaSnyFMp0QvJxlAqqKmZJn+go3uOgiOgi6bIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2TGi6Ie2jU9uAgs2qeOA1b/8NgqrZsHW69Wvu0QFvqhNkkuQvELyJZfNTQDc89d0PD+IgSWiuSU3JEo912mMzxJPeGTYGcf8SsuU+2D2dGxBotdZGBpbc532qx8ZwoJpsou+fGU/ReeeIOujrsqsrXlQXb9zqi4kDW0SyS3NJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcGiooq7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcGiooq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725370930; x=1756906930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u8DeD3PaSnyFMp0QvJxlAqqKmZJn+go3uOgiOgi6bIY=;
  b=AcGiooq7f2VuEwpAW5ADNiSOyTLzjCDgiNxlfKrU4uVT4SOJyjn9a0ty
   PacpHk2OCLLDjBfdxTuOwY0Pzw/f9V9PmiMRa9e6zJ/tje0W/t7Crm6hF
   Co8TzsmQcgLMbd7n9Bx5+TylV/Wv3jh3QlLd7bwmsfYspZSIgAdvx9Ock
   tDNp1b0PmFaV+WNlNwgjvtuazHCwenzrVZNFsqkR4E1tFUIzSiKD4iDjj
   +XchHYGeXeUl0KVsvMDKMc7SnJf6vTNcM/jTebTm6NBfYo85GUbokSUoT
   FyrsIRr5g5eQmZJaWRdmUlXeybaWrxi0IBhlIndaOa3gfcxSaCr/JFkaD
   A==;
X-CSE-ConnectionGUID: /T7KfCSLT2GLhXblKFAS+w==
X-CSE-MsgGUID: ZB+b9G+USLuR7mQmB+BlnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23919384"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="23919384"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 06:42:09 -0700
X-CSE-ConnectionGUID: 5rL4ly9qRNCaSBhfBJ1djA==
X-CSE-MsgGUID: UvRMu4gsQGuLBl8b2nvKiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="69708049"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Sep 2024 06:42:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slTnJ-0006jM-1Q;
	Tue, 03 Sep 2024 13:42:05 +0000
Date: Tue, 3 Sep 2024 21:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 30/37] fs/netfs/misc.c:19:2: error: call to
 undeclared function 'mempool_free'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202409032102.xgZmaBlx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   3962f4beba4e7ffa6cfab018df8a612902a1d2c8
commit: d1be8ca79490c7d6d61fa36a6f05537ecc1f2edb [30/37] netfs: Add bounce buffering support
config: i386-buildonly-randconfig-003-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032102.xgZmaBlx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032102.xgZmaBlx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032102.xgZmaBlx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/misc.c:19:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      19 |         mempool_free(folio, &netfs_folio_pool);
         |         ^
>> fs/netfs/misc.c:61:11: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |                 folio = mempool_alloc(&netfs_folio_pool, gfp);
         |                         ^
>> fs/netfs/misc.c:61:9: error: incompatible integer to pointer conversion assigning to 'struct folio *' from 'int' [-Wint-conversion]
      61 |                 folio = mempool_alloc(&netfs_folio_pool, gfp);
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/mempool_free +19 fs/netfs/misc.c

    11	
    12	/*
    13	 * Discard our reference on the folio, returning it to the memory pool if we
    14	 * hold the last ref on it.  The filesystem may have used MSG_SPLICE_PAGES on
    15	 * it and so it may have extra refs still.
    16	 */
    17	void netfs_mempool_folio_put(struct folio *folio)
    18	{
  > 19		mempool_free(folio, &netfs_folio_pool);
    20	}
    21	
    22	/*
    23	 * Reset the subrequest iterator to refer just to the region remaining to be
    24	 * read.  The iterator may or may not have been advanced by socket ops or
    25	 * extraction ops to an extent that may or may not match the amount actually
    26	 * read.
    27	 */
    28	void netfs_reset_iter(struct netfs_io_subrequest *subreq)
    29	{
    30		struct iov_iter *io_iter = &subreq->io_iter;
    31		size_t remain = subreq->len - subreq->transferred;
    32	
    33		if (io_iter->count > remain)
    34			iov_iter_advance(io_iter, io_iter->count - remain);
    35		else if (io_iter->count < remain)
    36			iov_iter_revert(io_iter, remain - io_iter->count);
    37		iov_iter_truncate(&subreq->io_iter, remain);
    38	}
    39	
    40	
    41	/*
    42	 * Create the specified folio in the specified buffer attached to the request.
    43	 * The folios are marked with NETFS_BUF_PUT_MARK so that we know that these
    44	 * need freeing later.
    45	 *
    46	 * We set the index on the folio so that we can keep track of gaps in the
    47	 * buffer for when we're cleaning it up.
    48	 */
    49	struct folio *netfs_add_folio_to_buffer(struct rolling_buffer *roll,
    50						pgoff_t index, gfp_t gfp)
    51	{
    52		struct folio *folio;
    53	
    54		for (;;) {
    55			if (rolling_buffer_make_space(roll) == 0)
    56				break;
    57			msleep(10);
    58		}
    59	
    60		for (;;) {
  > 61			folio = mempool_alloc(&netfs_folio_pool, gfp);
    62			if (folio)
    63				break;
    64			msleep(10);
    65		}
    66	
    67		folio->index = index;
    68		rolling_buffer_append(roll, folio, NETFS_FLAG_PUT_MARK);
    69		return folio;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
