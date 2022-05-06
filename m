Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD387811
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651842517; x=1683378517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QSKIY9jv5XBTS8ipMKKAVANdapr0MkQGNVaBRAzZZJc=;
  b=ZhyTAg9KuMq1YIF84j3LpxDkGHAlP/RQPQGGZmZslnPkbgf44MwnHzdt
   G9K0T/QBUASBX5UU6OfUfcaSefPGysmgJsUwn7rhpXKLanP2mHciQiutN
   4Dha32ntoC0d1guMx64tcEoNfbha3X8k+AkwPmWZMtLCL/CVMjgpFOJwz
   RXnvyoWc2MNsyTQQGOwAPa7qegFLF5odOrGeRoA4amuqSgFHRq9WBsfp9
   zU/bcGK1ism8CyTljTyrBpsSgN7qR5noPrhvM3W/dtx8UmXXGel0+BHvw
   hKuKuRJ/mb3+kC3OfXBGdWFpaQevkFoMdb1/EBgs+c9aNR0SKQ4xFEiPQ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268605517"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="268605517"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 06:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="654695553"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 May 2022 06:08:29 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmxh6-000DUe-Gy;
	Fri, 06 May 2022 13:08:28 +0000
Date: Fri, 6 May 2022 21:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Xiao <Jack.Xiao@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 8865/9759]
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:131:40: warning: format specifies
 type 'long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202205062149.A4sTXbos-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 32de57e9ef59b6f646849a8bd615b7c978a4fa6d [8865/9759] drm/amdgpu/mes: manage mes doorbell allocation
config: arm-randconfig-r005-20220506 (https://download.01.org/0day-ci/archive/20220506/202205062149.A4sTXbos-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=32de57e9ef59b6f646849a8bd615b7c978a4fa6d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 32de57e9ef59b6f646849a8bd615b7c978a4fa6d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:131:40: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
           DRM_INFO("max_doorbell_slices=%ld\n", doorbell_process_limit);
                                         ~~~     ^~~~~~~~~~~~~~~~~~~~~~
                                         %u
   include/drm/drm_print.h:498:29: note: expanded from macro 'DRM_INFO'
           _DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
                               ~~~    ^~~~~~~~~~~
   include/drm/drm_print.h:494:53: note: expanded from macro '_DRM_PRINTK'
           printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:39:12: warning: unused function 'amdgpu_mes_alloc_process_doorbells' [-Wunused-function]
   static int amdgpu_mes_alloc_process_doorbells(struct amdgpu_device *adev,
              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:51:13: warning: unused function 'amdgpu_mes_free_process_doorbells' [-Wunused-function]
   static void amdgpu_mes_free_process_doorbells(struct amdgpu_device *adev,
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:59:12: warning: unused function 'amdgpu_mes_queue_doorbell_get' [-Wunused-function]
   static int amdgpu_mes_queue_doorbell_get(struct amdgpu_device *adev,
              ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:90:13: warning: unused function 'amdgpu_mes_queue_doorbell_free' [-Wunused-function]
   static void amdgpu_mes_queue_doorbell_free(struct amdgpu_device *adev,
               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:105:12: warning: unused function 'amdgpu_mes_doorbell_init' [-Wunused-function]
   static int amdgpu_mes_doorbell_init(struct amdgpu_device *adev)
              ^
   6 warnings generated.


vim +131 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c

   104	
   105	static int amdgpu_mes_doorbell_init(struct amdgpu_device *adev)
   106	{
   107		size_t doorbell_start_offset;
   108		size_t doorbell_aperture_size;
   109		size_t doorbell_process_limit;
   110	
   111		doorbell_start_offset = (adev->doorbell_index.max_assignment+1) * sizeof(u32);
   112		doorbell_start_offset =
   113			roundup(doorbell_start_offset,
   114				amdgpu_mes_doorbell_process_slice(adev));
   115	
   116		doorbell_aperture_size = adev->doorbell.size;
   117		doorbell_aperture_size =
   118				rounddown(doorbell_aperture_size,
   119					  amdgpu_mes_doorbell_process_slice(adev));
   120	
   121		if (doorbell_aperture_size > doorbell_start_offset)
   122			doorbell_process_limit =
   123				(doorbell_aperture_size - doorbell_start_offset) /
   124				amdgpu_mes_doorbell_process_slice(adev);
   125		else
   126			return -ENOSPC;
   127	
   128		adev->mes.doorbell_id_offset = doorbell_start_offset / sizeof(u32);
   129		adev->mes.max_doorbell_slices = doorbell_process_limit;
   130	
 > 131		DRM_INFO("max_doorbell_slices=%ld\n", doorbell_process_limit);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
