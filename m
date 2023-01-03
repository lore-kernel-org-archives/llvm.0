Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C88F57
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 19:40:07 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id bn6so23172448ljb.13
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 11:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=di6+B/a8IzWMU+YNat5Sofaq/W1nrTJmHjw8c69qvaI=;
        b=lRKzUBOE1GhqTB132HvL9VHc1Xlfw89at8dCADYWfEHGmoAKi+8emR5dXTKqY6qMqa
         sRJGy/r7SYkyh2G3tqwZtrJBHIE4swTCaFon9gPHfszva5deEpvuyuWjWZOBZjjsjc2/
         SsyoD+OXrdPRiNXHrYflsUhHmkWxZOMXHOnWUwEIuVM49FOiY+B578EEoQ1e0osIuqPC
         tFuXNUWFZKGTe+zz4MCNaL6T33KyHVMWl6cLbSjxo5k8r12lidWs+dPDyio2f5CUKhjz
         9JGbnq5ZRT5hVOsFfC4w7Pe4n+P7vP9/CGCRJTCS0ggMOcoxPNkXz4QYqAkgqloOk/iw
         +8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=di6+B/a8IzWMU+YNat5Sofaq/W1nrTJmHjw8c69qvaI=;
        b=hJTHMLc6SA4DiJnvt5/k0NoOcBzPpfDlwOe92xIj9dm0Q8BryEV+HgedXzNFKn8dtk
         tumM9O6JKQNckTW5YV6ZG6CdwiC06ALrQboycoR6rbVDbVNfCEq7baA2gRnk9PxkPThc
         pVlR7bQgYnPo5DdFZP8yCUKvi+JZ5DdENvC3xu753qZHs0pW5q31fxzdTwzqoQbceef6
         2EZW4P7uLeZzRxNhWxm7Zzaf45LL0VAGdkc0F1q9QUH+KqL9O6b5peKAO1DdmGEA7T4b
         wooY6d0peRT9BQxP9O7NeYW1oLW7pcCsHOflInRzfsWtqCFWmlPR9vMbdZnhOFn8CsGh
         SRxQ==
X-Gm-Message-State: AFqh2kru5DLrmQAssEA+Kh64u+73PZSAB5PPkP4sarY/gBhCp6I2rZzf
	W8I/h5YGX/1wnv0KfasOyjIThpM0b62x88OGaB0=
X-Google-Smtp-Source: AMrXdXvq+p0XY2mL04hhyI79maNj4LkKf1liLSxbAXsUAs5wxywLnY8+XI3fDCLoj7mmpTWAN2zuEtCfTkPzNpP1YcQ=
X-Received: by 2002:a2e:9805:0:b0:27f:c51a:a069 with SMTP id
 a5-20020a2e9805000000b0027fc51aa069mr1773133ljj.487.1672774805212; Tue, 03
 Jan 2023 11:40:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUW83H0H-oQkE5vyURWu6bD-OGYpTsNMwU1if5r=7+tpDA@mail.gmail.com>
 <20221110195932.377841-1-ndesaulniers@google.com> <CAK7LNATtt9Ot5D2rJLC=gpvBFEE70Vct+gX4UKw13F7=UqO1XQ@mail.gmail.com>
In-Reply-To: <CAK7LNATtt9Ot5D2rJLC=gpvBFEE70Vct+gX4UKw13F7=UqO1XQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 3 Jan 2023 20:39:28 +0100
Message-ID: <CA+icZUXtw0PR07m6hG9DXZ9Xf82rY4wfSYYMc4WbVkLC6bz6qg@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile.debug: support for -gz=zstd
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	Sedat Dilek <sedat.dilek@dhl.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, Nick Terrell <terrelln@fb.com>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Isabella Basso <isabbasso@riseup.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 13, 2022 at 12:01 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Nov 11, 2022 at 5:00 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
...
>
> Applied to linux-kbuild.
> Thanks.
...
> > Changes v2 -> v3:
> > * Fix scripts/Makefile.debug as per Sedat.
> > * Update commit message as per Nicolas.
> >
> > Changes v1 -> v2:
> > * Remove `depends on DEBUG_KERNEL` as per Nathan.
> > * Rename Kconfigs as per Sedat and Masahiro.
> > * Add note about renamed Kconfigs to commit message.
> > * Add more help text to DEBUG_INFO_COMPRESSED_ZSTD.
...
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 29280072dc0e..7c28a8fba02e 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
...
> > +config DEBUG_INFO_COMPRESSED_ZSTD
> > +       bool "Compress debugging information with zstd"
> > +       depends on $(cc-option,-gz=zstd)
> > +       depends on $(ld-option,--compress-debug-sections=zstd)
> > +       help
> > +         Compress the debug information using zstd.  This may provide better
> > +         compression than zlib, for about the same time costs, but requires newer
> > +         toolchain support.  Requires GCC 13.0+ or Clang 16.0+, binutils 2.40+, and
> > +         zstd.
> > +
> > +endchoice # "Compressed Debug information"

Just saw:

GNU Binutils 2.40 Branched With Zstd Support, Zen 4, New Intel Instructions

Debian GNU/Linux ships version 2.39.90 in unstable release.

Maybe someone can point me to the release schedule of LLVM-16?

Thanks.

Best regards,
-Sedat-

[1] https://www.phoronix.com/news/GNU-Binutils-2.40
[2] https://metadata.ftp-master.debian.org/changelogs//main/b/binutils/binutils_2.39.90.20221231-1_changelog
