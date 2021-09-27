Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9772
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 19:20:24 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id h11-20020a4aa74b000000b002a933d156cbso6366998oom.4
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 12:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DxxDnArAuqMzLOKrnNqBxORaTd+7/JcrK9bDcFPx9BQ=;
        b=E9fwq5bTre/IrnXwZ/2oEJhk10H+KaHc08PWNXgjOdhLuUJdU3V/PDBPGGcH4aB6EG
         vbqUjNv9ClfzM9n9n8OdWHiQaBYKlO6riTNMumO2z35RshxodLeNmh7FEphBSza23fvF
         /RW6yO5Y0JV916oTome5iBE3PMnJ8aCKZ1Y4XPDKv5YQH18GO90n97xXLlEQrSgNK6Pi
         /P2EQmG63tM/8mFlDUzWK5I3KY9XTT6C9zdrUQTveO3EcOCxrHQIHB2omyozhfaGhKo9
         XQFrYfgyss99y3+08WWPCMBbbsvy8SoaCiwiXiBYZNmvO7Wkm/vzlC6JgSRNAiofslBs
         IsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DxxDnArAuqMzLOKrnNqBxORaTd+7/JcrK9bDcFPx9BQ=;
        b=mFkoysdSdRwbRHyUcl8Nwy2CTxXNZGqgfRqrtQaAyOZaCx5LX8iHIkGsjAFe9yrndH
         5qmOP7CwkvQHWjVaQl9WLlxryF96ptYpS+rItjSdNWdWKyDOxUvBvdQVPPANFwW9Plvz
         VpL6Lt4AQY+8G58WQzAQaD76yQ3jSXG+HJXBz0h0yoqdPQ+r84zrZB3FLvrwxA7Sq1qI
         n3bNPVSU4cXcPEMw2eBUR5JuAawsWm18VZ4/gT+IpCxQ3jGAiQjD7rA6aTBsyO4lSL64
         kjZ7Z3NhF6u41Cn/pMbHrRJfFYh5bvGuRSfg9l5RvUkUFW/Pv3F3/YFjBjryRAZI62F6
         5ikA==
X-Gm-Message-State: AOAM531ezE+lwumzrvQ+S3wS9r0FojdzkUBcbxQtSc13690qLKZytEBT
	buKM9Nu5cgF+nD7TctxxCaPRxUS5znBssGJHYsQ=
X-Google-Smtp-Source: ABdhPJxK9Pl7nDDrEjCckoKhzIkfsziDqe9p0oskMIry7aZ1ewD2rkdZK6eZm+ZpzCPRqBiNvG4eBEMomJ0BLTdG8Ws=
X-Received: by 2002:a4a:e899:: with SMTP id g25mr1334984ooe.68.1632770423330;
 Mon, 27 Sep 2021 12:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927125824.1583474-1-arnd@kernel.org> <a27a9db3-1186-8fea-8952-fca4171bcee5@amd.com>
In-Reply-To: <a27a9db3-1186-8fea-8952-fca4171bcee5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Sep 2021 15:20:12 -0400
Message-ID: <CADnq5_NcRQO=VAGONoBBebZAXXaNDshUZk9=RpLVu3LdGnztXA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix warning for overflow check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunming Zhou <david1.zhou@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, Sep 27, 2021 at 9:07 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 27.09.21 um 14:58 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The overflow check in amdgpu_bo_list_create() causes a warning with
> > clang-14 on 64-bit architectures, since the limit can never be
> > exceeded.
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:74:18: error: result of com=
parison of constant 256204778801521549 with expression of type 'unsigned in=
t' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
> >          if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
> >              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > The check remains useful for 32-bit architectures, so just avoid the
> > warning by using size_t as the type for the count.
> >
> > Fixes: 920990cb080a ("drm/amdgpu: allocate the bo_list array after the =
list")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_bo_list.c
> > index 15c45b2a3983..714178f1b6c6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> > @@ -61,7 +61,7 @@ static void amdgpu_bo_list_free(struct kref *ref)
> >
> >   int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file=
 *filp,
> >                         struct drm_amdgpu_bo_list_entry *info,
> > -                       unsigned num_entries, struct amdgpu_bo_list **r=
esult)
> > +                       size_t num_entries, struct amdgpu_bo_list **res=
ult)
> >   {
> >       unsigned last_entry =3D 0, first_userptr =3D num_entries;
> >       struct amdgpu_bo_list_entry *array;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_bo_list.h
> > index c905a4cfc173..044b41f0bfd9 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > @@ -61,7 +61,7 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdg=
pu_bo_list_in *in,
> >   int amdgpu_bo_list_create(struct amdgpu_device *adev,
> >                                struct drm_file *filp,
> >                                struct drm_amdgpu_bo_list_entry *info,
> > -                              unsigned num_entries,
> > +                              size_t num_entries,
> >                                struct amdgpu_bo_list **list);
> >
> >   static inline struct amdgpu_bo_list_entry *
>
