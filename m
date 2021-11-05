Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B092C96
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:35:52 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id d23so16874280ljj.10
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9qbelhhsw3oFrUlIgF9/qeZ03Ntzp3KJEfhun8kseA=;
        b=AusmWqPzUH3kaoEHyvmF0MYkCUsUGWRicOXc055M3GVFviwOU4QPIwlu9uVIDJaOQP
         qvwAGqnVFgJ2mYDBj3nDfHUl1Rmq11m/Vq/NFprESDAKrSoJFtr8ftNZtpOzoHMnUR2p
         cVVLYytSUHqmPQ8vkYLjbYEvMWjh0Ft/9lvYfyMsauOEdYy/Vy/xrnHS+7U8BHdrXnpr
         1CyD14Qiw48hreUk94QwKKW5V3OkJjPuwAmobKm1QFRNYFWa69bo0Q3PLwRT3bqo9YIV
         MUEHh9L9Dg/s0vb04siBjet2Xvjw9vOhdtK9tyrN4wr8JdlHG6Zsrbgq8lipIqKGzYeE
         yTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9qbelhhsw3oFrUlIgF9/qeZ03Ntzp3KJEfhun8kseA=;
        b=PSjIINkaDsRhlXta1tpb+kmlMU0kovt2qWPjQAdMG3ykeEHzh5Lx41EwH/8GMg1nLN
         IxuwzTSg4UjFqqWrVDoYEZLwkf5i4Ucls71zven86iub4Ex5WGuEPLvIp4TI+BLLYR8h
         9s5BlQo8IkdZRa0Xr6h5vTemSG+AXhhhTSG3d+I7Ib7FNV2xP7W61Af2Bvyy4M6nJo83
         2cb0LZfUfeuXOuipNi/jiUz6thy64s9pjtQ+HF4smKo1RNu1JMP/rI9hAIhaRUo5/VzP
         UPRh+RMe079Kl8nd1qL3ntnj9iXvolgphqzJ37WVFdJGANnCinfdFB/A6V7bwWgJhaYk
         Z5Jw==
X-Gm-Message-State: AOAM533hpIV4zTA8CyD7b7sseR5frFQ7E9hIrV2Yyty0oLpPG+wLEoIg
	ZOEMp+vkMUKmsvxXbUpd1ov3KrfWcJ5hlJlQChxUNw==
X-Google-Smtp-Source: ABdhPJySLtWybIH3YPm9dxDIImgkKHXCgX75l5eN7Z7plkjpTrw1p3bbL/SBU4FYmCJSNfLg2rH5/OiyjSAnEzLhgyo=
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr1807937ljj.128.1636144550723;
 Fri, 05 Nov 2021 13:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105163137.3324344-1-anders.roxell@linaro.org> <20211105163137.3324344-2-anders.roxell@linaro.org>
In-Reply-To: <20211105163137.3324344-2-anders.roxell@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:35:39 -0700
Message-ID: <CAKwvOd=rRntVgYdqEeb=JAYo2iC-wVB3dkQWNvwdZdrYgt2s7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: timens: exec: use 'labs()' over 'abs()'
To: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@kernel.org>
Cc: shuah@kernel.org, nathan@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:31 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building selftests/timens with clang, the compiler warn about the
> function abs() see below:
>
> exec.c:33:8: error: absolute value function 'abs' given an argument of type 'long' but has parameter of type 'int' which may cause truncation of value [-Werror,-Wabsolute-value]
>                         if (abs(tst.tv_sec - now.tv_sec) > 5)
>                             ^
> exec.c:33:8: note: use function 'labs' instead
>                         if (abs(tst.tv_sec - now.tv_sec) > 5)
>                             ^~~
>                             labs

Careful.

Isn't the tv_sec member of `struct timespec` a `time_t` which is 32b
on 32b hosts and 64b on 64b hosts? If I'm recalling that correctly,
then this patch results in a harmless (though unnecessary) sign
extension for 32b targets. That should be fine, but someone like Arnd
should triple check if my concern is valid or not.

So I'm in favor of this patch (dispatching to abs or labs based on 64b
host) would hurt readability.

>
> The note indicates what to do, Rework to use the function 'labs()'.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  tools/testing/selftests/timens/exec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/timens/exec.c b/tools/testing/selftests/timens/exec.c
> index e40dc5be2f66..d12ff955de0d 100644
> --- a/tools/testing/selftests/timens/exec.c
> +++ b/tools/testing/selftests/timens/exec.c
> @@ -30,7 +30,7 @@ int main(int argc, char *argv[])
>
>                 for (i = 0; i < 2; i++) {
>                         _gettime(CLOCK_MONOTONIC, &tst, i);
> -                       if (abs(tst.tv_sec - now.tv_sec) > 5)
> +                       if (labs(tst.tv_sec - now.tv_sec) > 5)
>                                 return pr_fail("%ld %ld\n", now.tv_sec, tst.tv_sec);
>                 }
>                 return 0;
> @@ -50,7 +50,7 @@ int main(int argc, char *argv[])
>
>         for (i = 0; i < 2; i++) {
>                 _gettime(CLOCK_MONOTONIC, &tst, i);
> -               if (abs(tst.tv_sec - now.tv_sec) > 5)
> +               if (labs(tst.tv_sec - now.tv_sec) > 5)
>                         return pr_fail("%ld %ld\n",
>                                         now.tv_sec, tst.tv_sec);
>         }
> @@ -70,7 +70,7 @@ int main(int argc, char *argv[])
>                 /* Check that a child process is in the new timens. */
>                 for (i = 0; i < 2; i++) {
>                         _gettime(CLOCK_MONOTONIC, &tst, i);
> -                       if (abs(tst.tv_sec - now.tv_sec - OFFSET) > 5)
> +                       if (labs(tst.tv_sec - now.tv_sec - OFFSET) > 5)
>                                 return pr_fail("%ld %ld\n",
>                                                 now.tv_sec + OFFSET, tst.tv_sec);
>                 }
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
