Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE8B883C;
	Sun,  3 Mar 2024 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709502730; cv=none; b=j0IDJokEvwCWcJg+q7EqPKKMV8nqoSW/wwG1NLWbyZLfT6TEmFLp+VoE1IcEdWXG5dz9bg0TJeehZhAGJOJogtmcGJBJvIw2lcaoxcmAr6AFkAABJHvh0vvsDd9g61kp3VWtv1C/TY8o8gk8TQudbNH3Shst73Ceg2Z7GjoVfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709502730; c=relaxed/simple;
	bh=D2qtsuR4jUH4EyPcs0DddWFoDn08w3BRlDMuxaBhSGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mt2pRd1EKmSEI3rkpIS+OXlgF2cbXhrx4vnaklX0xcAYCg9AEJRKJMlNvhS4BELcVTbp0YBgO1J8TNrOAZ+TERxekT0L0DbXi4RbuGDWmWrJbGhPWIgyqDXhAfkcnP2QSVul4iUpjUyGKOGpqItkWZALanwrc+Y8llKdxlHY6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjIUnchT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjIUnchT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709502729; x=1741038729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D2qtsuR4jUH4EyPcs0DddWFoDn08w3BRlDMuxaBhSGY=;
  b=BjIUnchTUCYkXo10xDvbP4zKh6CygN6X29j1+yfImf2z1uC4TrFKIomz
   Uid/7VzlRK6mscK98HFM4mGAanvlLo3Eq2OjKyTnryc/zWZWDh1MgyNjZ
   2gYbJS2e1iWeBHUidea9rNopZCAg8juTFggd8OoUZHwybq6k2zfhG6fAI
   X2h6PKbzOAXg785r0wQk/izVwn1sc9GEQR2sTsROeVR5fz8NcrSmTlqMI
   Z+9lZtac1MdVvBd+IXXAgrL+2EzxpD5t3ct83xLlvPV5ttEvPqKUL5DW2
   s44lCUpHrlb71dSc2+MX/ny4pOxkepPtPDGQhGBVC3HXjKnY2ZOaFuVhu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15133388"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="15133388"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 13:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9355746"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2024 13:52:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgtka-00028E-0z;
	Sun, 03 Mar 2024 21:52:04 +0000
Date: Mon, 4 Mar 2024 05:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/cons-font-info/v1.0 1/5]
 drivers/tty/vt/vt_ioctl.c:483:3: error: expected expression
Message-ID: <202403040516.iKWk8VdM-lkp@intel.com>
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
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240304/202403040516.iKWk8VdM-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040516.iKWk8VdM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040516.iKWk8VdM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/vt/vt_ioctl.c:483:3: error: expected expression
     483 |                 struct console_font_info fnt_info;
         |                 ^
>> drivers/tty/vt/vt_ioctl.c:485:44: error: use of undeclared identifier 'fnt_info'; did you mean 'ist_info'?
     485 |                 if (copy_from_user(&fnt_info, up, sizeof(fnt_info)))
         |                                                          ^~~~~~~~
         |                                                          ist_info
   arch/x86/include/asm/ist.h:12:24: note: 'ist_info' declared here
      12 | extern struct ist_info ist_info;
         |                        ^
   drivers/tty/vt/vt_ioctl.c:485:23: error: use of undeclared identifier 'fnt_info'; did you mean 'ist_info'?
     485 |                 if (copy_from_user(&fnt_info, up, sizeof(fnt_info)))
         |                                     ^~~~~~~~
         |                                     ist_info
   arch/x86/include/asm/ist.h:12:24: note: 'ist_info' declared here
      12 | extern struct ist_info ist_info;
         |                        ^
   drivers/tty/vt/vt_ioctl.c:487:28: error: use of undeclared identifier 'fnt_info'; did you mean 'ist_info'?
     487 |                 ret = con_font_info(vc, &fnt_info);
         |                                          ^~~~~~~~
         |                                          ist_info
   arch/x86/include/asm/ist.h:12:24: note: 'ist_info' declared here
      12 | extern struct ist_info ist_info;
         |                        ^
   drivers/tty/vt/vt_ioctl.c:490:42: error: use of undeclared identifier 'fnt_info'; did you mean 'ist_info'?
     490 |                 if (copy_to_user(up, &fnt_info, sizeof(fnt_info)))
         |                                                        ^~~~~~~~
         |                                                        ist_info
   arch/x86/include/asm/ist.h:12:24: note: 'ist_info' declared here
      12 | extern struct ist_info ist_info;
         |                        ^
   drivers/tty/vt/vt_ioctl.c:490:25: error: use of undeclared identifier 'fnt_info'; did you mean 'ist_info'?
     490 |                 if (copy_to_user(up, &fnt_info, sizeof(fnt_info)))
         |                                       ^~~~~~~~
         |                                       ist_info
   arch/x86/include/asm/ist.h:12:24: note: 'ist_info' declared here
      12 | extern struct ist_info ist_info;
         |                        ^
   6 errors generated.


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
 > 485			if (copy_from_user(&fnt_info, up, sizeof(fnt_info)))
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
