Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5151E9E4
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 22:05:14 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso3067179pjc.5
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 14:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a34ppdWbivNAxs0hZgRllXVIJs8hvYA2VZe5Kyhs1OM=;
        b=P6vqEdFmeiejzHVbCjsfMpsQ29zuzTvwlvxMocFOI12tWCjBgBJRuRlA+3jh1ZXKMJ
         pKwCFuHwJg0GAlwoZUSh+uPcDwx6PD7PMLM78itRlOqjv9aJ6DEiluMK2qYiBzIXn4ff
         hPrcfEgTfO6Vnm2bGWzIyCbABoCOD/OOkD0GKHd8QfQaiX2UXizd45S+gUzReYaIso5K
         +6EFD/K2fB668OQhEkpkTtm8DdTAcVBLQxxxLCfPnFsQ9BpxubAIuD9RGxjUG96z2hvs
         C1sBF2PRjlxLQuF8ilQGh7Z8EhhwqXBhoEY5b76cHp7gHNRdprJR//0/dKheg/k4/s7U
         AYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a34ppdWbivNAxs0hZgRllXVIJs8hvYA2VZe5Kyhs1OM=;
        b=LA+9Vml4lHXE6iaFepzEu0omhvrMNoZukOZwQodeffL+3SwRZTvEWRX5tA/kx6591H
         vAwQYyKP1rSM987bBtQNOUjowN5TDG7D2t0a86yxwzMGroWZ1OvqTiCq2C7xBa5JAirn
         47iIy+JOKSH6FyD38AdTHdPqBULJP7y6dIJiOfOk8HHcFzWGfy7aEl83RhS7+nshetRv
         zNjky3/asRgLMPwJ+IYNLloyvJv2MyMOYdCLx6yNJ+v8I0w+6VYxJp0/Rsl6gH7xfs8h
         cmHhTbu8a57ZYi7jzbHMlQUWb7PTqBGBLiD1Tr1xD4d2Tpd2Fu0oaq8TCAh5ybPgSIj8
         kdng==
X-Gm-Message-State: ACrzQf3Myv4gI6kR5CXcrMPtYZKIdYBf3RwRhBWhRcH2Fh35lzKJRTbh
	iN6AfhJ3v5uP1leZBwg8Qd0nve1LaniI/qT4twMSzQ==
X-Google-Smtp-Source: AMsMyM5GZRwbXU2IPHXYp9E6tIoCnNMxsz/56yVCJT0f0ThtNxVVkvDuqpCVob8hLMLuQlSbW/bMatrnBQRCNPQoQx4=
X-Received: by 2002:a17:902:7b98:b0:186:8558:ded2 with SMTP id
 w24-20020a1709027b9800b001868558ded2mr2238985pll.95.1668117913389; Thu, 10
 Nov 2022 14:05:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221108170103.3375832-1-nathan@kernel.org>
In-Reply-To: <20221108170103.3375832-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Nov 2022 14:05:01 -0800
Message-ID: <CAKwvOdkzs3YrtE9MWMOF=ssxx_9gdXWak06OEcJhHr5z+j0mqg@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: ACPI: Remove unused variables
 'acpi_cpufreq_online' and 'ret'
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Tom Rix <trix@redhat.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 8, 2022 at 9:01 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   drivers/cpufreq/acpi-cpufreq.c:970:24: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>           acpi_cpufreq_online = ret;
>                                 ^~~
>   drivers/cpufreq/acpi-cpufreq.c:960:9: note: initialize the variable 'ret' to silence this warning
>           int ret;
>                 ^
>                   = 0
>   1 error generated.
>
> Both ret and acpi_cpufreq_online are now unused so they can be safely
> removed, clearing up the warning.
>
> Fixes: 13fdbc8b8da6 ("cpufreq: ACPI: Defer setting boost MSRs")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1757
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/cpufreq/acpi-cpufreq.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
> index c8fdfcf659e6..74ef0e05ff7b 100644
> --- a/drivers/cpufreq/acpi-cpufreq.c
> +++ b/drivers/cpufreq/acpi-cpufreq.c
> @@ -953,12 +953,8 @@ static struct cpufreq_driver acpi_cpufreq_driver = {
>         .attr           = acpi_cpufreq_attr,
>  };
>
> -static enum cpuhp_state acpi_cpufreq_online;
> -
>  static void __init acpi_cpufreq_boost_init(void)
>  {
> -       int ret;
> -
>         if (!(boot_cpu_has(X86_FEATURE_CPB) || boot_cpu_has(X86_FEATURE_IDA))) {
>                 pr_debug("Boost capabilities not present in the processor\n");
>                 return;
> @@ -966,8 +962,6 @@ static void __init acpi_cpufreq_boost_init(void)
>
>         acpi_cpufreq_driver.set_boost = set_boost;
>         acpi_cpufreq_driver.boost_enabled = boost_state(0);
> -
> -       acpi_cpufreq_online = ret;
>  }
>
>  static int __init acpi_cpufreq_init(void)
>
> base-commit: 21cdb6c18f85fe538ca8740bc79f11fbe08d0197
> --
> 2.38.1
>


-- 
Thanks,
~Nick Desaulniers
