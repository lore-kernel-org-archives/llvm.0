Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A610A2CA7
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 22:10:07 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id v8-20020a9d6048000000b005960952c694so24172027otj.12
        for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 14:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dfQ1Cr8MOGNWzImPgM3FPvJ3DRDIShXaWCzTw2fuiGo=;
        b=Z+F0etylmIPRLfXkQxHrbCduqN93SYw7wl/ke/YpNeM4rPaukRCnKxTe71ymWVnYxP
         7Vp4nnlA+M4Rm1eAhkuZw7yqe9BkTYhucCx+9Fsb6LaMeeQg6V2LonO6YxMnEKLTLNWf
         ThtFvcc/fRFn4UZPlVRhL+vS5U3wQmnxEtFLUPWE3obBRz8H/TwYkyRptXqFHff3vgKB
         jcy7q9coHrKyr3wha1pNcOuLmgUKjtbpCVRunpmpzDKtiFy4PTDQ6ZyeH6WC1swXj9wH
         1gUQHxkh7d72RWBkcPCYm2r14IlbhITnuWDjv0rAlIdb7LUIu60GlZpkmIhgWB5EqtZk
         o1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dfQ1Cr8MOGNWzImPgM3FPvJ3DRDIShXaWCzTw2fuiGo=;
        b=IVKWTxQB8xu6AOXRLvo5iLNmJCAJM3o21kX7NV4WC73dZanTuRmq+mMnouckdQ65DT
         0ENDEA0XIJrxbx0gaiRp6IJgpIFP9f8asJYW/YkTiNulzOTYJ4i+YQer8JrwyAA/MO1v
         +VQV6DHDM8fmRAbJ6TyqxErtl9HR1V9LEE0nFP8NMLzzAXPUc7d3lmpShwEDrk/IfG3j
         hrvityTT0/b00zRDng+IOb7Bsn+pe2SjJMzG3ohPnM2r0gLM9/VbHcuFjEDpNeptCFz0
         Xaz9RbxAS5+lxUOddatlImKdFm6GXarPozPkvHbPJzxCoBCED7uFbytNlIGQYtD6vRsU
         RtfA==
X-Gm-Message-State: AOAM530j0+20yXKXaUP+yYt0T3xBCY/u4hwvpck8uORQRaewzQbB3DfA
	7qf2lCx/8ycXtS/y2LNlGfBIOH+gkeC+KUXorMk=
X-Google-Smtp-Source: ABdhPJwvLyrL8/z3f3oeYcfh5RaeZB2rvDsalLA+HVQ+FDuwfMu1r9GNC9grwWebJSLxVHBZqstuKTAHNHQYm1JYjGE=
X-Received: by 2002:a05:6830:1d90:: with SMTP id y16mr13147279oti.200.1643062206810;
 Mon, 24 Jan 2022 14:10:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220119224628.123084-1-colin.i.king@gmail.com> <CAKwvOdnMibw77AvvWw7seB2PPamS_OLMUarSjdsa4w4OP1isKg@mail.gmail.com>
In-Reply-To: <CAKwvOdnMibw77AvvWw7seB2PPamS_OLMUarSjdsa4w4OP1isKg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 17:09:55 -0500
Message-ID: <CADnq5_P4F9MqfP2BHSzj7rgXBDxRPtiphh5sqF0+dW7NSTLFVA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: remove redundant assignment to reg
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Colin Ian King <colin.i.king@gmail.com>, llvm@lists.linux.dev, 
	David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied.  Thanks!

Alex

On Mon, Jan 24, 2022 at 3:21 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Jan 19, 2022 at 2:46 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> >
> > The pointer reg is being assigned a value that is not read, the
> > exit path via label 'out' never accesses it. The assignment is
> > redundant and can be removed.
> >
> > Cleans up clang scan build warning:
> > drivers/gpu/drm/radeon/radeon_object.c:570:3: warning: Value
> > stored to 'reg' is never read [deadcode.DeadStores]
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> Thanks for the patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> > ---
> >  drivers/gpu/drm/radeon/radeon_object.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> > index 56ede9d63b12..87536d205593 100644
> > --- a/drivers/gpu/drm/radeon/radeon_object.c
> > +++ b/drivers/gpu/drm/radeon/radeon_object.c
> > @@ -567,7 +567,6 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
> >                 return 0;
> >
> >         if (bo->surface_reg >= 0) {
> > -               reg = &rdev->surface_regs[bo->surface_reg];
> >                 i = bo->surface_reg;
> >                 goto out;
> >         }
> > --
> > 2.33.1
> >
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
