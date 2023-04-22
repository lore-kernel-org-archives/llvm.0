Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D9864F;
	Sat, 22 Apr 2023 23:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682206198; x=1713742198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4vG43szileUXsUY5B0mal23TOh8yJevfoJRi/ZolwC8=;
  b=epHrmVplXZqW91eLj3eksz+YySzoKxVK5DAayTi9NO8jipnQb8bdAnT8
   o1PYcyV8TIbsrHjpEDej52Q+3FHPgycevXBOkKvTLEj2KyjapdYLNzArN
   ajGnkt30AS4oWACQOECHg3QbQqn/+WfJaR5qLbhglj8HxJwtIJ9cMHWug
   /PXhLoimvi9R5Biqe9xJLumCY0k1GgAxe23jMGy9PF0UwPZ2D1fCu8XC7
   cupt3yS1n6ve4l9fzTG3/KAXxlBTmnYP2SlMxybZVZt8t3mI14hmek/WT
   yPK6fKPaJQiyNPgJhhXtIGzLi4e0c2z/O2H93H+aVQZrEzAcnHq+GSlY3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="325809909"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="325809909"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 16:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="938865781"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="938865781"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2023 16:29:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqMfz-000hZ6-0Z;
	Sat, 22 Apr 2023 23:29:55 +0000
Date: Sun, 23 Apr 2023 07:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Saeed Mahameed <saeedm@nvidia.com>
Subject: [linux-next:master 13449/13717]
 drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of
 function 'mlx5_msix_free' is invalid in C99
Message-ID: <202304230755.9jjF6ZJr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
commit: b9ca712f33f59e977592cb639c2e00a02f45a146 [13449/13717] vdpa/mlx5: Support interrupt bypassing
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230423/202304230755.9jjF6ZJr-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b9ca712f33f59e977592cb639c2e00a02f45a146
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b9ca712f33f59e977592cb639c2e00a02f45a146
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/xen/ drivers/power/supply/ drivers/vdpa/mlx5/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230755.9jjF6ZJr-lkp@intel.com/

Note: the linux-next/master HEAD d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: error: implicit declaration of function 'mlx5_msix_free' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mlx5_msix_free(ndev->mvdev.mdev, ent->map);
                   ^
   drivers/vdpa/mlx5/net/mlx5_vnet.c:2896:3: note: did you mean 'mlx5_db_free'?
   include/linux/mlx5/driver.h:1083:6: note: 'mlx5_db_free' declared here
   void mlx5_db_free(struct mlx5_core_dev *dev, struct mlx5_db *db);
        ^
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:14: error: implicit declaration of function 'mlx5_msix_alloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   ent->map = mlx5_msix_alloc(ndev->mvdev.mdev, int_handler, NULL, ent->name);
                              ^
   drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:14: note: did you mean 'mlx5_db_alloc'?
   include/linux/mlx5/driver.h:1078:19: note: 'mlx5_db_alloc' declared here
   static inline int mlx5_db_alloc(struct mlx5_core_dev *dev, struct mlx5_db *db)
                     ^
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:3259:12: error: assigning to 'struct msi_map' from incompatible type 'int'
                   ent->map = mlx5_msix_alloc(ndev->mvdev.mdev, int_handler, NULL, ent->name);
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/mlx5_msix_free +2896 drivers/vdpa/mlx5/net/mlx5_vnet.c

  2885	
  2886	static void free_irqs(struct mlx5_vdpa_net *ndev)
  2887	{
  2888		struct mlx5_vdpa_irq_pool_entry *ent;
  2889		int i;
  2890	
  2891		if (!msix_mode_supported(&ndev->mvdev))
  2892			return;
  2893	
  2894		for (i = ndev->irqp.num_ent - 1; i >= 0; i--) {
  2895			ent = ndev->irqp.entries + i;
> 2896			mlx5_msix_free(ndev->mvdev.mdev, ent->map);
  2897		}
  2898		kfree(ndev->irqp.entries);
  2899	}
  2900	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
