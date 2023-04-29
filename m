Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D615C17CB;
	Sat, 29 Apr 2023 12:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682769788; x=1714305788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vsm91jPuM+cjA0X+KLx7WutjysXtOsLy+PPNYDN0WZM=;
  b=WPlXI8cA0iYXVJU6Ct2ldKSru9mGUBvFF0TCRig0TquNd3aHjf9Jo7v1
   NOtW9FtKm/onTi//412Y3ZLTBgN1xS7eA8uQ0OlbbDXdCIm6A+2en1eIT
   T2qtnftehj5KjLFDcADSo45Ksv7tEcNXSQ4CQG4mhioiJvMWFvakKn2fj
   fYIhB0EZc0NjUe2h3i2YImbSDF9nnmIevIH0DEpjcgQAxhYPcMijr/Smm
   idka0Q4snw/JNqoiHqWzD1ot4DiJcNJwEWjytJopDcXbK1+nhgwJPfTHT
   3Ps8B7wqcGVmEsg12GJ2Bid8cxouauv5Oh5JMRTqXQDfZ8YIKMmAdnY8O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346717286"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="346717286"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="727910739"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="727910739"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Apr 2023 05:03:07 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psjI5-00017D-1T;
	Sat, 29 Apr 2023 12:03:01 +0000
Date: Sat, 29 Apr 2023 20:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 05/12] nvme: wire-up register/unregister queue f_op
 callback
Message-ID: <202304291923.9c6BwInk-lkp@intel.com>
References: <20230429093925.133327-6-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429093925.133327-6-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master next-20230428]
[cannot apply to hch-configfs/for-next v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230429093925.133327-6-joshi.k%40samsung.com
patch subject: [RFC PATCH 05/12] nvme: wire-up register/unregister queue f_op callback
config: hexagon-randconfig-r012-20230429 (https://download.01.org/0day-ci/archive/20230429/202304291923.9c6BwInk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fb2d573b75b3615d774f841c417790d368b70ccd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout fb2d573b75b3615d774f841c417790d368b70ccd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291923.9c6BwInk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/core.c:7:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/nvme/host/core.c:7:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/nvme/host/core.c:7:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   drivers/nvme/host/core.c:4069:30: error: no member named 'register_queue' in 'struct blk_mq_ops'
           if (q->mq_ops && q->mq_ops->register_queue)
                            ~~~~~~~~~  ^
   drivers/nvme/host/core.c:4070:21: error: no member named 'register_queue' in 'struct blk_mq_ops'
                   return q->mq_ops->register_queue(ns);
                          ~~~~~~~~~  ^
>> drivers/nvme/host/core.c:4062:5: warning: no previous prototype for function 'nvme_register_queue' [-Wmissing-prototypes]
   int nvme_register_queue(struct file *file)
       ^
   drivers/nvme/host/core.c:4062:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nvme_register_queue(struct file *file)
   ^
   static 
   drivers/nvme/host/core.c:4081:30: error: no member named 'unregister_queue' in 'struct blk_mq_ops'
           if (q->mq_ops && q->mq_ops->unregister_queue)
                            ~~~~~~~~~  ^
   drivers/nvme/host/core.c:4082:21: error: no member named 'unregister_queue' in 'struct blk_mq_ops'
                   return q->mq_ops->unregister_queue(ns, qid);
                          ~~~~~~~~~  ^
>> drivers/nvme/host/core.c:4074:5: warning: no previous prototype for function 'nvme_unregister_queue' [-Wmissing-prototypes]
   int nvme_unregister_queue(struct file *file, int qid)
       ^
   drivers/nvme/host/core.c:4074:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nvme_unregister_queue(struct file *file, int qid)
   ^
   static 
   8 warnings and 4 errors generated.


vim +/nvme_register_queue +4062 drivers/nvme/host/core.c

  4061	
> 4062	int nvme_register_queue(struct file *file)
  4063	{
  4064		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  4065				struct nvme_ns, cdev);
  4066		struct nvme_ctrl *ctrl = ns->ctrl;
  4067		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  4068	
> 4069		if (q->mq_ops && q->mq_ops->register_queue)
  4070			return q->mq_ops->register_queue(ns);
  4071		return -EINVAL;
  4072	}
  4073	
> 4074	int nvme_unregister_queue(struct file *file, int qid)
  4075	{
  4076		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  4077				struct nvme_ns, cdev);
  4078		struct nvme_ctrl *ctrl = ns->ctrl;
  4079		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  4080	
> 4081		if (q->mq_ops && q->mq_ops->unregister_queue)
  4082			return q->mq_ops->unregister_queue(ns, qid);
  4083		return -EINVAL;
  4084	}
  4085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
