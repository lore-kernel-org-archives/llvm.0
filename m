Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357497E
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 00:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649203785; x=1680739785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cu9LFP1qebym8kf9nc0GqBQdxX6vpo1JJg9iLpIztAM=;
  b=iJmp9p1knj0SW7yGUqsayuNDmicVV10+8BnQC4gwhlJQEpmoMSPd3EC8
   9GNMhlyfM9LgGeaY2QLbO9mRXGnad3XEKwZJ4qwDNrWGeS1N1yHoqwrf1
   AVE+WQcjBQ6Ahf3leDgnOefsJKrzV9q6oyoIVib9k1TQCe1H5oVbVR49N
   rk5qJ/3w9nveUGa7F6U9VgHe1wZYZhLL5N1iMWv+7OFIGIFJhhgrbp4hK
   ws66c8b3mc568WKhwhyXLKYwMuL+SCb7uU/I/opvvcN9raMD/JZ7D8mZD
   dBKY3ySlG3Azav5pkD0lAolLEOIby4LyXE0QgKlzQXMJr3EZLUz/be3WE
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="240833755"
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="240833755"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 17:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="588148922"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Apr 2022 17:09:42 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbtEz-0003tt-Er;
	Wed, 06 Apr 2022 00:09:41 +0000
Date: Wed, 6 Apr 2022 08:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Kees Cook <keescook@chromium.org>
Subject: ld.lld: error: kernel/built-in.a(kallsyms.o):(function
 lookup_symbol_name: .text+0x7dc): relocation R_RISCV_PCREL_HI20 out of
 range: -524489 is not in [-524288, 524287]; references kallsyms_names
Message-ID: <202204060800.J5dy8mkW-lkp@intel.com>
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
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 606b102876e3741851dfb09d53f3ee57f650a52c drm: fb_helper: fix CONFIG_FB dependency
date:   6 months ago
config: riscv-randconfig-r042-20220405 (https://download.01.org/0day-ci/archive/20220406/202204060800.J5dy8mkW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=606b102876e3741851dfb09d53f3ee57f650a52c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 606b102876e3741851dfb09d53f3ee57f650a52c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x7dc): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x840): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x848): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_attrs: .text+0x9bc): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
