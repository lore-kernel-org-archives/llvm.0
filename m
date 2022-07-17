Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E98659
	for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658061573; x=1689597573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zV02xbeEIH6yY+68dK8NLkbs9RpRO+xC4JTzCSk2mjU=;
  b=fYOScdkc1h1Ub4Q431yAoLMEdme2tl0paXs3T1r+oFo6mXQhgi++m8dW
   1sV2NOY3XFsdHsbUHv9vfLCojM9Bm0EDLos0643VnVP5rsM0fIAK0anXT
   EpTLvo69NhrB/z2VzjQZm2ZeA5PgA6K3/01FmYVkwKvif8D5/X6I3QTny
   eRWlNGqC0G+zw+wsnTErLsEqOmqaNK9/YYI1j5HjmpuEbvdnD9k83Y+3O
   2QPl//80Z7aWccAiNJ96jTl2j7X835LLQ1eY7HPcuMew4nNkVGY8JOoIS
   x8snBKPt84jKtMHO+hrxi5uKtWf2QwB1XD+xt3ASuCPb2YE8OUJmQPxbc
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="286079461"
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="286079461"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 05:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="572083537"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Jul 2022 05:39:31 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oD3YY-0003EG-KK;
	Sun, 17 Jul 2022 12:39:30 +0000
Date: Sun, 17 Jul 2022 20:39:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Quinlan <jim2101024@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 5/6] PCI: brcmstb: Add control of subdevice voltage
 regulators
Message-ID: <202207172037.yy5KaMgA-lkp@intel.com>
References: <20220716222454.29914-6-jim2101024@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220716222454.29914-6-jim2101024@gmail.com>

Hi Jim,

I love your patch! Perhaps something to improve:

[auto build test WARNING on c5fe7a97f20c7f3070ac870144515c0fabc6b999]

url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Quinlan/PCI-brcmstb-Re-submit-reverted-patchset/20220717-062726
base:   c5fe7a97f20c7f3070ac870144515c0fabc6b999
config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive/20220717/202207172037.yy5KaMgA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 45067f8fbf61284839c739807c2da2e2505661eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7b781857074cba16cbcea9d4e3f21681d653f35f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jim-Quinlan/PCI-brcmstb-Re-submit-reverted-patchset/20220717-062726
        git checkout 7b781857074cba16cbcea9d4e3f21681d653f35f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/pci/controller/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pcie-brcmstb.c:1157:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (dev->of_node) {
                      ^~~~~~~~~~~~
   drivers/pci/controller/pcie-brcmstb.c:1176:9: note: uninitialized use occurs here
           return ret == -ENOMEM ? ret : 0;
                  ^~~
   drivers/pci/controller/pcie-brcmstb.c:1157:9: note: remove the 'if' if its condition is always true
           } else if (dev->of_node) {
                  ^~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/pcie-brcmstb.c:1147:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (dev->of_node && dev->driver_data) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-brcmstb.c:1176:9: note: uninitialized use occurs here
           return ret == -ENOMEM ? ret : 0;
                  ^~~
   drivers/pci/controller/pcie-brcmstb.c:1147:2: note: remove the 'if' if its condition is always false
           if (dev->of_node && dev->driver_data) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-brcmstb.c:1142:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   2 warnings generated.


vim +1157 drivers/pci/controller/pcie-brcmstb.c

  1137	
  1138	static int brcm_pcie_add_bus(struct pci_bus *bus)
  1139	{
  1140		struct brcm_pcie *pcie = (struct brcm_pcie *) bus->sysdata;
  1141		struct device *dev = &bus->dev;
  1142		int ret;
  1143	
  1144		if (!bus->parent || !pci_is_root_bus(bus->parent) || !pcie)
  1145			return 0;
  1146	
> 1147		if (dev->of_node && dev->driver_data) {
  1148			/*
  1149			 * Oops, this is unfortunate.  We are using the port
  1150			 * driver's driver_data field to store our regulator info
  1151			 * and it appears that another driver started using it as
  1152			 * well.  If so, be a team player do not overwrite it.  We
  1153			 * may still be okay if there are no regulators.
  1154			 */
  1155			dev_err(dev, "root port dev.driver_data non-NULL; something wrong\n");
  1156	
> 1157		} else if (dev->of_node) {
  1158			ret = pci_subdev_regulators_add_bus(bus);
  1159			/* Grab the regulators for suspend/resume */
  1160			pcie->sr = bus->dev.driver_data;
  1161		}
  1162	
  1163		/*
  1164		 * We return 0 and turn on the "refusal_mode" so that any further
  1165		 * accesses to the pci_dev just get 0xffffffff
  1166		 */
  1167		if (brcm_pcie_start_link(pcie) != 0)
  1168			pcie->refusal_mode = true;
  1169	
  1170		/*
  1171		 * There is not much of a point to return an error as currently it
  1172		 * will cause a WARNING() from pci_alloc_child_bus().  So only
  1173		 * return the error if it is -ENOMEM.  Note that we are always
  1174		 * doing a dev_err() for other erros.
  1175		 */
  1176		return ret == -ENOMEM ? ret : 0;
  1177	}
  1178	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
