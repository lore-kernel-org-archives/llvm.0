Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CDC1F4168;
	Tue,  4 Nov 2025 01:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762219413; cv=none; b=lUS1ZAV/01qjQcrxvK2HREsG+Y1XprI1mCKt53f01g1zAgND6wRnuORicLt5dezbOnaQGlwQjp1hywor4ElYiv+a0akGlUDWEW8+KtdCogHUcenO4+Z1tqRoAQup72kvz2BsA1Xxc8VeXNMVGeDEQ26XGg5eq3zdWOWP00LSH/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762219413; c=relaxed/simple;
	bh=Oe2z97V4X/+fdXWxcIP/sHuLgqvLi/VcKJUIaW3A9p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYfYAJBEYRHPsoVMsQjVs91BD1LpNdgHRAeUX2LGtqTiYS/S09igNbKUEvc3C7xMX+Pz+diOmW0n07dxwpvUw5qtE2TzAkPD4ajKeiA4SxNiKjzYWCvpv24Iv+BySxoy/BxDF8/lCNOLaLpEFLo92TKg3wRk6FuPBTqh4zdUtBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAJwZVvT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAJwZVvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762219411; x=1793755411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oe2z97V4X/+fdXWxcIP/sHuLgqvLi/VcKJUIaW3A9p8=;
  b=ZAJwZVvTra8KLTDx24k+67ZwYN3/UqAhjpdPB3/ZoaBt8lMPWet3z4zs
   6Je8czwLHZ6IqvSOnEtbABKQ/GFQhcQfzD7X2iHeP4rpYKXZEundEQV3P
   brYXcgDLrIfE1PWFHJpqy45CB/MolScHs1+BnQvt4mF4Xfp/eZppjbHw+
   gpelfGJzG5DHyblazsjMQId5v8SqUTHBFJEBJM0yPDfdhk4WBT6ytllJ8
   +sbUv72idT1+53ykDWYgsc03EkbmYnIVpfeCosMg5tkBieMPzNmPGEbCI
   O341UY/k34tUMPfsXrI8cNE5CytpHLEiZ6e1M+aBub32Lfeej42bCCrTO
   g==;
X-CSE-ConnectionGUID: ypSluznRQ/y97Dx/CpfNrw==
X-CSE-MsgGUID: WCT19lXDTumBMt9U+WsLxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68166945"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="68166945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 17:23:30 -0800
X-CSE-ConnectionGUID: zWcqEi5CRAi39mIRwMnCIQ==
X-CSE-MsgGUID: AV8XafP0RgmYAPNBEqjxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="217657287"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Nov 2025 17:23:28 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG5lK-000Qim-2R;
	Tue, 04 Nov 2025 01:23:09 +0000
Date: Tue, 4 Nov 2025 09:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kanjimonster:b53/wip 10/12]
 drivers/net/dsa/b53/b53_common.c:2590:28: warning: variable 'i' is
 uninitialized when used here
Message-ID: <202511040948.TxkC68cF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/KanjiMonster/linux b53/wip
head:   4bd0d15e25ab64f157bf00b4c39bd1ef94da1ff5
commit: 70fb214830ff40f92fbfbacf66223b3cd3e803b9 [10/12] net: dsa: b53: add MSTI support
config: i386-buildonly-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040948.TxkC68cF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040948.TxkC68cF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040948.TxkC68cF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/b53/b53_common.c:2590:28: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    2590 |                 if (dsa_to_port(dev->ds, i)->bridge)
         |                                          ^
   drivers/net/dsa/b53/b53_common.c:2582:8: note: initialize the variable 'i' to silence this warning
    2582 |                 int i;
         |                      ^
         |                       = 0
   1 warning generated.


vim +/i +2590 drivers/net/dsa/b53/b53_common.c

  2574	
  2575	void b53_br_set_stp_state(struct dsa_switch *ds, int port, u8 state)
  2576	{
  2577		struct b53_device *dev = ds->priv;
  2578		u8 hw_state;
  2579		u8 reg;
  2580	
  2581		if (dev->num_msts) {
  2582			int i;
  2583	
  2584			if (port == B53_CPU_PORT)
  2585				return;
  2586	
  2587			/* Update CIST entry */
  2588			b53_set_mst_state(dev, port, 0, state);
  2589	
> 2590			if (dsa_to_port(dev->ds, i)->bridge)
  2591				return;
  2592	
  2593			for (i = 1; i < dev->num_msts; i++)
  2594				b53_set_mst_state(dev, port, i, state);
  2595		} else {
  2596			switch (state) {
  2597				case BR_STATE_DISABLED:
  2598					hw_state = PORT_CTRL_DIS_STATE;
  2599					break;
  2600				case BR_STATE_LISTENING:
  2601					hw_state = PORT_CTRL_LISTEN_STATE;
  2602					break;
  2603				case BR_STATE_LEARNING:
  2604					hw_state = PORT_CTRL_LEARN_STATE;
  2605					break;
  2606				case BR_STATE_FORWARDING:
  2607					hw_state = PORT_CTRL_FWD_STATE;
  2608					break;
  2609				case BR_STATE_BLOCKING:
  2610					hw_state = PORT_CTRL_BLOCK_STATE;
  2611					break;
  2612				default:
  2613					dev_err(ds->dev, "invalid STP state: %d\n", state);
  2614					return;
  2615	
  2616				b53_read8(dev, B53_CTRL_PAGE, B53_PORT_CTRL(port), &reg);
  2617				reg &= ~PORT_CTRL_STP_STATE_MASK;
  2618				reg |= hw_state;
  2619				b53_write8(dev, B53_CTRL_PAGE, B53_PORT_CTRL(port), reg);
  2620			}
  2621		}
  2622	}
  2623	EXPORT_SYMBOL(b53_br_set_stp_state);
  2624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
