Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF353D61
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 23:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650325808; x=1681861808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6RxZzSIjsW4RweQfrvtr93HGHfTde4zYCBJbBjvFDtQ=;
  b=GhqKDqzCLhRUZooS8gNJGzUxk6Kdhj+yMgKk3shahEXkvDgwhFc85rdD
   Ww4qCk8vP5UK0fXWC/enfDxhwDvDnHfSGdCk0SdSDw3c4XJS5NWqZGB3z
   3+AO+OAfW9O0EaJ0Zp9TAgEhfEEDkwVo6rXqrMZsdB/gdXOUmnAIsmK0G
   bSH83l4u3cVuCOACEkr7o6YInUZyDNtAMeMl4dx4utdYB8EtyuCzCjABI
   NgelM8Sbl49CSFXacActm51Fo8Ua1Nbl2fJryXnBbFNYpldFLnq/7TCkM
   5UwW9niso77pok1rY53xuR7jB4HkdYLHM8NNHOD0m4/ZsCBFHnP6YHqPn
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="350084330"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="350084330"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 16:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="665580717"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Apr 2022 16:50:06 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngb89-000562-Gl;
	Mon, 18 Apr 2022 23:50:05 +0000
Date: Tue, 19 Apr 2022 07:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1541/2356]
 drivers/hwmon/pmbus/pli1209bc.c:60:14: warning: incompatible integer to
 pointer conversion initializing 'const char *' with an expression of type
 'int'
