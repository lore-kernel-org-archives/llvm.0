Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E93E38FA6;
	Fri, 11 Jul 2025 03:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752203494; cv=none; b=f9UX66dSxZn0yWBQvF6WQsrfXW9JZ/do83EVivJHxjcGw9M9Jua70plMV4BLFIsJLthCBUY87MN9JTTqcxhLtxf+/f8bH3pOWaKTwUzRhbBjKLSe+GUQzcIdGqwu8DVYmyiTU1dw8SyaFQxXv6pVJ1lK65OfuZt+fgtHMIwEEXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752203494; c=relaxed/simple;
	bh=DsUt/Tzl2vZOLy2+tiFO+2617t5xbwdza0Q9XlJc9Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWBXLbbsmIJtc6cmiFlcZB1sWXDAlAiXKwimfjEm4i7niVO/UWC87ol7USYywPvRbDkFpzl8anT0kJxLAbaQ+3hjv/Bu0XZfWNVLBzafzNztl1HEXGWMJsnOy5ucY2I/nSSjZnY+JZHIsbATaHcImLXSkRuBwArqqpvol7ighew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdJ1QNco; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdJ1QNco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752203492; x=1783739492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DsUt/Tzl2vZOLy2+tiFO+2617t5xbwdza0Q9XlJc9Qs=;
  b=BdJ1QNcoKU6YxoCFozJayDr2wOKCakvy6/NFWrwvXDGEyo0+dDFJLas6
   5oI799FmJJ+WRbdqzqaUKJGH7ei2frsEYiMsMUwxrYFk8Ij+ZMxLoU6Ye
   Wvpse8p8A/mvRZelsfnVxD1KzMJqt2AxnhCVaoTe30MyyNd2E/s87hvzc
   VwCnb+7Mqc41Yw7LETCzrulLUu+UD5UjknMx7VoiNSIlNzBn5jtZ2xIXr
   oKK47Kwl4Nr74zj6qWhH/rx5VcKaqg3uLgvUoo6sOlcQy8CoEqtisSR08
   fV+HD345OGJ110pV7pgyDu4+olBwUwku4oHJ8lecLlZlf2f1jUJbYZX3p
   g==;
X-CSE-ConnectionGUID: u8dNJFHlSB2BZxpGDNHWQQ==
X-CSE-MsgGUID: opnKR8ixQrOEOzGlNGp8vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54624554"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="54624554"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 20:11:32 -0700
X-CSE-ConnectionGUID: HBZXQLSUQ2KtbX5VuxZSrA==
X-CSE-MsgGUID: 71g5WJkFSsGSlLh2AjF9UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="160559151"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2025 20:11:30 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua4Aa-0005nP-1L;
	Fri, 11 Jul 2025 03:11:28 +0000
Date: Fri, 11 Jul 2025 11:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [masneyb:clk-remove-round-rate 174/204]
 drivers/net/ethernet/cadence/macb_main.c:4856:9: error: member reference
 type 'struct clk_rate_request' is not a pointer; did you mean to use '.'?
Message-ID: <202507111117.YXMNEEQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/masneyb/linux clk-remove-round-rate
head:   8851da05a900556018f975b6ca1691e13d24fc50
commit: eea9100f42b58ca73af101e3b582f49be56eb679 [174/204] net: cadence: macb: convert from round_rate() to determine_rate()
config: x86_64-buildonly-randconfig-002-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111117.YXMNEEQe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111117.YXMNEEQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111117.YXMNEEQe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:4856:9: error: member reference type 'struct clk_rate_request' is not a pointer; did you mean to use '.'?
    4856 |         if (req->rate != 125000000)
         |             ~~~^~
         |                .
   1 error generated.


vim +4856 drivers/net/ethernet/cadence/macb_main.c

  4844	
  4845	static int fu540_macb_tx_set_rate(struct clk_hw *hw, unsigned long rate,
  4846					  unsigned long parent_rate)
  4847	{
  4848		struct clk_rate_request req;
  4849		int ret;
  4850	
  4851		clk_hw_init_rate_request(hw, &req, rate);
  4852		ret = fu540_macb_tx_determine_rate(hw, &req);
  4853		if (ret != 0)
  4854			return ret;
  4855	
> 4856		if (req->rate != 125000000)
  4857			iowrite32(1, mgmt->reg);
  4858		else
  4859			iowrite32(0, mgmt->reg);
  4860		mgmt->rate = rate;
  4861	
  4862		return 0;
  4863	}
  4864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
