Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E388C3EB0E3;
	Wed, 23 Sep 2026 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144699; cv=none; b=oEvE97Le6qeVJLQ6Nfl+iSHUi2DUV63MRMW9RJYjso4cJIhNzPZ0cR0NVKphQ1k2KBMDWacvfls+HCas9RRAE5GZ+n9YpEeySc/Dg07P7jLkRsw9ML2jK5hLtTrxtMyT5RS0PHcEpSfMMpNa3bXF+CycnxXnSmcdAlBNHzGrCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144699; c=relaxed/simple;
	bh=lD6+yLX71r5nIqY8V+8HiWHK9OWG1lfP5YeWPdHFRE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kD6uIc0yKTMMpcNgUv/kGpIghaupavr7f9MQUCs6U4EGTPGAw5IviPYemAJTdIfIUIoPaK7tXEmLlL/8w/m+Ye/08gs21Yvreo+CNgTsjXTqGHqNKrZdsSgd3DAyv1HhY1oHW0GbKyKg27q7Pr6K84FfXdPXbgr0pAREQeYA0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VH5qoLyp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VH5qoLyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790144698; x=1821680698;
  h=date:from:to:cc:subject:message-id;
  bh=lD6+yLX71r5nIqY8V+8HiWHK9OWG1lfP5YeWPdHFRE4=;
  b=VH5qoLypnZWzni6NNnejPW0AaPpNYJ0tgq/IiS7+35/BcASLhvHZ0I74
   tU+F6MBhjHSnb2CaFR22RTQ0AJoFHHlqD1UKZ36KpjdpZDo3cpF3Dq8xX
   uGDGBKkYvKjbFEVKityygs9Hv1dVRgXeLB+Xo6fkvCf/aeDwxS8NKfpZS
   VSGDYzTxRUlawnmoovKhASx9JpLMai0iQ1Li121UclbbVOAxOSkWesmjQ
   1Xx/+IWJRJ5jlsCNrjDAHXcntvtNHDCePZj1xZrbEqsh8Fx3q3iTfZBvk
   5vHt67Jd25VRkvQ98MpXi8UzFmANUUpMcgyG1myqRQ8VYmKaaY8hqOijo
   w==;
X-CSE-ConnectionGUID: l3PbuL0ITaW5kNnGRny4TQ==
X-CSE-MsgGUID: 8aseiNWfTLOiBiQyYhrwtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93309290"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="93309290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 23:24:55 -0700
X-CSE-ConnectionGUID: eWta8OSDTDSQLM4JBWKRiQ==
X-CSE-MsgGUID: UvYU8FOsQRmk8InlE0QLQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="301384404"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Sep 2026 23:24:53 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9GPT-000000000YD-0PZi;
	Wed, 23 Sep 2026 06:24:51 +0000
Date: Wed, 23 Sep 2026 08:24:48 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map 15/18] fs/fuse/inode.c:438:44:
 error: no member named 'vdax' in 'struct fuse_conn'
Message-ID: <202609230803.9KZ4KBNg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map
head:   70caed148725b4dd32916ecfe906977e2f79aff1
commit: 343c66361a8e8ab509910030bf19eab3357555b2 [15/18] fuse: add support for opening dax device as backing
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260923/202609230803.9KZ4KBNg-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230803.9KZ4KBNg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230803.9KZ4KBNg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/inode.c:438:44: error: no member named 'vdax' in 'struct fuse_conn'
     438 |         if ((attr->flags & FUSE_ATTR_DAX) && !fc->vdax) {
         |                                               ~~  ^
   1 error generated.


vim +438 fs/fuse/inode.c

   409	
   410	static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
   411				    struct fuse_conn *fc)
   412	{
   413		inode->i_mode = attr->mode & S_IFMT;
   414		inode->i_size = attr->size;
   415		inode_set_mtime(inode, attr->mtime, attr->mtimensec);
   416		inode_set_ctime(inode, attr->ctime, attr->ctimensec);
   417		if (S_ISREG(inode->i_mode)) {
   418			fuse_init_common(inode);
   419			fuse_init_file_inode(inode, attr->flags);
   420		} else if (S_ISDIR(inode->i_mode))
   421			fuse_init_dir(inode);
   422		else if (S_ISLNK(inode->i_mode))
   423			fuse_init_symlink(inode);
   424		else if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode) ||
   425			 S_ISFIFO(inode->i_mode) || S_ISSOCK(inode->i_mode)) {
   426			fuse_init_common(inode);
   427			init_special_inode(inode, inode->i_mode,
   428					   new_decode_dev(attr->rdev));
   429		} else
   430			BUG();
   431		/*
   432		 * Ensure that we don't cache acls for daemons without FUSE_POSIX_ACL
   433		 * so they see the exact same behavior as before.
   434		 */
   435		if (!fc->posix_acl)
   436			inode->i_acl = inode->i_default_acl = ACL_DONT_CACHE;
   437	
 > 438		if ((attr->flags & FUSE_ATTR_DAX) && !fc->vdax) {
   439			inode->i_flags |= S_DAX;
   440			inode->i_data.a_ops = &fuse_dax_aops;
   441		}
   442	}
   443	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
