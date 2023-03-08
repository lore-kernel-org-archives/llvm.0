Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1B6AB6;
	Wed,  8 Mar 2023 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678281528; x=1709817528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zCpvSVcxYUVkNs7AHqxMx28ifWCTyYoFVEoi4GlhbY=;
  b=ctK8uooOdqRkbsqVnqRtBc2MSdhprdQrdi8kwrQiv7yu31qbmzodLuXS
   L8ZOt741OCX+lPI8nxxqBTPfR6Jw4E/X8Y7z/0dlVV+4I17Kl7vbW7bLV
   vc+h9hTCQO2BE6rYRNzN4e/zZS3UbtSA8EatF9QZrXIVe+D7j5W//U0tK
   0KvwW4xpxrQpbUnGeFeCL4jJpzSUaCpB2rThSfD6DpP56lwnNRunlgJK3
   9RPbtIYA13T/5baIRUil7/aRXqJDFTF1IPRL8QY7vrC1agtHE9ip4ly/J
   7FnNhYR69e+Bcqxki3+t4l8WvpTviCJZwh02oxhq63Qq+dOn226g4kt/x
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315808226"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="315808226"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 05:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626916511"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="626916511"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 05:18:46 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZtgr-000295-1C;
	Wed, 08 Mar 2023 13:18:45 +0000
Date: Wed, 8 Mar 2023 21:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/8] platform/x86: ISST: Enumerate TPMI SST and create
 framework
Message-ID: <202303082101.fF7OWAtH-lkp@intel.com>
References: <20230308070642.1727167-3-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308070642.1727167-3-srinivas.pandruvada@linux.intel.com>

Hi Srinivas,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc1 next-20230308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Pandruvada/platform-x86-ISST-Add-support-for-MSR-0x54/20230308-150906
patch link:    https://lore.kernel.org/r/20230308070642.1727167-3-srinivas.pandruvada%40linux.intel.com
patch subject: [PATCH v2 2/8] platform/x86: ISST: Enumerate TPMI SST and create framework
config: x86_64-randconfig-a016-20230306 (https://download.01.org/0day-ci/archive/20230308/202303082101.fF7OWAtH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2e4ff37ca5561b5d2ff368395f8d5d043a684ca5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Srinivas-Pandruvada/platform-x86-ISST-Add-support-for-MSR-0x54/20230308-150906
        git checkout 2e4ff37ca5561b5d2ff368395f8d5d043a684ca5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082101.fF7OWAtH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:245:5: error: no member named 'api_version' in 'struct isst_if_cmd_cb'
           cb.api_version = ISST_TPMI_API_VERSION;
           ~~ ^
>> drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:246:5: error: no member named 'def_ioctl' in 'struct isst_if_cmd_cb'
           cb.def_ioctl = isst_if_def_ioctl;
           ~~ ^
>> drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:248:30: error: use of undeclared identifier 'ISST_IF_DEV_TPMI'
           ret = isst_if_cdev_register(ISST_IF_DEV_TPMI, &cb);
                                       ^
   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:264:27: error: use of undeclared identifier 'ISST_IF_DEV_TPMI'
                   isst_if_cdev_unregister(ISST_IF_DEV_TPMI);
                                           ^
   4 errors generated.


vim +245 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

   222	
   223	int tpmi_sst_init(void)
   224	{
   225		struct isst_if_cmd_cb cb;
   226		int ret = 0;
   227	
   228		mutex_lock(&isst_tpmi_dev_lock);
   229	
   230		if (isst_core_usage_count) {
   231			++isst_core_usage_count;
   232			goto init_done;
   233		}
   234	
   235		isst_common.sst_inst = kcalloc(topology_max_packages(),
   236					       sizeof(*isst_common.sst_inst),
   237					       GFP_KERNEL);
   238		if (!isst_common.sst_inst)
   239			return -ENOMEM;
   240	
   241		memset(&cb, 0, sizeof(cb));
   242		cb.cmd_size = sizeof(struct isst_if_io_reg);
   243		cb.offset = offsetof(struct isst_if_io_regs, io_reg);
   244		cb.cmd_callback = NULL;
 > 245		cb.api_version = ISST_TPMI_API_VERSION;
 > 246		cb.def_ioctl = isst_if_def_ioctl;
   247		cb.owner = THIS_MODULE;
 > 248		ret = isst_if_cdev_register(ISST_IF_DEV_TPMI, &cb);
   249		if (ret)
   250			kfree(isst_common.sst_inst);
   251	init_done:
   252		mutex_unlock(&isst_tpmi_dev_lock);
   253		return ret;
   254	}
   255	EXPORT_SYMBOL_NS_GPL(tpmi_sst_init, INTEL_TPMI_SST);
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
