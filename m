Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5545F35E1CF;
	Sun, 17 May 2026 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779018812; cv=none; b=BFOn7OjbHp0SAiJlWcRINepn+fXMmfoJzjMdYyYRaSQGb23oBqC1cvqeW56C0OxEIO27nijC5SQI4XeAtzW4v+XPrhyVSWF5vgYI2AVEcblTJUJgKn2BXRRCcGwnX9V6fKyDJqrpE1DjX4HaXtdhTLF6wq4DSEgULvg7U/GRXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779018812; c=relaxed/simple;
	bh=e0CwA96ksg1fovG9QJgsC6bFYgVkT6GExHtrGEFvRXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mlAB+j1Mtxz9N5xUNm1/UUlKUC+z2thNykba8RLmb0E8/d+j+rOSFaD45DTHzW206j/8MAy/M+/p+bo2HEsDFLvrquNOwP5XnDpGTX/wIM0T5KRqYbtVmblBlIJGSSCOIM/elEh6dK6OKgKdo++BmbE1TGB6bG8rsTdTZqCfrvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSAdREv+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSAdREv+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779018811; x=1810554811;
  h=date:from:to:cc:subject:message-id;
  bh=e0CwA96ksg1fovG9QJgsC6bFYgVkT6GExHtrGEFvRXM=;
  b=TSAdREv+Nsdc6detWLhXfxXQA701wP/imFw9Zf9UqabmhZiwrK5o/IdN
   vma71T0pdOHvWH9FPOnIHAC1ncHMXM6U4dEs8SiN6g+/ulgJC7O4S4D2N
   fxbyNda3qPBdh+varEsvvI2/2Gp9Yt4BdRUJ9gmKJEDv/Y6RHUQYSXQDP
   hGnbtCVA9DP30onFVWj7+W6vuuL0ru8+91p6rEWqE9nuxMKy+x+NtXN43
   krCPxEJKOwcBRwLbFKmzVwrGAlCDuz0kUdkK7VoShJFcx4fMFDQwNxzRq
   NNP7cKQy+FKGQZTr+WPb+5cZoqRGTNLkkzY7cauHiDQdikmse17H1URPk
   A==;
X-CSE-ConnectionGUID: 323NaVHVSRKpEuIZ3HXWOQ==
X-CSE-MsgGUID: gVMoyV3yTk6CrwO+IrCPlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83752833"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="83752833"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 04:53:30 -0700
X-CSE-ConnectionGUID: hTnf8wUrTt2ad5qpA9jC6Q==
X-CSE-MsgGUID: +ERFXf+PToKyfny98Zr4FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="239398190"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2026 04:53:28 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOa3h-000000001Z8-11be;
	Sun, 17 May 2026 11:53:25 +0000
Date: Sun, 17 May 2026 19:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:syzbot 1/3] fs/f2fs/node.c:1547:2: warning:
 unannotated fall-through between switch labels
Message-ID: <202605171912.Ut2cGFbM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git syzbot
head:   3b3d051f95864723dc7fa367cfbc5dfe0d9aebbd
commit: 9c3ac1a797091fc57e09e688187a34f4b3fba0dd [1/3] f2fs: fix to do sanity check on f2fs_get_node_folio_ra()
config: hexagon-randconfig-002-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171912.Ut2cGFbM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171912.Ut2cGFbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171912.Ut2cGFbM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/node.c:1547:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1547 |         default:
         |         ^
   fs/f2fs/node.c:1547:2: note: insert 'break;' to avoid fall-through
    1547 |         default:
         |         ^
         |         break; 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +1547 fs/f2fs/node.c

