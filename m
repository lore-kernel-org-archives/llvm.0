Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ADA4691
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 05:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655183836; x=1686719836;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kxXjm9VH5WvesmQxCQgyqiweyo7V/j4MAXjtkYA1UUA=;
  b=OGhOGoPO9hOrfKQnCchJVBwcrDQzcUorX4fwXfPVuio1BJ2KEwqtpCcS
   +mgBtxxtpe68IcoWmFjnXtGOOn5OKzt2ywC3/uhoIv6I9GttP5ORjnq3R
   sdnuXv5FIh+7mAue/kk57I0ePHgnHUxVFCGL5lmkQiUqQ+odvQ9MSrX8R
   DprxWG9jKErXPXMz7sErB6iOZzMCKL7IXdXahHop06b+5nyvdRwcQbGbZ
   fxBnWajUQgubY7OLvhuHO+KffYQyk7y76HkiVm4qgse7SJyysjUvGQch9
   j0uTiqEvvvUGUYyVJs27bvwOtsj7J29Jjmr3rFXRQKFo4cYQCC26PhE7+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277284978"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="277284978"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 22:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="830195636"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2022 22:17:14 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0yvS-000LVd-6e;
	Tue, 14 Jun 2022 05:17:14 +0000
Date: Tue, 14 Jun 2022 13:16:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: arch/x86/crypto/crc32c-intel.o: warning: objtool: crc_pcl+0x7c:
 missing int3 after indirect jump
Message-ID: <202206141358.kBph0dW4-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>
CC: Sami Tolvanen <samitolvanen@google.com>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: c25e1c55822f9b3b53ccbf88b85644317a525752 kbuild: do not create *.prelink.o for Clang LTO or IBT
date:   2 weeks ago
config: x86_64-randconfig-r005-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141358.kBph0dW4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c25e1c55822f9b3b53ccbf88b85644317a525752
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c25e1c55822f9b3b53ccbf88b85644317a525752
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/crc32c-intel.o: warning: objtool: crc_pcl+0x7c: missing int3 after indirect jump

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
