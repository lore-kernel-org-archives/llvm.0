Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183E92F26
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 19:26:20 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id bx31so21239736ljb.0
        for <llvm@lists.linux.dev>; Mon, 07 Feb 2022 11:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJag/A5JmvykTiv6EpL4n31ZcZevEf+cXwTOlC0tOkg=;
        b=q1Hb1u5r9+AsViUlf6UZzxNWWr4GQprtIzge2G5bWfH70p3weWpX0FICkMAfCmkQSW
         DxgfdzQE6MACnIaDHskjXVgPZotUPDpBaHrW7ATyVti21B//sFUL8rxetrFLrYvP+b9F
         4o+LGmKu257u9/1LtqMQ+GhZ4MclAaFkmv2BmZ8JEy/LHyw1sb1hB1gUgMg4y5Ld4IM5
         tJ31LDi71OAbJlJwPOZ8x3SIhG9TLn96RRZPV9+jyJD4SVx4VtmZA5hyKpNTsTwCyT+X
         MBzdf/hKqWdwyskNBWuTAbzc/LRz7r8p7GK9DgeuRqvoHUUPsMLbtYzYn516lryInL24
         Sgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJag/A5JmvykTiv6EpL4n31ZcZevEf+cXwTOlC0tOkg=;
        b=b10tBxlLL5D0TF5FFpzrYvc/BEP3ukC0KGxmR9FyXhmMmiY6OhQOzwB6d+t/qrcN3w
         3NzO+2EMSSo7JvscxRvmL4QuljPiKsCCO+kbU9Z4aQOyFuUJzT/62OAHFxuSUM/+NI52
         J4OeZfOpdoiiOC++y5X7YeUo7GYuR5EeAmMGs41uzbg11NL88erAZHNnVeIURY0rPOnJ
         3WYPNyDs2F2up22ocK2aU9bT+Y1GI4zWrkFqlKuHlsdKBt0Sq+QjZoGjt+gXVFHhsIDr
         aP6nOeyhGZedmP0NyGdGDdIvw6GOiLJaiWt/DnnMOYgjfZ9J+u4Cdox+qGqrHihwHSj6
         Mr8w==
X-Gm-Message-State: AOAM531QCLsvSLc4tqi52HyQ3cmGNQpWEETyEin0bjVdCJ9KB34dLCbs
	3AoVYYRVOqHPJZVPKlkrfZca8pzTepeWIeAVUjLYzw==
X-Google-Smtp-Source: ABdhPJxiRwBDrZ7qHrwkeYZzKApFxOfBT0kt7xuCw9xbG3ufLrmJ9Sb/VD/Nm0ot8LNlflSABDiDmjBvKBn3HS7qJ1s=
X-Received: by 2002:a2e:980e:: with SMTP id a14mr617655ljj.220.1644261977984;
 Mon, 07 Feb 2022 11:26:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203152305.1846862-1-trix@redhat.com>
In-Reply-To: <20220203152305.1846862-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Feb 2022 11:26:06 -0800
Message-ID: <CAKwvOd=MviBd5iwSnhyt9aSZU+QTsBrBSGPcjsjt2eepfYC3KQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: fix using freed memory
To: trix@redhat.com
Cc: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch, 
	nathan@kernel.org, maxime@cerno.tech, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 7:23 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis reports this problem
> ast_mode.c:1235:3: warning: Use of memory after it is freed
>   drm_connector_update_edid_property(&ast_connector->base, edid);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The second condition on
>
>   if (!flags && ast_connector->i2c)
>
> Means that the edid is not always set.  If the previous block
> fails the freed edid value will be used.  So set edid to NULL
> after freeing.
>
> Fixes: 55dc449a7c60 ("drm/ast: Handle failed I2C initialization gracefully")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index ab52efb15670e..9131dc8a1a2fc 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1224,10 +1224,12 @@ static int ast_get_modes(struct drm_connector *connector)
>                         return -ENOMEM;
>
>                 flags = ast_dp501_read_edid(connector->dev, (u8 *)edid);
> -               if (flags)
> +               if (flags) {
>                         ast->dp501_maxclk = ast_get_dp501_max_clk(connector->dev);
> -               else
> +               } else {
>                         kfree(edid);
> +                       edid = NULL;
> +               }

You probably didn't need to add the {} for the if, but it doesn't really matter.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>         }
>         if (!flags && ast_connector->i2c)
>                 edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
> --
> 2.26.3
>


-- 
Thanks,
~Nick Desaulniers
