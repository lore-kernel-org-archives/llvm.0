Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406115AE;
	Sun,  1 Oct 2023 12:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696164029; x=1727700029;
  h=date:from:cc:subject:message-id:mime-version;
  bh=w1oyWGF2X1k7tfm5oeD5bJinY9KGx1IzeyuYmZZyH4M=;
  b=OLsCElY4swWZz4IBEqqguApPFhHRnqkNFcX2ILFGICANsqGLJCZCVwHn
   6n9EQ1qlIwboqgGO7EbAYUA8lATyr+3ZQJ7dBDXvWoxv2b+ZM1UQCFwYF
   v7QBjVFD1OqvQs7qg6sopyI7z0INEUViIJ9UXqvVHl7gyhIUznNf0FZG8
   WV6eB/Le8DIZzPV6i3w5ucUSlSQBuXdKygfLeQRcS8J+4iO5IQjGKU3DI
   +xyrvdWv6KT/qLb5/OAjPBIp3JDasuUXuWNOk9gFMyz+dVq/az1nYDTXW
   4zbH2eixE4sK8UjLVIBl3DTA/VH2OTmTYe6jgi1SvZeaoe7AFPnBFUO7W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="381402283"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="381402283"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 05:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="866231762"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="866231762"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2023 05:40:27 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmvkG-00052n-22;
	Sun, 01 Oct 2023 12:40:24 +0000
Date: Sun, 1 Oct 2023 20:40:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2377144 is not in [-2097152, 2097151];
 references __vmnewmap
Message-ID: <202310012042.jafpp4kR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e402b08634b398e9feb94902c7adcf05bb8ba47d
commit: 3216484550610470013b7ce1c9ed272da0a74589 kbuild: use obj-y instead extra-y for objects placed at the head
date:   12 months ago
config: hexagon-randconfig-r005-20221010 (https://download.01.org/0day-ci/archive/20231001/202310012042.jafpp4kR-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310012042.jafpp4kR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310012042.jafpp4kR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2377144 is not in [-2097152, 2097151]; references __vmnewmap
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2377016 is not in [-2097152, 2097151]; references __vmsetvec
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2390800 is not in [-2097152, 2097151]; references memset
   >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
