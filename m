Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A580D3C1D65;
	Sun, 27 Sep 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790547718; cv=none; b=HpTX1OXrU8ybiQa9zDER9l9DYwjcxdR/vuBE3WlJeCuqwo8Ep1IKp4djx9Vv8lMmHl2XwTCC/ssQkQ18O36aCvXDjMrvNL7+iZWVPTzF0Nq6Gk1HiVM9kXo10OeHDQsZkQAPxaTKZS2OEdZiXu1NcEWCl/FcUExKzEgQd4ySTxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790547718; c=relaxed/simple;
	bh=fWhs364igXTuulNnR4CZinClylBrVpIY0tOSXS9Vgf0=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8m7jBF9reu9Ivlniayk4tn3/wxD1ycEBHrcRBWtFT0TInOxt0XszM8/e9sLTq5utW4wVU/Hn9h0qbRFp4VUYPBY0DcuNGbLudFrw+brz8b2f1U10d+SYPfBIoFkFBWh9qY4Nv6R33SUwMuIKKUnJ3WQ+JpXlErO+zMXbc3i7zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emQtwVtV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emQtwVtV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790547714; x=1822083714;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=fWhs364igXTuulNnR4CZinClylBrVpIY0tOSXS9Vgf0=;
  b=emQtwVtVk8x/YOxhfn7cby7AB2+PRt4GYCpr5AUdF6v3E/xpyNgg800v
   z77sHLb12BGQPJWzhqiQJjgqsrAHJdkzgabfoSqlwSpNY+FqmaGMrvsYi
   D73YxIWErr0KcH2QzbF/+ohZdalDUYZRIvZvHFAX9TIkzF82go5u/jb/6
   nSIim0A9JY6AQBs1NgJOeDbMSfjP9XIwElbibTOIhdln1KENWoBtCY5ix
   j6jfHOwb2auipyKRqlv8U5Xsi5ClpaXVhjM2NwX8hCIhpaN4EA1XA/mKG
   8VnCv7Yv78yq7f3Dq3I/pHZjyxm/HQajRxttZRt7D7WBRD8fpDNCSgC2N
   w==;
X-CSE-ConnectionGUID: +xnloQIOQkyotvom0/XHog==
X-CSE-MsgGUID: fqz21rCLTxq5R9lbXbsoMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="101817918"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="101817918"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 15:21:53 -0700
X-CSE-ConnectionGUID: ZEoB/6KRSd2nYu3U4weRrg==
X-CSE-MsgGUID: 59Fz3Xy2Rmeuc0QahsokVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="274409872"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2026 15:21:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAxFl-00000000NDm-3j73;
	Sun, 27 Sep 2026 22:21:49 +0000
Date: Mon, 28 Sep 2026 06:21:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: squashfs: fix leaked page locks when page actor allocation fails
Message-ID: <202609280655.spyNjO2a-lkp@intel.com>
References: <202609280655.spyNjO2a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609280655.spyNjO2a-lkp@intel.com>

