Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E582CA6
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 22:22:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="237770046"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="237770046"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 14:22:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="480086624"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Dec 2021 14:21:59 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mv5K2-00018C-IW; Wed, 08 Dec 2021 22:21:58 +0000
Date: Thu, 9 Dec 2021 06:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 02/73] libata: Add ata_port_classify() helper
Message-ID: <202112090643.h0EhSayB-lkp@intel.com>
References: <20211208163255.114660-3-hare@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208163255.114660-3-hare@suse.de>
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
config: hexagon-randconfig-r045-20211207 (https://download.01.org/0day-ci/archive/20211209/202112090643.h0EhSayB-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6b66f083c8ccc2d25de4c0a9bc9229f38952bf10
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hannes-Reinecke/libata-rework-logging-take-II/20211209-003634
        git checkout 6b66f083c8ccc2d25de4c0a9bc9229f38952bf10
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/ata/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/ata/libata-core.c:972:13: warning: no previous prototype for function 'ata_dev_class_string' [-Wmissing-prototypes]
   const char *ata_dev_class_string(unsigned int class)
               ^
   drivers/ata/libata-core.c:972:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
   const char *ata_dev_class_string(unsigned int class)
         ^
   static 
   1 warning generated.


vim +/ata_dev_class_string +972 drivers/ata/libata-core.c

   971	
 > 972	const char *ata_dev_class_string(unsigned int class)
   973	{
   974		static const char * const class_str[] = {
   975			"unknown",
   976			"ATA",
   977			"ATA (unsupported)",
   978			"ATAPI",
   979			"ATAPI (unsupported",
   980			"PMP",
   981			"PMP (unsupported)",
   982			"SEMB",
   983			"SEMB (unsupported)",
   984			"ZAC",
   985			"ZAC (unsupported)",
   986			"none",
   987		};
   988		if (class == 0 || (class - 1) >= ARRAY_SIZE(class_str))
   989			return "unknown";
   990		return class_str[class - 1];
   991	}
   992	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
