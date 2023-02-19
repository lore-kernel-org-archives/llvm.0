Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469652918;
	Sun, 19 Feb 2023 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676831865; x=1708367865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6QlAUGOuAgr2slOibcIwrjZ9JeFFJV2DBywj9VmnSE=;
  b=n8MUDSKwhGJscAYmjvASvElllLcsImc0d19Ts7bSxU6Zc5dTlqcliHlD
   S8TDJKw4YTPNv3oDm4Wv6Pkb0OwIdGGUyM3lZ5zumMeJxt1GHnR1OZRbg
   AQ+aDECZlvC2TSvw+txCWGv/mcP1Uxbv0S+2Uhmh6svn+bMnbmcy+S7z6
   zNqPKFOjeFIjEI/7q3fXO+Wt66RS6KmLjKn87haJfBIjCVhwTU1pdyJdX
   kbmtn7lZEjxgAdIMPMqSYO78Y3s8/W3l+pwwYVT677eotBhmZM+Q1lOCQ
   1ePcItTSZsfvRpnMRC+6OBouZAAYsQOg8fLlQYtb+d77D99cCVApuKwFK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="311906653"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="311906653"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 10:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="734911728"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="734911728"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Feb 2023 10:37:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pToZB-000DPb-1A;
	Sun, 19 Feb 2023 18:37:41 +0000
Date: Mon, 20 Feb 2023 02:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 14/54] drivers/thunderbolt/acpi.c:31:23:
 error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
