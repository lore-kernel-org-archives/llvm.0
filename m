Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7B314D34
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976970; cv=pass; b=JXB+C3ITq6+UqrkZoa996Vs6Q0NUJsPsnUm4DwkSYht5tAju53e4/Rt0uMTq7jsuVAqmmu430EQoZXLDtHR3MGTXe2BVF5H3WE0/1O51Kf11dgbDigaNT9qh/QaAdRYj3ZsixvH5M9bLv3HK16RN8oED7FOR9Y4edZiOaBK0frY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976970; c=relaxed/simple;
	bh=WTRVHRp3YZnZVbE+0ZoSdIPjJ/az35/laG/IbVwaY3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtaBYMyZAxAclWY/cGN1f40+82OUbUXwLwNcJoBAyS45txLbaEUJKl9TG0DVnyKUb1jIfZWK6s5WHhQqGzw0DiOs5jFQmCYTEPxLDrNcRllLPhKeFQkXbxvqcmL1v3SdQPSvYv6XwEV1At8SJT2u63CxPkhUbQDUDuc3/JojK/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/dpLa17; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/dpLa17"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12734af2cdcso219237c88.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976966; cv=none;
        d=google.com; s=arc-20240605;
        b=XWOhvc3mfC41fo1BC+VNXaHq3vXXTVWcZBJWamW/j/kKNTollKAQ2Q5uMqjHb76YQx
         yR/5mqsFftNIKZ6IY8agCBY8J8usB2fPDZ+N/ktom1KiWBdueKJQfxsJmmFiLEbaX6Dk
         HOlPDLVUW3bFz7EzNsX6920RGxzzklakTOiBmum9xKCmXXwV1w5xMb9sIjTktaAmG8nq
         9uYw4h1VFiFhea26UKbMcSbdqLkB3fUiJqvaQFY9x58Jjq2ybVSICMJs9bA7jrclnJGZ
         NCJnKXEjuPjJr1SauPfoCYCEGuTDcXsISQUhS8zn5MIitvDhCMedfOOoHw3I4orR8od/
         DufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        fh=gGv5/byusobBrvjjGid4Xg9a+T+4/mI9+u2dDPDd5/w=;
        b=XFN6fCWkWXYpQLgHgTKqLhoW7eYCzHAphGan/6y8YSnN8CXxdzNNpQmbBZYuSNDh/J
         yECcODORnzIzD7fBr/h5X+N6XyCagVP1GMnlWAkK80Wm+R9BBJPZtNLpSf/E9Cn/YSdJ
         imcU6lEJRZmfiUgUOnNqy6dFN0rjcN8ZrEwKDlkM2Keh1Bd0sDQ7QoQadk+cl6BeJiJV
         wET6zUJd9Opgl+Efz4o1aKXcod+IGNqM8lT7QN0BjK+K69V42J2bp1R67qQfAna6I1dw
         yNcs7QrXyVHCWQdGnr/6RlUGdryJCZkOnPZomVll8cypJPaeG2UAmxBOg1YTcywBRM/n
         raOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774976966; x=1775581766; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        b=W/dpLa17eDVWiKO4tHTG3RKjXmVIrlzyplPPEFHeOZYAHgn5dR83IiCdMBZqgns841
         XXsPeNRI9VQ2AtuEzADfKVmrNUf2peHzXfKJb4Z+tFq0Ow9p4idSt/BLu/HqyFPIEZ84
         7gu5XwKsVMhNRbQ9PzIjhxO8Cj1VbRskEnR7SyRHEUu0ob0avvSMKJOaqZshDU+MT4qA
         HmdlsojaAjS6kO6cXVkeuSZKXgBcd2eI3cZ18lBwKDMbp/pTTUI349mWcP9FTqefam2B
         wWOXJOhhDemzvD0U2rRuR2UkGS/W7G8HtWhH1Eh6NFlHe0VSrB5D5QoLcZyXGz9ZBq9P
         88bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976966; x=1775581766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        b=NC3gd6/RiiYY2GLYAG6vRCy7oX8CnQefvmXJ5dPHSQPBC+tOP3pqg9ie5G3wE7dCH4
         upDf8JU5dE5HPZA9XVZhoWaOFVGAE/e3TR/4kovDSkAAnIYPyLlTEXilUzbCyYk51NY0
         z+usUlwp/3/GvFlGVlkSzvDw/wFk1TB+wQwfr8+iu5kSHyD4cnMErLjRaDC1NZ63ycGk
         XeQiDQQs8zbQdGVDjrCZ0ChLhNQKQUoP3VGM51twAuP5lk0ijBx+oU3H9Z373MyBimdo
         VnAgsAioS/CnB4v5rjp7hY2LGqG80+ce6ti3490sg/VtgQ77kHhh10ATM9JEhCGreoPB
         xKqA==
