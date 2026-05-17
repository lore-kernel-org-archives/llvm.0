Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B6835838B;
	Sun, 17 May 2026 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012225; cv=none; b=n3tzgwo/ebO/Z+D0c6eUaGdC8RVXIQz4buxxRSBr5s9QYRqSTV3iC+mWVmR9fyjYacGCNAwdFKMp3gYNtqTRalJsNvdZG8zlO3224vGdXpLQsVdzxDsk3rp3NfYF7+nsb5bekNbUslm9NCkBdZ765yjPUvGLPOXfohg35Po3Y3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012225; c=relaxed/simple;
	bh=cOlF77r6doQzYS1S9ajGmwgicqBkIv3GzekHFbjsmF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NNj57sWI1lwEqwMfwr5SJs9J+71K7rCtyvyzPaUScNAJ9l3qSE7XmoqK2omOqM6d69A/6l63Nvv/WUggEEPOoeJ4EPC22jBu3kpoPpLigYa8jkJ/U/yXNrg0/uKrmebRiUB/WMqqoglUAzkuCpProjXjmmVF4JuSIah6owSg0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmcfBbDW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmcfBbDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779012223; x=1810548223;
  h=date:from:to:cc:subject:message-id;
  bh=cOlF77r6doQzYS1S9ajGmwgicqBkIv3GzekHFbjsmF8=;
  b=VmcfBbDWMJGR6/Te8sgv9DapNW4/lUFMwAmeg/xJ1aj9ICNnhuxdWTbn
   hjHOwfZx3YGdtAQb33vU+uWzdgrYCGtTelJ8c2VJ3iT2GryTZfhiBoAg9
   TWgJSfCONmcnXLIwPvd/I2In9wZGuBvHkY6OPsOfcxTZxsxVNebnY6mPA
   ffBQois4ZjaWlWfd9xnJ4p02OTQYaKk4102NOaCD4qcR30NUA/LddT0i6
   nshGxpthm7RGo41VmMUX3btC51S+7W5E6nrdz6xEUJfmwr2Tn2QnD/ziN
   3/DFJvkxn6MWQDiDGfpFEkRIQMKK9KzG3dI30ezgBn+85N5K27QyBBdu4
   w==;
X-CSE-ConnectionGUID: y1013xffTCeY8Uto05xX7A==
X-CSE-MsgGUID: Vv2DmASrQ6ilir+aVNpFMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="105352764"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="105352764"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 03:03:41 -0700
X-CSE-ConnectionGUID: iXgWFuk5Qq2kjWNQ9ogfOA==
X-CSE-MsgGUID: tdv/tAceTGyYWCSaV1sNLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244106739"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2026 03:03:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOYLR-000000009VT-21Oe;
	Sun, 17 May 2026 10:03:37 +0000
Date: Sun, 17 May 2026 12:03:02 +0200
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/syzbot 1/2] fs/f2fs/node.c:1554:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202605171101.RSk82fQf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   8ea0fd81d16fb7f605195f3c609ece5101673fa2
commit: c855d0659f2c0f6ad59d0d211a09e02a4462b8d5 [1/2] f2fs: fix to do sanity check on f2fs_get_node_folio_ra()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260517/202605171101.RSk82fQf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171101.RSk82fQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171101.RSk82fQf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/node.c:1554:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1554 |         default:
         |         ^
   fs/f2fs/node.c:1554:2: note: insert 'break;' to avoid fall-through
    1554 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +1554 fs/f2fs/node.c

