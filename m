Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB27A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646872553; x=1678408553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4c5cbHZGG2HhzXo93CXNIjzewjIojCUGpdScSsBCp3w=;
  b=Yzy0ZvLz/ysAbkddyQgy0jCsJIsd8w9aMm6sMTRgslcZz/hzZLkmo4oM
   KbTYxfowOpfK6tmPq8sKckw3W7qgyFB/kxYJbfua+mxV5qxCl1qkbxqFM
   4/g9TGXpMkCICq+e8VJlYDwad+qIXto/Xc+vRflI/3mq03O9SvSOTlu92
   uVlgEkaCy/18NpJ3zo/2cfZSeWe67Tvt4BW3haLCBb1bto8BFOaGbicnX
   6oJ1C1grePJwdZsf7HZaT3yw0I9DPXql37mIovTg/ssd5bUPUvZSJjtlc
   MWBpDsA82uDcIDi8ARuQB3Y2B1EaA9lht7YMZDi5C4ugYB5/ynV8IzJVb
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235074208"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="235074208"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 16:35:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="513757226"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Mar 2022 16:35:50 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nS6mU-00043Y-5Z; Thu, 10 Mar 2022 00:35:50 +0000
Date: Thu, 10 Mar 2022 08:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: <instantiation>:4:2: error: invalid fixup for movz/movk instruction
Message-ID: <202203100800.57nn24sm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: 558c303c9734af5a813739cd284879227f7297d2 arm64: Mitigate spectre style branch history side channels
date:   13 days ago
config: arm64-randconfig-r013-20220309 (https://download.01.org/0day-ci/archive/20220310/202203100800.57nn24sm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=558c303c9734af5a813739cd284879227f7297d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 558c303c9734af5a813739cd284879227f7297d2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^
>> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
    ^

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
