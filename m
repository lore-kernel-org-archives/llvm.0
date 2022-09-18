Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418957C
	for <llvm@lists.linux.dev>; Sun, 18 Sep 2022 16:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663520379; x=1695056379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tv+BzbmSlD1NHqooOL+Mj4tVXZ+hLiBiwNnS3hEQMCU=;
  b=DmA17HnbTeP20S1kS6VzKYKVFWyC4NnjQkqvt2S1nGs1rbX/P+gOt7at
   awhi+qBE+ZuFOR7Zm3Bnc0bPGhhVLaGkYbpfNxOatWFWbMDyN04mtN6We
   WwQKDyOM647J+AZaSoPg0NZDFm77fCty9tSTjNG96Jfr8NGBfK+h75/WB
   glBEJHZH5P0ZTjEhdddrxdsIRo3RlK7xSFubSmY/gks48OIodypXFeGlX
   QMqeuC3dhr7cldYFxyQGRAD3VG6YdSSjbrFH0jDsNpgnmLausiC717N1a
   fcYHJruFObzHhyau0lv7/sk7/qC63MuIJcU4ruAvQhc2gQ9t6RsDzu/ZY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="282275424"
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="282275424"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2022 09:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,325,1654585200"; 
   d="scan'208";a="618225437"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2022 09:59:37 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZxdo-0001Kn-33;
	Sun, 18 Sep 2022 16:59:36 +0000
Date: Mon, 19 Sep 2022 00:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kajetan Puchalski <kajetan.puchalski@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/1] cpuidle: teo: Add optional util-awareness
Message-ID: <202209190007.gQUIQDuS-lkp@intel.com>
References: <20220915164411.2496380-2-kajetan.puchalski@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915164411.2496380-2-kajetan.puchalski@arm.com>

Hi Kajetan,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v6.0-rc5 next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kajetan-Puchalski/cpuidle-teo-Introduce-optional-util-awareness/20220916-004754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220919/202209190007.gQUIQDuS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/12ebcc0f2762db714844318e850f102d864b92d7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kajetan-Puchalski/cpuidle-teo-Introduce-optional-util-awareness/20220916-004754
        git checkout 12ebcc0f2762db714844318e850f102d864b92d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cpuidle/governors/ drivers/net/ethernet/mellanox/mlx5/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/cpuidle/governors/teo.c:592:31: error: implicit declaration of function 'arch_scale_cpu_capacity' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           unsigned long max_capacity = arch_scale_cpu_capacity(dev->cpu);
                                        ^
   1 error generated.


vim +/arch_scale_cpu_capacity +592 drivers/cpuidle/governors/teo.c

   581	
   582	/**
   583	 * teo_enable_device - Initialize the governor's data for the target CPU.
   584	 * @drv: cpuidle driver (not used).
   585	 * @dev: Target CPU.
   586	 */
   587	static int teo_enable_device(struct cpuidle_driver *drv,
   588				     struct cpuidle_device *dev)
   589	{
   590		struct teo_cpu *cpu_data = per_cpu_ptr(&teo_cpus, dev->cpu);
   591	#ifdef CONFIG_CPU_IDLE_GOV_TEO_UTIL_AWARE
 > 592		unsigned long max_capacity = arch_scale_cpu_capacity(dev->cpu);
   593	#endif
   594		int i;
   595	
   596		memset(cpu_data, 0, sizeof(*cpu_data));
   597	#ifdef CONFIG_CPU_IDLE_GOV_TEO_UTIL_AWARE
   598		cpu_data->util_threshold = max_capacity >> UTIL_THRESHOLD_SHIFT;
   599	#endif
   600	
   601		for (i = 0; i < NR_RECENT; i++)
   602			cpu_data->recent_idx[i] = -1;
   603	
   604		return 0;
   605	}
   606	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
