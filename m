Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C272F26
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 19:45:07 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id k18so9215637lji.12
        for <llvm@lists.linux.dev>; Mon, 07 Feb 2022 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZDpDADdfwq40jZPbE/sznh7Bnymle3eu2MsiKyAnHI=;
        b=BdiDafPxAfgT1LadX6/qdSNo8n3l0Xa/GtCJEktDJMXEmp52SrE42F60zh+yNtgnej
         uafnZUT8MJqOawyMYksVSqsD8w5zXATUGodDDaf2n0OSYIP77vOHkN1WwPFv0stLOa78
         +4ATpfopW4dS5hdH2p54SyosNF1m7zjr8r+2YE4GWs0neqc92bzF3dIJD7hE8cA0PJPs
         kQu1XjE348Lq3znmdTjfrSq9FD04iuxmobdD48LoM7k4xW51/uiPDMkZVxL359FVEki8
         6hN3NzqdifRAShPzrX73QDVc8Pe4IH8JQaohdbJyNHzgPOa0p/tQFkgSdDhkiO0KiTmj
         Kknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZDpDADdfwq40jZPbE/sznh7Bnymle3eu2MsiKyAnHI=;
        b=uQJWfpGY92IMakuRHlMugvexfjMLIyfdrRwULE47PhU9J6RZZy47LmljXCh4n/EFm3
         f4WXDqfAumJfDUgyHtL8pUgWlhiGMAMPdo4lH6S9LTV6RTTZIiFxxd4BwineQIfL+2JR
         ww0LJehogBQRhpP7bdTi5MUXUYPaGg7RC4knsTg0rUjJh+tIuH+1vcpCkiBHWLWVi3Rx
         f+gKVAY0XINHPPni6SO2rqgzdq+IT4MKIdm2BLWNyTKWm4mD/D/KHQhkbiD3W5nN1J90
         EaMQsVMnE4Ed6e76njRdladB5wC9vUA/MGiDQ7P+SJg0jZ3Izt9aHaKyz16cBKTlR2VL
         EfcQ==
X-Gm-Message-State: AOAM531OwSLdnhy8fneRuCmtvqOZFIfzzJMBB/cU/hFlLQ1xxvhwWTnB
	lcobBrm6uVl8zI1d77+AdRjHDKqES3cmPCXkiBr5SQ==
X-Google-Smtp-Source: ABdhPJwv1WF2F6ndc/bGUuNT+neSxWAOv6iXkCytc6pktYWRpfycPf6E/KpzZmQrd8aUu/NlJ8No19+iCvFMptVtXu4=
X-Received: by 2002:a2e:7c0c:: with SMTP id x12mr648215ljc.526.1644263105665;
 Mon, 07 Feb 2022 11:45:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220207165304.1046867-1-nathan@kernel.org>
In-Reply-To: <20220207165304.1046867-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Feb 2022 11:44:53 -0800
Message-ID: <CAKwvOdkXe8CB3QGe2e6Fhz8_SLOsOpcMumoKBiAzGE_VTXCkVg@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: Avoid using val uninitialized in ltdc_set_ycbcr_config()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Benjamin Gaignard <benjamin.gaignard@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 8:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>           val |= LxPCR_YCEN;
>           ^~~
>   drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>           u32 val;
>                  ^
>                   = 0
>   1 warning generated.
>
> Use a return instead of break in the default case to fix the warning.
> Add an error message so that this return is not silent, which could hide
> issues in the future.
>
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1575
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5eeb32c9c9ce..447ddde1786c 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
>                 break;
>         default:
>                 /* RGB or not a YCbCr supported format */
> -               break;
> +               drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);

This is fine, but in the future you should add an explicit
#include <drm/drm_print.h>
to avoid implicit header dependencies (like the ones that Mingo is
trying to detangle) for the declaration of drm_err. `drm_vprintf`
needs it, too.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +               return;
>         }
>
>         /* Enable limited range */
>
> base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
> --
> 2.35.1
>


-- 
Thanks,
~Nick Desaulniers
