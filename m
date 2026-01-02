Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC07A42AB7;
	Fri,  2 Jan 2026 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767360248; cv=none; b=M5sA1nAI/V6Brz/pNlmDapOvXt5KDjaLIL2KqLpbT+x/hhd7cBWzK63eNOyPSGVQNwEHIK88dR66u2IvLbg+F82BmizyWNE7WV+dg8RXLbz13pkIbejU6U+s/b0Smt/1NoBFp6FCV0Hym3SqqhHi3fsoiNfT81IqMfTJK/um774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767360248; c=relaxed/simple;
	bh=v+vK2dRlsDt4lDXemA6AMM2udm5+8jvHECBvA1Y0GRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjJg/s+/VeartfycN6kr8B391MWN9kT6gLobVH3KlRU3DHP+wp98TZmkh/EpcYTM+hmjO3PHrsB7bUOV4rZDzJNT7RooNty7Ir3DAUNy1m54JMOMFZw7A1nT8yK49vR6uKTedlu93kUHrG/APiZl2XHVgiLBbwZ/scZ+C+yfk6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqdb9Oxl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqdb9Oxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767360246; x=1798896246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v+vK2dRlsDt4lDXemA6AMM2udm5+8jvHECBvA1Y0GRA=;
  b=fqdb9OxlzSGArXw+pgvEuqNZM263z5UQHcvSqJwJtKGRqLOmuOIiS1L5
   kzosvFAqGposEAuLYrI4rXWYPlHVAS9B2J4NaSJwFNgqpY/0iKSkqB+vt
   VsuPCXKYyOPeaI5yIW/00SQ9wr20bX7bl7fl5gDuHkKKVlX6ZorNoi7k/
   jxQ7+x8PqXVbHZ3wQXwN67AxuANKS1cT/iVFWPLHFVIlMEzmxi4KzFSAA
   cA2Oaa8RRd9ShgNjycp91PE5rSRsrFPrf8HV5qz85dzaqIoD4kvYR4JAb
   W2p+NwR3XjUW7OvYJt9qHqkG7RzxD9HJScxuNNKmzGRU1s6zgZ98kmkeY
   g==;
X-CSE-ConnectionGUID: L0aO6FlYTUGYt1hqV5ENvA==
X-CSE-MsgGUID: TjG8X5W5Tp2oMD25MYlsaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68759630"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68759630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 05:24:05 -0800
X-CSE-ConnectionGUID: pDfUrEEtR6GsOae/GUMGAg==
X-CSE-MsgGUID: XaxzJTaiSxqX/VT84C44Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="200952589"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jan 2026 05:24:04 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbf8L-000000002HR-0lHj;
	Fri, 02 Jan 2026 13:24:01 +0000
Date: Fri, 2 Jan 2026 21:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] NFSv4.1: slot table draining + memory reclaim can
 deadlock state manager creation
Message-ID: <202601022152.McX4cvYI-lkp@intel.com>
References: <20251230071744.9762-1-wangzhaolong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230071744.9762-1-wangzhaolong@huaweicloud.com>

Hi Wang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wang-Zhaolong/NFSv4-1-slot-table-draining-memory-reclaim-can-deadlock-state-manager-creation/20251230-151913
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20251230071744.9762-1-wangzhaolong%40huaweicloud.com
patch subject: [PATCH] [RFC] NFSv4.1: slot table draining + memory reclaim can deadlock state manager creation
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260102/202601022152.McX4cvYI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601022152.McX4cvYI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601022152.McX4cvYI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/read.c:385:33: error: too few arguments to function call, expected 3, have 2
     385 |         ret = nfs_wb_folio(inode, folio);
         |               ~~~~~~~~~~~~             ^
   include/linux/nfs_fs.h:639:12: note: 'nfs_wb_folio' declared here
     639 | extern int nfs_wb_folio(struct inode *inode, struct folio *folio, bool sync);
         |            ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +385 fs/nfs/read.c

