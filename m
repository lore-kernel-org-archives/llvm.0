Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0137079E0;
	Sun,  3 Mar 2024 06:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709445862; cv=none; b=q9tYpTJFckP41FiNz5YhQ1xqr826/9kth9PplS32cWJKDN+qv9Ihl+8Hi8jvptx1pvkNEv7lceRRS3hqmvTCv9Rm7p2JA1c75XJ/2LpKZ/pgNkvSPyYGWzl84Q24ERy3gsuRwmBcHr3G1FgcPfpI+dGtfA8vHhxy2Jz8lEOWMqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709445862; c=relaxed/simple;
	bh=UBCDrEXCMJsmZB2HcTjMKmvjmaCTkQfs9Iu2mzAVAUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8gEBWbpK4/U0Ywg3/lqn0/KJVSbSozrW0guuekWnZ9JMY+o5gds2glELxX5tFhK+CfOYGkkUK6Msc6T7QbIdCuL5K+dIYUByABgg+q7G+jdi2iQ0Rj7ggk26S4CBKV69XXJnAJG4Xis2f8X7E+7iV4tNyjtMa0fJLn8WnfQCHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDk/SCIp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDk/SCIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709445860; x=1740981860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBCDrEXCMJsmZB2HcTjMKmvjmaCTkQfs9Iu2mzAVAUA=;
  b=IDk/SCIpAaByp5mpr1Ex+e+0rz2eMvA8NMzMUqL2ob8GdB4Oenn9ucO3
   DAd1SzTM2ZTDpR+xAZStUkSVX2JCoFNB1ZWXO1y9LdOkExpu1aGGDsSKf
   1lgb9kCpoWV15P+tXnQYSGEGZ44wcUvoNbj8FtBc2wAx0Bk0lIiXjG2cc
   NdpvQlfrkX0qSczF5XAV3qN/cXVnfYz88dFzjOMm7TgMpqJD895kNjDDP
   Nz2TAja3+z9xKSSjU4fdOCoJBnvYed1IET8xrV2VrZui8ItbNE32yEeJO
   tINMs+Q5DmywaqlwJe8wNeo1EgxqhLRaRS0c2HRsI9Re0J82itY0j9Obq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="29374963"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="29374963"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 22:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13318558"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Mar 2024 22:04:15 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgexI-0000ka-2L;
	Sun, 03 Mar 2024 06:04:12 +0000
Date: Sun, 3 Mar 2024 14:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/cons-font-info/v1.0 1/5]
 drivers/tty/vt/vt_ioctl.c:483:3: warning: label followed by a declaration is
 a C23 extension
Message-ID: <202403031430.heAyJDAy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/cons-font-info/v1.0
head:   06733914c1d2d19ebb61cdf6cd96d0a45d4da6ba
commit: 784438040507c68171fd2c47597f8ab85c8e6ab8 [1/5] VT: Add KDFONTINFO ioctl
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240303/202403031430.heAyJDAy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031430.heAyJDAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031430.heAyJDAy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/vt/vt_ioctl.c:15:
   In file included from include/linux/tty.h:10:
   In file included from include/linux/tty_driver.h:9:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/tty/vt/vt_ioctl.c:15:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/tty/vt/vt_ioctl.c:15:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/tty/vt/vt_ioctl.c:15:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
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
>> drivers/tty/vt/vt_ioctl.c:483:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     483 |                 struct console_font_info fnt_info;
         |                 ^
   14 warnings generated.


