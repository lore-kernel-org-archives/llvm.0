Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904622C9E
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 12:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639052907; x=1670588907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VmIvICPkg/QFra6yP8xWNeBWgNZz4RKxOAtmsUA8ufY=;
  b=aM1QnC2wcflRqF2cPaxAmXm5yLxrR5IElo7x+UzX1FDS50xoi4O5cAUC
   7Y0VnWwaaGXmF7opH4+NqB/JHHL9f19+OJfKn8q+IWrxoZuz8AL0NQp5E
   Ythvh0gVzSgC55t9YX+4NgF8tR8yTBT//GKedkaPeG/LDsxnbMVM940vG
   tTXznnneAkQpYAUjv6fIftttbaBMEwkiF0smG+xSWYjK/aVNFqksdK4mW
   nsjVoandipbY1J8GnYPPhOQ3YK78XHDbiSgUVUCKxdJwvAo9h/p1GaK1O
   6knKgwGhWzVmTRRfXw4THv5L7jM94Jwp0VZdz4NlHW9qDnbJi9Hn0qnzW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298877294"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; 
   d="scan'208";a="298877294"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 04:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; 
   d="scan'208";a="503471391"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 09 Dec 2021 04:28:25 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvIXA-0001tt-MC; Thu, 09 Dec 2021 12:28:24 +0000
Date: Thu, 9 Dec 2021 20:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 13/73] sata_dwc_460ex: use generic tracepoints
Message-ID: <202112092036.fKbXi4EI-lkp@intel.com>
References: <20211208163255.114660-14-hare@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208163255.114660-14-hare@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hannes,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rostedt-trace/for-next]
[also build test WARNING on axboe-block/for-next linus/master v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hannes-Reinecke/libata-rework-logging-take-II/20211209-003634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git for-next
config: i386-randconfig-a012-20211209 (https://download.01.org/0day-ci/archive/20211209/202112092036.fKbXi4EI-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b3bb5eac4170da8a3e9c477ad4c1c8f97164abc5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hannes-Reinecke/libata-rework-logging-take-II/20211209-003634
        git checkout b3bb5eac4170da8a3e9c477ad4c1c8f97164abc5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/ata/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/ata/sata_dwc_460ex.c:744:5: error: implicit declaration of function 'get_dma_dir_descript' [-Werror,-Wimplicit-function-declaration]
                            get_dma_dir_descript(qc->dma_dir),
                            ^
>> drivers/ata/sata_dwc_460ex.c:744:5: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
                            get_dma_dir_descript(qc->dma_dir),
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                    ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning and 1 error generated.


vim +744 drivers/ata/sata_dwc_460ex.c

62936009f35a66 Rupjyoti Sarmah 2010-07-06  724  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  725  static void sata_dwc_dma_xfer_complete(struct ata_port *ap, u32 check_status)
62936009f35a66 Rupjyoti Sarmah 2010-07-06  726  {
62936009f35a66 Rupjyoti Sarmah 2010-07-06  727  	struct ata_queued_cmd *qc;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  728  	struct sata_dwc_device_port *hsdevp = HSDEVP_FROM_AP(ap);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  729  	struct sata_dwc_device *hsdev = HSDEV_FROM_AP(ap);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  730  	u8 tag = 0;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  731  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  732  	tag = ap->link.active_tag;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  733  	qc = ata_qc_from_tag(ap, tag);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  734  	if (!qc) {
62936009f35a66 Rupjyoti Sarmah 2010-07-06  735  		dev_err(ap->dev, "failed to get qc");
62936009f35a66 Rupjyoti Sarmah 2010-07-06  736  		return;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  737  	}
62936009f35a66 Rupjyoti Sarmah 2010-07-06  738  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  739  #ifdef DEBUG_NCQ
62936009f35a66 Rupjyoti Sarmah 2010-07-06  740  	if (tag > 0) {
d578514b271e7c Andy Shevchenko 2015-03-03  741  		dev_info(ap->dev,
d578514b271e7c Andy Shevchenko 2015-03-03  742  			 "%s tag=%u cmd=0x%02x dma dir=%s proto=%s dmacr=0x%08x\n",
4e5b6260cc9ba8 Jens Axboe      2018-05-11  743  			 __func__, qc->hw_tag, qc->tf.command,
84b47e3b16f8a5 Sergei Shtylyov 2011-01-28 @744  			 get_dma_dir_descript(qc->dma_dir),
84b47e3b16f8a5 Sergei Shtylyov 2011-01-28  745  			 get_prot_descript(qc->tf.protocol),
ee81d6cc8e8aa6 Mans Rullgard   2016-04-26  746  			 sata_dwc_readl(&hsdev->sata_dwc_regs->dmacr));
62936009f35a66 Rupjyoti Sarmah 2010-07-06  747  	}
62936009f35a66 Rupjyoti Sarmah 2010-07-06  748  #endif
62936009f35a66 Rupjyoti Sarmah 2010-07-06  749  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  750  	if (ata_is_dma(qc->tf.protocol)) {
62936009f35a66 Rupjyoti Sarmah 2010-07-06  751  		if (hsdevp->dma_pending[tag] == SATA_DWC_DMA_PENDING_NONE) {
d578514b271e7c Andy Shevchenko 2015-03-03  752  			dev_err(ap->dev,
d578514b271e7c Andy Shevchenko 2015-03-03  753  				"%s DMA protocol RX and TX DMA not pending dmacr: 0x%08x\n",
d578514b271e7c Andy Shevchenko 2015-03-03  754  				__func__,
ee81d6cc8e8aa6 Mans Rullgard   2016-04-26  755  				sata_dwc_readl(&hsdev->sata_dwc_regs->dmacr));
62936009f35a66 Rupjyoti Sarmah 2010-07-06  756  		}
62936009f35a66 Rupjyoti Sarmah 2010-07-06  757  
62936009f35a66 Rupjyoti Sarmah 2010-07-06  758  		hsdevp->dma_pending[tag] = SATA_DWC_DMA_PENDING_NONE;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  759  		sata_dwc_qc_complete(ap, qc, check_status);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  760  		ap->link.active_tag = ATA_TAG_POISON;
62936009f35a66 Rupjyoti Sarmah 2010-07-06  761  	} else {
62936009f35a66 Rupjyoti Sarmah 2010-07-06  762  		sata_dwc_qc_complete(ap, qc, check_status);
62936009f35a66 Rupjyoti Sarmah 2010-07-06  763  	}
62936009f35a66 Rupjyoti Sarmah 2010-07-06  764  }
62936009f35a66 Rupjyoti Sarmah 2010-07-06  765  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
