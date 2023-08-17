Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9211095B;
	Thu, 17 Aug 2023 09:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692263608; x=1723799608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZINmkco5D4zvjnt45wlcOTjfWOWG/CABUQCqHmGR4Sg=;
  b=nnvbtcg7kdN1O7uH0I4NmOgqP+wbkVLplSAHEcCkUxM3QPbYmvwKjD4X
   CH6Unddm6RdmLZvbr648CMmeXdHrAkDjSLqL5hK1AFIeyQqzWXP35RjtB
   0jGXFvtWjE2kCt0qxNlU4BPD1+nkN0OysQPMmUw1Fykr38I+dQ56075LI
   3tm4J2IwRB6OhO/s8inRmq6H+O3e+awrXor4wNoYJaqEBXmXpTmnljFed
   aREQQ5UZ+Y/bAjpd7QYm6h+HJZIdNZjZQHZfA8kyoUYs+McR4jYtuYulg
   zT5g+fmeI85dgVg4IvQBNW9I+MDL7s9MVw8Cpke/7XCWwtu92o8IXVyfI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375522889"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="375522889"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763983672"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="763983672"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 02:13:22 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWZ4D-0000ze-2R;
	Thu, 17 Aug 2023 09:13:21 +0000
Date: Thu, 17 Aug 2023 17:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kent Gibson <warthog618@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 5/5] gpio: cdev: wake up lineevent poll() on device unbind
Message-ID: <202308171736.864z7YNW-lkp@intel.com>
References: <20230816122032.15548-6-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816122032.15548-6-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-cdev-ignore-notifications-other-than-line-status-changes/20230816-202408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20230816122032.15548-6-brgl%40bgdev.pl
patch subject: [PATCH 5/5] gpio: cdev: wake up lineevent poll() on device unbind
config: x86_64-randconfig-x016-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171736.864z7YNW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171736.864z7YNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171736.864z7YNW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib-cdev.c:1835: warning: Function parameter or member 'nb' not described in 'lineevent_state'


vim +1835 drivers/gpio/gpiolib-cdev.c

925ca36913fc7d Kent Gibson         2020-06-16  1807  
925ca36913fc7d Kent Gibson         2020-06-16  1808  /*
925ca36913fc7d Kent Gibson         2020-06-16  1809   * GPIO line event management
925ca36913fc7d Kent Gibson         2020-06-16  1810   */
925ca36913fc7d Kent Gibson         2020-06-16  1811  
925ca36913fc7d Kent Gibson         2020-06-16  1812  /**
925ca36913fc7d Kent Gibson         2020-06-16  1813   * struct lineevent_state - contains the state of a userspace event
925ca36913fc7d Kent Gibson         2020-06-16  1814   * @gdev: the GPIO device the event pertains to
925ca36913fc7d Kent Gibson         2020-06-16  1815   * @label: consumer label used to tag descriptors
925ca36913fc7d Kent Gibson         2020-06-16  1816   * @desc: the GPIO descriptor held by this event
925ca36913fc7d Kent Gibson         2020-06-16  1817   * @eflags: the event flags this line was requested with
925ca36913fc7d Kent Gibson         2020-06-16  1818   * @irq: the interrupt that trigger in response to events on this GPIO
925ca36913fc7d Kent Gibson         2020-06-16  1819   * @wait: wait queue that handles blocking reads of events
925ca36913fc7d Kent Gibson         2020-06-16  1820   * @events: KFIFO for the GPIO events
925ca36913fc7d Kent Gibson         2020-06-16  1821   * @timestamp: cache for the timestamp storing it between hardirq
925ca36913fc7d Kent Gibson         2020-06-16  1822   * and IRQ thread, used to bring the timestamp close to the actual
925ca36913fc7d Kent Gibson         2020-06-16  1823   * event
925ca36913fc7d Kent Gibson         2020-06-16  1824   */
925ca36913fc7d Kent Gibson         2020-06-16  1825  struct lineevent_state {
925ca36913fc7d Kent Gibson         2020-06-16  1826  	struct gpio_device *gdev;
925ca36913fc7d Kent Gibson         2020-06-16  1827  	const char *label;
925ca36913fc7d Kent Gibson         2020-06-16  1828  	struct gpio_desc *desc;
925ca36913fc7d Kent Gibson         2020-06-16  1829  	u32 eflags;
925ca36913fc7d Kent Gibson         2020-06-16  1830  	int irq;
925ca36913fc7d Kent Gibson         2020-06-16  1831  	wait_queue_head_t wait;
925ca36913fc7d Kent Gibson         2020-06-16  1832  	DECLARE_KFIFO(events, struct gpioevent_data, 16);
35c059f377b978 Bartosz Golaszewski 2023-08-16  1833  	struct notifier_block nb;
925ca36913fc7d Kent Gibson         2020-06-16  1834  	u64 timestamp;
925ca36913fc7d Kent Gibson         2020-06-16 @1835  };
925ca36913fc7d Kent Gibson         2020-06-16  1836  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
