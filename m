Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D6B149E04;
	Mon,  5 Aug 2024 22:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722896115; cv=none; b=bYcDJAdtV3F+jz0YNibrKWXzhtOoShyknj02A1gyNcIMHxjsNV0r0FPO6C23hso9KULXMsVnx3JfNhNCnU9DpfOHBLsl0VtPH9FrklrvOsStRT0TYfwA1Q9qIgXtLnC/zied7cJRx7MaVFec2UM0R8HdrUscDocUmX91gw3Nroo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722896115; c=relaxed/simple;
	bh=HypA3o8ocI9eJhD1TmRSeNWKBNIFJ0YmwBCnHRkfiGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGbzDvZpPB4usCytzLyU+RGK4iGyTjeVXttsCUU+HJcYtJWCWfZpRvv43wk+s3MToWUgLqiaJFreETHS/brrfz90STWDqYZTksOl17JaElprrLgnCCPUHU5QSg6JslQPM5uOxNpudwK47VC85XvIW7kiG/oc3rTtrt2hceUCBq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHeEh0PM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHeEh0PM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722896113; x=1754432113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HypA3o8ocI9eJhD1TmRSeNWKBNIFJ0YmwBCnHRkfiGE=;
  b=OHeEh0PMu5EbvcVxHrlsLFr1O7XhPpfX7W/8FmgxxYcQguT6riGVdoF9
   SMDyYE93RDdkAM+OhXMt3WhT10gMgIYYiD9HmOOucmWp3MDgB7Kl90tb0
   hQPqRicUo2rKxk1rMrBwQMLtQqJYMM15Nk1BbZVmD88janGcKTDYh6A33
   ssSl0KAnT0t5Ma7eLZxLNQ7sTDCH9HJLClKf6aNoSgVe8W+FHgXHWziRA
   0y2z5bMdGDbZEQJ9VMP/N7Q/mSLWxUGdDwBB8ccw5VZyjVVNiKr0UPKXm
   Xg0ni3y4UK2X9jC78Sh/0vSNZWLpb43hzI4UtisCfjEOWZ1e0+g4Q/zST
   Q==;
X-CSE-ConnectionGUID: i5nfbxPqTQSjxKS6CBSrHQ==
X-CSE-MsgGUID: E/u4VpWBS2Ww4iTcK3v3BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="12875254"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="12875254"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 15:15:12 -0700
X-CSE-ConnectionGUID: N6mXgHhPSbyiYHXe2LE9Ig==
X-CSE-MsgGUID: r3HHq4QPTXqkSY3n2YxMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56394598"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2024 15:15:11 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb5yv-0003oG-2Y;
	Mon, 05 Aug 2024 22:15:09 +0000
Date: Tue, 6 Aug 2024 06:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 28/30] fs/namei.c:3613:25: error: variable has
 incomplete type 'struct delegated_inode'
