Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31482564;
	Thu, 23 Feb 2023 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677154203; x=1708690203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oUIs1715u87//gfwLLW0GhlENC3l9IgHsK4JEDr3h2w=;
  b=BOA1XCR0wWKEP9wknGfWlbJqAGtXqwJ6UWu5VWXnTzW1hOFisQT8ZKyQ
   8ATcpZlFX8pCtJ4ZLSejRXv1t57vAozT7RzfSTtgfcKWV9qHwZn8T9BgT
   s0pytp3W5FWVH76kKyG9nxZ9T02d3wzXEcstFKG9o8IHs5Tf1vGPGQVuF
   ugVx1npMJV5mWnHEoXm72u+dDW6DSt8NteOr0BM/4xVmctNpaOmTv9AWk
   fbOGtgwRpIdxNzc34UabayQmC0ewDxiIxMtv08AzEeZf4BlUmzVJKzndV
   xTXDruSXh+J4BiERBBH4pXRenkSTWxDd3JDJCHwOVdy7g8JvTvo+EH5Yq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="330921133"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="330921133"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 04:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="781858047"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="781858047"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2023 04:09:59 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVAQA-0001JR-1P;
	Thu, 23 Feb 2023 12:09:58 +0000
Date: Thu, 23 Feb 2023 20:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Prashanth K <quic_prashk@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	=?iso-8859-1?Q?J=F3_=C1gila?= Bitsch <jgilab@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pratham Pratap <quic_ppratap@quicinc.com>,
	Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Prashanth K <quic_prashk@quicinc.com>
Subject: Re: [PATCH v2 2/2] usb: gadget: composite: Draw 100mA current if not
 configured
Message-ID: <202302231957.9Vfsa8ln-lkp@intel.com>
References: <1677142665-8686-3-git-send-email-quic_prashk@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677142665-8686-3-git-send-email-quic_prashk@quicinc.com>

Hi Prashanth,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prashanth-K/usb-dwc3-gadget-Change-condition-for-processing-suspend-event/20230223-165955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1677142665-8686-3-git-send-email-quic_prashk%40quicinc.com
patch subject: [PATCH v2 2/2] usb: gadget: composite: Draw 100mA current if not configured
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230223/202302231957.9Vfsa8ln-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/19beaeb0554fc9c1556e8f7da85011f4267bd8fc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Prashanth-K/usb-dwc3-gadget-Change-condition-for-processing-suspend-event/20230223-165955
        git checkout 19beaeb0554fc9c1556e8f7da85011f4267bd8fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302231957.9Vfsa8ln-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/usb/gadget/composite.c:2535:14: warning: comparison of distinct pointer types ('typeof (2) *' (aka 'int *') and 'typeof (100U) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
                   maxpower = min(CONFIG_USB_GADGET_VBUS_DRAW, 100U)
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> drivers/usb/gadget/composite.c:2535:52: error: expected ';' after expression
                   maxpower = min(CONFIG_USB_GADGET_VBUS_DRAW, 100U)
                                                                    ^
                                                                    ;
   1 warning and 1 error generated.


vim +2535 drivers/usb/gadget/composite.c

  2504	
  2505	void composite_resume(struct usb_gadget *gadget)
  2506	{
  2507		struct usb_composite_dev	*cdev = get_gadget_data(gadget);
  2508		struct usb_function		*f;
  2509		unsigned			maxpower;
  2510	
  2511		/* REVISIT:  should we have config level
  2512		 * suspend/resume callbacks?
  2513		 */
  2514		DBG(cdev, "resume\n");
  2515		if (cdev->driver->resume)
  2516			cdev->driver->resume(cdev);
  2517		if (cdev->config) {
  2518			list_for_each_entry(f, &cdev->config->functions, list) {
  2519				if (f->resume)
  2520					f->resume(f);
  2521			}
  2522	
  2523			maxpower = cdev->config->MaxPower ?
  2524				cdev->config->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
  2525			if (gadget->speed < USB_SPEED_SUPER)
  2526				maxpower = min(maxpower, 500U);
  2527			else
  2528				maxpower = min(maxpower, 900U);
  2529	
  2530			if (maxpower > USB_SELF_POWER_VBUS_MAX_DRAW)
  2531				usb_gadget_clear_selfpowered(gadget);
  2532	
  2533			usb_gadget_vbus_draw(gadget, maxpower);
  2534		} else {
> 2535			maxpower = min(CONFIG_USB_GADGET_VBUS_DRAW, 100U)
  2536			usb_gadget_vbus_draw(gadget, maxpower);
  2537		}
  2538	
  2539		cdev->suspended = 0;
  2540	}
  2541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
