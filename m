Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D128335C6B2;
	Wed,  7 Oct 2026 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791412771; cv=none; b=IZuysI5CqfjrppCy+hs7Hk597EGJWtDm2+k7SwQUq0SKtYfSd/y4WigYj77qLclOpj2GGjPmFO98tCKoVDLW27pDep/KwN84URXa84LWlvR9SkWg5EMFyx09hsH/vk+HYIvHvlJ0JasieN4vIoHO3RJG6E9iaivKIH4t9X0YoBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791412771; c=relaxed/simple;
	bh=n/11dE+Hqvxay7KIteozvAYrLerLin/yUxCHGlbzTY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uEgYBobf1paiC0g5IFUKh/ygh04yMArXx0Gp4/MWFIsg3araTKWLPZ5EAy2v7RF1Uw9bYKzd2X/S4qFiZfHPAOUmE8sBAseVgN536/Puf6ghlGXe18UWcn8NMcf1n3gdvwIMk9y2/lxcK+KCdent7/tYieN5fdvpUsJa0S2+cAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6mqA0UR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6mqA0UR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791412769; x=1822948769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/11dE+Hqvxay7KIteozvAYrLerLin/yUxCHGlbzTY8=;
  b=T6mqA0URiL1Tkm4kpxbtxjsgjtR2h3eH9oGyNmCUeNx5+m/EDo9evdYl
   0jvkZgWr8q414BPA1PymCy0PhJhaVPxjm2pg3QCoZAt/yjDVby1RY5dr3
   6+SO3eUEeYHRX7G09MHIRCpcJEki/yL/deIy5B+mOe1BMYoSBtRUbFm/U
   G+Le1JdHNzGAOCfOF9QOTKsrcon89JLyixx34QKfj+4HOGngkoikwZWt2
   t2Cmlm1lgfiNiBqBuVV03Nmncx+JqO7+xnSjdagkzxIXOWDAGYD1L10Ew
   P8GlBgxRzP5rtgYuT8Ztvb8y6WGYoesaixhnZ6aHVXZgfDpXvD3n34+at
   g==;
X-CSE-ConnectionGUID: hqUoZtw5R8CyE9sBpuWhHw==
X-CSE-MsgGUID: cG1IUYj9StWfMvUj5u1sRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="296235"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="296235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 15:39:28 -0700
X-CSE-ConnectionGUID: q+U4hnxTSJ+oOq/9JMK6ZA==
X-CSE-MsgGUID: pC/HfWlnRxaCpyMIMe4PEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="285509759"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Oct 2026 15:39:26 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEaIG-000000003dC-19ZR;
	Wed, 07 Oct 2026 22:39:24 +0000
Date: Thu, 08 Oct 2026 06:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 131/142]
 drivers/misc/cardreader/infineon_usim.c:697:61: warning: format specifies
 type 'unsigned int' but the argument has type 'unsigned long'
Message-ID: <202610080635.Tej6yJe8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: e70fe7818c4a351f59b891ad4189e1454ea4ea2e [131/142] Sloppy APDU
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20261008/202610080635.Tej6yJe8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080635.Tej6yJe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080635.Tej6yJe8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/cardreader/infineon_usim.c:191:14: warning: unused variable 'i' [-Wunused-variable]
     191 |         size_t len, i;
         |                     ^
>> drivers/misc/cardreader/infineon_usim.c:697:61: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
     697 |                 dev_err(usim->dev, "ioctl 0x%08x, powerup %x\n", command, INFINEON_USIM_IOC_POWER_UP);
         |                                                           ~~              ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                           %lx
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   include/uapi/linux/infineon_usim.h:39:36: note: expanded from macro 'INFINEON_USIM_IOC_POWER_UP'
      39 | #define INFINEON_USIM_IOC_POWER_UP _IOWR(INFINEON_USIM_IOC_MAGIC, 0x0, struct infineon_usim_power_up)
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/uapi/asm/ioctl.h:48:29: note: expanded from macro '_IOWR'
      48 | #define _IOWR(type,nr,size) _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),sizeof(size))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/uapi/asm/ioctl.h:40:9: note: expanded from macro '_IOC'
      40 |         (((dir)  << _IOC_DIRSHIFT) | \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      41 |          ((type) << _IOC_TYPESHIFT) | \
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      42 |          ((nr)   << _IOC_NRSHIFT) | \
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      43 |          ((size) << _IOC_SIZESHIFT))
         |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/cardreader/infineon_usim.c:716:13: error: incompatible function pointer types initializing 'int (*)(struct inode *, struct file *)' with an expression of type 'ssize_t (struct inode *, struct file *)' (aka 'long (struct inode *, struct file *)') [-Wincompatible-function-pointer-types]
     716 |         .release = usim_release,
         |                    ^~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +697 drivers/misc/cardreader/infineon_usim.c

   669	
   670	static long usim_ioctl(struct file *file, unsigned int command, unsigned long argument)
   671	{
   672		struct usim_drv *usim = file->private_data;
   673		void __user *argp = (void __user *)argument;
   674		long ret;
   675	
   676		dev_dbg(usim->dev, "USIM IOCTL 0x%x\n", command);
   677		mutex_lock(&usim->lock);
   678	
   679		switch (command) {
   680		case INFINEON_USIM_IOC_POWER_UP:
   681			ret = usim_power_up(usim, argp);
   682			break;
   683	
   684		case INFINEON_USIM_IOC_POWER_DOWN:
   685			ret = usim_power_down(usim);
   686			break;
   687	
   688		case INFINEON_USIM_IOC_RESET:
   689			ret = usim_reset(usim, argp);
   690			break;
   691	
   692		case INFINEON_USIM_IOC_TRANSMIT:
   693			ret = usim_transmit(usim, argp);
   694			break;
   695	
   696		default:
 > 697			dev_err(usim->dev, "ioctl 0x%08x, powerup %x\n", command, INFINEON_USIM_IOC_POWER_UP);
   698			ret = -ENOTTY;
   699			break;
   700		}
   701	
   702		mutex_unlock(&usim->lock);
   703		dev_dbg(usim->dev, "ioctl 0x%x ret %ld\n", command, ret);
   704	
   705		return ret;
   706	}
   707	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
