Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453011F462C;
	Mon, 19 May 2025 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652839; cv=none; b=aNUnm8nHoxvXfuawT1Bb+/V3CxkYiLh53U+WLFJbGDZadKmfapWpnGFU4CukmTIQAAKoo/DMeqkVssNaw2EJObQXY/iOPUd9fjl/HoTEPAekVHlBXNgCls85JS7G+5XZzEOd8dmy+U4vkIhXn2L60gcCuc3Jn9rO36kKc+W9nsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652839; c=relaxed/simple;
	bh=IOGMI371aGLECuajL1Zpe6rTEtxVw+MWH2PaOaTO4pY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fJ4saEiPhnOFREcLJEukFxkNW8+ybS6KQPDNckRZ0tyzrc7XzaMeQ5NmKvkTOs8Yj7FtmY88yXPnfmD3s/PZVQK7pvTenxfaBKPzjVuEt3J2ZI2uqZj6of0m5Rgy8cK6yDxfkDQaFQn4bHFZGulm9thqW+Ma/bMg3DRaOGu+NQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXkcMzit; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXkcMzit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747652837; x=1779188837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IOGMI371aGLECuajL1Zpe6rTEtxVw+MWH2PaOaTO4pY=;
  b=IXkcMzit/9NT0Dm5xmPRy7JRF5qDZQUQHF5RKIXTRyRzygCds97Zz9oq
   FJ/y4MS4LlYjst/EpbJvN7sm6r9sATDUBkn9m+4+MUtJNY+4x3TLkFCC4
   vu5gikIGW4F2ebKJnJg8We2ARnjvGbakwq4xvkdGkrS4E/w3jQ3Jc2M9o
   Y8CELwLkJlsv//ta1fE3DUlQ4XUJqbeYnlncrhxMl++5Eys73iaqmW8BF
   u3bChADErsnPkff1/mMPc91SakcvTFDLkdO63VGMR+7KqBi69C0UxuyY4
   Eq3Gutk6R7hgQD89cnVBEq69s9913lpplUVMCxBIeMMEViMxhgvj+6+gN
   w==;
X-CSE-ConnectionGUID: Ef64bWXPQ/GPXxzVoTFZyw==
X-CSE-MsgGUID: WKzuZXRaSPiB1DY3Z2GfwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49422912"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49422912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:07:17 -0700
X-CSE-ConnectionGUID: FKBznSVYRgOnL7u2CPjMKg==
X-CSE-MsgGUID: 9ghLOayrRnOZktFwZsj7CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="140361142"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2025 04:07:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGyKu-000LNJ-1Y;
	Mon, 19 May 2025 11:07:12 +0000
Date: Mon, 19 May 2025 19:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [weiny2:ackerley-1g-master 25/75]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:661:20: error: no member named
 'shareability' in 'struct kvm_gmem_inode_private'
