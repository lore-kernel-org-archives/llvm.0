Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F4B33EC
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 21:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661980776; x=1693516776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nden09wHw+7qvxDuZ4teofu7WMUZp3ya1vYxeeSmh34=;
  b=ST+g2Fcvr35cwtc5ddjv9TXOXoTkVfxp4/A5B/W0x223571WiShL8MI8
   RASZs5hb9A6bBnAezAGiDe6AeUnrMhNjgV7H0eiOxLMz7UKZhjQ5xoNef
   6IUEAm0WS9mTi+yZvoIWooXDvGpgf5BJbKNIdSOIh19xdz2aMtloON1GZ
   gTEvRXNKsC5ROdOJyIgMZhRIdNZmqdviocbDTXy+oyFS/uaPRAOCd5s7o
   V4y2KzR9JDA8qW+puwbztPAWlfPtwACAzISoZZKiaJdMhDOJ847czQWps
   UpP4gCaRYQdJq3bGzuaqTQOc0/2Chq0ZTzQN5IaBzrI2wYgKvvxlk3vE3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="381842744"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="381842744"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 14:19:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="701498490"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 14:19:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oTV7L-006Zl7-0J;
	Thu, 01 Sep 2022 00:19:23 +0300
Date: Thu, 1 Sep 2022 00:19:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/3] regmap: spi-avmm: Use swabXX_array() helpers
Message-ID: <Yw/QWshWH9L/+Hwp@smile.fi.intel.com>
References: <20220831145407.78166-3-andriy.shevchenko@linux.intel.com>
 <202209010444.n3YAkNP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209010444.n3YAkNP1-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 01, 2022 at 04:12:01AM +0800, kernel test robot wrote:

...

>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/base/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):

Indeed, I compiled only first two patches on x86.

> >> drivers/base/regmap/regmap-spi-avmm.c:171:15: error: incompatible pointer types passing 'char *' to parameter of type 'u32 *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
>            swab32_array(buf, len / 4);
>                         ^~~
>    include/linux/swab.h:32:38: note: passing argument to parameter 'buf' here
>    static inline void swab32_array(u32 *buf, unsigned int words)
>                                         ^
>    6 warnings and 1 error generated.

While error message is valid, I believe the warnings are not related to the
patch in question and were before it.

-- 
With Best Regards,
Andy Shevchenko


