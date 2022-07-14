Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BF27E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 20:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657832386; x=1689368386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ysF2hIDjCGBABdVcJ1bsRwdEQVYuIg82pWmVPZ4wXjs=;
  b=FkAJzf0LLDsPHMSXb9pFjnbLG5MDqhb2f0HecAZGcoqWusAxi0NNm+wz
   mrf4DZnyQOC0/RUPFbuYOF2BN2hcQrFXl2g/iImfNjYZ0XtKodVACg43c
   zK9zRPApHVb+2Tu+6YbetErdylC/XpaAGYSboGgdN/g3oh4Vb2JRJjQTV
   m1gi2AJ6A9W/KFOQLwbLXvPpQ3JaoHfSGqNQtZ2uqaN3LUHL8uzWMzHW8
   qAXlu6QdSgQGc8kCQiBj5Wl/vuN1z3sWs/dKrgiIywaU8Q9P654oVlEJd
   ugn7SaHU1YdAf97Xkdfcv1KigMj+BRDYe61Clm5RygAM/aPtZY8i/ktxq
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="283186769"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="283186769"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 13:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="596232227"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Jul 2022 13:59:39 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC5vu-00019R-Ml;
	Thu, 14 Jul 2022 20:59:38 +0000
Date: Fri, 15 Jul 2022 04:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	Rob Herring <robh+dt@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 07/23] ata: libahci_platform: Convert to using devm
 bulk clocks API
Message-ID: <202207150410.A4kg5upp-lkp@intel.com>
References: <20220713052917.27036-8-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713052917.27036-8-Sergey.Semin@baikalelectronics.ru>

Hi Serge,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on axboe-block/for-next linus/master v5.19-rc6 next-20220714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/ata-ahci-Add-DWC-Baikal-T1-AHCI-SATA-support/20220713-133437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: riscv-randconfig-r004-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150410.A4kg5upp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7225145d9ff95641c04bdc1dd85915be6cd5ce57
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Serge-Semin/ata-ahci-Add-DWC-Baikal-T1-AHCI-SATA-support/20220713-133437
        git checkout 7225145d9ff95641c04bdc1dd85915be6cd5ce57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ata/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/ata/ahci_dm816.c:72:6: error: invalid argument type 'struct clk_bulk_data' to unary expression
           if (!hpriv->clks[1]) {
               ^~~~~~~~~~~~~~~
>> drivers/ata/ahci_dm816.c:77:29: error: passing 'struct clk_bulk_data' to parameter of incompatible type 'struct clk *'
           refclk_rate = clk_get_rate(hpriv->clks[1]);
                                      ^~~~~~~~~~~~~~
   include/linux/clk.h:584:40: note: passing argument to parameter 'clk' here
   unsigned long clk_get_rate(struct clk *clk);
                                          ^
   2 errors generated.


vim +72 drivers/ata/ahci_dm816.c

df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   60  
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   61  static int ahci_dm816_phy_init(struct ahci_host_priv *hpriv, struct device *dev)
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   62  {
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   63  	unsigned long refclk_rate;
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   64  	int mpy;
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   65  	u32 val;
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   66  
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   67  	/*
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   68  	 * We should have been supplied two clocks: the functional and
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   69  	 * keep-alive clock and the external reference clock. We need the
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   70  	 * rate of the latter to calculate the correct value of MPY bits.
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   71  	 */
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14  @72  	if (!hpriv->clks[1]) {
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   73  		dev_err(dev, "reference clock not supplied\n");
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   74  		return -EINVAL;
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   75  	}
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   76  
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14  @77  	refclk_rate = clk_get_rate(hpriv->clks[1]);
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   78  	if ((refclk_rate % 100) != 0) {
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   79  		dev_err(dev, "reference clock rate must be divisible by 100\n");
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   80  		return -EINVAL;
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   81  	}
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   82  
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   83  	mpy = ahci_dm816_get_mpy_bits(refclk_rate);
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   84  	if (mpy < 0) {
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   85  		dev_err(dev, "can't calculate the MPY bits value\n");
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   86  		return -EINVAL;
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   87  	}
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   88  
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   89  	/* Enable the PHY and configure the first HBA port. */
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   90  	val = AHCI_DM816_PHY_MPY(mpy) | AHCI_DM816_PHY_LOS(1) |
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   91  	      AHCI_DM816_PHY_RXCDR(4) | AHCI_DM816_PHY_RXEQ(1) |
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   92  	      AHCI_DM816_PHY_TXSWING(3) | AHCI_DM816_PHY_ENPLL(1);
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   93  	writel(val, hpriv->mmio + AHCI_DM816_P0PHYCR_REG);
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   94  
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   95  	/* Configure the second HBA port. */
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   96  	val = AHCI_DM816_PHY_LOS(1) | AHCI_DM816_PHY_RXCDR(4) |
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   97  	      AHCI_DM816_PHY_RXEQ(1) | AHCI_DM816_PHY_TXSWING(3);
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   98  	writel(val, hpriv->mmio + AHCI_DM816_P1PHYCR_REG);
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14   99  
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14  100  	return 0;
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14  101  }
df46e6a4c06c89a Bartosz Golaszewski 2017-03-14  102  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
