Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA32E2BB0A
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710151434; cv=none; b=nqwsT7uh/zM+YkFwTEVdu0I+yKX7a4Iu6E2uSTH495go0qqF4/fut6pG2qD08KxCh2+jxSToTxtjMjwaVXktt25kabj23pbn4Hfrkv/PV0+PnNvua2gKr/hANN7zqKcwmMf+EDi0YRfiLFIkczYz2NN8on5TNYKPiUYGogiF88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710151434; c=relaxed/simple;
	bh=VINzm/Vwcoa2/nF6nA7LPtWX9rDZ2TAoIoiOS4jeeCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QA8vrVJSbvnEH3aW2ne/iavnBdjmX+xqMuWKqPB8OApOIj10uO2oxqp4qucpzOF3R1XAi4qpY9QQEDaVXmcykNrAcTOZGVK0BbQq0A5tIKO8F7Ogpg8LYOALSP9zz3xxTKfw1q1+U/CQUDUzo1H6CvR+z5UfntiF7YtDc0RM0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rerct3nJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rerct3nJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750E4C43390
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 10:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710151433;
	bh=VINzm/Vwcoa2/nF6nA7LPtWX9rDZ2TAoIoiOS4jeeCI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rerct3nJGTcCss5LpdBU0UxkUeOR49WUw4BNFtlVF8RU483fqC6vEYlp46GVkx6Oa
	 vjjFzzmNZc0ycfqG1NtyeTprsMTHZrK1Ckkfy0J6v9brrVMr9sqPZDmhCIP9DZTFyx
	 GSG6X8lO0Wvn3NpK4FPMKmeuexJ52HE8MxcTw1WVutRhbmHBkhIWyL6T3wxdh87FuP
	 D+GgKksH11mfiWuISA+VB4yPX+kxjEBSlCdPTpZww/CRaKQ0XVZ0zf6IW+gfr6JXl9
	 1IlXmAdbtAH4s63g9a6DCrPA6s3nKS1sOeX78x2jo64Qsg0H25Tk5jNcpktNhO0qd9
	 ids+l+kS+mY6g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5101cd91017so6813284e87.2
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 03:03:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWdZ3KfYLxCC2CUGt4UMUDAPuotwvAR4+lhLJDbOcMl2gNki90zKnbvKiP0ZQfwqAUmUMptcBcxmykQMjCnFmtivs08w==
X-Gm-Message-State: AOJu0YyUjW1FH82VbSaxz9a4KbFa3KafU1dmpUeC+GxsMBOBPF4SVxeU
	PBh8F3qjU/0xzCVeKsFTJbSr/3hUITvbe/Z9D1kza3FPQqLyHcYubF3S/7zINSU+bLpUbwKxOzq
	E5IC5zvV5k2NEWTkfBHPI6sBqvsQ=
X-Google-Smtp-Source: AGHT+IG0O5uSf+/sFBbtjRhlYB+pT8E3SiMj6cKhI4su44o5o9fL7RMg/k2ms50Ov5e63iNuoswyZOMOXhGOpmYFe9E=
X-Received: by 2002:a05:6512:709:b0:513:343d:11da with SMTP id
 b9-20020a056512070900b00513343d11damr3680486lfs.24.1710151431541; Mon, 11 Mar
 2024 03:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org> <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
In-Reply-To: <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 11 Mar 2024 11:03:39 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
Message-ID: <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 10:39, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Mar 11, 2024 at 10:15:39AM +0100, Linus Walleij wrote:
> > Instead of just using defines to define the TLB flush functions,
> > use static inlines.
> >
> > This has the upside that we can tag those as __nocfi so we can
> > execute a CFI-enabled kernel.
>
> Why? This seems to be brain dead.
>
> Why can't CLANG cope with directly calling e.g.
> cpu_tlb.flush_user_range? Why does it need a static function to do
> exactly the same as the macro does?
>

I had the same question, so I played around a bit with the code.

What I think would be better is if we could add the __nocfi annotation
to the type, i.e.,

--- a/arch/arm/include/asm/tlbflush.h
+++ b/arch/arm/include/asm/tlbflush.h
@@ -205,8 +205,8 @@
 #include <linux/sched.h>

 struct cpu_tlb_fns {
-       void (*flush_user_range)(unsigned long, unsigned long, ...);
-       void (*flush_kern_range)(unsigned long, unsigned long);
+       void (__nocfi *flush_user_range)(unsigned long, unsigned long, ...);
+       void (__nocfi *flush_kern_range)(unsigned long, unsigned long);
        unsigned long tlb_flags;
 };

This works for some function attributes (e.g., __efiapi is used like
this), but the attribute specifier to which __nocfi resolves does not
appear to be usable in the same manner.

Best would be to annotate the asm code using
SYM_TYPED_FUNC_START/_END, so that the CFI machinery is invoked at the
call site to validate the function type of the destination.
