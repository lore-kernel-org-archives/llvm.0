Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951FF12B84;
	Mon, 21 Aug 2023 21:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692654975; x=1724190975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YQEZZQZGC9GqQIFRF0CcW7I14OLHKkfD5gukpGXhlKA=;
  b=HILKGTzHon9pqsZDCSp5SCWk8T8PNEohQs9ypKp4luKM9LJFOAyJpxzG
   o4JIe5l/hh5JZPPZW2+caSurGT7JMo4ChYf06IAeUEe7ccFcIAGjdRyAZ
   0EOV7W7L0OJap8cDZgH//j92bh2cDkmfTZHiVewos1FFhIXGa/XJ/rja7
   4JJY25OtY+YcuCwQH4Id9bL47qa0tdUpJml1y5Ha94da+v9wJdpO2OwbF
   UEauiUmeo5bC7Pk5/nuh8woFWx3zFtMj9zR8/nTvKCyRikyg9xU6vpaHC
   Um++vJ56L5w9zdNmOfiCP4OCuAerkwIW6/nveUglklXYE4fCtmgoN1R0d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="363878490"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="363878490"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 14:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685809044"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="685809044"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 14:56:08 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYCrz-0000yo-0h;
	Mon, 21 Aug 2023 21:55:48 +0000
Date: Tue, 22 Aug 2023 05:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Huang Rui <ray.huang@amd.com>
Subject: [rui:upstream-fox-pvh 2/8] drivers/xen/xen-pciback/pci_stub.c:404:9:
 error: call to undeclared function 'xen_pvh_passthrough_gsi'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202308220556.Q7a2amlw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git upstream-fox-pvh
head:   d8772168691b2c723955f566a1211fba9afd19e5
commit: b6f1a467514766f7cdb4baf372a878eece68cc71 [2/8] xen/pvh: Map pirq for passthrough device on PVH dom0
config: x86_64-randconfig-072-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220556.Q7a2amlw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220556.Q7a2amlw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220556.Q7a2amlw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/xen/xen-pciback/pci_stub.c:22:
   include/xen/pci.h:12:5: warning: no previous prototype for function 'xen_reset_device' [-Wmissing-prototypes]
   int xen_reset_device(struct device *dev)
       ^
   include/xen/pci.h:12:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xen_reset_device(struct device *dev)
   ^
   static 
>> drivers/xen/xen-pciback/pci_stub.c:404:9: error: call to undeclared function 'xen_pvh_passthrough_gsi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   err = xen_pvh_passthrough_gsi(dev);
                         ^
   1 warning and 1 error generated.


vim +/xen_pvh_passthrough_gsi +404 drivers/xen/xen-pciback/pci_stub.c

   357	
   358	static int pcistub_init_device(struct pci_dev *dev)
   359	{
   360		struct xen_pcibk_dev_data *dev_data;
   361		int err = 0;
   362	
   363		dev_dbg(&dev->dev, "initializing...\n");
   364	
   365		/* The PCI backend is not intended to be a module (or to work with
   366		 * removable PCI devices (yet). If it were, xen_pcibk_config_free()
   367		 * would need to be called somewhere to free the memory allocated
   368		 * here and then to call kfree(pci_get_drvdata(psdev->dev)).
   369		 */
   370		dev_data = kzalloc(sizeof(*dev_data) +  strlen(DRV_NAME "[]")
   371					+ strlen(pci_name(dev)) + 1, GFP_KERNEL);
   372		if (!dev_data) {
   373			err = -ENOMEM;
   374			goto out;
   375		}
   376		pci_set_drvdata(dev, dev_data);
   377	
   378		/*
   379		 * Setup name for fake IRQ handler. It will only be enabled
   380		 * once the device is turned on by the guest.
   381		 */
   382		sprintf(dev_data->irq_name, DRV_NAME "[%s]", pci_name(dev));
   383	
   384		dev_dbg(&dev->dev, "initializing config\n");
   385	
   386		init_waitqueue_head(&xen_pcibk_aer_wait_queue);
   387		err = xen_pcibk_config_init_dev(dev);
   388		if (err)
   389			goto out;
   390	
   391		/* HACK: Force device (& ACPI) to determine what IRQ it's on - we
   392		 * must do this here because pcibios_enable_device may specify
   393		 * the pci device's true irq (and possibly its other resources)
   394		 * if they differ from what's in the configuration space.
   395		 * This makes the assumption that the device's resources won't
   396		 * change after this point (otherwise this code may break!)
   397		 */
   398		dev_dbg(&dev->dev, "enabling device\n");
   399		err = pci_enable_device(dev);
   400		if (err)
   401			goto config_release;
   402	
   403		if (xen_initial_domain() && xen_pvh_domain()) {
 > 404			err = xen_pvh_passthrough_gsi(dev);
   405			if (err)
   406				goto config_release;
   407		}
   408	
   409		if (dev->msix_cap) {
   410			struct physdev_pci_device ppdev = {
   411				.seg = pci_domain_nr(dev->bus),
   412				.bus = dev->bus->number,
   413				.devfn = dev->devfn
   414			};
   415	
   416			err = HYPERVISOR_physdev_op(PHYSDEVOP_prepare_msix, &ppdev);
   417			if (err && err != -ENOSYS)
   418				dev_err(&dev->dev, "MSI-X preparation failed (%d)\n",
   419					err);
   420		}
   421	
   422		/* We need the device active to save the state. */
   423		dev_dbg(&dev->dev, "save state of device\n");
   424		pci_save_state(dev);
   425		dev_data->pci_saved_state = pci_store_saved_state(dev);
   426		if (!dev_data->pci_saved_state)
   427			dev_err(&dev->dev, "Could not store PCI conf saved state!\n");
   428		else {
   429			dev_dbg(&dev->dev, "resetting (FLR, D3, etc) the device\n");
   430			__pci_reset_function_locked(dev);
   431			xen_reset_device(&dev->dev);
   432			pci_restore_state(dev);
   433		}
   434		/* Now disable the device (this also ensures some private device
   435		 * data is setup before we export)
   436		 */
   437		dev_dbg(&dev->dev, "reset device\n");
   438		xen_pcibk_reset_device(dev);
   439	
   440		pci_set_dev_assigned(dev);
   441		return 0;
   442	
   443	config_release:
   444		xen_pcibk_config_free_dev(dev);
   445	
   446	out:
   447		pci_set_drvdata(dev, NULL);
   448		kfree(dev_data);
   449		return err;
   450	}
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
