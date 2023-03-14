Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02617C6;
	Tue, 14 Mar 2023 03:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678765587; x=1710301587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ZQkvLBzEIFEJyZVe/6vqIMB8LLap8uGfbB1iaKfi+0=;
  b=cmEZyFwauN2DqHtGo02SX2HyCAbiL6ajZhV0UDOaKtDX+fl3tzaSsQbg
   ezQ0iERJz4+jdUtJ91Tqf4Qa2nIsJaAy7xywMSlJfV6oMwhXlUVoJtEQJ
   7v49Hb381ryUg1/A7bd10i/mVB6Fw5z1cSlUOiqtSUat+EmkW36kJro5m
   ChdYN1SiykbzycPWzDmbAMY6BNe1OmvTpwakZmvSW4VbILedJRS4zQ7An
   MHbNsuVSQ7wK0pPhw3x96GcYqbXW+XVu2/+P1hSK4iVDHdu8FuMwOG2G+
   GIsPE6pP1YA9XQCdv1u6YwYzlmvNdvNSMOFYLX9jVvXHPGyduKSZIOh4o
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334800584"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="334800584"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 20:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747849509"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="747849509"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 20:46:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbvc3-0006Tk-1J;
	Tue, 14 Mar 2023 03:46:11 +0000
Date: Tue, 14 Mar 2023 11:45:51 +0800
From: kernel test robot <lkp@intel.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>, outreachy@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: initialize timeouts in probe only
Message-ID: <202303141159.6wN9HNP9-lkp@intel.com>
References: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZA9mThZ7NyRrQAMX@khadija-virtual-machine>

