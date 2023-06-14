Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586464F;
	Wed, 14 Jun 2023 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686746699; x=1718282699;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PiePoCIaXvtRmnZ1pAalqQm1y2zuagog+ikvCPgwhVw=;
  b=ar19Wb10A1VlGRFuEUGG/uTHWppr04yN207Gkrvd4Uoll9gDR274mKNe
   O3FKXNu8tSm09zmuMD79DlD/SsyHsbUZoG4/FYLb7VnLfhyz4rYe2Tm/c
   Pge3jea9DKLwyL5ntE5TpTueU61XCuli/SBCUHtTekbLoIsXYU6J3u+G9
   Jhr9eu50KJJs3HT8iXC0IOw9ntwZod1dgK37BmEp/7Hh43fhmP5rJxVmY
   4xMBWI5VKB/VrswAX64YvWf2ZQCyumkbJDAeV8H4oqYsw54w5jGo3jVX6
   W/1yOHlgefe7VEPal6rQhfL235ZHUToc47iyLBabtiMZJsavbLksh9zg0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387008659"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="387008659"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 05:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="782072211"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="782072211"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2023 05:44:56 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9Prs-0000e1-0e;
	Wed, 14 Jun 2023 12:44:56 +0000
Date: Wed, 14 Jun 2023 20:43:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 2171/9793] net/netfilter/ipvs/ip_vs_proto.o:
 warning: objtool: .init.text: unexpected end of section
Message-ID: <202306142017.23VmBLmG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b16049b21162bb649cdd8519642a35972b7910fe
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b [2171/9793] fortify: strcat: Move definition to use fortified strlcat()
config: x86_64-randconfig-a005-20230614 (https://download.01.org/0day-ci/archive/20230614/202306142017.23VmBLmG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=55c84a5cf2c72a821719823ef2ebef01b119025b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 55c84a5cf2c72a821719823ef2ebef01b119025b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/netfilter/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306142017.23VmBLmG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_proto.o: warning: objtool: .init.text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
