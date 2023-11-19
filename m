Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFB1FDA;
	Sun, 19 Nov 2023 04:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REcNM4K/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700367040; x=1731903040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wk2SArLJLBSovqoRcDBFWmIaTkq0kkM4zpZ8yKd2aEQ=;
  b=REcNM4K/Qo8eKsVkZBznZG4XMNsWIvA2diD2FFWBActZq0uM4+mIGW0X
   YVpVN9xg3C5r8VC2j9uTgj8W/cX4sToWDknHK8DGWfGlOWqhrX7MFYwJS
   yroiR6xoCs+FnjF35iwmpYVWWLfbqtXR6pcBXVqAamoLcippHL3WMNhTa
   RrIdd1rpOCffAhFj4iTbmbdHVUKFXmQXFwSx+dOsbOTRa31MVG+32Cvki
   3A7lonafqB9bVW8Z6TQx4bXfdvCdjYJz4kVyrPi7OBaLsY8we6/AeIXse
   P/qaoDtmBHcheN4mS5pFkDmQmLj1jRp3BA9Shp8q+xcX6A7u2KhvRanCA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="370813305"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="370813305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 20:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="13852077"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2023 20:10:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Z8l-0004d9-2b;
	Sun, 19 Nov 2023 04:10:35 +0000
Date: Sun, 19 Nov 2023 12:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 1467/1905] drivers/hwmon/nct6775-i2c.c:164:15:
 warning: cast to smaller integer type 'enum kinds' from 'const void *'
Message-ID: <202311191205.EDRfQlJF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eff99d8edbed7918317331ebd1e365d8e955d65e
commit: 0a7093e69c1eb508d699d6076013706b0c523597 [1467/1905] hwmon: nct6775-i2c: Use i2c_get_match_data()
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231119/202311191205.EDRfQlJF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191205.EDRfQlJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191205.EDRfQlJF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/nct6775-i2c.c:164:15: warning: cast to smaller integer type 'enum kinds' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           data->kind = (enum kinds)i2c_get_match_data(client);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +164 drivers/hwmon/nct6775-i2c.c

   154	
   155	static int nct6775_i2c_probe(struct i2c_client *client)
   156	{
   157		struct nct6775_data *data;
   158		struct device *dev = &client->dev;
   159	
   160		data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
   161		if (!data)
   162			return -ENOMEM;
   163	
 > 164		data->kind = (enum kinds)i2c_get_match_data(client);
   165		data->read_only = true;
   166		data->driver_data = client;
   167		data->driver_init = nct6775_i2c_probe_init;
   168	
   169		return nct6775_probe(dev, data, &nct6775_i2c_regmap_config);
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
