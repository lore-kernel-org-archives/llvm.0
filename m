Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877562F
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 09:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE70C3411C
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657964838;
	bh=IynHGG5q6JymFkYQoglPOiRP/qx4+yH1jRl8XAwEMzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AaPSnBENSQdkdAjhPhDYXLf9cAH6HIg/XRWnuKQqXes9mm12SNwPcamaxBQl3n0tI
	 o5kpXdilXb1YM9f+khmz2GoECdk373JM6VFEh4qIpdutv+zz+iIqW0fHFmN8TALUd5
	 /ax+9cQ1RNGBk3m1xVOcGeQP4jsIvNGykFuAxGYBif9SFqWsoV4E91guMNe292icLS
	 ZYkBh271ndPW5FDdzV6zusYpYNwSEbw6/8QF6qVG5wgMDLaw1IIQDZrTGyjcPtLpv9
	 vdF8+JKcA5F/9+Cy7knEo3JtJWlXAV4bSrYLG9BP8epABex0wETxm6DtOi9CHvslQJ
	 v6HkFFbbVyzjg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-31c8a1e9e33so66851997b3.5
        for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 02:47:17 -0700 (PDT)
X-Gm-Message-State: AJIora82E5Whg2XmBKYgxYsWCovX4ev/jIhEDFmuaRUEDLv/h1KNoq0k
	tSwGYraEcHmwlORvEqAkW5b+wecdQfaqhPPBvY0=
X-Google-Smtp-Source: AGRyM1tw2mk/iLiuB5HDbONldIwG4CBeBwYwMsHWxLXMbm1IOelEDNEswQjYHY9jQYQriZr+qQxREIxYhzDdLy/eUsU=
X-Received: by 2002:a81:d93:0:b0:31c:d32d:4d76 with SMTP id
 141-20020a810d93000000b0031cd32d4d76mr21533718ywn.135.1657964836957; Sat, 16
 Jul 2022 02:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220716001616.4052225-1-ndesaulniers@google.com>
In-Reply-To: <20220716001616.4052225-1-ndesaulniers@google.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 16 Jul 2022 11:46:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ky5w82=d2N_iZ2HYujeCDKJJqjT8P25-_+VpsZYWA_A@mail.gmail.com>
Message-ID: <CAK8P3a0ky5w82=d2N_iZ2HYujeCDKJJqjT8P25-_+VpsZYWA_A@mail.gmail.com>
Subject: Re: [PATCH] arm: lib: implement aeabi_uldivmod via div64_u64_rem
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Ard Biesheuval <ardb@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 16, 2022 at 2:16 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Compilers frequently need to defer 64b division to a libcall with this
> symbol name. It essentially is div64_u64_rem, just with a different
> signature. Kernel developers know to call div64_u64_rem, but compilers
> don't.
>
> Link: https://lore.kernel.org/lkml/20220524004156.0000790e@garyguo.net/
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

This has historically been strongly NAK'd, and I don't think that position
has changed in the meantime. A variable-argument 64-bit division is
really expensive, especially on 32-bit machines that lack a native
32-bit division instruction, and we don't want developers to accidentally
insert one in their driver code.

Explicitly calling one of the division helpers in linux/math64.h is the
established way for driver writers to declare that a particular division
cannot be turned into a cheaper operation and is never run in a
performance critical code path. The compiler of course cannot know
about either of those.

        Arnd
