Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE475156C6C;
	Thu, 11 Jul 2024 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693106; cv=none; b=ivHGbHfFyGxqF0pn8Rpt+l7mArB0f48sCS7UNulchxar7CrimaAH9GQ8p88qKFPnp8nOcxNEOcy+etnnUgzGJx4de8ZiRVYoxSEOa48Hb9SMl33zkT1GfOEEdppQCzqbpcucBuKKvsxC9H9AEsvx8KucdaDUz92oPAtMq24kg0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693106; c=relaxed/simple;
	bh=3tmVWVCV1dTdifY40u5gPMuVE1yZ93BQUu4aOcBmD0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mu/dtmknbLy+wQdFZ538hiBf36xEVx7H+A97lXv+tHhBMYqpuQgVnS0JIe6mcnxjMtsoYEHrPnYhnu/k2jOSqM8exWCw6LIFHJD+iRBNWzzd8tlSbBbXD/61cOpSBJygPiPMSPArAcStgqVFRK2FpOSyA8tGvucYOO9Xdfl618o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZPleJhh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZPleJhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720693104; x=1752229104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3tmVWVCV1dTdifY40u5gPMuVE1yZ93BQUu4aOcBmD0c=;
  b=RZPleJhhoCi2qgbZX4iaYWSLteePUZtCP2gRv8e4uiH0AJpQbKEXtpxc
   9mwXa5PYg6MNZznqI292BJeuRg2dn5NZ1xg1b0RLF1E3pXItHxeSGxheC
   XPof4S2/CCmFfEF2RFWL9q+ZNRwv6aosY8tMl8flVJEDE/aw3M9xcsLJK
   UUlbuB6G+S2S64W3UryksZm7LqmXDTJrqKt64Fd33cklv1YjarbdM8E71
   efGKSDOXgsMNAhfWDGWRV6CrgjEAWyuiAcjn4NPJpOJEosAuty/cKybZ1
   q4jkXCay7S9HyrxC8o8m3j7sskdpuv1bmKwT8I8Rb7+bEQMwCstrX8aJr
   w==;
X-CSE-ConnectionGUID: GT8xPtu8QkerJpRAtkItzQ==
X-CSE-MsgGUID: V9A70TamTr6M+gkiWGYOrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17905142"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17905142"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 03:18:24 -0700
X-CSE-ConnectionGUID: qHOIfxaxTamgDjdO8f1I5Q==
X-CSE-MsgGUID: kectMwH9RAm754dC+heUtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="49266758"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jul 2024 03:18:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRqsT-000Z90-04;
	Thu, 11 Jul 2024 10:18:17 +0000
Date: Thu, 11 Jul 2024 18:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: [robertosassu:inode-free-security 1/1]
 include/linux/lsm_hook_defs.h:117:1: warning: omitting the parameter name in
 a function definition is a C23 extension
Message-ID: <202407111803.LoTE3SJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux inode-free-security
head:   804df4ecdaed5aab1b4ba876acd207195090d9cb
commit: 804df4ecdaed5aab1b4ba876acd207195090d9cb [1/1] lsm: add the inode_free_security_rcu() LSM implementation hook
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240711/202407111803.LoTE3SJX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111803.LoTE3SJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111803.LoTE3SJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/bpf_lsm.c:7:
   In file included from include/linux/filter.h:9:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/bpf_lsm.c:7:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/bpf/bpf_lsm.c:7:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/bpf/bpf_lsm.c:7:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from kernel/bpf/bpf_lsm.c:30:
>> include/linux/lsm_hook_defs.h:117:1: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     117 | LSM_HOOK(void, LSM_RET_VOID, inode_free_security_rcu, void *)
         | ^
   kernel/bpf/bpf_lsm.c:25:40: note: expanded from macro 'LSM_HOOK'
      25 | noinline RET bpf_lsm_##NAME(__VA_ARGS__)        \
         |                                        ^
   18 warnings generated.


