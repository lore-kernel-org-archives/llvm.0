Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8317936E
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 00:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653266907; x=1684802907;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2a36AeeVuL56Cl4+um1jXlIMeDlBn3e52MClgfsCRWI=;
  b=WVsl5UfKk8mct2d0IHRbOGkXpg3YnO5wLS/RJ8bII1zWDm5ULPkD22i5
   lfiEF5sdbhMzU44I1jNGZKOq/pdO+Kr0jeM6IXIr5EXkv0b/kh/qCXCwk
   V0xltZHhbmZQHZQGDlk+zRbWCT22rD6sAEMPKb26y5mxHaBmGktYg61Zh
   m+Zgt5Ixhk4aKFCkvVwoYueuswZZQQKt9o7Fmz2lOPXsQeKQ9T4ToyU37
   fURSG5dOQBVu7Hp/rIRWoVyLpg6/1bsGSSyVYkA5gpGPDG4YWHcTB8+KB
   504Jpl2cGUN0rLdFsZSNBWvwICclayZuszNVZwAraQcH61YqiKVtFgyyA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="255126221"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; 
   d="scan'208";a="255126221"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 17:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; 
   d="scan'208";a="744436841"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 May 2022 17:48:26 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nswFF-0000kn-Dh;
	Mon, 23 May 2022 00:48:25 +0000
Date: Mon, 23 May 2022 08:48:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: fs/cifs/export.o: warning: objtool: gelf_update_symshndx: invalid
 section index
Message-ID: <202205230808.tEXGMtxM-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4b0986a3613c92f4ec1bdc7f60ec66fea135991f
commit: 4abff6d48dbcea8200c7ea35ba70c242d128ebf3 objtool: Fix code relocs vs weak symbols
date:   4 weeks ago
config: x86_64-randconfig-a014-20220523 (https://download.01.org/0day-ci/archive/20220523/202205230808.tEXGMtxM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443dbaba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4abff6d48dbcea8200c7ea35ba70c242d128ebf3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4abff6d48dbcea8200c7ea35ba70c242d128ebf3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ drivers/acpi/ drivers/gpu/ fs/ ipc// kernel// lib// mm// security//

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/cifs/export.o: warning: objtool: no non-local symbols !?
>> fs/cifs/export.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> arch/x86/kernel/trace.o: warning: objtool: no non-local symbols !?
>> arch/x86/kernel/trace.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/acpi/x86/s2idle.o: warning: objtool: no non-local symbols !?
>> drivers/acpi/x86/s2idle.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/acpi/acpica/utdebug.o: warning: objtool: no non-local symbols !?
>> drivers/acpi/acpica/utdebug.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/acpi/acpica/dsdebug.o: warning: objtool: no non-local symbols !?
>> drivers/acpi/acpica/dsdebug.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/acpi/acpica/utresdecode.o: warning: objtool: no non-local symbols !?
>> drivers/acpi/acpica/utresdecode.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/acpi/acpica/exdump.o: warning: objtool: no non-local symbols !?
>> drivers/acpi/acpica/exdump.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/acpi/acpica/nsdump.o: warning: objtool: no non-local symbols !?
>> drivers/acpi/acpica/nsdump.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/acpi/acpica/rsdumpinfo.o: warning: objtool: no non-local symbols !?
>> drivers/acpi/acpica/rsdumpinfo.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/gpu/drm/drm_kms_helper_common.o: warning: objtool: no non-local symbols !?
>> drivers/gpu/drm/drm_kms_helper_common.o: warning: objtool: gelf_update_symshndx: invalid section index
--
>> drivers/gpu/drm/drm_panel_orientation_quirks.o: warning: objtool: no non-local symbols !?
>> drivers/gpu/drm/drm_panel_orientation_quirks.o: warning: objtool: gelf_update_symshndx: invalid section index
..

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
