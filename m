Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC693659EF
	for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351568; cv=none; b=SpXC/jklSGxO+acOotki87nYCc0KoosKjnPVVQAzI/Pp9xguXl0JDL7T3GDP5hNynMXus3DRPJwn1D+84D/iwKQzIpsW9nqD6wiNZXMKnjZXASxlwAf52H60E2HPmhqGbF20KLaHSy7q45rLtSoHD5XCwDBVR+2O7uq2xKMoqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351568; c=relaxed/simple;
	bh=t+rvAzzMdU6bwZ+KW8gAhcU5TM0bHnEQkxfihD5OSxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gav5xhn6gLZAOC7uds7LNTEc+N/JPiw3nJMTKDjcOyfTpldUtM4bxAksfve8i7vMjkw8uE0puM6WffwlEtCqf11g49nEuq6nPahZj9tiNvdrQI3abT1B4DuJgV5b7M2dRXgSIQCNlERj8i/dWVFM/H+nR85TgUAWi9sZ3AIvopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beB5f0y2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beB5f0y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774351566; x=1805887566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t+rvAzzMdU6bwZ+KW8gAhcU5TM0bHnEQkxfihD5OSxw=;
  b=beB5f0y276Tyt8Jerk4NPoG5m1PjDCU7cxaCN2mypvb6ofD92GRZqAPk
   KmcDQre/7HJsxOAaQNn1Ei4+KTy0LIawp0hCukuKQuHXYPDr12YEOcmwD
   hnQDews+i61eg44Rc1sBaLhYYcczybD0Pv9FIbv9bEdF4r0UDjMxvKD+l
   jOVvBrRcGmXE+TBbWWWc+DEa2KWdAVuTjDFRlrKuVxdgDPw92nqRRF7+C
   nWIWwa75Fyini/w16KYYbPASM7u+BT+Ae9vzNeqGoB4sq13mPetGPwciB
   5/fMPCh6tohhcgAhyaAPGlcJt91aOE3Uy4ynumPJSQmL5AjZ7vTYzvpWu
   g==;
X-CSE-ConnectionGUID: FuOqVKaoQB2XEaawONN4LQ==
X-CSE-MsgGUID: /1n7PNv0QWGROFwTgwLBNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75077809"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75077809"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:25:53 -0700
X-CSE-ConnectionGUID: zB4YPNIGSkGxHDa1Oe0Bjw==
X-CSE-MsgGUID: FaArvrcnSJihWR4R7Pi/4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228804554"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:25:49 -0700
Date: Tue, 24 Mar 2026 13:25:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Ingo Molnar <mingo@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] [v2] bug: avoid format attribute warning for clang as
 well
Message-ID: <acJ0u3X7_nfDouFR@ashevche-desk.local>
References: <20260323205534.1284284-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323205534.1284284-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 23, 2026 at 09:55:16PM +0100, Arnd Bergmann wrote:

> Like gcc, clang-22 now also warns about a function that it
> incorrectly identifies as a printf-style format:
> 
> lib/bug.c:190:22: error: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of '__warn_printf' [-Werror,-Wmissing-format-attribute]
>   179 | static void __warn_printf(const char *fmt, struct pt_regs *regs)
>       | __attribute__((format(printf, 1, 0)))
>   180 | {
>   181 |         if (!fmt)
>   182 |                 return;
>   183 |
>   184 | #ifdef HAVE_ARCH_BUG_FORMAT_ARGS
>   185 |         if (regs) {
>   186 |                 struct arch_va_list _args;
>   187 |                 va_list *args = __warn_args(&_args, regs);
>   188 |
>   189 |                 if (args) {
>   190 |                         vprintk(fmt, *args);
>       |                                           ^
> 
> Revert the change that added a gcc-specific workaround, and instead add
> the generic annotation that avoid the warning.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


