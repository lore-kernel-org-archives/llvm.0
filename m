Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783315B7;
	Thu, 23 Feb 2023 01:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677115302; x=1708651302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=smk/IMr8tNuouT5RUgUfentVm9pFSJdZDRlFuo7i/I4=;
  b=LcjkEO/EGCSlRcu25KpqL+Sncl7MmKkkoxJSRl1Dht5qeyRyvJDmuhhf
   tCY57+R3nNdgEUWpzGcwM2U6axm2RExYoU31EX4nVBmsT9l+ynzGzR2Pu
   JL18/PTCXpvD2LlckGNPR0I98Zeq4w+ls0VxY4875KSWB+JnU7wJzgZn1
   gNQ8KLuKOQK8gOMF6w2Ou0cKd4cXqFh4pwY2MkuGLipPxeobZqyZYFwDa
   MJ+kucgitV+vAhXasmjqMKXSjWthRttpGQpiJqcik9F/gziFPHH6Zv0o2
   RCl4y9GthaAqrvE2ibKeaJ835tWtzukBNQ3XYUDoB0UYqrx6SPW0KZixI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="312712241"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="312712241"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 17:21:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="674320414"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="674320414"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2023 17:21:40 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pV0Il-0000sT-2C;
	Thu, 23 Feb 2023 01:21:39 +0000
Date: Thu, 23 Feb 2023 09:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 1/4] bpf: add UBLK program type
Message-ID: <202302230957.cU6XDCTE-lkp@intel.com>
References: <20230222132534.114574-2-xiaoguang.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222132534.114574-2-xiaoguang.wang@linux.alibaba.com>

Hi Xiaoguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on v6.2]
[cannot apply to bpf-next/master bpf/master axboe-block/for-next linus/master next-20230222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoguang-Wang/bpf-add-UBLK-program-type/20230222-235148
patch link:    https://lore.kernel.org/r/20230222132534.114574-2-xiaoguang.wang%40linux.alibaba.com
patch subject: [RFC v2 1/4] bpf: add UBLK program type
config: s390-randconfig-r024-20230222 (https://download.01.org/0day-ci/archive/20230223/202302230957.cU6XDCTE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/29aa0e051b8dc06ecf3f2bf3ebd4131552988a7a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230222-235148
        git checkout 29aa0e051b8dc06ecf3f2bf3ebd4131552988a7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230957.cU6XDCTE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390x-linux-ld: kernel/bpf/syscall.o:(.data.rel.ro+0x9c0): undefined reference to `bpf_ublk_prog_ops'
>> s390x-linux-ld: kernel/bpf/verifier.o:(.data.rel.ro+0x160): undefined reference to `bpf_ublk_verifier_ops'
   s390x-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x28): undefined reference to `of_iomap'
   s390x-linux-ld: irq-al-fic.c:(.init.text+0x4a2): undefined reference to `iounmap'
   s390x-linux-ld: drivers/dma/fsl-edma.o: in function `fsl_edma_probe':
   fsl-edma.c:(.text+0x21e): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: fsl-edma.c:(.text+0x376): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x80): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: hidma.c:(.text+0xd2): undefined reference to `devm_ioremap_resource'
   s390x-linux-ld: drivers/char/xillybus/xillybus_of.o: in function `xilly_drv_probe':
   xillybus_of.c:(.text+0x66): undefined reference to `devm_platform_ioremap_resource'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
