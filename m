Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368A36C0C6;
	Tue, 18 Nov 2025 17:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487600; cv=none; b=ovyuhnZQwcq0s25Km8HSkfhOqd/8F/SBZlC+W1qk0Djou9LwXXRdaHpN7xlvyofZs/++oRNJd4tFf4+J8W6GurYPWtpW0BeQvPQW0T9Afw8sQDAsGFNUazoVnVl7hDbSaac0dCYLaKHpVeV7l1AXoD5MdLALGwkGZmOKwAswAYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487600; c=relaxed/simple;
	bh=PHGzKhQ9ObjG2GC0Sg5gzOGAZkN2WwHN5MMN24BpKpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C39twFlx+s/xKjdbtD/FygxynhtVBXTvVIUInqvWFzICtIXhuqaQh+AhYd7s1qvA7sCVOeOYrbtjGbNOerB+BHo8nz5HuycuObxRELJPlvTTRJcY2rhikYcsj7xTleV9LJavwNGeUDlCrId9y1MUJIpeDL1q9jNun8wrnAhZgDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFnrLC9E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFnrLC9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763487598; x=1795023598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PHGzKhQ9ObjG2GC0Sg5gzOGAZkN2WwHN5MMN24BpKpM=;
  b=GFnrLC9EJHO6ifCwkqlTUuc/EXDTYwqMvvR+NX/RSDEcBchLx7WQo6I2
   lQW4GmJ4w2Fy0z2LWpzcvX9WykGBi1YP86/s+mdUg1MLXJJXjXif4HvFK
   L3MfIpIlUgfvTRJRq1n8AVqKgmdES2t66LFG+7EYwu9xQuXFcFI5fwigx
   q67kmEd7dT+DQBlIT/0KJP4Ka/V+f2XDvcsyOhVv+7xSDQ9p9fwvp5EEX
   8bFLqOd63uE9yA/WkpDCn/7xCMKFsar7R7Zpp36bf28lGev0725k4Jl7w
   X8iaTLhtaMwSApq/CMldmdLuueXtKou56hnur7AuZ2REaq2EfjiCFqgE9
   g==;
X-CSE-ConnectionGUID: qKl7pJvMSg2z4xeZsAFGyA==
X-CSE-MsgGUID: Og9IgdNTRd68/WLgDyOPYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76124235"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76124235"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 09:39:58 -0800
X-CSE-ConnectionGUID: 9/VOHHkZTlGoxlki/b6Jjw==
X-CSE-MsgGUID: iXW2r38GTJuKpt4mfG+DHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191048180"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2025 09:39:56 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLPgI-00020V-0Y;
	Tue, 18 Nov 2025 17:39:54 +0000
Date: Wed, 19 Nov 2025 01:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare 31/43] fs/namespace.c:4376:2:
 warning: variable 'file' is uninitialized when used here
Message-ID: <202511190132.8nRAlAZI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare
head:   7eb06f9f7a76175a82d3c6b9d94219d7b64b6bce
commit: 7a6aae3e938ed79442f55c1f2b6d4a73a2cf0c51 [31/43] fs: namespace
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511190132.8nRAlAZI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190132.8nRAlAZI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190132.8nRAlAZI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:4376:2: warning: variable 'file' is uninitialized when used here [-Wuninitialized]
    4376 |         file->f_mode |= FMODE_NEED_UNMOUNT;
         |         ^~~~
   fs/namespace.c:4281:19: note: initialize the variable 'file' to silence this warning
    4281 |         struct file *file;
         |                          ^
         |                           = NULL
   fs/namespace.c:96:1: warning: unused function 'class_namespace_excl_lock_err' [-Wunused-function]
      96 | DEFINE_LOCK_GUARD_0(namespace_excl, namespace_lock(), namespace_unlock())
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:521:49: note: expanded from macro 'DEFINE_LOCK_GUARD_0'
     521 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
     522 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:495:10: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     495 |                                                                         \
         |                                                                         ^
     496 | __DEFINE_GUARD_LOCK_PTR(_name, &_T->lock)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:380:20: note: expanded from macro '\
   __DEFINE_GUARD_LOCK_PTR'
     380 |         static inline int class_##_name##_lock_err(class_##_name##_t *_T)   \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:105:1: note: expanded from here
     105 | class_namespace_excl_lock_err
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:97:1: warning: unused function 'class_namespace_shared_lock_err' [-Wunused-function]
      97 | DEFINE_LOCK_GUARD_0(namespace_shared, down_read(&namespace_sem),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      98 |                                       up_read(&namespace_sem))
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:521:49: note: expanded from macro 'DEFINE_LOCK_GUARD_0'
     521 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
     522 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:495:10: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     495 |                                                                         \
         |                                                                         ^
     496 | __DEFINE_GUARD_LOCK_PTR(_name, &_T->lock)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:380:20: note: expanded from macro '\
   __DEFINE_GUARD_LOCK_PTR'
     380 |         static inline int class_##_name##_lock_err(class_##_name##_t *_T)   \
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:127:1: note: expanded from here
     127 | class_namespace_shared_lock_err
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:135:37: warning: unused function 'node_to_mnt_ns' [-Wunused-function]
     135 | static inline struct mnt_namespace *node_to_mnt_ns(const struct rb_node *node)
         |                                     ^~~~~~~~~~~~~~
   4 warnings generated.


