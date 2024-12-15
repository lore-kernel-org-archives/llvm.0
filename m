Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7414A4D4;
	Sun, 15 Dec 2024 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734284467; cv=none; b=HygZNGPI+c/RtJprLXFHLWMULjJulZ31sFZhtRrQsTwA8EQ1h8h61ZtHlYngCMdFbvgmXcw3RdKCgI7AW7cgXkLFV0xBHcU86FvbC31Pv6cHSx7xSieAN39+7luqMbp9C5HUl2Ifr1ZemMbQCtzU/9GSDo6H0DgICZa8zrcfS9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734284467; c=relaxed/simple;
	bh=7tDA5H+cwvbaWVaW5m9FX5ExmaT7XOiEDGdiohEY6fE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5TpZkO45JPkO1ogqRzFeaRSsw2KH+jDeZUSy0N4v5xGkMH/htqX8tvgtsessvxdjbsw6ryzWzlQ01uSpDfyiPetCTkzeLhX7pI2Xdfnc65XGJE2Mxlv/6V3rjtlytCFzowTSyJ2VgkT2B+QgIIOmtTIYFail/+JizonI93SpZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+ol/PXr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+ol/PXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734284463; x=1765820463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tDA5H+cwvbaWVaW5m9FX5ExmaT7XOiEDGdiohEY6fE=;
  b=D+ol/PXr5n4ioAIKJf2gl7+CCKWPOH03MGqAWqHHr5de5B4jrLu8abP5
   p7qlQ+J+pvl051DMUIn/zkTP13ijq/B6lUAKuGFlfBFYkVpSY+3p1sRpp
   NKaULtUCthLM4U4qe1yY22zYcIftcKPwmPeyQEgZbPP5u/FgeBCct2HsC
   8n53K6EpdJ0R/jWan5t6/ssRGtc+dvOUnQujT5ecmOkKms4Q40dDdcfhu
   ILKR6KlqwKeIcwvjxRe40TFScV57qrWRlHVskZz+AWkSfXWb8FP6eQ/MJ
   2qMBYZdjvi4vdvu8dBupknIjgGs26KghBQfGsOwPtCtPnivKemUKzPMOd
   A==;
X-CSE-ConnectionGUID: 9T/ymEkBTGeKc9CH/2KZog==
X-CSE-MsgGUID: WcdOoR7RTBG4mZU7b08TZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="33972498"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="33972498"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 09:41:02 -0800
X-CSE-ConnectionGUID: RstT84m5SJGtNSNFlYQjCw==
X-CSE-MsgGUID: dNNG7MpoQKSQ9i4xY5/vbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="102024171"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 09:41:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMsbz-000Dlm-0C;
	Sun, 15 Dec 2024 17:40:59 +0000
Date: Mon, 16 Dec 2024 01:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 18/20] fs/f2fs/inode.c:319:6: warning: format specifies
 type 'unsigned long' but the argument has type 'unsigned int'
