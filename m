Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201E2F30;
	Wed, 29 Mar 2023 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680105728; x=1711641728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agpdi5xj6PEqJgMmgE/91PwMeriot5GLiWkFuZx+35M=;
  b=aP1YPEBOFEovgLUYcsuM+FQJWkQ8xD7LpQKjWkyODfuSGO7TkIKbvCTD
   1dRRh3KxMP/PjwCkfQjOoe7rUxpL13M/rw4lLSos3zkNJ1v6bMGS5Bllv
   LxRyiHDrLxPhw/k+Mxm3d+XKydvCdwOklOzkSWzyYw0WpYFeyhKGbehrj
   /hVDPrW9r4CA464UPYpWiRaoLDa/MQz6huGNoxVaYUGfCdIHrr6KhmCMK
   1g2qv23PbmGVNa0fbwx8oTbFCtB9uwDqNW0HlU4xgFKNtT3DCI+NcGdtJ
   /PExJPZpjYrW/ByoGhpkvHizsNqI/sAhKG+qd9/cS4owyCO4FrGGzqJ5z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="340943256"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="340943256"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 09:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="748823865"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="748823865"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2023 09:01:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phYFL-000Jh2-0B;
	Wed, 29 Mar 2023 16:01:59 +0000
Date: Thu, 30 Mar 2023 00:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ls-zhu:refactor 5/7] drivers/vdpa/ifcvf/ifcvf_main.c:439:24:
 warning: variable 'adapter' set but not used
Message-ID: <202303292340.yEcx9I77-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ls-zhu/linux refactor
head:   eec40a854a7617076952ac5dfc273a9f3ed10bf0
commit: e07aed8d27dc17ff4587560d7e484de57870e970 [5/7] retire ifcvf_add_status, ifcvf_start_hw and ifcvf_start_datapath
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230329/202303292340.yEcx9I77-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ls-zhu/linux/commit/e07aed8d27dc17ff4587560d7e484de57870e970
        git remote add ls-zhu https://github.com/ls-zhu/linux
        git fetch --no-tags ls-zhu refactor
        git checkout e07aed8d27dc17ff4587560d7e484de57870e970
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/vdpa/ifcvf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303292340.yEcx9I77-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vdpa/ifcvf/ifcvf_main.c:439:24: warning: variable 'adapter' set but not used [-Wunused-but-set-variable]
           struct ifcvf_adapter *adapter;
                                 ^
   1 warning generated.


vim +/adapter +439 drivers/vdpa/ifcvf/ifcvf_main.c

5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  436  
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  437  static void ifcvf_vdpa_set_status(struct vdpa_device *vdpa_dev, u8 status)
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  438  {
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26 @439  	struct ifcvf_adapter *adapter;
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  440  	struct ifcvf_hw *vf;
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  441  	u8 status_old;
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  442  	int ret;
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  443  
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  444  	vf  = vdpa_to_vf(vdpa_dev);
6b5df347c6482f drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2021-08-12  445  	adapter = vdpa_to_adapter(vdpa_dev);
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  446  	status_old = ifcvf_get_status(vf);
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  447  
bb02e6e63d0e71 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-06-05  448  	if (status_old == status)
bb02e6e63d0e71 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-06-05  449  		return;
bb02e6e63d0e71 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-06-05  450  
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  451  	if ((status & VIRTIO_CONFIG_S_DRIVER_OK) &&
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  452  	    !(status_old & VIRTIO_CONFIG_S_DRIVER_OK)) {
7cfd36b7e8be6b drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-11-25  453  		ret = ifcvf_request_irq(vf);
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  454  		if (ret) {
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  455  			status = ifcvf_get_status(vf);
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  456  			status |= VIRTIO_CONFIG_S_FAILED;
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  457  			ifcvf_set_status(vf, status);
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  458  			return;
7dd793f37e2ab4 drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2020-05-12  459  		}
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  460  	}
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  461  
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  462  	ifcvf_set_status(vf, status);
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  463  }
5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-26  464  

:::::: The code at line 439 was first introduced by commit
:::::: 5a2414bc454e89e0515b47500734a65aa40cf9fe virtio: Intel IFC VF driver for VDPA

:::::: TO: Zhu Lingshan <lingshan.zhu@intel.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
