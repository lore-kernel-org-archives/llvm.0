Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FAC17F9;
	Mon, 20 Nov 2023 01:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+zeYibE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700442603; x=1731978603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wOo2QT/NnC9M6IOpkn/O0Chgt1Du/PriY70CcWWH6/w=;
  b=V+zeYibEd5OEyY+QO+PcG8zzt7wB1f9+Ldd5Imen8F/oRAfNPWym1HuF
   XVBy3OkhYw+tHSaTXORuOX1FOdff+9wuz4/ZnCLdzXMb9PgP8V4DaYFwC
   rCti3EYOR+ZPdZPYA5uiCjRrgQV2BlgQ7mjEOAqIVw8fFbMyQa1/QjCpB
   QlyyzTqsT7jxsyphFOCQ2cDxagoTBJnsxe0K6x9PmiCy9qegx5PV7sMUF
   NStTO2TuzxOKgs8JuxkQdcAX4vCR6Xe5OX0ZyhDb4gs7iB9YIYVzNKfzZ
   qBmvoDRZAv+drlqNQsS8iMKsZ771PWEiRos2Tg74CxeQ5qXFl0XRjSY5X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="370874338"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="370874338"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 17:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="7545596"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2023 17:09:56 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4snR-0005mV-1l;
	Mon, 20 Nov 2023 01:09:53 +0000
