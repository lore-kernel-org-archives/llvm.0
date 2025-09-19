Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7731413D521;
	Fri, 19 Sep 2025 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758282873; cv=none; b=jf3bhDCqjvPCNNy+O8IH7Yz/ZGidLw1sw+F3mcfBaAR0wiaMGzmZOTqs6+3u0yUxpMiAzU0BmAhtWfnSqP8VrZpdyYfCW8mqv5aIOCHIjWvgdChoThHHzZ5gYB8l39/1L8IQRSxddG+Zg436+tSuRi+VX6zTH97pt5KgsOcwG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758282873; c=relaxed/simple;
	bh=y7OyWVnFUrqL2uSHNgFvenSg4gtvzcc9PnApmvMeZiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X51ghatMGNNfrNWIi3ANo9zmaGgExtBMSxAHaDWVF7FeBlAATVFMIWx+d47MRNH9O0Wehd53qWtckF6DBI/U3g7edYjFAAST/nzLBxScbE4ggBJkirnNVH6+9ZyTMrjhINePfsp+WywOlLq2z6TC7jQkZszT3ls3HzGMxGihVC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJK1BuXQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJK1BuXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758282870; x=1789818870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y7OyWVnFUrqL2uSHNgFvenSg4gtvzcc9PnApmvMeZiI=;
  b=JJK1BuXQ/4rOplpjFkGz4T4JWVoiKthEGk9OeGeSs1lmDPze2Dq6dYFt
   ij+MWYyv/WMH6Ii9gWzuVTj+viwZN9VJnK9bsWRbXjL7Feu3Yf2jOTb7t
   t2Gtq4DNPPju4rWCuOINK889QDahtfEbMTOymXKg08ZkyCahaPHqW/6Rx
   d/l1TMHRhiuA1ro8tGteWOChO4QwsxkL9lG1en5aMyPQRbhqqHoAfPuhX
   y6+joC6szd7vj/7f4YwXdhzTUG7fwHXE7GBzVlmncr/RPPMdZ5mqrqL3K
   XorOJrYhGOeU3O34Qv/7Sw8h30JDTnN2bcGCTr9S30ToA3YA4hSS4iyWF
   Q==;
X-CSE-ConnectionGUID: cn/6+ahGS1ys4BbW0ClbVg==
X-CSE-MsgGUID: ZOZlxF77RP2EBds6I6DfxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71736230"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="71736230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 04:54:30 -0700
X-CSE-ConnectionGUID: Qz4dcmsKRPuLDrONo35UGQ==
X-CSE-MsgGUID: xD739ETMT6ynzClMVRAekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175073520"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Sep 2025 04:54:29 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzZh3-0004GV-2k;
	Fri, 19 Sep 2025 11:54:25 +0000
Date: Fri, 19 Sep 2025 19:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, peter.chen@kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH v2 4/8] usb: xhci: add tracing for PORTSC register writes
Message-ID: <202509191919.KyzDDNgQ-lkp@intel.com>
References: <20250917125850.3380560-5-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917125850.3380560-5-niklas.neronin@linux.intel.com>

Hi Niklas,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-linus]
[also build test ERROR on tegra/for-next westeri-thunderbolt/next linus/master v6.17-rc6]
[cannot apply to usb/usb-testing usb/usb-next next-20250918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Neronin/usb-xhci-correct-indentation-for-PORTSC-tracing-function/20250917-211828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
patch link:    https://lore.kernel.org/r/20250917125850.3380560-5-niklas.neronin%40linux.intel.com
patch subject: [PATCH v2 4/8] usb: xhci: add tracing for PORTSC register writes
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250919/202509191919.KyzDDNgQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191919.KyzDDNgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191919.KyzDDNgQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xhci_set_portsc" [drivers/usb/host/xhci-pci.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
