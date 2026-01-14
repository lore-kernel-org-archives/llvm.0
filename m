Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4313136C0A1;
	Wed, 14 Jan 2026 06:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768371521; cv=none; b=SIbEX7sUm1Sn+ocVjow8ckX9MxB3bcn8aSmspm8X3vqKhdRnyLztqefi3eJgArnqCkR0e4ZSaWEMRBgEdNldyWt54CDfPr8Mb1B1+tQ5TzLW7jPct3YjGGdGzReyPTrL4zvjIBrTwk6yzFz0+6W1yoaI+NUjgtO5RQ5OlBtBlok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768371521; c=relaxed/simple;
	bh=nxSzcvzzHWdNAdgrMcbrS7ggZ6h97hhB6Q4JayxrBCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekjetZI+SZcSwhhGbkezrQ++2gMG7I86q55naN/Tj46vI/yt+VNh/X+ylZBcICiL/AWZpmFXOfdtKys6K+icoRGeywa98OxQHbLBsTL+4AHOKDBhClTMSiKiZ9rcKkssjdtzXqp4kYgKtirbt4VOFdzO7T/AR8B5vxQO5D8Qncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDn2zxZw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDn2zxZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768371506; x=1799907506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nxSzcvzzHWdNAdgrMcbrS7ggZ6h97hhB6Q4JayxrBCU=;
  b=bDn2zxZwmrzPIz2KcDJcAczs5tNooIOGS1pdYGpFx2IVOwRnHEJCqyHy
   P1aKDqdwuAIz8QMYYeH+TfCJOmsmVPd0o2anRTwsEzfMVT80RY2oJQLiZ
   5CtwazugQqtAPQrloU0cR4XE4JGs1AqdW0/PftYHRs2uWrhjPXwR47lxp
   sC4xYSNddLhPpDeIU2hrtHATdAvdreuqmwjEWaJOBsSl67yuInvOqz10R
   OeQx/7Uvr0poL7v+zoDGs0Du+zNCT2zF4g2UjvMkBM7JUqiOuYyGfYQbV
   3XNYKI5I8smN7HpLzQ7Nc3DK6sZvlCfPsd1dnIaoaj0w5OyL5oRnBzoUA
   g==;
X-CSE-ConnectionGUID: smf5gld6QseHSlOuvV7FMw==
X-CSE-MsgGUID: LxMTLRVBRW2FDhk4gHv4Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69717667"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69717667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:18:20 -0800
X-CSE-ConnectionGUID: o25ooGa8RS+SpnjyHfhupg==
X-CSE-MsgGUID: vvV9pNS8S/ylru/27TlyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204224659"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 22:18:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfuCs-00000000Fum-0xFe;
	Wed, 14 Jan 2026 06:18:14 +0000
Date: Wed, 14 Jan 2026 14:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com,
	jyanchou@realtek.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	eleanor.lin@realtek.com
Subject: Re: [PATCH v2 5/9] clk: realtek: Add support for gate clock
Message-ID: <202601141328.Q3kIKTpo-lkp@intel.com>
References: <20260113112333.821-6-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113112333.821-6-eleanor.lin@realtek.com>

Hi Yu-Chun,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20260113-192709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260113112333.821-6-eleanor.lin%40realtek.com
patch subject: [PATCH v2 5/9] clk: realtek: Add support for gate clock
config: arm64-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141328.Q3kIKTpo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141328.Q3kIKTpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141328.Q3kIKTpo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: clk_regmap_gate_ops
   >>> defined at clk-regmap.c
   >>>            drivers/clk/meson/clk-regmap.o:(clk_regmap_gate_ops) in archive vmlinux.a
   >>> defined at clk-regmap-gate.c
   >>>            drivers/clk/realtek/clk-regmap-gate.o:(.rodata+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: clk_regmap_gate_ro_ops
   >>> defined at clk-regmap.c
   >>>            drivers/clk/meson/clk-regmap.o:(clk_regmap_gate_ro_ops) in archive vmlinux.a
   >>> defined at clk-regmap-gate.c
   >>>            drivers/clk/realtek/clk-regmap-gate.o:(.rodata+0xc8) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
