Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE76420ED;
	Sat, 27 Apr 2024 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714253576; cv=none; b=seUIFdl5a679QUhcja+KLd4bZqhZuOkxWA6khxACwRTfyHRohY8XIuArg8CmV0+IyiP5XCzaZI/A764Nyz/tcDSzg1xzy04vtSBLssateZoWFukCt3SUWkO95fgVWnG6h1QW+benuWF20BObotHsb8oQ5dF/j66xwGZ6ujFjDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714253576; c=relaxed/simple;
	bh=ooWsVrTopxFZ4g+w62KkVkMEXwpqD0g3LI9/X0kYTA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftNwu9CXQE0DAi9Hlk+GBNVkdYN0hz+E0eMSjDCU3ggZJxjSuz4X++h7WL6vxdIgz8qMbERNv/D60yrH+ko1TPdu5DJT05qoqVGqHWJnWCuTK+2CcNAZ1WY66CHtmxK4998GBrBNCJMg3SS0ELs9HTwgiSmbxgn5kybo1CMy70g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoUV495N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoUV495N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714253575; x=1745789575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ooWsVrTopxFZ4g+w62KkVkMEXwpqD0g3LI9/X0kYTA0=;
  b=aoUV495NRySskYFvzI+e0/2qZKWTmdlsckX64FzkmLtraB0/mrs/mijQ
   EPDyYaKQWZ0kmQ4/e+DUO96/C3mlmhCFh+LncUkuKV1A48aXa2Sb22vJv
   K7Sxj1Wvw+WdGPBCvXsy9ulTSA1iXhfiX45FA0VQy9gdcmuRLW5hPMrNk
   toFkUnnvmKLHqwKOwbc8oF6LCjsOkJeeBBXNyRjjNC4TGQXtumWsTGbbH
   5tnlNlkp8N14FqUji6flppBR6e27e29602QdSZjMLrwvC+h8Ar3LnZGj+
   RPQBX1Wm1+sJH4tY83ZpIqJ5aB6WXrZto1eVU5VW2u68YbRGWSo7pwSBJ
   g==;
X-CSE-ConnectionGUID: yUDWACCzRPC4ejyNPTPPeQ==
X-CSE-MsgGUID: ccFcoNbwQXKwpBqSn6X6AQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32462708"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="32462708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 14:32:55 -0700
X-CSE-ConnectionGUID: tyeCrormThyD3BTDQ2KOqg==
X-CSE-MsgGUID: 7fQSBSCNTlOuTcfDewn4VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="26153141"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Apr 2024 14:32:53 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0pf8-0005W6-1q;
	Sat, 27 Apr 2024 21:32:50 +0000
Date: Sun, 28 Apr 2024 05:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <min.li.xe@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 984/991]
 ./usr/include/linux/rsmu.h:88:2: error: unknown type name 'bool'
Message-ID: <202404280531.2M4qVMdW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   08ceadacc1da15a77045dee6654f9cd906906271
commit: 7d3c0f27dc86aab8e1ddd1683691633e72f28174 [984/991] misc: rsmu: add rsmu cdev driver
config: i386-buildonly-randconfig-003-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280531.2M4qVMdW-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280531.2M4qVMdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280531.2M4qVMdW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/rsmu.h:88:2: error: unknown type name 'bool'
      88 |         bool continuous;
         |         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
