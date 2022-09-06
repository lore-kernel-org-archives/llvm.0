Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9228173
	for <llvm@lists.linux.dev>; Tue,  6 Sep 2022 01:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662427507; x=1693963507;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3S23CWFq0LP3ju1sk+5zoHDdPduMud4mkouQ48Z0tS8=;
  b=A5XF/rx7H3GnteZNzgJp71Fdhknkcff1U64T4yPoxiblWMJtPagTd3yY
   v0ApMnP9ouPo664OmTkDAjpe9ASchlkq/hVD8QByWJ2ACDJ/TPI3sWY6s
   lYsAcbwrOudeODowGYV3DeV+wbxitrfHDOqL2OMrGjJ77J4Lg7cRB14Z8
   yN+iiWuGMNgwtM334NXZgwCSgdz5PO86i5D8j8SsOtKUW8R5OVyhj8usS
   zzn2/1kp2oFL41hlShSgtHOMM/nACGjxadRhPTyNK0AUgFLXGX+53FOPJ
   aOwHvtVw2f6at6fOrwwJ4+YmU/Tx0MvCV8hGl2NsuSBUFkVCmLPTfOpuZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="297786823"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="297786823"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 18:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="647051922"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2022 18:25:05 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oVNKq-0004hy-39;
	Tue, 06 Sep 2022 01:25:04 +0000
Date: Tue, 6 Sep 2022 09:24:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 5501/9999] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x4b8):
 relocation R_RISCV_PCREL_HI20 out of range: -524411 is not in [-524288,
 524287]; references kallsyms_token_index
Message-ID: <202209060934.RJBGE4AA-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   633c3b4c71bb949de771388de213d331c1ebd270
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [5501/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: riscv-buildonly-randconfig-r001-20220905 (https://download.01.org/0day-ci/archive/20220906/202209060934.RJBGE4AA-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=33db9912ff7c491f839c89a08e98f755aa09598f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 33db9912ff7c491f839c89a08e98f755aa09598f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x4b8): relocation R_RISCV_PCREL_HI20 out of range: -524411 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x4c0): relocation R_RISCV_PCREL_HI20 out of range: -524411 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_attrs: .text+0x5aa): relocation R_RISCV_PCREL_HI20 out of range: -524411 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