vim +/file +4376 fs/namespace.c

  4271	
  4272	/*
  4273	 * Create a kernel mount representation for a new, prepared superblock
  4274	 * (specified by fs_fd) and attach to an open_tree-like file descriptor.
  4275	 */
  4276	SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
  4277			unsigned int, attr_flags)
  4278	{
  4279		struct mnt_namespace *ns;
  4280		struct fs_context *fc;
  4281		struct file *file;
  4282		struct path newmount __free(path_put) = {};
  4283		struct mount *mnt;
  4284		unsigned int mnt_flags = 0;
  4285		long ret;
  4286	
  4287		if (!may_mount())
  4288			return -EPERM;
  4289	
  4290		if ((flags & ~(FSMOUNT_CLOEXEC)) != 0)
  4291			return -EINVAL;
  4292	
  4293		if (attr_flags & ~FSMOUNT_VALID_FLAGS)
  4294			return -EINVAL;
  4295	
  4296		mnt_flags = attr_flags_to_mnt_flags(attr_flags);
  4297	
  4298		switch (attr_flags & MOUNT_ATTR__ATIME) {
  4299		case MOUNT_ATTR_STRICTATIME:
  4300			break;
  4301		case MOUNT_ATTR_NOATIME:
  4302			mnt_flags |= MNT_NOATIME;
  4303			break;
  4304		case MOUNT_ATTR_RELATIME:
  4305			mnt_flags |= MNT_RELATIME;
  4306			break;
  4307		default:
  4308			return -EINVAL;
  4309		}
  4310	
  4311		CLASS(fd, f)(fs_fd);
  4312		if (fd_empty(f))
  4313			return -EBADF;
  4314	
  4315		if (fd_file(f)->f_op != &fscontext_fops)
  4316			return -EINVAL;
  4317	
  4318		fc = fd_file(f)->private_data;
  4319	
  4320		ACQUIRE(mutex_intr, uapi_mutex)(&fc->uapi_mutex);
  4321		ret = ACQUIRE_ERR(mutex_intr, &uapi_mutex);
  4322		if (ret)
  4323			return ret;
  4324	
  4325		/* There must be a valid superblock or we can't mount it */
  4326		ret = -EINVAL;
  4327		if (!fc->root)
  4328			return ret;
  4329	
  4330		ret = -EPERM;
  4331		if (mount_too_revealing(fc->root->d_sb, &mnt_flags)) {
  4332			errorfcp(fc, "VFS", "Mount too revealing");
  4333			return ret;
  4334		}
  4335	
  4336		ret = -EBUSY;
  4337		if (fc->phase != FS_CONTEXT_AWAITING_MOUNT)
  4338			return ret;
  4339	
  4340		if (fc->sb_flags & SB_MANDLOCK)
  4341			warn_mandlock();
  4342	
  4343		newmount.mnt = vfs_create_mount(fc);
  4344		if (IS_ERR(newmount.mnt))
  4345			return PTR_ERR(newmount.mnt);
  4346		newmount.dentry = dget(fc->root);
  4347		newmount.mnt->mnt_flags = mnt_flags;
  4348	
  4349		/* We've done the mount bit - now move the file context into more or
  4350		 * less the same state as if we'd done an fspick().  We don't want to
  4351		 * do any memory allocation or anything like that at this point as we
  4352		 * don't want to have to handle any errors incurred.
  4353		 */
  4354		vfs_clean_context(fc);
  4355	
  4356		ns = alloc_mnt_ns(current->nsproxy->mnt_ns->user_ns, true);
  4357		if (IS_ERR(ns))
  4358			return PTR_ERR(ns);
  4359		mnt = real_mount(newmount.mnt);
  4360		ns->root = mnt;
  4361		ns->nr_mounts = 1;
  4362		mnt_add_to_ns(ns, mnt);
  4363		mntget(newmount.mnt);
  4364	
  4365		FD_PREPARE(fdprep, (flags & FSMOUNT_CLOEXEC) ? O_CLOEXEC : 0,
  4366			   dentry_open(&newmount, O_PATH, fc->cred));
  4367		if (fd_prepare_failed(fdprep)) {
  4368			dissolve_on_fput(newmount.mnt);
  4369			return fd_prepare_error(fdprep);
  4370		}
  4371	
  4372		/*
  4373		 * Attach to an apparent O_PATH fd with a note that we
  4374		 * need to unmount it, not just simply put it.
  4375		 */
> 4376		file->f_mode |= FMODE_NEED_UNMOUNT;
  4377		return fd_publish(fdprep);
  4378	}
  4379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
