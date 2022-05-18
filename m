Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15997F
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 01:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652837178; x=1684373178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=btAYkgP8GzkIVEbMXLhNHT+VECT4HbGrU0+88SpiL0E=;
  b=eQyPN7LCMfQgDB00+QKoQ1r8j3GlI6J+CBEACZuNnDqUuDQB4s7L8oPc
   5eHGUQYRJW/A8bdfh1s4hY1k0tQuyW2HRI3loJvtKTg6jFE4eTKOrGs9K
   NLlIgNdCZFaLEvN5EF+mnjsTAKm3LIg3cm13jTekH8QHMNjA+DuXL6Gcb
   71mOIwT5d4rjoZIOz4QgUC+hr4Se89gb0sEeh1NhyOzgD+DO4xAbjhlqC
   H6t8WTPRJiRbc/Sluu2zt9fDb0JRy5NjsUtyXjuOOqMMujfDXh8QxGCRU
   iMX2e9w4I5IKqxxH/Vs0GMmA/Mv+QnjlotPoU5zffDCExBqAir22Knrdd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="296704693"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="296704693"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 18:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="673143149"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2022 18:26:15 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nr8S1-0001dO-Q8;
	Wed, 18 May 2022 01:26:09 +0000
Date: Wed, 18 May 2022 09:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Ard@google.com,
	Biesheuvel@google.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v3 4/4] ARM: pass -march= only to compiler
Message-ID: <202205180917.RNpZaxIl-lkp@intel.com>
References: <20220516210954.1660716-5-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516210954.1660716-5-ndesaulniers@google.com>

Hi Nick,

I love your patch! Yet something to improve:

[auto build test ERROR on 0ac824f379fba2c2b17b75fd5ada69cd68c66348]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Desaulniers/pass-march-only-to-compiler/20220517-051756
base:   0ac824f379fba2c2b17b75fd5ada69cd68c66348
config: arm-randconfig-r026-20220516 (https://download.01.org/0day-ci/archive/20220518/202205180917.RNpZaxIl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/6da98100eed87e4316be5ec584fe415134f25a3e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nick-Desaulniers/pass-march-only-to-compiler/20220517-051756
        git checkout 6da98100eed87e4316be5ec584fe415134f25a3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/crypto/poly1305-core.S:16:1: error: target does not support ARM mode
   .code 32
   ^

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
