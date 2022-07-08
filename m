Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE112579
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657291737; x=1688827737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F4X0TMsHVHTCkDP6XOGvzut//wG2ckiu93mBizDzyIk=;
  b=I8lgwZ5wXy6AdgwKenzWw9fV1wMdmPbPV6RvBGXsKxAhQABT89arcmyo
   77eNnupCQk2ZFr8y0n3m2FWe+tyQzJlr+fqsdz9p1DzxohnbUAq0yvo5X
   fFVJIemk7jjkKnEXIxnyCc7PV75q7mF3sPlgX3KlRiAH5D/FAZXTIk3wp
   FqQ23VhJpZvZn8466IL3r1MsfE36uKl3LP3h+5qLVDD1BLEeIm9dx6e/1
   m4sUhPPGdocn0Ym+ohYZL40TOR1Ncl31Xh8C7hA5SGZAl7CO49/9G5DSB
   cwBRg8gRkrBo0ofq0XztULagK4eXI6LxqcwifF5e15O9oGEP8K5+IUPPe
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="281844654"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="281844654"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 07:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="568959221"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jul 2022 07:48:54 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9pHq-000Nbq-3d;
	Fri, 08 Jul 2022 14:48:54 +0000
Date: Fri, 8 Jul 2022 22:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [linux-next:master 7177/8914] drivers/base/power/domain.c:603:13:
 error: use of undeclared identifier 'pm_wq'