e05df3b115e730 Jaegeuk Kim             2012-11-02  1521  
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1522  int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
f24f7f8cd6e8ff Matthew Wilcox (Oracle  2025-03-31  1523) 					struct folio *folio, pgoff_t nid,
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1524  					enum node_type ntype, bool in_irq)
1cf6b5670af1f4 Chao Yu                 2025-03-05  1525  {
93ffb6c28ff180 Chao Yu                 2026-01-12  1526  	bool is_inode, is_xnode;
93ffb6c28ff180 Chao Yu                 2026-01-12  1527  
c18ecd99e0c707 Chao Yu                 2025-08-23  1528  	if (unlikely(nid != nid_of_node(folio)))
c18ecd99e0c707 Chao Yu                 2025-08-23  1529  		goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1530  
93ffb6c28ff180 Chao Yu                 2026-01-12  1531  	is_inode = IS_INODE(folio);
93ffb6c28ff180 Chao Yu                 2026-01-12  1532  	is_xnode = f2fs_has_xattr_block(ofs_of_node(folio));
93ffb6c28ff180 Chao Yu                 2026-01-12  1533  
c18ecd99e0c707 Chao Yu                 2025-08-23  1534  	switch (ntype) {
93ffb6c28ff180 Chao Yu                 2026-01-12  1535  	case NODE_TYPE_REGULAR:
93ffb6c28ff180 Chao Yu                 2026-01-12  1536  		if (is_inode && is_xnode)
93ffb6c28ff180 Chao Yu                 2026-01-12  1537  			goto out_err;
93ffb6c28ff180 Chao Yu                 2026-01-12  1538  		break;
c18ecd99e0c707 Chao Yu                 2025-08-23  1539  	case NODE_TYPE_INODE:
93ffb6c28ff180 Chao Yu                 2026-01-12  1540  		if (!is_inode || is_xnode)
c18ecd99e0c707 Chao Yu                 2025-08-23  1541  			goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1542  		break;
c18ecd99e0c707 Chao Yu                 2025-08-23  1543  	case NODE_TYPE_XATTR:
93ffb6c28ff180 Chao Yu                 2026-01-12  1544  		if (is_inode || !is_xnode)
c18ecd99e0c707 Chao Yu                 2025-08-23  1545  			goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1546  		break;
c18ecd99e0c707 Chao Yu                 2025-08-23  1547  	case NODE_TYPE_NON_INODE:
93ffb6c28ff180 Chao Yu                 2026-01-12  1548  		if (is_inode)
c18ecd99e0c707 Chao Yu                 2025-08-23  1549  			goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1550  		break;
c855d0659f2c0f Chao Yu                 2026-05-10  1551  	case NODE_TYPE_NON_IXNODE:
c855d0659f2c0f Chao Yu                 2026-05-10  1552  		if (is_inode || is_xnode)
c855d0659f2c0f Chao Yu                 2026-05-10  1553  			goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23 @1554  	default:
c18ecd99e0c707 Chao Yu                 2025-08-23  1555  		break;
c18ecd99e0c707 Chao Yu                 2025-08-23  1556  	}
c18ecd99e0c707 Chao Yu                 2025-08-23  1557  	if (time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))
c18ecd99e0c707 Chao Yu                 2025-08-23  1558  		goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1559  	return 0;
c18ecd99e0c707 Chao Yu                 2025-08-23  1560  out_err:
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1561  	set_sbi_flag(sbi, SBI_NEED_FSCK);
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1562  	f2fs_warn_ratelimited(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
1cf6b5670af1f4 Chao Yu                 2025-03-05  1563  		"node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
a63f2de2dd950a Matthew Wilcox (Oracle  2025-07-08  1564) 		ntype, nid, nid_of_node(folio), ino_of_node(folio),
6d3a7f6589fec2 Matthew Wilcox (Oracle  2025-07-08  1565) 		ofs_of_node(folio), cpver_of_node(folio),
f24f7f8cd6e8ff Matthew Wilcox (Oracle  2025-03-31  1566) 		next_blkaddr_of_node(folio));
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1567  
1cf6b5670af1f4 Chao Yu                 2025-03-05  1568  	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
50faed607d3250 Chao Yu                 2026-03-28  1569  	fserror_report_file_metadata(folio->mapping->host,
50faed607d3250 Chao Yu                 2026-03-28  1570  			-EFSCORRUPTED, in_irq ? GFP_NOWAIT : GFP_NOFS);
1cf6b5670af1f4 Chao Yu                 2025-03-05  1571  	return -EFSCORRUPTED;
1cf6b5670af1f4 Chao Yu                 2025-03-05  1572  }
1cf6b5670af1f4 Chao Yu                 2025-03-05  1573  

:::::: The code at line 1554 was first introduced by commit
:::::: c18ecd99e0c707ef8f83cace861cbc3162f4fdf1 f2fs: fix to do sanity check on node footer for non inode dnode

:::::: TO: Chao Yu <chao@kernel.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
