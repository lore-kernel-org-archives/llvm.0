Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E91D19CC28;
	Sun, 18 Jan 2026 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768727179; cv=none; b=D4igFTMARw0LQdG4s9TnFLHZRbSQtB3nt2jtKDzCKJ8MiAJ/zbsToeRJ3yo8k5GBbza4fAZ/inYgQM3WkDtNU4R5NyS2Dky3J0JFV0mR6uGDBPyIZN75sJ40C7+757549bqJwtD33v4Qa3MlipbFWfnhjI+wUx/wGTm918WdIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768727179; c=relaxed/simple;
	bh=SE0HEsBf5x4DW8bhX7pUa+V9htGk1ZNmhCu6za32VOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GoFTPcPyMaRgRS0d5uPaR5+KYEO06YOfJU0K69KPxc+Ka8g7aU8t5+9Nw+FoZF/LjLQinV9Nxq0YJUIVpMzYv/7skPKCdJAYjg0ZbRe5YBm93UmzjkfiwDg5GSS6SuLYciBzvse8LE71wy4fMva5tL83fr15DOWPUV961oCThvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5GhxgS0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5GhxgS0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768727177; x=1800263177;
  h=date:from:to:cc:subject:message-id;
  bh=SE0HEsBf5x4DW8bhX7pUa+V9htGk1ZNmhCu6za32VOA=;
  b=B5GhxgS0/fbSdKxpUcIVykdUrXmG5Ig6GWs0t6QLYZIx1UHxP9OBYYqc
   DtMoQJq+B/z0eHS0pGCLpRM0lTZu+avk1EKzc9yR9ZKZjBm41n+ZDXcVW
   Tb3pHtRyfvyYYN1sUIdyz0Pg8da6iGPxhiZqROpk3JDel9wYFdxCGGh1W
   e0MkD6dE3i8g7hSkLGjiM1jTDDRQgAD8YvUQo6JEBqD40VX3f7uv7f/UU
   lE5r1RD6ZxZpBzit4RSfxkQl0rHu4KVhjlCD9Ip1SgRlHwL3s/zIH3DUv
   /cEsk4Gv8JjWpSv2f1Q7INu5Kl3qZ8dVeGLFvzMIDi8+b4KNj//+iY5hG
   w==;
X-CSE-ConnectionGUID: h73qes4DQr2NqIilMSO0Mg==
X-CSE-MsgGUID: Wd+0dXDoTjKjAoSNdkQUuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="68982921"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="68982921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 01:06:16 -0800
X-CSE-ConnectionGUID: gpFMPvIRTjSzjiTDdcL26A==
X-CSE-MsgGUID: 8IZyu3BTQBecsPmL9atVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="205402198"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jan 2026 01:06:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhOjb-00000000Mpo-14U3;
	Sun, 18 Jan 2026 09:06:11 +0000
Date: Sun, 18 Jan 2026 17:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri 17/20]
 include/linux/riscv_qos.h:10:10: fatal error: 'asm/qos.h' file not found
Message-ID: <202601181655.1SqxqcQY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   b34c2f7cb87d02f5b712e9e35ac9b66d21ce07e9
commit: 06bff4d3050a3b1c23ebe8412e5f9730deddf83d [17/20] [NFU] resctrl: riscv: build CBQRI drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260118/202601181655.1SqxqcQY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601181655.1SqxqcQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601181655.1SqxqcQY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/resctrl/riscv/cbqri_cache.c:6:
>> include/linux/riscv_qos.h:10:10: fatal error: 'asm/qos.h' file not found
      10 | #include <asm/qos.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +10 include/linux/riscv_qos.h

279a516c8a1314 Drew Fustini 2023-04-19   9  
279a516c8a1314 Drew Fustini 2023-04-19 @10  #include <asm/qos.h>
279a516c8a1314 Drew Fustini 2023-04-19  11  

:::::: The code at line 10 was first introduced by commit
:::::: 279a516c8a131464cc73327ecfb2c6a62ad33622 RISC-V: QoS: define properties of CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
