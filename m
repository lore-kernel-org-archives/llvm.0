Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3572
	for <llvm@lists.linux.dev>; Tue,  7 Sep 2021 19:16:42 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id z2so109294lft.1
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1fpdy3b2qMHUETeuDFTFbKg8FYwDRtrIQO5YjCA4iis=;
        b=gvtqQqQ0P76l17nNx5gKAZmX9q0gXmkKiJplZ5GrV0Rp5D/GmeTFvutVYxXDmohdU0
         Rg7GZWtGpo79LRFlloX9NBLbD7hga1UGVHT5sYVxcyx+e++dSBWbGFVZEFJrEiiMD80f
         lT+vaaeWPC4g7dOg7Pm63HBqJdzPD3ESYM7uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1fpdy3b2qMHUETeuDFTFbKg8FYwDRtrIQO5YjCA4iis=;
        b=nDMDNDxDyIkrTqeKQUd7GuF4UxVO7QRROX+qC6byh4z4fwkYLuR0uMKRpE+/MSVhUy
         h8svJUmsDYKCBLWzsAuNO8SWIk9KgJBOhhpBRt8r5uX7zqtVfBIsEr6/AfXT7jMQ6D5/
         p9/AYD0tGP+gYRWgZXLZOowzkav+KMKx76hEBfSzY5cX4OSXjIbFcmRyn6ston6POc5q
         SmHcFEwR9MCBSgGU0WIko5R+vWaSgwmTtiAwOj7QdiKV8kBFz5aTi78gUKI8198gSCA1
         WK8BIoT1NQtu/B/1MJgA3tO4YPybjbxwYj+ccm7le9zQXVkDvxTgCHsUJuBWsjvsPTpl
         RGlQ==
X-Gm-Message-State: AOAM5302CjjHtUOzJdOJIvzuZPZnplWaeW7gYRHG6zMhiTHb602b3q4l
	vGh6SC7eMm8hC6igmEHmlfVVNbyITGZ3RK1VpPY=
X-Google-Smtp-Source: ABdhPJwBYr4xR55+jXsdh/xFHiJ5/REyWFP6Ml4LVC0Jcu1FoIYTl/pJTRKQjLKm5KEJ0rRaIA8xmg==
X-Received: by 2002:ac2:488b:: with SMTP id x11mr14012728lfc.675.1631042199665;
        Tue, 07 Sep 2021 12:16:39 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id i5sm1075938lfu.274.2021.09.07.12.16.38
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 12:16:38 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id c8so82532lfi.3
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 12:16:38 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr14175340lfv.655.1631042198154;
 Tue, 07 Sep 2021 12:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210907183843.33028-1-ndesaulniers@google.com>
In-Reply-To: <20210907183843.33028-1-ndesaulniers@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Sep 2021 12:16:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
Message-ID: <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, LSM List <linux-security-module@vger.kernel.org>, 
	linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Kees Cook <keescook@chromium.org>, Mark Brown <broonie@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Vipin Sharma <vipinsh@google.com>, Chris Down <chris@chrisdown.name>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Daniel Borkmann <daniel@iogearbox.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 11:39 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> The above commit seems as though it was merged in response to
> https://lore.kernel.org/linux-hardening/CAHk-=wj4EG=kCOaqyPEq5VXa97kyUHsBpBn3DWwE91qcnDytOQ@mail.gmail.com/.

No. It was merged in response of _years_ of pain, with the last one
just being the final drop.

I'm not going to revert that change. I probably will have to limit it
(by making that WERROR option depend on certain expectations), but
basically any maintainer who has code that causes warnings should
expect that they will have to fix those warnings.

If it's clang that generates bogus warnings, then we'll have to start
disable clang warnings. The clang people tend to be proud of thir
fewer false positives, but so far looking at things, I am not
convinced.

And I'm most definitely not convinced when the "let's finally enable
-Werror after years of talking about it", people end up going "but but
but I have thousands of warnings".

That's the POINT of that commit. That "but but but I have thousands of
warnings" is not acceptable.

I spent hours yesterday getting rid of some warnings. It shouldn't be
on me fixing peoples code. It shouldn't be on me noticing that people
send me crap that warns.

And it really shouldn't be "Linus cares about warnings, so
configurations that Linus doesn't test can continue for years to have
them".

My "no warnings" policy isn't exactly new, and people shouldn't be
shocked when I then say "time to clean up *YOUR* house too".

            Linus
