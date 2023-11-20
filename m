Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40C1FA4;
	Mon, 20 Nov 2023 03:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XI2zyvIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700450997; x=1731986997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUFH7HJz2VnguPIdRQpTb795Z3AIeEjT1F+7rTNguW0=;
  b=XI2zyvIpndhc/dBsqalNo+718u+vuazKFDYJx0JYh+aj0HSVYf8VKY/R
   xnTwNtN0BxxKadRLv9Z+oDMm93pcLoPuDGin9iLJcoT5n4pZLwXxdWUdo
   T5SvlfkvOEWQ4xU1ohL+lEN+jAe6mYojw1nLS3tcWMHWnPTYkBEmICw7e
   IwVu1j8TdWLDSTxaM6yJ16cKX7yOw+hyJZKssXMUCn0f28aD7WekOnkfx
   CHtsrMrrERdV3Qah4zlWIenXw96qM8Pl/0gMI0Vho0WLC3A0x7ZRUmtAD
   XATyyw67H/a5yGe8WF/c/2UdMeUaDp9GrKsVi/8YGIF0Fc9qeD/Q3uTfX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="455865165"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="455865165"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 19:29:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1097630072"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="1097630072"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Nov 2023 19:29:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4uyN-0005th-2D;
	Mon, 20 Nov 2023 03:29:19 +0000
Date: Mon, 20 Nov 2023 11:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.mount 14/14] fs/namespace.c:4969:1: warning: stack
 frame size (1048) exceeds limit (1024) in '__se_sys_statmount'
