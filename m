Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D40E1876;
	Sun, 12 Feb 2023 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676203345; x=1707739345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M8x1mTnkHkWE6Qa8vwe5cMNKsKeVJZHNehyMJyET5VE=;
  b=dUKdqiaYWG8zqwyRbdNbkPJmJRU/hKAJIkfBk+yQ1LqlO5brxbnuLX2S
   MRVdvAT65j8l1lREAIteCZ+LQnL/MjmxU696t4wvTEiv/j8Kv6/Kyjh1/
   VF+C9m9VzZXkTeJlXmljLWzzZRQNapFdKWJRtin5xXpG+tVr5PWyJoF3U
   o3+VwmV9R/9+3PloC8drMDkF9t63PQDRElXpDUejvjYyi4SlmOCOJFwxt
   zZnZxYmSbbdgTYCGhJiueXaYfepTMnkMeSPv/P5K5lMH0gaetUBYT7aaB
   X2NQpyM6T4te96JCxhKt2Wem6fIonBukRyCKAqASlrXLPd1JVR7Nsr+FB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="314352668"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="314352668"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 04:02:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="646104196"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="646104196"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 12 Feb 2023 04:02:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pRB3l-005qtE-0v;
	Sun, 12 Feb 2023 14:02:21 +0200
Date: Sun, 12 Feb 2023 14:02:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [linux-next:master 7942/12152]
 arch/arm/mach-pxa/balloon3.c:26:10: fatal error:
 'linux/platform_data/pcf857x.h' file not found
Message-ID: <Y+jVTeDdREp1WMuE@smile.fi.intel.com>
References: <202302111818.Oiz9M6EM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302111818.Oiz9M6EM-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Feb 11, 2023 at 07:01:54PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6ba8a227fd19d19779005fb66ad7562608e1df83
> commit: 91a0192e90e9df40d4b63c4ce11126114ed5d79d [7942/12152] gpio: pcf857x: Get rid of legacy platform data
> config: arm-randconfig-r034-20230210 (https://download.01.org/0day-ci/archive/20230211/202302111818.Oiz9M6EM-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=91a0192e90e9df40d4b63c4ce11126114ed5d79d
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 91a0192e90e9df40d4b63c4ce11126114ed5d79d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302111818.Oiz9M6EM-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 6ba8a227fd19d19779005fb66ad7562608e1df83 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/arm/mach-pxa/balloon3.c:26:10: fatal error: 'linux/platform_data/pcf857x.h' file not found
>    #include <linux/platform_data/pcf857x.h>
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.

Another tree removes the entire balloon3 support.

I think the best if that tree either provides an immutable branch, or be merged
before the GPIO.

See d6df7df7ae5a ("ARM: pxa: remove unused board files").

-- 
With Best Regards,
Andy Shevchenko


