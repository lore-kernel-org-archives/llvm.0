Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC35EC2;
	Thu, 27 Apr 2023 03:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682565629; x=1714101629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufF9LJH3PIPNlWYHXWr3QPnDwk9YPJYJrOwx31fZ0Js=;
  b=eaWZoxpR1iU7u4+eL0Y9B+vQyN+luXF7ruFGkI6pf0wLIduVbcCRzfG9
   OTAKnXgkqh1DFCj4WP5UwD9mplxJ2bOU3kT0L31zA74eu8SkOLq7ruEcl
   1fFaqxcGUXjRJeklCRBJXBUMyEMLlF+jcqLW02wspUi2attIBtX6gznr6
   FMGR2B0/gQQNeo6esBiLUm3sC9gL6Z5i0HtI3h7v36V+1P8meH+OOC8Vp
   hEReag0VEf5CagTgraYg8TcgIBg2+pnBwoYXrL//7Nx6DMHh7tJjYHUhW
   xhiPRdGFFzsVoMpFy5zMOsORO3etysVCY9BbHkN3zCYpraSEBjp5stqFZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="346064985"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="346064985"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 20:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724702393"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="724702393"
Received: from lkp-server01.sh.intel.com (HELO 848ce1e85e7c) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Apr 2023 20:20:26 -0700
Received: from kbuild by 848ce1e85e7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prsBF-000013-2b;
	Thu, 27 Apr 2023 03:20:25 +0000
Date: Thu, 27 Apr 2023 11:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/usb/gadget/udc/omap_udc.c:1915:9: warning: variable 'stat'
 set but not used
Message-ID: <202304271143.hmZLtQOw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6e98b09da931a00bf4e0477d0fa52748bf28fcce
commit: 250c1a694ff304e5d69e74ab32755eddcc2b8f65 ARM: pxa: convert to multiplatform
date:   12 months ago
config: arm-randconfig-r001-20230427 (https://download.01.org/0day-ci/archive/20230427/202304271143.hmZLtQOw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=250c1a694ff304e5d69e74ab32755eddcc2b8f65
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 250c1a694ff304e5d69e74ab32755eddcc2b8f65
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/usb/gadget/udc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271143.hmZLtQOw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/omap_udc.c:1915:9: warning: variable 'stat' set but not used [-Wunused-but-set-variable]
                                   int stat;
                                       ^
   1 warning generated.


vim +/stat +1915 drivers/usb/gadget/udc/omap_udc.c

^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1887  
7d12e780e003f9 drivers/usb/gadget/omap_udc.c David Howells  2006-10-05  1888  static irqreturn_t omap_udc_pio_irq(int irq, void *_dev)
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1889  {
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1890  	u16		epn_stat, irq_src;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1891  	irqreturn_t	status = IRQ_NONE;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1892  	struct omap_ep	*ep;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1893  	int		epnum;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1894  	struct omap_udc	*udc = _dev;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1895  	struct omap_req	*req;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1896  	unsigned long	flags;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1897  
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1898  	spin_lock_irqsave(&udc->lock, flags);
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1899  	epn_stat = omap_readw(UDC_EPN_STAT);
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1900  	irq_src = omap_readw(UDC_IRQ_SRC);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1901  
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1902  	/* handle OUT first, to avoid some wasteful NAKs */
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1903  	if (irq_src & UDC_EPN_RX) {
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1904  		epnum = (epn_stat >> 8) & 0x0f;
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1905  		omap_writew(UDC_EPN_RX, UDC_IRQ_SRC);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1906  		status = IRQ_HANDLED;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1907  		ep = &udc->ep[epnum];
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1908  		ep->irqs++;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1909  
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1910  		omap_writew(epnum | UDC_EP_SEL, UDC_EP_NUM);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1911  		ep->fnf = 0;
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1912  		if (omap_readw(UDC_STAT_FLG) & UDC_ACK) {
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1913  			ep->ackwait--;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1914  			if (!list_empty(&ep->queue)) {
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16 @1915  				int stat;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1916  				req = container_of(ep->queue.next,
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1917  						struct omap_req, queue);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1918  				stat = read_fifo(ep, req);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1919  				if (!ep->double_buf)
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1920  					ep->fnf = 1;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1921  			}
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1922  		}
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1923  		/* min 6 clock delay before clearing EP_SEL ... */
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1924  		epn_stat = omap_readw(UDC_EPN_STAT);
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1925  		epn_stat = omap_readw(UDC_EPN_STAT);
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1926  		omap_writew(epnum, UDC_EP_NUM);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1927  
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1928  		/* enabling fifo _after_ clearing ACK, contrary to docs,
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1929  		 * reduces lossage; timer still needed though (sigh).
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1930  		 */
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1931  		if (ep->fnf) {
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1932  			omap_writew(UDC_SET_FIFO_EN, UDC_CTRL);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1933  			ep->ackwait = 1 + ep->double_buf;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1934  		}
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1935  		mod_timer(&ep->timer, PIO_OUT_TIMEOUT);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1936  	}
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1937  
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1938  	/* then IN transfers */
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1939  	else if (irq_src & UDC_EPN_TX) {
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1940  		epnum = epn_stat & 0x0f;
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1941  		omap_writew(UDC_EPN_TX, UDC_IRQ_SRC);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1942  		status = IRQ_HANDLED;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1943  		ep = &udc->ep[16 + epnum];
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1944  		ep->irqs++;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1945  
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1946  		omap_writew(epnum | UDC_EP_DIR | UDC_EP_SEL, UDC_EP_NUM);
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1947  		if (omap_readw(UDC_STAT_FLG) & UDC_ACK) {
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1948  			ep->ackwait = 0;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1949  			if (!list_empty(&ep->queue)) {
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1950  				req = container_of(ep->queue.next,
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1951  						struct omap_req, queue);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1952  				(void) write_fifo(ep, req);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1953  			}
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1954  		}
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1955  		/* min 6 clock delay before clearing EP_SEL ... */
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1956  		epn_stat = omap_readw(UDC_EPN_STAT);
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1957  		epn_stat = omap_readw(UDC_EPN_STAT);
f35ae6346850f6 drivers/usb/gadget/omap_udc.c Tony Lindgren  2008-07-03  1958  		omap_writew(epnum | UDC_EP_DIR, UDC_EP_NUM);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1959  		/* then 6 clocks before it'd tx */
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1960  	}
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1961  
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1962  	spin_unlock_irqrestore(&udc->lock, flags);
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1963  	return status;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1964  }
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  1965  

:::::: The code at line 1915 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
