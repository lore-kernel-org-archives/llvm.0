Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B79436D
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 00:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652488289; x=1684024289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ZbrGrP7cxNMuGCiRcEz9C5bHEQF1KFXcDuzuJA6vYk=;
  b=mOyJDNXirwFghXD+g8ltW/q5CWFeJ1Ejob8ivVpeuVtvZ5VS0++FrVfx
   xiscLeHz/UvWdDBvCwPPC7BWz+8F8FU7QuFZM5gymM/1mc0hETrDdgf+a
   mlHy7fW7lJ08Tp/PfIIBNTs+dSmlEjl8E9E1+dBjOaCsyN4xfgi/qJVSu
   wsRX44DQucGGRK1J8FD4sACGKPMgD+6SKZCpHbWrM7MrRGDW585zRoHsg
   fmfwL93c3ZIsBA3t4B49TaHoEGnC8L+AKXoAomk0vVRjIP2mAIOeqTDtL
   e5MlFCE5CYHQLfaApP+2ynmN62Sl/uFXB6wYclGD/cNnTZUT5YH3tkncP
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="333479188"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="333479188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 17:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="604048939"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 May 2022 17:31:26 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npfgr-000MFY-Sf;
	Sat, 14 May 2022 00:31:25 +0000
Date: Sat, 14 May 2022 08:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: copy scripts/atomic/atomic-*.h to
 include/generated/atomic-*.h
Message-ID: <202205140803.I96fumS7-lkp@intel.com>
References: <20220513185340.239753-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513185340.239753-1-masahiroy@kernel.org>

Hi Masahiro,

I love your patch! Yet something to improve:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on linux/master linus/master v5.18-rc6 next-20220513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/kbuild-copy-scripts-atomic-atomic-h-to-include-generated-atomic-h/20220514-025623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220514/202205140803.I96fumS7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3f6dd60121830fdd3733dd804d9ae163d88acc98
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahiro-Yamada/kbuild-copy-scripts-atomic-atomic-h-to-include-generated-atomic-h/20220514-025623
        git checkout 3f6dd60121830fdd3733dd804d9ae163d88acc98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:13:
   In file included from include/linux/uuid.h:12:
   In file included from include/linux/string.h:20:
   In file included from arch/x86/include/asm/string.h:5:
   In file included from arch/x86/include/asm/string_64.h:6:
   In file included from include/linux/jump_label.h:256:
   In file included from include/linux/atomic.h:80:
>> include/linux/atomic/atomic-arch-fallback.h:2:10: fatal error: 'generated/atomic-arch-fallback.h' file not found
   #include <generated/atomic-arch-fallback.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1194: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +2 include/linux/atomic/atomic-arch-fallback.h

   > 2	#include <generated/atomic-arch-fallback.h>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
