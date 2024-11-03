Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C73416087B;
	Sun,  3 Nov 2024 21:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730667947; cv=none; b=IkqfRw6gg7yKyVwDaL3aaiC3SP8X718/Yzq8w8r7aUX21m4ePRpZ3a3W6Kx65NnDEAwgHCJgAf28QaVQjUS2tnMhW8jR7FVfvq49sqeMg8+ev/tHIxBbzieBmGO2RfLFXJ2PbbdLq/Mg4YqQGc7f3IjlMrhzzKZ0CWtEZVaLcHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730667947; c=relaxed/simple;
	bh=lgEMn2Szjz0AAAIi3BoICpR/c4KYKV6it4bivWy/nAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6PC/zbeEkVl7BHeJyp20Yai7qNP9+nV3/eN9KOlIrORwPsAUqloAjaSht5uSzdKo7KYUh4ZTDectluZnWYDL0dAKbVV2Y7qhKJx8xUBJb9+REU1ibfQ8N1B3Sz2xutDXM+xJqEI1VOlqqa/a5Ynybj5xwTxj7SVwJc9kXseOKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjCbV6wY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjCbV6wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730667945; x=1762203945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lgEMn2Szjz0AAAIi3BoICpR/c4KYKV6it4bivWy/nAM=;
  b=XjCbV6wYmInrFrJrqgoHvR0xr1EnYx/oUsyfSqMHR8l1SkpYmMEGIyHo
   GjKaAElUNQEWnCnbeaDjQxjpz1Sm2dQHfQ9d+3/Fb9MqjrQTHQW0Kiy3u
   sKLQ5xtODU0xwX5sjNAOxJ70PyiG23HgKfX4OzYqZ4qKi3vmEzDwkXEy2
   Q+hzUXczPougFd1i9lca2P9VEcwBgodnIaeJVEk8ieNEgIiH7OEZ16ZCg
   thLr9CwHkbx4eVD47IBhOSsztz/lWcyM236w8U2jCVgQIfH7k3JdywbeK
   vndaTdeGx0PlbKh3KdvAtf/ic9mgkKfbejPs3p2UZ9tcVIu+ay6mGmOR3
   w==;
X-CSE-ConnectionGUID: Bv5ETIB6TWK5i4i7P1Cuiw==
X-CSE-MsgGUID: VsU+BOoaQ9mXOWXdODI40w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52920481"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52920481"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 13:05:44 -0800
X-CSE-ConnectionGUID: sIlhg9gFQTuZm5/k+sakfg==
X-CSE-MsgGUID: BC/3TiBVRRWxRDWPE4eO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="87414852"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2024 13:05:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7hn2-000kCr-0V;
	Sun, 03 Nov 2024 21:05:40 +0000
Date: Mon, 4 Nov 2024 05:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 31/42] fs/namei.c:3666:25: error: variable has
 incomplete type 'struct delegated_inode'
Message-ID: <202411040419.NzxlHVtK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   7c5f52902153bdf6d59451262c63a5dc54c66f01
commit: 7e0950815b59efd9fc93ab9e1d088458ecd23575 [31/42] fs: add struct delegated_inode
config: i386-buildonly-randconfig-001-20241104 (https://download.01.org/0day-ci/archive/20241104/202411040419.NzxlHVtK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040419.NzxlHVtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040419.NzxlHVtK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:25:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings and 7 errors generated.
--
   In file included from fs/open.c:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings and 2 errors generated.
--
   In file included from fs/utimes.c:6:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/utimes.c:25:25: error: variable has incomplete type 'struct delegated_inode'
      25 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   4 warnings and 1 error generated.
--
   In file included from fs/xattr.c:15:
   In file included from include/linux/xattr.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings and 2 errors generated.
--
   In file included from fs/posix_acl.c:22:
   In file included from include/linux/xattr.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
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
   4 warnings and 2 errors generated.


vim +3666 fs/namei.c

  3661	
  3662	static const char *open_last_lookups(struct nameidata *nd,
  3663			   struct file *file, const struct open_flags *op)
  3664	{
  3665		struct dentry *dir = nd->path.dentry;
> 3666		struct delegated_inode delegated_inode = { };
  3667		int open_flag = op->open_flag;
  3668		bool got_write = false;
  3669		struct dentry *dentry;
  3670		const char *res;
  3671	
  3672		nd->flags |= op->intent;
  3673	
  3674		if (nd->last_type != LAST_NORM) {
  3675			if (nd->depth)
  3676				put_link(nd);
  3677			return handle_dots(nd, nd->last_type);
  3678		}
  3679	
  3680		/* We _can_ be in RCU mode here */
  3681		dentry = lookup_fast_for_open(nd, open_flag);
  3682		if (IS_ERR(dentry))
  3683			return ERR_CAST(dentry);
  3684	
  3685		if (likely(dentry))
  3686			goto finish_lookup;
  3687	
  3688		if (!(open_flag & O_CREAT)) {
  3689			if (WARN_ON_ONCE(nd->flags & LOOKUP_RCU))
  3690				return ERR_PTR(-ECHILD);
  3691		} else {
  3692			if (nd->flags & LOOKUP_RCU) {
  3693				if (!try_to_unlazy(nd))
  3694					return ERR_PTR(-ECHILD);
  3695			}
  3696		}
  3697	retry:
  3698		if (open_flag & (O_CREAT | O_TRUNC | O_WRONLY | O_RDWR)) {
  3699			got_write = !mnt_want_write(nd->path.mnt);
  3700			/*
  3701			 * do _not_ fail yet - we might not need that or fail with
  3702			 * a different error; let lookup_open() decide; we'll be
  3703			 * dropping this one anyway.
  3704			 */
  3705		}
  3706		if (open_flag & O_CREAT)
  3707			inode_lock(dir->d_inode);
  3708		else
  3709			inode_lock_shared(dir->d_inode);
  3710		dentry = lookup_open(nd, file, op, got_write, &delegated_inode);
  3711		if (!IS_ERR(dentry)) {
  3712			if (file->f_mode & FMODE_CREATED)
  3713				fsnotify_create(dir->d_inode, dentry);
  3714			if (file->f_mode & FMODE_OPENED)
  3715				fsnotify_open(file);
  3716		}
  3717		if (open_flag & O_CREAT)
  3718			inode_unlock(dir->d_inode);
  3719		else
  3720			inode_unlock_shared(dir->d_inode);
  3721	
  3722		if (got_write)
  3723			mnt_drop_write(nd->path.mnt);
  3724	
  3725		if (IS_ERR(dentry)) {
  3726			if (delegated_inode.di_inode) {
  3727				int error = break_deleg_wait(&delegated_inode);
  3728	
  3729				if (!error)
  3730					goto retry;
  3731				return ERR_PTR(error);
  3732			}
  3733			return ERR_CAST(dentry);
  3734		}
  3735	
  3736		if (file->f_mode & (FMODE_OPENED | FMODE_CREATED)) {
  3737			dput(nd->path.dentry);
  3738			nd->path.dentry = dentry;
  3739			return NULL;
  3740		}
  3741	
  3742	finish_lookup:
  3743		if (nd->depth)
  3744			put_link(nd);
  3745		res = step_into(nd, WALK_TRAILING, dentry);
  3746		if (unlikely(res))
  3747			nd->flags &= ~(LOOKUP_OPEN|LOOKUP_CREATE|LOOKUP_EXCL);
  3748		return res;
  3749	}
  3750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
