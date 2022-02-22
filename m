Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5957E
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645515842; x=1677051842;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pNBLq+N1cbUSoyakQQ3hiSs5O/hIcYraNQyGKv9znF8=;
  b=DuFiw2wH+8UfMTq44w/P1+9g2oCfRzLoLJWDtZRl2jq53gNfOe7Yr8Fa
   NDpYHRsh3oeZlCZ3AGrV0JcM57DwSkrfzHKmpYkEDoSuw4HBEGw4vbOOA
   EdBiHmJLcTyMVQobVFF8nICzizxuUm8+SZtrx8314QyJ9Z2q57D+e82LL
   p28yCB5hVHUMO9XqUZ+nnA7tZf4gVytUsvxo7tcz3q3YQvUFK5cqnfFeg
   FCMWylNUfERK3S/vRV31ezBRsyC5ZvCO2NjHjOoQDTXVxCTLh4Qy3zA2w
   miDELoxRB5Vuvks7hoceMuM5RDY9tuaR/J11GJZUltH29IpiyXTgIEd7O
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="338064791"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="338064791"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 23:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="507885880"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2022 23:43:57 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMPq0-0002Uc-Hi; Tue, 22 Feb 2022 07:43:56 +0000
Date: Tue, 22 Feb 2022 15:43:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:x86/wip.ibt 34/39] arch/x86/xen/xen-asm.o: warning:
 objtool: bad .discard.noendbr entry
Message-ID: <202202221525.2v8cxcwx-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt
head:   1436dce5f32d577e8cef693e09f4bb1faa0e2692
commit: d94342a792e1b38f567c728a969ae70ed77dfba0 [34/39] objtool: Read the NOENDBR annotation
config: x86_64-randconfig-a011-20220221 (https://download.01.org/0day-ci/archive/20220222/202202221525.2v8cxcwx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=d94342a792e1b38f567c728a969ae70ed77dfba0
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt
        git checkout d94342a792e1b38f567c728a969ae70ed77dfba0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/xen/xen-asm.o: warning: objtool: bad .discard.noendbr entry

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
