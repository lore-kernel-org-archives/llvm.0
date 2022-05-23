Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733F7C
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 11:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653303958; x=1684839958;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0VuP0rOABF04xG2+eFPFHzkApRfMbQHws1J3NPkYwR0=;
  b=blYB8T+PVj7OydKs3XP6z2V+cYzF+h3XBxFKiH84ava7q5jAA5lU8NG9
   enUUoOUJALd2IKuDYKbNAV2HYsj6Nf05ZrIrldXuU4dnI9tVKwPukeEdr
   suTI/httI/GfG60t58jl09GqSPCl0GjlcX8+k7xdV941nsWYpo45Cy+2F
   SQS6PfMRhOYpcGjxZvZMH/v6aUa/CayK1XzuPxbzfasiDoLSwv0VbUYxx
   CcaxTcnAxyH+g5yS8FnmT51fEvc9aymTI20rCWglZfgFU8zc7Wn+ixcuu
   B8dZTGc4Ls1HyP4QGEY3sSEdtgmdSilUGS1tQAUykvebGA4KSdcSloepW
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="272002570"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="272002570"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 04:05:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="744678782"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 May 2022 04:05:55 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nt5so-00016a-R2;
	Mon, 23 May 2022 11:05:54 +0000
Date: Mon, 23 May 2022 19:05:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.10.y 5204/5689]
 fs/ocfs2/cluster/heartbeat.o: warning: objtool: o2hb_setup_one_bio() falls
 through to next function o2hb_wait_on_io()
Message-ID: <202205231905.lloh0lRc-lkp@intel.com>
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
TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Tadeusz Struk <tadeusz.struk@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   7686a5c2a8d398196259b1bf3fa369a4fd6bcd6f
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [5204/5689] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-a013-20220523 (https://download.01.org/0day-ci/archive/20220523/202205231905.lloh0lRc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 768a1ca5eccb678947f4155e38a5f5744dcefb56)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=58823a9b097cf36dd59c4d463396e15a5ec4efb7
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout 58823a9b097cf36dd59c4d463396e15a5ec4efb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/ocfs2/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/ocfs2/cluster/heartbeat.o: warning: objtool: o2hb_setup_one_bio() falls through to next function o2hb_wait_on_io()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
