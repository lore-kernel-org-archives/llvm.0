Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2EE13725;
	Fri, 14 Jul 2023 13:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689339883; x=1720875883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhaAGBgcVFiwVrGJbcHM+g3488vEuUjFaxsyzpwKSUM=;
  b=FX/zGlh7eDFIikgaxxk3p6P2MOoFSNwzou3+UHEbo1POStm8AuD+re9z
   VxAIueDywB3kD2KQoQACWhs+vrwXibyw1WyfqsDt7gADoODoUCq20bWgF
   ARcTRPfisGNQNuhMYyo5SI1rsyzilrvzafg4G16jbopl2UahgV1Igapgq
   GJES084OKYY3Yvq49YWmhsUzjmj6eCBHmSDbA35rkFe65QYjYMPRi3fn+
   V8aTtqadP/cSro6I8D7tB2O1k6TwE2JbYKOkhhOsGeajj7xQWuqxSxuen
   zWZ2zTCrdeIZrmZy6myN6p0+sDDfhTD1spou51raTCBpPh0VXxghTOyGe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365507959"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="365507959"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 06:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="836036154"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="836036154"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2023 06:04:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKITK-0007SH-2p;
	Fri, 14 Jul 2023 13:04:34 +0000
Date: Fri, 14 Jul 2023 21:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 56/94]
 drivers/accessibility/speakup/spk_ttyio.c:55:17: error: no member named
 'write' in 'struct tty_operations'
