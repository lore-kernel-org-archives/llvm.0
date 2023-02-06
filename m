Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C75F7F;
	Mon,  6 Feb 2023 00:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675645124; x=1707181124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=huYIxJmsUUnB2hhLbLPAlW3NJExt3qxQvSvg0Q+Wec8=;
  b=cHUSy5GRd5WZpvOkGnSebWZhQBtAH87HBvXX9vZC21viamtlbOOHjVQS
   pagPmcoFsf0Tqyo2ITQoHOGWiiknai2DJXcHMllCav0I2+hkI0dOmra65
   9OKeXTgaR90vTxonfV/nMG+Qc5bKBJnaNcj2sArZzvxpB2djS04Ub4SKE
   i7AkN+ExyuKfGlczdkssViB3NoOlBRU8FIwM8G2iG6+JQlnYPVDF/AzWO
   7UNyQu1KTvKxRvjG3hqGPLmT3bS87VXffZxcVhXD/VQnf4opmDziabNtc
   kAqe2AgrqwH0OYtZfV6Ogms654MtUPToCfYZ69/thxOYVDFcsXlZvYxJo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="327740634"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="327740634"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 16:58:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="790287521"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="790287521"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Feb 2023 16:58:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOpqD-0002JI-1O;
	Mon, 06 Feb 2023 00:58:41 +0000
Date: Mon, 6 Feb 2023 08:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/020-t6000-dart 6/21]
 drivers/iommu/apple-dart.c:610:34: warning: implicit conversion from
 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from
 18446744073709551615 to 4294967295
Message-ID: <202302060829.LqIe1phI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/020-t6000-dart
head:   05458bcb879b99768bb4621c212651a1316a4e95
commit: da75d5ce709f288f6e4902dcf6fe5d7113995bdd [6/21] iommu: dart: Add t8110 DART support
config: arm-randconfig-r046-20230206 (https://download.01.org/0day-ci/archive/20230206/202302060829.LqIe1phI-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/AsahiLinux/linux/commit/da75d5ce709f288f6e4902dcf6fe5d7113995bdd
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/020-t6000-dart
        git checkout da75d5ce709f288f6e4902dcf6fe5d7113995bdd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iommu/apple-dart.c:610:34: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           domain->geometry.aperture_end = DMA_BIT_MASK(dart->ias);
                                         ~ ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   1 warning generated.


vim +610 drivers/iommu/apple-dart.c

   571	
   572	static int apple_dart_finalize_domain(struct iommu_domain *domain,
   573					      struct apple_dart_master_cfg *cfg)
   574	{
   575		struct apple_dart_domain *dart_domain = to_dart_domain(domain);
   576		struct apple_dart *dart = cfg->stream_maps[0].dart;
   577		struct io_pgtable_cfg pgtbl_cfg;
   578		int ret = 0;
   579		int i, j;
   580	
   581		mutex_lock(&dart_domain->init_lock);
   582	
   583		if (dart_domain->finalized)
   584			goto done;
   585	
   586		for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
   587			dart_domain->stream_maps[i].dart = cfg->stream_maps[i].dart;
   588			for (j = 0; j < BITS_TO_LONGS(dart->num_streams); j++)
   589				atomic_long_set(&dart_domain->stream_maps[i].sidmap[j],
   590						cfg->stream_maps[i].sidmap[j]);
   591		}
   592	
   593		pgtbl_cfg = (struct io_pgtable_cfg){
   594			.pgsize_bitmap = dart->pgsize,
   595			.ias = dart->ias,
   596			.oas = dart->oas,
   597			.coherent_walk = 1,
   598			.iommu_dev = dart->dev,
   599		};
   600	
   601		dart_domain->pgtbl_ops =
   602			alloc_io_pgtable_ops(dart->hw->fmt, &pgtbl_cfg, domain);
   603		if (!dart_domain->pgtbl_ops) {
   604			ret = -ENOMEM;
   605			goto done;
   606		}
   607	
   608		domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
   609		domain->geometry.aperture_start = 0;
 > 610		domain->geometry.aperture_end = DMA_BIT_MASK(dart->ias);
   611		domain->geometry.force_aperture = true;
   612	
   613		dart_domain->finalized = true;
   614	
   615	done:
   616		mutex_unlock(&dart_domain->init_lock);
   617		return ret;
   618	}
   619	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
