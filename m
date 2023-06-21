Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431F17724;
	Wed, 21 Jun 2023 20:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687378519; x=1718914519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cFC8PxhRpKaOoj95PpG7XiJV4n6xkxJT31hbK1/3x/M=;
  b=PPLG0QV2zrNns99oqlKZ7nSN6vvu2q05Plb4I06WxObyuJB84Ax1/rg9
   ifIIA1j6nqM+nyIEfZZFmtlyxaujtwNowwGudwFYSQ0Y2rRcMmJxCDwsr
   hUZOU2+l+eviuDSRa3009UANkVrG4bdjbFQQdxiX+z3CyOp+oc0f8AJ/I
   5P0nk69jXcSYVMVGaQSVIn419IvyejCZotmsykdOA8L6pLJzS+bzxOVwX
   EwPB2X/mufTlOoDCqbB5g3gBK8bfAoc/SG2UsHY534te8/rYZ1TZO2Qlp
   ioFAM0YWFKXxF6iJZe3bRN5UP5d8LjgMwhQN6BDS1BbycpkzO7XMF+G5R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="350019159"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="350019159"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 13:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="717795141"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="717795141"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jun 2023 13:15:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC4EX-00074P-2k;
	Wed, 21 Jun 2023 20:15:17 +0000
Date: Thu, 22 Jun 2023 04:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] USB: make usb class a const structure
Message-ID: <202306220408.HLLtOljU-lkp@intel.com>
References: <20230621175259.1221852-1-ivan.orlov0322@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621175259.1221852-1-ivan.orlov0322@gmail.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-next]
[also build test WARNING on usb/usb-linus linus/master v6.4-rc7 next-20230621]
[cannot apply to usb/usb-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Orlov/USB-make-usb-class-a-const-structure/20230622-015606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
patch link:    https://lore.kernel.org/r/20230621175259.1221852-1-ivan.orlov0322%40gmail.com
patch subject: [PATCH v3] USB: make usb class a const structure
config: hexagon-randconfig-r005-20230622 (https://download.01.org/0day-ci/archive/20230622/202306220408.HLLtOljU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220408.HLLtOljU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220408.HLLtOljU-lkp@intel.com/

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
>> drivers/usb/core/file.c:153:2: warning: variable 'retval' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (IS_ERR(intf->usb_dev)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/file.c:159:9: note: uninitialized use occurs here
           return retval;
                  ^~~~~~
   drivers/usb/core/file.c:153:2: note: remove the 'if' if its condition is always true
           if (IS_ERR(intf->usb_dev)) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/core/file.c:113:12: note: initialize the variable 'retval' to silence this warning
           int retval;
                     ^
                      = 0
   7 warnings generated.


vim +153 drivers/usb/core/file.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  126  
^1da177e4c3f415 Linus Torvalds     2005-04-16  127  	if (class_driver->fops == NULL)
0026e00523a85b9 Alan Stern         2010-09-21  128  		return -EINVAL;
0026e00523a85b9 Alan Stern         2010-09-21  129  	if (intf->minor >= 0)
0026e00523a85b9 Alan Stern         2010-09-21  130  		return -EADDRINUSE;
0026e00523a85b9 Alan Stern         2010-09-21  131  
079d440e103da3e Greg Kroah-Hartman 2012-05-01  132  	dev_dbg(&intf->dev, "looking for a minor, starting at %d\n", minor_base);
^1da177e4c3f415 Linus Torvalds     2005-04-16  133  
d4ead16f50f9ad3 Alan Stern         2007-05-22  134  	down_write(&minor_rwsem);
^1da177e4c3f415 Linus Torvalds     2005-04-16  135  	for (minor = minor_base; minor < MAX_USB_MINORS; ++minor) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  136  		if (usb_minors[minor])
^1da177e4c3f415 Linus Torvalds     2005-04-16  137  			continue;
^1da177e4c3f415 Linus Torvalds     2005-04-16  138  
^1da177e4c3f415 Linus Torvalds     2005-04-16  139  		usb_minors[minor] = class_driver->fops;
0026e00523a85b9 Alan Stern         2010-09-21  140  		intf->minor = minor;
^1da177e4c3f415 Linus Torvalds     2005-04-16  141  		break;
^1da177e4c3f415 Linus Torvalds     2005-04-16  142  	}
303911cfc5b95d3 Alan Stern         2019-08-12  143  	if (intf->minor < 0) {
d4ead16f50f9ad3 Alan Stern         2007-05-22  144  		up_write(&minor_rwsem);
0026e00523a85b9 Alan Stern         2010-09-21  145  		return -EXFULL;
303911cfc5b95d3 Alan Stern         2019-08-12  146  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  147  
^1da177e4c3f415 Linus Torvalds     2005-04-16  148  	/* create a usb class device for this usb interface */
7071a3ce0ca058a Kay Sievers        2008-05-02  149  	snprintf(name, sizeof(name), class_driver->name, minor - minor_base);
c235e8495e967ed Ivan Orlov         2023-06-21  150  	intf->usb_dev = device_create(&usbmisc_class, &intf->dev,
f7a386c5b8ff34c Kay Sievers        2009-04-30  151  				      MKDEV(USB_MAJOR, minor), class_driver,
f8868ed0078a845 Andy Shevchenko    2015-12-10  152  				      "%s", kbasename(name));
0873c76485c126a Greg Kroah-Hartman 2006-06-20 @153  	if (IS_ERR(intf->usb_dev)) {
0026e00523a85b9 Alan Stern         2010-09-21  154  		usb_minors[minor] = NULL;
0026e00523a85b9 Alan Stern         2010-09-21  155  		intf->minor = -1;
0873c76485c126a Greg Kroah-Hartman 2006-06-20  156  		retval = PTR_ERR(intf->usb_dev);
^1da177e4c3f415 Linus Torvalds     2005-04-16  157  	}
303911cfc5b95d3 Alan Stern         2019-08-12  158  	up_write(&minor_rwsem);
^1da177e4c3f415 Linus Torvalds     2005-04-16  159  	return retval;
^1da177e4c3f415 Linus Torvalds     2005-04-16  160  }
782e70c6fc2290a Greg Kroah-Hartman 2008-01-25  161  EXPORT_SYMBOL_GPL(usb_register_dev);
^1da177e4c3f415 Linus Torvalds     2005-04-16  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
