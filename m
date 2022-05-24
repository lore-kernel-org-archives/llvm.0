Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1A8810
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 13:48:46 +0000 (UTC)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-01.nifty.com with ESMTP id 24ODgdYa014938
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 22:42:39 +0900
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 24ODgNfJ012413
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 22:42:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 24ODgNfJ012413
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1653399744;
	bh=aNLlIgPVqKG5chGBjgSqnkX4433JxjcWB7yJEVQZ+Gg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vOnqteKUKXTgM/zuCkNQUg3jfDQsrpc++Y2UzqrAGHkDUluZ/gSXYze2oMW3ltxpV
	 FfAT5C2K0Ur2QPvk/yt5fVzU35Ek/86aIhaA42m+fo4DYSKcQT2mCKgrGUAYGIOy7A
	 UDMBMsCr4egpnmgAWfUbhvHr0/FrdGLSt/JF8oFYIthWhfvatyzY2ULibCZJYn78Zy
	 73zmoY18LjawEVGQQG3suGqsrOn+c/KHVkk1Q40v/s6NzIr+adiPTwnq07UVIEOSuu
	 QYuE6JZ946c8Jm3q5Y9DrtUuuqdbI1WFAgxvycsFqmYP+kM2LgoHrzZ98uev7ad3/J
	 8LY76hE5yrjzQ==
X-Nifty-SrcIP: [209.85.160.53]
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-d39f741ba0so22208899fac.13
        for <llvm@lists.linux.dev>; Tue, 24 May 2022 06:42:24 -0700 (PDT)
X-Gm-Message-State: AOAM533Y0BzxmtSCp50kFwD4zr4fey6SUGkBlY0l/ZVI7qTtBivduZYP
	07LRgbxz/7JF0T0Ji9FFu0O0ZZd6JxEk1PkYJbk=
X-Google-Smtp-Source: ABdhPJyTdv6DT7AK41vY70QzhcMH2A38iaGQn1upGmFmPJo+2BcK+NmA7eL9uIW06HJVa028vlOfajtpPNm4sy2hH34=
X-Received: by 2002:a17:90a:e004:b0:1e0:7a66:fb3a with SMTP id
 u4-20020a17090ae00400b001e07a66fb3amr2891041pjy.119.1653399732689; Tue, 24
 May 2022 06:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-2-alexandr.lobakin@intel.com> <CAK7LNAT3QTfkYLFTBKLxghY_gBQZmud3-4UJMK3tA9eOV4UeTg@mail.gmail.com>
 <20220524113337.4128239-1-alexandr.lobakin@intel.com>
In-Reply-To: <20220524113337.4128239-1-alexandr.lobakin@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 May 2022 22:40:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQus0vcWLCgSdMZNcYKam4fKYj9c8Zrb3HggZ7dTBUrxQ@mail.gmail.com>
Message-ID: <CAK7LNAQus0vcWLCgSdMZNcYKam4fKYj9c8Zrb3HggZ7dTBUrxQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/15] modpost: fix removing numeric suffixes
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: linux-hardening@vger.kernel.org, X86 ML <x86@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        Kees Cook <keescook@chromium.org>, Miklos Szeredi <miklos@szeredi.hu>,
        Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
        Bruce Schlobohm <bruce.schlobohm@intel.com>,
        Jessica Yu <jeyu@kernel.org>, kernel test robot <lkp@intel.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marios Pomonis <pomonis@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>, live-patching@vger.kernel.org,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 8:34 PM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
>
> From: Masahiro Yamada <masahiroy@kernel.org>
> Date: Tue, 24 May 2022 03:04:00 +0900
>
> > On Thu, Feb 10, 2022 at 3:59 AM Alexander Lobakin
> > <alexandr.lobakin@intel.com> wrote:
> > >
> > > `-z unique-symbol` linker flag which is planned to use with FG-KASLR
> > > to simplify livepatching (hopefully globally later on) triggers the
> > > following:
> > >
> > > ERROR: modpost: "param_set_uint.0" [vmlinux] is a static EXPORT_SYMBOL
> > >
> > > The reason is that for now the condition from remove_dot():
> > >
> > > if (m && (s[n + m] == '.' || s[n + m] == 0))
> > >
> > > which was designed to test if it's a dot or a '\0' after the suffix
> > > is never satisfied.
> > > This is due to that `s[n + m]` always points to the last digit of a
> > > numeric suffix, not on the symbol next to it (from a custom debug
> > > print added to modpost):
> > >
> > > param_set_uint.0, s[n + m] is '0', s[n + m + 1] is '\0'
> > >
> > > So it's off-by-one and was like that since 2014.
> > > Fix this for the sake of upcoming features, but don't bother
> > > stable-backporting, as it's well hidden -- apart from that LD flag,
> > > can be triggered only by GCC LTO which never landed upstream.
> > >
> > > Fixes: fcd38ed0ff26 ("scripts: modpost: fix compilation warning")
> > > Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> > > ---
> > >  scripts/mod/modpost.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index 6bfa33217914..4648b7afe5cc 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -1986,7 +1986,7 @@ static char *remove_dot(char *s)
> > >
> > >         if (n && s[n]) {
> > >                 size_t m = strspn(s + n + 1, "0123456789");
> > > -               if (m && (s[n + m] == '.' || s[n + m] == 0))
> > > +               if (m && (s[n + m + 1] == '.' || s[n + m + 1] == 0))
> > >                         s[n] = 0;
> > >
> > >                 /* strip trailing .lto */
> > > --
> > > 2.34.1
> > >
> >
> > This trivial patch has not been picked up yet.
> >
> > I can apply this to my tree, if you want.
>
> It's a good idea, I'd like to!
> I don't use `-z unique-symbol` for FG-KALSR anymore*, but this fix
> is not directly related to it and can be taken independently.
> Should I change the commit message or it's ok to take it as it is?


I am fine with either way.

If you want to resubmit this with a fresh commit log,
please send it to:
  linux-kbuild@vger.kernel.org

Then, I will take care of it in this MW.

Thanks.




> >
> > Please let me know your thoughts.
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
> * I'm planning to submit a new rev of FG-KASLR series soon, but
> since I'm too busy with XDP for now, it will happen no sooner than
> in a couple months =\
>
> Thanks!
> Al



-- 
Best Regards
Masahiro Yamada
