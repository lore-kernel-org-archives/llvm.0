Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC601FA8;
	Tue, 14 Mar 2023 04:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678768037; x=1710304037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RYd0fa8XsBGMhyX7/+YBW2CDfeQLQYaPilVAlKkbo/I=;
  b=Honjwmt7cH6/0V2Zbta71sGiPSF1DnDuZq4s3ZRF9NcQprniMr4DB0wr
   FVvYZV4h4riAw3xjMJHCMrrBY5Aiz9nRRf/gGeyzAm9x02l2J8fOVj5II
   Sn0RD85o+W6RW8th8o+I9FUnwp7f7/cheRcZ/jFAPMkYoPKNbP9TLuRQH
   0nS98pEvYBAa9Hib3BekYDJ4koV353qvxX0o1dfaJ62luDVGqojy4YhKP
   ZPpU6QPCXpRNikZ3dJkNYYePAjJsbPk6k4SMCWlpwMbmlNnd3mF6/z6JX
   rUaXCmUY58Hr+nVN/zLxHnq/Nhxh2zfcp/4LBXtjKnJP2sBviy8j3rXMH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423597283"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="423597283"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 21:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="709128172"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="709128172"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Mar 2023 21:27:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbwFl-0006X6-2t;
	Tue, 14 Mar 2023 04:27:13 +0000
Date: Tue, 14 Mar 2023 12:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Song Shuai <suagrfillet@gmail.com>, sudeep.holla@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	conor.dooley@microchip.com, ionela.voinescu@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Song Shuai <suagrfillet@gmail.com>
Subject: Re: [PATCH] arch_topology: Clear LLC sibling when cacheinfo teardown
Message-ID: <202303141253.k5dETDoR-lkp@intel.com>
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
config: x86_64-randconfig-a014-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141253.k5dETDoR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a9aca0a81b31b421e3bbfa08fd205a8bec651afe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Song-Shuai/arch_topology-Clear-LLC-sibling-when-cacheinfo-teardown/20230313-182946
        git checkout a9aca0a81b31b421e3bbfa08fd205a8bec651afe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141253.k5dETDoR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/cacheinfo.c:818:2: error: implicit declaration of function 'clear_llc_topology' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
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
