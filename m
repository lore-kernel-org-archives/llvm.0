Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D542C99
	for <llvm@lists.linux.dev>; Thu,  4 Nov 2021 23:30:00 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id y26so15094586lfa.11
        for <llvm@lists.linux.dev>; Thu, 04 Nov 2021 16:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fwKpNt7ymTVCYOYWKlB8RE2BRmpgEI+Zd0SnTr489iM=;
        b=aeCLODg8lQVcApwUPT8C1pmcAbVwwb/el05kFi7evy79R6sHu2k++aDajKhhITDEFC
         KuzahGktT5SEBgkJK9HRi2MNjfOSNVqv/SkTA47KIiA1RFmxhpnNRVTBCMuHNEsexeaf
         NkRwDEBBgXLJ4BImz+E96ODpQL7Iy2+03Ewh7mD9bFQJpUG9O1++zDAmHb3Qi9JAwc1x
         OkHsY/E+k8cO2L9acTaKJ1IyIhZguoYv+oorD+66/CLSQl+buh53vFV5tItoavsh1JY1
         qqqpbOjrsNfOfip8THdpy+ZPLnFwWa5uV/hyxt+P6KYV+8+CsWMGRGpJx8rnG51z7RK0
         ebFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fwKpNt7ymTVCYOYWKlB8RE2BRmpgEI+Zd0SnTr489iM=;
        b=yfW9ki2tO3BGio5GgZ0CfRZYorDUGh5/WmcMiEFTunzvRCKqLoP8yJUBghM95pjsLZ
         em3uex17oqk+ewoT099CFovdYiFdqHoDeAh4oAc1uDncoWFGRqFGITQMyM+JWmp2neij
         kGH6/xiHZ5iiNmIlbi23hj/acqppfFjPyziGLB+UOlxRt2Ii++wPCv4y8IcNELfaIgiv
         67MYU7Qh6UoLvptM2iq4kUo5QTVqm5HljWzFmzAYT1heZcXMKfb3c2GQ7OZN1OMDkTWZ
         EyXWzQd+6peUvm6DxsIMb5oamo6w+nTkmR7aCOok3RLSo67+fdelWtSBwrmOW7GIKvOJ
         zucA==
X-Gm-Message-State: AOAM530sz5VVfgOC4OQkRLTSkD+B1PbgCyGMR29jRMi+w5FWr1eAdYTB
	XqKwz58qLTaPZxokCdW71JylsSUnAhwYbViosp/BHA==
X-Google-Smtp-Source: ABdhPJzXujdnfYIpOoFeoMfQqcklk8MTvBKtdbpyFrShxWjlxGSrEJuTo3PT16+HpGWZfgfDULuP9PSuDOT1t1Sih3I=
X-Received: by 2002:a05:6512:b29:: with SMTP id w41mr49675962lfu.240.1636068598804;
 Thu, 04 Nov 2021 16:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211104215923.719785-1-nathan@kernel.org>
In-Reply-To: <20211104215923.719785-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 4 Nov 2021 16:29:46 -0700
Message-ID: <CAKwvOdnBv8LcxvVYJKacL7eUXAoGVfnQp7TAL_r+P8V0WcOq1Q@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc2: hcd_queue: Fix use of floating point literal
To: Nathan Chancellor <nathan@kernel.org>
Cc: Minas Harutyunyan <hminas@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021 at 2:59 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A new commit in LLVM causes an error on the use of 'long double' when
> '-mno-x87' is used, which the kernel does through an alias,
> '-mno-80387' (see the LLVM commit below for more details around why it
> does this).
>
>  drivers/usb/dwc2/hcd_queue.c:1744:25: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux-gnu' does not support it
>                          delay = ktime_set(0, DWC2_RETRY_WAIT_DELAY);
>                                              ^
>  drivers/usb/dwc2/hcd_queue.c:62:34: note: expanded from macro 'DWC2_RETRY_WAIT_DELAY'
>  #define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
>                                  ^
>  1 error generated.
>
> This happens due to the use of a 'long double' literal. The 'E6' part of
> '1E6L' causes the literal to be a 'double' then the 'L' suffix promotes
> it to 'long double'.
>
> There is no visible reason for a floating point value in this driver, as
> the value is only used as a parameter to a function that expects an
> integer type.  Use USEC_PER_SEC, which is the same integer value as
> '1E6L', to avoid changing functionality but fix the error.
>
> Fixes: 6ed30a7d8ec2 ("usb: dwc2: host: use hrtimer for NAK retries")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1497
> Link: https://github.com/llvm/llvm-project/commit/a8083d42b1c346e21623a1d36d1f0cadd7801d83
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/usb/dwc2/hcd_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
> index 89a788326c56..bdf1927e1be1 100644
> --- a/drivers/usb/dwc2/hcd_queue.c
> +++ b/drivers/usb/dwc2/hcd_queue.c
> @@ -59,7 +59,7 @@
>  #define DWC2_UNRESERVE_DELAY (msecs_to_jiffies(5))
>
>  /* If we get a NAK, wait this long before retrying */
> -#define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
> +#define DWC2_RETRY_WAIT_DELAY (1 * USEC_PER_SEC)
>
>  /**
>   * dwc2_periodic_channel_available() - Checks that a channel is available for a
>
> base-commit: d4439a1189f93d0ac1eaf0197db8e6b3e197d5c7
> --
> 2.34.0.rc0
>


-- 
Thanks,
~Nick Desaulniers