X-Forwarded-Encrypted: i=1; AJvYcCVVUrPxFRkIQG1HAzRtVqPsllqTZhYdDHwoPGoPl/quePAXBfMCqzJeqFNQ4YOkGUNK+m3d@lists.linux.dev
X-Gm-Message-State: AOJu0YxcO+eJ6D/zgGOU2zNCnzjmuEgaZMwEBtwT7ADbNZSHVy0WNk+G
	WYAg0xjPu50Mgs77H3j9uZabd217igBRL+zu8uO3Yh8zyXSjcg8hy9avYLMy1RjkjDxtdbSKdAM
	pkaAgMiGl/xedXGT8zEfnd70zYmMlC5Q=
X-Gm-Gg: ATEYQzx89z74uOBAk9lnF+2SeGh7hm4ncKxx1kKfWx5R248b4U6P7+8D8cdrnB3uh3l
	TPAMu/1iDn07vGh9el3yoiztw4xs5u2pcgXwEah3s3LZBBW8P9zqqSPCn9nNpSgKUePfG2El4SC
	urn9jkLsCjGla5pejtlfH5yCSyuQaIinVEUofbm6VLPdoyYZ3EhCFkrpZo1MdnMmQ9B+UhbI6jW
	/igHblsb7vTvbdE3I2NQVfsphnD8NJj5I46SS8bpPu8BSV+qEgvdULKd3VrJEM1Hpe0aMMvRgaD
	fvnV/LWse1K1LMm2g4HTZLoA6nhB2hnqpXh48/1hYFp+gQFaFgWh72Ulpdsn/nZZczdkb1Kx5Cl
	KVvQUITzgTBoCQ0oSmIbKsqA5e67EgYKwsA==
X-Received: by 2002:a05:7022:660d:b0:128:d279:b8ea with SMTP id
 a92af1059eb24-12be65beca8mr58281c88.5.1774976966237; Tue, 31 Mar 2026
 10:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
In-Reply-To: <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:09:11 +0200
X-Gm-Features: AQROBzBS6-knL1zyoKnZ9aw9c60rLyHZCDFo7ofTsu_CS53BZFovGzzWB07mGSA
Message-ID: <CANiq72nH1cMgpQGGkbwCQd4bSEVarWteaQaXeZh3FNyNKauKKA@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 7:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Also, I am a bit confused -- does the compiler flag automatically
> recognize the names like `__ob_trap`? i.e. I see the docs mention
> using the attribute,
>
>     typedef unsigned int __attribute__((overflow_behavior(trap))) safe_ui=
nt;
>     typedef unsigned int __attribute__((overflow_behavior(wrap))) wrappin=
g_uint;
>
> But then we don't actually use it?

Ah, it does, it is a keyword, and I should have read the docs better.

From a quick test in Compiler Explorer it seems to be fine to define a
macro like the keyword:

    #define __ob_trap __attribute__((overflow_behavior(trap)))
    #define __ob_wrap __attribute__((overflow_behavior(wrap)))

That could be a bit more flexible in the name we pick on our side and
more like the rest of the attributes, but if the intention is to
eventually use that keyword in standard C or similar, I guess it is
fine.

Cheers,
Miguel
