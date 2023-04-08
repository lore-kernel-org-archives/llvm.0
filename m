Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845C1101;
	Sat,  8 Apr 2023 01:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680916520; x=1712452520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ij36e70UE/LAcrcPTUAmndG4LFO7gSvO7yQfkL2jGK8=;
  b=kv5oySXvI0JGbYLfCS8AJ4pliDZfuey8fG6FvDa0KsvaZpIWsQRJvS/p
   0IuSvMpwRJcOKzE18tjFVIzWLqI7IA4aIuxOkSt+MPd2umi2TCLid+E0e
   Lq7x0lnIMbHiyKO8z74FrgzHTqqnol45cvzXOb533yc8u1bcobh6kePA4
   a/QC7qspSqqQW1YWK/8lliLsaxXQgnbb6OsepsyE+g/55nIFLm64Qn/yW
   7njqyKMVYZdWw+zXbMQM4HJMuI5Ogk4Y93gJOab/WJNykni07gyrMNaqM
   5LxhQDd55GUjtMpiSEejpUlWsde40Hxch+Wx21n6zy9ijD/THjYmAQ8+J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="322733630"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="322733630"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 18:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717994972"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="717994972"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 18:15:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkxAj-000T6v-1t;
	Sat, 08 Apr 2023 01:15:17 +0000
Date: Sat, 8 Apr 2023 09:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 12/23] drivers/cxl/core/port.c:2045:6: warning:
 variable 'devices' set but not used
Message-ID: <202304080913.dZb5ztze-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   5c305908f705279678135d3adf13cf2165c0609c
commit: 064b21698b2e5653b5547c639a895141a402edd4 [12/23] cxl: Add helper function that calculate QoS values for PCI path
config: arm-randconfig-r046-20230407 (https://download.01.org/0day-ci/archive/20230408/202304080913.dZb5ztze-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=064b21698b2e5653b5547c639a895141a402edd4
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 064b21698b2e5653b5547c639a895141a402edd4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080913.dZb5ztze-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/port.c:2045:6: warning: variable 'devices' set but not used [-Wunused-but-set-variable]
           int devices = 0;
               ^
   1 warning generated.


vim +/devices +2045 drivers/cxl/core/port.c

  2028	
  2029	/**
  2030	 * cxl_port_get_downstream_qos - retrieve QoS data for PCIE downstream path
  2031	 * @port: endpoint cxl_port
  2032	 * @bandwidth: writeback value for min bandwidth
  2033	 * @latency: writeback value for total latency
  2034	 *
  2035	 * Return: Errno on failure, 0 on success.
  2036	 */
  2037	int cxl_port_get_downstream_qos(struct cxl_port *port, u64 *bandwidth,
  2038					u64 *latency)
  2039	{
  2040		u64 min_bw = ULONG_MAX;
  2041		struct pci_dev *pdev;
  2042		struct cxl_port *p;
  2043		struct device *dev;
  2044		u64 total_lat = 0;
> 2045		int devices = 0;
  2046		u64 lat;
  2047	
  2048		/* Grab the device that is the PCI device for CXL memdev */
  2049		dev = port->uport->parent;
  2050		/* Skip if it's not PCI, most likely a cxl_test device */
  2051		if (!dev_is_pci(dev))
  2052			return 0;
  2053	
  2054		pdev = to_pci_dev(dev);
  2055		min_bw = pcie_bandwidth_available(pdev, NULL, NULL, NULL);
  2056		if (min_bw == 0)
  2057			return -ENXIO;
  2058	
  2059		/* convert to MB/s from Mb/s */
  2060		min_bw >>= 3;
  2061	
  2062		p = port;
  2063		do {
  2064			struct cxl_dport *dport;
  2065	
  2066			lat = cxl_pci_get_latency(pdev);
  2067			if (lat < 0)
  2068				return lat;
  2069	
  2070			total_lat += lat;
  2071			devices++;
  2072	
  2073			dport = p->parent_dport;
  2074			if (!dport)
  2075				break;
  2076	
  2077			p = dport->port;
  2078			dev = p->uport;
  2079			if (!dev_is_pci(dev))
  2080				break;
  2081			pdev = to_pci_dev(dev);
  2082		} while (1);
  2083	
  2084		*bandwidth = min_bw;
  2085		*latency = total_lat;
  2086		return 0;
  2087	}
  2088	EXPORT_SYMBOL_NS_GPL(cxl_port_get_downstream_qos, CXL);
  2089	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
