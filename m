Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2162C96
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:44:19 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id br12so19260369lfb.8
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=senqiBJkxESggfPiWBCUi5fzLmZvRY+Wca6s+ykrVZE=;
        b=tE/oV/4g9EFoy+oty4gmADvSPhF9RtkrPCM8KYsx7S0ZT1o5JCnEvklXoCI9IxsqcM
         gxMTZRmXUvFzJEl/WJLI1x24ObCKPcy3VSYwr/7RGCco7gZ7o2rGHQ9fRMtJcaI+/a+c
         J66muvNcBHI/5CV205/pLwwEDs/to+O8pIu02srpXcku+Js2urLgtLi4nInfWxRMEEen
         W3kZEEEZiayiOotNfIGjhSssobGAjj/2yUKT9PKfKy6MgWilikRQ4VEzfNA96X5OU7B+
         nmXQsZ2j0TFa8BpMuVlLXIU5pBR/m95t+sWiy+LyqN6jGystPHn97oWU5YMZ6LFT8X/L
         NntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=senqiBJkxESggfPiWBCUi5fzLmZvRY+Wca6s+ykrVZE=;
        b=ZRJW8TZFTAxftGbNMpbUaO6k6QBID1y5YxMr01bwYMmREWI9YAf78LpFD1PMssCN9x
         fDTaxd8vHvKF5UN3oLClgXYridafRV5yMK6Zmcn4tcR1ha4rbiteOcj5pW2lSLJHq9JK
         a7EGxovN+N7D3qCx8J0dK8xa+bSxlWYlkqIegxPYtMAJqTJYyc0HK6CbAJQR9BgTB3wf
         kMK7E9mUWpA7JceL2st1FYFcN9ra4mB9iW9NJ8UBsmJCaAG42Fio6zpvuhTEAa3C2yEm
         A4XPboly4n5vR2VGxn5X+mdZk4lb5/1ChjTxYG+pQfD0lgYG6BJpdyY7yQK731ZyH+9E
         gofQ==
X-Gm-Message-State: AOAM531A1Q1YdYlt4wu7JTFLW7+GxM9VoxNWXyeTz6JDrUwCfidEVCLm
	+n4rPbszZpVGe4ChuRHAbMWbZUn1SH6DyEvSyHZYCQ==
X-Google-Smtp-Source: ABdhPJw7IgaZKzrFcRGOUYu89cL7dGi3eKPzT/JXI7SWHD10+wo4CRxvRI9anjQ1vUxykmf481gYxF1btkhuziSU+UI=
X-Received: by 2002:a05:6512:228a:: with SMTP id f10mr55986163lfu.489.1636145057351;
 Fri, 05 Nov 2021 13:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105163403.3330950-1-anders.roxell@linaro.org>
In-Reply-To: <20211105163403.3330950-1-anders.roxell@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:44:06 -0700
Message-ID: <CAKwvOdn0vEyj-EPJG0e39v-Vq+oLFptV0oXYfzfzuy=HPzSzOA@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: use 'llabs()' over 'abs()'
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, tglx@linutronix.de, john.stultz@linaro.org, 
	nathan@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:34 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building selftests/timers with clang, the compiler warn about the
> function abs() see below:
>
> posix_timers.c:69:6: warning: absolute value function 'abs' given an argument of type 'long long' but has parameter of type 'int' which may cause truncation of value [-Wabsolute-value]
>         if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
>             ^
> posix_timers.c:69:6: note: use function 'llabs' instead
>         if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
>             ^~~
>             llabs
>
> The note indicates what to do, Rework to use the function 'llabs()'.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I wonder why tools/testing/selftests/timers/adjtick.c redefines llabs
when it already includes stdlib.h, and how that doesn't result in some
kind of compiler diagnostic.

> ---
>  tools/testing/selftests/timers/posix_timers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
> index 337424c5c987..73fb27901a1d 100644
> --- a/tools/testing/selftests/timers/posix_timers.c
> +++ b/tools/testing/selftests/timers/posix_timers.c
> @@ -66,7 +66,7 @@ static int check_diff(struct timeval start, struct timeval end)
>         diff = end.tv_usec - start.tv_usec;
>         diff += (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
>
> -       if (abs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
> +       if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
>                 printf("Diff too high: %lld..", diff);
>                 return -1;
>         }
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
