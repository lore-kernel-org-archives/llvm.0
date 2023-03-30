Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD81105;
	Thu, 30 Mar 2023 01:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680139942; x=1711675942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6AQp9StkLohSl/JIGg2zXeTxE47rvWyE9rmFLpPSf5g=;
  b=Ras4OMRLvl/yOFg8ouX3o2gj7RE/fVX5fLzmQ+4/dEvhO5c/FYFNY/7o
   HXOVH4yplhKc8wJIehX9hq03sIzxo1OwVCXgNGTTyOYuYoaHCUA2mSPLM
   bvK13tkRHk6M94HuP2G3A0Yu0oCpuUbtsHIJamTEOQpsac2KjdzGJ5v0e
   s2vy6CLWpvc80T8TZ+sIi0uEp8KHeY/VvdTQpoZCkn3olV2BDMQNTv/Y8
   +AIy/VBngeu0qNdl4LV6c9ftyo5my4FRkPdnuU9PWTy3F1LiCTGtTkrZ+
   7Q4g0lU/MA5n5mB2+xJeORGVZQrU73yhxmL0wGx8G/lDJ4efgsQHZRgUr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405999289"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="405999289"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 18:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="634686606"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="634686606"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Mar 2023 18:32:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phh9H-000K8Y-2j;
	Thu, 30 Mar 2023 01:32:19 +0000
Date: Thu, 30 Mar 2023 09:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-shmem-stable-dir-cookies 1/1] mm/shmem.c:4038:3: error:
 call to undeclared function 'shmem_dirent_destroy'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202303300953.ow1IwVln-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-shmem-stable-dir-cookies
head:   f24b5311a9ec85e941a370942947ce0ef018f7e3
commit: f24b5311a9ec85e941a370942947ce0ef018f7e3 [1/1] shmem: stable directory cookies
config: riscv-randconfig-r014-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300953.ow1IwVln-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=f24b5311a9ec85e941a370942947ce0ef018f7e3
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-shmem-stable-dir-cookies
        git checkout f24b5311a9ec85e941a370942947ce0ef018f7e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300953.ow1IwVln-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/shmem.c:4038:3: error: call to undeclared function 'shmem_dirent_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   shmem_dirent_destroy(inode);
                   ^
>> mm/shmem.c:4114:13: error: use of undeclared identifier 'shmem_dir_llseek'
           .llseek         = shmem_dir_llseek,
                             ^
>> mm/shmem.c:4116:20: error: use of undeclared identifier 'shmem_readdir'
           .iterate_shared = shmem_readdir,
                             ^
   3 errors generated.


vim +/shmem_dirent_destroy +4038 mm/shmem.c

  4032	
  4033	static void shmem_free_in_core_inode(struct inode *inode)
  4034	{
  4035		if (S_ISLNK(inode->i_mode))
  4036			kfree(inode->i_link);
  4037		if (S_ISDIR(inode->i_mode))
> 4038			shmem_dirent_destroy(inode);
  4039		kmem_cache_free(shmem_inode_cachep, SHMEM_I(inode));
  4040	}
  4041	
  4042	static void shmem_destroy_inode(struct inode *inode)
  4043	{
  4044		if (S_ISREG(inode->i_mode))
  4045			mpol_free_shared_policy(&SHMEM_I(inode)->policy);
  4046	}
  4047	
  4048	static void shmem_init_inode(void *foo)
  4049	{
  4050		struct shmem_inode_info *info = foo;
  4051		inode_init_once(&info->vfs_inode);
  4052	}
  4053	
  4054	static void shmem_init_inodecache(void)
  4055	{
  4056		shmem_inode_cachep = kmem_cache_create("shmem_inode_cache",
  4057					sizeof(struct shmem_inode_info),
  4058					0, SLAB_PANIC|SLAB_ACCOUNT, shmem_init_inode);
  4059	}
  4060	
  4061	static void shmem_destroy_inodecache(void)
  4062	{
  4063		kmem_cache_destroy(shmem_inode_cachep);
  4064	}
  4065	
  4066	/* Keep the page in page cache instead of truncating it */
  4067	static int shmem_error_remove_page(struct address_space *mapping,
  4068					   struct page *page)
  4069	{
  4070		return 0;
  4071	}
  4072	
  4073	const struct address_space_operations shmem_aops = {
  4074		.writepage	= shmem_writepage,
  4075		.dirty_folio	= noop_dirty_folio,
  4076	#ifdef CONFIG_TMPFS
  4077		.write_begin	= shmem_write_begin,
  4078		.write_end	= shmem_write_end,
  4079	#endif
  4080	#ifdef CONFIG_MIGRATION
  4081		.migrate_folio	= migrate_folio,
  4082	#endif
  4083		.error_remove_page = shmem_error_remove_page,
  4084	};
  4085	EXPORT_SYMBOL(shmem_aops);
  4086	
  4087	static const struct file_operations shmem_file_operations = {
  4088		.mmap		= shmem_mmap,
  4089		.open		= generic_file_open,
  4090		.get_unmapped_area = shmem_get_unmapped_area,
  4091	#ifdef CONFIG_TMPFS
  4092		.llseek		= shmem_file_llseek,
  4093		.read_iter	= shmem_file_read_iter,
  4094		.write_iter	= generic_file_write_iter,
  4095		.fsync		= noop_fsync,
  4096		.splice_read	= generic_file_splice_read,
  4097		.splice_write	= iter_file_splice_write,
  4098		.fallocate	= shmem_fallocate,
  4099	#endif
  4100	};
  4101	
  4102	static const struct inode_operations shmem_inode_operations = {
  4103		.getattr	= shmem_getattr,
  4104		.setattr	= shmem_setattr,
  4105	#ifdef CONFIG_TMPFS_XATTR
  4106		.listxattr	= shmem_listxattr,
  4107		.set_acl	= simple_set_acl,
  4108		.fileattr_get	= shmem_fileattr_get,
  4109		.fileattr_set	= shmem_fileattr_set,
  4110	#endif
  4111	};
  4112	
  4113	static const struct file_operations shmem_dir_operations = {
> 4114		.llseek		= shmem_dir_llseek,
  4115		.read		= generic_read_dir,
> 4116		.iterate_shared	= shmem_readdir,
  4117		.fsync		= noop_fsync,
  4118	};
  4119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