Message-ID: <202412160100.oeyMjZmI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   14a0b37677c60e56234bfdca48f2893895e751f3
commit: 03605b8f85a900083d1f7f2d3d19fcd16cbcdd96 [18/20] f2fs: fix to do sanity check correctly on i_inline_xattr_size
config: arm-randconfig-001-20241215 (https://download.01.org/0day-ci/archive/20241216/202412160100.oeyMjZmI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160100.oeyMjZmI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412160100.oeyMjZmI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/inode.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/f2fs/inode.c:319:6: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     317 |                 f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %lu, max: %lu",
         |                                                                                                 ~~~
         |                                                                                                 %u
     318 |                           __func__, inode->i_ino, fi->i_inline_xattr_size,
     319 |                           MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
         |                           ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:1855:46: note: expanded from macro 'f2fs_warn'
    1855 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                              ~~~    ^~~~~~~~~~~
   fs/f2fs/xattr.h:86:31: note: expanded from macro 'MIN_INLINE_XATTR_SIZE'
      86 | #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +319 fs/f2fs/inode.c

   269	
   270	static bool sanity_check_inode(struct inode *inode, struct page *node_page)
   271	{
   272		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
   273		struct f2fs_inode_info *fi = F2FS_I(inode);
   274		struct f2fs_inode *ri = F2FS_INODE(node_page);
   275		unsigned long long iblocks;
   276	
   277		iblocks = le64_to_cpu(F2FS_INODE(node_page)->i_blocks);
   278		if (!iblocks) {
   279			f2fs_warn(sbi, "%s: corrupted inode i_blocks i_ino=%lx iblocks=%llu, run fsck to fix.",
   280				  __func__, inode->i_ino, iblocks);
   281			return false;
   282		}
   283	
   284		if (ino_of_node(node_page) != nid_of_node(node_page)) {
   285			f2fs_warn(sbi, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
   286				  __func__, inode->i_ino,
   287				  ino_of_node(node_page), nid_of_node(node_page));
   288			return false;
   289		}
   290	
   291		if (f2fs_has_extra_attr(inode)) {
   292			if (!f2fs_sb_has_extra_attr(sbi)) {
   293				f2fs_warn(sbi, "%s: inode (ino=%lx) is with extra_attr, but extra_attr feature is off",
   294					  __func__, inode->i_ino);
   295				return false;
   296			}
   297			if (fi->i_extra_isize > F2FS_TOTAL_EXTRA_ATTR_SIZE ||
   298				fi->i_extra_isize < F2FS_MIN_EXTRA_ATTR_SIZE ||
   299				fi->i_extra_isize % sizeof(__le32)) {
   300				f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_extra_isize: %d, max: %zu",
   301					  __func__, inode->i_ino, fi->i_extra_isize,
   302					  F2FS_TOTAL_EXTRA_ATTR_SIZE);
   303				return false;
   304			}
   305			if (f2fs_sb_has_compression(sbi) &&
   306				fi->i_flags & F2FS_COMPR_FL &&
   307				F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
   308							i_compress_flag)) {
   309				if (!sanity_check_compress_inode(inode, ri))
   310					return false;
   311			}
   312		}
   313	
   314		if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
   315			(fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE ||
   316			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
   317			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %lu, max: %lu",
   318				  __func__, inode->i_ino, fi->i_inline_xattr_size,
 > 319				  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
   320			return false;
   321		}
   322	
   323		if (!f2fs_sb_has_extra_attr(sbi)) {
   324			if (f2fs_sb_has_project_quota(sbi)) {
   325				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   326					  __func__, inode->i_ino, F2FS_FEATURE_PRJQUOTA);
   327				return false;
   328			}
   329			if (f2fs_sb_has_inode_chksum(sbi)) {
   330				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   331					  __func__, inode->i_ino, F2FS_FEATURE_INODE_CHKSUM);
   332				return false;
   333			}
   334			if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
   335				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   336					  __func__, inode->i_ino, F2FS_FEATURE_FLEXIBLE_INLINE_XATTR);
   337				return false;
   338			}
   339			if (f2fs_sb_has_inode_crtime(sbi)) {
   340				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   341					  __func__, inode->i_ino, F2FS_FEATURE_INODE_CRTIME);
   342				return false;
   343			}
   344			if (f2fs_sb_has_compression(sbi)) {
   345				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   346					  __func__, inode->i_ino, F2FS_FEATURE_COMPRESSION);
   347				return false;
   348			}
   349		}
   350	
   351		if (f2fs_sanity_check_inline_data(inode, node_page)) {
   352			f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
   353				  __func__, inode->i_ino, inode->i_mode);
   354			return false;
   355		}
   356	
   357		if (f2fs_has_inline_dentry(inode) && !S_ISDIR(inode->i_mode)) {
   358			f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_dentry, run fsck to fix",
   359				  __func__, inode->i_ino, inode->i_mode);
   360			return false;
   361		}
   362	
   363		if ((fi->i_flags & F2FS_CASEFOLD_FL) && !f2fs_sb_has_casefold(sbi)) {
   364			f2fs_warn(sbi, "%s: inode (ino=%lx) has casefold flag, but casefold feature is off",
   365				  __func__, inode->i_ino);
   366			return false;
   367		}
   368	
   369		if (fi->i_xattr_nid && f2fs_check_nid_range(sbi, fi->i_xattr_nid)) {
   370			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_xattr_nid: %u, run fsck to fix.",
   371				  __func__, inode->i_ino, fi->i_xattr_nid);
   372			return false;
   373		}
   374	
   375		if (IS_DEVICE_ALIASING(inode)) {
   376			if (!f2fs_sb_has_device_alias(sbi)) {
   377				f2fs_warn(sbi, "%s: inode (ino=%lx) has device alias flag, but the feature is off",
   378					  __func__, inode->i_ino);
   379				return false;
   380			}
   381			if (!f2fs_is_pinned_file(inode)) {
   382				f2fs_warn(sbi, "%s: inode (ino=%lx) has device alias flag, but is not pinned",
   383					  __func__, inode->i_ino);
   384				return false;
   385			}
   386		}
   387	
   388		return true;
   389	}
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
