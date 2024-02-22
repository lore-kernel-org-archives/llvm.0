Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C324177B;
	Thu, 22 Feb 2024 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708602513; cv=none; b=BZn2s40PgKIXTurvgxtjnlq9bWihS2chlok+pGGZqb1K3C+8Vypo3K2acDiD4BZHkpBSrOMkHIc47QKKe1YZT9Nnf3V6G+dATRB/1nK6Ugv/HRn0/450wtvzPbRdk0OE1vwL3Xgw4OlYGsYPvhuzAzzlHGKOwYcKPxQ3ibNFRt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708602513; c=relaxed/simple;
	bh=8X7zOOosF9QVbx3gjn04z9pTL1yCzxKC2ZnIsp8iFqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZ0a4AGnrYwaUSCDD4cbukWfc4yGlFkUDtR6BN7em4hLKiH/79raGHfpKtL51Tqe2BG7U/j0efNFI6ballP8a/I2XoBAXfh+IASJjMtI7mcY9LvqHq7NumHM1ZHjp+Y+VTSrzHFyvcdGZaKxEEgxuPukhCa+b5zvVZldNNx9gEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWqL2vYp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWqL2vYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708602511; x=1740138511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8X7zOOosF9QVbx3gjn04z9pTL1yCzxKC2ZnIsp8iFqI=;
  b=fWqL2vYpTB3on+i++gYdUoeSBLVB6W4Wd82+vfG4y3JbC3ZnUMyvR/te
   NQ6X4TrOZU4vvvN8QAAkFDtHcQz1gapg/b6uRGoazGrXfEjah1HmLzzWx
   Yonvxw0IDB9Loc257aA4i3q0fpAsEPxZlpFHRlPtdfJB7aRUIwL6zAUli
   Tfd50tfkfJVXvP4RGYc4JaTcQ6rmYo52jxQq2DsUSUVHr/SwJ7vp4jt1s
   dTAFPeO5A/F8yaGhdwmH64jB1ql3xItfpLoa/vDH7+Djfjh9g09nBPIc4
   PLptQLd0gR4ELOQ/Avhr4KFQGoRslwmzbBCc+8nzQF7DKMhnl02veS1ZN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="5772232"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5772232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 03:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="36480669"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Feb 2024 03:48:29 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd7Y6-0006Gu-1s;
	Thu, 22 Feb 2024 11:48:26 +0000
Date: Thu, 22 Feb 2024 19:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sforshee:fscaps-vfsid 12/26] include/linux/lsm_hook_defs.h:156:65:
 error: expected expression
Message-ID: <202402221906.5w7orC3R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/linux.git fscaps-vfsid
head:   5ce094a334396397b1fc55565f035ffd4c68e612
commit: e1b4b67006eba055ec2e37b6ea358c12c244284d [12/26] security: add hooks for set/get/remove of fscaps
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240222/202402221906.5w7orC3R-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221906.5w7orC3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221906.5w7orC3R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/bpf/hooks.c:13:
>> include/linux/lsm_hook_defs.h:156:65: error: expected expression
     156 |          struct dentry *dentry, const struct vfs_caps *caps, int flags);
         |                                                                        ^
