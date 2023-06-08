Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C142E2A9CA;
	Thu,  8 Jun 2023 23:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686266400; x=1717802400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YWclXhX5PQnVsjXMUGXPdGfgZPrttY9Wds2uez4jA6k=;
  b=h2wpJGpCrVmY7Ra4JFuqBjsRzDtzPkQ1YRQd4J1N6VofvHatTC6ADQww
   GH/Fbc2dhimYBYsRPYxQB5FjNV9GFp25YJo44TuvO6me5xMCGCPYYhwq6
   AfOthNZC2Qo+5dYIefzwOgZtzE9YUMtns0yDL5XrrR/BT4sihTSAhOPYK
   99xHk2E+2jjgFqsM83m0JYrCMmAQqbHDnA5O+C2Dnk1z6/Qvu+P+PonsC
   CzpZYU1R01atZ/ETI7whDyeYKTcRzH/XEADZ94zIaEUsTH1w1MUEZYJOl
   V/++vmPFQEktD1SCcvRlty6PblXA2QC647AHyMNv0vVsscDcnIuzz44rj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360815924"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="360815924"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713286180"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="713286180"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 16:19:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7Oux-0008LI-0N;
	Thu, 08 Jun 2023 23:19:47 +0000
Date: Fri, 9 Jun 2023 07:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, colin.i.king@gmail.com,
	xuetao09@huawei.com, quic_eserrao@quicinc.com,
	water.zhangjiantao@huawei.com, peter.chen@freescale.com,
	balbi@ti.com, francesco@dolcini.it, alistair@alistair23.me,
	stephan@gerhold.net, bagasdotme@gmail.com, luca@z3ntu.xyz
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH v7 2/2] usb: gadget: udc: core: Prevent
 soft_connect_store() race
Message-ID: <202306090722.opxFRfOO-lkp@intel.com>
References: <20230608204517.105396-2-badhri@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608204517.105396-2-badhri@google.com>

Hi Badhri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d37537a1f7cf09e304fe7993cb5e732534a0fb22]

url:    https://github.com/intel-lab-lkp/linux/commits/Badhri-Jagan-Sridharan/usb-gadget-udc-core-Prevent-soft_connect_store-race/20230609-044555
base:   d37537a1f7cf09e304fe7993cb5e732534a0fb22
patch link:    https://lore.kernel.org/r/20230608204517.105396-2-badhri%40google.com
patch subject: [PATCH v7 2/2] usb: gadget: udc: core: Prevent soft_connect_store() race
config: hexagon-randconfig-r015-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090722.opxFRfOO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d37537a1f7cf09e304fe7993cb5e732534a0fb22
        b4 shazam https://lore.kernel.org/r/20230608204517.105396-2-badhri@google.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/gadget/udc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090722.opxFRfOO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/gadget/udc/core.c:17:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/usb/gadget/udc/core.c:17:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/usb/gadget/udc/core.c:17:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/usb/gadget/udc/core.c:850:1: warning: unused label 'out' [-Wunused-label]
     850 | out:
         | ^~~~
     851 |         trace_usb_gadget_deactivate(gadget, ret);
   drivers/usb/gadget/udc/core.c:886:1: warning: unused label 'out' [-Wunused-label]
     886 | out:
         | ^~~~
     887 |         trace_usb_gadget_activate(gadget, ret);
   8 warnings generated.


vim +/out +850 drivers/usb/gadget/udc/core.c

5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  815  
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  816  /**
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  817   * usb_gadget_deactivate - deactivate function which is not ready to work
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  818   * @gadget: the peripheral being deactivated
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  819   *
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  820   * This routine may be used during the gadget driver bind() call to prevent
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  821   * the peripheral from ever being visible to the USB host, unless later
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  822   * usb_gadget_activate() is called.  For example, user mode components may
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  823   * need to be activated before the system can talk to hosts.
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  824   *
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  825   * Returns zero on success, else negative errno.
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  826   */
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  827  int usb_gadget_deactivate(struct usb_gadget *gadget)
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  828  {
5e42d710a108c2 drivers/usb/gadget/udc/core.c     Felipe Balbi           2016-05-31  829  	int ret = 0;
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  830  
bfc8a68e3289a9 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-08  831  	mutex_lock(&gadget->udc->connect_lock);
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  832  	if (gadget->deactivated)
bfc8a68e3289a9 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-08  833  		goto unlock;
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  834  
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  835  	if (gadget->connected) {
bfc8a68e3289a9 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-08  836  		ret = usb_gadget_disconnect_locked(gadget);
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  837  		if (ret)
bfc8a68e3289a9 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-08  838  			goto unlock;
5e42d710a108c2 drivers/usb/gadget/udc/core.c     Felipe Balbi           2016-05-31  839  
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  840  		/*
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  841  		 * If gadget was being connected before deactivation, we want
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  842  		 * to reconnect it in usb_gadget_activate().
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  843  		 */
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  844  		gadget->connected = true;
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  845  	}
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  846  	gadget->deactivated = true;
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  847  
bfc8a68e3289a9 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-08  848  unlock:
bfc8a68e3289a9 drivers/usb/gadget/udc/core.c     Badhri Jagan Sridharan 2023-06-08  849  	mutex_unlock(&gadget->udc->connect_lock);
5e42d710a108c2 drivers/usb/gadget/udc/core.c     Felipe Balbi           2016-05-31 @850  out:
5e42d710a108c2 drivers/usb/gadget/udc/core.c     Felipe Balbi           2016-05-31  851  	trace_usb_gadget_deactivate(gadget, ret);
5e42d710a108c2 drivers/usb/gadget/udc/core.c     Felipe Balbi           2016-05-31  852  
5e42d710a108c2 drivers/usb/gadget/udc/core.c     Felipe Balbi           2016-05-31  853  	return ret;
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  854  }
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  855  EXPORT_SYMBOL_GPL(usb_gadget_deactivate);
5a8d651a2bde01 drivers/usb/gadget/udc/udc-core.c Felipe Balbi           2016-05-31  856  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
