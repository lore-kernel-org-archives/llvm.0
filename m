Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E721F370D75
	for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348682; cv=none; b=YU83m5NpoCtck/3+F1GI0l3kY5a0L3wC3iZ6AXmqFCvh9xtYqwifc5QIYlWU4zvC73y7OJQgeDr6d+8N4E+vHe+M8YCehNpRqZ1OKHeziHMjw0IzUM5U736sE0RQpdIsGkJGAzOhKjcx3ZHc3m/OEmUm39Oc8ljldH86apjwxKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348682; c=relaxed/simple;
	bh=7hKPAkTc8gkuKOQeOc2hw2B+zsm8HxW7BXmCLFr4IFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kw6eALFaS7wIibZbloivJGvPoMPCK73jvpx2sWlD/kY7DjKkMOnSb7yquZ9zxmPzhLAOHk05UI+L9ktA6EWId7Lth6q33+hVINcwWQRv1v5UxI4RGqr7rk2+GYnhMNhtktcN4M6OamZ4MfrXSkNym9ly1bxqO8Wt0MNHyHLWG2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+zNl0NJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+zNl0NJ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43b4730dad8so895189f8f.3
        for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774348678; x=1774953478; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ame1i2/P4uZZyXa5AdsReLRcEu535+ZYZ78TZbZKy1c=;
        b=f+zNl0NJSoGF3IAextymjw8ynjasw7dcXDyLA9bwTvMiuXnq1kOwhVuFL1kAT2Om5y
         fbHtrPQxizVGgmXo87QR/QdR6bqC5L4AvQjfoq4zxno/TlhUPH0wW05EjbvGRtV7B428
         lfqTRKZ9Tyj/fD7Wb3fK/POihlChwCcDrVGw69qep+IRKwMfSPVVeVLhVIbcT22VrsBQ
         dSHaEXlr08hq0rNeUF0oOPni5XVhIOrnamJyJ+ghgrhIg7LIMH5ThA0/YH7Nk8L8pSz0
         gysEy2F7PNFZ/puUNt2vY69QoQpb8Q3jaGUQpp2n2F8c36nJi/ohPgwFns3hfwMiPpoq
         fURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348678; x=1774953478;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ame1i2/P4uZZyXa5AdsReLRcEu535+ZYZ78TZbZKy1c=;
        b=QEJtC5Ei4HDFDaZ4AW0gJb9JBYmsC8dVLjWuMjbh9uxdjSwA5DBeTrQVD2+nDGuTbR
         I3UCF2Sy/q1j849eLUaKWuoB/B8L+TcO6RHa1gt1Sq5D4lEwUDwAkt6bkp65SJQbm8cb
         buh/NbhFIyFdfSgCTfDG+ydzI2E8O4wZNU3ePl3vief+Ra+99++veJ8bpZawiTaHsi/g
         2ddMcOQYFrWeQszpsryrbHt1IXrsiIFa0/HIVqN09TvB7KBqq1c3uMPKzhPPEVoiGwOf
         tlUuF8xq7orq65GWycy95cBGU0P+VsQibAyxpaDajAd/bZKvnaC591jiUy9msZM8e8KT
         MeVw==
X-Forwarded-Encrypted: i=1; AJvYcCXU9JU+GqbtKeFNHh3J5DAvzfO2vtSdqji8DRdH1IYpAeRVS1saCjo/HUazgkN3bW5T/PRX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8FHvNizCg+QWLwbxOTJBSewZt7X2MVampa1neDToJvtR4+J+e
	CaI98FIqpSFosTY7IiQqiGF+D50N22UBkihbWIXnYwublT+6Own1qP3XZqbNupCq6H8GsxOcubn
	db4gCaIc6THTIKw==
X-Received: from wrwj1.prod.google.com ([2002:a5d:5641:0:b0:439:c0d7:17ff])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2383:b0:43b:445f:3177 with SMTP id ffacd0b85a97d-43b6427db29mr24920980f8f.31.1774348677529;
 Tue, 24 Mar 2026 03:37:57 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:37:56 +0000
In-Reply-To: <20260323205534.1284284-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260323205534.1284284-1-arnd@kernel.org>
X-Mailer: aerc 0.21.0
Message-ID: <DHAY417D26BS.16WD7OAD2Z7JX@google.com>
Subject: Re: [PATCH] [v2] bug: avoid format attribute warning for clang as well
From: Brendan Jackman <jackmanb@google.com>
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Brendan Jackman <jackmanb@google.com>, 
	Ingo Molnar <mingo@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, <linux-kernel@vger.kernel.org>, 
	<llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon Mar 23, 2026 at 8:55 PM UTC, Arnd Bergmann wrote:
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
> Revert the change that added a gcc-specific workaround, and instead add
> the generic annotation that avoid the warning.
>
> Fixes: d36067d6ea00 ("bug: Hush suggest-attribute=format for __warn_printf()")
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Brendan Jackman <jackmanb@google.com>
> Link: https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thank you,

Reviewed-by: Brendan Jackman <jackmanb@google.com>