Hi Khadija,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Khadija-Kamran/staging-axis-fifo-initialize-timeouts-in-probe-only/20230314-020827
patch link:    https://lore.kernel.org/r/ZA9mThZ7NyRrQAMX%40khadija-virtual-machine
patch subject: [PATCH] staging: axis-fifo: initialize timeouts in probe only
config: arm64-randconfig-r012-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141159.6wN9HNP9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/9d186f6c9f9bf467b48da3e28b0e9aa31fc3faf3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Khadija-Kamran/staging-axis-fifo-initialize-timeouts-in-probe-only/20230314-020827
        git checkout 9d186f6c9f9bf467b48da3e28b0e9aa31fc3faf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/staging/axis-fifo/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141159.6wN9HNP9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/axis-fifo/axis-fifo.c:817:18: warning: implicit conversion from 'long' to 'int' changes value from 9223372036854775807 to -1 [-Wconstant-conversion]
                   read_timeout = MAX_SCHEDULE_TIMEOUT;
                                ~ ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:296:31: note: expanded from macro 'MAX_SCHEDULE_TIMEOUT'
   #define MAX_SCHEDULE_TIMEOUT            LONG_MAX
                                           ^~~~~~~~
   include/vdso/limits.h:11:19: note: expanded from macro 'LONG_MAX'
   #define LONG_MAX        ((long)(~0UL >> 1))
                            ^~~~~~~~~~~~~~~~~
   drivers/staging/axis-fifo/axis-fifo.c:822:19: warning: implicit conversion from 'long' to 'int' changes value from 9223372036854775807 to -1 [-Wconstant-conversion]
                   write_timeout = MAX_SCHEDULE_TIMEOUT;
                                 ~ ^~~~~~~~~~~~~~~~~~~~
   include/linux/sched.h:296:31: note: expanded from macro 'MAX_SCHEDULE_TIMEOUT'
   #define MAX_SCHEDULE_TIMEOUT            LONG_MAX
                                           ^~~~~~~~
   include/vdso/limits.h:11:19: note: expanded from macro 'LONG_MAX'
   #define LONG_MAX        ((long)(~0UL >> 1))
                            ^~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +817 drivers/staging/axis-fifo/axis-fifo.c

   805	
   806	static int axis_fifo_probe(struct platform_device *pdev)
   807	{
   808		struct resource *r_mem; /* IO mem resources */
   809		struct device *dev = &pdev->dev; /* OS device (from device tree) */
   810		struct axis_fifo *fifo = NULL;
   811		char *device_name;
   812		int rc = 0; /* error return value */
   813	
   814		if (read_timeout >= 0)
   815			read_timeout = msecs_to_jiffies(read_timeout);
   816		else
 > 817			read_timeout = MAX_SCHEDULE_TIMEOUT;
   818	
   819		if (write_timeout >= 0)
   820			write_timeout = msecs_to_jiffies(write_timeout);
   821		else
   822			write_timeout = MAX_SCHEDULE_TIMEOUT;
   823	
   824		/* ----------------------------
   825		 *     init wrapper device
   826		 * ----------------------------
   827		 */
   828	
   829		device_name = devm_kzalloc(dev, 32, GFP_KERNEL);
   830		if (!device_name)
   831			return -ENOMEM;
   832	
   833		/* allocate device wrapper memory */
   834		fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
   835		if (!fifo)
   836			return -ENOMEM;
   837	
   838		dev_set_drvdata(dev, fifo);
   839		fifo->dt_device = dev;
   840	
   841		init_waitqueue_head(&fifo->read_queue);
   842		init_waitqueue_head(&fifo->write_queue);
   843	
   844		mutex_init(&fifo->read_lock);
   845		mutex_init(&fifo->write_lock);
   846	
   847		/* ----------------------------
   848		 *   init device memory space
   849		 * ----------------------------
   850		 */
   851	
   852		/* get iospace for the device */
   853		r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   854		if (!r_mem) {
   855			dev_err(fifo->dt_device, "invalid address\n");
   856			rc = -ENODEV;
   857			goto err_initial;
   858		}
   859	
   860		/* request physical memory */
   861		fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
   862		if (IS_ERR(fifo->base_addr)) {
   863			rc = PTR_ERR(fifo->base_addr);
   864			goto err_initial;
   865		}
   866	
   867		dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
   868	
   869		/* create unique device name */
   870		snprintf(device_name, 32, "%s_%pa", DRIVER_NAME, &r_mem->start);
   871		dev_dbg(fifo->dt_device, "device name [%s]\n", device_name);
   872	
   873		/* ----------------------------
   874		 *          init IP
   875		 * ----------------------------
   876		 */
   877	
   878		rc = axis_fifo_parse_dt(fifo);
   879		if (rc)
   880			goto err_initial;
   881	
   882		reset_ip_core(fifo);
   883	
   884		/* ----------------------------
   885		 *    init device interrupts
   886		 * ----------------------------
   887		 */
   888	
   889		/* get IRQ resource */
   890		rc = platform_get_irq(pdev, 0);
   891		if (rc < 0)
   892			goto err_initial;
   893	
   894		/* request IRQ */
   895		fifo->irq = rc;
   896		rc = devm_request_irq(fifo->dt_device, fifo->irq, &axis_fifo_irq, 0,
   897				      DRIVER_NAME, fifo);
   898		if (rc) {
   899			dev_err(fifo->dt_device, "couldn't allocate interrupt %i\n",
   900				fifo->irq);
   901			goto err_initial;
   902		}
   903	
   904		/* ----------------------------
   905		 *      init char device
   906		 * ----------------------------
   907		 */
   908	
   909		/* create character device */
   910		fifo->miscdev.fops = &fops;
   911		fifo->miscdev.minor = MISC_DYNAMIC_MINOR;
   912		fifo->miscdev.name = device_name;
   913		fifo->miscdev.groups = axis_fifo_attrs_groups;
   914		fifo->miscdev.parent = dev;
   915		rc = misc_register(&fifo->miscdev);
   916		if (rc < 0)
   917			goto err_initial;
   918	
   919		dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%pa, irq=%i\n",
   920			 &r_mem->start, &fifo->base_addr, fifo->irq);
   921	
   922		return 0;
   923	
   924	err_initial:
   925		dev_set_drvdata(dev, NULL);
   926		return rc;
   927	}
   928	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
