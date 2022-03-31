Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52E864F
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 01:59:26 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id j18so31624201wrd.6
        for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 18:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Ybt0k9RlDS+Cob3c2Nri6i6agmQS6h2yDd5CaRARZY=;
        b=Om9v/U3IT72STKyChyxqFZ1SVBkdP9RI2WCGYHkkoZvdnU1qCnh1uNc6OzFIsDGLO0
         31mzrIMETM5s4SdPiku3AUImVaTFrZape78fbJij27gkxYtXQFg5ahiLNVsStaQY1mbd
         VMAAjICY3ERWSX2PJ3S0RpQR6dj8O7z7Q8Wh3jUdQSwo11clMkBiiUa4rp7cBeNJ7Ujo
         rB5pZWlz22wG1M0deFMcJ4ySz3Lwb933o09Y2/AXNx6XYowO6br+unG1L/bPJaMIjS5b
         MN4K0NFpPSzhHZle6xvjS78KQUF4PYHONmtyQXNUHyTm+50LxIyjXVjDmQraVl/ovcOd
         1oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Ybt0k9RlDS+Cob3c2Nri6i6agmQS6h2yDd5CaRARZY=;
        b=OD8bMNiVfKJNasEWXeJNl++71Psdn9gB2Bv1m+WbshywssoP3KK0Db2qJCZXv6zeZk
         m/bpXKxHEjxZ/Gum7Bhb9awOXSLf+ooef2ln6IzVwwGYL5SbOuJ6rRfJyuRH69LlkOcg
         mVfHzm0pTsO7uucRp8eA8ZrVLL2gGmds4L7/MhpgjkzEp61GnZz1ek7/jGAVpgbBKyvR
         da7dFEhCdbgcul3ui53DnNG4jFVsLhPn7gQ+jZO3t+AbYmd7ud47X3kw9umvufzpCzYF
         uJHPa6Ah4nth7FR6c4UTHmPlgXj2/qxTztjnsAvBdSekx1rMsbsVAt8Av56fdRgZnigM
         7qZw==
X-Gm-Message-State: AOAM532MjuLsWUa2cnbY+tiCDPo4I2WR3Nk0bCOqiT6AyxrTI9M5dYMv
	FnJufnpLxxuoc5AJWBrnTEKI3zz6DryFzJ+NovdmGQ==
X-Google-Smtp-Source: ABdhPJxi8USaiUwY4CgwkWfCUhokIDE1YzoofShfAp1LRspAuGEBeBTnMRLYe521dkaOddBXzuDZf6vGupiBNeTmed0=
X-Received: by 2002:a05:6000:12c3:b0:203:e0e0:7d18 with SMTP id
 l3-20020a05600012c300b00203e0e07d18mr2128487wrx.46.1648691964765; Wed, 30 Mar
 2022 18:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220330234528.1426991-1-nathan@kernel.org> <20220330234528.1426991-2-nathan@kernel.org>
In-Reply-To: <20220330234528.1426991-2-nathan@kernel.org>
From: David Gow <davidgow@google.com>
Date: Thu, 31 Mar 2022 09:59:13 +0800
Message-ID: <CABVgOSk+qM8o5okFG=BbshQq_gSh5dGvy99sqjOAznHDJ3BxqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Remove '-mno-global-merge'
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Kees Cook <keescook@chromium.org>, 
	linux-kbuild@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, 
	llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 7:46 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This flag is specific to clang, where it is only used by the 32-bit and
> 64-bit ARM backends. In certain situations, the presence of this flag
> will cause a warning, as shown by commit 6580c5c18fb3 ("um: clang: Strip
> out -mno-global-merge from USER_CFLAGS").
>
> Since commit 61163efae020 ("kbuild: LLVMLinux: Add Kbuild support for
> building kernel with Clang") that added this flag back in 2014, there
> have been quite a few changes to the GlobalMerge pass in LLVM. Building
> several different ARCH=arm and ARCH=arm64 configurations with LLVM 11
> (minimum) and 15 (current main version) with this flag removed (i.e.,
> with the default of '-mglobal-merge') reveals no modpost warnings, so it
> is likely that the issue noted in the comment is no longer relevant due
> to changes in LLVM or modpost, meaning this flag can be removed.
>
> If any new warnings show up that are a result of the removal of this
> flag, it can be added back under arch/arm{,64}/Makefile to avoid
> warnings on other architectures.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

This seems to work fine here under the KUnit tooling, with both x86_64
and arm64. That admittedly doesn't do anything with modules, so
wouldn't reveal any of those issues, but at least the warnings about
--mno-global-merge existing remain gone.

Tested-by: David Gow <davidgow@google.com>

Cheers,
-- David
