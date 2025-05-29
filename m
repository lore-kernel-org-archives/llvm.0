Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68DC202C3A
	for <llvm@lists.linux.dev>; Thu, 29 May 2025 06:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748498467; cv=none; b=Y7fkNREJOrG+I0b9cTIwI9zDkDd6JpZ3jVdQNkIOtA4UhIh2pro8/pns+YSEz4eHsWg4jtyOjzc+eekmVwC0Lvne5BvSGGBXDBeIR6Nq1PDrRYnhmiA85jqRWkgh0hN0Rxz2j7koFORMIfrqo8AuUj7SrTStzkiU9FZJkT/JX5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748498467; c=relaxed/simple;
	bh=ee6dPxxgizLJ75Ie6rGuft7Nj+pZxFsrYqyEC9SjHbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ww04affTy2TONnEvMVIGxgXknhDlEsOpOkR5n//QQrmlX281zVwQwiQRjFNj+OOQ9ehD/fk6rInwfIhiGNi43IpaaZKOSEwOXJFAiOx3/i6zeHvaYbXjnxlSWkxx6VFaXmalq9dffOpMq4rZ3nsnd5CiSdLzKduo4sdHgMP6d9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EPiKvJm3; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EPiKvJm3"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3081f72c271so381892a91.0
        for <llvm@lists.linux.dev>; Wed, 28 May 2025 23:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748498465; x=1749103265; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vaz1+/ZzyNRFGMST7layMZzaN7+WIlAIP9tFziyB+WI=;
        b=EPiKvJm3MMMfBTYSKqoagk5KrkS1dCA2zZSK+eEaLOT1vpDJJIWeawGgwuQ/8BCooo
         6gAWt/VwrRYQFw4+0feV3SIBrKtwNIuny9mp0ytLB9aq+X1LIzrMGldzhAgnSbORUpXA
         orkEl1fKl3/lBhF0QfPYABk72TqfJFCxVAIr17dfgW+z4wlsG1nEpc/utBVSQoLbl0V8
         BuL5jYWcnjoEk4ANrghnOfHSf8AE/uJeKR04onXJpQ8+gJk3NqsgaXTNMNdo1uY0Qv7d
         L1Si1tDH1FbMrv5ZgAmLz9mTrWDJOTIQ/C0t/p6YHbR3HMpXHaN0P6ZBTVldN6z2kPfu
         nusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748498465; x=1749103265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaz1+/ZzyNRFGMST7layMZzaN7+WIlAIP9tFziyB+WI=;
        b=Wj3TV1TGgd7IbLaH0fWE+L5SyLGpVIX6TvXmGnTztedMIbgoQyxjrlBHp3BrubXgvt
         p6kcSLeU5Qw0WR+npAlMb4E/vI/l5q2CRlNiUux9ypQA6j8vi538/VotKGx95zyX3rGX
         BD3ceq2ld4ttU3WGieOqksO2cINrc+LZGOn1s8dgBX9r2nDFWNSazVJIIPq4sP93yh6X
         W6VBEGNuQyoFYR9/vHeiz3wQg6HO/fB1rajvdN+2yir4dYd1FeF1fe9F9LyTDtpzJkjm
         reRUhWcT+NLgtquL9Pe+XfWmT6ixMKLu2XB9cxkiiXHxbLDzR9nYpiDYfCAZhUcn08I1
         yGfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0eIUaxkc/2yOfrLAmLiMllvWsYJKe5BsNS7lyB6r3Kas3c5o7/l9l+StWwTIaP6KauYWG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8XE6lW7DnJcU1PsDUM/aq9SbIMacT21iuDoOBcsKyAgy4hP11
	2LtMbQKulrI+/OsNw9mjj2LjGJSreqPxd54x3HUc6S8lccNE8MuCMmwkF34+YtslMvNpgMZ9slG
	ossgsM/qt2p1OnsTYlogqwVFLO7K3TSF5ATZ8CfWF
X-Gm-Gg: ASbGncv/sNQE5s5d2/I/seoKTBv2Dt7DhwTj4qV2E4JJTHzkRJwKiIHMWrBXdlpKcn5
	+C6BCExRk5BCGIbSQuAws7JKowzEcJddG76SXXe4i53RJlQqM7rbDTLUs6PCgWf4UZJJbhTBRPd
	EQm0Mx9Wf442bAcr9tOhIQR9Bb4RrftKqoywiWV26sS4/V0hVzmXpYsxyRQFgc80mBtf3+RFLoV
	3yrUQDmL3ZjTg==
X-Google-Smtp-Source: AGHT+IHjuvTVAXJCwbM+CJ0cJqVVQmFtXnQG4j1KUBe5D8/pDzRiNN6zp0kn7i3urzRkLpnfLornO0snBlrTDyUNKi0=
X-Received: by 2002:a17:90b:2f08:b0:312:1dc9:9f67 with SMTP id
 98e67ed59e1d1-3121dc9a0a5mr1652394a91.2.1748498464732; Wed, 28 May 2025
 23:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250528182616.work.296-kees@kernel.org>
In-Reply-To: <20250528182616.work.296-kees@kernel.org>
From: Marco Elver <elver@google.com>
Date: Thu, 29 May 2025 08:00:00 +0200
X-Gm-Features: AX0GCFv05dumQmD3kZlNkUj0qoKmc2PEwVW3_kOZBhYxH81s34wEweRfqQ1cmc0
Message-ID: <CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com>
Subject: Re: [PATCH] ubsan: integer-overflow: depend on BROKEN to keep this
 out of CI
To: Kees Cook <kees@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Eric Biggers <ebiggers@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 20:26, Kees Cook <kees@kernel.org> wrote:
>
> Depending on !COMPILE_TEST isn't sufficient to keep this feature out of
> CI because we can't stop it from being included in randconfig builds.
> This feature is still highly experimental, and is developed in lock-step
> with Clang's Overflow Behavior Types[1]. Depend on BROKEN to keep it
> from being enabled by anyone not expecting it.
>
> Link: https://discourse.llvm.org/t/rfc-v2-clang-introduce-overflowbehaviortypes-for-wrapping-and-non-wrapping-arithmetic/86507 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: Marco Elver <elver@google.com>

> ---
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jann Horn <jannh@google.com>
> Cc: Marco Elver <elver@google.com>
> Cc: llvm@lists.linux.dev
> Cc: <linux-hardening@vger.kernel.org>
> ---
>  lib/Kconfig.ubsan | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index f6ea0c5b5da3..96cd89668467 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -118,6 +118,8 @@ config UBSAN_UNREACHABLE
>
>  config UBSAN_INTEGER_WRAP
>         bool "Perform checking for integer arithmetic wrap-around"
> +       # This is very experimental so drop the next line if you really want it
> +       depends on BROKEN
>         depends on !COMPILE_TEST
>         depends on $(cc-option,-fsanitize-undefined-ignore-overflow-pattern=all)
>         depends on $(cc-option,-fsanitize=signed-integer-overflow)
> --
> 2.34.1
>