vim +117 include/linux/lsm_hook_defs.h

   111	
   112	/* Needed for inode based security check */
   113	LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
   114		 unsigned int obj_type)
   115	LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
   116	LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
 > 117	LSM_HOOK(void, LSM_RET_VOID, inode_free_security_rcu, void *)
   118	LSM_HOOK(int, -EOPNOTSUPP, inode_init_security, struct inode *inode,
   119		 struct inode *dir, const struct qstr *qstr, struct xattr *xattrs,
   120		 int *xattr_count)
   121	LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
   122		 const struct qstr *name, const struct inode *context_inode)
   123	LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
   124		 umode_t mode)
   125	LSM_HOOK(void, LSM_RET_VOID, inode_post_create_tmpfile, struct mnt_idmap *idmap,
   126		 struct inode *inode)
   127	LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
   128		 struct dentry *new_dentry)
   129	LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
   130	LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
   131		 const char *old_name)
   132	LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
   133		 umode_t mode)
   134	LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
   135	LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
   136		 umode_t mode, dev_t dev)
   137	LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
   138		 struct inode *new_dir, struct dentry *new_dentry)
   139	LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
   140	LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
   141		 bool rcu)
   142	LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
   143	LSM_HOOK(int, 0, inode_setattr, struct mnt_idmap *idmap, struct dentry *dentry,
   144		 struct iattr *attr)
   145	LSM_HOOK(void, LSM_RET_VOID, inode_post_setattr, struct mnt_idmap *idmap,
   146		 struct dentry *dentry, int ia_valid)
   147	LSM_HOOK(int, 0, inode_getattr, const struct path *path)
   148	LSM_HOOK(int, 0, inode_xattr_skipcap, const char *name)
   149	LSM_HOOK(int, 0, inode_setxattr, struct mnt_idmap *idmap,
   150		 struct dentry *dentry, const char *name, const void *value,
   151		 size_t size, int flags)
   152	LSM_HOOK(void, LSM_RET_VOID, inode_post_setxattr, struct dentry *dentry,
   153		 const char *name, const void *value, size_t size, int flags)
   154	LSM_HOOK(int, 0, inode_getxattr, struct dentry *dentry, const char *name)
   155	LSM_HOOK(int, 0, inode_listxattr, struct dentry *dentry)
   156	LSM_HOOK(int, 0, inode_removexattr, struct mnt_idmap *idmap,
   157		 struct dentry *dentry, const char *name)
   158	LSM_HOOK(void, LSM_RET_VOID, inode_post_removexattr, struct dentry *dentry,
   159		 const char *name)
   160	LSM_HOOK(int, 0, inode_set_acl, struct mnt_idmap *idmap,
   161		 struct dentry *dentry, const char *acl_name, struct posix_acl *kacl)
   162	LSM_HOOK(void, LSM_RET_VOID, inode_post_set_acl, struct dentry *dentry,
   163		 const char *acl_name, struct posix_acl *kacl)
   164	LSM_HOOK(int, 0, inode_get_acl, struct mnt_idmap *idmap,
   165		 struct dentry *dentry, const char *acl_name)
   166	LSM_HOOK(int, 0, inode_remove_acl, struct mnt_idmap *idmap,
   167		 struct dentry *dentry, const char *acl_name)
   168	LSM_HOOK(void, LSM_RET_VOID, inode_post_remove_acl, struct mnt_idmap *idmap,
   169		 struct dentry *dentry, const char *acl_name)
   170	LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
   171	LSM_HOOK(int, 0, inode_killpriv, struct mnt_idmap *idmap,
   172		 struct dentry *dentry)
   173	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct mnt_idmap *idmap,
   174		 struct inode *inode, const char *name, void **buffer, bool alloc)
   175	LSM_HOOK(int, -EOPNOTSUPP, inode_setsecurity, struct inode *inode,
   176		 const char *name, const void *value, size_t size, int flags)
   177	LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
   178		 size_t buffer_size)
   179	LSM_HOOK(void, LSM_RET_VOID, inode_getsecid, struct inode *inode, u32 *secid)
   180	LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
   181	LSM_HOOK(int, -EOPNOTSUPP, inode_copy_up_xattr, struct dentry *src,
   182		 const char *name)
   183	LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
   184		 struct kernfs_node *kn)
   185	LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
   186	LSM_HOOK(int, 0, file_alloc_security, struct file *file)
   187	LSM_HOOK(void, LSM_RET_VOID, file_release, struct file *file)
   188	LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
   189	LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
   190		 unsigned long arg)
   191	LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
   192		 unsigned long arg)
   193	LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
   194	LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
   195		 unsigned long prot, unsigned long flags)
   196	LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
   197		 unsigned long reqprot, unsigned long prot)
   198	LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
   199	LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
   200		 unsigned long arg)
   201	LSM_HOOK(void, LSM_RET_VOID, file_set_fowner, struct file *file)
   202	LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
   203		 struct fown_struct *fown, int sig)
   204	LSM_HOOK(int, 0, file_receive, struct file *file)
   205	LSM_HOOK(int, 0, file_open, struct file *file)
   206	LSM_HOOK(int, 0, file_post_open, struct file *file, int mask)
   207	LSM_HOOK(int, 0, file_truncate, struct file *file)
   208	LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
   209		 unsigned long clone_flags)
   210	LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
   211	LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
   212	LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
   213	LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
   214		 gfp_t gfp)
   215	LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
   216		 const struct cred *old)
   217	LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *secid)
   218	LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
   219	LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
   220	LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
   221	LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
   222	LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
   223		 enum kernel_load_data_id id, char *description)
   224	LSM_HOOK(int, 0, kernel_read_file, struct file *file,
   225		 enum kernel_read_file_id id, bool contents)
   226	LSM_HOOK(int, 0, kernel_post_read_file, struct file *file, char *buf,
   227		 loff_t size, enum kernel_read_file_id id)
   228	LSM_HOOK(int, 0, task_fix_setuid, struct cred *new, const struct cred *old,
   229		 int flags)
   230	LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
   231		 int flags)
   232	LSM_HOOK(int, 0, task_fix_setgroups, struct cred *new, const struct cred * old)
   233	LSM_HOOK(int, 0, task_setpgid, struct task_struct *p, pid_t pgid)
   234	LSM_HOOK(int, 0, task_getpgid, struct task_struct *p)
   235	LSM_HOOK(int, 0, task_getsid, struct task_struct *p)
   236	LSM_HOOK(void, LSM_RET_VOID, current_getsecid_subj, u32 *secid)
   237	LSM_HOOK(void, LSM_RET_VOID, task_getsecid_obj,
   238		 struct task_struct *p, u32 *secid)
   239	LSM_HOOK(int, 0, task_setnice, struct task_struct *p, int nice)
   240	LSM_HOOK(int, 0, task_setioprio, struct task_struct *p, int ioprio)
   241	LSM_HOOK(int, 0, task_getioprio, struct task_struct *p)
   242	LSM_HOOK(int, 0, task_prlimit, const struct cred *cred,
   243		 const struct cred *tcred, unsigned int flags)
   244	LSM_HOOK(int, 0, task_setrlimit, struct task_struct *p, unsigned int resource,
   245		 struct rlimit *new_rlim)
   246	LSM_HOOK(int, 0, task_setscheduler, struct task_struct *p)
   247	LSM_HOOK(int, 0, task_getscheduler, struct task_struct *p)
   248	LSM_HOOK(int, 0, task_movememory, struct task_struct *p)
   249	LSM_HOOK(int, 0, task_kill, struct task_struct *p, struct kernel_siginfo *info,
   250		 int sig, const struct cred *cred)
   251	LSM_HOOK(int, -ENOSYS, task_prctl, int option, unsigned long arg2,
   252		 unsigned long arg3, unsigned long arg4, unsigned long arg5)
   253	LSM_HOOK(void, LSM_RET_VOID, task_to_inode, struct task_struct *p,
   254		 struct inode *inode)
   255	LSM_HOOK(int, 0, userns_create, const struct cred *cred)
   256	LSM_HOOK(int, 0, ipc_permission, struct kern_ipc_perm *ipcp, short flag)
   257	LSM_HOOK(void, LSM_RET_VOID, ipc_getsecid, struct kern_ipc_perm *ipcp,
   258		 u32 *secid)
   259	LSM_HOOK(int, 0, msg_msg_alloc_security, struct msg_msg *msg)
   260	LSM_HOOK(void, LSM_RET_VOID, msg_msg_free_security, struct msg_msg *msg)
   261	LSM_HOOK(int, 0, msg_queue_alloc_security, struct kern_ipc_perm *perm)
   262	LSM_HOOK(void, LSM_RET_VOID, msg_queue_free_security,
   263		 struct kern_ipc_perm *perm)
   264	LSM_HOOK(int, 0, msg_queue_associate, struct kern_ipc_perm *perm, int msqflg)
   265	LSM_HOOK(int, 0, msg_queue_msgctl, struct kern_ipc_perm *perm, int cmd)
   266	LSM_HOOK(int, 0, msg_queue_msgsnd, struct kern_ipc_perm *perm,
   267		 struct msg_msg *msg, int msqflg)
   268	LSM_HOOK(int, 0, msg_queue_msgrcv, struct kern_ipc_perm *perm,
   269		 struct msg_msg *msg, struct task_struct *target, long type, int mode)
   270	LSM_HOOK(int, 0, shm_alloc_security, struct kern_ipc_perm *perm)
   271	LSM_HOOK(void, LSM_RET_VOID, shm_free_security, struct kern_ipc_perm *perm)
   272	LSM_HOOK(int, 0, shm_associate, struct kern_ipc_perm *perm, int shmflg)
   273	LSM_HOOK(int, 0, shm_shmctl, struct kern_ipc_perm *perm, int cmd)
   274	LSM_HOOK(int, 0, shm_shmat, struct kern_ipc_perm *perm, char __user *shmaddr,
   275		 int shmflg)
   276	LSM_HOOK(int, 0, sem_alloc_security, struct kern_ipc_perm *perm)
   277	LSM_HOOK(void, LSM_RET_VOID, sem_free_security, struct kern_ipc_perm *perm)
   278	LSM_HOOK(int, 0, sem_associate, struct kern_ipc_perm *perm, int semflg)
   279	LSM_HOOK(int, 0, sem_semctl, struct kern_ipc_perm *perm, int cmd)
   280	LSM_HOOK(int, 0, sem_semop, struct kern_ipc_perm *perm, struct sembuf *sops,
   281		 unsigned nsops, int alter)
   282	LSM_HOOK(int, 0, netlink_send, struct sock *sk, struct sk_buff *skb)
   283	LSM_HOOK(void, LSM_RET_VOID, d_instantiate, struct dentry *dentry,
   284		 struct inode *inode)
   285	LSM_HOOK(int, -EOPNOTSUPP, getselfattr, unsigned int attr,
   286		 struct lsm_ctx __user *ctx, u32 *size, u32 flags)
   287	LSM_HOOK(int, -EOPNOTSUPP, setselfattr, unsigned int attr,
   288		 struct lsm_ctx *ctx, u32 size, u32 flags)
   289	LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, const char *name,
   290		 char **value)
   291	LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
   292	LSM_HOOK(int, 0, ismaclabel, const char *name)
   293	LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
   294		 u32 *seclen)
   295	LSM_HOOK(int, 0, secctx_to_secid, const char *secdata, u32 seclen, u32 *secid)
   296	LSM_HOOK(void, LSM_RET_VOID, release_secctx, char *secdata, u32 seclen)
   297	LSM_HOOK(void, LSM_RET_VOID, inode_invalidate_secctx, struct inode *inode)
   298	LSM_HOOK(int, 0, inode_notifysecctx, struct inode *inode, void *ctx, u32 ctxlen)
   299	LSM_HOOK(int, 0, inode_setsecctx, struct dentry *dentry, void *ctx, u32 ctxlen)
   300	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecctx, struct inode *inode, void **ctx,
   301		 u32 *ctxlen)
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
