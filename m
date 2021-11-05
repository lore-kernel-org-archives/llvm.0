Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EA42C96
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:45:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F79761288
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636145148;
	bh=mbkrqX49D8pvCsH1aYAfKqkgRYkCne50RDuP81HnW7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X1QCIDMOpF/j4JsFMp9QbVW+hb765FKHzOPgW/k7AZIfQ6mQOmnfvVlcEZX24Sl/p
	 3lSwTJTnduXcZNtJcTxfJkTIKXIu4/TRYuqCSdbEZKjWHy/fYKyVlILbZmqV1E7XLq
	 wUhERcMGmrqRpIndKgMBr7XXEJogaTOdT8wYuIB+BW7Ey83+yr9wiE11HatmtCfiFr
	 VpHYVNBcTubzYdCBI7uAPipMbmRfThzFpvWynOik6cROL4fpJvPsUUWa5EA+XpBfuK
	 FQ4gOxbD5LMIDky9WLplrxla3ynOUMPvwHrGOAv1r8aI3AXp7TFWh3aawMkEC4TXFP
	 fQhRTddtd1MKg==
Received: by mail-wr1-f53.google.com with SMTP id w29so4057980wra.12
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:45:48 -0700 (PDT)
X-Gm-Message-State: AOAM532egKyoeJrdxvktjsVyHqeL428pKdvPbHFAEVflmVS6bXFpFQ4u
	4ipsuUlqgDOfF92sH76/M2s4TitfdN6ksR+l0H4=
X-Google-Smtp-Source: ABdhPJwYYHCIQ5b6GvuGVOKrx9JsbQ4IGmE0F25KFAMebt371XDu28fdt4XzAsUVYK/ecp40hA94FfXPeSlX5tSrZv4=
X-Received: by 2002:a05:6000:10cb:: with SMTP id b11mr64789976wrx.71.1636145146801;
 Fri, 05 Nov 2021 13:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105163137.3324344-1-anders.roxell@linaro.org>
 <20211105163137.3324344-2-anders.roxell@linaro.org> <CAKwvOd=rRntVgYdqEeb=JAYo2iC-wVB3dkQWNvwdZdrYgt2s7Q@mail.gmail.com>
In-Reply-To: <CAKwvOd=rRntVgYdqEeb=JAYo2iC-wVB3dkQWNvwdZdrYgt2s7Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Nov 2021 21:45:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ZuL9TQbj+tGkdvRRmEv_jT3OvzmaoFKHwdw=5J1w_SA@mail.gmail.com>
Message-ID: <CAK8P3a3ZuL9TQbj+tGkdvRRmEv_jT3OvzmaoFKHwdw=5J1w_SA@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: timens: exec: use 'labs()' over 'abs()'
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Anders Roxell <anders.roxell@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:35 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Fri, Nov 5, 2021 at 9:31 AM Anders Roxell <anders.roxell@linaro.org> wrote:
> >
> > When building selftests/timens with clang, the compiler warn about the
> > function abs() see below:
> >
> > exec.c:33:8: error: absolute value function 'abs' given an argument of type 'long' but has parameter of type 'int' which may cause truncation of value [-Werror,-Wabsolute-value]
> >                         if (abs(tst.tv_sec - now.tv_sec) > 5)
> >                             ^
> > exec.c:33:8: note: use function 'labs' instead
> >                         if (abs(tst.tv_sec - now.tv_sec) > 5)
> >                             ^~~
> >                             labs
>
> Careful.
>
> Isn't the tv_sec member of `struct timespec` a `time_t` which is 32b
> on 32b hosts and 64b on 64b hosts? If I'm recalling that correctly,
> then this patch results in a harmless (though unnecessary) sign
> extension for 32b targets. That should be fine, but someone like Arnd
> should triple check if my concern is valid or not.

It could actually be 'int', 'long' or 'long long' depending on the architecture
and C library. Maybe we need a temporary variable of type 'long long'
to hold the difference, and pass that to llabs()?

       Arnd