a308996ed7c02d Christoph Hellwig       2024-07-11  360  
a308996ed7c02d Christoph Hellwig       2024-07-11  361  /*
a308996ed7c02d Christoph Hellwig       2024-07-11  362   * Synchronously read a folio.
a308996ed7c02d Christoph Hellwig       2024-07-11  363   *
a308996ed7c02d Christoph Hellwig       2024-07-11  364   * This is not heavily used as most users to try an asynchronous
a308996ed7c02d Christoph Hellwig       2024-07-11  365   * large read through ->readahead first.
^1da177e4c3f41 Linus Torvalds          2005-04-16  366   */
65d023af7f29eb Matthew Wilcox (Oracle  2022-04-29  367) int nfs_read_folio(struct file *file, struct folio *folio)
^1da177e4c3f41 Linus Torvalds          2005-04-16  368  {
ab75bff1140733 Trond Myklebust         2023-01-19  369  	struct inode *inode = file_inode(file);
fada32ed6dbc74 Christoph Hellwig       2024-07-11  370  	loff_t pos = folio_pos(folio);
fada32ed6dbc74 Christoph Hellwig       2024-07-11  371  	size_t len = folio_size(folio);
49dee70052b894 Dave Wysochanski        2021-01-28  372  	int ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  373  
fada32ed6dbc74 Christoph Hellwig       2024-07-11  374  	trace_nfs_aop_readpage(inode, pos, len);
91d5b47023b608 Chuck Lever             2006-03-20  375  	nfs_inc_stats(inode, NFSIOS_VFSREADPAGE);
fada32ed6dbc74 Christoph Hellwig       2024-07-11  376  	task_io_account_read(len);
91d5b47023b608 Chuck Lever             2006-03-20  377  
^1da177e4c3f41 Linus Torvalds          2005-04-16  378  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  379  	 * Try to flush any pending writes to the file..
^1da177e4c3f41 Linus Torvalds          2005-04-16  380  	 *
ab75bff1140733 Trond Myklebust         2023-01-19  381  	 * NOTE! Because we own the folio lock, there cannot
^1da177e4c3f41 Linus Torvalds          2005-04-16  382  	 * be any new pending writes generated at this point
ab75bff1140733 Trond Myklebust         2023-01-19  383  	 * for this folio (other folios can be written to).
^1da177e4c3f41 Linus Torvalds          2005-04-16  384  	 */
ab75bff1140733 Trond Myklebust         2023-01-19 @385  	ret = nfs_wb_folio(inode, folio);
49dee70052b894 Dave Wysochanski        2021-01-28  386  	if (ret)
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  387  		goto out_unlock;
ab75bff1140733 Trond Myklebust         2023-01-19  388  	if (folio_test_uptodate(folio))
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  389  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  390  
49dee70052b894 Dave Wysochanski        2021-01-28  391  	ret = -ESTALE;
5f004cf2aa8494 Trond Myklebust         2006-09-14  392  	if (NFS_STALE(inode))
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  393  		goto out_unlock;
5f004cf2aa8494 Trond Myklebust         2006-09-14  394  
000dbe0bec058c Dave Wysochanski        2023-02-20  395  	ret = nfs_netfs_read_folio(file, folio);
e0340f16a08d03 Dave Wysochanski        2021-06-29  396  	if (ret)
a308996ed7c02d Christoph Hellwig       2024-07-11  397  		ret = nfs_do_read_folio(file, folio);
000dbe0bec058c Dave Wysochanski        2023-02-20  398  out:
fada32ed6dbc74 Christoph Hellwig       2024-07-11  399  	trace_nfs_aop_readpage_done(inode, pos, len, ret);
49dee70052b894 Dave Wysochanski        2021-01-28  400  	return ret;
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  401  out_unlock:
ab75bff1140733 Trond Myklebust         2023-01-19  402  	folio_unlock(folio);
000dbe0bec058c Dave Wysochanski        2023-02-20  403  	goto out;
^1da177e4c3f41 Linus Torvalds          2005-04-16  404  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  405  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
