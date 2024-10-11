Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546C374CB;
	Fri, 11 Oct 2024 01:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728611831; cv=none; b=acfouFYRTUpkgDmeWQZEROoiifzjOu6C4AXXySG5sE4/mKf4JGO3RKx2zb/HGbyL+cZpxcya35vDILZSj8NTmq/ERFDokRnaj65KcG3T3RzOtL6wPBVguXTgZVyEN1qWk/motVKcRXpBDBv458FYPkSMnSOR+08o6t0ywolfdPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728611831; c=relaxed/simple;
	bh=y5v0ffUW3sePYJlJh1R5AdFYt8vL8NVEWuQFuCT/85E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KuWvy6GLN8Cxh/33IFI8t1awxtWpuqGzpgMJA4+4Bks8RPdMM0mC6H1ZefAPlnJbyu3C5G7t54CmfT9n/pxxFmah7OWpBHuqmtz+xg7514rOnpnNbjHrS+Djt3IhWr0k4Ah+7xMJiEljj3c7UYbQwlVsps/9Oq2WWVqL23sbHDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhMcDKuM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhMcDKuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728611830; x=1760147830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y5v0ffUW3sePYJlJh1R5AdFYt8vL8NVEWuQFuCT/85E=;
  b=NhMcDKuM04jTB6eHnq5VoOpS0ChTOuKC0BVMWxn5sCPVTqMUyBcenyRq
   0WL2htwddDEaU6A5+EZQrTm9Dznro+AcOVUkxGsq72H/shyblxG9iFFNQ
   yA8L6jN+s8yHUCkySupycHW51sN5FSNhunsPUXtlNL2X8P4sq9XiMVmho
   0PqEiQKZWQ90Cn/n+Bse6YdI+rznnKk1TiSMmOf3OCFmOGFx5SXgUbwgn
   ztwLwWAEjMHr2NubgRXb7eNvdHnVmVOfkkkPhCwtgKLf7/v2L1XcG6QG8
   Ddhr/G3G8Ba02mTd6650okOi9WIRKf61+v8VEkIliilN8ySfv9oQmVphV
   g==;
X-CSE-ConnectionGUID: v0lyNhT/TIqi3mFwcb0kEg==
X-CSE-MsgGUID: n5FTa7vPSA2m++Q99T9MhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27450662"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="27450662"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 18:56:47 -0700
X-CSE-ConnectionGUID: 81M4xkVJShKAog1uAPvfRA==
X-CSE-MsgGUID: y3rP7b5uTeOoRBaCYCppIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="76683888"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Oct 2024 18:56:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz4tX-000BZa-0p;
	Fri, 11 Oct 2024 01:56:43 +0000
Date: Fri, 11 Oct 2024 09:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 31/35] fs/utimes.c:25:25: error: variable has
 incomplete type 'struct delegated_inode'
Message-ID: <202410110901.Y7vQPBQV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   b91bc932b468b4c460faef8759fbae5a75b2ab5c
commit: dfd80c5780301295a6cf5ed1f77cd4f724ec1d3e [31/35] fs: add struct delegated_inode
config: i386-buildonly-randconfig-001-20241011 (https://download.01.org/0day-ci/archive/20241011/202410110901.Y7vQPBQV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110901.Y7vQPBQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110901.Y7vQPBQV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/utimes.c:25:25: error: variable has incomplete type 'struct delegated_inode'
      25 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   1 error generated.
--
>> fs/open.c:639:25: error: variable has incomplete type 'struct delegated_inode'
     639 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/open.c:763:25: error: variable has incomplete type 'struct delegated_inode'
     763 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   2 errors generated.
--
>> fs/posix_acl.c:1095:25: error: variable has incomplete type 'struct delegated_inode'
    1095 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/posix_acl.c:1216:25: error: variable has incomplete type 'struct delegated_inode'
    1216 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   2 errors generated.
--
>> fs/xattr.c:308:25: error: variable has incomplete type 'struct delegated_inode'
     308 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/xattr.c:570:25: error: variable has incomplete type 'struct delegated_inode'
     570 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   2 errors generated.
--
>> fs/namei.c:3666:25: error: variable has incomplete type 'struct delegated_inode'
    3666 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4202:25: error: variable has incomplete type 'struct delegated_inode'
    4202 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4325:25: error: variable has incomplete type 'struct delegated_inode'
    4325 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4436:25: error: variable has incomplete type 'struct delegated_inode'
    4436 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4585:25: error: variable has incomplete type 'struct delegated_inode'
    4585 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4851:25: error: variable has incomplete type 'struct delegated_inode'
    4851 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:5151:25: error: variable has incomplete type 'struct delegated_inode'
    5151 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   7 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +25 fs/utimes.c

    19	
    20	int vfs_utimes(const struct path *path, struct timespec64 *times)
    21	{
    22		int error;
    23		struct iattr newattrs;
    24		struct inode *inode = path->dentry->d_inode;
  > 25		struct delegated_inode delegated_inode = { };
    26	
    27		if (times) {
    28			if (!nsec_valid(times[0].tv_nsec) ||
    29			    !nsec_valid(times[1].tv_nsec))
    30				return -EINVAL;
    31			if (times[0].tv_nsec == UTIME_NOW &&
    32			    times[1].tv_nsec == UTIME_NOW)
    33				times = NULL;
    34		}
    35	
    36		error = mnt_want_write(path->mnt);
    37		if (error)
    38			goto out;
    39	
    40		newattrs.ia_valid = ATTR_CTIME | ATTR_MTIME | ATTR_ATIME;
    41		if (times) {
    42			if (times[0].tv_nsec == UTIME_OMIT)
    43				newattrs.ia_valid &= ~ATTR_ATIME;
    44			else if (times[0].tv_nsec != UTIME_NOW) {
    45				newattrs.ia_atime = times[0];
    46				newattrs.ia_valid |= ATTR_ATIME_SET;
    47			}
    48	
    49			if (times[1].tv_nsec == UTIME_OMIT)
    50				newattrs.ia_valid &= ~ATTR_MTIME;
    51			else if (times[1].tv_nsec != UTIME_NOW) {
    52				newattrs.ia_mtime = times[1];
    53				newattrs.ia_valid |= ATTR_MTIME_SET;
    54			}
    55			/*
    56			 * Tell setattr_prepare(), that this is an explicit time
    57			 * update, even if neither ATTR_ATIME_SET nor ATTR_MTIME_SET
    58			 * were used.
    59			 */
    60			newattrs.ia_valid |= ATTR_TIMES_SET;
    61		} else {
    62			newattrs.ia_valid |= ATTR_TOUCH;
    63		}
    64	retry_deleg:
    65		inode_lock(inode);
    66		error = notify_change(mnt_idmap(path->mnt), path->dentry, &newattrs,
    67				      &delegated_inode);
    68		inode_unlock(inode);
    69		if (delegated_inode.di_inode) {
    70			error = break_deleg_wait(&delegated_inode);
    71			if (!error)
    72				goto retry_deleg;
    73		}
    74	
    75		mnt_drop_write(path->mnt);
    76	out:
    77		return error;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
