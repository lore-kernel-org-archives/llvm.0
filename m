Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DD548DB
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646745389; x=1678281389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4EtijkSByfPN6vGzVZPpcUjpnUARU+7UdBKvz4mo6dk=;
  b=AASTZBOQv0XI5tbhaL9BP+9t/mRJMneIAFL/qm/F6i3qQAV7IXo0lSCM
   LgNryhk+T4DtOEeyW3Et/V/CHo3jnpSF7zwMseuXYrvvdDf2t5gGD7pwV
   kT816us9JNIYGTpeVhMnTuMcYLxajfs5pa8oF7zC3Ze9Nm27DbNf6bLHL
   QybbWI124lkQwcmjY9HJn9scRwbDh9xA6+lQdso4T+cGtHfb8Dqb2XKib
   4p/WczcwIEeWV9khK7KkynJOFDJtBa0RsASjRtOiB1G08eywdqI3xTRvX
   y6Pb/u/6i7pncdszV01CtjjVa8jpZGK31GfuOOLwwyCnNg79QsshtounH
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="317907734"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="317907734"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 05:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="495447092"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2022 05:16:24 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRZhP-0001R2-MO; Tue, 08 Mar 2022 13:16:23 +0000
Date: Tue, 8 Mar 2022 21:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jamie Iles <quic_jiles@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 10020/11353] drivers/i3c/master.c:2200:3:
 warning: variable 'i2cdev' is uninitialized when used here
Message-ID: <202203082147.hks5e2ec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cb153b68ff91cbc434f3de70ac549e110543e1bb
commit: 31b9887c7258ca47d9c665a80f19f006c86756b1 [10020/11353] i3c: remove i2c board info from i2c_dev_desc
config: hexagon-randconfig-r041-20220307 (https://download.01.org/0day-ci/archive/20220308/202203082147.hks5e2ec-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=31b9887c7258ca47d9c665a80f19f006c86756b1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 31b9887c7258ca47d9c665a80f19f006c86756b1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/i3c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i3c/master.c:2200:3: warning: variable 'i2cdev' is uninitialized when used here [-Wuninitialized]
                   i2cdev->dev = i2c_new_client_device(adap, &i2cboardinfo->base);
                   ^~~~~~
   drivers/i3c/master.c:2178:29: note: initialize the variable 'i2cdev' to silence this warning
           struct i2c_dev_desc *i2cdev;
                                      ^
                                       = NULL
   1 warning generated.


vim +/i2cdev +2200 drivers/i3c/master.c

  2174	
  2175	static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
  2176	{
  2177		struct i2c_adapter *adap = i3c_master_to_i2c_adapter(master);
  2178		struct i2c_dev_desc *i2cdev;
  2179		struct i2c_dev_boardinfo *i2cboardinfo;
  2180		int ret;
  2181	
  2182		adap->dev.parent = master->dev.parent;
  2183		adap->owner = master->dev.parent->driver->owner;
  2184		adap->algo = &i3c_master_i2c_algo;
  2185		strncpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
  2186	
  2187		/* FIXME: Should we allow i3c masters to override these values? */
  2188		adap->timeout = 1000;
  2189		adap->retries = 3;
  2190	
  2191		ret = i2c_add_adapter(adap);
  2192		if (ret)
  2193			return ret;
  2194	
  2195		/*
  2196		 * We silently ignore failures here. The bus should keep working
  2197		 * correctly even if one or more i2c devices are not registered.
  2198		 */
  2199		list_for_each_entry(i2cboardinfo, &master->boardinfo.i2c, node)
> 2200			i2cdev->dev = i2c_new_client_device(adap, &i2cboardinfo->base);
  2201	
  2202		return 0;
  2203	}
  2204	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
