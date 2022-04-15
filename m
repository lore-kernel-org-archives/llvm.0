Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F2019F
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 03:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649993299; x=1681529299;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5h8BdX49sNVFSXfwHDcNz/gqL8X9zkoCzEYawZmKD2g=;
  b=Xp50V60+pyFXxJWbZro9/eDQCmTYY2x0divOFWH5eBCmhCrEZDinnZwr
   pPQfoeS2NQutr3/2RCsTBGI/QltbBfTFnUIJqMIBCrK9B3dLdTvF9L0WE
   4MaCnb0+EQ4vLXVOC3RxtLfc4tGWBxePJBW5g5yBArMy509aV7OlvZqSQ
   7w3MCnNKNptHMTg0tNkLFu+LIkGdDn4eDqqy6v3mm0CtuS/zE8yjrxq8A
   RZva1ZovM8Ox4ml8yy37GZn8G7gwK/qbE7Jhbvh4g++GX5/q9CzkQQ5Dr
   qINIW0R7o/fo7Y/GqfuRC0F3qZdOrdfmghnfMHTn2fcH3iqm3ZvRcST5b
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323528704"
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; 
   d="scan'208";a="323528704"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 20:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; 
   d="scan'208";a="803366805"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 20:28:17 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfCd6-0001Tz-Tv;
	Fri, 15 Apr 2022 03:28:16 +0000
Date: Fri, 15 Apr 2022 11:27:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jpoimboe:objtool-run 14/29] vmlinux.o: warning: objtool:
 do_syscall_64()+0x1a: .noinstr.text+0x1a: call to static_key_count() leaves
 .noinstr.text section
Message-ID: <202204151123.1XH0Rak6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-run
head:   47d3f4f7a72524799c1f646713e2377e3c4e239f
commit: f27083b059ff86b9c4c7a64c7afa46fd9249b6c3 [14/29] objtool: Add sec+offset to warnings
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220415/202204151123.1XH0Rak6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=f27083b059ff86b9c4c7a64c7afa46fd9249b6c3
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-run
        git checkout f27083b059ff86b9c4c7a64c7afa46fd9249b6c3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64()+0x1a: .noinstr.text+0x1a: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: do_int80_syscall_32()+0x27: .noinstr.text+0xbc: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x29: .noinstr.text+0x1ca: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: fixup_bad_iret()+0x21: .noinstr.text+0xbdf: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: in_task_stack()+0xc: .noinstr.text+0x12ec: call to task_stack_page() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: in_entry_stack()+0x9: .noinstr.text+0x1331: call to cpu_entry_stack() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: enter_from_user_mode()+0x2e: .noinstr.text+0x2003: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x36: .noinstr.text+0x2170: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x2e: .noinstr.text+0x244f: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exit_to_user_mode()+0x26: .noinstr.text+0x25b4: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_exit_to_user_mode()+0xde: .noinstr.text+0x26da: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x2e: .noinstr.text+0x28c0: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_exit_to_user_mode()+0x2d: .noinstr.text+0x2a24: call to __kcsan_check_access() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
