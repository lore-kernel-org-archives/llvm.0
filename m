Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B523E0C7F;
	Wed, 18 Mar 2026 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846369; cv=none; b=Qvdk9/2GNC3JzoAnm+8FDX0HafxFs4SikkTEqucoZNnzQBAdsQm6Z5FSBP6r1ikAXKJHZnTgdcVkjk6n5MpkSgCx6Xn3ngz0IRGnGjawxEgMoOMkY1XmAurHDFCLZkeITNv3D4S5k7JL1Av5T51TSMItvVu+9MzDGl/de0q8a+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846369; c=relaxed/simple;
	bh=Y2MeDVxXAd2BGHAxjOz+lUJGLwov7Gsrm1eCtZPtgnE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sqnc6OaRSU9ig6R60/QXZcRlVvfXFrFbQNpr/qFcJ2H7F8gCMHPlEFOxjiBez2zEmGdiSHG426iAplKr0uIPJIr0OAzxRXTDTetVmGC0f/DQPZKKibOqpE7pEmV6uN02qvQBVb6xTN6zWp9JXZGLL389otdHcNtvKfVgFPGNBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLezBpMf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLezBpMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773846368; x=1805382368;
  h=date:from:to:cc:subject:message-id;
  bh=Y2MeDVxXAd2BGHAxjOz+lUJGLwov7Gsrm1eCtZPtgnE=;
  b=nLezBpMf45+w0WpbxX2Jl5JgT9f0Thi4Gzg5Y0zThMv/8bf22paJtTEX
   oT3h2Zfz0V4dFu1l+HPqHSiKIFznDptxc/Pe9njZbX4/xdCBofSRkTKb5
   wZjrPRNvPQiEJB+gtqVhlJdCo5DfK78reXR7nRCBNT2adApxtjLEZvWy5
   ACLjO4ZSsoUc7QmHNdrLk7G+D3eOxttWAGbNrSiVnwUAVPqTEJf4p4DIF
   MifKG0obhyGGcccqaGfe5p/MH/RZdpQhDV3yVQvMZMDf47EKtj6Atj8R2
   jj/BxFOakWwwkSg3r6veOjuSwP2XFMlCMhEtpYTF1Ht2zZyGuPOpl6Jv4
   Q==;
X-CSE-ConnectionGUID: r/yJWCNSQB60iuXMif3OoA==
X-CSE-MsgGUID: L06Wzh6FTJSNOLnzdfUMHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="100361386"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="100361386"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 08:06:06 -0700
X-CSE-ConnectionGUID: hsX3rtUpRA6u6k84ocqRfA==
X-CSE-MsgGUID: lphsOJUSRE+ln4LWXflkgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="219684346"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Mar 2026 08:06:04 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2sTC-0000000031x-0tRD;
	Wed, 18 Mar 2026 15:06:02 +0000
Date: Wed, 18 Mar 2026 23:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Johannes Berg <johannes.berg@intel.com>
Subject: [iwlwifi-next:nan_mac80211_phase2 19/57] ERROR: modpost:
 "__hexagon_umoddi3" [drivers/net/wireless/virtual/mac80211_hwsim.ko]
 undefined!
Message-ID: <202603182308.XZ0gSm8u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan_mac80211_phase2
head:   2d6c6fa9647943d4c8ff3d8a6f82c00ea1edd2f4
commit: a7e7568d2380a7711f52acac0b7572e2c2dbf679 [19/57] wifi: mac80211_hwsim: register beacon timer by calculating TBTT
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603182308.XZ0gSm8u-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182308.XZ0gSm8u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182308.XZ0gSm8u-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_umoddi3" [drivers/net/wireless/virtual/mac80211_hwsim.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
