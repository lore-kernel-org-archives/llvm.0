Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337561CD1B;
	Sat, 13 Apr 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712991852; cv=none; b=fT8csXHzAEk9XSpsf/fTm8lpK1njDR3WHHCQI2Vv9UuSj1FGxyzH8IkpXnsAkxuWollsgoHwdcN0txFAG3vKtN+aVc4UIrprEbOJ1kJOgsXo8BXX9OocNoh9grwdZ3/y35hcp6wGGaN+O4suEJShcddkCVZHucfrh+tvdSgQsbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712991852; c=relaxed/simple;
	bh=lwjQgxKurdkEXXblSJ4Zl9VgogMKYcxkXBVZEP7HSBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KyeMkG9OHefmo6p4lIgssnlvbwi3Qqo2iqyqfmy6xOKr9g3WL1rx8NJLOCT0NzKYDjZjfClVIcCBHace9mw7pZys2Ze0dFaSjCR32DAdSVi5viRLylE9dKTMXB2aao0Z/na0yr1h/+G8rZoWk8cG2quaaWl6AfIpHUxWA0rMTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsMqm1q8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsMqm1q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712991851; x=1744527851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwjQgxKurdkEXXblSJ4Zl9VgogMKYcxkXBVZEP7HSBw=;
  b=JsMqm1q8iL3DAZ/CJw0w/sINxwS+YKJfBDcesmHR6zVGYP6rSq7LOwor
   tEitKM9wbaKvxtInr5GFJMjdLIvVlgNnpFjrP8LBI8AiVfK+S+MNdEgeQ
   r1U08s1JEeeKnmFXuYqfNROJQhkt81MHGKMjd4hVxVi8Wf0rGawlMGBNA
   yQQYqNl0Y+J+Y8nqFBme6wteFtn+STYXszLSYvlvp7E7DasNTl4yEvFMY
   GEwUPCsIjp7uqwOmg6nK6Xyu+M6jOL+3G7M+nQcS63m8ObR2QSeLhotOq
   XeFozePlqXIdyn3Zn056w1KA0khZJRB7//SzyhVQyVfTwbNqgAJiStp8k
   A==;
X-CSE-ConnectionGUID: LL/mwU5gTz2bKpPujnKeDA==
X-CSE-MsgGUID: JSWRzj6aQpqHDrGS5GFtOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8312573"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8312573"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 00:04:08 -0700
X-CSE-ConnectionGUID: utVF0aTdTqaR3wEETki3XQ==
X-CSE-MsgGUID: 5zUWImkvQK2M2BkKFTUyQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21455635"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2024 00:04:06 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvXQi-0001zW-0E;
	Sat, 13 Apr 2024 07:04:04 +0000
Date: Sat, 13 Apr 2024 15:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Lindgren <tony@atomide.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [tty:tty-next 61/65] drivers/tty/serial/serial_base_bus.c:267:9:
 error: call to undeclared function 'serial_base_add_one_prefcon'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202404131416.VJljwvkS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
