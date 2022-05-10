Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D523A4
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 02:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652149665; x=1683685665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KM8YLnkzjHCMmkO7kc10LY5EzGN3SgpC6D2ZJXRhoqI=;
  b=mXPSYjDmgfSWIvbr9d+x50zuzvqnQMM1P/b6PTH2U97mcp1IyHru7DpN
   oMokoYM7NUTsztBbcJABJDe6PlGQhF66RqsotTBdfoofml4VlyMPdLBbm
   PIAWBBOF46VqFKW+rSHfg13PXVhOKUX7gWhHj5ebsx+BJ8iCvlSGQcK9j
   SD+oiURTlyTWnpIktN9pz8rpv0akL5igZ4cb59Q0SsBWWwCYxDamDADRN
   XdMTxkHRHT/mS5yB0iBje7Bls2vkapNZWkE2tyCB73Xn+ePGAAC5FUkp8
   t2+ublgfgfN5Wz22VMPyCCOUB3n7oNy/Rvn4Uqf5anem4J1u9MuESWGxd
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="294463774"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; 
   d="scan'208";a="294463774"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 19:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; 
   d="scan'208";a="519520329"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 May 2022 19:27:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noFat-000HBc-HP;
	Tue, 10 May 2022 02:27:23 +0000
Date: Tue, 10 May 2022 10:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10120/10218]
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3461:3: error: call to undeclared
 function 'vfree'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202205101016.RrkUuGWK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ab38272e99730375c5db3db1c4cebf691a0550ab
commit: d5a442f3ad3079cb23913c1a0cdd2ef6642145df [10120/10218] Merge branch 'drm-next' of https://gitlab.freedesktop.org/agd5f/linux
config: mips-randconfig-r015-20220509 (https://download.01.org/0day-ci/archive/20220510/202205101016.RrkUuGWK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3abb68a626160e019c30a4860e569d7bc75e486a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d5a442f3ad3079cb23913c1a0cdd2ef6642145df
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d5a442f3ad3079cb23913c1a0cdd2ef6642145df
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3461:3: error: call to undeclared function 'vfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   vfree(adev->psp.vbflash_tmp_buf);
                   ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3469:31: error: call to undeclared function 'vmalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   adev->psp.vbflash_tmp_buf = vmalloc(AMD_VBIOS_FILE_MAX_SIZE_B);
                                               ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3469:29: warning: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
                   adev->psp.vbflash_tmp_buf = vmalloc(AMD_VBIOS_FILE_MAX_SIZE_B);
                                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3516:2: error: call to undeclared function 'vfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           vfree(adev->psp.vbflash_tmp_buf);
           ^
   1 warning and 3 errors generated.


vim +/vfree +3461 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c

57430471e2fa60 Andrey Grodzovsky 2019-12-19  3447  
31aad22e2b3cfe Likun Gao         2022-02-22  3448  static ssize_t amdgpu_psp_vbflash_write(struct file *filp, struct kobject *kobj,
31aad22e2b3cfe Likun Gao         2022-02-22  3449  					struct bin_attribute *bin_attr,
31aad22e2b3cfe Likun Gao         2022-02-22  3450  					char *buffer, loff_t pos, size_t count)
31aad22e2b3cfe Likun Gao         2022-02-22  3451  {
31aad22e2b3cfe Likun Gao         2022-02-22  3452  	struct device *dev = kobj_to_dev(kobj);
31aad22e2b3cfe Likun Gao         2022-02-22  3453  	struct drm_device *ddev = dev_get_drvdata(dev);
31aad22e2b3cfe Likun Gao         2022-02-22  3454  	struct amdgpu_device *adev = drm_to_adev(ddev);
31aad22e2b3cfe Likun Gao         2022-02-22  3455  
81bd7fe019e195 Likun Gao         2022-05-05  3456  	adev->psp.vbflash_done = false;
81bd7fe019e195 Likun Gao         2022-05-05  3457  
31aad22e2b3cfe Likun Gao         2022-02-22  3458  	/* Safeguard against memory drain */
31aad22e2b3cfe Likun Gao         2022-02-22  3459  	if (adev->psp.vbflash_image_size > AMD_VBIOS_FILE_MAX_SIZE_B) {
31aad22e2b3cfe Likun Gao         2022-02-22  3460  		dev_err(adev->dev, "File size cannot exceed %u", AMD_VBIOS_FILE_MAX_SIZE_B);
31aad22e2b3cfe Likun Gao         2022-02-22 @3461  		vfree(adev->psp.vbflash_tmp_buf);
31aad22e2b3cfe Likun Gao         2022-02-22  3462  		adev->psp.vbflash_tmp_buf = NULL;
31aad22e2b3cfe Likun Gao         2022-02-22  3463  		adev->psp.vbflash_image_size = 0;
31aad22e2b3cfe Likun Gao         2022-02-22  3464  		return -ENOMEM;
31aad22e2b3cfe Likun Gao         2022-02-22  3465  	}
31aad22e2b3cfe Likun Gao         2022-02-22  3466  
31aad22e2b3cfe Likun Gao         2022-02-22  3467  	/* TODO Just allocate max for now and optimize to realloc later if needed */
31aad22e2b3cfe Likun Gao         2022-02-22  3468  	if (!adev->psp.vbflash_tmp_buf) {
31aad22e2b3cfe Likun Gao         2022-02-22 @3469  		adev->psp.vbflash_tmp_buf = vmalloc(AMD_VBIOS_FILE_MAX_SIZE_B);
31aad22e2b3cfe Likun Gao         2022-02-22  3470  		if (!adev->psp.vbflash_tmp_buf)
31aad22e2b3cfe Likun Gao         2022-02-22  3471  			return -ENOMEM;
31aad22e2b3cfe Likun Gao         2022-02-22  3472  	}
31aad22e2b3cfe Likun Gao         2022-02-22  3473  
31aad22e2b3cfe Likun Gao         2022-02-22  3474  	mutex_lock(&adev->psp.mutex);
31aad22e2b3cfe Likun Gao         2022-02-22  3475  	memcpy(adev->psp.vbflash_tmp_buf + pos, buffer, count);
31aad22e2b3cfe Likun Gao         2022-02-22  3476  	adev->psp.vbflash_image_size += count;
31aad22e2b3cfe Likun Gao         2022-02-22  3477  	mutex_unlock(&adev->psp.mutex);
31aad22e2b3cfe Likun Gao         2022-02-22  3478  
31aad22e2b3cfe Likun Gao         2022-02-22  3479  	dev_info(adev->dev, "VBIOS flash write PSP done");
31aad22e2b3cfe Likun Gao         2022-02-22  3480  
31aad22e2b3cfe Likun Gao         2022-02-22  3481  	return count;
31aad22e2b3cfe Likun Gao         2022-02-22  3482  }
31aad22e2b3cfe Likun Gao         2022-02-22  3483  

:::::: The code at line 3461 was first introduced by commit
:::::: 31aad22e2b3cfe89aef45015a9c7e4f7c0646daa drm/amdgpu/psp: Add vbflash sysfs interface support

:::::: TO: Likun Gao <Likun.Gao@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
