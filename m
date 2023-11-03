Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83075FBF4;
	Fri,  3 Nov 2023 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3ThOKA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699027961; x=1730563961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZFPUVGYiRXqy1STh5WayMMM+wboc1W84vO3jLI/P4jg=;
  b=F3ThOKA9Myd1IpdSL8t98pg+QWMCuZWlK+GqIl+TTm8xYQfxxImx7ZCp
   OQc4TJepnq0Npuvywnrx5gOWmWzjQ7e2oHafdaMIR5GSTKlce5sLxnbSn
   rlhieAwnAUgHNQ6VA3og/KnOtxUsVIzD7m0p0d4ufBKw/xN3TtVA56VPi
   6I+8rdJBVKzhjKSORCPcIhlyssPRPrJMDtcal5T6CuSztNiSN3FD6qXAh
   HApZ4YFt+h3z0cE/W4iSgse367Tlg7S4AFwSDe98UdtIq5sURcKnES4oF
   FuCIxs1Kewi1ojVkhu4/cD0A8hcpbOXY8RuUdLtAvDrASVkO/+zuPEwWt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392856662"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="392856662"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 09:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="935147756"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="935147756"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Nov 2023 09:12:39 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qywmj-0002gC-13;
	Fri, 03 Nov 2023 16:12:37 +0000
Date: Sat, 4 Nov 2023 00:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 15/79] drivers/tty/tty_io.c:1152:5: error:
 conflicting types for 'tty_send_xchar'
Message-ID: <202311040030.jTV6rmft-lkp@intel.com>
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
head:   0c245952ee3106fad8a2fd3198a8e5c324e90992
commit: 44f1bce172713e922fd4fe273ad8d29e1a3e9321 [15/79] tty: make tty_operations::send_xchar accept u8 char
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231104/202311040030.jTV6rmft-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040030.jTV6rmft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040030.jTV6rmft-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/tty_io.c:75:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/tty/tty_io.c:75:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/tty/tty_io.c:75:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/tty/tty_io.c:1152:5: error: conflicting types for 'tty_send_xchar'
    1152 | int tty_send_xchar(struct tty_struct *tty, u8 ch)
         |     ^
   include/linux/tty.h:413:5: note: previous declaration is here
     413 | int tty_send_xchar(struct tty_struct *tty, char ch);
         |     ^
   12 warnings and 1 error generated.


vim +/tty_send_xchar +1152 drivers/tty/tty_io.c

  1142	
  1143	/**
  1144	 * tty_send_xchar - send priority character
  1145	 * @tty: the tty to send to
  1146	 * @ch: xchar to send
  1147	 *
  1148	 * Send a high priority character to the tty even if stopped.
  1149	 *
  1150	 * Locking: none for xchar method, write ordering for write method.
  1151	 */
> 1152	int tty_send_xchar(struct tty_struct *tty, u8 ch)
  1153	{
  1154		bool was_stopped = tty->flow.stopped;
  1155	
  1156		if (tty->ops->send_xchar) {
  1157			down_read(&tty->termios_rwsem);
  1158			tty->ops->send_xchar(tty, ch);
  1159			up_read(&tty->termios_rwsem);
  1160			return 0;
  1161		}
  1162	
  1163		if (tty_write_lock(tty, false) < 0)
  1164			return -ERESTARTSYS;
  1165	
  1166		down_read(&tty->termios_rwsem);
  1167		if (was_stopped)
  1168			start_tty(tty);
  1169		tty->ops->write(tty, &ch, 1);
  1170		if (was_stopped)
  1171			stop_tty(tty);
  1172		up_read(&tty->termios_rwsem);
  1173		tty_write_unlock(tty);
  1174		return 0;
  1175	}
  1176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
