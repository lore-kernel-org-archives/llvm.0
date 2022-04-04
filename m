Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D967C
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 18:09:34 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id bx37so10262577ljb.4
        for <llvm@lists.linux.dev>; Mon, 04 Apr 2022 11:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uz4lPE2rdo2tRM1taU9hjtHkKN6cEscjMgtJGGpCZK0=;
        b=AKh+Xx8Jri22FLpKBD4E3RoftVzjoBrDVxvOksJJs1GiZpvdGJdEX2vPXJvyGWVcDC
         Tsws7vziNMKhEc1zFl/txeNmPo/Wx7XJU0EJZq+3mQ6ntGZLXmpSi8w6nhlFDGUBzWmX
         Yq+MB4VarfRzItJWG71o6LZ/2bUZ5IMRLDkDDxXbx8gBkWa58++9ibIS0lfl8QXbFYIc
         e6nDCpIHZIZkDQigSykJm8MIxAStv7nYv6rs85ZIHdGzECyEPFVpFeNZslA0YGNsgm/J
         vb7bEkgtvx02wVWUHzX1C4z68lOmkxFEyA4y4BJ3/zRjlRU1yBfRbZ5ORhOrFwx5FwrM
         BsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uz4lPE2rdo2tRM1taU9hjtHkKN6cEscjMgtJGGpCZK0=;
        b=T896u6R3dMyFjE20CHvNteUbRUYMJQM7JsF9qn+7wKgOSmKsIgK1IojseCK2de+s1v
         bfAHeS8LSRRWFv05X3nVfrGyQT6aDgjzZef9dwpYSUQL5ywNo2pzcxoezzjJnU5Pjy3r
         C1kpz7r2Jp9KxI+ip3HZn6ChoPLG9GiS4LWzs+K0/hAfEnxW8Inc5YFvVAIXw7f3LWIV
         YHw48kEw+5/2Xcpgx9ex0pVR7UaqRK2ptpu4dKUmcJcON8AFvevqelEVVlC87Ul27NVb
         sFG/4PabXvsEW9D66i1OwMKEyrn8rk/H19gVL0aLRU5WnkKRuMK9przTAfY0QYDuvjLi
         1/zQ==
X-Gm-Message-State: AOAM5314xRi57jDwkR/IMHyiyXhnPPS0QD2btBodxMwDLDlMMEr/bM2n
	+kI6qDkmh/Wc29LPtR1iHCiGZbdL5hb+J3Pf/jiwZg==
X-Google-Smtp-Source: ABdhPJyEamkccvVwsWuiMfR8yOe39RymGH9/TLP+zLi/6TZpWH3im6mHt1c9jyr67LnqZRKEZnZwcP1sY9HjUQIPna4=
X-Received: by 2002:a05:651c:1588:b0:249:b90d:253c with SMTP id
 h8-20020a05651c158800b00249b90d253cmr525887ljq.408.1649095772447; Mon, 04 Apr
 2022 11:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220318000055.79280-1-colin.i.king@gmail.com>
In-Reply-To: <20220318000055.79280-1-colin.i.king@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 4 Apr 2022 11:09:21 -0700
Message-ID: <CAKwvOd=GRBTs43JcwMBS=aEYtOXLP+SVEj3d89LjcfJJZLOZ5Q@mail.gmail.com>
Subject: Re: [PATCH] amd64-agp: remove redundant assignment to variable i
To: Colin Ian King <colin.i.king@gmail.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 5:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Variable i is being assigned a value that is never read, it is being
> re-assigned later in a for-loop. The assignment is redundant and can
> be removed.
>
> Cleans up clang scan build warning:
> drivers/char/agp/amd64-agp.c:336:2: warning: Value stored to 'i' is
> never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/char/agp/amd64-agp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
> index dc78a4fb879e..5f64991c73bf 100644
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
>         if (!amd_nb_has_feature(AMD_NB_GART))
>                 return -ENODEV;
>
> -       i = 0;
>         for (i = 0; i < amd_nb_num(); i++) {
>                 struct pci_dev *dev = node_to_amd_nb(i)->misc;
>                 if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
> --
> 2.35.1
>
>


-- 
Thanks,
~Nick Desaulniers
