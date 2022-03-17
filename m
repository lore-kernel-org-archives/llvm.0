Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F33D79
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647508055; x=1679044055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3LOKV8T+J6ndpx4yRF7CsKdRnALN/jjLjomuYjUYYFg=;
  b=Y1TOv4N3ZykzSIKB+CGXfyrjYenjEThEkFJP3ywRI74sJMawUsTNZfvM
   bPVwnAH5sqguVc08GUsgOrid3Ax9NlqkxF3fzeeE9pQTE+2aBaLF3u3RB
   dsYhYWbsHsUKtquKNTkfv/Vcww+y55WVf8wKQcrbwKr+MjjWvAzTxrns+
   I6cCsW9AbC+LCEVbDlmji13ZJH2JO6Lv0bdxku4SHVNMuAtcbA4CMwlUO
   bANBcJcVTVfKh0X5wPWuAryhkYYX/eLEjNysaXEdlPC5d7sXKjsLYde1w
   LsDtw8JuUGqzqOawBiwqRc1bP+QbMrQAJ/UpDrvZlkCQg66hTBDS9sbNu
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="257009689"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="257009689"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 02:07:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="646981440"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 02:07:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nUm5r-001Q0N-NG;
	Thu, 17 Mar 2022 11:06:51 +0200
Date: Thu, 17 Mar 2022 11:06:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bill Wendling <morbo@google.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
Message-ID: <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
References: <20220316213055.2351342-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316213055.2351342-1-morbo@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 16, 2022 at 02:30:55PM -0700, Bill Wendling wrote:
> When compiling with -Wformat, clang emits the following warning:
> 
> drivers/gpio/gpiolib-acpi.c:393:4: warning: format specifies type
> 'unsigned char' but the argument has type 'int' [-Wformat]
>                         pin);
>                         ^~~
> 
> The types of these arguments are unconditionally defined, so this patch
> updates the format character to the correct ones for ints and unsigned
> ints.

hhX specifier refers to unsigned char. It's a bug in the compiler.

NAK.

-- 
With Best Regards,
Andy Shevchenko


