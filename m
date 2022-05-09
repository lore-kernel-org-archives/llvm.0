Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FFE320C
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652137204; x=1683673204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wb4kQzIr687GOHBkN/UzAQ1V5VME/8twWG/lEtQPEnw=;
  b=AtXKLnARHJahGmL94Fwdz1B2qzTR1+O/lVFkmRXVGIFMXnaZvWAEcn47
   /wYOPUiD6/H3p6BY7usX0guv6L5Q0jbVdEf33OpbbcAru8F4lxX49yDQ4
   NG/kGImAft4uJjO5J+MFkSU2fGO2dHgkUtiAjc5BfI1v0HS/IWnfaoF+c
   g7dYhVyBOqj3ykcneftACYUmLrfy8VW9SW072owYageS138kb8aOA7nGL
   k0fi8MY4FXDUvq/dYNHGozhuW09w5CZjctI11JdsHwL6VUCxcPV8cZdpR
   NOx0Z7MvP9t5dulVteQT1ENuryWcz6NOttmR0HxeNMWTWXXWSu/9etuI2
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="294419577"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="294419577"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 16:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="696794373"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 May 2022 16:00:00 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noCMC-000Gz4-1D;
	Mon, 09 May 2022 23:00:00 +0000
Date: Tue, 10 May 2022 06:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 9592/10218]
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3467:29: warning: incompatible
 integer to pointer conversion assigning to 'char *' from 'int'
Message-ID: <202205100612.ZAcTYE6P-lkp@intel.com>
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
commit: 31aad22e2b3cfe89aef45015a9c7e4f7c0646daa [9592/10218] drm/amdgpu/psp: Add vbflash sysfs interface support
config: mips-randconfig-r015-20220509 (https://download.01.org/0day-ci/archive/20220510/202205100612.ZAcTYE6P-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3abb68a626160e019c30a4860e569d7bc75e486a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=31aad22e2b3cfe89aef45015a9c7e4f7c0646daa
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 31aad22e2b3cfe89aef45015a9c7e4f7c0646daa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3459:3: error: implicit declaration of function 'vfree' [-Werror,-Wimplicit-function-declaration]
                   vfree(adev->psp.vbflash_tmp_buf);
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3467:31: error: implicit declaration of function 'vmalloc' [-Werror,-Wimplicit-function-declaration]
                   adev->psp.vbflash_tmp_buf = vmalloc(AMD_VBIOS_FILE_MAX_SIZE_B);
                                               ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3467:29: warning: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
                   adev->psp.vbflash_tmp_buf = vmalloc(AMD_VBIOS_FILE_MAX_SIZE_B);
                                             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:3514:2: error: implicit declaration of function 'vfree' [-Werror,-Wimplicit-function-declaration]
           vfree(adev->psp.vbflash_tmp_buf);
           ^
   1 warning and 3 errors generated.


vim +3467 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c

  3447	
  3448	static ssize_t amdgpu_psp_vbflash_write(struct file *filp, struct kobject *kobj,
  3449						struct bin_attribute *bin_attr,
  3450						char *buffer, loff_t pos, size_t count)
  3451	{
  3452		struct device *dev = kobj_to_dev(kobj);
  3453		struct drm_device *ddev = dev_get_drvdata(dev);
  3454		struct amdgpu_device *adev = drm_to_adev(ddev);
  3455	
  3456		/* Safeguard against memory drain */
  3457		if (adev->psp.vbflash_image_size > AMD_VBIOS_FILE_MAX_SIZE_B) {
  3458			dev_err(adev->dev, "File size cannot exceed %u", AMD_VBIOS_FILE_MAX_SIZE_B);
  3459			vfree(adev->psp.vbflash_tmp_buf);
  3460			adev->psp.vbflash_tmp_buf = NULL;
  3461			adev->psp.vbflash_image_size = 0;
  3462			return -ENOMEM;
  3463		}
  3464	
  3465		/* TODO Just allocate max for now and optimize to realloc later if needed */
  3466		if (!adev->psp.vbflash_tmp_buf) {
> 3467			adev->psp.vbflash_tmp_buf = vmalloc(AMD_VBIOS_FILE_MAX_SIZE_B);
  3468			if (!adev->psp.vbflash_tmp_buf)
  3469				return -ENOMEM;
  3470		}
  3471	
  3472		mutex_lock(&adev->psp.mutex);
  3473		memcpy(adev->psp.vbflash_tmp_buf + pos, buffer, count);
  3474		adev->psp.vbflash_image_size += count;
  3475		mutex_unlock(&adev->psp.mutex);
  3476	
  3477		dev_info(adev->dev, "VBIOS flash write PSP done");
  3478	
  3479		return count;
  3480	}
  3481	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
