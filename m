Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16AA18C16;
	Wed, 21 Jun 2023 17:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687369156; x=1718905156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yywjmcFhp0Xhr10wWSryUggb3ssTjcNnG7Uf/H71MUg=;
  b=Y2F+EyMM8J9AZ0FcJCFucvO4WHVLCMNKCr+XrVJxOxh+JlDDNCnaBFTG
   zMeyA5odjhWANxbthNxJmmgdi4IqmzTcoaYves1LXz+E0XU3NOhDOwU60
   FPnwF0kQ7I2m6TdOLMnThOm7loHegUAdbYqTzdhBF6AnfZC4m6rpV7U3d
   GBWYlY4uUH5n8gs3ODssXpb4jw4ZNhkFBOADce0iZlmxnwC5nSwzgvOW8
   0dRCIV2JuRYemDP18ZWRBD6ESz81h0dNeWgKV4jObt/vn/KulaBibW1iT
   GUnfSCsFyX1QHBRnP+36gW06AsE26VtHGURTlB+jTl2yFKMnZCGnaw559
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="339869390"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="339869390"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 10:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="1044815270"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="1044815270"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jun 2023 10:39:14 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC1nV-0006zj-2F;
	Wed, 21 Jun 2023 17:39:13 +0000
Date: Thu, 22 Jun 2023 01:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] USB: make usb class a const structure
Message-ID: <202306220131.tZ2QkUzF-lkp@intel.com>
References: <20230621150903.1219439-1-ivan.orlov0322@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621150903.1219439-1-ivan.orlov0322@gmail.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Orlov/USB-make-usb-class-a-const-structure/20230621-231418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230621150903.1219439-1-ivan.orlov0322%40gmail.com
patch subject: [PATCH v2] USB: make usb class a const structure
config: hexagon-randconfig-r041-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220131.tZ2QkUzF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220131.tZ2QkUzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220131.tZ2QkUzF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/core/file.c:25:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/usb/core/file.c:25:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/usb/core/file.c:25:
   In file included from include/linux/usb.h:16:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/usb/core/file.c:132:6: warning: variable 'retval' is uninitialized when used here [-Wuninitialized]
           if (retval)
               ^~~~~~
   drivers/usb/core/file.c:113:12: note: initialize the variable 'retval' to silence this warning
           int retval;
                     ^
                      = 0
   7 warnings generated.


vim +/retval +132 drivers/usb/core/file.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  126  
^1da177e4c3f41 Linus Torvalds     2005-04-16  127  	if (class_driver->fops == NULL)
0026e00523a85b Alan Stern         2010-09-21  128  		return -EINVAL;
0026e00523a85b Alan Stern         2010-09-21  129  	if (intf->minor >= 0)
0026e00523a85b Alan Stern         2010-09-21  130  		return -EADDRINUSE;
0026e00523a85b Alan Stern         2010-09-21  131  
0026e00523a85b Alan Stern         2010-09-21 @132  	if (retval)
0026e00523a85b Alan Stern         2010-09-21  133  		return retval;
0026e00523a85b Alan Stern         2010-09-21  134  
079d440e103da3 Greg Kroah-Hartman 2012-05-01  135  	dev_dbg(&intf->dev, "looking for a minor, starting at %d\n", minor_base);
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  
d4ead16f50f9ad Alan Stern         2007-05-22  137  	down_write(&minor_rwsem);
^1da177e4c3f41 Linus Torvalds     2005-04-16  138  	for (minor = minor_base; minor < MAX_USB_MINORS; ++minor) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  139  		if (usb_minors[minor])
^1da177e4c3f41 Linus Torvalds     2005-04-16  140  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  141  
^1da177e4c3f41 Linus Torvalds     2005-04-16  142  		usb_minors[minor] = class_driver->fops;
0026e00523a85b Alan Stern         2010-09-21  143  		intf->minor = minor;
^1da177e4c3f41 Linus Torvalds     2005-04-16  144  		break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  145  	}
303911cfc5b95d Alan Stern         2019-08-12  146  	if (intf->minor < 0) {
d4ead16f50f9ad Alan Stern         2007-05-22  147  		up_write(&minor_rwsem);
0026e00523a85b Alan Stern         2010-09-21  148  		return -EXFULL;
303911cfc5b95d Alan Stern         2019-08-12  149  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  150  
^1da177e4c3f41 Linus Torvalds     2005-04-16  151  	/* create a usb class device for this usb interface */
7071a3ce0ca058 Kay Sievers        2008-05-02  152  	snprintf(name, sizeof(name), class_driver->name, minor - minor_base);
56a929ad72b02b Ivan Orlov         2023-06-21  153  	intf->usb_dev = device_create(&usbmisc_class, &intf->dev,
f7a386c5b8ff34 Kay Sievers        2009-04-30  154  				      MKDEV(USB_MAJOR, minor), class_driver,
f8868ed0078a84 Andy Shevchenko    2015-12-10  155  				      "%s", kbasename(name));
0873c76485c126 Greg Kroah-Hartman 2006-06-20  156  	if (IS_ERR(intf->usb_dev)) {
0026e00523a85b Alan Stern         2010-09-21  157  		usb_minors[minor] = NULL;
0026e00523a85b Alan Stern         2010-09-21  158  		intf->minor = -1;
0873c76485c126 Greg Kroah-Hartman 2006-06-20  159  		retval = PTR_ERR(intf->usb_dev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  160  	}
303911cfc5b95d Alan Stern         2019-08-12  161  	up_write(&minor_rwsem);
^1da177e4c3f41 Linus Torvalds     2005-04-16  162  	return retval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  163  }
782e70c6fc2290 Greg Kroah-Hartman 2008-01-25  164  EXPORT_SYMBOL_GPL(usb_register_dev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  165  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
