Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1C2609C5;
	Mon, 24 Aug 2026 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569412; cv=none; b=CwY/Zctmbm+oBzQWseQzL6iW8aofOjFUFTDHI1qCSwahD5UZtOdIX/sy5vhqJ3P3GBoZ0l0xCRhP/RFjDfLShzWEL8Eh9tgXPXNBLS7hd7EldZmKGajOvCOvSIbCVBuJYseanBkpobcn/tAKCTFBwQ+qOscU8Hwefl/tqvUk3ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569412; c=relaxed/simple;
	bh=PPt9D2hoW7NFOPRRry3yhN/5JgwgKOc0sYU/AhT4/yE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YD9QRLQmQ56XrOsZRGaPjzwhSJPbSPRDVh0Q1XvbXO8RFclFbcFP5dwQtAqc8XYVbH9srmATDXw8jXR6PCl4G0Z3sQ54MGwZ46YHKcqrcSQJfPYxh4AJ/1+iUVFw8LG+ZPUeGsf+c3DCO5o2ngMH24AQlrRw3+yTigvp1bXwYQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxwaFLdT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxwaFLdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787569411; x=1819105411;
  h=date:from:to:cc:subject:message-id;
  bh=PPt9D2hoW7NFOPRRry3yhN/5JgwgKOc0sYU/AhT4/yE=;
  b=SxwaFLdTujttNfcBESJGcnXEvVq+3WnWxqUyVI4g1IeCp/QLYG4Robj/
   VjYW8yqsIr+mHNGjEIE4AzLT6mAHBuwBwoLOIwBBWXPB/fYfqLkVCs/GH
   HaEchPXNwDQZ/UbZWutUONJk8y8yi1LkNPHS05pTuMNFJ3B/Hzi/1KIFw
   11Hu/19KH6qMzwdAjGG2OVq95kGR3DQHxA2U8p1VjhSovA0CIM5zI6XyR
   8sYVcl/KD58w7dwjLI5lT1kAth+/Cqnpat2K3PssP46ECEgknx3bhQ7Kq
   qcmNQmwO3yO7HUoVzcu5MMI1NIpo8dUW07/cu+m0MqwXQBwYIaV2qwCki
   w==;
X-CSE-ConnectionGUID: OJzHPK1uQCmktZDOorhv1A==
X-CSE-MsgGUID: bwHy7t5bQfyqjxb5M0w8zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91888017"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91888017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 04:03:30 -0700
X-CSE-ConnectionGUID: nnpETxeZQvSd6SEsaVTZLQ==
X-CSE-MsgGUID: yV1VcKDjQ8K5fKk3R/v4ww==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Aug 2026 04:03:27 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wySRz-000000002qJ-42Lc;
	Mon, 24 Aug 2026 11:02:49 +0000
Date: Mon, 24 Aug 2026 19:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 20/87] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by
 'arch/hexagon/boot/dts/comet.dtb.S'.
Message-ID: <202608241819.6cASWt03-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Richard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   844bcfb5bee7bf0e713f61307dc2a4e16963c2f9
commit: abe97c987224d2686550fd938cd15c284c1132c3 [20/87] hexagon: update build system and Kconfig
config: hexagon-randconfig-002-20260824 (https://download.01.org/0day-ci/archive/20260824/202608241819.6cASWt03-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608241819.6cASWt03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608241819.6cASWt03-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/comet.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