Message-ID: <202204190731.vTjUPdxY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   af93551cf39027d176f30b9beafc60a4c130998a
commit: 63245bf3e0db1d416f39a3ccb1311f94f37697f5 [1541/2356] headers/deps: i2c: Optimize <linux/i2c.h> header dependencies
config: i386-randconfig-a012-20220418 (https://download.01.org/0day-ci/archive/20220419/202204190731.vTjUPdxY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=63245bf3e0db1d416f39a3ccb1311f94f37697f5
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 63245bf3e0db1d416f39a3ccb1311f94f37697f5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/panel/ drivers/hwmon/ drivers/iio/afe/ drivers/iio/proximity/ drivers/input/touchscreen/ drivers/mtd/nand/ drivers/phy/cadence/ drivers/pinctrl/ drivers/platform/chrome/ mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/pli1209bc.c:60:14: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           .of_match = of_match_ptr("vout2"),
                       ^
>> drivers/hwmon/pmbus/pli1209bc.c:60:14: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
           .of_match = of_match_ptr("vout2"),
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pli1209bc.c:61:21: warning: incompatible integer to pointer conversion initializing 'const char *' with an expression of type 'int' [-Wint-conversion]
           .regulators_node = of_match_ptr("regulators"),
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pli1209bc.c:60:14: error: initializer element is not a compile-time constant
           .of_match = of_match_ptr("vout2"),
                       ^~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/pli1209bc.c:135:24: warning: incompatible integer to pointer conversion initializing 'const struct of_device_id *' with an expression of type 'int' [-Wint-conversion]
                      .of_match_table = of_match_ptr(pli1209bc_of_match),
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/pli1209bc.c:135:24: error: initializer element is not a compile-time constant
                      .of_match_table = of_match_ptr(pli1209bc_of_match),
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings and 3 errors generated.


vim +60 drivers/hwmon/pmbus/pli1209bc.c

d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   55  
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   56  #if IS_ENABLED(CONFIG_SENSORS_PLI1209BC_REGULATOR)
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   57  static const struct regulator_desc pli1209bc_reg_desc = {
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   58  	.name = "vout2",
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   59  	.id = 1,
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21  @60  	.of_match = of_match_ptr("vout2"),
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   61  	.regulators_node = of_match_ptr("regulators"),
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   62  	.ops = &pmbus_regulator_ops,
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   63  	.type = REGULATOR_VOLTAGE,
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   64  	.owner = THIS_MODULE,
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   65  };
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   66  #endif
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21   67  
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   68  static struct pmbus_driver_info pli1209bc_info = {
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   69  	.pages = 2,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   70  	.format[PSC_VOLTAGE_IN] = direct,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   71  	.format[PSC_VOLTAGE_OUT] = direct,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   72  	.format[PSC_CURRENT_IN] = direct,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   73  	.format[PSC_CURRENT_OUT] = direct,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   74  	.format[PSC_POWER] = direct,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   75  	.format[PSC_TEMPERATURE] = direct,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   76  	.m[PSC_VOLTAGE_IN] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   77  	.b[PSC_VOLTAGE_IN] = 0,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   78  	.R[PSC_VOLTAGE_IN] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   79  	.m[PSC_VOLTAGE_OUT] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   80  	.b[PSC_VOLTAGE_OUT] = 0,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   81  	.R[PSC_VOLTAGE_OUT] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   82  	.m[PSC_CURRENT_IN] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   83  	.b[PSC_CURRENT_IN] = 0,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   84  	.R[PSC_CURRENT_IN] = 3,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   85  	.m[PSC_CURRENT_OUT] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   86  	.b[PSC_CURRENT_OUT] = 0,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   87  	.R[PSC_CURRENT_OUT] = 2,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   88  	.m[PSC_POWER] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   89  	.b[PSC_POWER] = 0,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   90  	.R[PSC_POWER] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   91  	.m[PSC_TEMPERATURE] = 1,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   92  	.b[PSC_TEMPERATURE] = 0,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   93  	.R[PSC_TEMPERATURE] = 0,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   94  	/*
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   95  	 * Page 0 sums up all attributes except voltage readings.
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   96  	 * The pli1209 digital supervisor only contains a single BCM, making
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   97  	 * page 0 redundant.
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   98  	 */
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21   99  	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  100  	    | PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  101  	    | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  102  	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  103  	    | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  104  	.read_word_data = pli1209bc_read_word_data,
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21  105  #if IS_ENABLED(CONFIG_SENSORS_PLI1209BC_REGULATOR)
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21  106  	.num_regulators = 1,
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21  107  	.reg_desc = &pli1209bc_reg_desc,
ba1d263af1c034 Marcello Sylvester Bauer 2022-02-21  108  #endif
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  109  };
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  110  
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  111  static int pli1209bc_probe(struct i2c_client *client)
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  112  {
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  113  	client->dev.platform_data = &pli1209bc_plat_data;
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  114  	return pmbus_do_probe(client, &pli1209bc_info);
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  115  }
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  116  
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  117  static const struct i2c_device_id pli1209bc_id[] = {
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  118  	{"pli1209bc", 0},
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  119  	{}
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  120  };
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  121  
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  122  MODULE_DEVICE_TABLE(i2c, pli1209bc_id);
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  123  
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  124  #ifdef CONFIG_OF
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  125  static const struct of_device_id pli1209bc_of_match[] = {
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  126  	{ .compatible = "vicor,pli1209bc" },
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  127  	{ },
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  128  };
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  129  MODULE_DEVICE_TABLE(of, pli1209bc_of_match);
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  130  #endif
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  131  
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  132  static struct i2c_driver pli1209bc_driver = {
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  133  	.driver = {
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  134  		   .name = "pli1209bc",
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21 @135  		   .of_match_table = of_match_ptr(pli1209bc_of_match),
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  136  		   },
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  137  	.probe_new = pli1209bc_probe,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  138  	.id_table = pli1209bc_id,
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  139  };
d0cd978513f2e3 Marcello Sylvester Bauer 2022-02-21  140  

:::::: The code at line 60 was first introduced by commit
:::::: ba1d263af1c034baf479bca14d6f715b713214b1 hwmon: (pmbus/pli1209bc) Add regulator support

:::::: TO: Marcello Sylvester Bauer <sylv@sylv.io>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