e05df3b115e730 Jaegeuk Kim             2012-11-02  1514  
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1515  int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
f24f7f8cd6e8ff Matthew Wilcox (Oracle  2025-03-31  1516) 					struct folio *folio, pgoff_t nid,
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1517  					enum node_type ntype, bool in_irq)
1cf6b5670af1f4 Chao Yu                 2025-03-05  1518  {
93ffb6c28ff180 Chao Yu                 2026-01-12  1519  	bool is_inode, is_xnode;
93ffb6c28ff180 Chao Yu                 2026-01-12  1520  
c18ecd99e0c707 Chao Yu                 2025-08-23  1521  	if (unlikely(nid != nid_of_node(folio)))
c18ecd99e0c707 Chao Yu                 2025-08-23  1522  		goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1523  
93ffb6c28ff180 Chao Yu                 2026-01-12  1524  	is_inode = IS_INODE(folio);
93ffb6c28ff180 Chao Yu                 2026-01-12  1525  	is_xnode = f2fs_has_xattr_block(ofs_of_node(folio));
93ffb6c28ff180 Chao Yu                 2026-01-12  1526  
c18ecd99e0c707 Chao Yu                 2025-08-23  1527  	switch (ntype) {
93ffb6c28ff180 Chao Yu                 2026-01-12  1528  	case NODE_TYPE_REGULAR:
93ffb6c28ff180 Chao Yu                 2026-01-12  1529  		if (is_inode && is_xnode)
93ffb6c28ff180 Chao Yu                 2026-01-12  1530  			goto out_err;
93ffb6c28ff180 Chao Yu                 2026-01-12  1531  		break;
c18ecd99e0c707 Chao Yu                 2025-08-23  1532  	case NODE_TYPE_INODE:
93ffb6c28ff180 Chao Yu                 2026-01-12  1533  		if (!is_inode || is_xnode)
c18ecd99e0c707 Chao Yu                 2025-08-23  1534  			goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1535  		break;
c18ecd99e0c707 Chao Yu                 2025-08-23  1536  	case NODE_TYPE_XATTR:
93ffb6c28ff180 Chao Yu                 2026-01-12  1537  		if (is_inode || !is_xnode)
c18ecd99e0c707 Chao Yu                 2025-08-23  1538  			goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1539  		break;
c18ecd99e0c707 Chao Yu                 2025-08-23  1540  	case NODE_TYPE_NON_INODE:
93ffb6c28ff180 Chao Yu                 2026-01-12  1541  		if (is_inode)
c18ecd99e0c707 Chao Yu                 2025-08-23  1542  			goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1543  		break;
9c3ac1a797091f Chao Yu                 2026-05-10  1544  	case NODE_TYPE_NON_IXNODE:
9c3ac1a797091f Chao Yu                 2026-05-10  1545  		if (is_inode || is_xnode)
9c3ac1a797091f Chao Yu                 2026-05-10  1546  			goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23 @1547  	default:
c18ecd99e0c707 Chao Yu                 2025-08-23  1548  		break;
c18ecd99e0c707 Chao Yu                 2025-08-23  1549  	}
c18ecd99e0c707 Chao Yu                 2025-08-23  1550  	if (time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))
c18ecd99e0c707 Chao Yu                 2025-08-23  1551  		goto out_err;
c18ecd99e0c707 Chao Yu                 2025-08-23  1552  	return 0;
c18ecd99e0c707 Chao Yu                 2025-08-23  1553  out_err:
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1554  	set_sbi_flag(sbi, SBI_NEED_FSCK);
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1555  	f2fs_warn_ratelimited(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
1cf6b5670af1f4 Chao Yu                 2025-03-05  1556  		"node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
a63f2de2dd950a Matthew Wilcox (Oracle  2025-07-08  1557) 		ntype, nid, nid_of_node(folio), ino_of_node(folio),
6d3a7f6589fec2 Matthew Wilcox (Oracle  2025-07-08  1558) 		ofs_of_node(folio), cpver_of_node(folio),
f24f7f8cd6e8ff Matthew Wilcox (Oracle  2025-03-31  1559) 		next_blkaddr_of_node(folio));
50ac3ecd8e05b6 Chao Yu                 2026-01-12  1560  
1cf6b5670af1f4 Chao Yu                 2025-03-05  1561  	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
1cf6b5670af1f4 Chao Yu                 2025-03-05  1562  	return -EFSCORRUPTED;
1cf6b5670af1f4 Chao Yu                 2025-03-05  1563  }
1cf6b5670af1f4 Chao Yu                 2025-03-05  1564  

:::::: The code at line 1547 was first introduced by commit
:::::: c18ecd99e0c707ef8f83cace861cbc3162f4fdf1 f2fs: fix to do sanity check on node footer for non inode dnode

:::::: TO: Chao Yu <chao@kernel.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
