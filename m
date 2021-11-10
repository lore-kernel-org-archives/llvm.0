Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E56372
	for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 20:09:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id p16so8785189lfa.2
        for <llvm@lists.linux.dev>; Wed, 10 Nov 2021 12:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=00x68YJ2x4xVsec0dOpuJh55/HKY/Kh+2U/BGdfsf1Q=;
        b=cMqbSJKg3qxVw3peYwsclKf0J6UCOPkoa+aWA8rG5txwG0c4Y6hTlI8M8mG/UVj39j
         ruueogZTvPJQD6/U+xIHXTYmwu9OSc69VrL57h2cGM0Ifu11QSEYpEwhSU45pbH3oXUM
         SFvllwF1g7nkYdblB6zZOal3Vhy195Vv27OJwVrJM6EaGgv6BQD4rn4itkjb+FxiV/74
         s2CCFRwq76gtLAc0QHdj3FsdHtrSYCvhyT+WJG2od4uLFnQhCFZtaQWRbGSv+WwAhwHu
         WN44mBTo8aSZgA8q21MrtLXrpYnTHviFbQKaaqHTn+tcm/otuIU7U7kZVRa864HmB9iL
         0lWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=00x68YJ2x4xVsec0dOpuJh55/HKY/Kh+2U/BGdfsf1Q=;
        b=lbtxVMd/yAezQpEbzUxET1ajHzJj2mg7Y6mTs/OcXOuVjpNE6DW6aZLppQKj+WRBkD
         9LiW2hRdloyQHGCBT1wto1zcYLxjvy1icsxwzVm4TLKFS7D6o352x1dqSlJ+T8Pm6nHo
         YQPUPSpIqEGWQR70pB8lU2mE0p0mkhanb207Wy+s3iwnyIFx8h4/YtW7KaHKqZDwOs9S
         qh3kh6SqhNXdG1RS71K1624bVhc3nGrmpVW8BHZq9aEHG2oXjVR1TGa/px+vJFqn1On6
         s5aTHHzDxRV+HgqxeXXYqG4pLhZAbTZZGn/6QZn5OhLsK1Djn6C+jCSh0Hsu7ecGMGyy
         OGkg==
X-Gm-Message-State: AOAM533+JCMclN+0C0oofzgabcjSAwBcVgusCOp/8c6MG1rdCAru8F4n
	LVNZC80zS9t4RsOUpYAn3WXKjdAswVRaQ6CVQ1t3Ag==
X-Google-Smtp-Source: ABdhPJyT/wr//p2Nn+W3WcilQKAdqjpq4N7/38Ue/cFfN6ynx6DLK6GrO+vauBVcPHNm8RQI7TrE8+Qw3320smkxI50=
X-Received: by 2002:a05:6512:3b9c:: with SMTP id g28mr1625162lfv.651.1636574991415;
 Wed, 10 Nov 2021 12:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK8P3a3ZuL9TQbj+tGkdvRRmEv_jT3OvzmaoFKHwdw=5J1w_SA@mail.gmail.com>
 <20211110180359.2338349-1-anders.roxell@linaro.org>
In-Reply-To: <20211110180359.2338349-1-anders.roxell@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 10 Nov 2021 12:09:40 -0800
Message-ID: <CAKwvOdkoKvjecTfxbRwZ=BYirvy-Jq64pHtHuct8oWgExv1xPw@mail.gmail.com>
Subject: Re: [PATCHv2] selftests: timens: exec: use 'labs()' over 'abs()'
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, nathan@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 10, 2021 at 10:04 AM Anders Roxell <anders.roxell@linaro.org> wrote:
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
>
> Rework to store the time difference in a 'long long' and pass that to
> llabs(), since the variable can be an 'int', 'long' or 'long long'
> depending on the architecture and C library.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  tools/testing/selftests/timens/exec.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/timens/exec.c b/tools/testing/selftests/timens/exec.c
> index e40dc5be2f66..04439e6ac8a2 100644
> --- a/tools/testing/selftests/timens/exec.c
> +++ b/tools/testing/selftests/timens/exec.c
> @@ -21,6 +21,7 @@
>  int main(int argc, char *argv[])
>  {
>         struct timespec now, tst;
> +       long long timediff;
>         int status, i;
>         pid_t pid;
>
> @@ -30,7 +31,8 @@ int main(int argc, char *argv[])
>
>                 for (i = 0; i < 2; i++) {
>                         _gettime(CLOCK_MONOTONIC, &tst, i);
> -                       if (abs(tst.tv_sec - now.tv_sec) > 5)
> +                       timediff = tst.tv_sec - now.tv_sec;
> +                       if (llabs(timediff) > 5)
>                                 return pr_fail("%ld %ld\n", now.tv_sec, tst.tv_sec);
>                 }
>                 return 0;
> @@ -50,7 +52,8 @@ int main(int argc, char *argv[])
>
>         for (i = 0; i < 2; i++) {
>                 _gettime(CLOCK_MONOTONIC, &tst, i);
> -               if (abs(tst.tv_sec - now.tv_sec) > 5)
> +               timediff = tst.tv_sec - now.tv_sec;
> +               if (llabs(timediff) > 5)
>                         return pr_fail("%ld %ld\n",
>                                         now.tv_sec, tst.tv_sec);
>         }
> @@ -70,7 +73,8 @@ int main(int argc, char *argv[])
>                 /* Check that a child process is in the new timens. */
>                 for (i = 0; i < 2; i++) {
>                         _gettime(CLOCK_MONOTONIC, &tst, i);
> -                       if (abs(tst.tv_sec - now.tv_sec - OFFSET) > 5)
> +                       timediff = tst.tv_sec - now.tv_sec - OFFSET;
> +                       if (llabs(timediff) > 5)
>                                 return pr_fail("%ld %ld\n",
>                                                 now.tv_sec + OFFSET, tst.tv_sec);
>                 }
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
