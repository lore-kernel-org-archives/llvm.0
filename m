Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BC1155A2B;
	Mon,  6 May 2024 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715025179; cv=none; b=oTUbrRYVvNT7zRioEaj51ovvVGEq9HS4mKOZldn8jOKWNnLfMDHCVRhnZgBg3NRy/Bc7ktO504EkIS3b1eizATR4EsQf8T7haR7aDJR1ONfWdhTHww6QrOFw6FjFeuCqpDEwIktTOOuYNUrpVmte0AbK0CRi4zxRnVAugeBLDMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715025179; c=relaxed/simple;
	bh=vNCnplZOaUO6x92USkHDCOGGh5YehHMZoq5gbySiqXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S06fGKzu4XcUzXsU4S+QbKJASlvScsLo1tnMwyhxdfVPTM3qq4mugmQyR21bE+IgYaSF85iV54iDvw4+d2eEQ5JiIgC89QnOlUkm5rbD4YLhipRk3iAlV1nbdgXK1hOm1fSjGU3IuTk0NtYPUPaUpgb9HldpVWah70+7jUm+Dh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bm3qJSeX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bm3qJSeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715025178; x=1746561178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNCnplZOaUO6x92USkHDCOGGh5YehHMZoq5gbySiqXo=;
  b=bm3qJSeXY1727lrLz43Xz3m5yKC3T610OJ+I2SNcUlnQS1jUJnsFBOWm
   Db29koBgZ9AtLdiKqJQa7FjCVYP59E9BqR94pbYlF1aW68i7UA7x+4a9T
   sSvrbkf3U4kGY/GOnfH7L9ATriBLo0F/iDV3Xbn6Q3/5rXYnD/DKe2SOp
   jrl48SmB6StDwXsNftMl++PQARjP3AhcoRvL2YCv3HVCNk7/Y8MI8gY1w
   J/EgT17mY5sGOUI8rl8hBMJOsPnS4H+Lhnq8BaxN1D7quSRGs6gttNU5j
   8CJ2OqmC3YcA/HNmNA5auZP4IV0bU6KM9maGYVMgRfTe6X9KUqGDeyEQ1
   w==;
X-CSE-ConnectionGUID: +oUkBqi7S/e789y+woc9sw==
X-CSE-MsgGUID: Dypxj45HQZ6u2HCjnH7alA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14608881"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="14608881"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 12:52:58 -0700
X-CSE-ConnectionGUID: NUbmjKZuQCa7O7R4JzG58w==
X-CSE-MsgGUID: z7g6SbHXS1u2wMZOg8gIpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="65738947"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 May 2024 12:52:56 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s44OL-0000zx-26;
	Mon, 06 May 2024 19:52:53 +0000
Date: Tue, 7 May 2024 03:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 30/42] fs/f2fs/node.c:1357:1: warning: unused
 label 'out_dec'
Message-ID: <202405070348.vi2230RC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   6fd891b7248d0b825dbff6454be21f60c7ba1fb0
commit: 144ab4eadffa6ed7dfa906c24e27134c78a0b01c [30/42] f2fs: fix to release node block count in error path of f2fs_new_node_page()
config: x86_64-buildonly-randconfig-005-20240507 (https://download.01.org/0day-ci/archive/20240507/202405070348.vi2230RC-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070348.vi2230RC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070348.vi2230RC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/node.c:1357:1: warning: unused label 'out_dec' [-Wunused-label]
    1357 | out_dec:
         | ^~~~~~~~
   1 warning generated.


vim +/out_dec +1357 fs/f2fs/node.c

  1306	
  1307	struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
  1308	{
  1309		struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
  1310		struct node_info new_ni;
  1311		struct page *page;
  1312		int err;
  1313	
  1314		if (unlikely(is_inode_flag_set(dn->inode, FI_NO_ALLOC)))
  1315			return ERR_PTR(-EPERM);
  1316	
  1317		page = f2fs_grab_cache_page(NODE_MAPPING(sbi), dn->nid, false);
  1318		if (!page)
  1319			return ERR_PTR(-ENOMEM);
  1320	
  1321		if (unlikely((err = inc_valid_node_count(sbi, dn->inode, !ofs))))
  1322			goto fail;
  1323	
  1324	#ifdef CONFIG_F2FS_CHECK_FS
  1325		err = f2fs_get_node_info(sbi, dn->nid, &new_ni, false);
  1326		if (err)
  1327			goto out_dec;
  1328	
  1329		if (unlikely(new_ni.blk_addr != NULL_ADDR)) {
  1330			err = -EFSCORRUPTED;
  1331			set_sbi_flag(sbi, SBI_NEED_FSCK);
  1332			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
  1333			goto out_dec;
  1334		}
  1335	#endif
  1336		new_ni.nid = dn->nid;
  1337		new_ni.ino = dn->inode->i_ino;
  1338		new_ni.blk_addr = NULL_ADDR;
  1339		new_ni.flag = 0;
  1340		new_ni.version = 0;
  1341		set_node_addr(sbi, &new_ni, NEW_ADDR, false);
  1342	
  1343		f2fs_wait_on_page_writeback(page, NODE, true, true);
  1344		fill_node_footer(page, dn->nid, dn->inode->i_ino, ofs, true);
  1345		set_cold_node(page, S_ISDIR(dn->inode->i_mode));
  1346		if (!PageUptodate(page))
  1347			SetPageUptodate(page);
  1348		if (set_page_dirty(page))
  1349			dn->node_changed = true;
  1350	
  1351		if (f2fs_has_xattr_block(ofs))
  1352			f2fs_i_xnid_write(dn->inode, dn->nid);
  1353	
  1354		if (ofs == 0)
  1355			inc_valid_inode_count(sbi);
  1356		return page;
> 1357	out_dec:
  1358		dec_valid_node_count(sbi, dn->inode, !ofs);
  1359	fail:
  1360		clear_node_page_dirty(page);
  1361		f2fs_put_page(page, 1);
  1362		return ERR_PTR(err);
  1363	}
  1364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
