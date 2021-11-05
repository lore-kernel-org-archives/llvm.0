Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2FD2C9D
	for <llvm@lists.linux.dev>; Fri,  5 Nov 2021 20:15:30 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id i26so16818946ljg.7
        for <llvm@lists.linux.dev>; Fri, 05 Nov 2021 13:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqHVphJRsOg0vKmfYa1jZpyPe0YWBaEezxPZReK1I2E=;
        b=q3+yzE4Ow/m3lzoIN5PdiNgUFMQTre/b366H7VJROVrX586YFvc+IpOpRL+A1pvhyC
         7hT0LiAUOMJwChlqcl/K6n31dpkV9ts/wlePBoiCsRsaV1LqAlXVOR/1/WPoo51Rvhcg
         25YUDAfVHtUI0aGA9g0d89LOb62SYS2YcBB1kQi7M61dwdUD+TbLCtvbhgLh0x2e1XyM
         UtWDhCigDX7keyPmOeCyzCrQM1v9girHXVB8oLtgV7YhVsNBRGjpi/ZXiEyU8NNkWyqO
         nuWtoSWyypnCpWS3ZCepa1wAk6daF1uj1hm/+E8zU9Sot8GUO0ELieZQ+rsibt7Ssski
         mkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqHVphJRsOg0vKmfYa1jZpyPe0YWBaEezxPZReK1I2E=;
        b=wYJSwGSI1Og6AYeuPcKnjAtIkveczoIZ043DchP7lqrplQm7OnxBaC4tVHvYgDF7iY
         KEi6O/9zNpAsmj1442p0NUW/a371iS+Por27U3KrNpn+5G6Gqh4qRTtYLtOcq6Q8S54y
         nk5SjedEz8cLlq/GvoMo9vWCW45S4TP3hue7PRaKDb3YrfmhpqmJNtqD+AotMEZw9ob+
         XJ0UQ4gROXxGdzBy93UHf1saOyzmGXYj/EWnARDDRfnhhhFCDjYvEwMArtGgzdAQ1DRx
         7dP97TkI8JVmMKOOJ6Iwpm+ME+jCYROQ/OLUij8xq9HWJDTl4W0VoDEdF5ic+LyH+4pr
         W7aw==
X-Gm-Message-State: AOAM5313hLdgJ7Q37do3e47vAcVsfKGzg2k65XqdT38BgWMmYlklAUWI
	8YFaG6wL5hXbG0lR2HIKyby7hu3Hc2abvKRznchQ/Q==
X-Google-Smtp-Source: ABdhPJwZ2tz6jaVRxkOgVp+jl8s6Gk3iTKD+Q0XS0ogAGfwSz3i/LFHq01irNF29i/MrlLZz7O3KVOKoMYGqjyS7zVw=
X-Received: by 2002:a05:651c:889:: with SMTP id d9mr63754997ljq.198.1636143328368;
 Fri, 05 Nov 2021 13:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211105162530.3307666-1-anders.roxell@linaro.org> <20211105162530.3307666-2-anders.roxell@linaro.org>
In-Reply-To: <20211105162530.3307666-2-anders.roxell@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 Nov 2021 13:15:17 -0700
Message-ID: <CAKwvOd=Qdt7Wd1fL-vhheZjcNonqBaxbJwVamG3Q-eMy+A=2KA@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: cgroup: use function 'labs()' over 'abs()'
To: Anders Roxell <anders.roxell@linaro.org>
Cc: shuah@kernel.org, christian@brauner.io, nathan@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 5, 2021 at 9:25 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When building selftests/cgroup with clang, the compiler warn about the
> function abs() see below:
>
> In file included from test_memcontrol.c:21:
> ./cgroup_util.h:16:9: warning: absolute value function 'abs' given an argument of type 'long' but has parameter of type 'int' which may cause truncation of value [-Wabsolute-value]
>         return abs(a - b) <= (a + b) / 100 * err;
>                ^
> ./cgroup_util.h:16:9: note: use function 'labs' instead
>         return abs(a - b) <= (a + b) / 100 * err;
>                ^~~
>                labs
>
> The note indicates what to do, Rework to use the function 'labs()'.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  tools/testing/selftests/cgroup/cgroup_util.h | 2 +-
>  tools/testing/selftests/cgroup/test_kmem.c   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/cgroup_util.h b/tools/testing/selftests/cgroup/cgroup_util.h
> index 82e59cdf16e7..76b35d9dffb5 100644
> --- a/tools/testing/selftests/cgroup/cgroup_util.h
> +++ b/tools/testing/selftests/cgroup/cgroup_util.h
> @@ -13,7 +13,7 @@
>   */
>  static inline int values_close(long a, long b, int err)
>  {
> -       return abs(a - b) <= (a + b) / 100 * err;
> +       return labs(a - b) <= (a + b) / 100 * err;
>  }
>
>  extern int cg_find_unified_root(char *root, size_t len);
> diff --git a/tools/testing/selftests/cgroup/test_kmem.c b/tools/testing/selftests/cgroup/test_kmem.c
> index 22b31ebb3513..d65bb8fe876a 100644
> --- a/tools/testing/selftests/cgroup/test_kmem.c
> +++ b/tools/testing/selftests/cgroup/test_kmem.c
> @@ -192,7 +192,7 @@ static int test_kmem_memcg_deletion(const char *root)
>                 goto cleanup;
>
>         sum = slab + anon + file + kernel_stack + pagetables + percpu + sock;
> -       if (abs(sum - current) < MAX_VMSTAT_ERROR) {
> +       if (labs(sum - current) < MAX_VMSTAT_ERROR) {
>                 ret = KSFT_PASS;
>         } else {
>                 printf("memory.current = %ld\n", current);
> @@ -383,7 +383,7 @@ static int test_percpu_basic(const char *root)
>         current = cg_read_long(parent, "memory.current");
>         percpu = cg_read_key_long(parent, "memory.stat", "percpu ");
>
> -       if (current > 0 && percpu > 0 && abs(current - percpu) <
> +       if (current > 0 && percpu > 0 && labs(current - percpu) <
>             MAX_VMSTAT_ERROR)
>                 ret = KSFT_PASS;
>         else
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
