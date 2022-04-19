Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5EEA1
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 05:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650345269; x=1681881269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hSD7SJIELGz4Evj1pZxdc6zYsnOdfNuk7mM9BNZzZHU=;
  b=kgg3hRA+xlm0+B0kliLWFmc0NkbdLpnHz5azKoBLpJ6E49JHSAKEXo8Y
   G49PGZGnoygABYHzG5sgKe122MUEUXxGHYFyF1wU+mxCImYvleE0Ko5oL
   r+xsb1q1QdMK4TRBTjyTuzz9jnW0qumfr/HJkGExwciX4HuAuOhvjw5nY
   bZ9A23OA+Er0yOkS9+45vIxI+icq+/K2MSgDBwEOPFDCIi/Ssu9XGJ6ZF
   mA5U/PNUiO8191SDf7uAl41KR0R+pCyxQvYDXxYittSgz9iatVwTDGnWf
   1fdFrwsu0y2hIYTsKo34zgdC4IfXTQohMl67rSeL/tI5uny1aF5GDENUR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="244262115"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="244262115"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 22:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="726918588"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Apr 2022 22:14:27 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nggC2-0005Nm-Gh;
	Tue, 19 Apr 2022 05:14:26 +0000
Date: Tue, 19 Apr 2022 13:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1541/2356]
 drivers/input/touchscreen/imagis.c:358:34: error: use of undeclared
 identifier 'imagis_of_match'
Message-ID: <202204191348.SKAmnWmG-lkp@intel.com>
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
config: x86_64-randconfig-a011-20220418 (https://download.01.org/0day-ci/archive/20220419/202204191348.SKAmnWmG-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ drivers/ sound/soc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/input/touchscreen/imagis.c:79:8: error: unknown type name 'irqreturn_t'
   static irqreturn_t imagis_interrupt(int irq, void *dev_id)
          ^
   drivers/input/touchscreen/imagis.c:133:9: error: use of undeclared identifier 'IRQ_HANDLED'
           return IRQ_HANDLED;
                  ^
   drivers/input/touchscreen/imagis.c:164:2: error: implicit declaration of function 'enable_irq' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           enable_irq(ts->client->irq);
           ^
   drivers/input/touchscreen/imagis.c:171:2: error: implicit declaration of function 'disable_irq' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           disable_irq(ts->client->irq);
           ^
   drivers/input/touchscreen/imagis.c:171:2: note: did you mean 'disable_TSC'?
   arch/x86/include/asm/tsc.h:20:13: note: 'disable_TSC' declared here
   extern void disable_TSC(void);
               ^
   drivers/input/touchscreen/imagis.c:295:10: error: implicit declaration of function 'devm_request_threaded_irq' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           error = devm_request_threaded_irq(dev, i2c->irq,
                   ^
   drivers/input/touchscreen/imagis.c:297:8: error: use of undeclared identifier 'IRQF_ONESHOT'
                                             IRQF_ONESHOT | IRQF_NO_AUTOEN,
                                             ^
   drivers/input/touchscreen/imagis.c:297:23: error: use of undeclared identifier 'IRQF_NO_AUTOEN'
                                             IRQF_ONESHOT | IRQF_NO_AUTOEN,
                                                            ^
   drivers/input/touchscreen/imagis.c:358:21: error: implicit declaration of function 'of_match_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   .of_match_table = of_match_ptr(imagis_of_match),
                                     ^
>> drivers/input/touchscreen/imagis.c:358:34: error: use of undeclared identifier 'imagis_of_match'
                   .of_match_table = of_match_ptr(imagis_of_match),
                                                  ^
   9 errors generated.


vim +/imagis_of_match +358 drivers/input/touchscreen/imagis.c

a23ba3c043db9a Markuss Broks 2022-03-14  353  
a23ba3c043db9a Markuss Broks 2022-03-14  354  static struct i2c_driver imagis_ts_driver = {
a23ba3c043db9a Markuss Broks 2022-03-14  355  	.driver = {
a23ba3c043db9a Markuss Broks 2022-03-14  356  		.name = "imagis-touchscreen",
a23ba3c043db9a Markuss Broks 2022-03-14  357  		.pm = &imagis_pm_ops,
a23ba3c043db9a Markuss Broks 2022-03-14 @358  		.of_match_table = of_match_ptr(imagis_of_match),
a23ba3c043db9a Markuss Broks 2022-03-14  359  	},
a23ba3c043db9a Markuss Broks 2022-03-14  360  	.probe_new = imagis_probe,
a23ba3c043db9a Markuss Broks 2022-03-14  361  };
a23ba3c043db9a Markuss Broks 2022-03-14  362  

:::::: The code at line 358 was first introduced by commit
:::::: a23ba3c043db9a2e8c967a3ff66dcedc5725afdf Input: add Imagis touchscreen driver

:::::: TO: Markuss Broks <markuss.broks@gmail.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
