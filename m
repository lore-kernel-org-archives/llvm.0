Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D21321B
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 17:53:30 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id m12so6414065ljp.8
        for <llvm@lists.linux.dev>; Tue, 05 Apr 2022 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MYJtsikWi9hIB8NHNY8S76MVB/wVdm4tXnry+6+yiEo=;
        b=ijwBLjjh6lk3Bb+x9kE21mGPVSMbJnI+Yi/zPHj8mem2U9fEgN+edh+EmjEqa+XZcD
         n/lfaXf0Tweh9j3vMEvYaRq5AnA39APG5yQv6NKxIshzQR69mp6t6YhwSPfx9qs+WETe
         qzbk+Vb7I8DycQ3I99Ja5mziLFXJ/cQUDqh9BmEFPMUrEBXvhlToOea+VAhw6cZbQC74
         NLoIe5lNwslTIQJXZenzM6298KtFhaCaJ7H2Dofx9iOBYLBqokApBi/5kHOVzBOSha+8
         N0ViNXCPr1zN2Xi1NpaNTckkmR0R5uQew58xTxPUq6A6fCfWeEH1Zr8aSDV8F7XJ0RBt
         zqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MYJtsikWi9hIB8NHNY8S76MVB/wVdm4tXnry+6+yiEo=;
        b=cajmBVlChqfOajPirrUYYc5sPh1J2vxti0tJKIhpywyePJ+Bp3jmn4TAsQNps+f701
         undFNq8y0/RKU+x+2vj5b2x2GPLORvnepKiu8Ulok07NUAuOBamY2Abn1sTjwy5bXHJe
         n86cLpZP5fm/yadBWIs2GRT9vkTbwOfqi57oNp3RLyA+pVFXwtFBQMX6HG4SJuWCR7Kh
         oexNf72JpFhMlshzhy5dhj1/XXq8EkFY3u2gnFEwrkJXMhTmDadCqADQ+08ntGo0urFN
         lak75nP24StfT8pA++CkqF868ra7Dk0tO5lL/EYcZo1MPhWE/XY0Qm0c2rp/KGT93HT7
         /PYw==
X-Gm-Message-State: AOAM532BHD6Lt8LauqSanxkMxoTdWkIKTPKG5O0Aqb3BppUKBcVkSb3r
	adx2pgXF0bPKAfD/Ep43B9TfZXcWFFxXXXz11BGtuA==
X-Google-Smtp-Source: ABdhPJxkfZhW0np+6HFZguzcslyOvUzoSGSv9BMWk5pjhEH5IyVC6Lb8xm3p/2a9i36EyTCg1IFq70K2lSb/IBVbZTs=
X-Received: by 2002:a2e:9ec4:0:b0:24b:115c:aedb with SMTP id
 h4-20020a2e9ec4000000b0024b115caedbmr2807694ljk.235.1649181208750; Tue, 05
 Apr 2022 10:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220319143456.2159540-1-trix@redhat.com>
In-Reply-To: <20220319143456.2159540-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Apr 2022 10:53:17 -0700
Message-ID: <CAKwvOdkEnDBFUtio2+UVeV1J3QUwAJOc-YgcubDEUXHWMF5gbw@mail.gmail.com>
Subject: Re: [PATCH] media: platform: return early if the iface is not handled
To: trix@redhat.com
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, nathan@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 19, 2022 at 7:35 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this issue
> ispcsiphy.c:63:14: warning: The left operand of '<<'
>   is a garbage value
>         reg |= mode << shift;
>                ~~~~ ^
> The iface switch-statement default case falls through
> to ISP_INTERFACE_CCP2B_PHY1.  Which is later checked
> to set the mode.  Since the default case is left out
> of this check mode is never set.  Instead of falling
> through and assuming a ISP_INTERFACE_CCP2B_PHY1
> iface, return.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/media/platform/ti/omap3isp/ispcsiphy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/ti/omap3isp/ispcsiphy.c b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
> index 6dc7359c5131d..1bde76c0adbee 100644
> --- a/drivers/media/platform/ti/omap3isp/ispcsiphy.c
> +++ b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
> @@ -31,7 +31,8 @@ static void csiphy_routing_cfg_3630(struct isp_csiphy *phy,
>
>         switch (iface) {
>         default:
> -       /* Should not happen in practice, but let's keep the compiler happy. */
> +               /* Should not happen in practice, but let's keep the compiler happy. */
> +               return;
>         case ISP_INTERFACE_CCP2B_PHY1:
>                 reg &= ~OMAP3630_CONTROL_CAMERA_PHY_CTRL_CSI1_RX_SEL_PHY2;
>                 shift = OMAP3630_CONTROL_CAMERA_PHY_CTRL_CAMMODE_PHY1_SHIFT;
> --
> 2.26.3
>


-- 
Thanks,
~Nick Desaulniers
