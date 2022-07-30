Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA721FB1
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 02:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659148964; x=1690684964;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yBRtv/zzfhY9pTBHBNCIq7xFIE22PiG7Z7UScMdUC+A=;
  b=ktJc6HfdU9AuvGuUWa/txcos9sKqUoqHfExVhEQKZQ3kAGVcITmlEYY6
   c7657JR8qF2jm0YO2Anxnj71bXNT51+wnXwSdThtR1DWbl89/dOAY+j3I
   LxvwoN2bxLMCGjycLWIyqv8O9WyMdnEjXGX1m4h+0ZG8/G+wDr1RMm81/
   CHoY6u2LtgeMv+3rv2leuW2AqgPX+jpvPtogXYBp54rTn7eWYpUOZDRcX
   uYmcVDHa7F2y4XsNFW9pxFFM/wBC+mnid7CFvFanqizZJhg4JehXcrHl9
   mEJjHRI75Yjn4tJBytXx9ERWvX35s+/90qosvTo4LkCgEHR+pCdC4GtAW
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="375188609"
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="375188609"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 19:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,202,1654585200"; 
   d="scan'208";a="577160128"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Jul 2022 19:42:34 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHcQz-000CIp-30;
	Sat, 30 Jul 2022 02:42:33 +0000
Date: Sat, 30 Jul 2022 10:42:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0xd4):
 relocation R_HEX_B22_PCREL out of range: 2112628 is not in [-2097152,
 2097151]; references __vmnewmap
Message-ID: <202207301009.GMmyG06Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e65c6a46df94c8d76ea1129eb2d4564670c6f214
commit: 6048fdcc5f269c7f31d774c295ce59081b36e6f9 lib/crypto: blake2s: include as built-in
date:   7 months ago
config: hexagon-randconfig-r004-20220729 (https://download.01.org/0day-ci/archive/20220730/202207301009.GMmyG06Q-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6048fdcc5f269c7f31d774c295ce59081b36e6f9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6048fdcc5f269c7f31d774c295ce59081b36e6f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2112628 is not in [-2097152, 2097151]; references __vmnewmap
   >>> defined in arch/hexagon/built-in.a(kernel/vm_ops.o)
--
>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2112500 is not in [-2097152, 2097151]; references __vmsetvec
   >>> defined in arch/hexagon/built-in.a(kernel/vm_ops.o)
--
>> ld.lld: error: arch/hexagon/kernel/head.o:(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2122080 is not in [-2097152, 2097151]; references memset
   >>> defined in arch/hexagon/built-in.a(lib/memset.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
