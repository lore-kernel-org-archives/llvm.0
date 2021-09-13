Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E683FC5
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 17:42:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id i7so6573396lfr.13
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/fXusuKKh/e5rHl3WvKLT7/eIYqq9n/M32FO5AEfQZ4=;
        b=Bb8jIWZyUA2JnH1dNvqA8PhazKDoFToI8m/EWHAoOqKLNqV8zTPjzKX6vSeXFJuKyf
         tIz9q+4BcBJIZrm/Iu+TQqerdjnjQiXXxiZVROuzlUAiYHdpJ05Qtsggzr+XxSztzHDf
         1zrSjLLUXzKthlfdL5NA8jPU2NHbiFKkxBxww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/fXusuKKh/e5rHl3WvKLT7/eIYqq9n/M32FO5AEfQZ4=;
        b=Co7peV5TxFd8zsEoEjIBfl5oQ9OQt9eaRxim+BIsF1zNrxMzypsdACcJvTyiDSRSJ5
         iv2z+dHw5FBCcwFqjGVlq1lU71eLZQobAYBjwwEPq5g8LkqfiMnK2UBcPVlus+SoLQqJ
         C3R9Nq55y9phuaSy2eUtTba7AqmQVZf6dZYPS9mhE1cC+pAhHKeslgB5pKvO7J4pXfbi
         XgNcudXYByExPl25COUcVzdh4ZGlda9UxWM2S1Sp+tt6snY/2NuEVDxvm1UkBV6RkCcy
         T8kiiHIQEXUBJE6XDOYsnQhGjNLw6fN7kf3BE/FMTzRi5mDyGiWy22DT7jDRhWVshVvt
         i5WQ==
X-Gm-Message-State: AOAM531VP/h7sP8YenvUBwnDM+uiGxuaDtbWl0dwF3g2ytE2Xm4RUxTO
	YKR5Q8rpocLseHsv5CQaq6Vv3DA+o9yU0m5U44g=
X-Google-Smtp-Source: ABdhPJy8shkCYbZaePuBXMiM7OobIrcl1T/Lff2nOEpi+RTpGyCLLNm2QgDWzKxbPdioosUVrZg2qw==
X-Received: by 2002:a05:6512:2211:: with SMTP id h17mr10025287lfu.285.1631554961381;
        Mon, 13 Sep 2021 10:42:41 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id i18sm278971ljj.84.2021.09.13.10.42.41
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 10:42:41 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id j12so18708628ljg.10
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 10:42:41 -0700 (PDT)
X-Received: by 2002:a2e:1542:: with SMTP id 2mr11735241ljv.249.1631554960750;
 Mon, 13 Sep 2021 10:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com> <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org> <20210913093256.GA12225@amd>
 <87a6kgerdk.fsf@oldenburg.str.redhat.com>
In-Reply-To: <87a6kgerdk.fsf@oldenburg.str.redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 10:42:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj7M1_BXG2MXLv4OhjzjV-opy=5fE7+vafW5fHOyDrg+w@mail.gmail.com>
Message-ID: <CAHk-=wj7M1_BXG2MXLv4OhjzjV-opy=5fE7+vafW5fHOyDrg+w@mail.gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
To: Florian Weimer <fweimer@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>, Marco Elver <elver@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	LSM List <linux-security-module@vger.kernel.org>, linux-toolchains@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, 
	Mark Brown <broonie@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Chris Down <chris@chrisdown.name>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Daniel Borkmann <daniel@iogearbox.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 2:50 AM Florian Weimer <fweimer@redhat.com> wrote:
>
> But there are also warnings which are emitted by the GCC middle-end (the
> optimizers), and turning on -Werror for those is very problematic.

People say that, but let's face it, that's simply not true.

There are real problematic warnings, and we just turn those warnings
off. People who want the self-flagellation can enable them with W=1
(or bigger values), and spend their life fighting stupid random
compiler warnings that have tons of false positives.

But the fact is, I've required a warning-free build on x86-64 for
anything I notice for the last several years by now, and it really
hasn't been a problem.

What _has_ been a problem is that (a) build bots don't care about and
(b) the configs I don't personally test (other non-x86-64
architectures stand out, but there's certainly been other
configuration issues too).

But "bogus compiler warnings" is very much *not* in that list of problems.

I've looked at a lot of the warnings that are now errors, and while a
number of them have made me go "So why didn't we see that on x86-64?"
not one of them has actually made me go "-Werror was wrong".

Because EVERY single one I've seen has been for something that should
have been fixed. Presumably long long ago, but the warning it
generated had been ignored.

So stop with the "some warnings just happen" crap. Outside of actual
compiler bugs, and truly stupid warnings (that we turn off), that's
simply not true.

And yes, those compiler bugs happen. The new warning already found one
issue with current gcc trunk (non-released). So right now the count is
"lots of valid warnings, and one compiler bug that was found _thanks_
to me enabling -Werror".

Yes, we have issues with having to work around older compiler bugs.
Those aren't going away, and yes, -Werror may well mean that
non-x86-64 people now have to deal with them.

And yes, this is painful. I'm very much aware of that. But we just
need to do it. Because the warnings don't go away on their own, and
not making them fatal clearly just means that they'll stay around
forever.

           Linus
