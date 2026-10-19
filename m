Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7032494293;
	Mon, 19 Oct 2026 07:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396776; cv=none; b=CIdTWgwfFAsGJoiPS+LRK1oWaT6D9C4ky8ChS+IsnTaWiOxM7ma0uPH6Ph1u7aH/I23DFOb9z2GGHFeORBvDx/BA6mu/ttzvOcOLqMbwjZXVRzENnkliRh7WurczEzc6W40Q/4SbAlLyBlpv6OVWmt8LwOphTHVSZ/QoRRIS8O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396776; c=relaxed/simple;
	bh=JtgecYBNNqAl9F7F7xUPcE98mYpkdrrmI9zaGsYK7CE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NwxdvuLRBE4VpanvqJCCZZsWm12lwEVCaf9QA8M+kTW7l3i37DeO0FT4nKxM6jsWjiddX9q8bvpBPILAzPqfG+yQu43rexb88NmS2I0DUTqpkCH64AmJ5HujwkP82bCWeU444tFXjTGSLdpj0ZGhcZifn5UL33a0kZvSKkTl4Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHK4DDky; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHK4DDky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792396773; x=1823932773;
  h=date:from:to:cc:subject:message-id;
  bh=JtgecYBNNqAl9F7F7xUPcE98mYpkdrrmI9zaGsYK7CE=;
  b=mHK4DDkyh4JUMrW/nqWkbnacYkjmJaNEm+oKb8YWIfUJYg2rXkB2Y1gA
   kuGSTr8DglOpZmWIePeTFCB5g3UiuvayFMWW5+02VIooe7cMYJ8s9ZQ43
   j5hSQkGlJswYz1fdIM4WTlqfYzMze4DZlA7BQTWvaKdyVG0KNmxg7sYrL
   NqwgRaoZuOCZuGVVVhll8mFYkDVU1ITdoGJibT/WhmlILU+8OkyPuIyzn
   nCOvofU3X8tGKVpcXR35ovlNXUH18K9SX/GmoibaKrpGAsoiZgOwPrsi7
   O3wuGI/vw0SBqLNx3nNWVwnvv9msaMVRJ3airX1aFDaueDCcybFKZN7vb
   w==;
X-CSE-ConnectionGUID: +BW+BBXQTG+agOv6wGvDkw==
X-CSE-MsgGUID: vAZv5xECQRyB2G3l84ityw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="966312"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="966312"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 00:59:26 -0700
X-CSE-ConnectionGUID: hoZs0d5+QciE2bi4b9q94Q==
X-CSE-MsgGUID: U9XMOgEdQzW+9fOTAcdyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2472185"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Oct 2026 00:59:24 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIiHC-00000000LOU-1QNL;
	Mon, 19 Oct 2026 07:59:22 +0000
Date: Mon, 19 Oct 2026 15:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 41/82]
 arch/hexagon/kernel/hexagon_ksyms.c:22:15: error: use of undeclared
 identifier '__vmhwconfig'
Message-ID: <202610191541.iE3po1rx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: ce5a6b702e8c793c721b2431bae81ef249eb17cc [41/82] hexagon: add the hypervisor's hwconfig call to the VM interface
config: hexagon-randconfig-1001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191541.iE3po1rx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191541.iE3po1rx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191541.iE3po1rx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/hexagon/kernel/hexagon_ksyms.c:22:15: error: use of undeclared identifier '__vmhwconfig'
      22 | EXPORT_SYMBOL(__vmhwconfig);
         |               ^~~~~~~~~~~~
   1 error generated.


vim +/__vmhwconfig +22 arch/hexagon/kernel/hexagon_ksyms.c

    13	
    14	/* Additional functions */
    15	EXPORT_SYMBOL(__clear_user_hexagon);
    16	EXPORT_SYMBOL(raw_copy_from_user);
    17	EXPORT_SYMBOL(raw_copy_to_user);
    18	EXPORT_SYMBOL(__vmgetie);
    19	EXPORT_SYMBOL(vmgetie_cached);
    20	EXPORT_SYMBOL(vmsetie_cached);
    21	EXPORT_SYMBOL(__vmyield);
  > 22	EXPORT_SYMBOL(__vmhwconfig);
    23	EXPORT_SYMBOL(memcpy);
    24	EXPORT_SYMBOL(memset);
    25	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
