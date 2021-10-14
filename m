Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F74C2C81
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 21:21:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id y26so32738268lfa.11
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 14:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kQwUmmPeJ8Hce507ICCeYLH5aPrCZw/ZIJrPidgd9ZE=;
        b=HMN7qIWonn2K5R4zTQ2lDey6lWwmzqJlSStqviM7qxSdzciKyT9pSF7PvGKF5nZtKe
         bIzc4Wim9DKWdo0s7t/S4Stw+bjX4NTSbQrEJXGloTpUc6lXYgElEKn+fmaT+mtRsmGm
         xGbMRdPYm9U4MsGWGEUCFlmSokKe85X36P7IgBgCqzKY4ZNddAphaTGb0qrQCavQXL1W
         rKbTCLqs/PIp8yRaN2vjKJ7nxoHhOh98POPoAqbsDljCp1c04VsHN4U+di73gsd3JdGJ
         EMi0ZmE1nolIZ2ZQmA0xOep6o/wongsjBW0ShfD0eCV2it/KczUx6S47vV01tPsfoEzY
         f14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kQwUmmPeJ8Hce507ICCeYLH5aPrCZw/ZIJrPidgd9ZE=;
        b=ESt1kb5qym1BfvRG2Vnw4UxI79kbN5blC9efRPsH2pdRNH+90LBL5LjqhU8AhH4DLd
         rfVOfiKcAJArvn8u0zx8A3cbO657j6wo68FDNCva7eqhc+2VX3xYA2z9xPOLFb2C/Vx7
         giSTp9LIXqXpui8NXheM7wMMLrI8lIk4escAYTi5AdR3d9EdC88PMswaL/TGl/rgc3dI
         2H48uzoQvU8t9ZU6AfFh0TzaXHV90pRtDaMI51QEXU14lFgbqZcU1XjJai91vBuTOPvD
         4+ILEWm1SD8JQUe3GmmtytFlCZgkpFF/g+ejIv8nWsrBIbW8vm3QjlnJd70H6b5lduN9
         RqRw==
X-Gm-Message-State: AOAM530SUHmEQy2bi+GauJrrqcfBrdPBWhtQwBo+Of4310+NHlvcRvB3
	xqFzmHIbL8dveDPWWfaIPFZ+4Xt8fe9dPaMiz9QPtg==
X-Google-Smtp-Source: ABdhPJzcKBq6vCrkR8ENl9gj9IqS485yrxDyz2P7VIjz8eeAT/1thN0HtZ0Fi2grgZQEmwtsIyFcjiem2P07eTN9XKg=
X-Received: by 2002:a2e:461a:: with SMTP id t26mr8609302lja.198.1634246515116;
 Thu, 14 Oct 2021 14:21:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014211916.3550122-1-nathan@kernel.org>
In-Reply-To: <20211014211916.3550122-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Oct 2021 14:21:43 -0700
Message-ID: <CAKwvOdmSFP98Mc1u2b+=_Dux9eB_yumRvxOx7UTXuyXOYzG3uA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	=?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 2:19 PM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> A new warning in clang points out a place in this file where a bitwise
> OR is being used with boolean types:
>
> drivers/gpu/drm/i915/intel_pm.c:3066:12: warning: use of bitwise '|' with=
 boolean operands [-Wbitwise-instead-of-logical]
>         changed =3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.pri_la=
tency, 12) |
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>
> This construct is intentional, as it allows every one of the calls to
> ilk_increase_wm_latency() to occur (instead of short circuiting with
> logical OR) while still caring about the result of each call.
>
> To make this clearer to the compiler, use the '|=3D' operator to assign
> the result of each ilk_increase_wm_latency() call to changed, which
> keeps the meaning of the code the same but makes it obvious that every
> one of these calls is expected to happen.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1473
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch!
Suggested-by: D=C3=A1vid Bolvansk=C3=BD <david.bolvansky@gmail.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/i915/intel_pm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel=
_pm.c
> index f90fe39cf8ca..aaa3a0998e4c 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -3050,9 +3050,9 @@ static void snb_wm_latency_quirk(struct drm_i915_pr=
ivate *dev_priv)
>          * The BIOS provided WM memory latency values are often
>          * inadequate for high resolution displays. Adjust them.
>          */
> -       changed =3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.pri_la=
tency, 12) |
> -               ilk_increase_wm_latency(dev_priv, dev_priv->wm.spr_latenc=
y, 12) |
> -               ilk_increase_wm_latency(dev_priv, dev_priv->wm.cur_latenc=
y, 12);
> +       changed =3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.pri_la=
tency, 12);
> +       changed |=3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.spr_l=
atency, 12);
> +       changed |=3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.cur_l=
atency, 12);
>
>         if (!changed)
>                 return;
>
> base-commit: d73b17465d6da0a94bc0fcc86b150e1e923e8f71
> --
> 2.33.1.637.gf443b226ca
>


--=20
Thanks,
~Nick Desaulniers
