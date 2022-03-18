Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F305115
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647628673; x=1679164673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DhhdJGjd4r9GQBkrHmE+4nHlFwq/k81vexNmL4L2f6c=;
  b=NznD8DQfpw9MTEJiI3v7h/ziqkvsB1YzqFKltMF/vIGBxzvI/hcLWr3W
   00GXrbMef08/invG914xlVfGdxYpsUs5Yak3QpFiJ1BnStnzWh0LDlG7U
   7Tz8HrKO4+0eLFnY1qWAv1sGaSPq7HcMbnI9X+8Ptr0EBROQOdL7xGJ45
   6BdlZofB8xKXFi0p92lNJCKCpMft23M7Mf+9kRajnSP+XQx/XpniIxnqH
   SwL2tDHiAR8GyVJXrCG8u7YqE3avAKg0NehTUSq3HgcUOHpNFruX0lblA
   FYXZmfNjmreNEhGgshuDS0Os+udXiu0+YPLp7bi/KeDo0BZOoVUUfuAMi
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="239360576"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="239360576"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 11:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="599609129"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2022 11:37:46 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVHTt-000F3Q-UR; Fri, 18 Mar 2022 18:37:45 +0000
Date: Sat, 19 Mar 2022 02:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fu <wefu@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Liu Shaohua <liush@allwinnertech.com>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [ammarfaizi2-block:palmer/linux/riscv-d1-merge 17/20]
 arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time
 absolute expression
Message-ID: <202203190244.24G89cJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/riscv-d1-merge
head:   93a6d3583d613a2ff1c6d28060c78af8631e0d21
commit: de8950b38c5be22611acbba781e7f0d298bc292b [17/20] riscv: add RISC-V Svpbmt extension support
config: riscv-randconfig-r042-20220318 (https://download.01.org/0day-ci/archive/20220319/202203190244.24G89cJ9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/de8950b38c5be22611acbba781e7f0d298bc292b
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/riscv-d1-merge
        git checkout de8950b38c5be22611acbba781e7f0d298bc292b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/msm/ drivers/iio/adc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/iio/adc/men_z188_adc.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:111:
>> arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_IO);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:88:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:25:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   In file included from drivers/iio/adc/men_z188_adc.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:111:
>> arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_IO);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:89:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (889b - 888b) + (887b - 886b)\n"                    \
            ^
   <inline asm>:26:6: note: instantiated into assembly here
   .org    . - (889b - 888b) + (887b - 886b)
           ^
   In file included from drivers/iio/adc/men_z188_adc.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:111:
>> arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_IO);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:88:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:25:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   In file included from drivers/iio/adc/men_z188_adc.c:12:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:15:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/riscv/include/asm/pgtable.h:111:
>> arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_IO);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:89:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (889b - 888b) + (887b - 886b)\n"                    \
            ^
   <inline asm>:26:6: note: instantiated into assembly here
   .org    . - (889b - 888b) + (887b - 886b)
           ^
   4 errors generated.
--
>> <inline asm>:25:6: error: expected assembly-time absolute expression
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   <inline asm>:26:6: error: expected assembly-time absolute expression
   .org    . - (889b - 888b) + (887b - 886b)
           ^
   In file included from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:9:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:26:
   In file included from include/drm/drm_mm.h:51:
   In file included from include/drm/drm_print.h:31:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:111:
   arch/riscv/include/asm/pgtable-64.h:76:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_MTMASK);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:88:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:25:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   In file included from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:9:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:26:
   In file included from include/drm/drm_mm.h:51:
   In file included from include/drm/drm_print.h:31:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:111:
   arch/riscv/include/asm/pgtable-64.h:76:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_MTMASK);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:89:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (889b - 888b) + (887b - 886b)\n"                    \
            ^
   <inline asm>:26:6: note: instantiated into assembly here
   .org    . - (889b - 888b) + (887b - 886b)
           ^
   In file included from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:9:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:26:
   In file included from include/drm/drm_mm.h:51:
   In file included from include/drm/drm_print.h:31:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:111:
>> arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_IO);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:88:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:25:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   In file included from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:9:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:26:
   In file included from include/drm/drm_mm.h:51:
   In file included from include/drm/drm_print.h:31:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:111:
>> arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_IO);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:89:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (889b - 888b) + (887b - 886b)\n"                    \
            ^
   <inline asm>:26:6: note: instantiated into assembly here
   .org    . - (889b - 888b) + (887b - 886b)
           ^
>> <inline asm>:25:6: error: expected assembly-time absolute expression
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   <inline asm>:26:6: error: expected assembly-time absolute expression
   .org    . - (889b - 888b) + (887b - 886b)
           ^
   In file included from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:9:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:26:
   In file included from include/drm/drm_mm.h:51:
   In file included from include/drm/drm_print.h:31:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:111:
   arch/riscv/include/asm/pgtable-64.h:76:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_MTMASK);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:88:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:25:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   In file included from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:9:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:26:
   In file included from include/drm/drm_mm.h:51:
   In file included from include/drm/drm_print.h:31:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:111:
   arch/riscv/include/asm/pgtable-64.h:76:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_MTMASK);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:89:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (889b - 888b) + (887b - 886b)\n"                    \
            ^
   <inline asm>:26:6: note: instantiated into assembly here
   .org    . - (889b - 888b) + (887b - 886b)
           ^
   In file included from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:9:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:26:
   In file included from include/drm/drm_mm.h:51:
   In file included from include/drm/drm_print.h:31:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:111:
>> arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_IO);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:88:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:25:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   In file included from drivers/gpu/drm/msm/adreno/a6xx_gmu.c:9:
   In file included from include/drm/drm_gem.h:40:
   In file included from include/drm/drm_vma_manager.h:26:
   In file included from include/drm/drm_mm.h:51:
   In file included from include/drm/drm_print.h:31:
   In file included from include/linux/seq_file.h:12:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
   In file included from arch/riscv/include/asm/uaccess.h:12:
   In file included from arch/riscv/include/asm/pgtable.h:111:
>> arch/riscv/include/asm/pgtable-64.h:92:2: error: expected assembly-time absolute expression
           ALT_SVPBMT(val, _PAGE_IO);
           ^
   arch/riscv/include/asm/errata_list.h:46:5: note: expanded from macro 'ALT_SVPBMT'
   asm(ALTERNATIVE("li %0, 0\t\nnop", "li %0, %1\t\nslli %0,%0,%2", 0,     \
       ^
   arch/riscv/include/asm/alternative-macros.h:136:2: note: expanded from macro 'ALTERNATIVE'
           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
           ^
   arch/riscv/include/asm/alternative-macros.h:102:2: note: expanded from macro '_ALTERNATIVE_CFG'
           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:89:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (889b - 888b) + (887b - 886b)\n"                    \
            ^
   <inline asm>:26:6: note: instantiated into assembly here
   .org    . - (889b - 888b) + (887b - 886b)
           ^
   12 errors generated.


vim +92 arch/riscv/include/asm/pgtable-64.h

    87	
    88	static inline u64 riscv_page_io(void)
    89	{
    90		u64 val;
    91	
  > 92		ALT_SVPBMT(val, _PAGE_IO);
    93		return val;
    94	}
    95	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
