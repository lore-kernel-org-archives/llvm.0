Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D52C82
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 09:34:48 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id q74so48243726ybq.11
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 01:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/58NT7ct7q9qVhpboABnYcJs7B141CdNrRjRMouedh8=;
        b=NVDgnbp40OQu0oKb0zrSUhi4eKq6wPdR2Uvkgf2NPDUxT1zp8WmVpRPk7bYTS4FDVZ
         ULAJm+4ec9tru4GYGVsoDrHd58H0HH3DO+0yU3eshduzG+S3s5jaf6JROl7ZDHQuuJcX
         K0pIi4dbBq6D/D9aYuvrY9PYCByTmcbf4csDP7cgu0ccyzhlpeQzUFvzlXcU5js0IEYG
         K8bKJcsjuilYkArcQvg0gO5m/V0lfUyIJI9TyBkpL+8bxpVTBMF9vjIJn9FIVKB4gbOa
         qiWOuOwH6HBu9OQ26c/XjVqQjVHLnSvL70xti/iEgZwnm68vrk6qnzBnZmiACENi9Ma4
         xZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/58NT7ct7q9qVhpboABnYcJs7B141CdNrRjRMouedh8=;
        b=DIAdQNnHVPURxeU9690yrs4nrVk0kr+V8Ym61r7Z/6ptwM4tDpCgbCKAkslmtVAHif
         lU5MQ01HGcUw0cAeC6ZVsTDH8qy/pwqVg9ZR13wWD9uPJyPdzZ9Kq/yHt98EKGmtQTnV
         MR5ExNpfSSDgS+L5G+l0CVsy/sXRK5KTBfyu5V/GWM+rGasuA9ApjyiE0C3pdZvSfMuA
         P78MvxzSyPTtk07a2avuvOFtZGD0Rw5bah43P/BfEtsC0e2AVoL69pr6u/a2H7e4SXYt
         IO/1JSb9qncjp8BqYXCPQYtYLvs/sIwfuBnL+XETyA5yvySl1xp1JS0FrOHyDlrmQhkn
         oVdQ==
X-Gm-Message-State: AOAM531CHuqN3ufqyENYOcyWAH2gaXE9sbRuqJO3tAnfQSu3hVnhpayL
	4U9SRdg/z0G1zzdCRka84ijKchpV1YE6B8UOq/0=
X-Google-Smtp-Source: ABdhPJzs+HD6VsEionQJCb9vESyL1udUm4nXwCA+R2YJGh5cJ+2GBO13x2XPSJYLfSVu+mUfKPp7tme+n8LDN/xgS98=
X-Received: by 2002:a25:f502:: with SMTP id a2mr62547759ybe.254.1637573687117;
 Mon, 22 Nov 2021 01:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUTLYn=14RzJORp1mn-TSwC1rk1BO_9L6TG4g9JhH27JA@mail.gmail.com>
 <CA+V-a8sGA4=oxwp87VonC6zdPYT5-BHmsVoV8L1ggTUV8m4ooA@mail.gmail.com> <7eeeb5d0-3ef1-35cd-e7e2-cdeeb979b83b@canonical.com>
In-Reply-To: <7eeeb5d0-3ef1-35cd-e7e2-cdeeb979b83b@canonical.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 22 Nov 2021 09:34:21 +0000
Message-ID: <CA+V-a8umH8bh8vL8tYdTa=1Y65JvvuVpvzt-NRvi+XL80rOF=w@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Silence clang warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 22, 2021 at 9:32 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 22/11/2021 09:46, Lad, Prabhakar wrote:
> > Hi Geert,
> >
> > Thank you for the review.
> >
> > On Mon, Nov 22, 2021 at 7:50 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >>
> >> Hi Prabhakar,
> >>
> >> On Sun, Nov 21, 2021 at 7:05 PM Lad Prabhakar
> >> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >>> This patch silences the following clang warning:
> >>>
> >>> | drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
> >>> | type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> >>> |           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> >>> |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>>
> >>> Fixes: b04cc0d912eb8 ("memory: renesas-rpc-if: Add support for RZ/G2L")
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >>> --- a/drivers/memory/renesas-rpc-if.c
> >>> +++ b/drivers/memory/renesas-rpc-if.c
> >>> @@ -250,7 +250,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
> >>>                 return PTR_ERR(rpc->dirmap);
> >>>         rpc->size = resource_size(res);
> >>>
> >>> -       rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> >>> +       rpc->type = (enum rpcif_type)(uintptr_t)of_device_get_match_data(dev);
> >>
> >> While correct, the cast to "enum rpcif_type" is not stricly needed anymore.
> >>
> > Agreed.
> >
> > @Krzysztof, let me know if you want me to resend the patch with the
> > cast to "enum rpcif_type" dropped.
>
> I can fix it when applying, thanks!
>
Thank you.

Cheers,
Prabhakar

>
> Best regards,
> Krzysztof