Message-ID: <202311201110.549Sj1SK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount
head:   bbaba842df6d93fa0fbcf8bc8341a352f6189c6c
commit: bbaba842df6d93fa0fbcf8bc8341a352f6189c6c [14/14] statmount: simplify string option retrieval
config: arm-randconfig-001-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201110.549Sj1SK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201110.549Sj1SK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201110.549Sj1SK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/namespace.c:4896:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    4896 |         if (sm->mask & STMT_FS_TYPE) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:4902:7: note: uninitialized use occurs here
    4902 |         if (!ret && sm->mask & STMT_MNT_ROOT) {
         |              ^~~
   fs/namespace.c:4896:2: note: remove the 'if' if its condition is always true
    4896 |         if (sm->mask & STMT_FS_TYPE) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:4894:9: note: initialize the variable 'ret' to silence this warning
    4894 |         int ret;
         |                ^
         |                 = 0
>> fs/namespace.c:4969:1: warning: stack frame size (1048) exceeds limit (1024) in '__se_sys_statmount' [-Wframe-larger-than]
    4969 | SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
         | ^
   include/linux/syscalls.h:224:36: note: expanded from macro 'SYSCALL_DEFINE4'
     224 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:232:2: note: expanded from macro 'SYSCALL_DEFINEx'
     232 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DEFINEx'
     251 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
         |                         ^
   <scratch space>:154:1: note: expanded from here
     154 | __se_sys_statmount
         | ^
   2 warnings generated.


vim +/__se_sys_statmount +4969 fs/namespace.c

bbaba842df6d93 Christian Brauner 2023-11-19  4888  
bbaba842df6d93 Christian Brauner 2023-11-19  4889  static int copy_statmount_to_user(struct kstatmount *s)
bbaba842df6d93 Christian Brauner 2023-11-19  4890  {
bbaba842df6d93 Christian Brauner 2023-11-19  4891  	struct statmount *sm = &s->sm;
bbaba842df6d93 Christian Brauner 2023-11-19  4892  	struct seq_file *seq;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4893  	size_t copysize = min_t(size_t, s->bufsize, sizeof(*sm));
bbaba842df6d93 Christian Brauner 2023-11-19  4894  	int ret;
bbaba842df6d93 Christian Brauner 2023-11-19  4895  
bbaba842df6d93 Christian Brauner 2023-11-19 @4896  	if (sm->mask & STMT_FS_TYPE) {
bbaba842df6d93 Christian Brauner 2023-11-19  4897  		seq = &s->fs_type;
bbaba842df6d93 Christian Brauner 2023-11-19  4898  		ret = copy_to_user(s->buf->str + sm->fs_type,
bbaba842df6d93 Christian Brauner 2023-11-19  4899  				   seq->buf, seq->count);
bbaba842df6d93 Christian Brauner 2023-11-19  4900  	}
bbaba842df6d93 Christian Brauner 2023-11-19  4901  
bbaba842df6d93 Christian Brauner 2023-11-19  4902  	if (!ret && sm->mask & STMT_MNT_ROOT) {
bbaba842df6d93 Christian Brauner 2023-11-19  4903  		seq = &s->mnt_root;
bbaba842df6d93 Christian Brauner 2023-11-19  4904  		ret = copy_to_user(s->buf->str + sm->mnt_root,
bbaba842df6d93 Christian Brauner 2023-11-19  4905  				   seq->buf, seq->count);
bbaba842df6d93 Christian Brauner 2023-11-19  4906  	}
bbaba842df6d93 Christian Brauner 2023-11-19  4907  
bbaba842df6d93 Christian Brauner 2023-11-19  4908  	if (!ret && sm->mask & STMT_MNT_POINT) {
bbaba842df6d93 Christian Brauner 2023-11-19  4909  		seq = &s->mnt_point;
bbaba842df6d93 Christian Brauner 2023-11-19  4910  		ret = copy_to_user(s->buf->str + sm->mnt_point,
bbaba842df6d93 Christian Brauner 2023-11-19  4911  				   seq->buf, seq->count);
bbaba842df6d93 Christian Brauner 2023-11-19  4912  	}
bbaba842df6d93 Christian Brauner 2023-11-19  4913  
bbaba842df6d93 Christian Brauner 2023-11-19  4914  	if (ret)
bbaba842df6d93 Christian Brauner 2023-11-19  4915  		return -EFAULT;
bbaba842df6d93 Christian Brauner 2023-11-19  4916  
bbaba842df6d93 Christian Brauner 2023-11-19  4917  	/* Return the number of bytes copied to the buffer */
bbaba842df6d93 Christian Brauner 2023-11-19  4918  	sm->size = copysize + s->pos;
bbaba842df6d93 Christian Brauner 2023-11-19  4919  	if (copy_to_user(s->buf, sm, copysize))
bbaba842df6d93 Christian Brauner 2023-11-19  4920  		return -EFAULT;
bbaba842df6d93 Christian Brauner 2023-11-19  4921  
bbaba842df6d93 Christian Brauner 2023-11-19  4922  	return 0;
bbaba842df6d93 Christian Brauner 2023-11-19  4923  }
bbaba842df6d93 Christian Brauner 2023-11-19  4924  
bbaba842df6d93 Christian Brauner 2023-11-19  4925  static int do_statmount(struct kstatmount *s)
bbaba842df6d93 Christian Brauner 2023-11-19  4926  {
bbaba842df6d93 Christian Brauner 2023-11-19  4927  	struct mount *m = real_mount(s->mnt);
bb0f527b929c6a Miklos Szeredi    2023-10-25  4928  	int err;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4929  
bb0f527b929c6a Miklos Szeredi    2023-10-25  4930  	if (!capable(CAP_SYS_ADMIN) &&
bb0f527b929c6a Miklos Szeredi    2023-10-25  4931  	    !is_path_reachable(m, m->mnt.mnt_root, &s->root))
bb0f527b929c6a Miklos Szeredi    2023-10-25  4932  		return -EPERM;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4933  
bb0f527b929c6a Miklos Szeredi    2023-10-25  4934  	err = security_sb_statfs(s->mnt->mnt_root);
bb0f527b929c6a Miklos Szeredi    2023-10-25  4935  	if (err)
bb0f527b929c6a Miklos Szeredi    2023-10-25  4936  		return err;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4937  
e3da02da05b8cb Christian Brauner 2023-11-19  4938  	if (s->mask & STMT_SB_BASIC)
e3da02da05b8cb Christian Brauner 2023-11-19  4939  		stmt_sb_basic(s);
e3da02da05b8cb Christian Brauner 2023-11-19  4940  
e3da02da05b8cb Christian Brauner 2023-11-19  4941  	if (s->mask & STMT_MNT_BASIC)
e3da02da05b8cb Christian Brauner 2023-11-19  4942  		stmt_mnt_basic(s);
e3da02da05b8cb Christian Brauner 2023-11-19  4943  
e3da02da05b8cb Christian Brauner 2023-11-19  4944  	if (s->mask & STMT_PROPAGATE_FROM)
e3da02da05b8cb Christian Brauner 2023-11-19  4945  		stmt_propagate_from(s);
e3da02da05b8cb Christian Brauner 2023-11-19  4946  
bbaba842df6d93 Christian Brauner 2023-11-19  4947  	if (s->mask & STMT_FS_TYPE)
bbaba842df6d93 Christian Brauner 2023-11-19  4948  		err = stmt_string(s, STMT_FS_TYPE);
bb0f527b929c6a Miklos Szeredi    2023-10-25  4949  
bbaba842df6d93 Christian Brauner 2023-11-19  4950  	if (!err && s->mask & STMT_MNT_ROOT)
bbaba842df6d93 Christian Brauner 2023-11-19  4951  		err = stmt_string(s, STMT_MNT_ROOT);
bb0f527b929c6a Miklos Szeredi    2023-10-25  4952  
bbaba842df6d93 Christian Brauner 2023-11-19  4953  	if (!err && s->mask & STMT_MNT_POINT)
bbaba842df6d93 Christian Brauner 2023-11-19  4954  		err = stmt_string(s, STMT_MNT_POINT);
bb0f527b929c6a Miklos Szeredi    2023-10-25  4955  
bbaba842df6d93 Christian Brauner 2023-11-19  4956  	if (err)
bbaba842df6d93 Christian Brauner 2023-11-19  4957  		return err;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4958  
bb0f527b929c6a Miklos Szeredi    2023-10-25  4959  	return 0;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4960  }
bb0f527b929c6a Miklos Szeredi    2023-10-25  4961  
bbaba842df6d93 Christian Brauner 2023-11-19  4962  static inline void drop_kstatmount(struct kstatmount *ks)
bbaba842df6d93 Christian Brauner 2023-11-19  4963  {
bbaba842df6d93 Christian Brauner 2023-11-19  4964  	__putname(ks->fs_type.buf);
bbaba842df6d93 Christian Brauner 2023-11-19  4965  	__putname(ks->mnt_root.buf);
bbaba842df6d93 Christian Brauner 2023-11-19  4966  	__putname(ks->mnt_point.buf);
bbaba842df6d93 Christian Brauner 2023-11-19  4967  }
bbaba842df6d93 Christian Brauner 2023-11-19  4968  
bb0f527b929c6a Miklos Szeredi    2023-10-25 @4969  SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
bb0f527b929c6a Miklos Szeredi    2023-10-25  4970  		struct statmount __user *, buf, size_t, bufsize,
bb0f527b929c6a Miklos Szeredi    2023-10-25  4971  		unsigned int, flags)
bb0f527b929c6a Miklos Szeredi    2023-10-25  4972  {
bb0f527b929c6a Miklos Szeredi    2023-10-25  4973  	struct vfsmount *mnt;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4974  	struct mnt_id_req kreq;
e9b3e0e86c7961 Christian Brauner 2023-11-19  4975  	struct kstatmount *ks;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4976  	int ret;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4977  
bb0f527b929c6a Miklos Szeredi    2023-10-25  4978  	if (flags)
bb0f527b929c6a Miklos Szeredi    2023-10-25  4979  		return -EINVAL;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4980  
bb0f527b929c6a Miklos Szeredi    2023-10-25  4981  	if (copy_from_user(&kreq, req, sizeof(kreq)))
bb0f527b929c6a Miklos Szeredi    2023-10-25  4982  		return -EFAULT;
bb0f527b929c6a Miklos Szeredi    2023-10-25  4983  
bb0f527b929c6a Miklos Szeredi    2023-10-25  4984  	down_read(&namespace_sem);
bb0f527b929c6a Miklos Szeredi    2023-10-25  4985  	mnt = lookup_mnt_in_ns(kreq.mnt_id, current->nsproxy->mnt_ns);
e9b3e0e86c7961 Christian Brauner 2023-11-19  4986  	if (!mnt) {
e9b3e0e86c7961 Christian Brauner 2023-11-19  4987  		up_read(&namespace_sem);
e9b3e0e86c7961 Christian Brauner 2023-11-19  4988  		return -ENOENT;
e9b3e0e86c7961 Christian Brauner 2023-11-19  4989  	}
e9b3e0e86c7961 Christian Brauner 2023-11-19  4990  
e9b3e0e86c7961 Christian Brauner 2023-11-19  4991  	ks = &(struct kstatmount){
bb0f527b929c6a Miklos Szeredi    2023-10-25  4992  		.mask		= kreq.request_mask,
bb0f527b929c6a Miklos Szeredi    2023-10-25  4993  		.buf		= buf,
bb0f527b929c6a Miklos Szeredi    2023-10-25  4994  		.bufsize	= bufsize,
bb0f527b929c6a Miklos Szeredi    2023-10-25  4995  		.mnt		= mnt,
bb0f527b929c6a Miklos Szeredi    2023-10-25  4996  	};
bb0f527b929c6a Miklos Szeredi    2023-10-25  4997  
e9b3e0e86c7961 Christian Brauner 2023-11-19  4998  	get_fs_root(current->fs, &ks->root);
e9b3e0e86c7961 Christian Brauner 2023-11-19  4999  	ret = do_statmount(ks);
e9b3e0e86c7961 Christian Brauner 2023-11-19  5000  	path_put(&ks->root);
bb0f527b929c6a Miklos Szeredi    2023-10-25  5001  	up_read(&namespace_sem);
bb0f527b929c6a Miklos Szeredi    2023-10-25  5002  
bbaba842df6d93 Christian Brauner 2023-11-19  5003  	if (!ret)
bbaba842df6d93 Christian Brauner 2023-11-19  5004  		ret = copy_statmount_to_user(ks);
bbaba842df6d93 Christian Brauner 2023-11-19  5005  	drop_kstatmount(ks);
bb0f527b929c6a Miklos Szeredi    2023-10-25  5006  	return ret;
bb0f527b929c6a Miklos Szeredi    2023-10-25  5007  }
bb0f527b929c6a Miklos Szeredi    2023-10-25  5008  

:::::: The code at line 4969 was first introduced by commit
:::::: bb0f527b929c6ab105d80eaac03399bcee6b047e add statmount(2) syscall

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
