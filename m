Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AFC15A2
	for <llvm@lists.linux.dev>; Fri, 22 Jul 2022 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658473107; x=1690009107;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tKaLEaooULO43gFUHljFOmDkhT/RIk51Jk4zGo0SrDA=;
  b=XcUESqkX7FeF9XYCpshPoRARR7R9qdtc0FDpXq1Gru8G125IYw0Q59zP
   j9s5+XtvLmXserwRqNRlIgxcQvlQ484yK1bSsJMjSKylAjlM9eLqYhhA/
   aJdyWRixxYX2Y83kZCEbDevp5auLSvvdX+nx6XNk3268ArIjJZYSSXH+S
   B48IKkBLGp6uHIey5ejgGDSnFTsGHEBNjDHNdYcZ2HjBWWrkpXz1ka8bf
   EnEGf4J+UiZ+pj5gaMdcbAQil2/szEYnE7pCtR6abArYivk4IthkyabhL
   ZxCVozDO/HbAYfWnSbBD/D8WSIc8zWggAJTYp5bQjesNy0m+MiDOoEmYT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="312974198"
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="312974198"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 23:58:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="666577084"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2022 23:58:25 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oEmcC-00016E-2b;
	Fri, 22 Jul 2022 06:58:24 +0000
Date: Fri, 22 Jul 2022 14:58:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: arch/x86/crypto/crc32c-intel.o: warning: objtool: crc_pcl+0x7c:
 missing int3 after indirect jump
Message-ID: <202207221419.Vgemh2ZB-lkp@intel.com>
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

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   68e77ffbfd06ae3ef8f2abf1c3b971383c866983
commit: c25e1c55822f9b3b53ccbf88b85644317a525752 kbuild: do not create *.prelink.o for Clang LTO or IBT
date:   8 weeks ago
config: x86_64-randconfig-r001-20220718 (https://download.01.org/0day-ci/archive/20220722/202207221419.Vgemh2ZB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d68c137551cce816416190a18d45b4d4e2a)
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


objdump-func vmlinux.o crc_pcl:

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
