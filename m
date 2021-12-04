Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886912C9E
	for <llvm@lists.linux.dev>; Sat,  4 Dec 2021 14:17:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="323378005"
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="323378005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 06:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,287,1631602800"; 
   d="scan'208";a="514100772"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Dec 2021 06:17:52 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtVrL-000J5T-Lo; Sat, 04 Dec 2021 14:17:51 +0000
Date: Sat, 4 Dec 2021 22:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@xilinx.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lizhi Hou <lizhi.hou@xilinx.com>, linux-fpga@vger.kernel.org,
	maxz@xilinx.com, sonal.santan@xilinx.com, yliu@xilinx.com,
	michal.simek@xilinx.com, stefanos@xilinx.com,
	devicetree@vger.kernel.org, trix@redhat.com
Subject: Re: [PATCH V3 XRT Alveo Infrastructure 3/8] of: create empty of root
Message-ID: <202112042255.DZihRncD-lkp@intel.com>
References: <20211204003957.1448567-4-lizhi.hou@xilinx.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211204003957.1448567-4-lizhi.hou@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Lizhi,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linux/master linus/master v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lizhi-Hou/XRT-Alveo-driver-infrastructure-overview/20211204-084333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: mips-randconfig-c004-20211203 (https://download.01.org/0day-ci/archive/20211204/202112042255.DZihRncD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/1b36c19ebc303a293dff82ed399ea70bf4ddde50
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lizhi-Hou/XRT-Alveo-driver-infrastructure-overview/20211204-084333
        git checkout 1b36c19ebc303a293dff82ed399ea70bf4ddde50
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/of/fdt.c:505:7: error: implicit declaration of function 'of_resolve_phandles' [-Werror,-Wimplicit-function-declaration]
           rc = of_resolve_phandles(dt);
                ^
   1 error generated.


vim +/of_resolve_phandles +505 drivers/of/fdt.c

   468	
   469	static int __init of_fdt_root_init(void)
   470	{
   471		struct device_node *dt = NULL, *np;
   472		void *fdt, *fdt_aligned;
   473		int size, rc;
   474	
   475	#if !defined(CONFIG_OF_UNITTEST)
   476		if (of_root)
   477			return 0;
   478	#endif
   479		size = __dtb_fdt_default_end - __dtb_fdt_default_begin;
   480	
   481		fdt = kmalloc(size + FDT_ALIGN_SIZE, GFP_KERNEL);
   482		if (!fdt)
   483			return -ENOMEM;
   484	
   485		fdt_aligned = PTR_ALIGN(fdt, FDT_ALIGN_SIZE);
   486		memcpy(fdt_aligned, __dtb_fdt_default_begin, size);
   487	
   488		if (!of_fdt_unflatten_tree((const unsigned long *)fdt_aligned,
   489					   NULL, &dt)) {
   490			pr_warn("%s: unflatten default tree failed\n", __func__);
   491			kfree(fdt);
   492			return -ENODATA;
   493		}
   494		if (!dt) {
   495			pr_warn("%s: empty default tree\n", __func__);
   496			kfree(fdt);
   497			return -ENODATA;
   498		}
   499	
   500		/*
   501		 * This lock normally encloses of_resolve_phandles()
   502		 */
   503		of_overlay_mutex_lock();
   504	
 > 505		rc = of_resolve_phandles(dt);
   506		if (rc) {
   507			pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
   508			of_overlay_mutex_unlock();
   509			return -EINVAL;
   510		}
   511	
   512		if (!of_root) {
   513			of_root = dt;
   514			for_each_of_allnodes(np)
   515				__of_attach_node_sysfs(np);
   516			of_aliases = of_find_node_by_path("/aliases");
   517			of_chosen = of_find_node_by_path("/chosen");
   518			of_overlay_mutex_unlock();
   519			return 0;
   520		}
   521	
   522		unittest_data_add(dt);
   523	
   524		of_overlay_mutex_unlock();
   525	
   526		return 0;
   527	}
   528	pure_initcall(of_fdt_root_init);
   529	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
