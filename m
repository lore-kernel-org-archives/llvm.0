Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543E8613E;
	Fri, 18 Aug 2023 04:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692333724; x=1723869724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G36Qd9hgbHcwJG9GZKW0oip/LIbLVmolK1qUKZmVkQw=;
  b=hqb5puhuxPDI8SIz0rX4vFjSpgvNutXhBysIqqZpZlJBi3AC6nKgNsqO
   7Knedv5oM418sMtJ5oYQVqDOjMD88/neshvrHz8SsOVnqxtUcyHOr9tXj
   YLc4jmyi0niNtQ4N0/fMq1MFNcXxlW83o61qtDEaTXBW3GTHvULHj2mDJ
   l0A2352eEskiLbbNADDHnK992hnwrzb34X3VKNmwVeKBWNgQynCVPOdtD
   4USc9/VbRRaBiFI5iycNNabkl+r80PTcM0aaRcq/QGoocrcqKtfVo0Dyz
   PbBRbJgR8Usowf48Kkolb+2uFJGwxp/VI+0L+8kBo8fB/u/GBEJs846K3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363171556"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="363171556"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 21:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800324893"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="800324893"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 21:42:00 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWrJ9-00026c-2M;
	Fri, 18 Aug 2023 04:41:59 +0000
Date: Fri, 18 Aug 2023 12:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [stable:linux-6.1.y 6854/8698] drivers/usb/gadget/udc/core.c:56:
 warning: Function parameter or member 'vbus_work' not described in 'usb_udc'
Message-ID: <202308181228.oUyNPyxW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   6c44e13dc284f7f4db17706ca48fd016d6b3d49a
commit: 3c048d42c305cba61c2040702778023a7b973b22 [6854/8698] usb: gadget: udc: core: Offload usb_udc_vbus_handler processing
config: i386-randconfig-i001-20230817 (https://download.01.org/0day-ci/archive/20230818/202308181228.oUyNPyxW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181228.oUyNPyxW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181228.oUyNPyxW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member 'vbus_work' not described in 'usb_udc'


vim +56 drivers/usb/gadget/udc/core.c

fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern             2022-04-23  30  
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  31  /**
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  32   * struct usb_udc - describes one usb device controller
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  33   * @driver: the gadget driver pointer. For use by the class code
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  34   * @dev: the child device to the actual controller
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  35   * @gadget: the gadget. For use by the class code
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  36   * @list: for use by the udc class driver
e21cd08f965766 drivers/usb/gadget/udc/core.c     Lee Jones              2020-07-03  37   * @vbus: for udcs who care about vbus status, this value is real vbus status;
628ef0d273a69d drivers/usb/gadget/udc/udc-core.c Peter Chen             2015-03-06  38   * for udcs who do not care about vbus status, this value is always true
49d08cfc783044 drivers/usb/gadget/udc/core.c     Thinh Nguyen           2021-01-11  39   * @started: the UDC's started state. True if the UDC had started.
3c048d42c305cb drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  40   * @allow_connect: Indicates whether UDC is allowed to be pulled up.
3c048d42c305cb drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  41   * Set/cleared by gadget_(un)bind_driver() after gadget driver is bound or
3c048d42c305cb drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  42   * unbound.
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  43   *
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  44   * This represents the internal data structure which is used by the UDC-class
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  45   * to hold information about udc driver and gadget together.
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  46   */
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  47  struct usb_udc {
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  48  	struct usb_gadget_driver	*driver;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  49  	struct usb_gadget		*gadget;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  50  	struct device			dev;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  51  	struct list_head		list;
628ef0d273a69d drivers/usb/gadget/udc/udc-core.c Peter Chen             2015-03-06  52  	bool				vbus;
49d08cfc783044 drivers/usb/gadget/udc/core.c     Thinh Nguyen           2021-01-11  53  	bool				started;
3c048d42c305cb drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  54  	bool				allow_connect;
3c048d42c305cb drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-09  55  	struct work_struct		vbus_work;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28 @56  };
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi           2011-06-28  57  

:::::: The code at line 56 was first introduced by commit
:::::: 2ccea03a8f7ec93641791f2760d7cdc6cab6205f usb: gadget: introduce UDC Class

:::::: TO: Felipe Balbi <balbi@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
