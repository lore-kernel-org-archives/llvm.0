Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3641A82
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 21:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtL6TB+D"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dd4eed487dso922427fac.3
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 14:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696543031; x=1697147831; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAYKChfRdgudPucMl+HqonIt/5AX5oN5CCdBSnTYy0c=;
        b=TtL6TB+Dxjivw9NGO8dacvgc7D36fzVaR267tzYEmWJ0yKp+rT7S2fuI3E2LTFMCiT
         9gXe3kffWGoAKidwcvyj6oGDa+RfinHLxWDMQmWfH7U0d0mvXLcq1M7S87OcBy6bjwE3
         p8O7ti/343sHV2FKkgra5EtxelH0InmlD1FvxFMzk6hXcV+GBt4KkbWxnvq7ML95sPye
         6CG3hzOB9fvpCnmcVp+UkCNgul/QJA/b8RC+50ZjPc9JTr7Kl503EZJqpgokNQx2uaza
         L+IwSzAIyYH4iOKgb1log29buP74TRBpDOW4b4CJUPxpeUz8BkoF47hOYLZcYarNr1Cg
         i9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696543031; x=1697147831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAYKChfRdgudPucMl+HqonIt/5AX5oN5CCdBSnTYy0c=;
        b=p4DBT2mzXm7i3ZBNXX/ZkWL76NHqdKVeqNeh0nW7EeNUKlvBvcZrTx2eXs0CYbar6l
         CBasPQCFOwejCHvpVURn5BWvdxJN9CpHlyRMdvOjNQGA1fEhm3mJf4lLoTXS/k/GRjRu
         ctTsUv4wIJW7X58qC7nWH+Qnw5HN3tzn2cs3c3lQgkqB8nzu58d1YhGVD8Drcd3kf6mo
         jGvPoLf3L30CPtRKNcbLUn5qpx88BZKOrcnJhVIuVmnwxZt69fnse+WrbWyAyhGsmEBT
         friAdQm8K3vzgF+erJ1CkXrgu25Ed1rCprtt2MAHxXrd9Pb7YZ/pO5bLSJXPzg5KvppR
         l+ag==
X-Gm-Message-State: AOJu0YyDJbYD+t5hVzy+DCPedsQtv8UoWfC4dSfxoGp1e3EdIe9PSvx0
	HtFQXV8IbYU+TTlNhaLC0IRamt7/DR2RhXjL2jo=
X-Google-Smtp-Source: AGHT+IE7Mh8ZxS9AEdUoRo8DfhqsdjKx0m14eBvMkDCkjbKr9ARO/M6kPfpebfea3wIhcrXCtgeKYHTEYOpyT1BJiWU=
X-Received: by 2002:a05:6870:888b:b0:1bb:8842:7b5c with SMTP id
 m11-20020a056870888b00b001bb88427b5cmr7517247oam.43.1696543030835; Thu, 05
 Oct 2023 14:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231003232952.work.158-kees@kernel.org> <ca2006f4-a038-460d-a9ca-d14dca8e4a8b@gmail.com>
In-Reply-To: <ca2006f4-a038-460d-a9ca-d14dca8e4a8b@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Oct 2023 17:56:59 -0400
Message-ID: <CADnq5_MfkVQNU268wg1b6AStnELjvrpgU4Xrf_k-Qa2KsXGcmg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Annotate struct amdgpu_bo_list with __counted_by
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Alex Deucher <alexander.deucher@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Tom Rix <trix@redhat.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dri-devel@lists.freedesktop.org, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Thu, Oct 5, 2023 at 10:32=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 04.10.23 um 01:29 schrieb Kees Cook:
> > Prepare for the coming implementation by GCC and Clang of the __counted=
_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> > array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> >
> > As found with Coccinelle[1], add __counted_by for struct amdgpu_bo_list=
.
> > Additionally, since the element count member must be set before accessi=
ng
> > the annotated flexible array member, move its initialization earlier.
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-hardening@vger.kernel.org
> > Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/exampl=
es/counted_by.cocci [1]
> > Signed-off-by: Kees Cook <keescook@chromium.org>
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
> > index 6f5b641b631e..781e5c5ce04d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> > @@ -84,6 +84,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev,=
 struct drm_file *filp,
> >
> >       kref_init(&list->refcount);
> >
> > +     list->num_entries =3D num_entries;
> >       array =3D list->entries;
> >
> >       for (i =3D 0; i < num_entries; ++i) {
> > @@ -129,7 +130,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *ade=
v, struct drm_file *filp,
> >       }
> >
> >       list->first_userptr =3D first_userptr;
> > -     list->num_entries =3D num_entries;
> >       sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
> >            amdgpu_bo_list_entry_cmp, NULL);
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_bo_list.h
> > index 6a703be45d04..555cd6d877c3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > @@ -56,7 +56,7 @@ struct amdgpu_bo_list {
> >        */
> >       struct mutex bo_list_mutex;
> >
> > -     struct amdgpu_bo_list_entry entries[];
> > +     struct amdgpu_bo_list_entry entries[] __counted_by(num_entries);
> >   };
> >
> >   int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
>
