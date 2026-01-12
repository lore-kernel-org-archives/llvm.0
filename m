Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A26274B28;
	Mon, 12 Jan 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211593; cv=none; b=ENvERIhiDiLEaPBMp9eI36O2wNryH/l6JduiiW+37jR7VYeStWZRvYmkrBsFVzm5zjzmiAxxnOoqD+TcnUg96+VqhsZ6jkk0MzqI1xQoQmUly1cw0xdm88S3FbeHyla9zwNY6rd5iOvKr+k3Zx3aMFl0GKUdjS8GQO8j/MpydaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211593; c=relaxed/simple;
	bh=hRSG7T8bXb+nIeSQWb8aBmKDAZsjUhAD39dXlf88bqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hnl2N7xtz/dRy/8P8L5RVfgt6YrNj1JKaOknYIHMnAXhQmWHXUXsK8ZXcAZgXENQx3Gd2RD9I7JlhHAED/fUuQdiR01XwLJdbFGJGfvjjOMhlVTxikRDbG087JhH3zkEV4yFnjyfW+wEHo/ob4nV7ZNj8403GB0K3uKIz3pfT6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJtXbtG6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJtXbtG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768211592; x=1799747592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hRSG7T8bXb+nIeSQWb8aBmKDAZsjUhAD39dXlf88bqg=;
  b=KJtXbtG60l3lnuUwaYsbVvaR4gMWYmtMWjk/6gV1bAx08nIfU7a/dvaa
   IyydtePW8xxE9YrujfSAalCSv/T1bISfl59fZBux9z73UsLbB6rbNs893
   K5CUmu3lUYDIbpda9BDYNUnEWlCj0kJoQDLzhOrdwOr2d2QVz/btI+Ojz
   mcWC91xQwSZRv2un5RqOu425fnQ7pdXNg2Omd2sY0ZY0/y2JONW5h5Y99
   Sl6JuUxJ4ZOzh7q/3kx3P7DAx8+jrK52MOUW1s/jEOrbtgrZfNFGL649U
   5dwhJTmmVy5X03xefdGbLDII9R7jr+N6BHtQQHf+VcbrzG4CAdE/wTbq4
   Q==;
X-CSE-ConnectionGUID: LoCqtLkbRs6+8jRQq7JHEg==
X-CSE-MsgGUID: 4kBNX15xRz2NiFPXe3bGeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="68487476"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="68487476"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:53:11 -0800
X-CSE-ConnectionGUID: hqrw8jaJTx2vEYHerVEM7w==
X-CSE-MsgGUID: gJ6KKnaLQi6ejT1kPbJ4nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="227312749"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 01:53:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfEbk-00000000DE4-1IDf;
	Mon, 12 Jan 2026 09:53:08 +0000
Date: Mon, 12 Jan 2026 17:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] RFC: pinctrl: apple: Implement GPIO func check
 callback
Message-ID: <202601121712.syrjphmQ-lkp@intel.com>
References: <20260111-apple-req-gpio-func-v1-2-6deb1b695371@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111-apple-req-gpio-func-v1-2-6deb1b695371@kernel.org>

Hi Linus,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/pinctrl-apple-Use-unsigned-int-instead-of-unsigned/20260112-043103
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260111-apple-req-gpio-func-v1-2-6deb1b695371%40kernel.org
patch subject: [PATCH 2/2] RFC: pinctrl: apple: Implement GPIO func check callback
config: arm64-randconfig-001-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121712.syrjphmQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121712.syrjphmQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121712.syrjphmQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinctrl-apple-gpio.c:196:22: error: incompatible function pointer types initializing 'bool (*)(struct pinctrl_dev *, unsigned int)' (aka '_Bool (*)(struct pinctrl_dev *, unsigned int)') with an expression of type 'int (struct pinctrl_dev *, unsigned int)' [-Wincompatible-function-pointer-types]
     196 |         .function_is_gpio = apple_gpio_pinmux_func_is_gpio,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]


vim +196 drivers/pinctrl/pinctrl-apple-gpio.c

   191	
   192	static const struct pinmux_ops apple_gpio_pinmux_ops = {
   193		.get_functions_count = pinmux_generic_get_function_count,
   194		.get_function_name = pinmux_generic_get_function_name,
   195		.get_function_groups = pinmux_generic_get_function_groups,
 > 196		.function_is_gpio = apple_gpio_pinmux_func_is_gpio,
   197		.set_mux = apple_gpio_pinmux_set,
   198		.strict = true,
   199	};
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
