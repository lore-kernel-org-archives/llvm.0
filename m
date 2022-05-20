Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7A2F4A
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 17:50:22 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id d198so4415362iof.12
        for <llvm@lists.linux.dev>; Fri, 20 May 2022 10:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R37OV7ShgquRh/X+TFtKwKQtzqTzGe6venU+Fs9c73M=;
        b=qVyB6piFbVe86Mw/DbazCXUwImv/IW5/h0kf3KhMOhXCzo2tf76ou8pxMWMG54Hy2E
         DTRKJTL1e6dQKrDzX6SUZO6wIiGL+X8/EZ6INLGrABq9mWLNvgBSbZT4ls754GA2nr+v
         bEGGX+d9ndnGoAe0nzbeiZBdCZp+liNvI9O0Ns6Qt3geG+UeWJbeEhF2uEcKwAgTnp1R
         f6PEsKXTkz8cP7kjJuv9i2A2mPFaNgonJD1BS39pbNDZus4i56xY5DKaineZa+4J0vgs
         sK2rdyZDZqx7TRiMwOy3e/UB2K3ktz81U9dGWWtpLNVbWqjDbAWzrRUVQpj4Nch/XKtj
         28XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R37OV7ShgquRh/X+TFtKwKQtzqTzGe6venU+Fs9c73M=;
        b=v8eoyBpuZ5TqLd05oINFxPp7q4y+OMKK8tQeNY2hjLxY2MsmeCeIKBY5kd6q4JgZme
         q2WMtir2pHMhfk5uwoFl3Gf/+QLWHXJiPK0RB7ngGHq0TxE8sUBD+i5V1zp+jhcPr+CW
         VQUewEJAXRQ2B+UDDedbSxx4b3fPed5QbSkTx84khYs53E9Pn0qFi1i3I40F2gZMTXEP
         4tFSHygWJXcNLM0oETHh8menqU2NCmCwxfhiXYroxwTUebWEDkFkbwsV/GsxuM1y2hTl
         RgGdfxzJnV+WBknPRg1rCIpLLGD7Z2NybfvBFGD/6siKGD9OMV+WTIrKM7j4MGDiKPen
         9OFQ==
X-Gm-Message-State: AOAM5309CdbBy8uYuPToe9K6/MkqGrs30tTVDwVyvpYiQAhn6LyKQwQR
	8X4Oob4pQGcGIsOxDMgBAZTlMBxOgXSPzkt2+ZM=
X-Google-Smtp-Source: ABdhPJwEnZn+xZyGODG/E6u6W2+Xypve0w+TBVt6sSbJ7Xo6cEEeIyS61pkQIMAJ8DiA8dljupPLTZ/VKpzZarwMDFo=
X-Received: by 2002:a05:6638:16d6:b0:32e:97e4:ac16 with SMTP id
 g22-20020a05663816d600b0032e97e4ac16mr2854637jat.199.1653069020035; Fri, 20
 May 2022 10:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220506160106.522341-1-mic@digikod.net> <20220506160106.522341-5-mic@digikod.net>
 <CANiq72kbp3xTpj-L2BfLQ1Ecx-2Ki0W3e5YLERx8-T9bjb96=g@mail.gmail.com> <5be32ddf7688db38408466315a80e03e9af7ac40.camel@perches.com>
In-Reply-To: <5be32ddf7688db38408466315a80e03e9af7ac40.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 May 2022 19:50:09 +0200
Message-ID: <CANiq72=e9LMujmsk-mh8YHcGoKuLAnBttNz7JbiXH_2-hpvUvw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clang-format: Fix empty curly braces
To: Joe Perches <joe@perches.com>
Cc: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Brian Norris <briannorris@chromium.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Kees Cook <keescook@chromium.org>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Moore <paul@paul-moore.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Joe,

On Fri, May 20, 2022 at 7:24 PM Joe Perches <joe@perches.com> wrote:
>
> static inline void foo1(...) {}
> static inline void foo2(...) {}
> ...
> static inline void fooN(...) {}

Those are the non-wrapped-from-signature case, which are handled
before this option takes place, i.e. this option is about:

    void f()
    {}

vs.

    void f()
    {
    }

For putting everything on the same line, we could adjust
`AllowShortFunctionsOnASingleLine` from `None` to `Empty`, though.

Cheers,
Miguel
