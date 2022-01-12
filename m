Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FB3173
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 20:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642020352; x=1673556352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3bd0+kvppXqt1g9WkYwL2BkeZvx2WQ/v4buHeuWib6I=;
  b=YHaxIoM+ZPFfbjShYZ4IGN4DQoJpacf1SkctzY2MAox0Tzy5AJGTEdoq
   NpMIB5FZXNdNbMwFmtkVoYjGUD6ivAtKuXI0F/AmO8ER1QzRSDxMzWmmb
   jlObdp2bdYu0rtk7ponhLtFrkg0Esh/IIXc47Wdya4U37xQ/sQFa5VVa5
   oPIaWKpmcJApNVN6vm7wCg3/akAwjlxBN3ye51CZhVO3VfFO6736SN6bR
   uxVrMzFyW5DVyYKAzsxME2NJVGRftlmmYYYfeMJ+DOXxa2uzIr0KZ42ei
   3F6waERrcvZtrAsuJ7B25pegbomQHZ00vrbKsbx9fzdcDozTWqzrzdIUK
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="241406501"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="241406501"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:45:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="691533858"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:45:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1n7kTx-009vDY-L5;
	Wed, 12 Jan 2022 22:44:33 +0200
Date: Wed, 12 Jan 2022 22:44:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: kernel test robot <lkp@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <Yd89sQz8L/KJ4BXA@smile.fi.intel.com>
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <202201090203.kgCw6bSd-lkp@intel.com>
 <eb4ef470-cfaf-13be-cb66-ca38c1a85a23@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb4ef470-cfaf-13be-cb66-ca38c1a85a23@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 12, 2022 at 08:58:00PM +0100, Hans de Goede wrote:
> On 1/8/22 19:54, kernel test robot wrote:

> >>> drivers/pinctrl/intel/pinctrl-baytrail.c:1483:58: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
> >                    dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
> >                                                              ~~~          ^~~~~~~~~~~~~~~~~~
> >                                                              %d
> >    include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
> >                    dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
> >                                                        ~~~     ^~~~~~~~~~~
> >    include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
> >                    _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
> >                                            ~~~    ^~~~~~~~~~~
> >    1 warning generated.
> 
> Hmm, ok. so x86_64 needs a %ld for the pointer arithmic result on i386 needs a %d
> without the 'l' what fun. I'll just store it in a temp int variable in the next
> version.

Why not to use uintptr_t and corresponding specifier (or ptrdiff_t)?

-- 
With Best Regards,
Andy Shevchenko


