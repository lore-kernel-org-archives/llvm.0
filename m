Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5933A4AB8;
	Wed, 14 Jan 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409950; cv=none; b=stoS7FT3Hj0l91WJqKBdB1PEQMMRTMbTnOqbfQBrxcOrwWrjucnhNXt1E5OSGeE+WN/CxgtcB/a+hMLAI8cSypFKsPVW5QgQn2HlLMlMnFPXShbvjh6wEKNWatXji0Ul19dKGgm5Ngvyoncjq65nkLUn5aJhPbioXb7YrczyKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409950; c=relaxed/simple;
	bh=l/D1TjygnWEWBcgI5iokuhGrTQs0+FYsNCYqU6v2yGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Blhm0bWrTm6auVJdhRYON9Z7eGmlVpSTTUsB74BBMfxSv7p8xC5dEukTkOnsDkhEtPqk/3aLWeDaqkb4ZYWx/i6TT7Ox2uo8ewMC7EmJ0ZBJlPeMZNZdB8z5YCqNAAuy0A75bgx8qmF0ItMHiALGNVeOmX5dQLEoMUuqjOpl60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbBGt9Cb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbBGt9Cb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768409949; x=1799945949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/D1TjygnWEWBcgI5iokuhGrTQs0+FYsNCYqU6v2yGc=;
  b=ZbBGt9CbNMgP9yNDtSWXw+nv8GOmxdcUslJ8QF3q44IlQ2D5l6oAsNx4
   +/ZRdiQ/ZhXf63Q1g2+c04H7h7IFGQoEIZYmyNg6GJFLFsmbPvvAW9wig
   Y/0x2gjupjPiMjZUfM3kOfubwptHDI96VXN8n3kojNwYjetbGLqL05H3x
   SeA1hdymslONbNRsXbHIJ3eqMosAbTi6BCitaoOK4Ssqz+y3YJNbA8/bC
   6pZdw1UZcVgCM82CKmEN1tvh9ktTqV578+lv5hON6ii1KOBunn6k3RgHU
   Eb8ICXtezlgPondxyUEmrr06F0wbU69iW/1wU1rhYGbGIcv7/IP/6xUO8
   Q==;
X-CSE-ConnectionGUID: WI3wL4+tQCmSD0cnviYimA==
X-CSE-MsgGUID: uy6ziSWyQKq0atmf/yx4aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69622272"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69622272"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 08:59:08 -0800
X-CSE-ConnectionGUID: hiJq6ta9SsmrXZbr06YeDA==
X-CSE-MsgGUID: lpm2i9eFSwqISEJpuvKHDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204757271"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 08:59:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg4Cy-00000000GhU-3jLB;
	Wed, 14 Jan 2026 16:59:00 +0000
Date: Thu, 15 Jan 2026 00:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v4 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <202601150056.yaKfBjXc-lkp@intel.com>
References: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes broonie-regulator/for-next linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/dt-bindings-i3c-Add-NXP-P3H2x4x-i3c-hub-support/20260113-195318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260113114529.1692213-5-aman.kumarpandey%40nxp.com
patch subject: [PATCH v4 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260115/202601150056.yaKfBjXc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150056.yaKfBjXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150056.yaKfBjXc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/hub/p3h2840_i3c_hub_common.c:51:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         pullup = P3H2x4x_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
         |                  ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:64:3: note: expanded from macro 'P3H2x4x_TP0145_PULLUP_CONF'
      64 |                 FIELD_PREP(P3H2x4x_TP0145_PULLUP_CONF_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:80:16: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         io_strength = P3H2x4x_CP0_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:51:3: note: expanded from macro 'P3H2x4x_CP0_IO_STRENGTH'
      51 |                 FIELD_PREP(P3H2x4x_CP0_IO_STRENGTH_MASK, x)
         |                 ^
   2 errors generated.


vim +/FIELD_PREP +51 drivers/i3c/hub/p3h2840_i3c_hub_common.c

    45	
    46	static int p3h2x4x_configure_pullup(struct device *dev)
    47	{
    48		struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
    49		u8 pullup;
    50	
  > 51		pullup = P3H2x4x_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
    52							(p3h2x4x_i3c_hub->hub_config.tp0145_pullup));
    53	
    54		pullup |= P3H2x4x_TP2367_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
    55							(p3h2x4x_i3c_hub->hub_config.tp2367_pullup));
    56	
    57		return regmap_update_bits(p3h2x4x_i3c_hub->regmap, P3H2x4x_LDO_AND_PULLUP_CONF,
    58								  P3H2x4x_PULLUP_CONF_MASK, pullup);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
