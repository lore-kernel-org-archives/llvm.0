Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D12CA8
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639817382; x=1671353382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AuXz7EPD8GTdqR0I7W4pupkxJMTMupozntWMAQD71iM=;
  b=W+hQbQaSnjrkfi//O54Snktq0ECTPn4BXydnyAXNx5TlPCWeA03UTYAv
   Ws6g/YMPz3mJqcw3K/NsJV4nK2pA0DS9IcDTgADeHlzCkXFJ3mLk7UQtA
   wCToJ7Nbodt8Pbo1QnTS2jIj1cBYY39WkL5LGlOJtviqUEnC1/vZkM23M
   tgbGJmCVHRYtGmCuXa+tLv5lwYuIG9jFrJtqdnBAiJ0MNY/aE9wZyGbvX
   27qVP2x2i4QmNXhoM4d5spwQa94VBuZ5MuAfKYwIXcP6v3TpLerS1ABhm
   bpooc2cRC3wKSUYDdWX52IzgwmzHa7ZWA1pwYpZQdmt5GOXqzvM/87tNO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="219915755"
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="219915755"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2021 00:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="520091826"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Dec 2021 00:49:39 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myVPP-0005o2-46; Sat, 18 Dec 2021 08:49:39 +0000
Date: Sat, 18 Dec 2021 16:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] ata: pata_platform: Merge pata_of_platform into
 pata_platform
Message-ID: <202112181626.BwlfTnhn-lkp@intel.com>
References: <20211217141715.29747-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217141715.29747-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Lad,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.16-rc5 next-20211217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lad-Prabhakar/ata-pata_platform-Refurbish-the-driver/20211217-222115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6441998e2e37131b0a4c310af9156d79d3351c16
config: x86_64-randconfig-a015-20211216 (https://download.01.org/0day-ci/archive/20211218/202112181626.BwlfTnhn-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2afb31eaebf47bea2adaec197e8aa25744c15bf6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Lad-Prabhakar/ata-pata_platform-Refurbish-the-driver/20211217-222115
        git checkout 2afb31eaebf47bea2adaec197e8aa25744c15bf6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/ata/pata_platform.c:232:37: error: implicit declaration of function 'irq_get_trigger_type' [-Werror,-Wimplicit-function-declaration]
                   irq_res->flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
                                                     ^
   1 error generated.


vim +/irq_get_trigger_type +232 drivers/ata/pata_platform.c

   193	
   194	static int pata_of_platform_get_pdata(struct platform_device *ofdev,
   195					      struct pata_platform_priv *priv)
   196	{
   197		struct device_node *dn = ofdev->dev.of_node;
   198		struct resource *ctl_res;
   199		struct resource *irq_res;
   200		struct resource *io_res;
   201		int pio_mode = 0;
   202		int irq;
   203		int ret;
   204	
   205		ctl_res = devm_kzalloc(&ofdev->dev, sizeof(*ctl_res), GFP_KERNEL);
   206		io_res = devm_kzalloc(&ofdev->dev, sizeof(*io_res), GFP_KERNEL);
   207		irq_res = devm_kzalloc(&ofdev->dev, sizeof(*irq_res), GFP_KERNEL);
   208		if (!ctl_res || !io_res || !irq_res)
   209			return -ENOMEM;
   210	
   211		ret = of_address_to_resource(dn, 0, io_res);
   212		if (ret) {
   213			dev_err(&ofdev->dev, "can't get IO address from device tree\n");
   214			return -EINVAL;
   215		}
   216		priv->io_res = io_res;
   217	
   218		ret = of_address_to_resource(dn, 1, ctl_res);
   219		if (ret) {
   220			dev_err(&ofdev->dev, "can't get CTL address from device tree\n");
   221			return -EINVAL;
   222		}
   223		priv->ctl_res = ctl_res;
   224	
   225		irq = platform_get_irq_optional(ofdev, 0);
   226		if (irq <= 0 && irq != -ENXIO)
   227			return irq ? irq : -ENXIO;
   228	
   229		if (irq > 0) {
   230			irq_res->start = irq;
   231			irq_res->end = irq;
 > 232			irq_res->flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
   233			priv->irq_res = irq_res;
   234		} else {
   235			devm_kfree(&ofdev->dev, io_res);
   236		}
   237	
   238		of_property_read_u32(dn, "reg-shift", &priv->ioport_shift);
   239	
   240		if (!of_property_read_u32(dn, "pio-mode", &pio_mode)) {
   241			if (pio_mode > 6) {
   242				dev_err(&ofdev->dev, "invalid pio-mode\n");
   243				return -EINVAL;
   244			}
   245		} else {
   246			dev_info(&ofdev->dev, "pio-mode unspecified, assuming PIO0\n");
   247		}
   248	
   249		priv->use16bit = of_property_read_bool(dn, "ata-generic,use16bit");
   250	
   251		priv->mask = 1 << pio_mode;
   252		priv->mask |= (1 << pio_mode) - 1;
   253	
   254		return 0;
   255	}
   256	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
