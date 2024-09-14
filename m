Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9211B18AE4;
	Sat, 14 Sep 2024 05:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726290764; cv=none; b=QtnMdtG+HTXcRCxGe/ORnjoNuDDLQk6Eg4kToU7ybaQYU0oOgsdymk4jevP+W6vey8UnnvdI+VAImGJtle6Vll05fsulH42IRaPilaejHiWlhFbvPT1Xp4wIjom/tN5R7a/Dd6XSoMbIDUppecK7Ro4N9bAVDX4E8PNGaz2Lpgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726290764; c=relaxed/simple;
	bh=Gm7T30IdPKEj5DoxDU1p2d6UyGb9hLDnyn5Pd7UJujA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLGmWq/BirBLaVTsDzrwT+Ajeqik77R/c5FluKV9YH2++y6YQlknzHJAHFm/4youm6ibCqa+wv/QTRuqSY0GKtz4hcF53vmCsI7C/YNaV2tL3aKivQRV89wj0PQQuF10wSnJ0p+Awb7ZszCS4KlJQCLi31cCzMm7SrcbHq9XMVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9B3dSH/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9B3dSH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726290763; x=1757826763;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Gm7T30IdPKEj5DoxDU1p2d6UyGb9hLDnyn5Pd7UJujA=;
  b=f9B3dSH/spJhVwrQeN4sYLJ65UGdL4BaL/uIm3zcHQ4oLonX+hnPCXRH
   9f8iwULYzMvtENeH/Eyxb1+uJkrgZ2tXvBE8onSAmW8RKGtWTfbnYm2hP
   3m7/2b1ychiu5+ANR/MMJyoS0Lp0E/3y1Xl1fXzNrulMgPLJhIo0IAudS
   Oq/UWComeEKkeYcJir553PCzkhcTk7SN/xbmVldrc0deydsYQm+xQvbo9
   7Hj97c14YsLNZI3OEBsIFUHThfrIZwarVk8gCnSVJE3xO1uPAHw9BukCX
   KHvh6BImC+2z2YpbzvtnCzhSa0wqkrIrsTy49fTa0VI3N/qQqqKzhhe+p
   Q==;
X-CSE-ConnectionGUID: 8G05ceqvSzCoSzVRiiEbqQ==
X-CSE-MsgGUID: cUC/GWN3SdmBVMQGvmL36A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35874419"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="35874419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 22:12:42 -0700
X-CSE-ConnectionGUID: +yA8joF6SnG2rs5GNN2vZQ==
X-CSE-MsgGUID: ymWZJHdjRLuLPiwzRxVhDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="73322578"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Sep 2024 22:12:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spL5K-0007Ot-30;
	Sat, 14 Sep 2024 05:12:38 +0000
Date: Sat, 14 Sep 2024 13:12:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android12-5.4 130/30000] clang: error: unsupported
 option '-mhard-float' for target 'x86_64-linux'
Message-ID: <202409141317.vNXD5lS1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   c8a568fb88e9a968e38609f91b0d3d1172551054
commit: 6f0e552d0f4018b3731866fd18f32c1295175a91 [130/30000] ANDROID: x86, build: allow LTO_CLANG and THINLTO to be selected
config: x86_64-buildonly-randconfig-003-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141317.vNXD5lS1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141317.vNXD5lS1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141317.vNXD5lS1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unsupported option '-mhard-float' for target 'x86_64-linux'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
