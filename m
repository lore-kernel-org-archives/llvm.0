Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9352F24
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 03:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643772029; x=1675308029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=47d0w+TcETcnJky5Viju6oF4bsR5j3TvE16g+kRL0zQ=;
  b=gphnVE32FMK7oBji4MDWzhGF5A5kuGpFdFsL88nqriM+A6WYXQR9ZLVb
   ZXDxxDOJtnAcVjo+EfIyWgLOi+2zPZtcZ8n92H6NiLtzIDecpiIvenZCK
   8Oeh/g1ZemqW2XLcwtULkd3LxFF3I9mVlaEDWlg/3qf6THiO/Khk2KBQs
   Ov2zoIq9BeFXVWsc1Up4fRniYWczb5FpoYUWmjYAtV3zdEgWoOY5V3NeN
   oWQs3Cgo9uvbZ5xzh4xQwTkHV8z0GUfn9j9AZIFr6qXSdL9XULZaDTMyV
   5uGmwxHyI5ocb21Qu0T/y8NI6ME4ad5Fwj0jXld72sxFhAfWCKdBi3Svu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="227810571"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="227810571"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 19:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="771319081"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2022 19:20:27 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nF6C2-000U4w-SJ; Wed, 02 Feb 2022 03:20:26 +0000
Date: Wed, 2 Feb 2022 11:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dipen Patel <dipenp@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 08/11] gpiolib: cdev: Add hardware timestamp clock type
Message-ID: <202202021145.SEtKjkEh-lkp@intel.com>
References: <20220201222630.21246-9-dipenp@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201222630.21246-9-dipenp@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dipen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 07f8c60fe60f84977dc815ec8a6b1100827c34dd]

url:    https://github.com/0day-ci/linux/commits/Dipen-Patel/Intro-to-Hardware-timestamping-engine/20220202-062447
base:   07f8c60fe60f84977dc815ec8a6b1100827c34dd
config: riscv-randconfig-r042-20220131 (https://download.01.org/0day-ci/archive/20220202/202202021145.SEtKjkEh-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/09c0523049e7be3241a2ec74e139ebad40f4e46c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dipen-Patel/Intro-to-Hardware-timestamping-engine/20220202-062447
        git checkout 09c0523049e7be3241a2ec74e139ebad40f4e46c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib-cdev.c:835:3: warning: variable 'flags' is uninitialized when used here [-Wuninitialized]
                   flags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
                   ^~~~~
   drivers/gpio/gpiolib-cdev.c:831:21: note: initialize the variable 'flags' to silence this warning
           unsigned long flags;
                              ^
                               = 0
   1 warning generated.


vim +/flags +835 drivers/gpio/gpiolib-cdev.c

   828	
   829	static int hte_edge_setup(struct line *line, u64 eflags)
   830	{
   831		unsigned long flags;
   832		struct hte_ts_desc *hdesc = &line->hdesc;
   833	
   834		if (eflags & GPIO_V2_LINE_FLAG_EDGE_RISING)
 > 835			flags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
   836					  HTE_FALLING_EDGE_TS : HTE_RISING_EDGE_TS;
   837		if (eflags & GPIO_V2_LINE_FLAG_EDGE_FALLING)
   838			flags |= test_bit(FLAG_ACTIVE_LOW, &line->desc->flags) ?
   839					  HTE_RISING_EDGE_TS : HTE_FALLING_EDGE_TS;
   840	
   841		hdesc->attr.edge_flags = flags;
   842		hdesc->attr.line_data = line->desc;
   843		hdesc->attr.line_id = desc_to_gpio(line->desc);
   844		line->total_discard_seq = 0;
   845	
   846		return hte_req_ts_by_linedata_ns(hdesc, process_hw_ts,
   847						 process_hw_ts_thread, line);
   848	}
   849	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
