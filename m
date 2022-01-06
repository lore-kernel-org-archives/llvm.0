Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988B168
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641487646; x=1673023646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kR/Qtye1XgIUh4qwCireXAnZ1oDQXh5Sr+ZrCoT9KgU=;
  b=mxw6JbeD4F10G/qiRaMBOYgjsCe7p4vj7CLbvlN1YGx+Zh3vV+sip1Bj
   7UjFmG3t4HowKLk+aOhKq7P+2oQP5UFs/LugVn+zprnjAA6+6BBS8FlRP
   EK5zsg5wUHsOsquzKhbQvmtUaFG7b884E33s9jQo4rtfSStDFjgZ0ZKvs
   ASo4aWTAdDYTkfSVbMXs1sNUi3hnWcQ2fo+3fek+DEPWwqm8NZx7qgONG
   EF7yoSCxyb5MLLcUjkTkwbkbdiFEksPVnFwRWspcEx5oH/PGch2rTcgO4
   8w7cOQbcmgZKJVwmFl0rtOBvAs2Y4CvllYP5zvIT3eEF1OoYqxsWa3myF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242645488"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="242645488"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 08:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="472994562"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jan 2022 08:47:24 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5VvA-000HnV-9a; Thu, 06 Jan 2022 16:47:24 +0000
Date: Fri, 7 Jan 2022 00:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: John Sung <penmount.touch@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] Add serial device bus support to penmount serial driver.
Message-ID: <202201070052.PIaq47mt-lkp@intel.com>
References: <1641463060-6602-1-git-send-email-penmount.touch@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1641463060-6602-1-git-send-email-penmount.touch@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi John,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on hid/for-next linux/master linus/master v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/John-Sung/Add-serial-device-bus-support-to-penmount-serial-driver/20220106-175910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: x86_64-randconfig-a001-20220106 (https://download.01.org/0day-ci/archive/20220107/202201070052.PIaq47mt-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/053957cedaa900325f45620717607b464f532b54
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review John-Sung/Add-serial-device-bus-support-to-penmount-serial-driver/20220106-175910
        git checkout 053957cedaa900325f45620717607b464f532b54
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/penmount.c:257:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err;
               ^
   1 warning generated.


vim +/err +257 drivers/input/touchscreen/penmount.c

ee4799997950e8 Rick Koch  2006-08-05  246  
ee4799997950e8 Rick Koch  2006-08-05  247  /*
ee4799997950e8 Rick Koch  2006-08-05  248   * pm_connect() is the routine that is called when someone adds a
21ae508bab28c2 John Sung  2011-09-09  249   * new serio device that supports PenMount protocol and registers it as
ee4799997950e8 Rick Koch  2006-08-05  250   * an input device.
ee4799997950e8 Rick Koch  2006-08-05  251   */
053957cedaa900 John Sung  2022-01-06  252  static struct pm * pm_driver_init(struct device * dev, const struct pm_device_conf * conf, char *phys)
ee4799997950e8 Rick Koch  2006-08-05  253  {
053957cedaa900 John Sung  2022-01-06  254  	struct pm *pm = NULL;
ee4799997950e8 Rick Koch  2006-08-05  255  	struct input_dev *input_dev;
90aba7d8b155c2 John Sung  2011-09-09  256  	int max_x, max_y;
ee4799997950e8 Rick Koch  2006-08-05 @257  	int err;
ee4799997950e8 Rick Koch  2006-08-05  258  
ee4799997950e8 Rick Koch  2006-08-05  259  	pm = kzalloc(sizeof(struct pm), GFP_KERNEL);
ee4799997950e8 Rick Koch  2006-08-05  260  	input_dev = input_allocate_device();
ee4799997950e8 Rick Koch  2006-08-05  261  	if (!pm || !input_dev) {
ee4799997950e8 Rick Koch  2006-08-05  262  		err = -ENOMEM;
ee4799997950e8 Rick Koch  2006-08-05  263  		goto fail1;
ee4799997950e8 Rick Koch  2006-08-05  264  	}
ee4799997950e8 Rick Koch  2006-08-05  265  	
ee4799997950e8 Rick Koch  2006-08-05  266  	pm->dev = input_dev;	
ee4799997950e8 Rick Koch  2006-08-05  267  
21ae508bab28c2 John Sung  2011-09-09  268  	input_dev->name = "PenMount Serial TouchScreen";
053957cedaa900 John Sung  2022-01-06  269  	input_dev->phys = phys;
ee4799997950e8 Rick Koch  2006-08-05  270  	input_dev->id.bustype = BUS_RS232;
ee4799997950e8 Rick Koch  2006-08-05  271  	input_dev->id.vendor = SERIO_PENMOUNT;
ee4799997950e8 Rick Koch  2006-08-05  272  	input_dev->id.product = 0;
ee4799997950e8 Rick Koch  2006-08-05  273  	input_dev->id.version = 0x0100;
053957cedaa900 John Sung  2022-01-06  274  	input_dev->dev.parent = dev;
ee4799997950e8 Rick Koch  2006-08-05  275  
7b19ada2ed3c1e Jiri Slaby 2007-10-18  276  	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
7b19ada2ed3c1e Jiri Slaby 2007-10-18  277  	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
c42e2e406ad49f John Sung  2011-09-09  278  
053957cedaa900 John Sung  2022-01-06  279  	pm->conf = conf;
053957cedaa900 John Sung  2022-01-06  280  	input_dev->id.product = conf->productid;
053957cedaa900 John Sung  2022-01-06  281  	max_x = max_y = conf->max;
90aba7d8b155c2 John Sung  2011-09-09  282  
90aba7d8b155c2 John Sung  2011-09-09  283  	input_set_abs_params(pm->dev, ABS_X, 0, max_x, 0, 0);
90aba7d8b155c2 John Sung  2011-09-09  284  	input_set_abs_params(pm->dev, ABS_Y, 0, max_y, 0, 0);
90aba7d8b155c2 John Sung  2011-09-09  285  
053957cedaa900 John Sung  2022-01-06  286  	if (pm->conf->maxcontacts > 1) {
053957cedaa900 John Sung  2022-01-06  287  		input_mt_init_slots(pm->dev, pm->conf->maxcontacts, 0);
90aba7d8b155c2 John Sung  2011-09-09  288  		input_set_abs_params(pm->dev,
90aba7d8b155c2 John Sung  2011-09-09  289  				     ABS_MT_POSITION_X, 0, max_x, 0, 0);
90aba7d8b155c2 John Sung  2011-09-09  290  		input_set_abs_params(pm->dev,
90aba7d8b155c2 John Sung  2011-09-09  291  				     ABS_MT_POSITION_Y, 0, max_y, 0, 0);
90aba7d8b155c2 John Sung  2011-09-09  292  	}
053957cedaa900 John Sung  2022-01-06  293  	return pm;
053957cedaa900 John Sung  2022-01-06  294  	
053957cedaa900 John Sung  2022-01-06  295   fail1:	
053957cedaa900 John Sung  2022-01-06  296  	if (input_dev) input_free_device(input_dev);
053957cedaa900 John Sung  2022-01-06  297  	if (pm) kfree(pm);
053957cedaa900 John Sung  2022-01-06  298  	return NULL;
053957cedaa900 John Sung  2022-01-06  299  }
053957cedaa900 John Sung  2022-01-06  300  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
