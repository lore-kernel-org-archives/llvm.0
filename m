Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F65677;
	Sun, 26 Feb 2023 20:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677443227; x=1708979227;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Evt3wy18pYZP5TFd6zlulVYqJy7saBtoOF4+VzRWukM=;
  b=PYC71yiiABZZH6bsZjMhphtYXtTjlsIBPZZaGHvONP3BqMmo81Q69OGe
   Shooc7nFMo8T2yMZGaQebaaimhKh3muFW58uYoGIf+Gf4HIzPEMYPPVnP
   z+H+AP/sYYfJgMUhD+bnkPtMMy8Lk67g365ja1n1qxYzR5/9K4QCETftk
   WdL7SHfQnmlX7vMbG/JozTKdDBi3Inlm4U28KAzEgEUE9XWMVhI+AJcng
   RzNlhpCZr7bGFY/mMjfDS1eFMxHi70UmuB2QBQzOEwV46F4BE+IEG2bBW
   2ubRwQLUd2estK2PBYNl+YXARUZxvLmi1TZCSpuG0kmnLoutsqJRkGn9f
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="332465064"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="332465064"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 12:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="919053966"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="919053966"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Feb 2023 12:27:06 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWNbt-0003sR-1Y;
	Sun, 26 Feb 2023 20:27:05 +0000
Date: Mon, 27 Feb 2023 04:26:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 3758/9999] drivers/md/bcache/sysfs.o: warning:
 objtool: bch_cache_show() falls through to next function bch_cache_store()
Message-ID: <202302270417.6ZBJPqn1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Tadeusz Struk <tadeusz.struk@linaro.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   22d269bb30db7f5a4e71a8a813a0f4df5255f7de
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [3758/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-a005-20230227 (https://download.01.org/0day-ci/archive/20230227/202302270417.6ZBJPqn1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=58823a9b097cf36dd59c4d463396e15a5ec4efb7
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 58823a9b097cf36dd59c4d463396e15a5ec4efb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270417.6ZBJPqn1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/bcache/sysfs.o: warning: objtool: bch_cache_show() falls through to next function bch_cache_store()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
