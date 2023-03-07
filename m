Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7C386;
	Tue,  7 Mar 2023 22:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678229187; x=1709765187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jTwZkvzzed97bMcN2aRK24nUPe7VKzMfzJafuNchpAk=;
  b=kXwbBqSRDeHIBa18R5FuNEYfNIlGuy31j43Nx30PuqgOPue6La+XixO6
   duY1IBnJejGiQAXA0gvY4KusoeoaCNMXSM1tGnT6eqcKHHqCukrBZ4bZA
   i86rDEoGtXRsUdCnRIjQXVt/22Nz1QxmWrgt1HDovpCGy3Rqx9GEicIEY
   qWUjGMcLWv9ovWA4f0mc4k3SmSDvvaPaV0ngjd6Y/PfXKucT03CD3WXvd
   5Gs6YnOUXaxtojKftFZbpV8xhshujkpOfkGd6DU1w3CeG+RTb1r6xMi+R
   XbzYLtGX24geUhIKM6kFwT2rQMgmNSTqwNMmYDkgYLOZmitzjfJQuS8sO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334709371"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="334709371"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 14:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626709218"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="626709218"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 14:46:25 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZg4f-0001fG-0G;
	Tue, 07 Mar 2023 22:46:25 +0000
Date: Wed, 8 Mar 2023 06:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup /35]
 drivers/of/module.c:62:6: warning: incompatible integer to pointer
 conversion assigning to 'char *' from 'int'
Message-ID: <202303080602.l78Xfpcf-lkp@intel.com>
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
commit: 71414eadef0bb9ab9e3688498d0dc11f2739b5f2 [/35] of: Move the request module helper logic to module.c
config: i386-randconfig-a013-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080602.l78Xfpcf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/71414eadef0bb9ab9e3688498d0dc11f2739b5f2
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout 71414eadef0bb9ab9e3688498d0dc11f2739b5f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvmem/ drivers/of/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080602.l78Xfpcf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/of/module.c:62:8: error: implicit declaration of function 'kmalloc' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           str = kmalloc(size, GFP_KERNEL);
                 ^
   drivers/of/module.c:62:8: note: did you mean 'mm_alloc'?
   include/linux/sched/mm.h:16:26: note: 'mm_alloc' declared here
   extern struct mm_struct *mm_alloc(void);
                            ^
>> drivers/of/module.c:62:6: warning: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
           str = kmalloc(size, GFP_KERNEL);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/module.c:69:2: error: implicit declaration of function 'kfree' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           kfree(str);
           ^
   drivers/of/module.c:69:2: note: did you mean 'kvfree'?
   include/linux/rcutiny.h:99:13: note: 'kvfree' declared here
   extern void kvfree(const void *addr);
               ^
   1 warning and 2 errors generated.


vim +62 drivers/of/module.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
