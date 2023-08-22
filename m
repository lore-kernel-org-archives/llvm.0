Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C310E9;
	Tue, 22 Aug 2023 01:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692667916; x=1724203916;
  h=date:from:cc:subject:message-id:mime-version;
  bh=H/XNoSCtiKZX6Pz2bANjphDw8WpYsfUD8qJIqv71OH8=;
  b=XBOeskaTyoh/I+2eiQ9+3t9eGyCpEyiDqe/Qfb5B42dCycwYtRAwQ+tX
   ipvrM3CNcC3QSk3gaMyaEbFEmCKFFQ17MgPuRr+c+k0Sf5lQRl46w7sca
   8q7dbHV9sAsp0zevHzIDFaa8GFheQ7/M0TlsF3gRQ99A9NB4fzvXB/yus
   FO1E8WuVphIk5I1OJkodre4elkTaC8qx42hRSks9Xcqph+jRExDzI/B8i
   z8ZHulus/9mlvOE70b3crxmseWaXBbJpH8Ku6vZLCnOK02pazjKLsO2Bb
   S0PYOsWOdXEIwwv+6syGvmSg9ksM8zdfP/MtSRknxQSeTcOS9qaLkZToj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371173213"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="371173213"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 18:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850399016"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="850399016"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2023 18:31:54 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYGFK-0001A0-05;
	Tue, 22 Aug 2023 01:31:51 +0000
Date: Tue, 22 Aug 2023 09:30:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2378396 is not in [-2097152, 2097151];
 references '__vmnewmap'
Message-ID: <202308220917.7Q5GRR2Z-lkp@intel.com>
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
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 3216484550610470013b7ce1c9ed272da0a74589 kbuild: use obj-y instead extra-y for objects placed at the head
date:   11 months ago
config: hexagon-randconfig-r002-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220917.7Q5GRR2Z-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220917.7Q5GRR2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220917.7Q5GRR2Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2378396 is not in [-2097152, 2097151]; references '__vmnewmap'
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2378268 is not in [-2097152, 2097151]; references '__vmsetvec'
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2389872 is not in [-2097152, 2097151]; references 'memset'
   >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
