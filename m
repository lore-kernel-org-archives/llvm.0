Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996FF28F0
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660826448; x=1692362448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HyfQ3MAnDLuX/yCV8HS/ul1zmMufIrdLei+p/wgYtG8=;
  b=gvqvzSjvipIHA6yJLDETMcXPzktmw2dStgTjzmgdBJRkSuN5XsJ7Rvt/
   IWHjHSL2gKbt9+JjRAU6jL0S55iHoehi/MuOyUhfU/2jqeptSZCJTvQjV
   H++OAaIJ0nI35q3K+Rl6soW8Yr9ZcaAkZG33MJZ1hqHpXxuuzyH+rzbel
   BIi+B2ndE8KJpdwSzo93ZR36G+AegoBC94gZhO6/iEElg9zzxhlmI0thG
   uF7fE4GMvB8yAtwTHuHxWFKCgoI1p/nlJF0hccGI+10x6CNjQWgIBFsVU
   0BWmzUx/4L47ut9LZknm9bF64bgotDh+uWn6MRIFmjY/zHOP+e6fm6MQu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="293537451"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; 
   d="scan'208";a="293537451"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 05:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; 
   d="scan'208";a="935795830"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Aug 2022 05:40:46 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oOepK-00001z-0y;
	Thu, 18 Aug 2022 12:40:46 +0000
Date: Thu, 18 Aug 2022 20:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mattias Forsblad <mattias.forsblad@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC net-next PATCH 2/3] mv88e6xxx: Implement remote management
 support (RMU)
Message-ID: <202208182008.s00O6DMN-lkp@intel.com>
References: <20220818102924.287719-3-mattias.forsblad@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818102924.287719-3-mattias.forsblad@gmail.com>

Hi Mattias,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Mattias-Forsblad/net-dsa-mv88e6xxx-Add-RMU-support/20220818-183122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git e34cfee65ec891a319ce79797dda18083af33a76
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220818/202208182008.s00O6DMN-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8543f260de6b37602bb98a7c6646b97e2b94fba6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mattias-Forsblad/net-dsa-mv88e6xxx-Add-RMU-support/20220818-183122
        git checkout 8543f260de6b37602bb98a7c6646b97e2b94fba6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/dsa/mv88e6xxx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/net/dsa/mv88e6xxx/rmu.c:147:21: warning: variable 'master' set but not used [-Wunused-but-set-variable]
           struct net_device *master;
                              ^
>> drivers/net/dsa/mv88e6xxx/rmu.c:211:5: warning: no previous prototype for function 'mv88e6xxx_rmu_stats_get' [-Wmissing-prototypes]
   int mv88e6xxx_rmu_stats_get(struct mv88e6xxx_chip *chip, int port, uint64_t *data)
       ^
   drivers/net/dsa/mv88e6xxx/rmu.c:211:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mv88e6xxx_rmu_stats_get(struct mv88e6xxx_chip *chip, int port, uint64_t *data)
   ^
   static 
   2 warnings generated.


vim +/mv88e6xxx_rmu_stats_get +211 drivers/net/dsa/mv88e6xxx/rmu.c

   142	
   143	static int mv88e6xxx_rmu_send_wait(struct mv88e6xxx_chip *chip, int port,
   144					   int request, const char *msg, int len)
   145	{
   146		const struct dsa_port *dp;
 > 147		struct net_device *master;
   148		int ret = 0;
   149	
   150		dp = dsa_to_port(chip->ds, port);
   151		if (!dp)
   152			return 0;
   153	
   154		master = dp->master;
   155	
   156		mutex_lock(&chip->rmu.mutex);
   157	
   158		chip->rmu.request_cmd = request;
   159	
   160		ret = mv88e6xxx_rmu_tx(chip, port, msg, len);
   161		if (ret == -ENODEV) {
   162			/* Device not ready yet? Try again later */
   163			ret = 0;
   164			goto out;
   165		}
   166	
   167		if (ret) {
   168			dev_err(chip->dev, "RMU: error transmitting request (%d)", ret);
   169			goto out;
   170		}
   171	
   172		ret = wait_for_completion_timeout(&chip->rmu.completion,
   173						  msecs_to_jiffies(MV88E6XXX_WAIT_POLL_TIME_MS));
   174		if (ret == 0) {
   175			dev_err(chip->dev,
   176				"RMU: timeout waiting for request %d (%d) on dev:port %d:%d\n",
   177				request, ret, chip->ds->index, port);
   178			ret = -ETIMEDOUT;
   179		}
   180	
   181	out:
   182		mutex_unlock(&chip->rmu.mutex);
   183	
   184		return ret > 0 ? 0 : ret;
   185	}
   186	
   187	static int mv88e6xxx_rmu_get_id(struct mv88e6xxx_chip *chip, int port)
   188	{
   189		const u8 get_id[8] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
   190		int ret = -1;
   191	
   192		if (chip->rmu.got_id)
   193			return 0;
   194	
   195		chip->rmu.netdev = dev_get_by_name(&init_net, "chan0");
   196		if (!chip->rmu.netdev) {
   197			dev_err(chip->dev, "RMU: unable to get interface");
   198			return -ENODEV;
   199		}
   200	
   201		ret = mv88e6xxx_rmu_send_wait(chip, port, RMU_REQ_GET_ID, get_id, 8);
   202		if (ret) {
   203			dev_err(chip->dev, "RMU: error for command GET_ID %d index %d\n", ret,
   204				chip->ds->index);
   205			return ret;
   206		}
   207	
   208		return 0;
   209	}
   210	
 > 211	int mv88e6xxx_rmu_stats_get(struct mv88e6xxx_chip *chip, int port, uint64_t *data)
   212	{
   213		u8 dump_mib[8] = { 0x00, 0x01, 0x00, 0x00, 0x10, 0x20, 0x00, 0x00 };
   214		int ret;
   215	
   216		if (!chip)
   217			return 0;
   218	
   219		ret = mv88e6xxx_rmu_get_id(chip, port);
   220		if (ret)
   221			return ret;
   222	
   223		/* Send a GET_MIB command */
   224		dump_mib[7] = port;
   225		ret = mv88e6xxx_rmu_send_wait(chip, port, RMU_REQ_DUMP_MIB, dump_mib, 8);
   226		if (ret) {
   227			dev_err(chip->dev, "RMU: error for command DUMP_MIB %d dev %d:%d\n", ret,
   228				chip->ds->index, port);
   229			return ret;
   230		}
   231	
   232		/* Update MIB for port */
   233		if (chip->info->ops->stats_get_stats)
   234			return chip->info->ops->stats_get_stats(chip, port, data);
   235	
   236		return 0;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
