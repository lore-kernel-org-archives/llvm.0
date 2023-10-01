Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7D18E;
	Sun,  1 Oct 2023 00:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696118887; x=1727654887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3PXI17An+e0kxHW7sxlHzj9blKu1QRTw0lZ0OM6YzI=;
  b=TvM+R2jgKQc4NTDkSCWy/zkJRcRUnGp2tUKdkCUBuL2H+lof6Flhu7Hs
   buf9UKoakSfUGUW1UZovPy9GUW9z7DYVJSF7YjG9w+fPb5GMvZd3ohZX2
   PYvEeAhYISaS692UzJRSFOc11x3o7MsYfPOQEB+ANTyosAH/CPVF2sSOZ
   F9JJuM2YAQqFL35AVtnnyjnb1pEEMg9TMDWsL+hG/GYOXN+dpbvmsI5/l
   hjXxnV/49yhT/2jOD8Y0995R1/kRP+qKjw5xJV5Jx5zstT4NWp0HIeGz6
   QVWso+2nsPQ+LqjLu3iAz6pJ8PsaAL25ITuvXfV37M9YGa1yk8+LISJXR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="382389755"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="382389755"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 17:08:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="726913306"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="726913306"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Sep 2023 17:08:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmk07-0004b1-2e;
	Sun, 01 Oct 2023 00:07:59 +0000
Date: Sun, 1 Oct 2023 08:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-unionfs@vger.kernel.org
Subject: [mszeredi-vfs:statmount-v3 4/4] <stdin>:1576:2: warning: syscall
 listmount not implemented
Message-ID: <202310010835.jn5IpgV5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git statmount-v3
head:   5321994510f383b43dd2d49fcbdaedcf8cba1306
commit: 5321994510f383b43dd2d49fcbdaedcf8cba1306 [4/4] add listmount(2) syscall
config: mips-ath25_defconfig (https://download.01.org/0day-ci/archive/20231001/202310010835.jn5IpgV5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310010835.jn5IpgV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310010835.jn5IpgV5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1573:2: warning: syscall statmount not implemented [-W#warnings]
    1573 | #warning syscall statmount not implemented
         |  ^
>> <stdin>:1576:2: warning: syscall listmount not implemented [-W#warnings]
    1576 | #warning syscall listmount not implemented
         |  ^
   2 warnings generated.
--
   <stdin>:1573:2: warning: syscall statmount not implemented [-W#warnings]
    1573 | #warning syscall statmount not implemented
         |  ^
>> <stdin>:1576:2: warning: syscall listmount not implemented [-W#warnings]
    1576 | #warning syscall listmount not implemented
         |  ^
   2 warnings generated.
--
   <stdin>:1573:2: warning: syscall statmount not implemented [-W#warnings]
    1573 | #warning syscall statmount not implemented
         |  ^
>> <stdin>:1576:2: warning: syscall listmount not implemented [-W#warnings]
    1576 | #warning syscall listmount not implemented
         |  ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