Message-ID: <202505191852.AEEFVPo0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: 45d9191983b5a21667d7b52c929d77833dfbc778 [25/75] KVM: guest_memfd: Introduce and use shareability to guard faulting
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250519/202505191852.AEEFVPo0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191852.AEEFVPo0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191852.AEEFVPo0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:97:2: error: too few arguments to function call, at least argument 'fmt' must be specified
      97 |         WARN_ONCE("Unexpected call to get shared folio.")
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:152:29: note: expanded from macro 'WARN_ONCE'
     152 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/once_lite.h:31:4: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:134:3: note: expanded from macro 'WARN'
     134 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:106:20: note: expanded from macro '__WARN_printf'
     106 |                 __warn_printk(arg);                                     \
         |                 ~~~~~~~~~~~~~    ^
   include/asm-generic/bug.h:93:28: note: '__warn_printk' declared here
      93 | extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
         |                            ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:97:51: error: expected ';' after expression
      97 |         WARN_ONCE("Unexpected call to get shared folio.")
         |                                                          ^
         |                                                          ;
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:505:33: warning: unused variable 'private' [-Wunused-variable]
     505 |         struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
         |                                        ^~~~~~~
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:661:20: error: no member named 'shareability' in 'struct kvm_gmem_inode_private'
     661 |         mt_init(&private->shareability);
         |                  ~~~~~~~  ^
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:664:36: error: incompatible pointer types passing 'struct kvm_gmem_inode_private *' to parameter of type 'struct maple_tree *' [-Werror,-Wincompatible-pointer-types]
     664 |         err = kvm_gmem_shareability_setup(private, size, flags);
         |                                           ^~~~~~~
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:90:59: note: passing argument to parameter 'mt' here
      90 | static int kvm_gmem_shareability_setup(struct maple_tree *mt, loff_t size, u64 flags)
         |                                                           ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:839:6: error: call to undeclared function 'kvm_gmem_supports_shared'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     839 |         if (kvm_gmem_supports_shared(inode)) {
         |             ^
   arch/x86/kvm/../../../virt/kvm/guest_memfd.c:839:6: note: did you mean 'kvm_gmem_memslot_supports_shared'?
   include/linux/kvm_host.h:2513:20: note: 'kvm_gmem_memslot_supports_shared' declared here
    2513 | static inline bool kvm_gmem_memslot_supports_shared(const struct kvm_memory_slot *slot)
         |                    ^
   1 warning and 5 errors generated.


vim +661 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

   502	
   503	static void kvm_gmem_destroy_inode(struct inode *inode)
   504	{
 > 505		struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
   506	
   507	#ifdef CONFIG_KVM_GMEM_SHARED_MEM
   508		/*
   509		 * mtree_destroy() can't be used within rcu callback, hence can't be
   510		 * done in ->free_inode().
   511		 */
   512		if (private)
   513			mtree_destroy(&private->shareability);
   514	#endif
   515	}
   516	
   517	static const struct super_operations kvm_gmem_super_operations = {
   518		.statfs		= simple_statfs,
   519		.destroy_inode	= kvm_gmem_destroy_inode,
   520		.free_inode	= kvm_gmem_free_inode,
   521	};
   522	
   523	static int kvm_gmem_init_fs_context(struct fs_context *fc)
   524	{
   525		struct pseudo_fs_context *ctx;
   526	
   527		if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
   528			return -ENOMEM;
   529	
   530		ctx = fc->fs_private;
   531		ctx->ops = &kvm_gmem_super_operations;
   532	
   533		return 0;
   534	}
   535	
   536	static struct file_system_type kvm_gmem_fs = {
   537		.name		 = "kvm_guest_memory",
   538		.init_fs_context = kvm_gmem_init_fs_context,
   539		.kill_sb	 = kill_anon_super,
   540	};
   541	
   542	static int kvm_gmem_init_mount(void)
   543	{
   544		kvm_gmem_mnt = kern_mount(&kvm_gmem_fs);
   545	
   546		if (WARN_ON_ONCE(IS_ERR(kvm_gmem_mnt)))
   547			return PTR_ERR(kvm_gmem_mnt);
   548	
   549		kvm_gmem_mnt->mnt_flags |= MNT_NOEXEC;
   550		return 0;
   551	}
   552	
   553	int kvm_gmem_init(struct module *module)
   554	{
   555		kvm_gmem_fops.owner = module;
   556	
   557		return kvm_gmem_init_mount();
   558	}
   559	
   560	void kvm_gmem_exit(void)
   561	{
   562		kern_unmount(kvm_gmem_mnt);
   563		kvm_gmem_mnt = NULL;
   564	}
   565	
   566	static int kvm_gmem_migrate_folio(struct address_space *mapping,
   567					  struct folio *dst, struct folio *src,
   568					  enum migrate_mode mode)
   569	{
   570		WARN_ON_ONCE(1);
   571		return -EINVAL;
   572	}
   573	
   574	static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *folio)
   575	{
   576		struct list_head *gmem_list = &mapping->i_private_list;
   577		struct kvm_gmem *gmem;
   578		pgoff_t start, end;
   579	
   580		filemap_invalidate_lock_shared(mapping);
   581	
   582		start = folio->index;
   583		end = start + folio_nr_pages(folio);
   584	
   585		list_for_each_entry(gmem, gmem_list, entry)
   586			kvm_gmem_invalidate_begin(gmem, start, end);
   587	
   588		/*
   589		 * Do not truncate the range, what action is taken in response to the
   590		 * error is userspace's decision (assuming the architecture supports
   591		 * gracefully handling memory errors).  If/when the guest attempts to
   592		 * access a poisoned page, kvm_gmem_get_pfn() will return -EHWPOISON,
   593		 * at which point KVM can either terminate the VM or propagate the
   594		 * error to userspace.
   595		 */
   596	
   597		list_for_each_entry(gmem, gmem_list, entry)
   598			kvm_gmem_invalidate_end(gmem, start, end);
   599	
   600		filemap_invalidate_unlock_shared(mapping);
   601	
   602		return MF_DELAYED;
   603	}
   604	
   605	#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
   606	static void kvm_gmem_free_folio(struct folio *folio)
   607	{
   608		struct page *page = folio_page(folio, 0);
   609		kvm_pfn_t pfn = page_to_pfn(page);
   610		int order = folio_order(folio);
   611	
   612		kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
   613	}
   614	#endif
   615	
   616	static const struct address_space_operations kvm_gmem_aops = {
   617		.dirty_folio = noop_dirty_folio,
   618		.migrate_folio	= kvm_gmem_migrate_folio,
   619		.error_remove_folio = kvm_gmem_error_folio,
   620	#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
   621		.free_folio = kvm_gmem_free_folio,
   622	#endif
   623	};
   624	
   625	static int kvm_gmem_getattr(struct mnt_idmap *idmap, const struct path *path,
   626				    struct kstat *stat, u32 request_mask,
   627				    unsigned int query_flags)
   628	{
   629		struct inode *inode = path->dentry->d_inode;
   630	
   631		generic_fillattr(idmap, request_mask, inode, stat);
   632		return 0;
   633	}
   634	
   635	static int kvm_gmem_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
   636				    struct iattr *attr)
   637	{
   638		return -EINVAL;
   639	}
   640	static const struct inode_operations kvm_gmem_iops = {
   641		.getattr	= kvm_gmem_getattr,
   642		.setattr	= kvm_gmem_setattr,
   643	};
   644	
   645	static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
   646							      loff_t size, u64 flags)
   647	{
   648		struct kvm_gmem_inode_private *private;
   649		struct inode *inode;
   650		int err;
   651	
   652		inode = alloc_anon_secure_inode(kvm_gmem_mnt->mnt_sb, name);
   653		if (IS_ERR(inode))
   654			return inode;
   655	
   656		err = -ENOMEM;
   657		private = kzalloc(sizeof(*private), GFP_KERNEL);
   658		if (!private)
   659			goto out;
   660	
 > 661		mt_init(&private->shareability);
   662		inode->i_mapping->i_private_data = private;
   663	
 > 664		err = kvm_gmem_shareability_setup(private, size, flags);
   665		if (err)
   666			goto out;
   667	
   668		inode->i_private = (void *)(unsigned long)flags;
   669		inode->i_op = &kvm_gmem_iops;
   670		inode->i_mapping->a_ops = &kvm_gmem_aops;
   671		inode->i_mode |= S_IFREG;
   672		inode->i_size = size;
   673		mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
   674		mapping_set_inaccessible(inode->i_mapping);
   675		/* Unmovable mappings are supposed to be marked unevictable as well. */
   676		WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
   677	
   678		return inode;
   679	
   680	out:
   681		iput(inode);
   682	
   683		return ERR_PTR(err);
   684	}
   685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
