Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C2C2104
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 02:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646189496; x=1677725496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gSNkjkake7xD9VTOgxUuUJVMTiM0gzuhsnYwpkaAsMg=;
  b=Q7IrzgyI6seT64Taz1dY9w/8T1XUyg9MiYqoebzi8SyVEjsvsOaRkukG
   NXL/tbhHfDdmuR0GNfE9AHBVAZKC226RZoF03kg/vqs+o+HiCGy54xaUc
   gL1fu9R0a8029U5/Us/2NKXfyMsiBOJ6t+G6fyOnKhcAH2E1sgBABZAxf
   DXCj8TRbNt16rv9O2IZrUC4lxkkAI2riXP9wUoqLCIdvNIiNNY1sQGmXJ
   C6sMlXPCDYy6CEL9aHNnFgKGbZ5Hm9B38LHOrZ6qaolBVcIs51qqXjqd8
   Svp9A/COSediqkRkU8cZtkblck6G7JO1m5SFn6iH8hfsbEU7ZwYrKQ8p9
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253488433"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="253488433"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 18:51:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="630261418"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Mar 2022 18:51:34 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPF5R-0000wS-Jo; Wed, 02 Mar 2022 02:51:33 +0000
Date: Wed, 2 Mar 2022 10:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH V9 05/10] irqchip/loongson-htvec: Add ACPI init support
Message-ID: <202203020732.h6NYX90D-lkp@intel.com>
References: <20220226105307.77053-6-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226105307.77053-6-chenhuacai@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Huacai,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linux/master linus/master v5.17-rc6 next-20220301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Huacai-Chen/irqchip-Add-LoongArch-related-irqchip-drivers/20220226-190333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git d2206fcabdfaff3958ab67cc5b8f63257e57b889
config: mips-randconfig-r032-20220301 (https://download.01.org/0day-ci/archive/20220302/202203020732.h6NYX90D-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/f4c826187ce407c49fdab5587194cf4e8eed5c33
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Huacai-Chen/irqchip-Add-LoongArch-related-irqchip-drivers/20220226-190333
        git checkout f4c826187ce407c49fdab5587194cf4e8eed5c33
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-loongson-htvec.c:221:3: warning: variable 'num_parents' is uninitialized when used here [-Wuninitialized]
                   num_parents++;
                   ^~~~~~~~~~~
   drivers/irqchip/irq-loongson-htvec.c:209:17: note: initialize the variable 'num_parents' to silence this warning
           int num_parents, parent_irq[8];
                          ^
                           = 0
   1 warning generated.


vim +/num_parents +221 drivers/irqchip/irq-loongson-htvec.c

   204	
   205	static int htvec_of_init(struct device_node *node,
   206					struct device_node *parent)
   207	{
   208		int i, err;
   209		int num_parents, parent_irq[8];
   210		struct resource res;
   211	
   212		if (of_address_to_resource(node, 0, &res))
   213			return -EINVAL;
   214	
   215		/* Interrupt may come from any of the 8 interrupt lines */
   216		for (i = 0; i < HTVEC_MAX_PARENT_IRQ; i++) {
   217			parent_irq[i] = irq_of_parse_and_map(node, i);
   218			if (parent_irq[i] <= 0)
   219				break;
   220	
 > 221			num_parents++;
   222		}
   223	
   224		err = htvec_init(res.start, resource_size(&res),
   225				num_parents, parent_irq, of_node_to_fwnode(node));
   226		if (err < 0)
   227			return err;
   228	
   229		return 0;
   230	}
   231	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
