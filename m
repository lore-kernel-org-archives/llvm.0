Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8734B1D54F;
	Wed,  7 Feb 2024 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707289305; cv=none; b=KNjthVnyPiRxx/s3eMBjsxcvto4yocdefR+ir7Gj0epctZ0BY6izeaidU0o9FMuUx+4/hx8+P8VHjVUAjF1xxocvaSjAh3j5WxODd/ARIwivDoEQPuGf/aP3HO7eS8TVQQBkDC6oEfA+ALZGkgUNg9PkhDBv9zlLp9i0sJAmPhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707289305; c=relaxed/simple;
	bh=Vrp9qIxSQrrVHSgH7+wM6I2exhncQy/7G8sdHmSM8WY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOW63N93+HeoO8zjxFY/5N3jICk8Xo0/O5GBe9j6Gl8QTd0RlZj4JhA/PvyFdkK4CtvOHlHSz5x5RCvvrm03f/dvx8Qu7LXwU5FoOmCsPqDTymEMqKUCjavNOe3keYJdyBwdIHF13lcJ2yF+v4mF/Rs0nfVtc8nlnYyCc0Ts5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6Fd7V1l; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6Fd7V1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707289304; x=1738825304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vrp9qIxSQrrVHSgH7+wM6I2exhncQy/7G8sdHmSM8WY=;
  b=F6Fd7V1lUxC8fzGmm9ueQnZ/0iEjbZKXwg2G7kEhNxlYFb6B5uSdqo1V
   1myiCR5NiKwE1tXjs32p8tOU+3YjFMJQFzzhwrcZpQB3yHSdcU1KhK2eP
   44vFBv9lj+Eh5tE9Rfra+vO3rV3033gZggZXnMy8uxgDGxSMtymcEv0Fn
   WGo9vTfqW/QWFmVfwDO8oqaafr7bI4tkF6IKtiUP4LFlSvHs/xRhR+Uni
   IZNezhEGr873PTjB/wVelBTmAp2bqEZb4h6BpOdd/6ORmhhYGTLWAKmNO
   Uj+ud/SBXukFCVAqKuIhtTJPt9DFFr+BAPgj8J8UCr2Sh1XAxqkAa84ID
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="3893262"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="3893262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 23:01:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1527837"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2024 23:01:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXbwB-0002IS-0l;
	Wed, 07 Feb 2024 07:01:39 +0000
Date: Wed, 7 Feb 2024 15:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 333/376]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:466:7: warning: variable 'file'
 is used uninitialized whenever 'if' condition is true
Message-ID: <202402071433.641DgOWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   e7a7b1f2a1c28403511e71538d30888c9e1425ef
commit: 83cafefb71a5baf40e713ee0faa6992b179649b7 [333/376] RFC KVM: guest_memfd: inode alloc/destroy callback
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240207/202402071433.641DgOWG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071433.641DgOWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402071433.641DgOWG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:466:7: warning: variable 'file' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     466 |                 if (err)
         |                     ^~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:519:7: note: uninitialized use occurs here
     519 |         fput(file);
         |              ^~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:466:3: note: remove the 'if' if its condition is always false
     466 |                 if (err)
         |                 ^~~~~~~~
     467 |                         goto err_file;
         |                         ~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:442:19: note: initialize the variable 'file' to silence this warning
     442 |         struct file *file;
         |                          ^
         |                           = NULL
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:466:7: warning: variable 'fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     466 |                 if (err)
         |                     ^~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:520:16: note: uninitialized use occurs here
     520 |         put_unused_fd(fd);
         |                       ^~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:466:3: note: remove the 'if' if its condition is always false
     466 |                 if (err)
         |                 ^~~~~~~~
     467 |                         goto err_file;
         |                         ~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:443:8: note: initialize the variable 'fd' to silence this warning
     443 |         int fd, err;
         |               ^
         |                = 0
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_TDX_HOST
   Depends on [n]: CPU_SUP_INTEL [=y] && X86_64 [=y] && KVM_INTEL [=y] && X86_X2APIC [=y] && CONTIG_ALLOC [=y] && !KEXEC_CORE [=y] && X86_MCE [=y]
   Selected by [y]:
   - INTEL_TDX_MODULE_LOADER_OLD [=y] && SYSFS [=y]


vim +466 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   434	
   435	static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags,
   436				     struct vfsmount *mnt)
   437	{
   438		const char *anon_name = "[kvm-gmem]";
   439		const struct qstr qname = QSTR_INIT(anon_name, strlen(anon_name));
   440		struct kvm_gmem *gmem;
   441		struct inode *inode;
   442		struct file *file;
   443		int fd, err;
   444	
   445		inode = alloc_anon_inode(mnt->mnt_sb);
   446		if (IS_ERR(inode))
   447			return PTR_ERR(inode);
   448	
   449		err = security_inode_init_security_anon(inode, &qname, NULL);
   450		if (err)
   451			goto err_inode;
   452	
   453		inode->i_private = (void *)(unsigned long)flags;
   454		inode->i_op = &kvm_gmem_iops;
   455		inode->i_mapping->a_ops = &kvm_gmem_aops;
   456		inode->i_mode |= S_IFREG;
   457		i_size_write(inode, size);
   458		mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
   459		mapping_set_large_folios(inode->i_mapping);
   460		mapping_set_unmovable(inode->i_mapping);
   461		inode->i_mapping->flags |= AS_INACCESSIBLE;
   462		/* Unmovable mappings are supposed to be marked unevictable as well. */
   463		WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
   464		if (gmem_alloc_inode) {
   465			err = gmem_alloc_inode(inode);
 > 466			if (err)
   467				goto err_file;
   468		}
   469	
   470		fd = get_unused_fd_flags(0);
   471		if (fd < 0) {
   472			err = fd;
   473			goto err_inode;
   474		}
   475	
   476		if (!try_module_get(kvm_gmem_fops.owner)) {
   477			err = -ENOENT;
   478			goto err_inode;
   479		}
   480	
   481		file = alloc_file_pseudo(inode, mnt, "kvm-gmem", O_RDWR, &kvm_gmem_fops);
   482		if (IS_ERR(file)) {
   483			err = PTR_ERR(file);
   484			put_unused_fd(fd);
   485			goto err_inode;
   486		}
   487	
   488		file->f_flags |= O_LARGEFILE;
   489		file->f_mapping = inode->i_mapping;
   490	
   491		gmem = kzalloc(sizeof(*gmem), GFP_KERNEL);
   492		if (!gmem) {
   493			err = -ENOMEM;
   494			goto err_file;
   495		}
   496	
   497		if (free_folio) {
   498			/*
   499			 * Allow inode alive after releasing file so that kswapd can
   500			 * trigger clearing private page.
   501			 */
   502			set_nlink(inode, 1);
   503			inode_fake_hash(inode);
   504			inode_sb_list_add(inode);
   505		}
   506	
   507		kvm_get_kvm(kvm);
   508		gmem->kvm = kvm;
   509		xa_init(&gmem->bindings);
   510	
   511		file->private_data = gmem;
   512	
   513		list_add(&gmem->entry, &inode->i_mapping->i_private_list);
   514	
   515		fd_install(fd, file);
   516		return fd;
   517	
   518	err_file:
   519		fput(file);
   520		put_unused_fd(fd);
   521		return err;
   522	
   523	err_inode:
   524		iput(inode);
   525		return err;
   526	}
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
