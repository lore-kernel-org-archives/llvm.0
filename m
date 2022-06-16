Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4723B6
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655381041; x=1686917041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2kR2Ok5bcpn2wj7M/9J9IniP7ZhPLw91TlhNNniyR9U=;
  b=auenlU9wBHdcFDQfojhfMGXnd2zpXReIPzRU6F4Hl9sB72fQQcWfegG/
   3tphgVzRjAr0HpEf/zXjUh3QwadR8u698TiJKjESYmSHmNoa5kRSVKqlH
   8rDa1tZgunB4Po85pRBhbZPJuv2AG0Cx+EUTL/yUZHeS8ixVatdRoF/cH
   Is58FUyeoEkIJpj68zBNiJYo6AB2NPzX55ior1Z2ELxm/gzaBoYbVQNyQ
   +RloZzvGKdqmZWYWhB2vGEt0KO9mhWfcwxHPrm1WdQuIxmp5AJXgsfIwM
   kM3Aaah2nfW/zjGDsBKM56rDooPp191uU6lfDstqxQiIB9e0FGylKs54D
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="262252383"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="262252383"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 05:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="674990511"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2022 05:03:58 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1oE9-000OLh-Ss;
	Thu, 16 Jun 2022 12:03:57 +0000
Date: Thu, 16 Jun 2022 20:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
Subject: drivers/bluetooth/hci_qca.c:1860:37: warning: unused variable
 'qca_soc_data_wcn6750'
Message-ID: <202206161902.21jQwI1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Venkata,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   30306f6194cadcc29c77f6ddcd416a75bf5c0232
commit: d8f97da1b92d2fe89d51c673ecf80c4016119e5c Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6750
date:   12 months ago
config: hexagon-randconfig-r041-20220616 (https://download.01.org/0day-ci/archive/20220616/202206161902.21jQwI1B-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d8f97da1b92d2fe89d51c673ecf80c4016119e5c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d8f97da1b92d2fe89d51c673ecf80c4016119e5c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/bluetooth/hci_qca.c:1821:37: warning: unused variable 'qca_soc_data_wcn3990' [-Wunused-const-variable]
   static const struct qca_device_data qca_soc_data_wcn3990 = {
                                       ^
   drivers/bluetooth/hci_qca.c:1832:37: warning: unused variable 'qca_soc_data_wcn3991' [-Wunused-const-variable]
   static const struct qca_device_data qca_soc_data_wcn3991 = {
                                       ^
   drivers/bluetooth/hci_qca.c:1844:37: warning: unused variable 'qca_soc_data_wcn3998' [-Wunused-const-variable]
   static const struct qca_device_data qca_soc_data_wcn3998 = {
                                       ^
   drivers/bluetooth/hci_qca.c:1855:37: warning: unused variable 'qca_soc_data_qca6390' [-Wunused-const-variable]
   static const struct qca_device_data qca_soc_data_qca6390 = {
                                       ^
>> drivers/bluetooth/hci_qca.c:1860:37: warning: unused variable 'qca_soc_data_wcn6750' [-Wunused-const-variable]
   static const struct qca_device_data qca_soc_data_wcn6750 = {
                                       ^
   5 warnings generated.


vim +/qca_soc_data_wcn6750 +1860 drivers/bluetooth/hci_qca.c

  1831	
> 1832	static const struct qca_device_data qca_soc_data_wcn3991 = {
  1833		.soc_type = QCA_WCN3991,
  1834		.vregs = (struct qca_vreg []) {
  1835			{ "vddio", 15000  },
  1836			{ "vddxo", 80000  },
  1837			{ "vddrf", 300000 },
  1838			{ "vddch0", 450000 },
  1839		},
  1840		.num_vregs = 4,
  1841		.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
  1842	};
  1843	
  1844	static const struct qca_device_data qca_soc_data_wcn3998 = {
  1845		.soc_type = QCA_WCN3998,
  1846		.vregs = (struct qca_vreg []) {
  1847			{ "vddio", 10000  },
  1848			{ "vddxo", 80000  },
  1849			{ "vddrf", 300000 },
  1850			{ "vddch0", 450000 },
  1851		},
  1852		.num_vregs = 4,
  1853	};
  1854	
  1855	static const struct qca_device_data qca_soc_data_qca6390 = {
  1856		.soc_type = QCA_QCA6390,
  1857		.num_vregs = 0,
  1858	};
  1859	
> 1860	static const struct qca_device_data qca_soc_data_wcn6750 = {
  1861		.soc_type = QCA_WCN6750,
  1862		.vregs = (struct qca_vreg []) {
  1863			{ "vddio", 5000 },
  1864			{ "vddaon", 26000 },
  1865			{ "vddbtcxmx", 126000 },
  1866			{ "vddrfacmn", 12500 },
  1867			{ "vddrfa0p8", 102000 },
  1868			{ "vddrfa1p7", 302000 },
  1869			{ "vddrfa1p2", 257000 },
  1870			{ "vddrfa2p2", 1700000 },
  1871			{ "vddasd", 200 },
  1872		},
  1873		.num_vregs = 9,
  1874		.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
  1875	};
  1876	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