Message-ID: <202207082240.wYnREIVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konrad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: 7d0221fb59125181a31ef3a561306c70fb238bc7 [7177/8914] soc/qcom: Make QCOM_RPMPD select PM_GENERIC_DOMAINS/_OF
config: riscv-randconfig-c006-20220707 (https://download.01.org/0day-ci/archive/20220708/202207082240.wYnREIVo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7d0221fb59125181a31ef3a561306c70fb238bc7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7d0221fb59125181a31ef3a561306c70fb238bc7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/base/power/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/base/power/domain.c:603:13: error: use of undeclared identifier 'pm_wq'
           queue_work(pm_wq, &genpd->power_off_work);
                      ^
>> drivers/base/power/domain.c:802:26: error: no member named 'ignore_children' in 'struct dev_pm_info'
                   if (!dev || dev->power.ignore_children)
                               ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/base/power/domain.c:802:26: error: no member named 'ignore_children' in 'struct dev_pm_info'
                   if (!dev || dev->power.ignore_children)
                               ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> drivers/base/power/domain.c:802:26: error: no member named 'ignore_children' in 'struct dev_pm_info'
                   if (!dev || dev->power.ignore_children)
                               ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
>> drivers/base/power/domain.c:3068:17: error: no member named 'runtime_error' in 'struct dev_pm_info'
           if (dev->power.runtime_error)
               ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/base/power/domain.c:3068:17: error: no member named 'runtime_error' in 'struct dev_pm_info'
           if (dev->power.runtime_error)
               ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> drivers/base/power/domain.c:3068:17: error: no member named 'runtime_error' in 'struct dev_pm_info'
           if (dev->power.runtime_error)
               ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
>> drivers/base/power/domain.c:3070:22: error: no member named 'disable_depth' in 'struct dev_pm_info'
           else if (dev->power.disable_depth)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/base/power/domain.c:3070:22: error: no member named 'disable_depth' in 'struct dev_pm_info'
           else if (dev->power.disable_depth)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> drivers/base/power/domain.c:3070:22: error: no member named 'disable_depth' in 'struct dev_pm_info'
           else if (dev->power.disable_depth)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
>> drivers/base/power/domain.c:3072:22: error: no member named 'runtime_status' in 'struct dev_pm_info'
           else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/base/power/domain.c:3072:22: error: no member named 'runtime_status' in 'struct dev_pm_info'
           else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> drivers/base/power/domain.c:3072:22: error: no member named 'runtime_status' in 'struct dev_pm_info'
           else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   drivers/base/power/domain.c:3073:32: error: no member named 'runtime_status' in 'struct dev_pm_info'
                   p = status_lookup[dev->power.runtime_status];
                                     ~~~~~~~~~~ ^
   14 errors generated.
--
>> drivers/base/power/domain_governor.c:85:18: error: no member named 'ignore_children' in 'struct dev_pm_info'
           if (!dev->power.ignore_children)
                ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
>> drivers/base/power/domain_governor.c:85:18: error: no member named 'ignore_children' in 'struct dev_pm_info'
           if (!dev->power.ignore_children)
                ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^~~~
>> drivers/base/power/domain_governor.c:85:18: error: no member named 'ignore_children' in 'struct dev_pm_info'
           if (!dev->power.ignore_children)
                ~~~~~~~~~~ ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
   Depends on PM
   Selected by
   - QCOM_RPMPD && QCOM_SMD_RPM


vim +/pm_wq +603 drivers/base/power/domain.c

c8f0ea45169c57 Geert Uytterhoeven 2014-11-10  593  
29e47e2173349e Ulf Hansson        2015-09-02  594  /**
86e12eac1f7f84 Ulf Hansson        2016-12-08  595   * genpd_queue_power_off_work - Queue up the execution of genpd_power_off().
a3d09c73492e57 Moritz Fischer     2016-01-27  596   * @genpd: PM domain to power off.
29e47e2173349e Ulf Hansson        2015-09-02  597   *
86e12eac1f7f84 Ulf Hansson        2016-12-08  598   * Queue up the execution of genpd_power_off() unless it's already been done
29e47e2173349e Ulf Hansson        2015-09-02  599   * before.
29e47e2173349e Ulf Hansson        2015-09-02  600   */
29e47e2173349e Ulf Hansson        2015-09-02  601  static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
29e47e2173349e Ulf Hansson        2015-09-02  602  {
29e47e2173349e Ulf Hansson        2015-09-02 @603  	queue_work(pm_wq, &genpd->power_off_work);
29e47e2173349e Ulf Hansson        2015-09-02  604  }
29e47e2173349e Ulf Hansson        2015-09-02  605  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  606  /**
1f8728b7adc4c2 Ulf Hansson        2017-02-17  607   * genpd_power_off - Remove power from a given PM domain.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  608   * @genpd: PM domain to power down.
3c64649d1cf9f3 Ulf Hansson        2017-02-17  609   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
3c64649d1cf9f3 Ulf Hansson        2017-02-17  610   * RPM status of the releated device is in an intermediate state, not yet turned
3c64649d1cf9f3 Ulf Hansson        2017-02-17  611   * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
3c64649d1cf9f3 Ulf Hansson        2017-02-17  612   * be RPM_SUSPENDED, while it tries to power off the PM domain.
763663c9715f5f Yang Yingliang     2021-05-12  613   * @depth: nesting count for lockdep.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  614   *
1f8728b7adc4c2 Ulf Hansson        2017-02-17  615   * If all of the @genpd's devices have been suspended and all of its subdomains
1f8728b7adc4c2 Ulf Hansson        2017-02-17  616   * have been powered down, remove power from @genpd.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  617   */
2da835452a0875 Ulf Hansson        2017-02-17  618  static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
2da835452a0875 Ulf Hansson        2017-02-17  619  			   unsigned int depth)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  620  {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  621  	struct pm_domain_data *pdd;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  622  	struct gpd_link *link;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  623  	unsigned int not_suspended = 0;
f63816e43d9044 Ulf Hansson        2020-09-24  624  	int ret;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  625  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  626  	/*
1f8728b7adc4c2 Ulf Hansson        2017-02-17  627  	 * Do not try to power off the domain in the following situations:
1f8728b7adc4c2 Ulf Hansson        2017-02-17  628  	 * (1) The domain is already in the "power off" state.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  629  	 * (2) System suspend is in progress.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  630  	 */
41e2c8e0060db2 Ulf Hansson        2017-03-20  631  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  632  		return 0;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  633  
ffaa42e8a40b7f Ulf Hansson        2017-03-20  634  	/*
ffaa42e8a40b7f Ulf Hansson        2017-03-20  635  	 * Abort power off for the PM domain in the following situations:
ffaa42e8a40b7f Ulf Hansson        2017-03-20  636  	 * (1) The domain is configured as always on.
ffaa42e8a40b7f Ulf Hansson        2017-03-20  637  	 * (2) When the domain has a subdomain being powered on.
ffaa42e8a40b7f Ulf Hansson        2017-03-20  638  	 */
ed61e18a4b4e44 Leonard Crestez    2019-04-30  639  	if (genpd_is_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez    2019-04-30  640  			genpd_is_rpm_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez    2019-04-30  641  			atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  642  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  643  
e7d90cfac5510f Ulf Hansson        2022-02-17  644  	/*
e7d90cfac5510f Ulf Hansson        2022-02-17  645  	 * The children must be in their deepest (powered-off) states to allow
e7d90cfac5510f Ulf Hansson        2022-02-17  646  	 * the parent to be powered off. Note that, there's no need for
e7d90cfac5510f Ulf Hansson        2022-02-17  647  	 * additional locking, as powering on a child, requires the parent's
e7d90cfac5510f Ulf Hansson        2022-02-17  648  	 * lock to be acquired first.
e7d90cfac5510f Ulf Hansson        2022-02-17  649  	 */
e7d90cfac5510f Ulf Hansson        2022-02-17  650  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
e7d90cfac5510f Ulf Hansson        2022-02-17  651  		struct generic_pm_domain *child = link->child;
e7d90cfac5510f Ulf Hansson        2022-02-17  652  		if (child->state_idx < child->state_count - 1)
e7d90cfac5510f Ulf Hansson        2022-02-17  653  			return -EBUSY;
e7d90cfac5510f Ulf Hansson        2022-02-17  654  	}
e7d90cfac5510f Ulf Hansson        2022-02-17  655  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  656  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  657  		/*
1f8728b7adc4c2 Ulf Hansson        2017-02-17  658  		 * Do not allow PM domain to be powered off, when an IRQ safe
1f8728b7adc4c2 Ulf Hansson        2017-02-17  659  		 * device is part of a non-IRQ safe domain.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  660  		 */
1f8728b7adc4c2 Ulf Hansson        2017-02-17  661  		if (!pm_runtime_suspended(pdd->dev) ||
7a02444b8fc25a Ulf Hansson        2022-05-11  662  			irq_safe_dev_in_sleep_domain(pdd->dev, genpd))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  663  			not_suspended++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  664  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  665  
3c64649d1cf9f3 Ulf Hansson        2017-02-17  666  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  667  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  668  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  669  	if (genpd->gov && genpd->gov->power_down_ok) {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  670  		if (!genpd->gov->power_down_ok(&genpd->domain))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  671  			return -EAGAIN;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  672  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  673  
2c9b7f8772033c Ulf Hansson        2018-10-03  674  	/* Default to shallowest state. */
2c9b7f8772033c Ulf Hansson        2018-10-03  675  	if (!genpd->gov)
2c9b7f8772033c Ulf Hansson        2018-10-03  676  		genpd->state_idx = 0;
2c9b7f8772033c Ulf Hansson        2018-10-03  677  
f63816e43d9044 Ulf Hansson        2020-09-24  678  	/* Don't power off, if a child domain is waiting to power on. */
1f8728b7adc4c2 Ulf Hansson        2017-02-17  679  	if (atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  680  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  681  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  682  	ret = _genpd_power_off(genpd, true);
c6a113b52302ad Lina Iyer          2020-10-15  683  	if (ret) {
c6a113b52302ad Lina Iyer          2020-10-15  684  		genpd->states[genpd->state_idx].rejected++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  685  		return ret;
c6a113b52302ad Lina Iyer          2020-10-15  686  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  687  
49f618e1b669ef Ulf Hansson        2020-09-24  688  	genpd->status = GENPD_STATE_OFF;
afece3ab9a3640 Thara Gopinath     2017-07-14  689  	genpd_update_accounting(genpd);
c6a113b52302ad Lina Iyer          2020-10-15  690  	genpd->states[genpd->state_idx].usage++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  691  
8d87ae48ced2df Kees Cook          2020-07-08  692  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  693  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook          2020-07-08  694  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  695  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  696  		genpd_unlock(link->parent);
1f8728b7adc4c2 Ulf Hansson        2017-02-17  697  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  698  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  699  	return 0;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  700  }
1f8728b7adc4c2 Ulf Hansson        2017-02-17  701  
5248051b9afb66 Rafael J. Wysocki  2011-07-01  702  /**
8d87ae48ced2df Kees Cook          2020-07-08  703   * genpd_power_on - Restore power to a given PM domain and its parents.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  704   * @genpd: PM domain to power up.
0106ef5146f9e8 Marek Szyprowski   2016-01-20  705   * @depth: nesting count for lockdep.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  706   *
8d87ae48ced2df Kees Cook          2020-07-08  707   * Restore power to @genpd and all of its parents so that it is possible to
5248051b9afb66 Rafael J. Wysocki  2011-07-01  708   * resume a device belonging to it.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  709   */
86e12eac1f7f84 Ulf Hansson        2016-12-08  710  static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
5248051b9afb66 Rafael J. Wysocki  2011-07-01  711  {
5063ce1571b738 Rafael J. Wysocki  2011-08-08  712  	struct gpd_link *link;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  713  	int ret = 0;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  714  
41e2c8e0060db2 Ulf Hansson        2017-03-20  715  	if (genpd_status_on(genpd))
3f241775c30365 Rafael J. Wysocki  2011-08-08  716  		return 0;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  717  
5063ce1571b738 Rafael J. Wysocki  2011-08-08  718  	/*
5063ce1571b738 Rafael J. Wysocki  2011-08-08  719  	 * The list is guaranteed not to change while the loop below is being
8d87ae48ced2df Kees Cook          2020-07-08  720  	 * executed, unless one of the parents' .power_on() callbacks fiddles
5063ce1571b738 Rafael J. Wysocki  2011-08-08  721  	 * with it.
5063ce1571b738 Rafael J. Wysocki  2011-08-08  722  	 */
8d87ae48ced2df Kees Cook          2020-07-08  723  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  724  		struct generic_pm_domain *parent = link->parent;
0106ef5146f9e8 Marek Szyprowski   2016-01-20  725  
8d87ae48ced2df Kees Cook          2020-07-08  726  		genpd_sd_counter_inc(parent);
0106ef5146f9e8 Marek Szyprowski   2016-01-20  727  
8d87ae48ced2df Kees Cook          2020-07-08  728  		genpd_lock_nested(parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  729  		ret = genpd_power_on(parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  730  		genpd_unlock(parent);
5248051b9afb66 Rafael J. Wysocki  2011-07-01  731  
5063ce1571b738 Rafael J. Wysocki  2011-08-08  732  		if (ret) {
8d87ae48ced2df Kees Cook          2020-07-08  733  			genpd_sd_counter_dec(parent);
9e08cf42969709 Rafael J. Wysocki  2011-08-08  734  			goto err;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  735  		}
5063ce1571b738 Rafael J. Wysocki  2011-08-08  736  	}
5248051b9afb66 Rafael J. Wysocki  2011-07-01  737  
86e12eac1f7f84 Ulf Hansson        2016-12-08  738  	ret = _genpd_power_on(genpd, true);
9e08cf42969709 Rafael J. Wysocki  2011-08-08  739  	if (ret)
9e08cf42969709 Rafael J. Wysocki  2011-08-08  740  		goto err;
0140d8bd47f798 Rafael J. Wysocki  2011-12-01  741  
49f618e1b669ef Ulf Hansson        2020-09-24  742  	genpd->status = GENPD_STATE_ON;
afece3ab9a3640 Thara Gopinath     2017-07-14  743  	genpd_update_accounting(genpd);
afece3ab9a3640 Thara Gopinath     2017-07-14  744  
3f241775c30365 Rafael J. Wysocki  2011-08-08  745  	return 0;
9e08cf42969709 Rafael J. Wysocki  2011-08-08  746  
9e08cf42969709 Rafael J. Wysocki  2011-08-08  747   err:
29e47e2173349e Ulf Hansson        2015-09-02  748  	list_for_each_entry_continue_reverse(link,
8d87ae48ced2df Kees Cook          2020-07-08  749  					&genpd->child_links,
8d87ae48ced2df Kees Cook          2020-07-08  750  					child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  751  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook          2020-07-08  752  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  753  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  754  		genpd_unlock(link->parent);
29e47e2173349e Ulf Hansson        2015-09-02  755  	}
9e08cf42969709 Rafael J. Wysocki  2011-08-08  756  
3f241775c30365 Rafael J. Wysocki  2011-08-08  757  	return ret;
3f241775c30365 Rafael J. Wysocki  2011-08-08  758  }
3f241775c30365 Rafael J. Wysocki  2011-08-08  759  
ea71c59669f17d Ulf Hansson        2019-10-16  760  static int genpd_dev_pm_start(struct device *dev)
ea71c59669f17d Ulf Hansson        2019-10-16  761  {
ea71c59669f17d Ulf Hansson        2019-10-16  762  	struct generic_pm_domain *genpd = dev_to_genpd(dev);
ea71c59669f17d Ulf Hansson        2019-10-16  763  
ea71c59669f17d Ulf Hansson        2019-10-16  764  	return genpd_start_dev(genpd, dev);
ea71c59669f17d Ulf Hansson        2019-10-16  765  }
ea71c59669f17d Ulf Hansson        2019-10-16  766  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  767  static int genpd_dev_pm_qos_notifier(struct notifier_block *nb,
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  768  				     unsigned long val, void *ptr)
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  769  {
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  770  	struct generic_pm_domain_data *gpd_data;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  771  	struct device *dev;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  772  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  773  	gpd_data = container_of(nb, struct generic_pm_domain_data, nb);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  774  	dev = gpd_data->base.dev;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  775  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  776  	for (;;) {
f38d1a6d002526 Ulf Hansson        2022-05-11  777  		struct generic_pm_domain *genpd = ERR_PTR(-ENODATA);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  778  		struct pm_domain_data *pdd;
66d29d802ef3bf Ulf Hansson        2022-05-11  779  		struct gpd_timing_data *td;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  780  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  781  		spin_lock_irq(&dev->power.lock);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  782  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  783  		pdd = dev->power.subsys_data ?
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  784  				dev->power.subsys_data->domain_data : NULL;
b4883ca449473e Viresh Kumar       2017-05-16  785  		if (pdd) {
66d29d802ef3bf Ulf Hansson        2022-05-11  786  			td = to_gpd_data(pdd)->td;
f38d1a6d002526 Ulf Hansson        2022-05-11  787  			if (td) {
66d29d802ef3bf Ulf Hansson        2022-05-11  788  				td->constraint_changed = true;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  789  				genpd = dev_to_genpd(dev);
f38d1a6d002526 Ulf Hansson        2022-05-11  790  			}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  791  		}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  792  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  793  		spin_unlock_irq(&dev->power.lock);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  794  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  795  		if (!IS_ERR(genpd)) {
35241d12f750d2 Lina Iyer          2016-10-14  796  			genpd_lock(genpd);
f38d1a6d002526 Ulf Hansson        2022-05-11  797  			genpd->gd->max_off_time_changed = true;
35241d12f750d2 Lina Iyer          2016-10-14  798  			genpd_unlock(genpd);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  799  		}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  800  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  801  		dev = dev->parent;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01 @802  		if (!dev || dev->power.ignore_children)
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  803  			break;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  804  	}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  805  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  806  	return NOTIFY_DONE;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  807  }
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  808  

:::::: The code at line 603 was first introduced by commit
:::::: 29e47e2173349ee06bd339f7753821c720d50923 PM / Domains: Try power off masters in error path of __pm_genpd_poweron()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
