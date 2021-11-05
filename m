Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D662C9D
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:27:02 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id v23so16881536ljk.5
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3wyUo/ZQtCQyVodL9pugyYugqUauw4Uj0CoamGRaoTo=;
        b=jDVwGOof8/gm/IIUo7XhzEjXEtnollc06Ebj3pcM+qgJ3GUFaKtvAHx5MtjHxwLSh7
         RqVxjAMaKz7jc3OnM33zlboH5YsD3D0dlSufzoc9KmJ4MCY0X7fu4xuo5UMJmmkWgA5X
         jM+TNwOVDhcOmez5CXM0vck43rEdQQ5YLqx21u342gnRHhpvwiWbsBO8Vj82mBgrvl2m
         Lq90Gxff2LKTw9L/BmpkKg21+Bp2ADNb9LhC1V2B7PWkp405StxP7Ax3XYodwwa9+O4s
         iIq307MIXAeGJX2svn0y+u8SO4VVcF/SbR4oryd52a4pitv21E4htnP31gP9R25jU00A
         rZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3wyUo/ZQtCQyVodL9pugyYugqUauw4Uj0CoamGRaoTo=;
        b=ZMADnAgifIht22NLsRe3zRQMwzp1eL0Tlha9ZfHrLgcrLYT4b796pcd9cJ/IahE0uV
         NA/bXipiDh9cgt54NzLE2HWNqIaHnJxtdyu2FVU8/lLgO7jeh5MI0NLtVRNUQv1zScZn
         FUaBniCB2Joh7KBATbdoIPFmjBykpdV4v9fhWgGn7g36nr9OPPQPjCVzf9xizTcwEMK4
         HrnrJXmKtiXi5KDM3to+N5MAItXhSVcTS+SxZkx9DM8yMpTPbchfrGzSoKofIMomobiF
         ZuQL+pes7uoXxEuU0sVrQcFAdQmfo01Injsfj/BJuGgLRk46to/fEWnD38e+KGmpRKqV
         6Oqg==
X-Gm-Message-State: AOAM530c+P+MnUV6GvIUr8JgV6wpxSeKL5Ti+2kDifUVhyli0yH7YwhY
	9IJ1gMUpzeXbCRw5SA1Tqck1lSvITV8tDv4aCnLmF4CSkzs=
X-Google-Smtp-Source: ABdhPJyeR/MQfc6Wj3DYsKJsPEiSVQY5rZ/UIDydLAnjBCIuEikkBi11cb68jlY8MjNhmB8Vdb1+AQZeA2azlXDwqv8=
X-Received: by 2002:a2e:750e:: with SMTP id q14mr64381888ljc.338.1636144020678;
 Fri, 05 Nov 2021 13:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105163137.3324344-1-anders.roxell@linaro.org>
In-Reply-To: <20211105163137.3324344-1-anders.roxell@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:26:49 -0700
Message-ID: <CAKwvOdnge-hBmoFH-CHZmbh7DTq8bQiyhbfEOWkBt447=e6QGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests: timens: use 'llabs()' over 'abs()'
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, nathan@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:31 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building selftests/timens with clang, the compiler warn about the
> function abs() see below:
>
> timerfd.c:64:7: error: absolute value function 'abs' given an argument of type 'long long' but has parameter of type 'int' which may cause truncation of value [-Werror,-Wabsolute-value]
>                 if (abs(elapsed - 3600) > 60) {
>                     ^
> timerfd.c:64:7: note: use function 'llabs' instead
>                 if (abs(elapsed - 3600) > 60) {
>                     ^~~
>                     llabs
>
> The note indicates what to do, Rework to use the function 'llabs()'.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  tools/testing/selftests/timens/timer.c   | 2 +-
>  tools/testing/selftests/timens/timerfd.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/timens/timer.c b/tools/testing/selftests/timens/timer.c
> index 5e7f0051bd7b..5b939f59dfa4 100644
> --- a/tools/testing/selftests/timens/timer.c
> +++ b/tools/testing/selftests/timens/timer.c
> @@ -56,7 +56,7 @@ int run_test(int clockid, struct timespec now)
>                         return pr_perror("timerfd_gettime");
>
>                 elapsed = new_value.it_value.tv_sec;
> -               if (abs(elapsed - 3600) > 60) {
> +               if (llabs(elapsed - 3600) > 60) {
>                         ksft_test_result_fail("clockid: %d elapsed: %lld\n",
>                                               clockid, elapsed);
>                         return 1;
> diff --git a/tools/testing/selftests/timens/timerfd.c b/tools/testing/selftests/timens/timerfd.c
> index 9edd43d6b2c1..a4196bbd6e33 100644
> --- a/tools/testing/selftests/timens/timerfd.c
> +++ b/tools/testing/selftests/timens/timerfd.c
> @@ -61,7 +61,7 @@ int run_test(int clockid, struct timespec now)
>                         return pr_perror("timerfd_gettime(%d)", clockid);
>
>                 elapsed = new_value.it_value.tv_sec;
> -               if (abs(elapsed - 3600) > 60) {
> +               if (llabs(elapsed - 3600) > 60) {
>                         ksft_test_result_fail("clockid: %d elapsed: %lld\n",
>                                               clockid, elapsed);
>                         return 1;
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
