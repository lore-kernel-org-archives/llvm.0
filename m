Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B21156997;
	Wed,  4 Dec 2024 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733336201; cv=none; b=Fc4dBnSRv9tZDygxD67Tmz9SqNH97+2QUzEXbMPW1Nr0z+yiFME4kN7wERzrrxQOnIht11Kn2o0ptuwrIOS7SDxXH8hGinZFLZs3zGoqtlWqL18IVqP+f0Ls/2KCo0yw1swGLugZulFcNw4eFPOXb2qPIEOFQFx/YmIfCYvwwFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733336201; c=relaxed/simple;
	bh=YKOza2Vwkc0Vz8h47QH3KaQnEXcATfJSp4Fyg1Wes4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0yq+j5zvicGjxtJoB2SFpGwlCVcwymzFUXVYm0xVeqkwzn/fu6i0K3EIjEN1t9Mi7b/BMFUUTNONeHcmpqBH7q4MO3V6g8V/XOhZSxA05cOGHcTfWtpvqfBrm2HiKuEc70UCrT3F+wjM961VbfupVfLbomwfiaXMJJKHFAe7zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYZ2l8gz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYZ2l8gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733336200; x=1764872200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKOza2Vwkc0Vz8h47QH3KaQnEXcATfJSp4Fyg1Wes4w=;
  b=jYZ2l8gzqX1ivnQ2dmcO5+XOhbvD6HEidBWYacfNnNs4i2tzLwqdHlDO
   XGHc1ItWh1F8DI0ySzNPlsh5E5AD6jVssVh5uM4tm692/6L76dIOPpyYr
   GGhuiP9tkHfG1jGHbo2oW2/b+xc6tHJPFHIjFF832p+GkjSGKL66PqgPE
   Utd1VwbHLCFlP1KEypFVuoJ9apDzRuhHlTCYTQcnBYjr8eQQl8IyZDcVu
   Yv/8BermZlYp8Z7aFEeJ0mrtyo4AdLKvjARzqcBWQrtvnhN/HFptEWPMd
   3FzAhf7Hjfc+zFv7O5CHfHlr0gI5kcQAQS1UXBc6xDnVToOfuDjahddAi
   g==;
X-CSE-ConnectionGUID: DBGYlI/BRqKYJOWF8EWA1Q==
X-CSE-MsgGUID: ox8uhFbsSDOE7bt2tfZE5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="32959914"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="32959914"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 10:16:40 -0800
X-CSE-ConnectionGUID: +nltSXxHS/yiQLXtLl6WhA==
X-CSE-MsgGUID: ILSiU2pTT/OSFOwDYM9RUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="98818562"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 10:16:38 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tItvP-0003NR-1H;
	Wed, 04 Dec 2024 18:16:35 +0000
Date: Thu, 5 Dec 2024 02:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/usb/renesas_usbhs/mod.c:195:6: warning: variable 'intenb0'
 set but not used
Message-ID: <202412050247.vVthPDpE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: 22ae6415c702680b1d3170717ce34ee31656f8b6 usb: renesas_usbhs: Use platform_get_irq() to get the interrupt
date:   2 years, 11 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241205/202412050247.vVthPDpE-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050247.vVthPDpE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050247.vVthPDpE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/renesas_usbhs/mod.c:195:6: warning: variable 'intenb0' set but not used [-Wunused-but-set-variable]
     195 |         u16 intenb0, intenb1;
         |             ^
   1 warning generated.


vim +/intenb0 +195 drivers/usb/renesas_usbhs/mod.c

f1407d5c66240b3 Kuninori Morimoto  2011-04-04  190  
697d5c004e39010 Shimoda, Yoshihiro 2012-08-20  191  static int usbhs_status_get_each_irq(struct usbhs_priv *priv,
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  192  				     struct usbhs_irq_state *state)
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  193  {
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  194  	struct usbhs_mod *mod = usbhs_mod_get_current(priv);
697d5c004e39010 Shimoda, Yoshihiro 2012-08-20 @195  	u16 intenb0, intenb1;
c4d8199ba1a7aa3 Yoshihiro Shimoda  2014-08-22  196  	unsigned long flags;
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  197  
c4d8199ba1a7aa3 Yoshihiro Shimoda  2014-08-22  198  	/********************  spin lock ********************/
c4d8199ba1a7aa3 Yoshihiro Shimoda  2014-08-22  199  	usbhs_lock(priv, flags);
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  200  	state->intsts0 = usbhs_read(priv, INTSTS0);
697d5c004e39010 Shimoda, Yoshihiro 2012-08-20  201  	intenb0 = usbhs_read(priv, INTENB0);
88a25e02f35e56a Nobuhiro Iwamatsu  2015-01-09  202  
88a25e02f35e56a Nobuhiro Iwamatsu  2015-01-09  203  	if (usbhs_mod_is_host(priv)) {
88a25e02f35e56a Nobuhiro Iwamatsu  2015-01-09  204  		state->intsts1 = usbhs_read(priv, INTSTS1);
697d5c004e39010 Shimoda, Yoshihiro 2012-08-20  205  		intenb1 = usbhs_read(priv, INTENB1);
672bfdaa3100043 Arnd Bergmann      2015-05-22  206  	} else {
672bfdaa3100043 Arnd Bergmann      2015-05-22  207  		state->intsts1 = intenb1 = 0;
88a25e02f35e56a Nobuhiro Iwamatsu  2015-01-09  208  	}
697d5c004e39010 Shimoda, Yoshihiro 2012-08-20  209  
5ea68d541df200d Kuninori Morimoto  2011-04-28  210  	/* mask */
5ea68d541df200d Kuninori Morimoto  2011-04-28  211  	if (mod) {
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  212  		state->brdysts = usbhs_read(priv, BRDYSTS);
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  213  		state->nrdysts = usbhs_read(priv, NRDYSTS);
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  214  		state->bempsts = usbhs_read(priv, BEMPSTS);
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  215  
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  216  		state->bempsts &= mod->irq_bempsts;
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  217  		state->brdysts &= mod->irq_brdysts;
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  218  	}
c4d8199ba1a7aa3 Yoshihiro Shimoda  2014-08-22  219  	usbhs_unlock(priv, flags);
c4d8199ba1a7aa3 Yoshihiro Shimoda  2014-08-22  220  	/********************  spin unlock ******************/
697d5c004e39010 Shimoda, Yoshihiro 2012-08-20  221  
697d5c004e39010 Shimoda, Yoshihiro 2012-08-20  222  	return 0;
5ea68d541df200d Kuninori Morimoto  2011-04-28  223  }
f1407d5c66240b3 Kuninori Morimoto  2011-04-04  224  

:::::: The code at line 195 was first introduced by commit
:::::: 697d5c004e390102efbf9320a5416873679bea81 usb: renesas_usbhs: modify the irq handler for sharing irq

:::::: TO: Shimoda, Yoshihiro <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
