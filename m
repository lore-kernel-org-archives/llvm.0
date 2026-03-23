Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED68738AC8A
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 10:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263269; cv=none; b=sFj5lSouvpLhGWDR5m0BaLDI6kgwYSOviFmIW1PIzYzSz8/5SrYBtYjPjzXIomM+iLAVowKXaX4CbeXj09PWSQPSP7tPIvOARPTTN5wQvY5ELNEWq+GSPRQq1yYz/9tLhkGBmXEa8QozwEmNW6oPXMBRhhVDx6hka+4Ttx2bcG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263269; c=relaxed/simple;
	bh=dCNJE7U5RGNCFs1f/bIjCmMUBMSVOy/fPu+d8fLBcQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=btLg4NT7NXWA/GFF93YaXPw9XJWWS0pa/uNFDHo/Q4+QTxKQcXS4xNElrRLCjoeI6AP90DSMg1M49Z7YavdG/VE0jZ+iMXY3wz+soDVUaRwXUQvhDKfZK7p/MRyzzbAKWY7JGNRtTI18S2UR56kCFmnMZZwxqFpX7RHQ3bzdu34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyOTxcaY; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyOTxcaY"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48544725bdeso40226675e9.2
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 03:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774263266; x=1774868066; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2kszuLAyxs0b0uA7vliUMXaWBAHNPS94Epw+3Op512A=;
        b=OyOTxcaYV1PSt5+Ohh6M0FjMz0efXaOa20sF0HEWRaUKYlEPVkp/1NG0R9eYhWBH9k
         OBu9bsGn9W5XnyxmVbhjtBiyRVE654C8BUX1e6H6RGIuGumR99d1c2UIgdEyOWYsMT2V
         nWvyzDnDe/FDht4RjMXwD/qhbCRydWcW1O61uvT+NuKp3xRNSoMWJu5KW5Icf4nhbKxP
         bQodkr3v8ORWEqhV6ehmJGv2vVG7gjdPKuO04STM5s/TQPRwx03UVaPkcOTYZgMtS8vr
         KjWAaz/ociEgUR2gaeScgZLblyUzQUUV/545Uih+aoPT/eAolIlf1+twEd/OWgWYhniX
         i57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263266; x=1774868066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kszuLAyxs0b0uA7vliUMXaWBAHNPS94Epw+3Op512A=;
        b=kscGfilxnCbBT1A0iwr+JXLS+evoitEJZyggjhdZlD7ZeAOqksn/KDTCfpH4euWgnf
         PEhQNG1wo8naJ7USEEt6bggu0hrIuhS379uUUrVlOFP82f/5T9fQxkMq1Enn5FTo4MqN
         IlByV66PJT5rrN5sful36gZI7MGXk2yaNN4Qpd0kig2YbfKZbBXmOr6otiq1uHNArNhK
         R5YkG3vO+5fydZIjb8tx6c35717lqD6tzdWrH9/vkaHwjp1nufCdjZQuK+FWBGnvNHFO
         rHd0PfrJRkWfDEzfRtR2O7sZzHgGV5oqvMs3Yju4R0O4ekL84djRshEtEt0p0Mnl9gTc
         j71w==
X-Forwarded-Encrypted: i=1; AJvYcCWxTXw7xT69j1RpEZc7T8kSNDGDRyxrPnoPU6KnCyp1UkyBrhsEcw2rh8t/fRlHjZZiZYNR@lists.linux.dev
X-Gm-Message-State: AOJu0YzVbQl0RCiQ243MZQ1i0wCTnRui3lTWkgfpQXaVrE/PacXlo8YS
	IkvNFSzMrXJNkx5t/ELjmWf4nStN3lNQyY8JaTAQcZsE5LbsTM/v7PM3OJDdkaxX+c/lpdB/2Gl
	wzWkrg8eTyEP7Ig==
X-Received: from wruq7.prod.google.com ([2002:a5d:6587:0:b0:43b:4e01:4ab8])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3056:b0:487:1fc:14f9 with SMTP id 5b1f17b1804b1-48701fc15bbmr75448495e9.15.1774263266307;
 Mon, 23 Mar 2026 03:54:26 -0700 (PDT)
Date: Mon, 23 Mar 2026 10:54:25 +0000
In-Reply-To: <20260320211528.2474389-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260320211528.2474389-1-arnd@kernel.org>
X-Mailer: aerc 0.21.0
Message-ID: <DHA3U3U4ZZXQ.2RPHOFNQJ70JQ@google.com>
Subject: Re: [PATCH] bug: shut up format attribute warning for clang as well
From: Brendan Jackman <jackmanb@google.com>
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Brendan Jackman <jackmanb@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri Mar 20, 2026 at 9:14 PM UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
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
> Turn off this warning for all compilers and versions.
>
> Fixes: d36067d6ea00 ("bug: Hush suggest-attribute=format for __warn_printf()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  lib/bug.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/lib/bug.c b/lib/bug.c
> index bbc301097749..374feb144f0b 100644
> --- a/lib/bug.c
> +++ b/lib/bug.c
> @@ -174,8 +174,7 @@ struct bug_entry *find_bug(unsigned long bugaddr)
>  }
>  
>  __diag_push();
> -__diag_ignore(GCC, all, "-Wsuggest-attribute=format",
> -	      "Not a valid __printf() conversion candidate.");
> +__diag_ignore_all("-Wmissing-format-attribute", "Not a valid __printf() conversion candidate.");
>  static void __warn_printf(const char *fmt, struct pt_regs *regs)
>  {
>  	if (!fmt)

There is actually a superior fix for this warning that Andy Schevchenko
posted here (mine just happened to get merged first):

https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u

Should we just switch over to that? Looks like it should work for both
compilers.
