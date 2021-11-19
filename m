Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48B52C82
	for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 08:33:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221597889"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; 
   d="scan'208";a="221597889"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 00:33:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; 
   d="scan'208";a="455696549"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 00:33:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1mnzKy-008TWF-RR;
	Fri, 19 Nov 2021 10:33:36 +0200
Date: Fri, 19 Nov 2021 10:33:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [pinctrl-intel:review-andy 18/19]
 drivers/pinctrl/pinctrl-zynqmp.c:825:13: warning: variable 'pin' is
 uninitialized when used here
Message-ID: <YZdhYEVCgqh5MB3J@smile.fi.intel.com>
References: <202111191618.SSj1gGvK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202111191618.SSj1gGvK-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 19, 2021 at 04:08:32PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git review-andy
> head:   c25441ca551164c56b34885df3d657e2ea4d623f
> commit: 9122cda6a325f80564f02b7899cc063009f5e1f9 [18/19] pinctrl: zynqmp: Unify pin naming
> config: arm64-buildonly-randconfig-r004-20211118 (attached as .config)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/commit/?id=9122cda6a325f80564f02b7899cc063009f5e1f9
>         git remote add pinctrl-intel https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
>         git fetch --no-tags pinctrl-intel review-andy
>         git checkout 9122cda6a325f80564f02b7899cc063009f5e1f9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/pinctrl/pinctrl-zynqmp.c:825:13: warning: variable 'pin' is uninitialized when used here [-Wuninitialized]
>            if (IS_ERR(pin->name))
>                       ^~~
>    drivers/pinctrl/pinctrl-zynqmp.c:811:37: note: initialize the variable 'pin' to silence this warning
>            struct pinctrl_pin_desc *pins, *pin;
>                                               ^
>                                                = NULL
>    1 warning generated.

Utterly inappropriate suggestion by the compiler (it found an actual error,
though).

Can be Clang fixed, really?

-- 
With Best Regards,
Andy Shevchenko


