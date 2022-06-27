Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAFB33E4
	for <llvm@lists.linux.dev>; Mon, 27 Jun 2022 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656344071; x=1687880071;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bWgNmCdGNmS6yG0Tb9J/xFHz1TMxgZyhbhqQlY+TbxU=;
  b=Hi7b5DrpRuH0oo1VcOhCjsYQtfZ+R78yNi9CKd0O9MPisXknc+XkZttK
   Z72X6IxHv11ZeIFa6awtRaolO8NnymXjnKaSrBskWT391tFcNX0aNJ/WZ
   k1ubBMvtaZQwr9gCON1pOxjocY7ZB4LRMVLeKIy0MVzPB01zU6rEvWV8L
   b/VEEradm1vosoMGqlAqK/VDvcQwAQ9Ygnh/O4lz5nq1IAh9PKm5rZPw8
   HvVKZzncmp3sCcajZzrpEqZj+6oqbm2yd9mwqG6yUazUGvwzc7p4Plpe/
   mi68p6+KoJ92OY9YH1jKj43+9U2CekwuXkb5od39EK0wvvLUlbsrfyBNX
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282206669"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="282206669"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 08:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="564679045"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2022 08:34:30 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5qkw-0008i5-1U;
	Mon, 27 Jun 2022 15:34:30 +0000
Date: Mon, 27 Jun 2022 23:33:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.15.y 5773/8107] arch/x86/kernel/head64.o:
 warning: objtool: __startup_64() falls through to next function
 startup_64_setup_env()
Message-ID: <202206272327.X6yeZ9sN-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   2c21dc5c2cb635c1b549c0f3eb0ff3d3744be11a
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [5773/8107] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-buildonly-randconfig-r002-20220627 (https://download.01.org/0day-ci/archive/20220627/202206272327.X6yeZ9sN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 016342e319fd31e41cf5ed16a6140a8ea2de74dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=33db9912ff7c491f839c89a08e98f755aa09598f
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout 33db9912ff7c491f839c89a08e98f755aa09598f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls through to next function startup_64_setup_env()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
