Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAF329CA;
	Sun, 12 Jan 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736691414; cv=none; b=URJ1PrdpDFVz78MFOt/23gDFjiXVZrlf+HKvFRR1Cun8oijfbBgd4vpvdBLhsXGopuCt0UJKRnXdhpAE4/RYIZFo3DrmBH2jrJv4FLrxGu2OnIYmonntwDsm2kPB3lXj71DFQF4JQTZozbldWUjXaIxVUEVqm8WxZbnIc4krgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736691414; c=relaxed/simple;
	bh=7OvIXCSx/uhcyxO3iWG5R1j75LfIwctAJmxZBjc77kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VwdDLY3Hfo5TjL+hNbJ6YkEsh3eYL1v9jy6rotr3Dzkv8FDpMuspAkleOhncVqK9QAgquIGkre9zVeXwnxV3w2BmgKxbkle4Td9TEO+lIn28TdCqobOhkTVo815GD/vL0/unQgXAhtwPK36CcpzGJh7/F47a/r+42VbcatBgejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+YCc41E; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+YCc41E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736691413; x=1768227413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7OvIXCSx/uhcyxO3iWG5R1j75LfIwctAJmxZBjc77kA=;
  b=g+YCc41Evg4oaHTFA2PsbL6jMuA5vmex2C8sRq8coO1SLZKfOm2gywwZ
   9EXtlt2/FRAbQJqTSKCmdLmfIosiMRd4wQXX2Jl8GB1bkgv0vmONbgpmy
   DrB4WLs9xwH5gc43y5FFvts2Omd1l7YsE27mgbStste7gF120Ib9PWoS+
   B8jj/F2xnMHdJbDoti0n0Gx72co2bgYy11pWmNU9B9OBWOj2gRpIEu2uW
   ly7QUN3OBb1r2GaOlHcGylkOFU4GVltFx3tWHVwkPIcWwcFXHl4rh2vL+
   V82LpjDg7yg7qvfTwnB+84eDpP5OOibXKx1c7y7DGNhMKnw4deJ2+m3uv
   Q==;
X-CSE-ConnectionGUID: nRsSYeX9Tzm1GlFoaqaJ8A==
X-CSE-MsgGUID: 08t29GdvTF+sh0H+d6qBFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36610197"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="36610197"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 06:16:52 -0800
X-CSE-ConnectionGUID: p2XX5WqmS1qxBuNO292lkA==
X-CSE-MsgGUID: SKi9D26ESbKhUmBC5v+FFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="135008722"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2025 06:16:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWylj-000M1P-2e;
	Sun, 12 Jan 2025 14:16:47 +0000
Date: Sun, 12 Jan 2025 22:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Yang <ye.yang@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 77/504] drivers/misc/xlnx_dpu.h:21:9: warning:
 'in_range' macro redefined
Message-ID: <202501122204.HkzAebK7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: ea6276221dc185d33dccff6e834c440e3d9c53dc [77/504] misc: xlnx_dpu: Add Xilinx DPU IP driver for Vivado tool flow
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250112/202501122204.HkzAebK7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501122204.HkzAebK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501122204.HkzAebK7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/xlnx_dpu.c:29:
>> drivers/misc/xlnx_dpu.h:21:9: warning: 'in_range' macro redefined [-Wmacro-redefined]
      21 | #define in_range(b, start, len) (               \
         |         ^
   include/linux/minmax.h:313:9: note: previous definition is here
     313 | #define in_range(val, start, len)                                       \
         |         ^
   1 warning generated.


vim +/in_range +21 drivers/misc/xlnx_dpu.h

    20	
  > 21	#define in_range(b, start, len) (		\
    22	{						\
    23	typeof(b) b_ = (b);				\
    24	typeof(start) start_ = (start);			\
    25	((b_) >= (start_) && (b_) < (start_) + (len));	\
    26	}						\
    27	)
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
