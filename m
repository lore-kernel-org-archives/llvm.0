Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AA33DEFC;
	Tue,  2 Jun 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780426754; cv=none; b=CWhVJZKnO2qLV7hQiNJgV5T8a5YQPIv8u6hzgdBH0nGKHhP2XpnTR07Eet6GRDgcx1SnSUOqQZ5/Epbmk7Lr/K5ZtpJIljgVNtl4RxJc1SI+Gp+RRHM8woCBEmC6hl/pv1XN8owejGvOFPH2kSpAh2wZ1PINQTK0AAjQS6hhnzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780426754; c=relaxed/simple;
	bh=GvyU1VHG9G0bx3iqtGiPUhz+SeLDv9qe2ZeDnh9OQ+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsDLVZBA7WdNaZBpWjxaCDTzdtlS4nu6tDDqGsw0oxkLbyb2qQ34cFM5wVewuJeqpzbKhnXFb58GPdSl3oSr25yPlyUDYg9iviK+Ww9wt2TgHtN6uxFJDxmAPrLIifhS2UctiFik0HvkddOC4MUkdIoupM7+3P8I/lxdaRG99kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yo582DSO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yo582DSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780426753; x=1811962753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GvyU1VHG9G0bx3iqtGiPUhz+SeLDv9qe2ZeDnh9OQ+E=;
  b=Yo582DSOXev/Cy49uul4q2uaLqOBtHFQOJOy7ptHQwkR11paBf8Hk4hg
   aBn6/9iZH0SKBgTta7LDHTMb4rnCYLSPaQyNxLIYsqCQ4CQEDZvSKgIz+
   6FOPrFiAJNUEIPDdSpik59y5OK1Ieu8f4n8mj4WVkMsLwfmncHPksJXx3
   vqfFGgB4MRG/KD1HakJlQj3qv29CBVuOfHLfcsWu39VyAESZnOPyZhiJY
   44h4HzLm5RZZQ6sLCbYEjG/2VWs9C58LrupWJVo+NgyRAN80O7abnltah
   RhbWJniKCm1VCBV1kmwJU8v7BtHumVLnb+0etEGAM1ulHADnu/2/z9+/s
   w==;
X-CSE-ConnectionGUID: Jntpr8xWSnyAd0M8Yv7FVA==
X-CSE-MsgGUID: zxjA8fouTsyCmw1nNLj/7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91533732"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="91533732"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:59:13 -0700
X-CSE-ConnectionGUID: RQzM3udfSO6EFJ+AdhTWXg==
X-CSE-MsgGUID: NLFQCh7FSO6e1Hvs+jok5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239543956"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 11:59:07 -0700
Date: Tue, 2 Jun 2026 21:59:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] tracing: work around -Wmissing-format-attribute
 warning
Message-ID: <ah8n-Nk305S5hRwN@ashevche-desk.local>
References: <20260602150904.2258624-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602150904.2258624-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 02, 2026 at 05:07:05PM +0200, Arnd Bergmann wrote:
> 
> A number of tracing headers turn off -Wsuggest-attribute=format for
> gcc, but they don't turn it off for clang, so the same warning still
> happens on new versions of clang that support the format attribute.
> 
> To avoid duplicating the same thing in each tracing header, as well
> as changing all of them to also turn it off for clang, add a new
> __vsnprintf() helper that is not annotated this way in linux/sprintf.h
> but is defined to work the same way as the regular vsprintf.

vsprintf()

> Aside from tracing, the same thing can be used in va_format(),
> which is part of lib/vsprintf.c itself.

...

> --- a/include/linux/sprintf.h
> +++ b/include/linux/sprintf.h
> @@ -12,6 +12,7 @@ __printf(2, 3) int sprintf(char *buf, const char * fmt, ...);
>  __printf(2, 0) int vsprintf(char *buf, const char *, va_list);
>  __printf(3, 4) int snprintf(char *buf, size_t size, const char *fmt, ...);
>  __printf(3, 0) int vsnprintf(char *buf, size_t size, const char *fmt, va_list args);
> +int __vsnprintf(char *buf, size_t size, const char *fmt, va_list args);

Why the __printf() annotation is in the C file and not here?
Is this all about headers as the second paragraph in the commit message explains?
I would add a comment to explain it here, otherwise we might see false patches to
"make things consistent" in a wrong way.

>  __printf(3, 4) int scnprintf(char *buf, size_t size, const char *fmt, ...);
>  __printf(3, 0) int vscnprintf(char *buf, size_t size, const char *fmt, va_list args);
>  __printf(2, 3) __malloc char *kasprintf(gfp_t gfp, const char *fmt, ...);

-- 
With Best Regards,
Andy Shevchenko


