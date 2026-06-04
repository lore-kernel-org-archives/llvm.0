Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F16397350;
	Thu,  4 Jun 2026 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780596846; cv=none; b=c352UE5jJV6N4jkUbeZGOTIrnxRhcKxOQUn/mPN1kXt06lDbp+IhJpuUlBrEip4z4kYh+t4j7INm4UswNKJssgz865ai3RsmyrNZgW+j2LyoE2XAJ3SLMw2Jh1KsY4K2/yFlwBs6/h16lrMVsVB6sWzGAzbYGxSl78mY73NbX80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780596846; c=relaxed/simple;
	bh=R8FMnx5MGUBjK1edLdUjsNizXbgdi+MnDgWq9KVFwtw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dhGfmjyPw9HxyVyC5b/JzMJ1lKnyihpcWZN/cMDc4jOzcEta59i9zMYPoaypCz4eaEkghxKVZQLRy5jHwJJt6kwR8VbNHoGIrEJsk917XIvhcICVjsVhVRpfcMDhV3dY0ypJqJokOmkIMx+fg8pIVIgtVzoHWx859S5xnynEbuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHwy6siY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHwy6siY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780596844; x=1812132844;
  h=date:from:to:cc:subject:message-id;
  bh=R8FMnx5MGUBjK1edLdUjsNizXbgdi+MnDgWq9KVFwtw=;
  b=ZHwy6siYmOMZPouiPzfsody1wJBRGNCUXw8jsjAjOxKhIyEOHf/LJAPn
   t7VK0E60A+mU9sYYMtU3xvzF0fK3jyqvKFkAdLvR6JHyAOzCIc0Uimq8Y
   BtoGTOlTaWKbdWG2cvKa5au5CkM6rwp0xRbkmzc7okjitNNNkhloj/FTo
   RQx0wj6vB7x/7RqCdQKPQVNe984olyyXJbUS6IpqMXdrobbmOHkwd/ZLa
   9FUtlffJrNsWCVycWfKqf4d+S6bojyTBaCHHqa6j4Ou6lGD64oiu7W8F5
   cP4nR2WCdKNgX/01l86Um4Ay2JK5+e3JBf4etIMA1KHYmi/AQS2qq6nbb
   g==;
X-CSE-ConnectionGUID: jrsIaPiTSM6QU0zgJpVfig==
X-CSE-MsgGUID: OkJaM4NYRtykOy5ZCardYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="104092191"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="104092191"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 11:14:04 -0700
X-CSE-ConnectionGUID: NAPeJ6c7Q+evtJTFEjYrfQ==
X-CSE-MsgGUID: g3R4qkRIT0uISiWBkZJmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="238271169"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2026 11:14:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVCZs-000000002N7-1Uww;
	Thu, 04 Jun 2026 18:14:00 +0000
Date: Thu, 04 Jun 2026 20:13:16 +0200
From: kernel test robot <lkp@intel.com>
To: Javen Xu <javen_xu@realsil.com.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/ethernet/realtek/r8169_main.c:5168:6: warning:
 variable 'tx_done' set but not used
Message-ID: <202606042024.ym6DXsZo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/javen/r8169-add-support-for-multi-irqs/20260604-183631
head:   701d27322fcb57fca646ece205dcc2a3a74c4c11
commit: fe99b1d4a4b59d25254704ec227e0c35c416ee0d r8169: add support for new interrupt mapping
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260604/202606042024.ym6DXsZo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606042024.ym6DXsZo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606042024.ym6DXsZo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/realtek/r8169_main.c:5168:6: warning: variable 'tx_done' set but not used [-Wunused-but-set-variable]
    5168 |         int tx_done;
         |             ^
   1 warning generated.


vim +/tx_done +5168 drivers/net/ethernet/realtek/r8169_main.c

  5162	
  5163	static int rtl8169_poll(struct napi_struct *napi, int budget)
  5164	{
  5165		struct rtl8169_private *tp = netdev_priv(napi->dev);
  5166		struct net_device *dev = napi->dev;
  5167		int work_done = 0;
> 5168		int tx_done;
  5169	
  5170		tx_done = rtl_tx(dev, tp, budget);
  5171	
  5172		/* rtl8169_poll() is used only when there is a single RX ring. */
  5173		work_done = rtl_rx(dev, tp, &tp->rx_ring[0], budget, napi);
  5174	
  5175		if (work_done < budget && napi_complete_done(napi, work_done))
  5176			rtl_irq_enable(tp);
  5177	
  5178		return work_done;
  5179	}
  5180	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
