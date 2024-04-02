Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD412BD1C;
	Tue,  2 Apr 2024 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712044360; cv=none; b=cC1OZUSWWltik7xsKYk4UzWBCtHq7TirPIVAl/yasml5y7hubGthW6HND2u4iP5inS2tQTJGlwx3wT+M1zo2n+z3E6D1qzhzIbe7uBzijp/bQCqNCJnXtrZZX6iPz4iypbj9YbpcdqP2S8Xc/n8XRLSQOI5L8xDdcPdFKBEDEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712044360; c=relaxed/simple;
	bh=9GYk/o1L1Sq5XdS3X2uQ+HwYGDAvh7G6d7J8AZ2nK2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ul519YCpsQhXkV8LLxwwDDXwcQa7lvIxVcoEg29ZJERgL0wT7OuMTYQkhCP/AVE2vxwwe0hXACC48hksV4GgIBX8BklTjbQU+gxqzN6k+K1pnn3/uV84ebxUooUr3iaG43dHbNLBwJAPJzmkEalrv8cJZNT16qNSn0vntMPHids=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBumZXBR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBumZXBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712044359; x=1743580359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9GYk/o1L1Sq5XdS3X2uQ+HwYGDAvh7G6d7J8AZ2nK2k=;
  b=CBumZXBRbnqcX8jnQ+4QGh6CyPTLzmQnS2LRdHoAE8bvAsNFW1l4TpHK
   G5mmFcrn4FW3seFWFjEC7pXvh+ygrHibYdjjhw5gUfIlR4UV8b2vBZpy3
   ubN+SQLfW7/YAHdwKuX4QRivuJu5pmBzy+a/qsfI2DgWGBGKA5MH/xsXC
   PORraYwmlgwRpOZXf0APpveLsijZLTec/clAjLPyw/yY/BwhFKHw5i4WN
   wz6AZ8Ib+M+3OV4+5YMW7L2EWLe2a31kZx8Ne11IWSYxIagLYd1l828el
   CmZJ3sGBCPppygjfWM8yQjxCMyOVaBzDBLMPH59rCLdOn2IS5nCoJ6EXj
   g==;
X-CSE-ConnectionGUID: C3t8V2adRXm25nHd+wO0Xw==
X-CSE-MsgGUID: z+TQy6K2QqCJQL7TS5rR0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="11016304"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="11016304"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 00:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18002833"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Apr 2024 00:52:36 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrYwc-00011J-0A;
	Tue, 02 Apr 2024 07:52:34 +0000
Date: Tue, 2 Apr 2024 15:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [linux-next:master 2055/3220] ld.lld: error: undefined symbol:
 __drm_atomic_helper_private_obj_duplicate_state
Message-ID: <202404021556.0JVcNC13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
commit: d674858ff979550a0e97b4ac766f2640f0d9d7e7 [2055/3220] drm/display: Make all helpers visible and switch to depends on
config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20240402/202404021556.0JVcNC13-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021556.0JVcNC13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021556.0JVcNC13-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __drm_atomic_helper_private_obj_duplicate_state
   >>> referenced by drm_dp_mst_topology.c:5088 (drivers/gpu/drm/display/drm_dp_mst_topology.c:5088)
   >>>               drivers/gpu/drm/display/drm_dp_mst_topology.o:(drm_dp_mst_duplicate_state) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_kms_helper_hotplug_event
   >>> referenced by drm_dp_mst_topology.c:2692 (drivers/gpu/drm/display/drm_dp_mst_topology.c:2692)
   >>>               drivers/gpu/drm/display/drm_dp_mst_topology.o:(drm_dp_mst_link_probe_work) in archive vmlinux.a
   >>> referenced by drm_dp_mst_topology.c:5074 (drivers/gpu/drm/display/drm_dp_mst_topology.c:5074)
   >>>               drivers/gpu/drm/display/drm_dp_mst_topology.o:(drm_dp_delayed_destroy_work) in archive vmlinux.a
   >>> referenced by drm_dp_mst_topology.c:4033 (drivers/gpu/drm/display/drm_dp_mst_topology.c:4033)
   >>>               drivers/gpu/drm/display/drm_dp_mst_topology.o:(drm_dp_mst_up_req_work) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
