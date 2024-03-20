Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE5F3EA62;
	Wed, 20 Mar 2024 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710937455; cv=none; b=Xe2aBV4ZD33Gv8lj5P/g1nYRjAWVQ3Lwyq0E03HxVGzjTWNb1e8zusfzJvCnPMjzlrMrHqx9GaJ4+IxkfUU9ams+maw/ZO71Kd12B1jDjgl/2gRX5e1w4I92dwHcxTY2+YtKlqSYmFrgLHsrM5qeCEvuWAXXC/BWqwr1qv2fRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710937455; c=relaxed/simple;
	bh=uFRRz/xZOCARhvtMuJbjs6yu1wLdsQrLx4DorVDaXCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZIWQxs6+m2c/S5pA2ArwSQmoYdtorZQOMDdZJDAo+K7ud3cX8pq+7L+edhSDM28c65VsN5lTmEbUZO3+JSudwf8pdOezN7txfixdLszcJX7ALL9l/+kdH8A5kDPitpH+8hXILgD0vlLYpz+ghQyHj88cPwhwqAWLCF6DQuWivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qg6CX0fh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qg6CX0fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710937454; x=1742473454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uFRRz/xZOCARhvtMuJbjs6yu1wLdsQrLx4DorVDaXCI=;
  b=Qg6CX0fhFUAX+d0sukA0KACHfkeF7nNhOF224KYnodG/hL1YLXsofryN
   vg6wXnEObtI01UZ+DhdxJqurG/bVJCXPnZGe/WRuMlXFqYKMu/SeAt953
   /4A9N7FDPYvfp8hvZ8lKOhVJEvc5hxJkCNyn3trouneNhXw9zAK+6Uqgj
   Nh+ckvfb+vq/3evK9PtHqRo24rUvjlYTPLyznBIpocshpUkr7ptufltct
   EeuyfLRofdYwo5YXXgtKkTVkxpshbpzvE1gMDuTytXMTa5XkAbiCBFJTh
   Dv6ywWe+TR/T4WxikRkj0/i6g3lRHI7/Y+9XjOMS9ZmfeIPTBJ4C3IR9q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17312322"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="17312322"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 05:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14144803"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Mar 2024 05:24:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmuzH-000Ibj-0l;
	Wed, 20 Mar 2024 12:24:07 +0000
Date: Wed, 20 Mar 2024 20:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <tanure@linux.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 1/2] clk: meson: T7: add support for Amlogic T7 SoC
 PLL clock driver
Message-ID: <202403202033.qKlUi2cu-lkp@intel.com>
References: <20240318114346.112935-2-tanure@linux.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318114346.112935-2-tanure@linux.com>

Hi Lucas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.8 next-20240319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Tanure/clk-meson-T7-add-support-for-Amlogic-T7-SoC-PLL-clock-driver/20240318-194707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20240318114346.112935-2-tanure%40linux.com
patch subject: [RFC][PATCH 1/2] clk: meson: T7: add support for Amlogic T7 SoC PLL clock driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240320/202403202033.qKlUi2cu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403202033.qKlUi2cu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403202033.qKlUi2cu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/meson/t7-pll.c:87:29: warning: unused variable 'meson_pll_clk_no_ops' [-Wunused-const-variable]
      87 | static const struct clk_ops meson_pll_clk_no_ops = {};
         |                             ^~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/meson_pll_clk_no_ops +87 drivers/clk/meson/t7-pll.c

    86	
  > 87	static const struct clk_ops meson_pll_clk_no_ops = {};
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
