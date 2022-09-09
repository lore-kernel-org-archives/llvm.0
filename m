Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3B77E3
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 08:38:57 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id a8so1465124lff.13
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 01:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BZdXdwTdKGe0baQEwZY8VKfE+Zui9u+0KrTmD1YE7Hc=;
        b=ta7vUt+h77XK1nbaY+2lNhiO3rTKLgScRasuIurPBQmFUDsNBKMtBpHOVMJ51ZJAQv
         WFjDrA1m79Tg9yk7WW8ICYI531G0nPm7Ny17zWs0NXcLWh8uVg9eVVEK7WxsruIWYGO4
         H7pu+8sOp7KqlJG3nW83gMdCt3exqVE+nLChtw+pMCCV4+nR4PHKeTDKr9HWoqJ2FniA
         pH09KU/Dm0kvXxFL8vBmSTROyllKS4Ud0VwpzBvREHb53P0HtvuCsexxdIm8nc2wE0G4
         5mK7uDvL66SzYpO3P5aT66pY7EP0HskmVY9qcNJdA5qh4Wyk09LNjU6AlexmzTMuWC5C
         TUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BZdXdwTdKGe0baQEwZY8VKfE+Zui9u+0KrTmD1YE7Hc=;
        b=3TwMNmmYjARd++oSsw4Sv0HlrASbr3Fr0u9xQ3Z9Ym1Y73Js3xBvtlY7sAykwP6Boe
         DvPJs2s0EZhwPcEso/Uok+cNbaNLt2eH5BMzTvlIDfdtB5S6uFVEdGRtXRF+x0A63nQh
         sXUXCgCUdWt1cCvf3zKWELcfYrooG5en7AFoMSl6Jc6ELXih142KQF8POq3mLhKzVyCH
         c4uREzRSUaD5N80r4xlmwoEwB4x4VDWCowvv1jBLesc4t6sFDlI9VXeUksuUZ8K8eNoq
         Fg6A8ZUJ1JDSNKJuGCnEUcvwffdZYcI2nHVr66g1FDwOaZOaIUwYF/tPLvX7ThFL9lHs
         TvAA==
X-Gm-Message-State: ACgBeo2HEF69a5g+uBPE5E6b1eGyqdPZiQ4GrBticcQleVrY6opdcQx+
	O1BRP0CFX7aptNRiUrwk247JKSnG0SZkm4e97dop1A==
X-Google-Smtp-Source: AA6agR4e9oWULjRziRq6BJvzm03afAE7CthF2BBKMgyNC0AoRlZQbNF5PpM8IXTvogSdIcHPvp6WSzcAKJtRkBHidYw=
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id
 g11-20020a056512118b00b00492e3c4a164mr4400289lfr.598.1662712735864; Fri, 09
 Sep 2022 01:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909073840.45349-1-elver@google.com> <20220909073840.45349-3-elver@google.com>
In-Reply-To: <20220909073840.45349-3-elver@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 9 Sep 2022 10:38:44 +0200
Message-ID: <CACT4Y+ZJXS0Hcj4D-O+KfXT0SJ9pUhEx=zDqhwgOa9Pz2te0KQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] objtool, kcsan: Add volatile read/write
 instrumentation to whitelist
To: Marco Elver <elver@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Sept 2022 at 09:38, Marco Elver <elver@google.com> wrote:
>
> Adds KCSAN's volatile instrumentation to objtool's uaccess whitelist.
>
> Recent kernel change have shown that this was missing from the uaccess
> whitelist (since the first upstreamed version of KCSAN):
>
>   mm/gup.o: warning: objtool: fault_in_readable+0x101: call to __tsan_volatile_write1() with UACCESS enabled
>
> Fixes: 75d75b7a4d54 ("kcsan: Support distinguishing volatile accesses")
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
> v2:
> * Fix commit message.
> ---
>  tools/objtool/check.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index e55fdf952a3a..67afdce3421f 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -999,6 +999,16 @@ static const char *uaccess_safe_builtin[] = {
>         "__tsan_read_write4",
>         "__tsan_read_write8",
>         "__tsan_read_write16",
> +       "__tsan_volatile_read1",
> +       "__tsan_volatile_read2",
> +       "__tsan_volatile_read4",
> +       "__tsan_volatile_read8",
> +       "__tsan_volatile_read16",
> +       "__tsan_volatile_write1",
> +       "__tsan_volatile_write2",
> +       "__tsan_volatile_write4",
> +       "__tsan_volatile_write8",
> +       "__tsan_volatile_write16",
>         "__tsan_atomic8_load",
>         "__tsan_atomic16_load",
>         "__tsan_atomic32_load",
> --
> 2.37.2.789.g6183377224-goog
>