Date: Mon, 20 Nov 2023 09:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.mount 14/14] fs/namespace.c:4896:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is false
Message-ID: <202311200943.kXUP5jUl-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231120/202311200943.kXUP5jUl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200943.kXUP5jUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200943.kXUP5jUl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/namespace.c:4896:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (sm->mask & STMT_FS_TYPE) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:4902:7: note: uninitialized use occurs here
           if (!ret && sm->mask & STMT_MNT_ROOT) {
                ^~~
   fs/namespace.c:4896:2: note: remove the 'if' if its condition is always true
           if (sm->mask & STMT_FS_TYPE) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namespace.c:4894:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
>> fs/namespace.c:4969:1: warning: stack frame size (1036) exceeds limit (1024) in '__ia32_sys_statmount' [-Wframe-larger-than]
   SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
   ^
   include/linux/syscalls.h:224:36: note: expanded from macro 'SYSCALL_DEFINE4'
   #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                      ^
   include/linux/syscalls.h:232:2: note: expanded from macro 'SYSCALL_DEFINEx'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^
   arch/x86/include/asm/syscall_wrapper.h:232:2: note: expanded from macro '__SYSCALL_DEFINEx'
           __IA32_SYS_STUBx(x, name, __VA_ARGS__)                          \
           ^
   arch/x86/include/asm/syscall_wrapper.h:117:2: note: expanded from macro '__IA32_SYS_STUBx'
           __SYS_STUBx(ia32, sys##name,                                    \
           ^
   arch/x86/include/asm/syscall_wrapper.h:77:7: note: expanded from macro '__SYS_STUBx'
           long __##abi##_##name(const struct pt_regs *regs)               \
                ^
   <scratch space>:78:1: note: expanded from here
   __ia32_sys_statmount
   ^
   36/1036 (3.47%) spills, 1000/1036 (96.53%) variables
   2 warnings generated.


vim +4896 fs/namespace.c

  4888	
  4889	static int copy_statmount_to_user(struct kstatmount *s)
  4890	{
  4891		struct statmount *sm = &s->sm;
  4892		struct seq_file *seq;
  4893		size_t copysize = min_t(size_t, s->bufsize, sizeof(*sm));
  4894		int ret;
  4895	
> 4896		if (sm->mask & STMT_FS_TYPE) {
  4897			seq = &s->fs_type;
  4898			ret = copy_to_user(s->buf->str + sm->fs_type,
  4899					   seq->buf, seq->count);
  4900		}
  4901	
  4902		if (!ret && sm->mask & STMT_MNT_ROOT) {
  4903			seq = &s->mnt_root;
  4904			ret = copy_to_user(s->buf->str + sm->mnt_root,
  4905					   seq->buf, seq->count);
  4906		}
  4907	
  4908		if (!ret && sm->mask & STMT_MNT_POINT) {
  4909			seq = &s->mnt_point;
  4910			ret = copy_to_user(s->buf->str + sm->mnt_point,
  4911					   seq->buf, seq->count);
  4912		}
  4913	
  4914		if (ret)
  4915			return -EFAULT;
  4916	
  4917		/* Return the number of bytes copied to the buffer */
  4918		sm->size = copysize + s->pos;
  4919		if (copy_to_user(s->buf, sm, copysize))
  4920			return -EFAULT;
  4921	
  4922		return 0;
  4923	}
  4924	
  4925	static int do_statmount(struct kstatmount *s)
  4926	{
  4927		struct mount *m = real_mount(s->mnt);
  4928		int err;
  4929	
  4930		if (!capable(CAP_SYS_ADMIN) &&
  4931		    !is_path_reachable(m, m->mnt.mnt_root, &s->root))
  4932			return -EPERM;
  4933	
  4934		err = security_sb_statfs(s->mnt->mnt_root);
  4935		if (err)
  4936			return err;
  4937	
  4938		if (s->mask & STMT_SB_BASIC)
  4939			stmt_sb_basic(s);
  4940	
  4941		if (s->mask & STMT_MNT_BASIC)
  4942			stmt_mnt_basic(s);
  4943	
  4944		if (s->mask & STMT_PROPAGATE_FROM)
  4945			stmt_propagate_from(s);
  4946	
  4947		if (s->mask & STMT_FS_TYPE)
  4948			err = stmt_string(s, STMT_FS_TYPE);
  4949	
  4950		if (!err && s->mask & STMT_MNT_ROOT)
  4951			err = stmt_string(s, STMT_MNT_ROOT);
  4952	
  4953		if (!err && s->mask & STMT_MNT_POINT)
  4954			err = stmt_string(s, STMT_MNT_POINT);
  4955	
  4956		if (err)
  4957			return err;
  4958	
  4959		return 0;
  4960	}
  4961	
  4962	static inline void drop_kstatmount(struct kstatmount *ks)
  4963	{
  4964		__putname(ks->fs_type.buf);
  4965		__putname(ks->mnt_root.buf);
  4966		__putname(ks->mnt_point.buf);
  4967	}
  4968	
> 4969	SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
  4970			struct statmount __user *, buf, size_t, bufsize,
  4971			unsigned int, flags)
  4972	{
  4973		struct vfsmount *mnt;
  4974		struct mnt_id_req kreq;
  4975		struct kstatmount *ks;
  4976		int ret;
  4977	
  4978		if (flags)
  4979			return -EINVAL;
  4980	
  4981		if (copy_from_user(&kreq, req, sizeof(kreq)))
  4982			return -EFAULT;
  4983	
  4984		down_read(&namespace_sem);
  4985		mnt = lookup_mnt_in_ns(kreq.mnt_id, current->nsproxy->mnt_ns);
  4986		if (!mnt) {
  4987			up_read(&namespace_sem);
  4988			return -ENOENT;
  4989		}
  4990	
  4991		ks = &(struct kstatmount){
  4992			.mask		= kreq.request_mask,
  4993			.buf		= buf,
  4994			.bufsize	= bufsize,
  4995			.mnt		= mnt,
  4996		};
  4997	
  4998		get_fs_root(current->fs, &ks->root);
  4999		ret = do_statmount(ks);
  5000		path_put(&ks->root);
  5001		up_read(&namespace_sem);
  5002	
  5003		if (!ret)
  5004			ret = copy_statmount_to_user(ks);
  5005		drop_kstatmount(ks);
  5006		return ret;
  5007	}
  5008	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
