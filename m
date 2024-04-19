Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478B85C62
	for <llvm@lists.linux.dev>; Fri, 19 Apr 2024 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713531407; cv=none; b=f2PAhTDHZT4aWqLlJNpLFMYwaTXm9c1gc6OAuctf18H49qijCdt+DI80CrH0/rXo5/JaYnZyvejA1fjTfHrFpW2pRUJdwbDaYeUMzWbWxMKw2ogq5sm6lNJ4D2KzMWUpGbQWdGRsf0F9uSqY7KWoM3Qvn6Rg+JpEBmiaP/oSECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713531407; c=relaxed/simple;
	bh=Z1E7x/rsFacwyozNP0MLeIZz5peYHrE/SUN3CzUJKD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0u37LKIodiXcpD18xx30AC7NNG+FuMSiHr6migUUFggHwQtz0xeXjkvE4KIprfXfAFD6IZ8w2kRxMGJ05QsrnIAtgVvdtFIfHMzph9ZoXa9HInxaa/5stFs0rzYEzxPWDXT5A+teGf/z2Dk6uUd1zszLEvZhFwTL8CIVo6QNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XdvzC2fc; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XdvzC2fc"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2084319276.1
        for <llvm@lists.linux.dev>; Fri, 19 Apr 2024 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713531405; x=1714136205; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8br1ykgfrm1f/EqxeumN4XQgZaMfGLB4cLhcgiUlHE=;
        b=XdvzC2fcRe4iN89Z2c2aipzem9BO0Ox8BcXwnOaY5Lv+nPDKGvhDi0uq1F8rKGUChq
         ShuQCbFED5GQ+qYattSQRtPiCf8BNbueTy1ullXlpGsLPg54l5WG13cwsbv0TByQ0zLm
         uqQc6e2ICjGIHsBHLgcZFICcIRHzOOLPUDN5LO9EqjLMjEneRXvwGtOMs7PwwZ1dQBdY
         D7UA+fzTvWekdpFIfKytIP6+keKX/pJ0gKKSeTTEQjHBfRHMHHB3wcvMhMn84vBY4ODN
         uLpGS7a1AVDM9M8fdNDJH3PP18kwv650pfyhPWmU2NWxQq+VnVSjSDDjEiHqazgoc1hn
         Vq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713531405; x=1714136205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8br1ykgfrm1f/EqxeumN4XQgZaMfGLB4cLhcgiUlHE=;
        b=wFFdP7+IU35uhgqrr+qHyCPlykXp3poOL5rl4TkLbWveoF5M3DM5UEFfv8HjyB2hwS
         VFwzTB6ei2veo1XxabuLwURittbMt87M2cn0WQr26x89Z6JXDvQKMWTqUhORNkcxJEGj
         kArABHEjpmI8pUuLF9R39m/593iZOPFdjsUTkAdjx9fqQ+2T4iP7B7b5vLudX3VYvq1u
         Tc0MTQWnyJQDJSVcAZA46vC6iRw9xxRAYaHsZQV5Yny+kmPBPvJmmpA3rB9eWYlC/crM
         Zgv3BqSDY8dCcLhSqHnVg+GZdaLF1rEn8LChheo43F35nAfT023gvVE85wEFlponLObd
         l8pw==
X-Forwarded-Encrypted: i=1; AJvYcCXw/ICmO3r+2TCMi6qHszB5J0kAXm23hqVpq2aKVcsByD/Cy2Ec/C2syygoD3mgDz/FGL9EQn097yO+Qh3GUUJVntBT/w==
X-Gm-Message-State: AOJu0YycGxFpDzPYJ5NMcv315eogQZ2Enk8whTy1+TJs/U++DGseOjVi
	2NJ70QQ+Xg1dvgAIjdIHbReRrTdkRyxwaFQxwl57H0bhDQyrYYeJNNSMZbxDfVYa3m2PEEfbosh
	/gEmFaiBDGUpn2w3Y5789mQ+s8i9K+QTUjysJnA==
X-Google-Smtp-Source: AGHT+IF1FbnmZtyf1vtMltI7gQM2rorsgZfcslzU9ACfcrNtv225QR1oV5Dh8OeROcqg8LBerOwfZHfkoxjBSirKqPg=
X-Received: by 2002:a25:818e:0:b0:dcb:df38:1c20 with SMTP id
 p14-20020a25818e000000b00dcbdf381c20mr1525310ybk.24.1713531405248; Fri, 19
 Apr 2024 05:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
 <20240417-arm32-cfi-v6-10-6486385eb136@linaro.org> <CABCJKufKoDOrPUpKFXBnoNEuQ8gJ7d1zHn=H-gtLoLX=02viUA@mail.gmail.com>
In-Reply-To: <CABCJKufKoDOrPUpKFXBnoNEuQ8gJ7d1zHn=H-gtLoLX=02viUA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Apr 2024 14:56:33 +0200
Message-ID: <CACRpkdYZWXO2Z9qAQX7Q1Y9S+crNi=81g-+W207PtrYXfgmdvw@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] ARM: hw_breakpoint: Handle CFI breakpoints
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Russell King <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 6:13=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:

> > +       switch (report_cfi_failure(regs, instruction_pointer(regs), &ta=
rget, type)) {
>
> Nit: To make the error message a bit cleaner, you can use
> report_cfi_failure_noaddr(...) instead,

OK, fixed it!

> and maybe you can expand the
> comment to explain why target information isn't trivially available
> right now?

Sure, but I guess I would need you to explain it to me so I don't get
it wrong :D

Is it correct to say:

"TODO: To be able to properly extract target information the compiler
needs to be extended with operand bundling lowering into the 32-bit
ARM targets, and currently no compiler has implemented this."

?

Yours,
Linus Walleij
