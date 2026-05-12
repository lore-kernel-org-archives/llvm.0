Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6005735292A;
	Tue, 12 May 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587461; cv=none; b=mKNpNbmnaHSkvqEers8ksqiqXkhRQi31MhOWlzpriLPsv+td/dX0r3nq3yGyzS4gLQDaPiaTh/Zsbr4iyZ27+ksl3jflQiSXCADJPpsDFOObyou0lvV4T8lMU61LfRI0yzZ6BDb328YsSLWaqe+D+1xukhA2i6tZmObPFmT+w68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587461; c=relaxed/simple;
	bh=pBhRvdToqyk9YscDRQYma1tJcOj1+LN3nhO4a/iDSo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pLCo5iIBS1QOxJu2P6wxyuW0v/f9SDvRLbg3vL/oq9HbO9DiOgOxyLxrtq5DX+YJyJ3Ig5FOYKAkolULcx0NNOGMbxK7w38HMyvhp62v4NdHP38hiwE1n4drX1Z5HgqfwmaGluCKLTiMTMG2Xs/fV+BExnowrqZ+PxKAbg03mcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIwqWhWl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIwqWhWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778587460; x=1810123460;
  h=date:from:to:cc:subject:message-id;
  bh=pBhRvdToqyk9YscDRQYma1tJcOj1+LN3nhO4a/iDSo4=;
  b=HIwqWhWlwSKPLaBSyGMWziM8KPqA1RbjctvIecuayNYWfOUC2HmMqWrP
   bE14DOX6fpmodZT7kqBIBMRgqLKi+gQp3VC3GUy9j23tKwZe8XRdekB7m
   d1rJ/CZosO41v1ksE5+CgCJpnR7yllYAOml+aALr5udDZOzHzjrju1ciX
   tJQBNnn0NddrfwJFbjP9ZYBWbeA5Jf4y5PFVu1E64D5Qwd0oGHB9RxrO/
   G8tUCS0/SldsmV7xutC4Ba4FLEue7H6X+UDheYvMh954OgWTOkOxiPVYX
   iI4qvksHPwX2b+RTlLPdRo0+77PRjyXbR1nabKXM8xnUtQfOZBW9t6EaK
   w==;
X-CSE-ConnectionGUID: TfUUUUaiQaKIb2YGMjG83Q==
X-CSE-MsgGUID: oe7Rk9njTve2sieVcrc0OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79515048"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79515048"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:04:16 -0700
X-CSE-ConnectionGUID: +B6smK+nRzq2qJ+h58ohFA==
X-CSE-MsgGUID: Y2z4rlG7THCdWI8kzU5eSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="241754032"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 May 2026 05:04:14 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMlqN-0000000025e-3drg;
	Tue, 12 May 2026 12:04:11 +0000
Date: Tue, 12 May 2026 20:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 9/12] fs/f2fs/node.c:1547:27: error:
 expected ':' after 'case'
Message-ID: <202605122029.Sv8LyyIw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   3fc276f79bae89d43863f797bc4ca48965917be8
commit: 1799e0c0814565aee65a1bc9a58aead705b9bfea [9/12] f2fs: fix to do sanity check on f2fs_get_node_folio_ra()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260512/202605122029.Sv8LyyIw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122029.Sv8LyyIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122029.Sv8LyyIw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/node.c:1547:27: error: expected ':' after 'case'
    1547 |         case NODE_TYPE_NON_IXNODE;
         |                                  ^
         |                                  :
   1 error generated.


vim +1547 fs/f2fs/node.c

  1517	
  1518	int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
  1519						struct folio *folio, pgoff_t nid,
  1520						enum node_type ntype, bool in_irq)
  1521	{
  1522		bool is_inode, is_xnode;
  1523	
  1524		if (unlikely(nid != nid_of_node(folio)))
  1525			goto out_err;
  1526	
  1527		is_inode = IS_INODE(folio);
  1528		is_xnode = f2fs_has_xattr_block(ofs_of_node(folio));
  1529	
  1530		switch (ntype) {
  1531		case NODE_TYPE_REGULAR:
  1532			if (is_inode && is_xnode)
  1533				goto out_err;
  1534			break;
  1535		case NODE_TYPE_INODE:
  1536			if (!is_inode || is_xnode)
  1537				goto out_err;
  1538			break;
  1539		case NODE_TYPE_XATTR:
  1540			if (is_inode || !is_xnode)
  1541				goto out_err;
  1542			break;
  1543		case NODE_TYPE_NON_INODE:
  1544			if (is_inode)
  1545				goto out_err;
  1546			break;
> 1547		case NODE_TYPE_NON_IXNODE;
  1548			if (is_inode || is_xnode)
  1549				goto out_err;
  1550		default:
  1551			break;
  1552		}
  1553		if (time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))
  1554			goto out_err;
  1555		return 0;
  1556	out_err:
  1557		set_sbi_flag(sbi, SBI_NEED_FSCK);
  1558		f2fs_warn_ratelimited(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
  1559			"node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
  1560			ntype, nid, nid_of_node(folio), ino_of_node(folio),
  1561			ofs_of_node(folio), cpver_of_node(folio),
  1562			next_blkaddr_of_node(folio));
  1563	
  1564		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
  1565		fserror_report_file_metadata(folio->mapping->host,
  1566				-EFSCORRUPTED, in_irq ? GFP_NOWAIT : GFP_NOFS);
  1567		return -EFSCORRUPTED;
  1568	}
  1569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
