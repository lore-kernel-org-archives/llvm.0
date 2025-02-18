Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5280157E6B;
	Tue, 18 Feb 2025 04:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739852531; cv=none; b=YoqKs4KaMJLAW5WMQptjq2qnkFER7tDIOSZkMWc1HwbPplLx+gpYBDG3SeZ3AhO6frtjfuG6/0nQDpZAFfMFvk8yW0vSdZSa6/foWiIYW5f4/A15XExmnt009jsHNhd5KScX5PhPNjLdYX0rCR/85SBdSXdgs/KPB+qKTYS3RLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739852531; c=relaxed/simple;
	bh=igVAjiwiM6Tz4MxWCFM0c8aQuuxWX2ujicuNDd3oNqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rono2sV/oPdyp+rasXSDyjvATL23Vkvhupm2Al1v7+jzn1gEQkpj34kGcU7IcIfBDF8qRLXtkCXmhwGBuevKwWsW9dNIqnV1FTp5OeOoONIarsQwmV1kj/Ela4kRlJ8bGt28Juzv4ESqzuShzcGpe1dgT64dTRpwBJ71ATwq6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hL+xZLYP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hL+xZLYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739852529; x=1771388529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igVAjiwiM6Tz4MxWCFM0c8aQuuxWX2ujicuNDd3oNqw=;
  b=hL+xZLYPhfyflQZCcWAqb3fEpRjYtfpglQi49ANcSbudAdbJYsLWY4EX
   az0o2e+aSeynJ1MFmBPXVQhXG8YOvhvU0P1K5dBg3tbbpOBw8ErOG35Ju
   4kcYL3rbDYwLyaJj1AlaamVcCLt4EBi5tYWWdMAvyVSr69TfgQ0IsMB7M
   P43aJdGQcOK+pU4ZHXU8zIUm0uvXse2cmUWnfxr3TlVbNk/sR1/9//cxh
   eTGN7suWPqWos2Fw757XSRPlr6v7b5REsFMu7ZbmuzKDQ+tIrACHHKOnQ
   MUqdb/1uuJ4G39tfPiB9UVdFI+xynh4DIvazhtWdyPw2UmOmhnJzPlSnk
   A==;
X-CSE-ConnectionGUID: 67fa1MYzQzW8/P0/vy5WYQ==
X-CSE-MsgGUID: iXUYKc+jTZWY6IybEop2OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51968165"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51968165"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 20:22:08 -0800
X-CSE-ConnectionGUID: JvrYgqWpSJOCES3VIJ91qQ==
X-CSE-MsgGUID: 6tV0DhJ4SJaGnPwUAb13eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118410053"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2025 20:22:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkF7U-00009l-37;
	Tue, 18 Feb 2025 04:22:04 +0000
Date: Tue, 18 Feb 2025 12:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 101/106]
 fs/bcachefs/fsck.c:1990:37: warning: format specifies type 'unsigned int'
 but the argument has type 'u64' (aka 'unsigned long long')
Message-ID: <202502181232.RE3GLEYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   c0a15f588bcc855c5e30e6c8cfe2ec207e13acf2
commit: 30f640edcaf4398d30d758f6dc888258d7916042 [101/106] fixup! bcachefs: Fix fsck directory i_size checking
config: riscv-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250218/202502181232.RE3GLEYJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502181232.RE3GLEYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502181232.RE3GLEYJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/fsck.c:1990:37: warning: format specifies type 'unsigned int' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
    1989 |                                 "directory %llu:%u with wrong i_size: got %u, should be %llu",
         |                                                                           ~~
         |                                                                           %llu
    1990 |                                 w->last_pos.inode, i->snapshot, i->inode.bi_size, i->i_size)) {
         |                                                                 ^~~~~~~~~~~~~~~~
   fs/bcachefs/error.h:143:66: note: expanded from macro 'fsck_err_on'
     143 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |                                                                         ^~~~~~~~~~~
   fs/bcachefs/error.h:130:53: note: expanded from macro '__fsck_err_on'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                                                            ^~~~~~~~~~~
   fs/bcachefs/error.h:117:54: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~
   fs/bcachefs/error.h:101:38: note: expanded from macro 'bch2_fsck_err'
     101 |                         _flags, BCH_FSCK_ERR_##_err_type, __VA_ARGS__)
         |                                                           ^~~~~~~~~~~
   fs/bcachefs/error.h:107:13: note: expanded from macro 'fsck_err_wrap'
     107 |         int _ret = _do;                                                 \
         |                    ^~~
   1 warning generated.


vim +1990 fs/bcachefs/fsck.c

  1980	
  1981	static int check_dir_i_size_notnested(struct btree_trans *trans, struct inode_walker *w)
  1982	{
  1983		struct bch_fs *c = trans->c;
  1984		int ret = 0;
  1985	
  1986		darray_for_each(w->inodes, i)
  1987			if (fsck_err_on(i->inode.bi_size != i->i_size,
  1988					trans, inode_dir_wrong_nlink,
  1989					"directory %llu:%u with wrong i_size: got %u, should be %llu",
> 1990					w->last_pos.inode, i->snapshot, i->inode.bi_size, i->i_size)) {
  1991				i->inode.bi_size = i->i_size;
  1992				ret = bch2_fsck_write_inode(trans, &i->inode);
  1993				if (ret)
  1994					break;
  1995			}
  1996	fsck_err:
  1997		bch_err_fn(c, ret);
  1998		return ret;
  1999	}
  2000	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