>> security/bpf/hooks.c:26:36: error: invalid application of 'sizeof' to an incomplete type 'struct security_hook_list[]'
      26 |         security_add_hooks(bpf_lsm_hooks, ARRAY_SIZE(bpf_lsm_hooks),
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   2 errors generated.


vim +156 include/linux/lsm_hook_defs.h

   109	
   110	/* Needed for inode based security check */
   111	LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
   112		 unsigned int obj_type)
   113	LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
   114	LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
   115	LSM_HOOK(int, -EOPNOTSUPP, inode_init_security, struct inode *inode,
   116		 struct inode *dir, const struct qstr *qstr, struct xattr *xattrs,
   117		 int *xattr_count)
   118	LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
   119		 const struct qstr *name, const struct inode *context_inode)
   120	LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
   121		 umode_t mode)
   122	LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
   123		 struct dentry *new_dentry)
   124	LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
   125	LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
   126		 const char *old_name)
   127	LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
   128		 umode_t mode)
   129	LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
   130	LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
   131		 umode_t mode, dev_t dev)
   132	LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
   133		 struct inode *new_dir, struct dentry *new_dentry)
   134	LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
   135	LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
   136		 bool rcu)
   137	LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
   138	LSM_HOOK(int, 0, inode_setattr, struct dentry *dentry, struct iattr *attr)
   139	LSM_HOOK(int, 0, inode_getattr, const struct path *path)
   140	LSM_HOOK(int, 0, inode_setxattr, struct mnt_idmap *idmap,
   141		 struct dentry *dentry, const char *name, const void *value,
   142		 size_t size, int flags)
   143	LSM_HOOK(void, LSM_RET_VOID, inode_post_setxattr, struct dentry *dentry,
   144		 const char *name, const void *value, size_t size, int flags)
   145	LSM_HOOK(int, 0, inode_getxattr, struct dentry *dentry, const char *name)
   146	LSM_HOOK(int, 0, inode_listxattr, struct dentry *dentry)
   147	LSM_HOOK(int, 0, inode_removexattr, struct mnt_idmap *idmap,
   148		 struct dentry *dentry, const char *name)
   149	LSM_HOOK(int, 0, inode_set_acl, struct mnt_idmap *idmap,
   150		 struct dentry *dentry, const char *acl_name, struct posix_acl *kacl)
   151	LSM_HOOK(int, 0, inode_get_acl, struct mnt_idmap *idmap,
   152		 struct dentry *dentry, const char *acl_name)
   153	LSM_HOOK(int, 0, inode_remove_acl, struct mnt_idmap *idmap,
   154		 struct dentry *dentry, const char *acl_name)
   155	LSM_HOOK(int, 0, inode_set_fscaps, struct mnt_idmap *idmap,
 > 156		 struct dentry *dentry, const struct vfs_caps *caps, int flags);
   157	LSM_HOOK(void, LSM_RET_VOID, inode_post_set_fscaps, struct mnt_idmap *idmap,
   158		 struct dentry *dentry, const struct vfs_caps *caps, int flags);
   159	LSM_HOOK(int, 0, inode_get_fscaps, struct mnt_idmap *idmap, struct dentry *dentry);
   160	LSM_HOOK(int, 0, inode_remove_fscaps, struct mnt_idmap *idmap,
   161		 struct dentry *dentry);
   162	LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
   163	LSM_HOOK(int, 0, inode_killpriv, struct mnt_idmap *idmap,
   164		 struct dentry *dentry)
   165	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct mnt_idmap *idmap,
   166		 struct inode *inode, const char *name, void **buffer, bool alloc)
   167	LSM_HOOK(int, -EOPNOTSUPP, inode_setsecurity, struct inode *inode,
   168		 const char *name, const void *value, size_t size, int flags)
   169	LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
   170		 size_t buffer_size)
   171	LSM_HOOK(void, LSM_RET_VOID, inode_getsecid, struct inode *inode, u32 *secid)
   172	LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
   173	LSM_HOOK(int, -EOPNOTSUPP, inode_copy_up_xattr, const char *name)
   174	LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
   175		 struct kernfs_node *kn)
   176	LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
   177	LSM_HOOK(int, 0, file_alloc_security, struct file *file)
   178	LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
   179	LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
   180		 unsigned long arg)
   181	LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
   182		 unsigned long arg)
   183	LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
   184	LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
   185		 unsigned long prot, unsigned long flags)
   186	LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
   187		 unsigned long reqprot, unsigned long prot)
   188	LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
   189	LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
   190		 unsigned long arg)
   191	LSM_HOOK(void, LSM_RET_VOID, file_set_fowner, struct file *file)
   192	LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
   193		 struct fown_struct *fown, int sig)
   194	LSM_HOOK(int, 0, file_receive, struct file *file)
   195	LSM_HOOK(int, 0, file_open, struct file *file)
   196	LSM_HOOK(int, 0, file_truncate, struct file *file)
   197	LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
   198		 unsigned long clone_flags)
   199	LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
   200	LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
   201	LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
   202	LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
   203		 gfp_t gfp)
   204	LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
   205		 const struct cred *old)
   206	LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *secid)
   207	LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
   208	LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
   209	LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
   210	LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
   211	LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
   212		 enum kernel_load_data_id id, char *description)
   213	LSM_HOOK(int, 0, kernel_read_file, struct file *file,
   214		 enum kernel_read_file_id id, bool contents)
   215	LSM_HOOK(int, 0, kernel_post_read_file, struct file *file, char *buf,
   216		 loff_t size, enum kernel_read_file_id id)
   217	LSM_HOOK(int, 0, task_fix_setuid, struct cred *new, const struct cred *old,
   218		 int flags)
   219	LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
   220		 int flags)
   221	LSM_HOOK(int, 0, task_fix_setgroups, struct cred *new, const struct cred * old)
   222	LSM_HOOK(int, 0, task_setpgid, struct task_struct *p, pid_t pgid)
   223	LSM_HOOK(int, 0, task_getpgid, struct task_struct *p)
   224	LSM_HOOK(int, 0, task_getsid, struct task_struct *p)
   225	LSM_HOOK(void, LSM_RET_VOID, current_getsecid_subj, u32 *secid)
   226	LSM_HOOK(void, LSM_RET_VOID, task_getsecid_obj,
   227		 struct task_struct *p, u32 *secid)
   228	LSM_HOOK(int, 0, task_setnice, struct task_struct *p, int nice)
   229	LSM_HOOK(int, 0, task_setioprio, struct task_struct *p, int ioprio)
   230	LSM_HOOK(int, 0, task_getioprio, struct task_struct *p)
   231	LSM_HOOK(int, 0, task_prlimit, const struct cred *cred,
   232		 const struct cred *tcred, unsigned int flags)
   233	LSM_HOOK(int, 0, task_setrlimit, struct task_struct *p, unsigned int resource,
   234		 struct rlimit *new_rlim)
   235	LSM_HOOK(int, 0, task_setscheduler, struct task_struct *p)
   236	LSM_HOOK(int, 0, task_getscheduler, struct task_struct *p)
   237	LSM_HOOK(int, 0, task_movememory, struct task_struct *p)
   238	LSM_HOOK(int, 0, task_kill, struct task_struct *p, struct kernel_siginfo *info,
   239		 int sig, const struct cred *cred)
   240	LSM_HOOK(int, -ENOSYS, task_prctl, int option, unsigned long arg2,
   241		 unsigned long arg3, unsigned long arg4, unsigned long arg5)
   242	LSM_HOOK(void, LSM_RET_VOID, task_to_inode, struct task_struct *p,
   243		 struct inode *inode)
   244	LSM_HOOK(int, 0, userns_create, const struct cred *cred)
   245	LSM_HOOK(int, 0, ipc_permission, struct kern_ipc_perm *ipcp, short flag)
   246	LSM_HOOK(void, LSM_RET_VOID, ipc_getsecid, struct kern_ipc_perm *ipcp,
   247		 u32 *secid)
   248	LSM_HOOK(int, 0, msg_msg_alloc_security, struct msg_msg *msg)
   249	LSM_HOOK(void, LSM_RET_VOID, msg_msg_free_security, struct msg_msg *msg)
   250	LSM_HOOK(int, 0, msg_queue_alloc_security, struct kern_ipc_perm *perm)
   251	LSM_HOOK(void, LSM_RET_VOID, msg_queue_free_security,
   252		 struct kern_ipc_perm *perm)
   253	LSM_HOOK(int, 0, msg_queue_associate, struct kern_ipc_perm *perm, int msqflg)
   254	LSM_HOOK(int, 0, msg_queue_msgctl, struct kern_ipc_perm *perm, int cmd)
   255	LSM_HOOK(int, 0, msg_queue_msgsnd, struct kern_ipc_perm *perm,
   256		 struct msg_msg *msg, int msqflg)
   257	LSM_HOOK(int, 0, msg_queue_msgrcv, struct kern_ipc_perm *perm,
   258		 struct msg_msg *msg, struct task_struct *target, long type, int mode)
   259	LSM_HOOK(int, 0, shm_alloc_security, struct kern_ipc_perm *perm)
   260	LSM_HOOK(void, LSM_RET_VOID, shm_free_security, struct kern_ipc_perm *perm)
   261	LSM_HOOK(int, 0, shm_associate, struct kern_ipc_perm *perm, int shmflg)
   262	LSM_HOOK(int, 0, shm_shmctl, struct kern_ipc_perm *perm, int cmd)
   263	LSM_HOOK(int, 0, shm_shmat, struct kern_ipc_perm *perm, char __user *shmaddr,
   264		 int shmflg)
   265	LSM_HOOK(int, 0, sem_alloc_security, struct kern_ipc_perm *perm)
   266	LSM_HOOK(void, LSM_RET_VOID, sem_free_security, struct kern_ipc_perm *perm)
   267	LSM_HOOK(int, 0, sem_associate, struct kern_ipc_perm *perm, int semflg)
   268	LSM_HOOK(int, 0, sem_semctl, struct kern_ipc_perm *perm, int cmd)
   269	LSM_HOOK(int, 0, sem_semop, struct kern_ipc_perm *perm, struct sembuf *sops,
   270		 unsigned nsops, int alter)
   271	LSM_HOOK(int, 0, netlink_send, struct sock *sk, struct sk_buff *skb)
   272	LSM_HOOK(void, LSM_RET_VOID, d_instantiate, struct dentry *dentry,
   273		 struct inode *inode)
   274	LSM_HOOK(int, -EOPNOTSUPP, getselfattr, unsigned int attr,
   275		 struct lsm_ctx __user *ctx, size_t *size, u32 flags)
   276	LSM_HOOK(int, -EOPNOTSUPP, setselfattr, unsigned int attr,
   277		 struct lsm_ctx *ctx, size_t size, u32 flags)
   278	LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, const char *name,
   279		 char **value)
   280	LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
   281	LSM_HOOK(int, 0, ismaclabel, const char *name)
   282	LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
   283		 u32 *seclen)
   284	LSM_HOOK(int, 0, secctx_to_secid, const char *secdata, u32 seclen, u32 *secid)
   285	LSM_HOOK(void, LSM_RET_VOID, release_secctx, char *secdata, u32 seclen)
   286	LSM_HOOK(void, LSM_RET_VOID, inode_invalidate_secctx, struct inode *inode)
   287	LSM_HOOK(int, 0, inode_notifysecctx, struct inode *inode, void *ctx, u32 ctxlen)
   288	LSM_HOOK(int, 0, inode_setsecctx, struct dentry *dentry, void *ctx, u32 ctxlen)
   289	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecctx, struct inode *inode, void **ctx,
   290		 u32 *ctxlen)
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
