Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596F15A8
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658499830; x=1690035830;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZLYviFbTBq6a6/qm0bONWBPhlbZ/9ejtZ+v1bvKeZVw=;
  b=JggCvwpZckJbo0U55UV5HQ1sKzjocMaKh37Qz9FCe5QOcqf2l5qfkGEY
   izMwpBWhMZ+VyN4qhpCPQJW97KtOrP0hxQi0IASy7yBolOfQKCBhsGuXV
   aRJmOEcfBFv3AzAocPIyURM8nf0jVIi1aRKqxIceGkm2gx/4l1v5iNQ4g
   7ySn1GXgqOI24h4k6n2HoRVJCJCAdLnhqNQxQtwcjsVKxs1KgXOQtudn/
   Vcn2ncMF7awd38Ypo9fX5jvl87mSYqOMC59MUxAT8lOoUn4g9Bn1Xnq38
   8XxlluGWsJZSBhzNjHkB1YqugnaWcXBrCOUYXDMY76UEqGRoY3XTd81kf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="287325364"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="287325364"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 07:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="741066104"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Jul 2022 07:23:48 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oEtZE-0001Vm-0x;
	Fri, 22 Jul 2022 14:23:48 +0000
Date: Fri, 22 Jul 2022 22:23:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: entry_SYSCALL_compat+0x0:
 ANNOTATE_NOENDBR on ENDBR
Message-ID: <202207222233.zSktzQrJ-lkp@intel.com>
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
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   68e77ffbfd06ae3ef8f2abf1c3b971383c866983
commit: f43b9876e857c739d407bc56df288b0ebe1a9164 x86/retbleed: Add fine grained Kconfig knobs
date:   3 weeks ago
config: x86_64-randconfig-r001-20220718 (https://download.01.org/0day-ci/archive/20220722/202207222233.zSktzQrJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d68c137551cce816416190a18d45b4d4e2a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f43b9876e857c739d407bc56df288b0ebe1a9164
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f43b9876e857c739d407bc56df288b0ebe1a9164
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: entry_SYSCALL_compat+0x0: ANNOTATE_NOENDBR on ENDBR


objdump-func vmlinux.o entry_SYSCALL_compat:
0000 00000000000023f0 <entry_SYSCALL_compat>:
0000     23f0:	f3 0f 1e fa          	endbr64 
0004     23f4:	0f 01 f8             	swapgs 
0007     23f7:	41 89 e0             	mov    %esp,%r8d
000a     23fa:	eb 12                	jmp    240e <entry_SYSCALL_compat+0x1e>
000c     23fc:	0f 20 dc             	mov    %cr3,%rsp
000f     23ff:	90                   	nop
0010     2400:	90                   	nop
0011     2401:	90                   	nop
0012     2402:	90                   	nop
0013     2403:	90                   	nop
0014     2404:	48 81 e4 ff e7 ff ff 	and    $0xffffffffffffe7ff,%rsp
001b     240b:	0f 22 dc             	mov    %rsp,%cr3
001e     240e:	65 48 8b 24 25 00 00 00 00 	mov    %gs:0x0,%rsp	2413: R_X86_64_32S	cpu_current_top_of_stack

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
