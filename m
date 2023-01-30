Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D86AA3;
	Mon, 30 Jan 2023 18:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675102876; x=1706638876;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nj/QF0lxsXCYbQWMsk0UNeaG7f4OkugXuOJNPpnBXXk=;
  b=X9P/LsVKO0O1B2QFc3naWAb8PFDOUGiEqXhCvfCYRDh7mPtp0khPd9ME
   tdsB6XprLlZTS3Pvk5XlxRqe4py0o3N64DmTUipnTIKOZwkV0UcS2rowX
   sVu+Xt0wNZaOxifoiIAa4xpL1DIFhgasKP/haMo4aO5LC51BqqMoxY78W
   M2kpL/+C6xkl5RVC2nJfjFx1hTmMvari1KM7GgLfe4LllXXSmYw/dIMlP
   P9odlsUyRl53Y4mjJ/yvvxfyr2xreYNKqi5GKXKs+6YL/gOINOp5QjVqA
   pfOAvhbZaMV9sXvvfbUaPn15UgVU1tsFVu/s4cTuW3XbLGkMnZMUtcxRI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="354954732"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="354954732"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 10:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="727586293"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="727586293"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2023 10:21:15 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMYmI-0003oQ-2h;
	Mon, 30 Jan 2023 18:21:14 +0000
Date: Tue, 31 Jan 2023 02:20:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.4.y 5553/7257] arch/x86/entry/entry_64.o:
 warning: objtool: .entry.text+0x191: unsupported intra-function call
Message-ID: <202301310202.zifHW9qF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
head:   be75898dcb2bd9d267366ff03a32bf77e15cbb4f
commit: 03a575a0f954450b1a89554d15bd64b5d9e861ac [5553/7257] x86/speculation: Fix RSB filling with CONFIG_RETPOLINE=n
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230131/202301310202.zifHW9qF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=03a575a0f954450b1a89554d15bd64b5d9e861ac
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.4.y
        git checkout 03a575a0f954450b1a89554d15bd64b5d9e861ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x191: unsupported intra-function call

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
