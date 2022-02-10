Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DE32F22
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644480116; x=1676016116;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Hna673Z3dX9q5Cg2SeJuXY0XMdl4pHS7lC4zGnZXYlE=;
  b=XFZWqvHFaJv226aGXnB3+MV1mqZ8akbBXHakczlKzZTdXVuSPKiSeRHZ
   7nNUwBUUIWtm1gQcsjUWt725+8/UVFz/X6clb2Nl/4PCMhEwIQB7RrA4R
   x8wsdxijEyxoBuwVhL+lY8SR9z72dokpMIQzDAoTnX008NZr2oPCJFOUd
   0h16sPs589DMPhCdE5zfMx4Yp3snuG5UQU593YtT7q4nUG2aHFbLmjweA
   PFKYCbwz3g/L02W2Nbb3W1daFirbgNAfD9PA5H+euM4ZhYgXM4EEqmqrK
   +y140VjP+vpZPJmw8j0SZ1Mnzw+YqCaox+l05siCPZFOhKQC2x78iRs34
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249189303"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="249189303"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 00:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="633578403"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Feb 2022 00:01:33 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nI4OS-0002ux-JP; Thu, 10 Feb 2022 08:01:32 +0000
Date: Thu, 10 Feb 2022 16:00:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: drivers/acpi/platform_profile.o: warning: objtool:
 platform_profile_show()+0xdb: unreachable instruction
Message-ID: <202202101500.A2YFc7ud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Mark Pearson <markpearson@lenovo.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: a2ff95e018f1d2bc816f3078d5110a655e355f18 ACPI: platform: Add platform profile support
date:   1 year, 1 month ago
config: x86_64-buildonly-randconfig-r002-20220207 (https://download.01.org/0day-ci/archive/20220210/202202101500.A2YFc7ud-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2ff95e018f1d2bc816f3078d5110a655e355f18
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a2ff95e018f1d2bc816f3078d5110a655e355f18
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/acpi/platform_profile.o: warning: objtool: platform_profile_show()+0xdb: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