Hi Nguyen,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Nguyen-Ngoc-Thang/squashfs-fix-leaked-page-locks-when-page-actor-allocation-fails/20260927-130541
base:   
patch link:    https://lore.kernel.org/r/202609280655.spyNjO2a-lkp%40intel.com
config: x86_64-randconfig-1003-20260928 (https://download.01.org/0day-ci/archive/20260928/202609280655.spyNjO2a-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280655.spyNjO2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280655.spyNjO2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/squashfs/file_direct.c:121:1: warning: unused label 'out' [-Wunused-label]
     121 | out:
         | ^~~~
   1 warning generated.


vim +/out +121 fs/squashfs/file_direct.c

0d455c12c642864 Phillip Lougher         2013-11-13   20  
0d455c12c642864 Phillip Lougher         2013-11-13   21  /* Read separately compressed datablock directly into page cache */
2a7aea59cf4dd4a Matthew Wilcox (Oracle  2024-12-20   22) int squashfs_readpage_block(struct folio *folio, u64 block, int bsize,
a3f94cb99a854fa Phillip Lougher         2018-08-02   23  		int expected)
0d455c12c642864 Phillip Lougher         2013-11-13   24  {
2a7aea59cf4dd4a Matthew Wilcox (Oracle  2024-12-20   25) 	struct page *target_page = &folio->page;
2a7aea59cf4dd4a Matthew Wilcox (Oracle  2024-12-20   26) 	struct inode *inode = folio->mapping->host;
0d455c12c642864 Phillip Lougher         2013-11-13   27  	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
12427de9439d68b Phillip Lougher         2023-11-13   28  	loff_t file_end = (i_size_read(inode) - 1) >> PAGE_SHIFT;
09cbfeaf1a5a67b Kiryl Shutsemau         2016-04-01   29  	int mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
7f73fcde4d93072 Phillip Lougher         2024-08-19   30  	loff_t start_index = folio->index & ~mask;
12427de9439d68b Phillip Lougher         2023-11-13   31  	loff_t end_index = start_index | mask;
d31638ff6c5437c Phillip Lougher         2024-10-21   32  	loff_t index;
d31638ff6c5437c Phillip Lougher         2024-10-21   33  	int i, pages, bytes, res = -ENOMEM;
7f73fcde4d93072 Phillip Lougher         2024-08-19   34  	struct page **page, *last_page;
0d455c12c642864 Phillip Lougher         2013-11-13   35  	struct squashfs_page_actor *actor;
0d455c12c642864 Phillip Lougher         2013-11-13   36  	void *pageaddr;
0d455c12c642864 Phillip Lougher         2013-11-13   37  
0d455c12c642864 Phillip Lougher         2013-11-13   38  	if (end_index > file_end)
0d455c12c642864 Phillip Lougher         2013-11-13   39  		end_index = file_end;
0d455c12c642864 Phillip Lougher         2013-11-13   40  
0d455c12c642864 Phillip Lougher         2013-11-13   41  	pages = end_index - start_index + 1;
0d455c12c642864 Phillip Lougher         2013-11-13   42  
14694888db2c1f7 Fabian Frederick        2014-08-06   43  	page = kmalloc_array(pages, sizeof(void *), GFP_KERNEL);
0d455c12c642864 Phillip Lougher         2013-11-13   44  	if (page == NULL)
0d455c12c642864 Phillip Lougher         2013-11-13   45  		return res;
0d455c12c642864 Phillip Lougher         2013-11-13   46  
0d455c12c642864 Phillip Lougher         2013-11-13   47  	/* Try to grab all the pages covered by the Squashfs block */
d31638ff6c5437c Phillip Lougher         2024-10-21   48  	for (i = 0, index = start_index; index <= end_index; index++) {
d31638ff6c5437c Phillip Lougher         2024-10-21   49  		page[i] = (index == folio->index) ? target_page :
2a7aea59cf4dd4a Matthew Wilcox (Oracle  2024-12-20   50) 			grab_cache_page_nowait(folio->mapping, index);
0d455c12c642864 Phillip Lougher         2013-11-13   51  
1bb1a07afad9730 Phillip Lougher         2022-06-11   52  		if (page[i] == NULL)
0d455c12c642864 Phillip Lougher         2013-11-13   53  			continue;
0d455c12c642864 Phillip Lougher         2013-11-13   54  
0d455c12c642864 Phillip Lougher         2013-11-13   55  		if (PageUptodate(page[i])) {
0d455c12c642864 Phillip Lougher         2013-11-13   56  			unlock_page(page[i]);
09cbfeaf1a5a67b Kiryl Shutsemau         2016-04-01   57  			put_page(page[i]);
1bb1a07afad9730 Phillip Lougher         2022-06-11   58  			continue;
0d455c12c642864 Phillip Lougher         2013-11-13   59  		}
0d455c12c642864 Phillip Lougher         2013-11-13   60  
1bb1a07afad9730 Phillip Lougher         2022-06-11   61  		i++;
0d455c12c642864 Phillip Lougher         2013-11-13   62  	}
0d455c12c642864 Phillip Lougher         2013-11-13   63  
1bb1a07afad9730 Phillip Lougher         2022-06-11   64  	pages = i;
1bb1a07afad9730 Phillip Lougher         2022-06-11   65  
f268eedddf3595e Phillip Lougher         2022-06-11   66  	/*
f268eedddf3595e Phillip Lougher         2022-06-11   67  	 * Create a "page actor" which will kmap and kunmap the
f268eedddf3595e Phillip Lougher         2022-06-11   68  	 * page cache pages appropriately within the decompressor
f268eedddf3595e Phillip Lougher         2022-06-11   69  	 */
2258e22f05aff58 Phillip Lougher         2024-08-19   70  	actor = squashfs_page_actor_init_special(msblk, page, pages, expected,
2258e22f05aff58 Phillip Lougher         2024-08-19   71  						start_index << PAGE_SHIFT);
f268eedddf3595e Phillip Lougher         2022-06-11   72  	if (actor == NULL)
3d998ec2d6828d8 Nguyen Ngoc Thang       2026-09-27   73  		goto mark_errored;
f268eedddf3595e Phillip Lougher         2022-06-11   74  
0d455c12c642864 Phillip Lougher         2013-11-13   75  	/* Decompress directly into the page cache buffers */
0d455c12c642864 Phillip Lougher         2013-11-13   76  	res = squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
f268eedddf3595e Phillip Lougher         2022-06-11   77  
7f73fcde4d93072 Phillip Lougher         2024-08-19   78  	last_page = squashfs_page_actor_free(actor);
f268eedddf3595e Phillip Lougher         2022-06-11   79  
0d455c12c642864 Phillip Lougher         2013-11-13   80  	if (res < 0)
0d455c12c642864 Phillip Lougher         2013-11-13   81  		goto mark_errored;
0d455c12c642864 Phillip Lougher         2013-11-13   82  
84e0e03b308816a Phillip Lougher         2024-08-23   83  	if (res != expected || IS_ERR(last_page)) {
a3f94cb99a854fa Phillip Lougher         2018-08-02   84  		res = -EIO;
a3f94cb99a854fa Phillip Lougher         2018-08-02   85  		goto mark_errored;
a3f94cb99a854fa Phillip Lougher         2018-08-02   86  	}
a3f94cb99a854fa Phillip Lougher         2018-08-02   87  
1bb1a07afad9730 Phillip Lougher         2022-06-11   88  	/* Last page (if present) may have trailing bytes not filled */
09cbfeaf1a5a67b Kiryl Shutsemau         2016-04-01   89  	bytes = res % PAGE_SIZE;
7f73fcde4d93072 Phillip Lougher         2024-08-19   90  	if (end_index == file_end && last_page && bytes) {
7f73fcde4d93072 Phillip Lougher         2024-08-19   91  		pageaddr = kmap_local_page(last_page);
09cbfeaf1a5a67b Kiryl Shutsemau         2016-04-01   92  		memset(pageaddr + bytes, 0, PAGE_SIZE - bytes);
1bb1a07afad9730 Phillip Lougher         2022-06-11   93  		kunmap_local(pageaddr);
0d455c12c642864 Phillip Lougher         2013-11-13   94  	}
0d455c12c642864 Phillip Lougher         2013-11-13   95  
0d455c12c642864 Phillip Lougher         2013-11-13   96  	/* Mark pages as uptodate, unlock and release */
0d455c12c642864 Phillip Lougher         2013-11-13   97  	for (i = 0; i < pages; i++) {
0d455c12c642864 Phillip Lougher         2013-11-13   98  		flush_dcache_page(page[i]);
0d455c12c642864 Phillip Lougher         2013-11-13   99  		SetPageUptodate(page[i]);
0d455c12c642864 Phillip Lougher         2013-11-13  100  		unlock_page(page[i]);
0d455c12c642864 Phillip Lougher         2013-11-13  101  		if (page[i] != target_page)
09cbfeaf1a5a67b Kiryl Shutsemau         2016-04-01  102  			put_page(page[i]);
0d455c12c642864 Phillip Lougher         2013-11-13  103  	}
0d455c12c642864 Phillip Lougher         2013-11-13  104  
0d455c12c642864 Phillip Lougher         2013-11-13  105  	kfree(page);
0d455c12c642864 Phillip Lougher         2013-11-13  106  
0d455c12c642864 Phillip Lougher         2013-11-13  107  	return 0;
0d455c12c642864 Phillip Lougher         2013-11-13  108  
0d455c12c642864 Phillip Lougher         2013-11-13  109  mark_errored:
bbf45b7e6855556 Matthew Wilcox (Oracle  2024-04-20  110) 	/* Decompression failed.  Target_page is
0d455c12c642864 Phillip Lougher         2013-11-13  111  	 * dealt with by the caller
0d455c12c642864 Phillip Lougher         2013-11-13  112  	 */
0d455c12c642864 Phillip Lougher         2013-11-13  113  	for (i = 0; i < pages; i++) {
6d565409503f4e1 Phillip Lougher         2013-11-24  114  		if (page[i] == NULL || page[i] == target_page)
0d455c12c642864 Phillip Lougher         2013-11-13  115  			continue;
0d455c12c642864 Phillip Lougher         2013-11-13  116  		flush_dcache_page(page[i]);
0d455c12c642864 Phillip Lougher         2013-11-13  117  		unlock_page(page[i]);
09cbfeaf1a5a67b Kiryl Shutsemau         2016-04-01  118  		put_page(page[i]);
0d455c12c642864 Phillip Lougher         2013-11-13  119  	}
0d455c12c642864 Phillip Lougher         2013-11-13  120  
0d455c12c642864 Phillip Lougher         2013-11-13 @121  out:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