Message-ID: <202307142143.nUPtRpVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   071ae35d4018d22d6addf02ae7014b2004e781f0
commit: e034e751e4b6fe5061c660558b90dc4a2a43305b [56/94] tty: propagate u8 data to tty_operations::write()
config: hexagon-randconfig-r025-20230714 (https://download.01.org/0day-ci/archive/20230714/202307142143.nUPtRpVW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142143.nUPtRpVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142143.nUPtRpVW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accessibility/speakup/spk_ttyio.c:3:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/accessibility/speakup/spk_ttyio.c:3:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/accessibility/speakup/spk_ttyio.c:3:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/accessibility/speakup/spk_ttyio.c:55:17: error: no member named 'write' in 'struct tty_operations'
      55 |         if (!tty->ops->write)
         |              ~~~~~~~~  ^
   drivers/accessibility/speakup/spk_ttyio.c:229:37: error: no member named 'write' in 'struct tty_operations'
     229 |         if (!in_synth->alive || !tty->ops->write)
         |                                  ~~~~~~~~  ^
   drivers/accessibility/speakup/spk_ttyio.c:232:18: error: no member named 'write' in 'struct tty_operations'
     232 |         ret = tty->ops->write(tty, &ch, 1);
         |               ~~~~~~~~  ^
   6 warnings and 3 errors generated.
--
   In file included from drivers/misc/ti-st/st_core.c:12:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/misc/ti-st/st_core.c:12:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/misc/ti-st/st_core.c:12:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/misc/ti-st/st_core.c:82:19: error: no member named 'write' in 'struct tty_operations'
      82 |         return tty->ops->write(tty, data, count);
         |                ~~~~~~~~  ^
   6 warnings and 1 error generated.
--
   In file included from drivers/net/ppp/ppp_synctty.c:33:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ppp/ppp_synctty.c:33:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ppp/ppp_synctty.c:33:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/ppp/ppp_synctty.c:162:16: error: no member named 'write' in 'struct tty_operations'
     162 |         if (tty->ops->write == NULL)
         |             ~~~~~~~~  ^
   drivers/net/ppp/ppp_synctty.c:600:21: error: no member named 'write' in 'struct tty_operations'
     600 |                         sent = tty->ops->write(tty, ap->tpkt->data, ap->tpkt->len);
         |                                ~~~~~~~~  ^
   6 warnings and 2 errors generated.
--
   In file included from drivers/net/can/slcan/slcan-core.c:48:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/can/slcan/slcan-core.c:48:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/can/slcan/slcan-core.c:48:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/can/slcan/slcan-core.c:537:25: error: no member named 'write' in 'struct tty_operations'
     537 |         actual = sl->tty->ops->write(sl->tty, sl->xbuff, pos - sl->xbuff);
         |                  ~~~~~~~~~~~~  ^
   drivers/net/can/slcan/slcan-core.c:575:25: error: no member named 'write' in 'struct tty_operations'
     575 |         actual = sl->tty->ops->write(sl->tty, sl->xhead, sl->xleft);
         |                  ~~~~~~~~~~~~  ^
   drivers/net/can/slcan/slcan-core.c:638:25: error: no member named 'write' in 'struct tty_operations'
     638 |         actual = sl->tty->ops->write(sl->tty, sl->xbuff, n);
         |                  ~~~~~~~~~~~~  ^
   drivers/net/can/slcan/slcan-core.c:812:17: error: no member named 'write' in 'struct tty_operations'
     812 |         if (!tty->ops->write)
         |              ~~~~~~~~  ^
   6 warnings and 4 errors generated.


vim +55 drivers/accessibility/speakup/spk_ttyio.c

a5525dc0b8341c drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-06-25  46  
1ab92da32e3775 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  47  static int spk_ttyio_ldisc_open(struct tty_struct *tty)
1ab92da32e3775 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  48  {
6b9ad1c742bf22 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  49  	struct spk_ldisc_data *ldisc_data;
6b9ad1c742bf22 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  50  
f0992098cadb4c drivers/accessibility/speakup/spk_ttyio.c Samuel Thibault    2020-11-29  51  	if (tty != speakup_tty)
f0992098cadb4c drivers/accessibility/speakup/spk_ttyio.c Samuel Thibault    2020-11-29  52  		/* Somebody tried to use this line discipline outside speakup */
f0992098cadb4c drivers/accessibility/speakup/spk_ttyio.c Samuel Thibault    2020-11-29  53  		return -ENODEV;
f0992098cadb4c drivers/accessibility/speakup/spk_ttyio.c Samuel Thibault    2020-11-29  54  
2b90bf28ac38b6 drivers/staging/speakup/spk_ttyio.c       Bhagyashri Dighole 2019-03-06 @55  	if (!tty->ops->write)
1ab92da32e3775 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  56  		return -EOPNOTSUPP;
d4122754442799 drivers/accessibility/speakup/spk_ttyio.c Samuel Thibault    2020-11-10  57  
7cf9a79dbae127 drivers/staging/speakup/spk_ttyio.c       Sam Muhammed       2020-03-24  58  	ldisc_data = kmalloc(sizeof(*ldisc_data), GFP_KERNEL);
f0992098cadb4c drivers/accessibility/speakup/spk_ttyio.c Samuel Thibault    2020-11-29  59  	if (!ldisc_data)
6b9ad1c742bf22 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  60  		return -ENOMEM;
6b9ad1c742bf22 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  61  
d6a0de49337464 drivers/staging/speakup/spk_ttyio.c       Arnd Bergmann      2018-12-10  62  	init_completion(&ldisc_data->completion);
6b9ad1c742bf22 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  63  	ldisc_data->buf_free = true;
f0992098cadb4c drivers/accessibility/speakup/spk_ttyio.c Samuel Thibault    2020-11-29  64  	tty->disc_data = ldisc_data;
6b9ad1c742bf22 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  65  
1ab92da32e3775 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  66  	return 0;
1ab92da32e3775 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  67  }
1ab92da32e3775 drivers/staging/speakup/spk_ttyio.c       Okash Khawaja      2017-05-15  68  

:::::: The code at line 55 was first introduced by commit
:::::: 2b90bf28ac38b697a3f48a6664a02b374aa18f99 staging: speakup: Comparison to NULL.

:::::: TO: Bhagyashri Dighole <digholebhagyashri@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
