Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB702CA4
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643705672; x=1675241672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FlPTRlUY6HfQlQJg8e/Zs1h1lIDW4JQiYU0jWx1Hv/8=;
  b=fKxRBA1reuGGuERyy8PnDOGSrypu4FtLZCP4eWOum1ZAlP3+ujxBGd3h
   kbRkRV7tzgzY6m84D7Y+VpzwriNzMSPnNFu4chfOKLalRMaIjcV4+HYIw
   olfddITautMLy7vIYnbd4Z/eViXkWkm74m3ilnNF0RPPxH/dU42ig9oCQ
   oH7Zc91BzDr27XodukfGIpYwI61qENso/x2mAN+9HSE/GbeDL0igjZc3b
   JqkhYoxmxL8oLrixa5ViS1GgD7VwltfDnPcnpwVy9uIapYrIPqrCD4k4E
   0liIi9nQ1zzHVPq+j8+NqzsR+eo5+f6ksj9E67YAtM/RZopv5NvMttKik
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="272123940"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="272123940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 00:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="582965208"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Feb 2022 00:54:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEovk-000T2V-1a; Tue, 01 Feb 2022 08:54:28 +0000
Date: Tue, 1 Feb 2022 16:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/irq_chip_ro 12/20]
 drivers/gpio/gpio-omap.c:716:41: error: member reference type 'struct
 gpio_chip' is not a pointer; did you mean to use '.'?
Message-ID: <202202011652.44VOL7NK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/irq_chip_ro
head:   218869493fda68e8c327a6484f5a6973a3008729
commit: bb36fd119ef0dcee7e0e7e5f9fd11d5221bf5f73 [12/20] gpio: omap: Switch to dynamic chip name output
config: arm-randconfig-r002-20220131 (https://download.01.org/0day-ci/archive/20220201/202202011652.44VOL7NK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=bb36fd119ef0dcee7e0e7e5f9fd11d5221bf5f73
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/irq_chip_ro
        git checkout bb36fd119ef0dcee7e0e7e5f9fd11d5221bf5f73
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-omap.c:716:41: error: member reference type 'struct gpio_chip' is not a pointer; did you mean to use '.'?
           seq_printf(p, "%s", dev_name(bank->chip->dev));
                                        ~~~~~~~~~~^~
                                                  .
>> drivers/gpio/gpio-omap.c:716:43: error: no member named 'dev' in 'struct gpio_chip'
           seq_printf(p, "%s", dev_name(bank->chip->dev));
                                        ~~~~~~~~~~  ^
   2 errors generated.


vim +716 drivers/gpio/gpio-omap.c

   711	
   712	static void omap_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
   713	{
   714		struct gpio_bank *bank = omap_irq_data_get_bank(d);
   715	
 > 716		seq_printf(p, "%s", dev_name(bank->chip->dev));
   717	}
   718	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
