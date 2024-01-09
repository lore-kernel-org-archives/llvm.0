Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198FE15A7;
	Tue,  9 Jan 2024 05:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCgSSTrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704777439; x=1736313439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlxyczwCIKfgcTVqaDOLvj5sTxVl58CdAIE7qNApbjs=;
  b=BCgSSTrbbevlT+VRkkJpKcJ1ZLa9WhiN1pN3DMnTXeL4A7O+vU7papuh
   RYlJD74f4CjK8+efs0f0yCkCaaUtryKvqyk1A7mQKmCt6FP2vCcxNB/FK
   Z4Ly24uJs+WyeZzn5TnqtXmuRnZCkfkTh1F//NHixlO4prCbf+iumZPpp
   LOhrMam6uAT5aq91Pb8C++jUdqgOwpUAgm+4Iv8FX9J6jc4LmilrQ/lQK
   thzfFJICVls/fmu7idSQr+C4xvMwiQoeNLCTU+S5Kheumk0hAY4oR6c25
   5PFS8BUytKMMwzjDdcM0V4Mo36OW9lp8jrgc1StSnFrpflS5noJXcLOca
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="462366169"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="462366169"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 21:17:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="905027540"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="905027540"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Jan 2024 21:17:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN4UE-0005V8-2O;
	Tue, 09 Jan 2024 05:17:14 +0000
Date: Tue, 9 Jan 2024 13:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5 55/69]
 drivers/net/wireless/intel/iwlwifi/pcie/drv.c:38:34: error: use of
 undeclared identifier 'iwl5100_agn_cfg'
Message-ID: <202401091315.dZ40T5sg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5
head:   9a1b32d1e9cff80526cab2834f9dfd7609d9c627
commit: 93a3c02830e001c30586795dc8bbdae0498ea50a [55/69] f
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240109/202401091315.dZ40T5sg-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091315.dZ40T5sg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401091315.dZ40T5sg-lkp@intel.com/

Note: the iwlwifi-next/egrumbac_fixes_6.5 HEAD 9a1b32d1e9cff80526cab2834f9dfd7609d9c627 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:38:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
      38 |         {IWL_PCI_DEVICE(0x4232, 0x1201, iwl5100_agn_cfg)}, /* Mini Card */
         |                                         ^
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:38:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:39:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
      39 |         {IWL_PCI_DEVICE(0x4232, 0x1301, iwl5100_agn_cfg)}, /* Half Mini Card */
         |                                         ^
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:39:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:40:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
      40 |         {IWL_PCI_DEVICE(0x4232, 0x1204, iwl5100_agn_cfg)}, /* Mini Card */
         |                                         ^
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:40:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:41:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
      41 |         {IWL_PCI_DEVICE(0x4232, 0x1304, iwl5100_agn_cfg)}, /* Half Mini Card */
         |                                         ^
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:41:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:42:34: error: use of undeclared identifier 'iwl5100_bgn_cfg'
      42 |         {IWL_PCI_DEVICE(0x4232, 0x1205, iwl5100_bgn_cfg)}, /* Mini Card */
         |                                         ^
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:42:34: error: use of undeclared identifier 'iwl5100_bgn_cfg'
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:43:34: error: use of undeclared identifier 'iwl5100_bgn_cfg'
      43 |         {IWL_PCI_DEVICE(0x4232, 0x1305, iwl5100_bgn_cfg)}, /* Half Mini Card */
         |                                         ^
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:43:34: error: use of undeclared identifier 'iwl5100_bgn_cfg'
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:44:34: error: use of undeclared identifier 'iwl5100_abg_cfg'
      44 |         {IWL_PCI_DEVICE(0x4232, 0x1206, iwl5100_abg_cfg)}, /* Mini Card */
         |                                         ^
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:44:34: error: use of undeclared identifier 'iwl5100_abg_cfg'
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:45:34: error: use of undeclared identifier 'iwl5100_abg_cfg'
      45 |         {IWL_PCI_DEVICE(0x4232, 0x1306, iwl5100_abg_cfg)}, /* Half Mini Card */
         |                                         ^
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:45:34: error: use of undeclared identifier 'iwl5100_abg_cfg'
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:46:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
      46 |         {IWL_PCI_DEVICE(0x4232, 0x1221, iwl5100_agn_cfg)}, /* Mini Card */
         |                                         ^
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:46:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
   drivers/net/wireless/intel/iwlwifi/pcie/drv.c:47:34: error: use of undeclared identifier 'iwl5100_agn_cfg'
      47 |         {IWL_PCI_DEVICE(0x4232, 0x1321, iwl5100_agn_cfg)}, /* Half Mini Card */
         |                                         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/iwl5100_agn_cfg +38 drivers/net/wireless/intel/iwlwifi/pcie/drv.c

