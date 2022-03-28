Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052FF17D0
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 05:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648445909; x=1679981909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yNGqs5UQKpnEQwK+7b2EzmfdzXgeEkQtJEt+djm9eTA=;
  b=hEZAoNQgsEYPxelDWm1cL7RecF9c3zie2K/jnjl8QBAu25kGnuDVYvyh
   mBaJgehvte0vUyPmvJGDjt8RyYHt0QPs5wsavLdSA+WQOckND47iKzjhG
   VWxpj/yA5eXovdwwK8LyT6ed7uYH4mC9+QEE+E41t1muwloMkTntoQ+if
   rd9THyF5WOUDyJu6d890DFw0BoyCPwCBy49xqB54w0x4ZMZ1P3OBwCanB
   nLfDmWbMznLjBVME/SWcYxjkf3hwTSqq+Ia+Ey7aYsbdqNBd7dC1VJcRy
   pYSI62FoQr6b7j3agNitsArEBzO5kT0C8I+kSvrxu20DVDFw4MMdZsuHG
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="259102260"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="259102260"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 22:38:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="520876292"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 27 Mar 2022 22:38:26 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYi5B-0001kg-LY; Mon, 28 Mar 2022 05:38:25 +0000
Date: Mon, 28 Mar 2022 13:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Haowen Bai <baihaowen@meizu.com>, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	Haowen Bai <baihaowen@meizu.com>
Subject: Re: [PATCH] s390: Simplify the calculation of variables
Message-ID: <202203281319.E0AKjDcq-lkp@intel.com>
References: <1648434982-28862-1-git-send-email-baihaowen@meizu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1648434982-28862-1-git-send-email-baihaowen@meizu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Haowen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on s390/features]
[also build test ERROR on v5.17 next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Haowen-Bai/s390-Simplify-the-calculation-of-variables/20220328-103807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
config: s390-randconfig-r044-20220328 (https://download.01.org/0day-ci/archive/20220328/202203281319.E0AKjDcq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7356660d5a4a5dc70f5e18b63125c43d218885f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Haowen-Bai/s390-Simplify-the-calculation-of-variables/20220328-103807
        git checkout 7356660d5a4a5dc70f5e18b63125c43d218885f3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/nfc/nfcmrvl/main.c:9:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/nfc/nfcmrvl/main.c:9:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/nfc/nfcmrvl/main.c:9:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from drivers/nfc/nfcmrvl/main.c:9:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:7:
   In file included from include/linux/irq.h:592:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:1901:
   In file included from arch/s390/include/asm/pci.h:12:
   In file included from arch/s390/include/asm/sclp.h:20:
   In file included from arch/s390/include/asm/chpid.h:10:
   In file included from arch/s390/include/asm/cio.h:18:
>> arch/s390/include/asm/scsw.h:695:47: error: expected ';' after return statement
                  (scsw->tm.actl & SCSW_ACTL_SUSPENDED))
                                                        ^
                                                        ;
   12 warnings and 1 error generated.


vim +695 arch/s390/include/asm/scsw.h

   682	
   683	/**
   684	 * scsw_tm_is_valid_pno - check pno field validity
   685	 * @scsw: pointer to scsw
   686	 *
   687	 * Return non-zero if the pno field of the specified transport mode scsw is
   688	 * valid, zero otherwise.
   689	 */
   690	static inline int scsw_tm_is_valid_pno(union scsw *scsw)
   691	{
   692		return (scsw->tm.fctl != 0) &&
   693		       (scsw->tm.stctl & SCSW_STCTL_STATUS_PEND) &&
   694		       (!(scsw->tm.stctl & SCSW_STCTL_INTER_STATUS) ||
 > 695		       (scsw->tm.actl & SCSW_ACTL_SUSPENDED))
   696	}
   697	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
