Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184E34D93C;
	Sat,  3 Oct 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049281; cv=none; b=Ry9tHBrLuevdIzKfAtG0iOBtHLd3J4Dkxtm2jH/32SxSLsL2mp6AChwTLfp/7bhhQ+SvAAnanjOdU1oLmG3E6hskL6Ua7wNsb+4vtzN/YfxoZW21gEe35ydpuWKKPj2pymwGQMDt4GeTq3NsUwpvQiWgl8P4aBqNjJjIJYiu+XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049281; c=relaxed/simple;
	bh=qlM4CxrKm6nTNFXkvjBg8pbF5mdP3TO5HkhAoWs8LtA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gBoF966ozLchiA3mQR6QPqs901DhFpg+G45On22fv/rxWbnvlBF34eQb9/q6xVzR9NFcS4JC5KspMnxNZg5Uc3Xytu/EKDpr3bf33gMLhFzz74DweJyVNQ5OJhL2yoMpKsjZxIRUiIVclnG7WiwGc9IjesOCVoHWmNrDcMyujyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIqs7JxC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIqs7JxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791049278; x=1822585278;
  h=date:from:to:cc:subject:message-id;
  bh=qlM4CxrKm6nTNFXkvjBg8pbF5mdP3TO5HkhAoWs8LtA=;
  b=WIqs7JxC12Cy+fErb28WgPuZv3cLXdTPYnrUJ1IS+HP1d4xlSyxtUX3X
   9muZsL2luJB7sUpu6Cjr+2dUORP+3qrpgu1hCSXrPwkGbqf6wyPdijfWr
   kkWpDTzPsQY6Thg5fLUFLm95pSMkyhGperprlLWrXFlZRmmMB/2/3ntDa
   o2mKjYxZWW7lH7xr+0Q3tSe3hwcPsEYO34N9weuSs3D+496hdnt8cdxoB
   f+SUZfMVRL7AgF90rYy7wbhlTnswRyAlB93QDOTkH0HCOi/gNGKVJ0j+G
   L/LMuYut9TuZvSryrvejEfD93IZ9Bk9bVshDvxrZFP2Si0rtzjj+i9siW
   A==;
X-CSE-ConnectionGUID: vdOT6D5bRyy73JMwRqnOqw==
X-CSE-MsgGUID: NaEcsEmoRIauG390hEJCbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="102301707"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="102301707"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 10:41:17 -0700
X-CSE-ConnectionGUID: zE+yrdIZQG2wO83NiHBqpw==
X-CSE-MsgGUID: RtaMM+HaQoe8bSuyjk3Tpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="279760293"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Oct 2026 10:41:16 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD3jV-00000000U67-3Ozf;
	Sat, 03 Oct 2026 17:41:13 +0000
Date: Sun, 04 Oct 2026 01:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Kees Cook <kees@kernel.org>
Subject: [kees:dev/v7.3-rc2/skb-buckets/v4 7/7]
 net/core/skbuff.c:589:22: warning: variable 'skb_data_buckets' set but not
 used
Message-ID: <202610040135.EsG7BUyr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.3-rc2/skb-buckets/v4
head:   0864a85d9ba2e3c91ab69bccd8823903cf1a6cad
commit: 0864a85d9ba2e3c91ab69bccd8823903cf1a6cad [7/7] net: skb: isolate skb data area allocations into a separate bucket
config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20261004/202610040135.EsG7BUyr-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040135.EsG7BUyr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040135.EsG7BUyr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/skbuff.c:589:22: warning: variable 'skb_data_buckets' set but not used [-Wunused-but-set-global]
     589 | static kmem_buckets *skb_data_buckets __ro_after_init;
         |                      ^
   1 warning generated.


vim +/skb_data_buckets +589 net/core/skbuff.c

   588	
 > 589	static kmem_buckets *skb_data_buckets __ro_after_init;
   590	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
