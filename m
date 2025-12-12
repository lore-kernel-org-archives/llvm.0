Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E026ED4C;
	Fri, 12 Dec 2025 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577979; cv=none; b=Xcmo4vu1LYIrZou2OwqZ7OYpvgbJzC7MdKN2wqsp074AnA6eBidpXGDJSrs8RQWGfWUA+eiRFuKERRZVYINipQEoANe/O98Ti6ywqZGXU1UUNK+MdjWzsnK8dOvDOcOjNPMOxuUypcCcg2hLQ/VrezsNCJB64CmDtpHCg2kpMuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577979; c=relaxed/simple;
	bh=JHf+ygsRb1CpDE/1SW3r3R6b9ZWEqBQpB6y0mqLMwOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSoFosxOVym0rz5BmpFFNXj+ChfjHmmnrxi6NUvouiU6/yYrNxET8+pN0BCEJnY0sISBY0coPpIQuAjJEbdIyrLbZg4ViQ4Ngam6DMqCRB9vquJmwexEbg4FsbvXARtMXp137rmZweaiwAohH2ss3CwTVeRHGxSm1IxN5tvev1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWnVt+N8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWnVt+N8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765577978; x=1797113978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JHf+ygsRb1CpDE/1SW3r3R6b9ZWEqBQpB6y0mqLMwOI=;
  b=dWnVt+N8JNkGg3+d6VtJZuRVJPqkQRX9bZIBT51e5s4nTmCMRBxrHoNo
   mK3x9YhL2U2hIjtvAQn5dGoFU/jaI4s2gxTEgnHiKxSz6baU4Gqk/XUzI
   FED8uFPgx8SxtfAQvusEsx1Wwohi9Rg9DSU7gBYGcQYfPnvUupjY9LN0I
   BlTDop/8UlCasFoksllRbUUZGt4avUZ8p1SnLevc1oBi4xNeqH1MQHmK5
   Fe0TUVKL1Xs0iVXsv7DLNT+Mi6PUIgAuToCFjvFKg1q1je9Ycrzzz2V6r
   +7BwmPNNxNrPr1sJ0YQTiOt6DrDV9heJ/V6NInibxbFX3/H1doqQBRjV2
   Q==;
X-CSE-ConnectionGUID: DXuhWQDfQqyMerpF8pr29g==
X-CSE-MsgGUID: OAMc9KnwT5u4WB0l1y7zVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77901763"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="77901763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:19:35 -0800
X-CSE-ConnectionGUID: EFv+IPzkR/+0xv+NAvje8Q==
X-CSE-MsgGUID: 2M5WcB5OSBS81RvsGKk9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="198016228"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 14:19:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBU3-000000006gj-1H2m;
	Fri, 12 Dec 2025 22:19:31 +0000
Date: Sat, 13 Dec 2025 06:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] clk: spacemit: k3: add the clock tree
Message-ID: <202512130555.L2aaievU-lkp@intel.com>
References: <20251211-k3-clk-v1-4-8ee47c70c5bc@gentoo.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-k3-clk-v1-4-8ee47c70c5bc@gentoo.org>

Hi Yixun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]

url:    https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/dt-bindings-soc-spacemit-add-k3-syscon-compatible/20251211-092723
base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
patch link:    https://lore.kernel.org/r/20251211-k3-clk-v1-4-8ee47c70c5bc%40gentoo.org
patch subject: [PATCH RFC 4/4] clk: spacemit: k3: add the clock tree
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512130555.L2aaievU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130555.L2aaievU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130555.L2aaievU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/spacemit/spacemit-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/spacemit/spacemit-ccu.o
>> ERROR: modpost: "spacemit_ccu_pll_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_factor_gate_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_factor_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_gate_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_ddn_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_div_gate_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_mux_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_mux_gate_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_mux_div_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
>> ERROR: modpost: "spacemit_ccu_div_ops" [drivers/clk/spacemit/spacemit-ccu-k1.ko] undefined!
WARNING: modpost: suppressed 11 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
