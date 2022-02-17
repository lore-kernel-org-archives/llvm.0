Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F204351
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 16:16:26 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id v25so137800oiv.2
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 08:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ytu0Gx4Ee/+5dkAxsCITxVC/7yyCoOiEqzDXQO8bwEE=;
        b=hW00c6ROWmn+snifswDQ5zvWgLKzzxTtorrsLYKzTPfbkWCSd8nyY5XFmOjZtuo6aT
         Kb0uJN4PiZPTx5bTQss59vSLEEKuDJNp0vp0AntkMIY+3uwLlIUrtLWF08DmkLa+pL0D
         PYt+YrKPtMIBECkSHxbiHGZCLRem4t6yfvaZlP30y8DUrl2+a4DZPydmZaG156nI43gq
         HHHmphpOUhIW41BwTVq6fSGOy9RX3CCGX2cGAhzE6dNSOFxz4RiDWTAyZ0a9ADCQCgjP
         FsIjuJjChETAP8qXmGZGN4GbfLSwe6lsutCPAs7zv3Qig/epukDh/XeewpqjoaUIxsSo
         OmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ytu0Gx4Ee/+5dkAxsCITxVC/7yyCoOiEqzDXQO8bwEE=;
        b=i1/l+J0kA7En26beY+EMR5oihR//eXhNFrHCVCv9eUKzMNO4/4KygXxS82HEt7Mfba
         8tKA94VbYWNjShLdQCMAqCF+SrGvJ/5C3uzQue9UK6YZ9VyRDXGiZuid947ho3IHPZyc
         frG8j6LhFoBzbJZxzT8HvDySatPh0DdxcO0bzoGWGEE6rPXa2UUlfN2fJyavKt40ecUe
         PVuEbTkvrhXDDDvcgXcXrCBlFs5nSjRnxEmgYOLxdl3xYpCfUy4179e/7A3ACQp0W+xH
         S7mJykztLwQcAEQ2AAmmr8OoNe+2PRMu/wE4AXZIl05Bxb4id0tqgYNVFZ3Q3lRq8cFG
         l/zg==
X-Gm-Message-State: AOAM531+M4G3vfRAApVvlQ0shZyZkPtmctVDhPWfglryO4PG8Gy/oVIv
	rdUW7hjVFg00rTj8yWZVioBzBRJ/ovvcAdnnnbQ=
X-Google-Smtp-Source: ABdhPJx8wTyezWB9AK6JyxubX/zJkOWu5At1AfwaOAntEheYpYTl183pwdekUGsijpPNoomOiHIueXChIM2l1XK/Q7s=
X-Received: by 2002:aca:ab4c:0:b0:2d4:7c7d:606e with SMTP id
 u73-20020acaab4c000000b002d47c7d606emr1147310oie.132.1645114585339; Thu, 17
 Feb 2022 08:16:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com> <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
In-Reply-To: <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 11:16:14 -0500
Message-ID: <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Luben Tuikov <luben.tuikov@amd.com>
Cc: Tom Rix <trix@redhat.com>, "Deucher, Alexander" <alexander.deucher@amd.com>, 
	Christian Koenig <christian.koenig@amd.com>, xinhui pan <Xinhui.Pan@amd.com>, 
	Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Hawking Zhang <Hawking.Zhang@amd.com>, John Clements <john.clements@amd.com>, 
	Tao Zhou <tao.zhou1@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>, 
	"Stanley.Yang" <Stanley.Yang@amd.com>, Dennis Li <Dennis.Li@amd.com>, 
	"Joshi, Mukul" <mukul.joshi@amd.com>, Nirmoy Das <nirmoy.das@amd.com>, llvm@lists.linux.dev, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied.  Thanks!

Alex

On Thu, Feb 17, 2022 at 10:57 AM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Thanks for catching this.
>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>
> Regards,
> Luben
>
> On 2022-02-17 10:38, trix@redhat.com wrote:
> > From: Tom Rix <trix@redhat.com>
> >
> > Clang build fails with
> > amdgpu_ras.c:2416:7: error: variable 'ras_obj' is used uninitialized
> >   whenever 'if' condition is true
> >   if (adev->in_suspend || amdgpu_in_reset(adev)) {
> >   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > amdgpu_ras.c:2453:6: note: uninitialized use occurs here
> >  if (ras_obj->ras_cb)
> >      ^~~~~~~
> >
> > There is a logic error in the error handler's labels.
> > ex/ The sysfs: is the last goto label in the normal code but
> > is the middle of error handler.  Rework the error handler.
> >
> > cleanup: is the first error, so it's handler should be last.
> >
> > interrupt: is the second error, it's handler is next.  interrupt:
> > handles the failure of amdgpu_ras_interrupt_add_hander() by
> > calling amdgpu_ras_interrupt_remove_handler().  This is wrong,
> > remove() assumes the interrupt has been setup, not torn down by
> > add().  Change the goto label to cleanup.
> >
> > sysfs is the last error, it's handler should be first.  sysfs:
> > handles the failure of amdgpu_ras_sysfs_create() by calling
> > amdgpu_ras_sysfs_remove().  But when the create() fails there
> > is nothing added so there is nothing to remove.  This error
> > handler is not needed. Remove the error handler and change
> > goto label to interrupt.
> >
> > Fixes: b293e891b057 ("drm/amdgpu: add helper function to do common ras_late_init/fini (v3)")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > index b5cd21cb6e58..c5c8a666110f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > @@ -2432,12 +2432,12 @@ int amdgpu_ras_block_late_init(struct amdgpu_device *adev,
> >       if (ras_obj->ras_cb) {
> >               r = amdgpu_ras_interrupt_add_handler(adev, ras_block);
> >               if (r)
> > -                     goto interrupt;
> > +                     goto cleanup;
> >       }
> >
> >       r = amdgpu_ras_sysfs_create(adev, ras_block);
> >       if (r)
> > -             goto sysfs;
> > +             goto interrupt;
> >
> >       /* Those are the cached values at init.
> >        */
> > @@ -2447,12 +2447,11 @@ int amdgpu_ras_block_late_init(struct amdgpu_device *adev,
> >       }
> >
> >       return 0;
> > -cleanup:
> > -     amdgpu_ras_sysfs_remove(adev, ras_block);
> > -sysfs:
> > +
> > +interrupt:
> >       if (ras_obj->ras_cb)
> >               amdgpu_ras_interrupt_remove_handler(adev, ras_block);
> > -interrupt:
> > +cleanup:
> >       amdgpu_ras_feature_enable(adev, ras_block, 0);
> >       return r;
> >  }
>