Message-ID: <202302200218.V2EGsADq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: f931e8ca0730986230243c7db38a5e60d9dc9ab7 [14/54] thunderbolt: Remove pci_dev from struct tb_nhi
config: x86_64-randconfig-r025-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200218.V2EGsADq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/f931e8ca0730986230243c7db38a5e60d9dc9ab7
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout f931e8ca0730986230243c7db38a5e60d9dc9ab7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/thunderbolt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200218.V2EGsADq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thunderbolt/acpi.c:31:23: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
           if (dev_fwnode(&nhi->pdev->dev) != fwnode)
                                ^~~~
                                dev
   include/linux/property.h:39:12: note: expanded from macro 'dev_fwnode'
           _Generic((dev),                                                 \
                     ^
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
>> drivers/thunderbolt/acpi.c:31:29: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
           if (dev_fwnode(&nhi->pdev->dev) != fwnode)
                                      ^~~
                                      devt
   include/linux/property.h:39:12: note: expanded from macro 'dev_fwnode'
           _Generic((dev),                                                 \
                     ^
   include/linux/device.h:622:10: note: 'devt' declared here
           dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
                                   ^
>> drivers/thunderbolt/acpi.c:31:17: error: controlling expression type 'dev_t *' (aka 'unsigned int *') not compatible with any generic association type
           if (dev_fwnode(&nhi->pdev->dev) != fwnode)
                          ^~~~~~~~~~~~~~~
   include/linux/property.h:39:12: note: expanded from macro 'dev_fwnode'
           _Generic((dev),                                                 \
                     ^~~
>> drivers/thunderbolt/acpi.c:31:23: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
           if (dev_fwnode(&nhi->pdev->dev) != fwnode)
                                ^~~~
                                dev
   include/linux/property.h:41:35: note: expanded from macro 'dev_fwnode'
                    struct device *: __dev_fwnode)(dev)
                                                   ^
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
>> drivers/thunderbolt/acpi.c:31:29: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
           if (dev_fwnode(&nhi->pdev->dev) != fwnode)
                                      ^~~
                                      devt
   include/linux/property.h:41:35: note: expanded from macro 'dev_fwnode'
                    struct device *: __dev_fwnode)(dev)
                                                   ^
   include/linux/device.h:622:10: note: 'devt' declared here
           dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
                                   ^
   drivers/thunderbolt/acpi.c:83:44: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
                   link = device_link_add(&pdev->dev, &nhi->pdev->dev,
                                                            ^~~~
                                                            dev
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
   drivers/thunderbolt/acpi.c:83:50: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
                   link = device_link_add(&pdev->dev, &nhi->pdev->dev,
                                                                  ^~~
                                                                  devt
   include/linux/device.h:622:10: note: 'devt' declared here
           dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
                                   ^
   drivers/thunderbolt/acpi.c:88:18: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
                           dev_dbg(&nhi->pdev->dev, "created link from %s\n",
                                         ^~~~
                                         dev
   include/linux/dev_printk.h:163:26: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                          ^
   include/linux/dev_printk.h:129:22: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                      ^
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
   drivers/thunderbolt/acpi.c:88:24: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
                           dev_dbg(&nhi->pdev->dev, "created link from %s\n",
                                               ^~~
                                               devt
   include/linux/dev_printk.h:163:26: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                          ^
   include/linux/dev_printk.h:129:22: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                      ^
   include/linux/device.h:622:10: note: 'devt' declared here
           dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
                                   ^
   drivers/thunderbolt/acpi.c:91:19: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
                           dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
                                          ^~~~
                                          dev
   include/linux/dev_printk.h:146:49: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                          ^
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
   drivers/thunderbolt/acpi.c:91:25: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
                           dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
                                                ^~~
                                                devt
   include/linux/dev_printk.h:146:49: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                          ^
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^
   include/linux/device.h:622:10: note: 'devt' declared here
           dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
                                   ^
   drivers/thunderbolt/acpi.c:115:32: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
           if (!has_acpi_companion(&nhi->pdev->dev))
                                         ^~~~
                                         dev
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
   drivers/thunderbolt/acpi.c:115:38: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
           if (!has_acpi_companion(&nhi->pdev->dev))
                                               ^~~
                                               devt
   include/linux/device.h:622:10: note: 'devt' declared here
           dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
                                   ^
   drivers/thunderbolt/acpi.c:125:18: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
                   dev_warn(&nhi->pdev->dev, "failed to enumerate tunneled ports\n");
                                  ^~~~
                                  dev
   include/linux/dev_printk.h:146:49: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                          ^
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
   drivers/thunderbolt/acpi.c:125:24: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
                   dev_warn(&nhi->pdev->dev, "failed to enumerate tunneled ports\n");
                                        ^~~
                                        devt
   include/linux/dev_printk.h:146:49: note: expanded from macro 'dev_warn'
           dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                          ^
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^
   include/linux/device.h:622:10: note: 'devt' declared here
           dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
                                   ^
   drivers/thunderbolt/acpi.c:322:38: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
                   parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
                                                      ^~~~
                                                      dev
   include/linux/acpi.h:43:51: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
                                                                ^
   include/acpi/acpi_bus.h:417:10: note: expanded from macro 'to_acpi_device_node'
                   typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
                          ^
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
   drivers/thunderbolt/acpi.c:322:44: error: no member named 'dev' in 'struct device'; did you mean 'devt'?
                   parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
                                                            ^~~
                                                            devt
   include/linux/acpi.h:43:51: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
                                                                ^
   include/acpi/acpi_bus.h:417:10: note: expanded from macro 'to_acpi_device_node'
                   typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
                          ^
   include/linux/device.h:622:10: note: 'devt' declared here
           dev_t                   devt;   /* dev_t, creates the sysfs "dev" */
                                   ^
>> drivers/thunderbolt/acpi.c:322:17: error: member reference base type 'dev_t' (aka 'unsigned int') is not a structure or union
                   parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:43:55: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
                                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/acpi/acpi_bus.h:417:10: note: expanded from macro 'to_acpi_device_node'
                   typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
                          ^~~~~~~~
   drivers/thunderbolt/acpi.c:322:38: error: no member named 'pdev' in 'struct tb_nhi'; did you mean 'dev'?
                   parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
                                                      ^~~~
                                                      dev
   include/linux/acpi.h:43:51: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnode)
                                                                ^
   include/acpi/acpi_bus.h:417:51: note: expanded from macro 'to_acpi_device_node'
                   typeof(__fwnode) __to_acpi_device_node_fwnode = __fwnode; \
                                                                   ^
   include/linux/thunderbolt.h:479:17: note: 'dev' declared here
           struct device *dev;
                          ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +31 drivers/thunderbolt/acpi.c

b2be2b05cf3b1c Mika Westerberg   2019-04-02   13  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   14  static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
b2be2b05cf3b1c Mika Westerberg   2019-04-02   15  				    void **return_value)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   16  {
7f7b571becf373 Rafael J. Wysocki 2022-02-01   17  	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   18  	struct fwnode_handle *fwnode;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   19  	struct tb_nhi *nhi = data;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   20  	struct pci_dev *pdev;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   21  	struct device *dev;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   22  
7f7b571becf373 Rafael J. Wysocki 2022-02-01   23  	if (!adev)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   24  		return AE_OK;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   25  
2ae18cc2269fc2 Heikki Krogerus   2022-10-24   26  	fwnode = fwnode_find_reference(acpi_fwnode_handle(adev), "usb4-host-interface", 0);
2ae18cc2269fc2 Heikki Krogerus   2022-10-24   27  	if (IS_ERR(fwnode))
b2be2b05cf3b1c Mika Westerberg   2019-04-02   28  		return AE_OK;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   29  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   30  	/* It needs to reference this NHI */
2ae18cc2269fc2 Heikki Krogerus   2022-10-24  @31  	if (dev_fwnode(&nhi->pdev->dev) != fwnode)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   32  		goto out_put;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   33  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   34  	/*
b2be2b05cf3b1c Mika Westerberg   2019-04-02   35  	 * Try to find physical device walking upwards to the hierarcy.
b2be2b05cf3b1c Mika Westerberg   2019-04-02   36  	 * We need to do this because the xHCI driver might not yet be
b2be2b05cf3b1c Mika Westerberg   2019-04-02   37  	 * bound so the USB3 SuperSpeed ports are not yet created.
b2be2b05cf3b1c Mika Westerberg   2019-04-02   38  	 */
b2be2b05cf3b1c Mika Westerberg   2019-04-02   39  	dev = acpi_get_first_physical_node(adev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   40  	while (!dev) {
62fcb99bdf10fe Rafael J. Wysocki 2022-08-24   41  		adev = acpi_dev_parent(adev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   42  		if (!adev)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   43  			break;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   44  		dev = acpi_get_first_physical_node(adev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   45  	}
b2be2b05cf3b1c Mika Westerberg   2019-04-02   46  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   47  	if (!dev)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   48  		goto out_put;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   49  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   50  	/*
b2be2b05cf3b1c Mika Westerberg   2019-04-02   51  	 * Check that the device is PCIe. This is because USB3
b2be2b05cf3b1c Mika Westerberg   2019-04-02   52  	 * SuperSpeed ports have this property and they are not power
b2be2b05cf3b1c Mika Westerberg   2019-04-02   53  	 * managed with the xHCI and the SuperSpeed hub so we create the
b2be2b05cf3b1c Mika Westerberg   2019-04-02   54  	 * link from xHCI instead.
b2be2b05cf3b1c Mika Westerberg   2019-04-02   55  	 */
4d395c5e74398f Mario Limonciello 2020-10-26   56  	while (dev && !dev_is_pci(dev))
b2be2b05cf3b1c Mika Westerberg   2019-04-02   57  		dev = dev->parent;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   58  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   59  	if (!dev)
b2be2b05cf3b1c Mika Westerberg   2019-04-02   60  		goto out_put;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   61  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   62  	/*
b2be2b05cf3b1c Mika Westerberg   2019-04-02   63  	 * Check that this actually matches the type of device we
b2be2b05cf3b1c Mika Westerberg   2019-04-02   64  	 * expect. It should either be xHCI or PCIe root/downstream
b2be2b05cf3b1c Mika Westerberg   2019-04-02   65  	 * port.
b2be2b05cf3b1c Mika Westerberg   2019-04-02   66  	 */
b2be2b05cf3b1c Mika Westerberg   2019-04-02   67  	pdev = to_pci_dev(dev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   68  	if (pdev->class == PCI_CLASS_SERIAL_USB_XHCI ||
b2be2b05cf3b1c Mika Westerberg   2019-04-02   69  	    (pci_is_pcie(pdev) &&
b2be2b05cf3b1c Mika Westerberg   2019-04-02   70  		(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT ||
b2be2b05cf3b1c Mika Westerberg   2019-04-02   71  		 pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM))) {
b2be2b05cf3b1c Mika Westerberg   2019-04-02   72  		const struct device_link *link;
b2be2b05cf3b1c Mika Westerberg   2019-04-02   73  
f3380cac0c0b3a Mika Westerberg   2021-11-14   74  		/*
f3380cac0c0b3a Mika Westerberg   2021-11-14   75  		 * Make them both active first to make sure the NHI does
f3380cac0c0b3a Mika Westerberg   2021-11-14   76  		 * not runtime suspend before the consumer. The
f3380cac0c0b3a Mika Westerberg   2021-11-14   77  		 * pm_runtime_put() below then allows the consumer to
f3380cac0c0b3a Mika Westerberg   2021-11-14   78  		 * runtime suspend again (which then allows NHI runtime
f3380cac0c0b3a Mika Westerberg   2021-11-14   79  		 * suspend too now that the device link is established).
f3380cac0c0b3a Mika Westerberg   2021-11-14   80  		 */
f3380cac0c0b3a Mika Westerberg   2021-11-14   81  		pm_runtime_get_sync(&pdev->dev);
f3380cac0c0b3a Mika Westerberg   2021-11-14   82  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   83  		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
b2be2b05cf3b1c Mika Westerberg   2019-04-02   84  				       DL_FLAG_AUTOREMOVE_SUPPLIER |
f3380cac0c0b3a Mika Westerberg   2021-11-14   85  				       DL_FLAG_RPM_ACTIVE |
b2be2b05cf3b1c Mika Westerberg   2019-04-02   86  				       DL_FLAG_PM_RUNTIME);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   87  		if (link) {
b2be2b05cf3b1c Mika Westerberg   2019-04-02   88  			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
b2be2b05cf3b1c Mika Westerberg   2019-04-02   89  				dev_name(&pdev->dev));
b2be2b05cf3b1c Mika Westerberg   2019-04-02   90  		} else {
b2be2b05cf3b1c Mika Westerberg   2019-04-02   91  			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
b2be2b05cf3b1c Mika Westerberg   2019-04-02   92  				 dev_name(&pdev->dev));
b2be2b05cf3b1c Mika Westerberg   2019-04-02   93  		}
f3380cac0c0b3a Mika Westerberg   2021-11-14   94  
f3380cac0c0b3a Mika Westerberg   2021-11-14   95  		pm_runtime_put(&pdev->dev);
b2be2b05cf3b1c Mika Westerberg   2019-04-02   96  	}
b2be2b05cf3b1c Mika Westerberg   2019-04-02   97  
b2be2b05cf3b1c Mika Westerberg   2019-04-02   98  out_put:
2ae18cc2269fc2 Heikki Krogerus   2022-10-24   99  	fwnode_handle_put(fwnode);
b2be2b05cf3b1c Mika Westerberg   2019-04-02  100  	return AE_OK;
b2be2b05cf3b1c Mika Westerberg   2019-04-02  101  }
b2be2b05cf3b1c Mika Westerberg   2019-04-02  102  

:::::: The code at line 31 was first introduced by commit
:::::: 2ae18cc2269fc2d05d36bf44a8daa4404fa11dde thunderbolt: ACPI: Use the helper fwnode_find_reference()

:::::: TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
