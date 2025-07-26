Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009EE2E3700;
	Sat, 26 Jul 2025 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753529503; cv=none; b=qBipHPGDvj6ITzPvBLotoqNfl/s1etMy6VoUT3/7pvCJx4cXZjE0muozsolMue81EK4wxkWiOLdY0PJ0156aOY4rj8eXxos8Uo8QeeAv4/ge1G9YG0en6Y+mIVucgr/lCGR+qfk5Xjut5WF+oxPX0OMmhu6UlQXEeow0p6inRHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753529503; c=relaxed/simple;
	bh=x5ftixc4aZ/+5TD+y+Aes85jYKYNSbOyuX7QDNVsBd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jURSeRZTljRU20VRLAP83+it8HZI3wda+fEcxDH0TeKCT8N2eFg26V51GeBCRNtZHsM4dfig1hncVCQRLRaQWYr0t1XgnPrnkP8O6tIzqncnof1HslziW58fXRS3dLH8iAaSxv4BtqoawYP24zGtCWBkP2ddkxVDXYmqMmkS3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euKqhM5E; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euKqhM5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753529502; x=1785065502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5ftixc4aZ/+5TD+y+Aes85jYKYNSbOyuX7QDNVsBd8=;
  b=euKqhM5E+xtaaQVoUcg6cCD0emA61HaRWv04yn5N1Mg+moYcUw9bg6Lz
   q4mQi/Ow4HABTCroPRdNqE3zF+JydpGaCdDjj20k4NiCwXNgqc0W8p7Ly
   9cSMb8/FA/hI1aabE8PfyzkL4otkxNzEQeNHp3N16IH/KBaka6PFOmMAr
   Y5o42FrHJoUfRtaZsEM/8dKApuB6Gb8gsugmbE+t5vNDbULuUunegTbKF
   aAYdtIX/xZDBVCgW9U3I+trKE/jTmQtj+U7kvu326cLapn5Mz0A4hp2YY
   D9P8kKyhz5Wed6Ty1FniPJYsa7klHC+18t/Abl4KjGYHRCKGZgpFch4t0
   A==;
X-CSE-ConnectionGUID: ZKYBXvmWRhip4QaPlYuKjw==
X-CSE-MsgGUID: ISi+doS/Rv2U4p4DX9UjkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55705713"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55705713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:31:41 -0700
X-CSE-ConnectionGUID: pR4kffSwRjy1c2IEc26nyw==
X-CSE-MsgGUID: cFu3aEPNSiGqjJr475Nxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="160800593"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jul 2025 04:31:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufd7j-000Lvz-1t;
	Sat, 26 Jul 2025 11:31:31 +0000
Date: Sat, 26 Jul 2025 19:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v3 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
Message-ID: <202507261937.Txq9shpv-lkp@intel.com>
References: <20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05adbee3ad528100ab0285c15c91100e19e10138]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/lib-provide-kmemdup_const/20250724-172620
base:   05adbee3ad528100ab0285c15c91100e19e10138
patch link:    https://lore.kernel.org/r/20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4%40linaro.org
patch subject: [PATCH v3 10/15] pinctrl: make struct pinfunction a pointer in struct function_desc
config: x86_64-buildonly-randconfig-002-20250725 (https://download.01.org/0day-ci/archive/20250726/202507261937.Txq9shpv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261937.Txq9shpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261937.Txq9shpv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinmux.c:917:7: warning: cast from 'void (*)(const void *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
     917 |                                          (void (*)(void *))kfree_const,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/devres.h:166:34: note: expanded from macro 'devm_add_action_or_reset'
     166 |         __devm_add_action_or_reset(dev, action, data, #action)
         |                                         ^~~~~~
   1 warning generated.


vim +917 drivers/pinctrl/pinmux.c

   883	
   884	/**
   885	 * pinmux_generic_add_pinfunction() - adds a function group
   886	 * @pctldev: pin controller device
   887	 * @func: pinfunction structure describing the function group
   888	 * @data: pin controller driver specific data
   889	 */
   890	int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
   891					   const struct pinfunction *func, void *data)
   892	{
   893		struct function_desc *function;
   894		int selector, error;
   895	
   896		selector = pinmux_func_name_to_selector(pctldev, func->name);
   897		if (selector >= 0)
   898			return selector;
   899	
   900		selector = pctldev->num_functions;
   901	
   902		function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
   903		if (!function)
   904			return -ENOMEM;
   905	
   906		function->func = kmemdup_const(func, sizeof(*func), GFP_KERNEL);
   907		if (!function->func)
   908			return -ENOMEM;
   909	
   910		/*
   911		 * FIXME: It's generally a bad idea to use devres in subsystem core
   912		 * code - managed interfaces are aimed at drivers - but pinctrl already
   913		 * uses it all over the place so it's a larger piece of technical debt
   914		 * to fix.
   915		 */
   916		error = devm_add_action_or_reset(pctldev->dev,
 > 917						 (void (*)(void *))kfree_const,
   918						 (void *)function->func);
   919		if (error)
   920			return error;
   921	
   922		function->data = data;
   923	
   924		error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
   925		if (error)
   926			return error;
   927	
   928		pctldev->num_functions++;
   929	
   930		return selector;
   931	}
   932	EXPORT_SYMBOL_GPL(pinmux_generic_add_pinfunction);
   933	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
