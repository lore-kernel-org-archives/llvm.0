Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3AE4C89
	for <llvm@lists.linux.dev>; Mon, 27 Jun 2022 22:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656368457; x=1687904457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1p92oKGtpDrqQ9Y9oS4vEBYwwNfh4RPe5QSBZhO1TkE=;
  b=On1cZHg6i+f01evJIs+d8Zvsl4dadcmNAlNTltSW546fPBbuoN2gRJMu
   qn2NcAKHiy34DI6zyCJslxO539uxJQ7yeSKREIIJ61QdvWPuoNyxhTZ3D
   eFnUTy5HYdvRCPxxE/ayJgr0wh9NKWTRfRFAQ7U856a1CtXHApe1ioHQ7
   M2JeazWEpyjpMVNIZsmPd6fvI+1dkezEOLxXWZD0P7KkLaEdHJce5sHAC
   j60BTsvy3YgCMmGc1Z2++qGIFoQlfQB5Cq3xnq5fwo4vXoVDjMPlHzra0
   liZcGQOSM93aLpnjU71eE09/mzspMBsNyKCvUc7+yW7Ir/+0nV/rcPcaQ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="261380672"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="261380672"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 15:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="590077925"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jun 2022 15:20:55 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5x6F-00097b-0P;
	Mon, 27 Jun 2022 22:20:55 +0000
Date: Tue, 28 Jun 2022 06:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v23 2/3] usb: misc: Add onboard_usb_hub driver
Message-ID: <202206280628.JyfBwOj6-lkp@intel.com>
References: <20220622144857.v23.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622144857.v23.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>

Hi Matthias,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next driver-core/driver-core-testing linus/master v5.19-rc4 next-20220627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthias-Kaehlcke/usb-misc-Add-onboard_usb_hub-driver/20220623-055345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: powerpc-randconfig-c003-20220626 (https://download.01.org/0day-ci/archive/20220628/202206280628.JyfBwOj6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0d6dd3905db145853c7c744ac92d49b00b1fa20)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ca463a6be5677cdb098dd5a431dd4aa06da8a0fe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthias-Kaehlcke/usb-misc-Add-onboard_usb_hub-driver/20220623-055345
        git checkout ca463a6be5677cdb098dd5a431dd4aa06da8a0fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/core/../misc/onboard_usb_hub_pdevs.c:44:6: warning: no previous prototype for function 'onboard_hub_create_pdevs' [-Wmissing-prototypes]
   void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
        ^
   drivers/usb/core/../misc/onboard_usb_hub_pdevs.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
   ^
   static 
>> drivers/usb/core/../misc/onboard_usb_hub_pdevs.c:127:6: warning: no previous prototype for function 'onboard_hub_destroy_pdevs' [-Wmissing-prototypes]
   void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
        ^
   drivers/usb/core/../misc/onboard_usb_hub_pdevs.c:127:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
   ^
   static 
   2 warnings generated.


vim +/onboard_hub_create_pdevs +44 drivers/usb/core/../misc/onboard_usb_hub_pdevs.c

    30	
    31	/**
    32	 * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
    33	 * @parent_hub	: parent hub to scan for connected onboard hubs
    34	 * @pdev_list	: list of onboard hub platform devices owned by the parent hub
    35	 *
    36	 * Creates a platform device for each supported onboard hub that is connected to
    37	 * the given parent hub. The platform device is in charge of initializing the
    38	 * hub (enable regulators, take the hub out of reset, ...) and can optionally
    39	 * control whether the hub remains powered during system suspend or not.
    40	
    41	 * To keep track of the platform devices they are added to
    42	 * a list that is owned by the parent hub.
    43	 */
  > 44	void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
    45	{
    46		int i;
    47		struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
    48		struct device_node *np, *npc;
    49		struct platform_device *pdev;
    50		struct pdev_list_entry *pdle;
    51	
    52		if (!parent_hub->dev.of_node)
    53			return;
    54	
    55		/*
    56		 * We only want one platform device for each physical hub. For root hubs
    57		 * this function can be called multiple times with the same root hub
    58		 * node (the HCD node). Only create pdevs if the root hub is the one of
    59		 * the primary HCD.
    60		 */
    61		if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
    62			return;
    63	
    64		for (i = 1; i <= parent_hub->maxchild; i++) {
    65			np = usb_of_get_device_node(parent_hub, i);
    66			if (!np)
    67				continue;
    68	
    69			if (!of_is_onboard_usb_hub(np))
    70				goto node_put;
    71	
    72			npc = of_parse_phandle(np, "companion-hub", 0);
    73			if (npc) {
    74				/*
    75				 * Hubs with companions share the same platform device.
    76				 * Create the plaform device only if 'parent_hub' is
    77				 * connected to the primary HCD (directly or through
    78				 * other hubs).
    79				 */
    80				if (!usb_hcd_is_primary_hcd(hcd)) {
    81					of_node_put(npc);
    82					goto node_put;
    83				}
    84	
    85				pdev = of_find_device_by_node(npc);
    86				of_node_put(npc);
    87	
    88				if (pdev) {
    89					/*
    90					 * The companion hub already has a platform device,
    91					 * nothing to do here.
    92					 */
    93					put_device(&pdev->dev);
    94					goto node_put;
    95				}
    96			}
    97	
    98			pdev = of_platform_device_create(np, NULL, &parent_hub->dev);
    99			if (!pdev) {
   100				dev_err(&parent_hub->dev,
   101					"failed to create platform device for onboard hub '%pOF'\n", np);
   102				goto node_put;
   103			}
   104	
   105			pdle = kzalloc(sizeof(*pdle), GFP_KERNEL);
   106			if (!pdle) {
   107				of_platform_device_destroy(&pdev->dev, NULL);
   108				goto node_put;
   109			}
   110	
   111			pdle->pdev = pdev;
   112			list_add(&pdle->node, pdev_list);
   113	
   114	node_put:
   115			of_node_put(np);
   116		}
   117	}
   118	EXPORT_SYMBOL_GPL(onboard_hub_create_pdevs);
   119	
   120	/**
   121	 * onboard_hub_destroy_pdevs -- free resources of onboard hub platform devices
   122	 * @pdev_list	: list of onboard hub platform devices
   123	 *
   124	 * Destroys the platform devices in the given list and frees the memory associated
   125	 * with the list entry.
   126	 */
 > 127	void onboard_hub_destroy_pdevs(struct list_head *pdev_list)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
