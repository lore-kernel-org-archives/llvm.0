Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4B6AD8
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645654923; x=1677190923;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Y0ULTfkhad/nQeKXA04T3Tx1dd52Rg2fikNnBCk51Yg=;
  b=VbowFMcuX9JyloMcaVDJ+gqryp7suxUZotno3pKos8nT3Ss3Bai8atHt
   TSU+Q7/b6iiZx8sHTMEwpR2E5PKir13u99rAzSK51m29ATtC0IP+amiom
   Mq1KgrnRuR8iLhAnj+H8LfjnBUOpebCWs7xq4lljD6zvibRvEZR7zJOiM
   IJ6faMszdRuh9sPn3sS8AdBlSvYfEgr9KbiFFLvvkoGx+n4kIkSET/IYL
   g3vmy42Hn+qEmceDWYXIYnj/NWg9uL+UoAhiJWQ0AbmQ3O/pRCDOH1U8d
   x6c009v7l+1xy022R/CfcXLm6V5AbXtcPlE/HGOJ7TCLci2hwNJaEuRSC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="312808898"
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="312808898"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 14:21:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="506090542"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Feb 2022 14:21:50 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN018-0001tP-0R; Wed, 23 Feb 2022 22:21:50 +0000
Date: Thu, 24 Feb 2022 06:20:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4467/7526] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xd04):
 relocation R_RISCV_PCREL_HI20 out of range: -524409 is not in [-524288,
 524287]; references kallsyms_offsets
Message-ID: <202202240636.szzbhplB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@google.com>
CC: Gary Guo <gary@garyguo.net>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Matthew Wilcox <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   196d330d7fb1e7cc0d85641c89ce4602cb36f12e
commit: ae45d5d7dc111be61c577f072fed2d3d55db7112 [4467/7526] kallsyms: support "big" kernel symbols
config: riscv-randconfig-r022-20220223 (https://download.01.org/0day-ci/archive/20220224/202202240636.szzbhplB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ae45d5d7dc111be61c577f072fed2d3d55db7112
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ae45d5d7dc111be61c577f072fed2d3d55db7112
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xd04): relocation R_RISCV_PCREL_HI20 out of range: -524409 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
