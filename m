Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3E3181
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 06:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660286376; x=1691822376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UG5gNWHoSyOb7+iWS4sLh7rYt1PWINaomN54ut/va/w=;
  b=DMJyCDI+7aXgFiasL/WWYGMf0a7z+1a5TWbjBdcRnsQPrtgfCfnr6w1u
   LtfPlV+W/EHvxYcM5JgiDy+zdTQ9LC2rlRk901c0n6bRU3uw3WcM5sFTc
   dCkhGoVpQTGydPe2Kv5x7GWlJA5z1Ytz1tpSxqkkFyVwISyJieKj4+pAe
   wvA6h0dOQe2cHveaKBYqCJ/KP60PomM9uOTXZjxMblZf9kXIGlgwS2+Ut
   TDW3FLwIMulNgbP7UCn/BHjkWKLVMtOgT3gi8eSDg/Sfp8B/drKzS/kVq
   OMihFTCOclJd4H9012xE0NKxMh1RjyBjx1yjHKpHWd4Z+xYfyVxNzEvhd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="271918960"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="271918960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2022 23:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="748099829"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2022 23:39:34 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMOKU-0000Fe-16;
	Fri, 12 Aug 2022 06:39:34 +0000
Date: Fri, 12 Aug 2022 14:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Can Guo <quic_cang@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2 1/2] scsi: ufs: Add Multi-Circular Queue support
Message-ID: <202208121414.5E6v9hTz-lkp@intel.com>
References: <1660213984-37793-2-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1660213984-37793-2-git-send-email-quic_cang@quicinc.com>

Hi Can,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mkp-scsi/for-next]
[cannot apply to jejb-scsi/for-next linus/master v5.19 next-20220812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Can-Guo/UFS-Multi-Circular-Queue-MCQ/20220811-183747
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
config: hexagon-randconfig-r041-20220811 (https://download.01.org/0day-ci/archive/20220812/202208121414.5E6v9hTz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e5504cb5816e9118b2e7d7720919bb3cb61c34da
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Can-Guo/UFS-Multi-Circular-Queue-MCQ/20220811-183747
        git checkout e5504cb5816e9118b2e7d7720919bb3cb61c34da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/ufs/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/ufs/core/ufshcd.c:5464:13: warning: no previous prototype for function 'ufshcd_transfer_req_compl' [-Wmissing-prototypes]
   irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
               ^
   drivers/ufs/core/ufshcd.c:5464:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
   ^
   static 
   1 warning generated.
--
>> drivers/ufs/core/ufs-mcq.c:252:33: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
                           dev_err(hba->dev, "Resource %s not provided\n");
                                                       ~^
   include/linux/dev_printk.h:144:57: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
   #define dev_fmt(fmt) fmt
                        ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ^~~
>> drivers/ufs/core/ufs-mcq.c:265:18: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
                                            res->name, PTR_ERR(res->base));
                                                       ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/ufs/core/ufs-mcq.c:301:4: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
                           PTR_ERR(res->base));
                           ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
>> drivers/ufs/core/ufs-mcq.c:481:3: error: call to undeclared function 'sizeof_utp_transfer_cmd_desc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   sizeof_utp_transfer_cmd_desc(hba);
                   ^
   3 warnings and 1 error generated.


vim +/sizeof_utp_transfer_cmd_desc +481 drivers/ufs/core/ufs-mcq.c

   470	
   471	static inline int ufshcd_mcq_get_tag(struct ufs_hba *hba,
   472					     struct ufs_hw_queue *hwq,
   473					     struct cq_entry *cqe)
   474	{
   475		dma_addr_t dma_addr;
   476	
   477		dma_addr = ((u64)le32_to_cpu(cqe->command_desc_base_addr_hi) << 32) |
   478			   (le32_to_cpu(cqe->command_desc_base_addr_lo) & 0xffffff80);
   479	
   480		return (dma_addr - hba->ucdl_dma_addr) /
 > 481			sizeof_utp_transfer_cmd_desc(hba);
   482	}
   483	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
