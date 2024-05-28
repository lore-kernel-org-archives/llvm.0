Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DFD10E9;
	Tue, 28 May 2024 00:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716856267; cv=none; b=q+abYRWh6BAr/wPuF/kLaGd+0bPGkZJtUKwuHnI8j922AYDAhxCqFSssmrOHSDOqV9KYldvFUzbQrrMrl3Lra2odOt/tVaY8LEbFP0Zx8JehRp8KRwswobSKT/m4RE+jqVK7scVpTE6Rn4OphP9kuzYdSfQNFn+RG5dgjVhLhYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716856267; c=relaxed/simple;
	bh=P0/LfQaKGoP69x5KXxg8N7p9+FFI1udCwW9JW2WzM08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmrvgTeUgxykqIeWw9u+Au8IRB8AZ/77Lkg11atTACepGOWKsr1wdZZQgjO+Yaw9aAytNyiu0g2+et4Zb2r7na903MuCWk2olFhT5WZIlYtA0p0mSsBWCQ6CNZf3qvMYYDzwHFQyjZdZUbnrecncoDEdInvEVSVL/nzTKZu0LH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTOqi9z1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTOqi9z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716856266; x=1748392266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P0/LfQaKGoP69x5KXxg8N7p9+FFI1udCwW9JW2WzM08=;
  b=CTOqi9z1dRlfmo2aC7Nw88IKTXmBB6UPYUSQPWHVuMuVrr4ISTU/HIS8
   Z9ofKD9qeta7ii3EO154ee0vTe+g2/13osjjO970xkUTdJwB39QqnFWPh
   9XR9iXd/S8Eh2QQRgTu1NmoDDhYtdD5nt4Sd/Ox1CXF0+BdqYDUazRe58
   n0ZPrDQ8K5XjS6IeUnAzaP/oi9G/NS48sFL+vq7QxDX/F/yFvoXpmpJPC
   pD+wcH0Eo+ZJ+LxhbeITNAVJ+JsQ4uX4wneQYYgwIELJLEV8fto1IRdl3
   a3i2wFf3Q2n9WrXMQlVVHdnEXEensl9zTpfIut9faUtHoSPV9P4rvmlKp
   w==;
X-CSE-ConnectionGUID: ZXCyD5+0TwO6r3/JB49PAQ==
X-CSE-MsgGUID: GUePqGB0QnWkzDS1wGMu2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23739163"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="23739163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 17:31:06 -0700
X-CSE-ConnectionGUID: 6fE9edj0SF+S12iXuccd1w==
X-CSE-MsgGUID: 2uN9A4pzSzKI4Z9OaDJrkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="66098716"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2024 17:31:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBkjy-000BED-2N;
	Tue, 28 May 2024 00:30:58 +0000
Date: Tue, 28 May 2024 08:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: Re: [PATCH v1 05/11] pinctrl: pinmux: Add a convenient define
 PINCTRL_FUNCTION_DESC()
Message-ID: <202405280821.FcDAyD2b-lkp@intel.com>
References: <20240527212742.1432960-6-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527212742.1432960-6-andy.shevchenko@gmail.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.10-rc1 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-berlin-Make-use-of-struct-pinfunction/20240528-053304
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240527212742.1432960-6-andy.shevchenko%40gmail.com
patch subject: [PATCH v1 05/11] pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240528/202405280821.FcDAyD2b-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280821.FcDAyD2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280821.FcDAyD2b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/pinmux.c:880:11: error: assigning to 'struct function_desc *' from incompatible type 'struct function_desc'; take the address with &
     880 |         function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                    &(                                                )
   1 error generated.


vim +880 drivers/pinctrl/pinmux.c

   849	
   850	/**
   851	 * pinmux_generic_add_function() - adds a function group
   852	 * @pctldev: pin controller device
   853	 * @name: name of the function
   854	 * @groups: array of pin groups
   855	 * @num_groups: number of pin groups
   856	 * @data: pin controller driver specific data
   857	 */
   858	int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
   859					const char *name,
   860					const char * const *groups,
   861					const unsigned int ngroups,
   862					void *data)
   863	{
   864		struct function_desc *function;
   865		int selector, error;
   866	
   867		if (!name)
   868			return -EINVAL;
   869	
   870		selector = pinmux_func_name_to_selector(pctldev, name);
   871		if (selector >= 0)
   872			return selector;
   873	
   874		selector = pctldev->num_functions;
   875	
   876		function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
   877		if (!function)
   878			return -ENOMEM;
   879	
 > 880		function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
   881	
   882		error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
   883		if (error)
   884			return error;
   885	
   886		pctldev->num_functions++;
   887	
   888		return selector;
   889	}
   890	EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
   891	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
