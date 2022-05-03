Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0761E7F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 00:58:55 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49]) (authenticated)
	by conssluserg-02.nifty.com with ESMTP id 2430wPrr020143
	for <llvm@lists.linux.dev>; Tue, 3 May 2022 09:58:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 2430wPrr020143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1651539506;
	bh=X5yyCYnmChLJWpoXfwlLy3Yqy1jj1u5sgNOnl2YeT+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BqnpbHz0UnpeqwSt+Vh3kMd2Mz3wq2IHmLBOeM8mDRlkFxHYkrdDHmqS7Ueyp8Ec2
	 WzUJSAutmuoLS57d+5Yd7k+VMLH2wvyTDo6zGu5uyUj38yf1KnZse6f4aPXTnIJBd7
	 Bl7LMOOI9T9mMlm0+9kO2wSkKdidb88+eIvdbHsV0hBZRWMAqwNCFu+Ya7ZIj5TTOm
	 IyDvxlk8WVietj8Z9johK3i1EsH7T5pYD5MFsjgEgLYPw+KlBcZq4jArC8GlqQ1QT5
	 slAULcj9Vs3Wk2wyv9SJyHqbDYmjqsc1Ssb9jemTXbc9VL640r3RL41gVSjNK9jez0
	 YvA0a9zF0Hw+A==
X-Nifty-SrcIP: [209.85.160.49]
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-ed9ac77cbbso5324053fac.1
        for <llvm@lists.linux.dev>; Mon, 02 May 2022 17:58:25 -0700 (PDT)
X-Gm-Message-State: AOAM5317v/l18XjUQAR2dj4/BZmEQmhyKLy7vDys9V58NnSWvUcEcOjT
	pT34VvZC7zbZXskIlBA8Nj19BmGnz7t7gg3aUJU=
X-Google-Smtp-Source: ABdhPJz+NT1ytlT70sSlhO329TCvsmWaO6n7IEVV8ssLDz1hwnrwWgFpFLcb6+3gsOZ1Cyq8cWbiLDuibQJ8QIabxoU=
X-Received: by 2002:a17:90a:e517:b0:1d7:5bbd:f9f0 with SMTP id
 t23-20020a17090ae51700b001d75bbdf9f0mr2001475pjy.77.1651539493892; Mon, 02
 May 2022 17:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com> <20220209185752.1226407-2-alexandr.lobakin@intel.com>
In-Reply-To: <20220209185752.1226407-2-alexandr.lobakin@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 May 2022 09:57:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS0SLmpCHB8W=D6kGmfb5S+ESjY674P6q7RiO7faD=wqQ@mail.gmail.com>
Message-ID: <CAK7LNAS0SLmpCHB8W=D6kGmfb5S+ESjY674P6q7RiO7faD=wqQ@mail.gmail.com>
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

On Thu, Feb 10, 2022 at 3:59 AM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
>
> `-z unique-symbol` linker flag which is planned to use with FG-KASLR
> to simplify livepatching (hopefully globally later on) triggers the
> following:
>
> ERROR: modpost: "param_set_uint.0" [vmlinux] is a static EXPORT_SYMBOL
>
> The reason is that for now the condition from remove_dot():
>
> if (m && (s[n + m] == '.' || s[n + m] == 0))
>
> which was designed to test if it's a dot or a '\0' after the suffix
> is never satisfied.
> This is due to that `s[n + m]` always points to the last digit of a
> numeric suffix, not on the symbol next to it (from a custom debug
> print added to modpost):
>
> param_set_uint.0, s[n + m] is '0', s[n + m + 1] is '\0'
>
> So it's off-by-one and was like that since 2014.
> Fix this for the sake of upcoming features, but don't bother
> stable-backporting, as it's well hidden -- apart from that LD flag,
> can be triggered only by GCC LTO which never landed upstream.
>
> Fixes: fcd38ed0ff26 ("scripts: modpost: fix compilation warning")
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> ---


Acked-by: Masahiro Yamada <masahiroy@kernel.org>



>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6bfa33217914..4648b7afe5cc 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1986,7 +1986,7 @@ static char *remove_dot(char *s)
>
>         if (n && s[n]) {
>                 size_t m = strspn(s + n + 1, "0123456789");
> -               if (m && (s[n + m] == '.' || s[n + m] == 0))
> +               if (m && (s[n + m + 1] == '.' || s[n + m + 1] == 0))
>                         s[n] = 0;
>
>                 /* strip trailing .lto */
> --
> 2.34.1
>


-- 
Best Regards
Masahiro Yamada
