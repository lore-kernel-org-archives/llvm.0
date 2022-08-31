Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065A64C
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661928780; x=1693464780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18kO/PexrqlieiG1gwkrVuZZrV9IdV+EuhOhfubb5X0=;
  b=QmA2BdqsyAAiV5b90smsjKqnmtf00e+VGN39MJICPJA54baLYuL16S+b
   a+V5TIyci1w4ODWJEI9iIwQtxisCMeUZ9IA05Geih3/jfAge+B0R26K8m
   5L/a809Kjc10fVpllV6x1raKeSGHTq+cFzvnwZ9EV4O6s3aRVF7QdY9MZ
   5xa8TIrReQMRylMHMmwZxsHjoC2KgzQPjSbIqkt+c7tj0DFEbSx0UiMdH
   kzNabyeZ/UhEC9qzg/iF7L54nAJXp1DtZ6wkQT3jf5YHqF5r00Ze3XsOZ
   Hz1yAY0Ed9zLryVId9MEucBBCjWRhQgb7TyhBFWhe45TJiKpkqFj2kmzu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="359346454"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="359346454"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 23:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="562940505"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 23:52:57 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTHaq-00003K-2C;
	Wed, 31 Aug 2022 06:52:56 +0000
Date: Wed, 31 Aug 2022 14:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: powerpc-linux-objdump: Warning: Unrecognized form: 0x23
Message-ID: <202208311414.4OPuYS9K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBUG_INFO selectable from a choice
date:   5 months ago
config: powerpc-buildonly-randconfig-r003-20220830 (https://download.01.org/0day-ci/archive/20220831/202208311414.4OPuYS9K-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f9b3cd24578401e7a392974b3353277286e49cee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f9b3cd24578401e7a392974b3353277286e49cee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
>> powerpc-linux-objdump: Warning: DIE at offset 0x382c refers to abbreviation number 2753 which does not exist
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
>> powerpc-linux-objdump: Warning: DIE at offset 0x382c refers to abbreviation number 2753 which does not exist
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
>> powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x23
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
   powerpc-linux-objdump: Warning: Unrecognized form: 0x22
..

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
