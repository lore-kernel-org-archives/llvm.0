Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8E2C81
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 21:02:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u18so31613380lfd.12
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jI0siKnxYryfR0Wrdx331NbLBs00Z1e/lOmM3iHWBvg=;
        b=FkHJ1+SuGsYHNEnajUrbdjmmenaWDJxK5uswFbuDCEAZAe+L70XBTKeyNh4LDkvWZ1
         h2BmYh8hGU/POVpfrmDBuUc0KWG6gHaAx7iA55l7wCKaumVPrEhCbGWnI00rv3K2jkwH
         XhBcKWk8QVQmDRjijfarw0WgNaaJX65EjuZpkTGCVcSEQFYYPWMpPIPxcri8sD4iJpto
         GcH5SowKvbolFnGTF9RXRWLC8VsJVihgAT4p0tyLbubZqWO+WWk23HMhXgufamoaME5g
         x5HZl0oEesVm+x79xGRaQrjiXZObv3w2HJVFC5G89JUWDeXtgyGmQx31y9UeYo7R6Lhh
         EuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jI0siKnxYryfR0Wrdx331NbLBs00Z1e/lOmM3iHWBvg=;
        b=sKL14MIUk/OB+FmVzGyF531PwAnLVMtuPg1lowGDgkHYs4Mjnu1pvsY6xzuXki7UHF
         VAaBN4ig9QT4fg3hXHmNOWv6Ovq9q4z3WYukLswwRNZJrifuZOxlp1e97BfY5j0oxHaO
         sxYsmdQrLVQQ1JPrvBTbjfKNrRjV6UFLn6ceMrRPRCGas4hyy3cWPNzpfGExFGECxxvs
         Uzenq84ZIaHAXP1g99MzCBJr/uX3OVv+fF0p81S0Xa6pasdyhcKf7y4DPnokxn1Yivuy
         us1vB//5DeYceCEc6+uvIHrxoKiLGdL9K5E5bGjwtpcqpfy35IOGR0sUgzWvgjItQhjA
         JVFw==
X-Gm-Message-State: AOAM531tphWJ0Vct5kPcseMfGdllvm/8KadpgBsPATKzAnzgL0ytKfTW
	KSF/1veXjLad/9yVZpnT26om+6meiuvzW1ONGevIGuPtRn0=
X-Google-Smtp-Source: ABdhPJwTvQTGh1URN6uGWIaDr5yfdMy42ZkRQxPCYN3hB8z7lX/APA5HvogdIqDENmGqBLzJfMcvBeq49Qzc3nHofV0=
X-Received: by 2002:ac2:434c:: with SMTP id o12mr7092282lfl.82.1634245375477;
 Thu, 14 Oct 2021 14:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014205757.3474635-1-nathan@kernel.org>
In-Reply-To: <20211014205757.3474635-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Oct 2021 14:02:43 -0700
Message-ID: <CAKwvOdm1W52TmoU5m-RokN+aZF7w4G0KUu0TcWyircWi63onsA@mail.gmail.com>
Subject: Re: [PATCH] Input: touchscreen - Avoid bitwise vs logical OR warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 1:58 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A new warning in clang points out a few places in this driver where a
> bitwise OR is being used with boolean types:
>
> drivers/input/touchscreen.c:81:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
>         data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This use of a bitwise OR is intentional, as bitwise operations do not
> short circuit, which allows all the calls to touchscreen_get_prop_u32()
> to happen so that the last parameter is initialized while coalescing the
> results of the calls to make a decision after they are all evaluated.
>
> To make this clearer to the compiler, use the '|=' operator to assign
> the result of each touchscreen_get_prop_u32() call to data_present,
> which keeps the meaning of the code the same but makes it obvious that
> every one of these calls is expected to happen.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1472
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/input/touchscreen.c | 42 ++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
> index dd18cb917c4d..4620e20d0190 100644
> --- a/drivers/input/touchscreen.c
> +++ b/drivers/input/touchscreen.c
> @@ -80,27 +80,27 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>
>         data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
>                                                 input_abs_get_min(input, axis_x),
> -                                               &minimum) |
> -                      touchscreen_get_prop_u32(dev, "touchscreen-size-x",
> -                                               input_abs_get_max(input,
> -                                                                 axis_x) + 1,
> -                                               &maximum) |
> -                      touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
> -                                               input_abs_get_fuzz(input, axis_x),
> -                                               &fuzz);
> +                                               &minimum);
> +       data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-x",
> +                                                input_abs_get_max(input,
> +                                                                  axis_x) + 1,
> +                                                &maximum);
> +       data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
> +                                                input_abs_get_fuzz(input, axis_x),
> +                                                &fuzz);
>         if (data_present)
>                 touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
>
>         data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
>                                                 input_abs_get_min(input, axis_y),
> -                                               &minimum) |
> -                      touchscreen_get_prop_u32(dev, "touchscreen-size-y",
> -                                               input_abs_get_max(input,
> -                                                                 axis_y) + 1,
> -                                               &maximum) |
> -                      touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
> -                                               input_abs_get_fuzz(input, axis_y),
> -                                               &fuzz);
> +                                               &minimum);
> +       data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-y",
> +                                                input_abs_get_max(input,
> +                                                                  axis_y) + 1,
> +                                                &maximum);
> +       data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
> +                                                input_abs_get_fuzz(input, axis_y),
> +                                                &fuzz);
>         if (data_present)
>                 touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
>
> @@ -108,11 +108,11 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
>         data_present = touchscreen_get_prop_u32(dev,
>                                                 "touchscreen-max-pressure",
>                                                 input_abs_get_max(input, axis),
> -                                               &maximum) |
> -                      touchscreen_get_prop_u32(dev,
> -                                               "touchscreen-fuzz-pressure",
> -                                               input_abs_get_fuzz(input, axis),
> -                                               &fuzz);
> +                                               &maximum);
> +       data_present |= touchscreen_get_prop_u32(dev,
> +                                                "touchscreen-fuzz-pressure",
> +                                                input_abs_get_fuzz(input, axis),
> +                                                &fuzz);
>         if (data_present)
>                 touchscreen_set_params(input, axis, 0, maximum, fuzz);
>
>
> base-commit: a41392e0877a271007e9209e63c34cab7527eb43
> --
> 2.33.1.637.gf443b226ca
>
>


-- 
Thanks,
~Nick Desaulniers
