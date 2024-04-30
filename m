Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514631843;
	Tue, 30 Apr 2024 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714438725; cv=none; b=eCs+i8mfJlkvgt0D5Dg2IAigHhz9CCe17X6LY2jkuIjYK3A/ohgRK+Js+JJeJB0Hny86pe+GFlYM9OZLGYE610yC2Wa5MnqEwyKJxLe39WPiDjJdmih3ypz6jDqqDsZoLYEqXRNKCjE8oBWEkXIQGCDWZhZDgJ5dR/hxjG8VYFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714438725; c=relaxed/simple;
	bh=kHehVas1TcKHmP1tLsaPMehVMir5kgkjKWlGQ2P0heg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQWJqzXWZ7OTp4yJu0G0tJzr1H4TxxrhYRtHqbZ5JGPG8zsA0OnOVBPiAlN0bVKzaYdpAlu2B5dwKWJgrZwKJvF+cf5XkXSPAe9acmqkzAJKRcbLip4L6JhGFyZt1zXsr7PXvDI8nTOSTK4Kjura97edK11UrOIoMFxWo/q6aT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6o3/XI0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6o3/XI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714438724; x=1745974724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kHehVas1TcKHmP1tLsaPMehVMir5kgkjKWlGQ2P0heg=;
  b=I6o3/XI0iwABODYEqxQwsT76YPY5i+250ATLNhbzHkBHju4uzvf15QID
   NiiKxAI0uEaKh37pwIIL+sAVGIGGIMEVbaKMcpOvtG6u10k5/whA6CMvq
   sxE4BG1WJpdNXkW5BlHFme+ncOGQbtVMcliXcDMfZ/amobKJpCTmxWXOF
   OrdtcWhGHEIFqXI7EgKU2Zzx8TLzFj8Dlf/5DBrh/O1LsHfU5GXjt4CHU
   3QoOIiZpd2vAQv3yx1ZOhWzyfii4KGBFNbr7bp/uGVbVstUVbmlhhLqAO
   T5YBF9IIwj2W/7y+MgGoPyu7cQaz/S4nwv3Q1sVGBWdLrI8d2d2p8JDwb
   w==;
X-CSE-ConnectionGUID: ZYedMhB7R1iVX7iAlBYrUA==
X-CSE-MsgGUID: HUFBU7tSQ/eW4bKvj8U9XQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13052992"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="13052992"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:58:43 -0700
X-CSE-ConnectionGUID: u8DfIT0nSd6Wb2wAuqRnHQ==
X-CSE-MsgGUID: B7uSrbgzQP+AeVWxR0YN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26148596"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2024 17:58:43 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1bpP-0007Zz-35;
	Tue, 30 Apr 2024 00:58:39 +0000
Date: Tue, 30 Apr 2024 08:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [pinctrl-samsung:pinctrl-next 3/3]
 drivers/pinctrl/samsung/pinctrl-samsung.c:633:35: warning: variable
 'drvdata' set but not used
Message-ID: <202404300825.6lxLwvUY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git pinctrl-next
head:   f9c74474797351c60e009ebc59a798fcfd93ee57
commit: f9c74474797351c60e009ebc59a798fcfd93ee57 [3/3] pinctrl: samsung: support a bus clock
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240430/202404300825.6lxLwvUY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300825.6lxLwvUY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300825.6lxLwvUY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/samsung/pinctrl-samsung.c:633:35: warning: variable 'drvdata' set but not used [-Wunused-but-set-variable]
           struct samsung_pinctrl_drv_data *drvdata;
                                            ^
   1 warning generated.


vim +/drvdata +633 drivers/pinctrl/samsung/pinctrl-samsung.c

   619	
   620	/*
   621	 * The samsung_gpio_set_direction() should be called with "bank->slock" held
   622	 * to avoid race condition.
   623	 * The calls to gpio_direction_output() and gpio_direction_input()
   624	 * leads to this function call.
   625	 */
   626	static int samsung_gpio_set_direction(struct gpio_chip *gc,
   627						     unsigned offset, bool input)
   628	{
   629		const struct samsung_pin_bank_type *type;
   630		struct samsung_pin_bank *bank;
   631		void __iomem *reg;
   632		u32 data, mask, shift;
 > 633		struct samsung_pinctrl_drv_data *drvdata;
   634	
   635		bank = gpiochip_get_data(gc);
   636		type = bank->type;
   637		drvdata = bank->drvdata;
   638	
   639		reg = bank->pctl_base + bank->pctl_offset
   640				+ type->reg_offset[PINCFG_TYPE_FUNC];
   641	
   642		mask = (1 << type->fld_width[PINCFG_TYPE_FUNC]) - 1;
   643		shift = offset * type->fld_width[PINCFG_TYPE_FUNC];
   644		if (shift >= 32) {
   645			/* Some banks have two config registers */
   646			shift -= 32;
   647			reg += 4;
   648		}
   649	
   650		data = readl(reg);
   651		data &= ~(mask << shift);
   652		if (!input)
   653			data |= PIN_CON_FUNC_OUTPUT << shift;
   654		writel(data, reg);
   655	
   656		return 0;
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