48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30  29  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  30  #define IWL_PCI_DEVICE(dev, subdev, cfg) \
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  31  	.vendor = PCI_VENDOR_ID_INTEL,  .device = (dev), \
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  32  	.subvendor = PCI_ANY_ID, .subdevice = (subdev), \
48a5494d6a4cb5 drivers/net/wireless/intel/iwlwifi/pcie/drv.c Johannes Berg     2021-03-30  33  	.driver_data = _ASSIGN_CFG(cfg)
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  34  
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  35  /* Hardware specific file defines the PCI IDs table for that hardware module */
9baa3c34ac4e27 drivers/net/wireless/iwlwifi/pcie/drv.c       Benoit Taine      2014-08-08  36  static const struct pci_device_id iwl_hw_card_ids[] = {
4f25bbdb160e43 drivers/net/wireless/iwlwifi/pcie/drv.c       Johannes Berg     2013-06-10  37  #if IS_ENABLED(CONFIG_IWLDVM)
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @38  	{IWL_PCI_DEVICE(0x4232, 0x1201, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  39  	{IWL_PCI_DEVICE(0x4232, 0x1301, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  40  	{IWL_PCI_DEVICE(0x4232, 0x1204, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  41  	{IWL_PCI_DEVICE(0x4232, 0x1304, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @42  	{IWL_PCI_DEVICE(0x4232, 0x1205, iwl5100_bgn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  43  	{IWL_PCI_DEVICE(0x4232, 0x1305, iwl5100_bgn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24 @44  	{IWL_PCI_DEVICE(0x4232, 0x1206, iwl5100_abg_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  45  	{IWL_PCI_DEVICE(0x4232, 0x1306, iwl5100_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  46  	{IWL_PCI_DEVICE(0x4232, 0x1221, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  47  	{IWL_PCI_DEVICE(0x4232, 0x1321, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  48  	{IWL_PCI_DEVICE(0x4232, 0x1224, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  49  	{IWL_PCI_DEVICE(0x4232, 0x1324, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  50  	{IWL_PCI_DEVICE(0x4232, 0x1225, iwl5100_bgn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  51  	{IWL_PCI_DEVICE(0x4232, 0x1325, iwl5100_bgn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  52  	{IWL_PCI_DEVICE(0x4232, 0x1226, iwl5100_abg_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  53  	{IWL_PCI_DEVICE(0x4232, 0x1326, iwl5100_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  54  	{IWL_PCI_DEVICE(0x4237, 0x1211, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  55  	{IWL_PCI_DEVICE(0x4237, 0x1311, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  56  	{IWL_PCI_DEVICE(0x4237, 0x1214, iwl5100_agn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  57  	{IWL_PCI_DEVICE(0x4237, 0x1314, iwl5100_agn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  58  	{IWL_PCI_DEVICE(0x4237, 0x1215, iwl5100_bgn_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  59  	{IWL_PCI_DEVICE(0x4237, 0x1315, iwl5100_bgn_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  60  	{IWL_PCI_DEVICE(0x4237, 0x1216, iwl5100_abg_cfg)}, /* Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  61  	{IWL_PCI_DEVICE(0x4237, 0x1316, iwl5100_abg_cfg)}, /* Half Mini Card */
48d1a2110ad9cb drivers/net/wireless/iwlwifi/iwl-pci.c        Emmanuel Grumbach 2011-05-24  62  

:::::: The code at line 38 was first introduced by commit
:::::: 48d1a2110ad9cb86e5cb0d790729824fa3cca83b iwlagn: add a iwl_pci.[ch] files that will contain all PCI specific code

:::::: TO: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
:::::: CC: Wey-Yi Guy <wey-yi.w.guy@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
