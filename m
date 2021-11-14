Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAD2C81
	for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 21:25:51 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b15so62557691edd.7
        for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tZSSynsKcz8SQQ9wlQiwyLd1LjN5A0/Q7Az2vBog8fs=;
        b=f/viiwPOa9QV59R4dkB8sPRey//vAi2MFsdmXxOnQDPgzBE5u6TsL8/xevZYp8DEoj
         E9DBrfwFkIxLTkn+Ciwp2Pk5aalk/Tl6op7yjcFs+9R219irGePGGHcCsQImGNUgixv8
         J51bTeoO3LyQrNlcHCfVtoFUoRdWd7B/iriEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tZSSynsKcz8SQQ9wlQiwyLd1LjN5A0/Q7Az2vBog8fs=;
        b=MMMB182FIuHk9IzerXPYz/csRY9sQY0qE8wk+cKBZZ5QnFlVPNovfLYzXZ2RhEvhA+
         Io4kx6BQS0N7XPwTt5ClRwhORfiiTzy9pkzG+fy1mMA7JcsDWXPhD5/ZnurcsQbvir+u
         7Rz9Mo2RgOMgKBeieadzhZKqZyAglXOH2TbqkkquCD0gy7uS+VY9CfOZsPAoWO/NVvWh
         GyJ56pfeksUmUss6jnTMg1ZB3g45gEMOlyZfpUVtZHbi57robYe8jwNLFnZGWDeX3WIR
         c9Aaqrb70kmAMVLsMya0kvETa2aRU/IO12hbcxiHawucrZ+P35l7mP8FLw3LxXFrZabc
         cQTg==
X-Gm-Message-State: AOAM533zfLGo6SwygBXhL8NNSIrc9TiGjLO/euct8k1chVahz1lQjRRQ
	bJzOGGsVI71iiX8cd/HRw04ru1Wn+1wX+Y77
X-Google-Smtp-Source: ABdhPJyb/hGpMOWnWLj+JrGI9r4KazoqOT+w3ZKFX6Bns4OL7MVi6USQRDOGqNhxvRlKVWRHRzIO7A==
X-Received: by 2002:a17:907:72c9:: with SMTP id du9mr41924488ejc.37.1636925149672;
        Sun, 14 Nov 2021 13:25:49 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id b11sm6471248ede.52.2021.11.14.13.25.48
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 13:25:48 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id y84-20020a1c7d57000000b00330cb84834fso14213727wmc.2
        for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 13:25:48 -0800 (PST)
X-Received: by 2002:a1c:7405:: with SMTP id p5mr51964221wmc.152.1636925148688;
 Sun, 14 Nov 2021 13:25:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211114005725.GA27075@embeddedor> <YZF9MY6rRLQwdTgM@archlinux-ax161>
In-Reply-To: <YZF9MY6rRLQwdTgM@archlinux-ax161>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Nov 2021 13:25:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgqEfw1wFcj98VxyvnoDsUhmYm_P_KuFOpEWe5zmYAp1w@mail.gmail.com>
Message-ID: <CAHk-=wgqEfw1wFcj98VxyvnoDsUhmYm_P_KuFOpEWe5zmYAp1w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add support for -Wimplicit-fallthrough
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 14, 2021 at 1:18 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> It feels a little odd to have this in Kconfig but if it works and gets
> the warning enabled, then so be it.

We've actually been actively moving more and more of the compiler
flags configuration to Kconfig time.

The Kconfig language makes it fairly easy and natural to do these
days, and in some cases the compiler flags end up having a number of
other dependencies (not in this case, but look at things like
CC_HAS_KASAN_GENERIC etc, where the existence of some compiler flag
ends up then also affecting whether other options can be enabled).

So the whole "move it to config time" ends up being the direction
we've been going, and the only really unusual case here is that it
ends up being done as a string config rather than as a boolean.

And that's just because the different compilers also have different
flags in this case ;(

              Linus