head:   1b743485e27f3d874695434cc8103f557dfdf4b9
commit: 4547cd76f08a6f301f6ad563f5d0e4566924ec6b [61/65] serial: 8250: Fix add preferred console for serial8250_isa_init_ports()
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20240413/202404131416.VJljwvkS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131416.VJljwvkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131416.VJljwvkS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/serial_base_bus.c:267:9: error: call to undeclared function 'serial_base_add_one_prefcon'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = serial_base_add_one_prefcon(nmbr_match, name, idx);
                         ^
   drivers/tty/serial/serial_base_bus.c:267:9: note: did you mean 'serial_base_add_prefcon'?
   drivers/tty/serial/serial_base_bus.c:254:12: note: 'serial_base_add_prefcon' declared here
   static int serial_base_add_prefcon(const char *name, int idx)
              ^
   drivers/tty/serial/serial_base_bus.c:282:9: error: call to undeclared function 'serial_base_add_one_prefcon'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return serial_base_add_one_prefcon(char_match, name, idx);
                  ^
   drivers/tty/serial/serial_base_bus.c:303:5: error: redefinition of 'serial_base_add_preferred_console'
   int serial_base_add_preferred_console(struct uart_driver *drv,
       ^
   drivers/tty/serial/serial_base.h:57:5: note: previous definition is here
   int serial_base_add_preferred_console(struct uart_driver *drv,
       ^
   drivers/tty/serial/serial_base_bus.c:319:9: error: call to undeclared function 'serial_base_add_one_prefcon'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return serial_base_add_one_prefcon(port_match, drv->dev_name, port->line);
                  ^
   4 errors generated.


vim +/serial_base_add_one_prefcon +267 drivers/tty/serial/serial_base_bus.c

a0f32e2dd99867 Tony Lindgren 2024-03-27  253  
787a1cabac01c9 Tony Lindgren 2024-03-27  254  static int serial_base_add_prefcon(const char *name, int idx)
787a1cabac01c9 Tony Lindgren 2024-03-27  255  {
787a1cabac01c9 Tony Lindgren 2024-03-27  256  	const char *char_match __free(kfree) = NULL;
a0f32e2dd99867 Tony Lindgren 2024-03-27  257  	const char *nmbr_match __free(kfree) = NULL;
a0f32e2dd99867 Tony Lindgren 2024-03-27  258  	int ret;
a0f32e2dd99867 Tony Lindgren 2024-03-27  259  
a0f32e2dd99867 Tony Lindgren 2024-03-27  260  	/* Handle ttyS specific options */
a0f32e2dd99867 Tony Lindgren 2024-03-27  261  	if (strstarts(name, "ttyS")) {
a0f32e2dd99867 Tony Lindgren 2024-03-27  262  		/* No name, just a number */
a0f32e2dd99867 Tony Lindgren 2024-03-27  263  		nmbr_match = kasprintf(GFP_KERNEL, "%i", idx);
a0f32e2dd99867 Tony Lindgren 2024-03-27  264  		if (!nmbr_match)
a0f32e2dd99867 Tony Lindgren 2024-03-27  265  			return -ENODEV;
a0f32e2dd99867 Tony Lindgren 2024-03-27  266  
a0f32e2dd99867 Tony Lindgren 2024-03-27 @267  		ret = serial_base_add_one_prefcon(nmbr_match, name, idx);
a0f32e2dd99867 Tony Lindgren 2024-03-27  268  		if (ret)
a0f32e2dd99867 Tony Lindgren 2024-03-27  269  			return ret;
a0f32e2dd99867 Tony Lindgren 2024-03-27  270  
a0f32e2dd99867 Tony Lindgren 2024-03-27  271  		/* Sparc ttya and ttyb */
a0f32e2dd99867 Tony Lindgren 2024-03-27  272  		ret = serial_base_add_sparc_console(name, idx);
a0f32e2dd99867 Tony Lindgren 2024-03-27  273  		if (ret)
a0f32e2dd99867 Tony Lindgren 2024-03-27  274  			return ret;
a0f32e2dd99867 Tony Lindgren 2024-03-27  275  	}
787a1cabac01c9 Tony Lindgren 2024-03-27  276  
787a1cabac01c9 Tony Lindgren 2024-03-27  277  	/* Handle the traditional character device name style console=ttyS0 */
787a1cabac01c9 Tony Lindgren 2024-03-27  278  	char_match = kasprintf(GFP_KERNEL, "%s%i", name, idx);
787a1cabac01c9 Tony Lindgren 2024-03-27  279  	if (!char_match)
787a1cabac01c9 Tony Lindgren 2024-03-27  280  		return -ENOMEM;
787a1cabac01c9 Tony Lindgren 2024-03-27  281  
787a1cabac01c9 Tony Lindgren 2024-03-27  282  	return serial_base_add_one_prefcon(char_match, name, idx);
787a1cabac01c9 Tony Lindgren 2024-03-27  283  }
787a1cabac01c9 Tony Lindgren 2024-03-27  284  

:::::: The code at line 267 was first introduced by commit
:::::: a0f32e2dd99867b164bfebcf36729c2a0d41b30b serial: core: Handle serial console options

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
