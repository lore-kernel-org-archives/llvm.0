Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C62515A3
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660013440; x=1691549440;
  h=date:from:cc:subject:message-id:mime-version;
  bh=udswlx0xnqpSclmQNpBVoEw2ZP80GTCumLnlMiJVBl4=;
  b=lEC2QyWSLfO7W5K3ntuEzIwKYvBzj6Ffj1EM6L3vp2kjQZd94ZLjzQ6x
   /U741phbsEw/ZioRtgaJUC0F41yn4E0MLjqZpafCGxppTZAa372cB16jB
   BkimaUqevPY/uTAQI079/k/dtRekMembXqxeOf+uuM2G94C8vdGCMZMnw
   lr1eV/5N8VOYNFYk8dBoC6u3sipnCZtLbypwNcvX09crm7jo3yFfRddjF
   mwzriZQB7TzuHij9PbwSjQrvEDi7eCAc/AdIzSQYiS7trmxoh7CCrbmA8
   0JdUGAi463iCYdHrGGz3FOb/yOFtwOTaf5H8SbxB0ggXGgVNtUDYW77Fm
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="270514054"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="270514054"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 19:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; 
   d="scan'208";a="730980075"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Aug 2022 19:50:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLFKI-000Mfr-00;
	Tue, 09 Aug 2022 02:50:38 +0000
Date: Tue, 9 Aug 2022 10:50:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.10.y 5204/7421] drivers/tty/mxser.o:
 warning: objtool: mxser_change_speed() falls through to next function
 mxser_stoprx()
Message-ID: <202208091043.4E7McSEt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Tadeusz Struk <tadeusz.struk@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   4fd9cb57a3f5e611efde7772643134385de3a5a6
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [5204/7421] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-a015-20220808 (https://download.01.org/0day-ci/archive/20220809/202208091043.4E7McSEt-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=58823a9b097cf36dd59c4d463396e15a5ec4efb7
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout 58823a9b097cf36dd59c4d463396e15a5ec4efb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/tty/mxser.o: warning: objtool: mxser_change_speed() falls through to next function mxser_stoprx()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