Message-ID: <202408060628.4gkmqhx3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   3ef3065a07c0fc797ef9b034216f09d8b324e0b1
commit: 7fe1a63b7276713f10c1d9d23aaa10c40869fbb5 [28/30] fs: add struct delegated_inode
config: x86_64-buildonly-randconfig-002-20240806 (https://download.01.org/0day-ci/archive/20240806/202408060628.4gkmqhx3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060628.4gkmqhx3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060628.4gkmqhx3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namei.c:3613:25: error: variable has incomplete type 'struct delegated_inode'
    3613 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4155:25: error: variable has incomplete type 'struct delegated_inode'
    4155 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4278:25: error: variable has incomplete type 'struct delegated_inode'
    4278 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4389:25: error: variable has incomplete type 'struct delegated_inode'
    4389 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4538:25: error: variable has incomplete type 'struct delegated_inode'
    4538 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:4804:25: error: variable has incomplete type 'struct delegated_inode'
    4804 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/namei.c:5104:25: error: variable has incomplete type 'struct delegated_inode'
    5104 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   7 errors generated.
--
>> fs/open.c:640:25: error: variable has incomplete type 'struct delegated_inode'
     640 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   fs/open.c:764:25: error: variable has incomplete type 'struct delegated_inode'
     764 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   2 errors generated.
--
>> fs/utimes.c:25:25: error: variable has incomplete type 'struct delegated_inode'
      25 |         struct delegated_inode delegated_inode = { };
         |                                ^
   include/linux/fs.h:82:8: note: forward declaration of 'struct delegated_inode'
      82 | struct delegated_inode;
         |        ^
   1 error generated.
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


vim +3613 fs/namei.c

  3608	
  3609	static const char *open_last_lookups(struct nameidata *nd,
  3610			   struct file *file, const struct open_flags *op)
  3611	{
  3612		struct dentry *dir = nd->path.dentry;
> 3613		struct delegated_inode delegated_inode = { };
  3614		int open_flag = op->open_flag;
  3615		bool got_write = false;
  3616		struct dentry *dentry;
  3617		const char *res;
  3618	
  3619		nd->flags |= op->intent;
  3620	
  3621		if (nd->last_type != LAST_NORM) {
  3622			if (nd->depth)
  3623				put_link(nd);
  3624			return handle_dots(nd, nd->last_type);
  3625		}
  3626	
  3627		if (!(open_flag & O_CREAT)) {
  3628			if (nd->last.name[nd->last.len])
  3629				nd->flags |= LOOKUP_FOLLOW | LOOKUP_DIRECTORY;
  3630			/* we _can_ be in RCU mode here */
  3631			dentry = lookup_fast(nd);
  3632			if (IS_ERR(dentry))
  3633				return ERR_CAST(dentry);
  3634			if (likely(dentry))
  3635				goto finish_lookup;
  3636	
  3637			if (WARN_ON_ONCE(nd->flags & LOOKUP_RCU))
  3638				return ERR_PTR(-ECHILD);
  3639		} else {
  3640			/* create side of things */
  3641			if (nd->flags & LOOKUP_RCU) {
  3642				if (!try_to_unlazy(nd))
  3643					return ERR_PTR(-ECHILD);
  3644			}
  3645			audit_inode(nd->name, dir, AUDIT_INODE_PARENT);
  3646			/* trailing slashes? */
  3647			if (unlikely(nd->last.name[nd->last.len]))
  3648				return ERR_PTR(-EISDIR);
  3649		}
  3650	retry:
  3651		if (open_flag & (O_CREAT | O_TRUNC | O_WRONLY | O_RDWR)) {
  3652			got_write = !mnt_want_write(nd->path.mnt);
  3653			/*
  3654			 * do _not_ fail yet - we might not need that or fail with
  3655			 * a different error; let lookup_open() decide; we'll be
  3656			 * dropping this one anyway.
  3657			 */
  3658		}
  3659		if (open_flag & O_CREAT)
  3660			inode_lock(dir->d_inode);
  3661		else
  3662			inode_lock_shared(dir->d_inode);
  3663		dentry = lookup_open(nd, file, op, got_write, &delegated_inode);
  3664		if (!IS_ERR(dentry)) {
  3665			if (file->f_mode & FMODE_CREATED)
  3666				fsnotify_create(dir->d_inode, dentry);
  3667			if (file->f_mode & FMODE_OPENED)
  3668				fsnotify_open(file);
  3669		}
  3670		if (open_flag & O_CREAT)
  3671			inode_unlock(dir->d_inode);
  3672		else
  3673			inode_unlock_shared(dir->d_inode);
  3674	
  3675		if (got_write)
  3676			mnt_drop_write(nd->path.mnt);
  3677	
  3678		if (IS_ERR(dentry)) {
  3679			if (delegated_inode.di_inode) {
  3680				int error = break_deleg_wait(&delegated_inode);
  3681	
  3682				if (!error)
  3683					goto retry;
  3684				return ERR_PTR(error);
  3685			}
  3686			return ERR_CAST(dentry);
  3687		}
  3688	
  3689		if (file->f_mode & (FMODE_OPENED | FMODE_CREATED)) {
  3690			dput(nd->path.dentry);
  3691			nd->path.dentry = dentry;
  3692			return NULL;
  3693		}
  3694	
  3695	finish_lookup:
  3696		if (nd->depth)
  3697			put_link(nd);
  3698		res = step_into(nd, WALK_TRAILING, dentry);
  3699		if (unlikely(res))
  3700			nd->flags &= ~(LOOKUP_OPEN|LOOKUP_CREATE|LOOKUP_EXCL);
  3701		return res;
  3702	}
  3703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
