Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246662E2EF9;
	Wed, 24 Jun 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782298246; cv=none; b=InOBe77dyIHPucXlqpp2lyelq10gv6OoA3Dnga786T/NohUni/JDGN5nCJ8YGzgupOH0Dk3KmnRtgdBFaS88cy7mx+qHQyjz4754oEWcMajPo+2JVH4tGjREDeBzNsByCnACJnXWL///mQpyvm/weijsjJAL6Il/aEG2HbEdRBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782298246; c=relaxed/simple;
	bh=yXss0N0VZsuQD+oH1NHVPUKM4T/BgLzmAcJatSti0Rk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mFse34pbxIMQDCkOyBwx59g+mFd8RmmFW6KMyGlzGsp1v0mmT3IcnVRhgJFrpq55fOU0I/nKzvmQ3EpxlaBbtGr9tssciHzDsAvpWJP4BnseDg865tQw0RE8y3E/+KkvvFdeSnIWruzE3NXiFUy3ifFzHzQU6XscML9Z5kmh9V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a03C+ACQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a03C+ACQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782298244; x=1813834244;
  h=date:from:to:cc:subject:message-id;
  bh=yXss0N0VZsuQD+oH1NHVPUKM4T/BgLzmAcJatSti0Rk=;
  b=a03C+ACQqC5o1ABn4VdpvQAHF97sNbVJiVL+e8Qxugd7KJnK08TgH5zP
   q2sclKjgzqoTvE52hDNpWt4TXzrG8b91hzhKzjIH2PKxRvBLTVoNYNtrw
   7j7Kxnl/pR05UkjV39V7yNb6q0JzTPa4978PPMXxoDnxI9/Nqy7ZonJ5P
   WcQJ8jkWz1J76yFLLHwH4mi6Jgm9CA892i9L7XPMfajjJmiDoK0AhP4K2
   Vt/kYD75xx4jnhstvCPgu0T5/Mqyl9xTh//VIV28oKE47HIshz2f9hWgk
   zCcZciSi1cdGSs9jB8rxZTDqcO43fwGG3kFQ8iLwCxcd5qIIlEY1P65Xv
   A==;
X-CSE-ConnectionGUID: t3Tv0skaS3qTo0A+J8YBYQ==
X-CSE-MsgGUID: 3DCIS2IuS4m58Aqg/QapQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105849669"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="105849669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 03:50:44 -0700
X-CSE-ConnectionGUID: rbIwypHbSrSv9qYcuHfF6w==
X-CSE-MsgGUID: 22RZrlZPR3+mhVSDnbchxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="253697845"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Jun 2026 03:50:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcLBn-000000003ID-2Uxm;
	Wed, 24 Jun 2026 10:50:39 +0000
Date: Wed, 24 Jun 2026 18:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davejiang:djiang5/gmem-private-node 3/4]
 arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:610:9: error: call to
 undeclared function 'mpol_private_bind'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202606241846.d0N56pum-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davejiang/linux.git djiang5/gmem-private-node
head:   d3d7a6f5d40881bb11ac8f9ab05421d80a884a9b
commit: af5f1af845c19fd7e4eb7d61567fc0b41044bd7f [3/4] KVM: guest_memfd: allow binding backing memory to a NUMA node at creation
config: arm64-randconfig-004 (https://download.01.org/0day-ci/archive/20260624/202606241846.d0N56pum-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241846.d0N56pum-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241846.d0N56pum-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:610:9: error: call to undeclared function 'mpol_private_bind'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     610 |                 pol = mpol_private_bind(node);
         |                       ^
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:610:7: error: incompatible integer to pointer conversion assigning to 'struct mempolicy *' from 'int' [-Wint-conversion]
     610 |                 pol = mpol_private_bind(node);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:615:9: error: call to undeclared function 'mpol_set_shared_policy_all'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     615 |                 err = mpol_set_shared_policy_all(&GMEM_I(inode)->policy, pol);
         |                       ^
   arch/arm64/kvm/../../../virt/kvm/guest_memfd.c:615:9: note: did you mean 'mpol_free_shared_policy'?
   include/linux/mempolicy.h:223:20: note: 'mpol_free_shared_policy' declared here
     223 | static inline void mpol_free_shared_policy(struct shared_policy *sp)
         |                    ^
   3 errors generated.


vim +/mpol_private_bind +610 arch/arm64/kvm/../../../virt/kvm/guest_memfd.c

   558	
   559	static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags, int node)
   560	{
   561		static const char *name = "[kvm-gmem]";
   562		struct gmem_file *f;
   563		struct inode *inode;
   564		struct file *file;
   565		int fd, err;
   566	
   567		fd = get_unused_fd_flags(0);
   568		if (fd < 0)
   569			return fd;
   570	
   571		f = kzalloc_obj(*f);
   572		if (!f) {
   573			err = -ENOMEM;
   574			goto err_fd;
   575		}
   576	
   577		/* __fput() will take care of fops_put(). */
   578		if (!fops_get(&kvm_gmem_fops)) {
   579			err = -ENOENT;
   580			goto err_gmem;
   581		}
   582	
   583		inode = anon_inode_make_secure_inode(kvm_gmem_mnt->mnt_sb, name, NULL);
   584		if (IS_ERR(inode)) {
   585			err = PTR_ERR(inode);
   586			goto err_fops;
   587		}
   588	
   589		inode->i_op = &kvm_gmem_iops;
   590		inode->i_mapping->a_ops = &kvm_gmem_aops;
   591		inode->i_mode |= S_IFREG;
   592		inode->i_size = size;
   593		mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
   594		mapping_set_inaccessible(inode->i_mapping);
   595		/* Unmovable mappings are supposed to be marked unevictable as well. */
   596		WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
   597	
   598		GMEM_I(inode)->flags = flags;
   599	
   600		if (IS_ENABLED(CONFIG_NUMA) && (flags & GUEST_MEMFD_FLAG_BIND_NODE)) {
   601			struct mempolicy *pol;
   602	
   603			/*
   604			 * Bind every folio (host- and guest-faulted) to @node by
   605			 * installing a private bind on the inode's shared policy.  The
   606			 * policy is inserted verbatim so an MPOL_F_PRIVATE node is not
   607			 * dropped, unlike the mbind() path which requires the node to
   608			 * opt into CAP_MEMPOLICY.
   609			 */
 > 610			pol = mpol_private_bind(node);
   611			if (IS_ERR(pol)) {
   612				err = PTR_ERR(pol);
   613				goto err_inode;
   614			}
 > 615			err = mpol_set_shared_policy_all(&GMEM_I(inode)->policy, pol);
   616			mpol_put(pol);
   617			if (err)
   618				goto err_inode;
   619		}
   620	
   621		file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
   622		if (IS_ERR(file)) {
   623			err = PTR_ERR(file);
   624			goto err_inode;
   625		}
   626	
   627		file->f_flags |= O_LARGEFILE;
   628		file->private_data = f;
   629	
   630		kvm_get_kvm(kvm);
   631		f->kvm = kvm;
   632		xa_init(&f->bindings);
   633		list_add(&f->entry, &GMEM_I(inode)->gmem_file_list);
   634	
   635		fd_install(fd, file);
   636		return fd;
   637	
   638	err_inode:
   639		iput(inode);
   640	err_fops:
   641		fops_put(&kvm_gmem_fops);
   642	err_gmem:
   643		kfree(f);
   644	err_fd:
   645		put_unused_fd(fd);
   646		return err;
   647	}
   648	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
