Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504A137F
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648832848; x=1680368848;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X9pZUBJSvbFzmKurm5Z+IihTAQDm6O0pF0BrGUtyqiA=;
  b=myzMrroX2r7d3mI2KmHzZtKh9tqtktq0xzZNu9sKfBniPdAsDhOOSjeJ
   k+5+5eCfWr3ONIwGs+qguSPBSQMZFQzNIxWtrX5wec5YhOOecPdKy8dVD
   lykdY0/gsrykk/o7hV+Y8agI9hX8dBF5r4eMjtdMm+xSwVDZOxQCVZ7oa
   N9n/kfrYbSjYIL4ZgjXyZkIVF/pI9nOQ+iGkhD1DMJyfpOFPQ78H7RGMX
   Ca7SWUKlwygFrBEhP1yXOKklV0HS3g7OpPT8Zt6D24fRvXq7WzdUDmRau
   iaAfkTWKL9w1k26ZngJ1HtEzslH2rS6mf7zehmIkMU1pvtBJ1ZsnU661y
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="259889296"
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="259889296"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2022 10:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,228,1643702400"; 
   d="scan'208";a="522846177"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Apr 2022 10:07:25 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1naKk9-0001Ou-1R;
	Fri, 01 Apr 2022 17:07:25 +0000
Date: Sat, 2 Apr 2022 01:07:00 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	=?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: [drm-tip:drm-tip 4/8]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:33: error: no member named
 'tbo' in 'struct ttm_range_mgr_node'
Message-ID: <202204020126.nuHKg49N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   e797b8d09704b91463456234efdf04dc8f8c385d
commit: edc1a46d62b7a03d53067f598db831092f9e1b05 [4/8] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: arm-randconfig-r033-20220401 (https://download.01.org/0day-ci/archive/20220402/202204020126.nuHKg49N-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project cc2e2b80a1f36a28fa7c96c38c2674b10868f09f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout edc1a46d62b7a03d53067f598db831092f9e1b05
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:200:33: error: no member named 'tbo' in 'struct ttm_range_mgr_node'
                   amdgpu_ttm_recover_gart(node->tbo);
                                           ~~~~  ^
   1 error generated.


vim +200 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c

bb990bb09235a3 Christian König 2016-09-09  182  
a614b336f1c16d Christian König 2021-02-11  183  /**
a614b336f1c16d Christian König 2021-02-11  184   * amdgpu_gtt_mgr_recover - re-init gart
a614b336f1c16d Christian König 2021-02-11  185   *
1dd8b1b987fad9 Nirmoy Das      2022-01-07  186   * @mgr: amdgpu_gtt_mgr pointer
a614b336f1c16d Christian König 2021-02-11  187   *
a614b336f1c16d Christian König 2021-02-11  188   * Re-init the gart for each known BO in the GTT.
a614b336f1c16d Christian König 2021-02-11  189   */
1b08dfb889b2c5 Christian König 2022-01-18  190  void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
c1c7ce8f5687bb Christian König 2017-10-16  191  {
77ef271faee9c3 Christian König 2021-07-16  192  	struct ttm_range_mgr_node *node;
c1c7ce8f5687bb Christian König 2017-10-16  193  	struct drm_mm_node *mm_node;
1dd8b1b987fad9 Nirmoy Das      2022-01-07  194  	struct amdgpu_device *adev;
c1c7ce8f5687bb Christian König 2017-10-16  195  
19a1d9350be632 Nirmoy Das      2021-05-28  196  	adev = container_of(mgr, typeof(*adev), mman.gtt_mgr);
c1c7ce8f5687bb Christian König 2017-10-16  197  	spin_lock(&mgr->lock);
c1c7ce8f5687bb Christian König 2017-10-16  198  	drm_mm_for_each_node(mm_node, &mgr->mm) {
77ef271faee9c3 Christian König 2021-07-16  199  		node = container_of(mm_node, typeof(*node), mm_nodes[0]);
1b08dfb889b2c5 Christian König 2022-01-18 @200  		amdgpu_ttm_recover_gart(node->tbo);
c1c7ce8f5687bb Christian König 2017-10-16  201  	}
c1c7ce8f5687bb Christian König 2017-10-16  202  	spin_unlock(&mgr->lock);
c1c7ce8f5687bb Christian König 2017-10-16  203  
19a1d9350be632 Nirmoy Das      2021-05-28  204  	amdgpu_gart_invalidate_tlb(adev);
c1c7ce8f5687bb Christian König 2017-10-16  205  }
c1c7ce8f5687bb Christian König 2017-10-16  206  

:::::: The code at line 200 was first introduced by commit
:::::: 1b08dfb889b2c584b444538c9500af24ba0a6dc7 drm/amdgpu: remove gart.ready flag

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
