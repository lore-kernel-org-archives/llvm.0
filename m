Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90177168
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 20:21:22 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id x11so52387067lfa.2
        for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wyMvRdYooGkNnpiPbja1/uSfdA1/U9snsdIqkkHvJEc=;
        b=htyyJ1Z3GRsmUZan58N3Prr0pEBcELIKOR7HkjpOyyQX11oHKKsVhGziUzHRAk9gAQ
         qKIJ1la4FQPjdeduY0TumzsXC1keATPYK+6nRTIgrBg2Yx3j+qLswnmWYNKKkUD32SGa
         NEUVgy1cbCWp9ftv9S/S5W24Xf77OuvIUUPVXQgqfByM1wogeIS6Un6jOyUF9MMCkpXG
         teWa0koFmo2WyVhH9ii5kbYSuulkh24QTq4DkaKRlSHApSrAqcmB2KzC4vQu8X9FU9gv
         2EOV8xLbbtvhhc9TN8f/mQhQ6bw3lBLH/4ZukkYU7sfiq5QPCY/xyIFbbSA1hYPq/sPZ
         OO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wyMvRdYooGkNnpiPbja1/uSfdA1/U9snsdIqkkHvJEc=;
        b=RHHFhHWIHkWaUenoS8ImJWMJfjdMmQNdCgJuda5Zo6MA1my3bndjsfpjXNBFU1EoDI
         So+m2dTWwcEm4WA12saVlD8PB7Kh1cDHCKFxKVJNr6oWvGY9xyUsf2XFnOWn29wY544w
         +QTTj44UQE4rynimvviQTnwykznrBex57I2wxbVkV9JA0S7EihhqxxEsEh3TcpXZPaRX
         l66SVbSq7WP1mvigBLUD3HCTMPoeYTvZXn5MkRHn3lx1hKsdQ/kvm3dxbDEIdChD37AU
         OmLo8XlBd1+h4iP42XC0gmRD5X9Vb3/n51JQoRXZXMnShttcmofeEpzv/hjoApk81IzE
         KAbg==
X-Gm-Message-State: AOAM532cWoM6P0MbXZfBa0J8H9K0n3Bbc1dKTgpPxuHq9XObgmvgH7gf
	G5ep8yshvXz9y3qulkPXDjd0pwoyoJnwSEfdJ9htkg==
X-Google-Smtp-Source: ABdhPJzNbWHLfVK0G4oHmQubeJbQeEM15S/l2in0t/MpUPzxIWlbk0Bzs9ERTx3WfdkjIX9h30ubfENOdawlZCrT2bU=
X-Received: by 2002:a19:ad02:: with SMTP id t2mr14058303lfc.82.1643055680456;
 Mon, 24 Jan 2022 12:21:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220119224628.123084-1-colin.i.king@gmail.com>
In-Reply-To: <20220119224628.123084-1-colin.i.king@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Jan 2022 12:21:07 -0800
Message-ID: <CAKwvOdnMibw77AvvWw7seB2PPamS_OLMUarSjdsa4w4OP1isKg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove redundant assignment to reg
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 19, 2022 at 2:46 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> The pointer reg is being assigned a value that is not read, the
> exit path via label 'out' never accesses it. The assignment is
> redundant and can be removed.
>
> Cleans up clang scan build warning:
> drivers/gpu/drm/radeon/radeon_object.c:570:3: warning: Value
> stored to 'reg' is never read [deadcode.DeadStores]
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/radeon/radeon_object.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index 56ede9d63b12..87536d205593 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -567,7 +567,6 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
>                 return 0;
>
>         if (bo->surface_reg >= 0) {
> -               reg = &rdev->surface_regs[bo->surface_reg];
>                 i = bo->surface_reg;
>                 goto out;
>         }
> --
> 2.33.1
>
>


-- 
Thanks,
~Nick Desaulniers
