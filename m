Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF663FCC
	for <llvm@lists.linux.dev>; Fri, 17 Sep 2021 07:11:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MtfVx-1mkqH50rrb-00v7gN for <llvm@lists.linux.dev>; Fri, 17 Sep 2021
 09:11:40 +0200
Received: by mail-wm1-f45.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso6202358wme.0
        for <llvm@lists.linux.dev>; Fri, 17 Sep 2021 00:11:40 -0700 (PDT)
X-Gm-Message-State: AOAM530DJ0Y6XF7Ogxrh6BOa5n0Y/Vhk6+G54IRcOGyXZsbqUSS73ciZ
	3PGrHeCzVuXd9zwzoNw4/Xsel2YAK0cUpGs9uOw=
X-Google-Smtp-Source: ABdhPJxFTrlvC3MihXqJ3h9pNAleNze2LQT6u+V8cD/dqelAjsVcxdmnT55O4mrL9MxC08iMzOz+RsSRo6YGxkc0GBg=
X-Received: by 2002:a05:600c:896:: with SMTP id l22mr13503869wmp.173.1631862699797;
 Fri, 17 Sep 2021 00:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210830213846.2609349-1-ndesaulniers@google.com>
In-Reply-To: <20210830213846.2609349-1-ndesaulniers@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Sep 2021 09:11:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2JJ=5t16enn2LaZE_zT1ZqNVyi9FQpTUrgVsQWiMtDkw@mail.gmail.com>
Message-ID: <CAK8P3a2JJ=5t16enn2LaZE_zT1ZqNVyi9FQpTUrgVsQWiMtDkw@mail.gmail.com>
Subject: Re: [PATCH] ARM: select HAVE_FUTEX_CMPXCHG
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	YiFei Zhu <yifeifz2@illinois.edu>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mike Rapoport <rppt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ewKaW3Z04RRCuockN6i64gIsZuxCDrsYjTA4gIWMuSIXpFTgb/I
 kQ6tVajldZQC1TCQHKNcb5kDS5TWTHCaGp4LyQ6XQ0aZEWBMZR/NqERK2ZRMPDo180kFWd5
 EpkCelp5rU6gGNcGj/da/4/3/u4YUAj0jOH+LMGG/pGIThM/w7dtM6bCRNDS3UTeL4kddqX
 ryB4lbo0QaTTdHdnRVkvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XdxJ2uW7/a4=:uYXbxkNd67cXor9do7tkah
 JIKOXWhNl+ytzrnPYODwlrK9e5fFMNM6WigmlYIMl9Q37NDm0+FDSdZAUEhSubZUuT/UBNXx7
 YQ5BLHA2QZuPD7D2cWfeF+U1HrIPLxvZF1+3nSEX8PprpS9Q9pjs9XRfUOVKLCG7t4cc9RTj1
 OX7ETLcX7YXCCfkzYwjbq7A8Tdg7nplbOZRGEhIJNoautWxhkAm6c5g+IgaPZAQKAHzkdxWgS
 vOenoamkSTd06xNNkomte+GM/h66b25D8hOAF1mW9+Xg2G3PoOzXluzN2P7IMG+PqE1M9ehUw
 cyyJ2S15XJinva429AzKOEXuqmZEMqhUCSvV9BJIEO4ZvomfyLhDlfsnhDryhuPDdEeI/wGRn
 LvvPmP5Dq5du2zBht176kxSwElCbvwHjxgZUroo41BfR7MvVN7mHPc1UZpNP2A1SF632eykIZ
 MEMwR8OATKLBiAcdYoFgjsaluTXCsLy0ZAIQz96VA7XaTnInLAw3fuOeFGegiJiFBppZzBBny
 5wR2AIXuEtbQIWj2+5DbmDD3xWjNUFrJCuxO0QuflSSYjaFNVB8AQlbi+b+4fbBiKfCPX4w26
 Y9nXW7E+98UJvJm5mm7hgXbBf9CHYJoB4y33pqKY4L1mEhZNRKGW2Y4Wrk+NFmJgEmXNh1zZn
 7BXde8laTNdCPuR0EKw+aMIfYnlgOz+DgSZAONXJKg+FJEhmE9coIli9NwFjDARUi3J4S5OgK
 UYMDY8dXnUo2l7Tp6J15SNZH2prg9PSqg6RpOUfHiJZ2bVCJBB3fZ8yzT+n1S88Z29ZNN208a
 9XK3T+eERlWnulbU4b39Twkdfgt0R/TX1JEgAAi60nkTFD3THiqJBYDiK0qnqKAMy9gYorUVP
 vCsNR5qs7ANowqTcxhZg==

On Mon, Aug 30, 2021 at 11:38 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> tglx notes:
>   This function [futex_detect_cmpxchg] is only needed when an
>   architecture has to runtime discover whether the CPU supports it or
>   not.  ARM has unconditional support for this, so the obvious thing to
>   do is the below.
>
> Fixes linkage failure from Clang randconfigs:
> kernel/futex.o:(.text.fixup+0x5c): relocation truncated to fit: R_ARM_JUMP24 against `.init.text'
> and boot failures for CONFIG_THUMB2_KERNEL.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/325
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

Nice! I did remember that we had come up with a number of solutions
for the build error and that at least one of them was an obvious and
nice fix, but I could never figure out what it was. This is clearly better
than any of the other ones I had found when I last looked.

I would add a reference to the commit that introduced the conditional,
and a request for backports as well:

See-also: 03b8c7b623c8 ("futex: Allow architectures to skip
futex_atomic_cmpxchg_inatomic() test")
Cc: stable@vger.kernel.org # v3.14+
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
