Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E5B15747D;
	Sat, 12 Jul 2025 21:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752356070; cv=none; b=rpEbyz/TZDkjFLFQS6rr0by/TPUU0XtTzFXlfVOPV70AdeB2UKqyFHMXWxVzwW65gAPCM6mkQWzDpRIZkMvg4zb4CX4Wpbu/hLq1has+2TiIpS8Z0TD/ksR5uZsrtOLtlBvtDrMGa/HMtODYbzyEG/Y+kVFB6gAmqLO7Net01+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752356070; c=relaxed/simple;
	bh=/2g4vTtNU94um6K0cJlGroKRUjPujmEr4znLPBwdXRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MIvNE7jjoWBvVqMO1zTqR4z0i5hspe2/suJKGfohMRKEVdhbUQosbBHXN+xwZh6xLoeyDG1rsNRt68oswzu4szenzpyYfJcqzuOcxNNibNbgg63CVFJ6wKkam2hLgNqQ7QPiONg+l1CC8BJp+2jnSZUDc7fLi5eTNf53DvGpSi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFp2pdPL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFp2pdPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752356067; x=1783892067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2g4vTtNU94um6K0cJlGroKRUjPujmEr4znLPBwdXRc=;
  b=QFp2pdPL5AWlAPK1oSE2L/8TI2G95avaXQCm0qVUL9vvR+k2oEAGBEV1
   q0H7t0IBKzHfFmf7WyOemexQzRghCfoUZGZjue73lXKalE2vyAn+N39Zh
   4Mlr9XSXHomZabBkxLV26yv9uqFQihF14oTAST+XPZP4MMoIFSZMLfkll
   sGAaH+QjDB0dGK/WWIcqmaDGwL213k8jmf7jVOqPz6XBYZlWD6mTkjBrP
   ghGXPh+Hk66KSN3Q6TRcHGw1hiq02CF4mLecfaUZQu4CVtWr+wcNFpjic
   D4LNPKAYd3uRmwqnIKWizY8OTD/95xDMnCBWBRxPJCkGBVlqGLkgF2qQl
   Q==;
X-CSE-ConnectionGUID: FBeGtbPXT9GNC9CdeSiRrA==
X-CSE-MsgGUID: h+PbHKWlTG+PPBrPCy5IFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64867546"
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="64867546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 14:34:26 -0700
X-CSE-ConnectionGUID: 2huQuP4jSu6wsfeHWhQ8nQ==
X-CSE-MsgGUID: WBFfQzV8TmS3yfxWIKlX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; 
   d="scan'208";a="156428518"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2025 14:34:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uahrT-0007hL-1m;
	Sat, 12 Jul 2025 21:34:23 +0000
Date: Sun, 13 Jul 2025 05:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 18/21] fs/smb/client/reparse.c:398:15: warning: unused
 variable 'xattr_mode_val'
Message-ID: <202507130548.2nwuvP3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   26ef98c6708ac92c515a4592138345359222b847
commit: 6b988dfe26bcb2e050b20f8903ef09be4fdf467b [18/21] cifs: Create native Window socket file compatible also with WSL subsystem
config: arm-randconfig-003-20250713 (https://download.01.org/0day-ci/archive/20250713/202507130548.2nwuvP3n-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130548.2nwuvP3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507130548.2nwuvP3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/reparse.c:398:15: warning: unused variable 'xattr_mode_val' [-Wunused-variable]
     398 |         const __le64 xattr_mode_val = cpu_to_le64(mode);
         |                      ^~~~~~~~~~~~~~
>> fs/smb/client/reparse.c:399:23: warning: unused variable 'cifs_sb' [-Wunused-variable]
     399 |         struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
         |                              ^~~~~~~
   2 warnings generated.


vim +/xattr_mode_val +398 fs/smb/client/reparse.c

   381	
   382	static int create_native_socket(const unsigned int xid, struct inode *inode,
   383					struct dentry *dentry, struct cifs_tcon *tcon,
   384					const char *full_path, umode_t mode)
   385	{
   386		struct reparse_data_buffer buf = {
   387			.ReparseTag = cpu_to_le32(IO_REPARSE_TAG_AF_UNIX),
   388			.ReparseDataLength = cpu_to_le16(0),
   389		};
   390		struct cifs_open_info_data data = {
   391			.reparse_point = true,
   392			.reparse = { .tag = IO_REPARSE_TAG_AF_UNIX, .buf = &buf, },
   393		};
   394		struct kvec iov = {
   395			.iov_base = &buf,
   396			.iov_len = sizeof(buf),
   397		};
 > 398		const __le64 xattr_mode_val = cpu_to_le64(mode);
 > 399		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
   400		struct inode *new;
   401		int rc = 0;
   402	
   403		new = tcon->ses->server->ops->create_reparse_inode(
   404					     &data, inode->i_sb, xid,
   405					     tcon, full_path, false, &iov, NULL);
   406		if (!IS_ERR(new))
   407			d_instantiate(dentry, new);
   408		else
   409			rc = PTR_ERR(new);
   410	
   411		/*
   412		 * Try to set also optional WSL EA $LXMOD but ignore errors.
   413		 * WSL socket and native Win32/NT sockets uses same reparse point
   414		 * tag IO_REPARSE_TAG_AF_UNIX. WSL subsystem additionally requires
   415		 * EA $LXMOD to be set with the S_IFSOCK value. So setting this EA
   416		 * allows native socket to be recognized also by WSL subsystem.
   417		 * Note that setting of both EAs and reparse points is not supported
   418		 * by NTFS filesystem on Windows 8 / Windows Server 2012 and always
   419		 * fails. So ignore failures from this set_EA call.
   420		 */
   421	#ifdef CONFIG_CIFS_XATTR
   422		if (!rc && tcon->ses->server->ops->set_EA &&
   423		    (le32_to_cpu(tcon->fsAttrInfo.Attributes) & FILE_SUPPORTS_EXTENDED_ATTRIBUTES))
   424			tcon->ses->server->ops->set_EA(xid, tcon, full_path,
   425						       true /* open reparse point */,
   426						       SMB2_WSL_XATTR_MODE,
   427						       &xattr_mode_val,
   428						       SMB2_WSL_XATTR_MODE_SIZE,
   429						       cifs_sb->local_nls, cifs_sb);
   430	#endif
   431	
   432		cifs_free_open_info(&data);
   433		return rc;
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