vim +483 drivers/tty/vt/vt_ioctl.c

   355	
   356		/* Linux m68k/i386 interface for setting the keyboard delay/repeat rate */
   357	
   358		case KDKBDREP:
   359		{
   360			struct kbd_repeat kbrep;
   361	
   362			if (!capable(CAP_SYS_TTY_CONFIG))
   363				return -EPERM;
   364	
   365			if (copy_from_user(&kbrep, up, sizeof(struct kbd_repeat)))
   366				return -EFAULT;
   367	
   368			ret = kbd_rate(&kbrep);
   369			if (ret)
   370				return ret;
   371			if (copy_to_user(up, &kbrep, sizeof(struct kbd_repeat)))
   372				return -EFAULT;
   373			break;
   374		}
   375	
   376		case KDSETMODE:
   377			if (!perm)
   378				return -EPERM;
   379	
   380			console_lock();
   381			ret = vt_kdsetmode(vc, arg);
   382			console_unlock();
   383			return ret;
   384	
   385		case KDGETMODE:
   386			return put_user(vc->vc_mode, (int __user *)arg);
   387	
   388		case KDMAPDISP:
   389		case KDUNMAPDISP:
   390			/*
   391			 * these work like a combination of mmap and KDENABIO.
   392			 * this could be easily finished.
   393			 */
   394			return -EINVAL;
   395	
   396		case KDSKBMODE:
   397			if (!perm)
   398				return -EPERM;
   399			ret = vt_do_kdskbmode(console, arg);
   400			if (ret)
   401				return ret;
   402			tty_ldisc_flush(tty);
   403			break;
   404	
   405		case KDGKBMODE:
   406			return put_user(vt_do_kdgkbmode(console), (int __user *)arg);
   407	
   408		/* this could be folded into KDSKBMODE, but for compatibility
   409		   reasons it is not so easy to fold KDGKBMETA into KDGKBMODE */
   410		case KDSKBMETA:
   411			return vt_do_kdskbmeta(console, arg);
   412	
   413		case KDGKBMETA:
   414			/* FIXME: should review whether this is worth locking */
   415			return put_user(vt_do_kdgkbmeta(console), (int __user *)arg);
   416	
   417		case KDGETKEYCODE:
   418		case KDSETKEYCODE:
   419			if(!capable(CAP_SYS_TTY_CONFIG))
   420				perm = 0;
   421			return vt_do_kbkeycode_ioctl(cmd, up, perm);
   422	
   423		case KDGKBENT:
   424		case KDSKBENT:
   425			return vt_do_kdsk_ioctl(cmd, up, perm, console);
   426	
   427		case KDGKBSENT:
   428		case KDSKBSENT:
   429			return vt_do_kdgkb_ioctl(cmd, up, perm);
   430	
   431		/* Diacritical processing. Handled in keyboard.c as it has
   432		   to operate on the keyboard locks and structures */
   433		case KDGKBDIACR:
   434		case KDGKBDIACRUC:
   435		case KDSKBDIACR:
   436		case KDSKBDIACRUC:
   437			return vt_do_diacrit(cmd, up, perm);
   438	
   439		/* the ioctls below read/set the flags usually shown in the leds */
   440		/* don't use them - they will go away without warning */
   441		case KDGKBLED:
   442		case KDSKBLED:
   443		case KDGETLED:
   444		case KDSETLED:
   445			return vt_do_kdskled(console, cmd, arg, perm);
   446	
   447		/*
   448		 * A process can indicate its willingness to accept signals
   449		 * generated by pressing an appropriate key combination.
   450		 * Thus, one can have a daemon that e.g. spawns a new console
   451		 * upon a keypress and then changes to it.
   452		 * See also the kbrequest field of inittab(5).
   453		 */
   454		case KDSIGACCEPT:
   455			if (!perm || !capable(CAP_KILL))
   456				return -EPERM;
   457			if (!valid_signal(arg) || arg < 1 || arg == SIGKILL)
   458				return -EINVAL;
   459	
   460			spin_lock_irq(&vt_spawn_con.lock);
   461			put_pid(vt_spawn_con.pid);
   462			vt_spawn_con.pid = get_pid(task_pid(current));
   463			vt_spawn_con.sig = arg;
   464			spin_unlock_irq(&vt_spawn_con.lock);
   465			break;
   466	
   467		case KDFONTOP: {
   468			struct console_font_op op;
   469	
   470			if (copy_from_user(&op, up, sizeof(op)))
   471				return -EFAULT;
   472			if (!perm && op.op != KD_FONT_OP_GET)
   473				return -EPERM;
   474			ret = con_font_op(vc, &op);
   475			if (ret)
   476				return ret;
   477			if (copy_to_user(up, &op, sizeof(op)))
   478				return -EFAULT;
   479			break;
   480		}
   481	
   482		case KDFONTINFO:
 > 483			struct console_font_info fnt_info;
   484	
   485			if (copy_from_user(&fnt_info, up, sizeof(fnt_info)))
   486				return -EFAULT;
   487			ret = con_font_info(vc, &fnt_info);
   488			if (ret)
   489				return ret;
   490			if (copy_to_user(up, &fnt_info, sizeof(fnt_info)))
   491				return -EFAULT;
   492			break;
   493	
   494		default:
   495			return -ENOIOCTLCMD;
   496		}
   497	
   498		return 0;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
