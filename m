Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0887B;
	Sat, 11 Mar 2023 05:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678512824; x=1710048824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SggZT2Ee0L6XRQq9wWa+tN+IDguEWUmBdJ0Ovq03FTA=;
  b=UaTjBOs1p3XCMcYtUdY2w2J4p4SXF05FcBn7Y+OjXPMG2AvrGCI9dea2
   p+kMPUlpZ2mvYnMH09pcGgxw30vSlnbQ0pDFHXzRYyzntxEpYFJ3ac8AH
   embN/8bOzWECKJ1ETH1R9sOBzHMg7HKaQMDPOE6gRMmajBVp7R6sOdFlP
   7+S2uTSnH1wgOnThr7A5TBLTRg1psOH0GuN4opgL8GWL29IvKufei7a4A
   nVe6B4xItqTQbwmFwBJNTcG8iq4YfrbyFgA/xJDMGVOI/8hABes4WMA7Y
   fGkpJOhx+uyIDle6WQB1nRnYdx2qPHp903P5n5871fSoyxMNzdgdyF2tB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="336901706"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="336901706"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 21:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="708269515"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="708269515"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Mar 2023 21:33:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1parrR-0004MR-07;
	Sat, 11 Mar 2023 05:33:41 +0000
Date: Sat, 11 Mar 2023 13:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:feature_interrupters 2/4]
 drivers/usb/host/xhci-mem.c:1863:6: warning: no previous prototype for
 function 'xhci_remove_secondary_interrupter'
Message-ID: <202303111308.3ibde4Jv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
head:   93b93462a62a86505a34344c2342741388b36d1a
commit: c4af77c48e66f6fa214a9a52a41cc910f7916194 [2/4] xhci: add support to allocate several interrupters
config: powerpc-randconfig-r002-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111308.3ibde4Jv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?id=c4af77c48e66f6fa214a9a52a41cc910f7916194
        git remote add mnyman-xhci https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
        git fetch --no-tags mnyman-xhci feature_interrupters
        git checkout c4af77c48e66f6fa214a9a52a41cc910f7916194
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111308.3ibde4Jv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-mem.c:1863:6: warning: no previous prototype for function 'xhci_remove_secondary_interrupter' [-Wmissing-prototypes]
   void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
        ^
   drivers/usb/host/xhci-mem.c:1863:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
   ^
   static 
>> drivers/usb/host/xhci-mem.c:2346:1: warning: no previous prototype for function 'xhci_create_secondary_interrupter' [-Wmissing-prototypes]
   xhci_create_secondary_interrupter(struct usb_hcd *hcd)
   ^
   drivers/usb/host/xhci-mem.c:2345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct xhci_interrupter *
   ^
   static 
   2 warnings generated.


vim +/xhci_remove_secondary_interrupter +1863 drivers/usb/host/xhci-mem.c

  1862	
> 1863	void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
  1864	{
  1865		struct xhci_hcd *xhci = hcd_to_xhci(hcd);
  1866		unsigned int intr_num;
  1867	
  1868		/* interrupter 0 is primary interrupter, don't touch it */
  1869		if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters)
  1870			xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
  1871	
  1872		/* fixme, should we check xhci->interrupter[intr_num] == ir */
  1873		/* fixme locking */
  1874	
  1875		spin_lock_irq(&xhci->lock);
  1876	
  1877		intr_num = ir->intr_num;
  1878		xhci_free_interrupter(xhci, ir);
  1879		xhci->interrupters[intr_num] = NULL;
  1880	
  1881		spin_unlock_irq(&xhci->lock);
  1882	}
  1883	EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
  1884	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
