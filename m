Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479AC207DF8;
	Mon, 16 Dec 2024 19:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377369; cv=none; b=Kh1DDbN5E1N9uoQOwDeSzYOYT/EbpRhLzhtYBU7cbUwz4HkaqU27+Zh1CJyzme2SjLQhFXqH8Z9qNL4PF4NHbfvEi+28aG/Kac6DODaaIegPo8HgSBo4GW+DcNQjYQXegNPzu93QwXibymydbtt9mR3LajhO3VoLqDKOloYAiQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377369; c=relaxed/simple;
	bh=Y4wP87P71tdoiWCnmtg/+ZjLwEjQOC9YTZaUFZmggHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IhW1pQGqlvRzR+mDJwxTwKA0vbi3v3gemWujUBO7WIx6FTdl5XUtE1QQhicmeRtmmP71R/ki4MUMILBu68QWZIqgAeGIHD+oZyQfZ1SNq8dxTcTSiwXMb+OA+5xL0o2OaaJ1Ny8uScRxsnWA+KUaEd2m3j599iNRV8frpjzbI9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbNuynrm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbNuynrm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734377367; x=1765913367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4wP87P71tdoiWCnmtg/+ZjLwEjQOC9YTZaUFZmggHU=;
  b=UbNuynrmc+i94B23fM7rfdoVvOzu2N6dy8miR8AY4uxm7er7gVCUhK1G
   3rTbJNTohPoBWUqdrw6JBBx2HSS3ZRkq3M3o9+ql3xJ1U9H8BEwfMnEU4
   n4BcLpqolzinJRUV3mXfgnQuP0WevDJcATOD1hiI5jP2LJatKU5JYqEJf
   iTM9AzTvK0J/2QvysivX3xD5n7EtxPkEAaEBAp/7wKLYZH2o4k+icMr4a
   J9+/wZJxUSo3bom2FMUblnAYZ2uAV+dfhVluKl/PrwQB+FEqkPPO/M8CX
   pxKWPbkPKn6KxbWkwD8eba4+77rkT/bGwJIYCFtytXaQlRUUQBOBVWKjN
   w==;
X-CSE-ConnectionGUID: MA7Tb2OERUObJQ0TUc19Yw==
X-CSE-MsgGUID: f25v+aAsS4elwr1EjtxQIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34814666"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="34814666"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 11:29:27 -0800
X-CSE-ConnectionGUID: oYgWapDhTKiSU6kSOpXMyw==
X-CSE-MsgGUID: aMON/ZAYSQii6nXc5O5sXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97534071"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2024 11:29:25 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNGmR-000ER2-05;
	Mon, 16 Dec 2024 19:29:23 +0000
Date: Tue, 17 Dec 2024 03:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 13/20] fs/f2fs/inode.c:320:6: warning: format specifies
 type 'unsigned int' but the argument has type 'unsigned long'
Message-ID: <202412170323.3Lbfzgc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   99c1b937f7efd14347261f99e40036e481c6cbc0
commit: e958c55387d039b2804ceb0c38fb771a58874d0e [13/20] f2fs: fix to do sanity check correctly on i_inline_xattr_size
config: x86_64-buildonly-randconfig-004-20241217 (https://download.01.org/0day-ci/archive/20241217/202412170323.3Lbfzgc4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170323.3Lbfzgc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170323.3Lbfzgc4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/inode.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/f2fs/inode.c:320:6: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
     318 |                 f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %u, max: %lu",
         |                                                                                                 ~~
         |                                                                                                 %lu
     319 |                           __func__, inode->i_ino, fi->i_inline_xattr_size,
     320 |                           MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
         |                           ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:1855:46: note: expanded from macro 'f2fs_warn'
    1855 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                              ~~~    ^~~~~~~~~~~
   fs/f2fs/xattr.h:86:31: note: expanded from macro 'MIN_INLINE_XATTR_SIZE'
      86 | #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +320 fs/f2fs/inode.c

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
   315			f2fs_has_inline_xattr(inode) &&
   316			(fi->i_inline_xattr_size < MIN_INLINE_XATTR_SIZE ||
   317			fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE)) {
   318			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_inline_xattr_size: %d, min: %u, max: %lu",
   319				  __func__, inode->i_ino, fi->i_inline_xattr_size,
 > 320				  MIN_INLINE_XATTR_SIZE, MAX_INLINE_XATTR_SIZE);
   321			return false;
   322		}
   323	
   324		if (!f2fs_sb_has_extra_attr(sbi)) {
   325			if (f2fs_sb_has_project_quota(sbi)) {
   326				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   327					  __func__, inode->i_ino, F2FS_FEATURE_PRJQUOTA);
   328				return false;
   329			}
   330			if (f2fs_sb_has_inode_chksum(sbi)) {
   331				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   332					  __func__, inode->i_ino, F2FS_FEATURE_INODE_CHKSUM);
   333				return false;
   334			}
   335			if (f2fs_sb_has_flexible_inline_xattr(sbi)) {
   336				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   337					  __func__, inode->i_ino, F2FS_FEATURE_FLEXIBLE_INLINE_XATTR);
   338				return false;
   339			}
   340			if (f2fs_sb_has_inode_crtime(sbi)) {
   341				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   342					  __func__, inode->i_ino, F2FS_FEATURE_INODE_CRTIME);
   343				return false;
   344			}
   345			if (f2fs_sb_has_compression(sbi)) {
   346				f2fs_warn(sbi, "%s: corrupted inode ino=%lx, wrong feature flag: %u, run fsck to fix.",
   347					  __func__, inode->i_ino, F2FS_FEATURE_COMPRESSION);
   348				return false;
   349			}
   350		}
   351	
   352		if (f2fs_sanity_check_inline_data(inode, node_page)) {
   353			f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
   354				  __func__, inode->i_ino, inode->i_mode);
   355			return false;
   356		}
   357	
   358		if (f2fs_has_inline_dentry(inode) && !S_ISDIR(inode->i_mode)) {
   359			f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_dentry, run fsck to fix",
   360				  __func__, inode->i_ino, inode->i_mode);
   361			return false;
   362		}
   363	
   364		if ((fi->i_flags & F2FS_CASEFOLD_FL) && !f2fs_sb_has_casefold(sbi)) {
   365			f2fs_warn(sbi, "%s: inode (ino=%lx) has casefold flag, but casefold feature is off",
   366				  __func__, inode->i_ino);
   367			return false;
   368		}
   369	
   370		if (fi->i_xattr_nid && f2fs_check_nid_range(sbi, fi->i_xattr_nid)) {
   371			f2fs_warn(sbi, "%s: inode (ino=%lx) has corrupted i_xattr_nid: %u, run fsck to fix.",
   372				  __func__, inode->i_ino, fi->i_xattr_nid);
   373			return false;
   374		}
   375	
   376		if (IS_DEVICE_ALIASING(inode)) {
   377			if (!f2fs_sb_has_device_alias(sbi)) {
   378				f2fs_warn(sbi, "%s: inode (ino=%lx) has device alias flag, but the feature is off",
   379					  __func__, inode->i_ino);
   380				return false;
   381			}
   382			if (!f2fs_is_pinned_file(inode)) {
   383				f2fs_warn(sbi, "%s: inode (ino=%lx) has device alias flag, but is not pinned",
   384					  __func__, inode->i_ino);
   385				return false;
   386			}
   387		}
   388	
   389		return true;
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
