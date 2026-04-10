Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33C33C53D;
	Fri, 10 Apr 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814448; cv=none; b=Ah8K3XQG38zCDVBwUM670B2lIZ1qBOnAlerTK/Bt7jdsbUX/KfbOTKEsy0BtUvmfJN1Q8BhoNluxkyTRczFLTD0r8B5lH6/KLlsULcEbqo+dUKhaVcchVud+cd2IeBQMnBuoLjydQV09VGTXrAMEyN9CsRnvJzGX6m0DAXNP1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814448; c=relaxed/simple;
	bh=RReHJ4AH92iTEwFJ3sbwpLODm767RLjpSsMx7TUU1kY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZCuDEHS5CT0mIiPW655Bl2Fe1WevPzSkDWzz1SYkIArNesNip3t+w4txINfD+8Nvg/uAk41ZAszcQjMnTzDLu4V3zA6H2ZlxaeJfmHYi+ug1ZeDuSD0t7DZ4oa884QDyzBGWDSK3zwQ7hTPtcUH7871o5PeNNANMd7tcWNeUmvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRct0VIe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRct0VIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775814447; x=1807350447;
  h=date:from:to:cc:subject:message-id;
  bh=RReHJ4AH92iTEwFJ3sbwpLODm767RLjpSsMx7TUU1kY=;
  b=hRct0VIeykM0cs3WL4dECklD5j8XhCJVSGs7LIoyuWv2cAzXfHC0MfOm
   Hv6fZW1WqTEPDGhV8Cucxc3Xc/pM6YGUx8So4P6Nwkacq71MBCViFXTAi
   mtpSFvd06Ncq9QJo9eFJDWOR4SruJhvXGrz72QsgzNzJ8/iPyao6DE3pS
   1Y7zWEB/9Kbb9LSzctUvskP40QcLwrcGB2mKDLtAHjyGV9pQ8gyfNUGIX
   sMVbZSrSzReneM2Jt9VHp8swtapewSolGiguAMuPyYJCr7m5pSUq+u4Fy
   PKFx12XK5mn55ZFFJrOA7QKB9w/NIqDV6G+dNwyIJ0PaRr76FcPtq+RU/
   Q==;
X-CSE-ConnectionGUID: NPQpq3HgSNWGayFI0gIITQ==
X-CSE-MsgGUID: fUx8I83TTvSA4LaoAg3J/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80691241"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="80691241"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 02:47:26 -0700
X-CSE-ConnectionGUID: 4G2FDwYZQpy3Mw8tEHUy/g==
X-CSE-MsgGUID: mJDihN5MTFGO7EXl2hOKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="224742458"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2026 02:47:25 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB8SQ-000000003Zd-2Wid;
	Fri, 10 Apr 2026 09:47:22 +0000
Date: Fri, 10 Apr 2026 17:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/netkit-iouring28 16/16] net/xdp/xsk.c:132:7:
 error: call to undeclared function 'netif_rxq_is_leased'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202604101724.5hKWMpJM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring28
head:   28fb61aaf5d0f6b9ca1d5b686cdbd5a8f0cfc750
commit: 28fb61aaf5d0f6b9ca1d5b686cdbd5a8f0cfc750 [16/16] errata
config: arm64-randconfig-002-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101724.5hKWMpJM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101724.5hKWMpJM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101724.5hKWMpJM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/xdp/xsk.c:132:7: error: call to undeclared function 'netif_rxq_is_leased'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         if (!netif_rxq_is_leased(dev, queue_id))
         |              ^
   net/xdp/xsk.c:173:7: error: call to undeclared function 'netif_rxq_is_leased'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |             !netif_rxq_is_leased(dev, queue_id))
         |              ^
   2 errors generated.


vim +/netif_rxq_is_leased +132 net/xdp/xsk.c

f785e9937db541 Jakub Kicinski  2026-04-08  127  
1c1efc2af15886 Magnus Karlsson 2020-08-28  128  void xsk_clear_pool_at_qid(struct net_device *dev, u16 queue_id)
1c1efc2af15886 Magnus Karlsson 2020-08-28  129  {
f785e9937db541 Jakub Kicinski  2026-04-08  130  	struct netdev_rx_queue *hw_rxq;
3224a26004da42 Daniel Borkmann 2026-04-03  131  
f785e9937db541 Jakub Kicinski  2026-04-08 @132  	if (!netif_rxq_is_leased(dev, queue_id))
f785e9937db541 Jakub Kicinski  2026-04-08  133  		return __xsk_clear_pool_at_qid(dev, queue_id);
f785e9937db541 Jakub Kicinski  2026-04-08  134  	WARN_ON_ONCE(!netif_is_queue_leasee(dev));
3224a26004da42 Daniel Borkmann 2026-04-03  135  
f785e9937db541 Jakub Kicinski  2026-04-08  136  	hw_rxq = __netif_get_rx_queue(dev, queue_id)->lease;
3224a26004da42 Daniel Borkmann 2026-04-03  137  
f785e9937db541 Jakub Kicinski  2026-04-08  138  	netdev_lock(hw_rxq->dev);
f785e9937db541 Jakub Kicinski  2026-04-08  139  	queue_id = get_netdev_rx_queue_index(hw_rxq);
f785e9937db541 Jakub Kicinski  2026-04-08  140  	__xsk_clear_pool_at_qid(hw_rxq->dev, queue_id);
f785e9937db541 Jakub Kicinski  2026-04-08  141  	netdev_unlock(hw_rxq->dev);
f785e9937db541 Jakub Kicinski  2026-04-08  142  }
f785e9937db541 Jakub Kicinski  2026-04-08  143  

:::::: The code at line 132 was first introduced by commit
:::::: f785e9937db541632ce741099e1573a297a1c161 net: Remove the netif_get_rx_queue_lease_locked() helpers

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
