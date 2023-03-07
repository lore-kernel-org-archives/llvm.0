Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22010792;
	Tue,  7 Mar 2023 21:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678224322; x=1709760322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lK5ipnxLVApshRL4hYhOSuzjqwmSwGL5jAGkmyU1/NM=;
  b=lA70ptBtNRh4i31Rcv027qaV1muOkkpf0G+pZkq6j0qqrCqW/jzS+WFL
   iz6LraTeTlVc7YUsABfxBdm72ugXNh+Pdrzh1GIc0Heoy89+pkqSOcycQ
   4qsuXXV8nwCoPflXKtEi/lMKOmZayTQedPRqIraf+FqgLUtJg0KvQkm1E
   6GnWe4MAIx8GCC21L1uof46Ncx8dRxjv0hoNahfC8oMdTr+q5jlLgAMF0
   XAqrGShIbEQd1F037JxgCTSyXvw70rqkmkHBM8/aVWy8U39p17qDgiwqF
   qXLN2TjYxyMLk0VtZxBrbK7RZv2k7DTjSeBzpaLGt8pooQ40GUiCv1g26
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422248714"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="422248714"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626685310"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="626685310"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 13:25:20 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZeoB-0001cR-1Z;
	Tue, 07 Mar 2023 21:25:19 +0000
Date: Wed, 8 Mar 2023 05:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 13/57]
 drivers/of/module.c:62:8: error: call to undeclared function 'kmalloc'; ISO
 C99 and later do not support implicit function declarations
Message-ID: <202303080519.nrAfLRna-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   4dbec5e07ef322a0458183244c9a11e92eebd61d
commit: 71414eadef0bb9ab9e3688498d0dc11f2739b5f2 [13/57] of: Move the request module helper logic to module.c
config: arm-randconfig-r034-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080519.nrAfLRna-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/miquelraynal/linux-0day/commit/71414eadef0bb9ab9e3688498d0dc11f2739b5f2
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout 71414eadef0bb9ab9e3688498d0dc11f2739b5f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/of/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080519.nrAfLRna-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/of/module.c:62:8: error: call to undeclared function 'kmalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           str = kmalloc(size, GFP_KERNEL);
                 ^
   drivers/of/module.c:62:8: note: did you mean 'mm_alloc'?
   include/linux/sched/mm.h:16:26: note: 'mm_alloc' declared here
   extern struct mm_struct *mm_alloc(void);
                            ^
>> drivers/of/module.c:62:6: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
           str = kmalloc(size, GFP_KERNEL);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/of/module.c:69:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           kfree(str);
           ^
   3 errors generated.


vim +/kmalloc +62 drivers/of/module.c

    45	
    46	int of_request_module(struct device_node *np)
    47	{
    48		char *str;
    49		ssize_t size;
    50		int ret;
    51	
    52		if (!np)
    53			return -ENODEV;
    54	
    55		size = of_modalias(np, NULL, 0);
    56		if (size < 0)
    57			return size;
    58	
    59		/* Reserve an additional byte for the trailing '\0' */
    60		size++;
    61	
  > 62		str = kmalloc(size, GFP_KERNEL);
    63		if (!str)
    64			return -ENOMEM;
    65	
    66		of_modalias(np, str, size);
    67		str[size - 1] = '\0';
    68		ret = request_module(str);
  > 69		kfree(str);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
