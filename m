Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46B33D6
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 22:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650924637; x=1682460637;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2c6vF8DzUnXlgXOf6X4pPMQQpr/GxEa8XUY74pAbRvk=;
  b=UQb33tKjO57mcPqL3chYlEe5KRp3+OeWho7Wf7Rjlh3Z3qEmuK2CPK9X
   s2TFjTiutVc8H7rfRuyVIshkY6kFtnZR5HT70j1pylioVevPQ5i0TWK6r
   zRp8ENN0noB1A0KFkQiWV4yjXojxwDNChjB8dkO362+h/Y05q0inlcaL5
   X/bRossQyrLCPg+EAQcJeO3gx9Ry8gSk1lkWeGMDp32MvmaO07isr1PYO
   I+ENgWc7S8ndV2A7EkvxuWqYt16MDMHHPaLo3WvEAh2EjSbODC11uTDEs
   neVd4rc7XTBtXt0eZ/fam76V1Grz66hc2CxM0xoCSMaj+HzcY5M8pr7OX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245941991"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; 
   d="scan'208";a="245941991"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 15:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; 
   d="scan'208";a="677465943"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Apr 2022 15:10:35 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nj6ug-0002vS-LM;
	Mon, 25 Apr 2022 22:10:34 +0000
Date: Tue, 26 Apr 2022 06:09:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [tip:objtool/core 4/24] vmlinux.o: warning: objtool:
 jffs2_erase_pending_blocks() falls through to next function
 jffs2_free_jeb_node_refs()
Message-ID: <202204260658.57FBByBr-lkp@intel.com>
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
CC: x86@kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
head:   a8e35fece49b16b20de000aab687ca075e4463af
commit: 08feafe8d1958febf3a9733a3d1564d8fc23340e [4/24] objtool: Fix function fallthrough detection for vmlinux
config: x86_64-randconfig-a005-20220425 (https://download.01.org/0day-ci/archive/20220426/202204260658.57FBByBr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=08feafe8d1958febf3a9733a3d1564d8fc23340e
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip objtool/core
        git checkout 08feafe8d1958febf3a9733a3d1564d8fc23340e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: jffs2_erase_pending_blocks() falls through to next function jffs2_free_jeb_node_refs()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
