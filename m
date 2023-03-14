Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977CD23A0;
	Tue, 14 Mar 2023 05:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678770499; x=1710306499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bbs9+ffYl0KK+4Q+2/p1FmY+Jfc9viWy0OjDOfk+zZI=;
  b=AzBbbJlBwdUatrpWoBC6XpGHdf0PJE+FTqSJPgJ0zvOLU3lZ5MK79gNw
   iJC0yTJriqJuaEp6bi78uxBXjJDgtClI5pTGv9Jd4oV882+kKsGxe8H3z
   vZFaKZ/VSezKWKBZNbztHbJa/Ixr3zMK66sQ5lwHqvJatxVB8apBKeF2B
   rqFh4RK066yRQXIGds83WPlWban80ciiFGYigrlskYasA9dkNq2okYmGZ
   5z1f5pnafqvEc/vs5Y4jtNfrtoqxENWsBMZraZSaAzo1MSJwKexBFolhx
   teoVlzeAu65NCauTcQzOOTeHRyraXH5fbHC00PbQ3tY7fZGkqwfKJJs4N
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316978846"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="316978846"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 22:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747864920"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="747864920"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 22:08:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbwtS-0006Y6-1s;
	Tue, 14 Mar 2023 05:08:14 +0000
Date: Tue, 14 Mar 2023 13:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Song Shuai <suagrfillet@gmail.com>, sudeep.holla@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	conor.dooley@microchip.com, ionela.voinescu@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Song Shuai <suagrfillet@gmail.com>
Subject: Re: [PATCH] arch_topology: Clear LLC sibling when cacheinfo teardown
Message-ID: <202303141252.uMIMFRnT-lkp@intel.com>
References: <20230313102752.1134472-1-suagrfillet@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313102752.1134472-1-suagrfillet@gmail.com>

Hi Song,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.3-rc2 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Shuai/arch_topology-Clear-LLC-sibling-when-cacheinfo-teardown/20230313-182946
patch link:    https://lore.kernel.org/r/20230313102752.1134472-1-suagrfillet%40gmail.com
patch subject: [PATCH] arch_topology: Clear LLC sibling when cacheinfo teardown
config: arm-randconfig-r046-20230312 (https://download.01.org/0day-ci/archive/20230314/202303141252.uMIMFRnT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/a9aca0a81b31b421e3bbfa08fd205a8bec651afe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Song-Shuai/arch_topology-Clear-LLC-sibling-when-cacheinfo-teardown/20230313-182946
        git checkout a9aca0a81b31b421e3bbfa08fd205a8bec651afe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141252.uMIMFRnT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/cacheinfo.c:818:2: error: call to undeclared function 'clear_llc_topology'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           clear_llc_topology(cpu);
           ^
   1 error generated.


vim +/clear_llc_topology +818 drivers/base/cacheinfo.c

   811	
   812	static int cacheinfo_cpu_pre_down(unsigned int cpu)
   813	{
   814		if (cpumask_test_and_clear_cpu(cpu, &cache_dev_map))
   815			cpu_cache_sysfs_exit(cpu);
   816	
   817		free_cache_attributes(cpu);
 > 818		clear_llc_topology(cpu);
   819		return 0;
   820	}
   821	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
