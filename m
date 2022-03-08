Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAD62F2F
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 19:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646766878; x=1678302878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XupZY0ctmoqbWeyF5nb0819GMcKNc6ykGiEalSCRq0E=;
  b=M9RkMBkxvz6EHnvYKukfZbrYLfaD5c8VP+Qlp4s6VH3lu9si1u2k9vte
   t9VXSXvdMqhZke3tBDkYkBdblcKjkTCHNo48aPWhjPCZmZsrBRVy+EjnB
   xonPM7AMrbXs3+XlcAIRgX5lSW7+3u2yNNvV1QyYuKBdRkYCDF9VGvuoR
   3XjPsM+qk1toFIA7LHTP7O9hQBOw4M/iFMzkrK84YMo8dvUDBQ9QxYbPl
   3cXl1bHOlwhwD4O5tjzmc4fA4tUDJGUVTL0+Ll2im5RXzUmRoZGfQvWga
   6tGXZZDPh3HtL5KKbwgdaMUwUWSZQjNyyyFspOkLL9YrtHU3oXifnP9Oo
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="253619071"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="253619071"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 11:14:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="495570747"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2022 11:14:36 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRfI3-0001rC-I9; Tue, 08 Mar 2022 19:14:35 +0000
Date: Wed, 9 Mar 2022 03:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yifan Zhang <yifan1.zhang@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 10184/11353]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:6:
 warning: variable 'vmid' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202203090313.LRIlHhjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: c8b0507f40deea3d5014b5b4989b6a06ffedde70 [10184/11353] drm/amdkfd: judge get_atc_vmid_pasid_mapping_info before call
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220309/202203090313.LRIlHhjL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c8b0507f40deea3d5014b5b4989b6a06ffedde70
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c8b0507f40deea3d5014b5b4989b6a06ffedde70
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:6: warning: variable 'vmid' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:521:6: note: uninitialized use occurs here
           if (vmid > last_vmid_to_scan) {
               ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:508:2: note: remove the 'if' if its condition is always true
           if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:490:19: note: initialize the variable 'vmid' to silence this warning
           unsigned int vmid;
                            ^
                             = 0
   1 warning generated.


vim +508 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c

   486	
   487	static int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process *p)
   488	{
   489		int status = 0;
   490		unsigned int vmid;
   491		uint16_t queried_pasid;
   492		union SQ_CMD_BITS reg_sq_cmd;
   493		union GRBM_GFX_INDEX_BITS reg_gfx_index;
   494		struct kfd_process_device *pdd;
   495		int first_vmid_to_scan = dev->vm_info.first_vmid_kfd;
   496		int last_vmid_to_scan = dev->vm_info.last_vmid_kfd;
   497	
   498		reg_sq_cmd.u32All = 0;
   499		reg_gfx_index.u32All = 0;
   500	
   501		pr_debug("Killing all process wavefronts\n");
   502	
   503		/* Scan all registers in the range ATC_VMID8_PASID_MAPPING ..
   504		 * ATC_VMID15_PASID_MAPPING
   505		 * to check which VMID the current process is mapped to.
   506		 */
   507	
 > 508		if (dev->kfd2kgd->get_atc_vmid_pasid_mapping_info) {
   509			for (vmid = first_vmid_to_scan; vmid <= last_vmid_to_scan; vmid++) {
   510				status = dev->kfd2kgd->get_atc_vmid_pasid_mapping_info
   511						(dev->adev, vmid, &queried_pasid);
   512	
   513				if (status && queried_pasid == p->pasid) {
   514					pr_debug("Killing wave fronts of vmid %d and pasid 0x%x\n",
   515							vmid, p->pasid);
   516					break;
   517				}
   518			}
   519		}
   520	
   521		if (vmid > last_vmid_to_scan) {
   522			pr_err("Didn't find vmid for pasid 0x%x\n", p->pasid);
   523			return -EFAULT;
   524		}
   525	
   526		/* taking the VMID for that process on the safe way using PDD */
   527		pdd = kfd_get_process_device_data(dev, p);
   528		if (!pdd)
   529			return -EFAULT;
   530	
   531		reg_gfx_index.bits.sh_broadcast_writes = 1;
   532		reg_gfx_index.bits.se_broadcast_writes = 1;
   533		reg_gfx_index.bits.instance_broadcast_writes = 1;
   534		reg_sq_cmd.bits.mode = SQ_IND_CMD_MODE_BROADCAST;
   535		reg_sq_cmd.bits.cmd = SQ_IND_CMD_CMD_KILL;
   536		reg_sq_cmd.bits.vm_id = vmid;
   537	
   538		dev->kfd2kgd->wave_control_execute(dev->adev,
   539						reg_gfx_index.u32All,
   540						reg_sq_cmd.u32All);
   541	
   542		return 0;
   543	}
   544	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
