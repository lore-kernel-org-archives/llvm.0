Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4E1D297
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 17:56:27 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1dce0f9e222so2464765fac.0
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 10:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695664587; x=1696269387; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1F9rg4X23ujFzzgF5l8L8aKk/znEnb8MB1jEXGz6ng=;
        b=gzkTYfW9eRqhFYIKAVkpxkB592yspFBpWpH2pcpX06PdaT3IaFvNeRIdNDMWNW/yaD
         xjW2bTVRmUGgO0xZ1DR5TdZd4Q/piHfxTmua3Doey8rdp9hA8gQ8wE5WapiXG6Fo2ihY
         0z5ouSVKf9zuhYABQi+ncGzTNvsB9Dz/P3A71Ldx4cTDgJvyZIDcbsFpEa/oNgiZkVGe
         mHTk8AWji6nOI7R7xBUt9kLaVCQ70YzS7n4hsdDyN6iogopc1W69Lv7WxKZfqxQbBXhM
         X9jtegFE0sYV2wDOpnKSjpzgRJp+juIrJUqPjL+EfkpToUjwFwA/qpcKzKDon6zFE3bH
         JDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664587; x=1696269387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1F9rg4X23ujFzzgF5l8L8aKk/znEnb8MB1jEXGz6ng=;
        b=fQ8QIFPkGWJbwcy+aUk7eswYl5YfnkHXJZsDFoMs7oWDlow4iq7xrF37uLykcNB2gX
         ez+xjVRWxnYGChiOhflpIkYB6JUyC6H5vjvQpCuBFtYG2CVFfJJehjEkkaMARZ0EaiGs
         2yl9qY8i5BKjEW44rdHb8/aT3V5IlN/dAe9KLivd+a4sj1OkW8CgaOduSw1qssBHTpkK
         LVy0gNbrDV8MrGart5mUhJhgL1DVFkud9gKie5a53fhD5jomiRSd8ans/LnZ6SgPptG6
         RB+TsIshrcPhN1rw8j6OXJpIOe1bPqIOo9wPXe9czc5KKR4KtMOz41jfwN9DVJEggeET
         2sJw==
X-Gm-Message-State: AOJu0YxBB/TupDJngVqZKdnMbNrEIMhvMq42buXQ9jwtTSA6XKUuSVen
	wrwhNIIc4/XYwIK2yo9qVCb8Kfawa10V6DN6KZk=
X-Google-Smtp-Source: AGHT+IHKGmpSNoLKRlPKgMz3PfLu9l0asTJ/KJeRR4YlCqKx/0xgmJzaJCWHK+NWln0berAZsxELHx2SNeMkUMNHpCU=
X-Received: by 2002:a05:6870:c227:b0:1db:3679:198a with SMTP id
 z39-20020a056870c22700b001db3679198amr8758871oae.24.1695664587047; Mon, 25
 Sep 2023 10:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org> <20230922173216.3823169-1-keescook@chromium.org>
 <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
 <2635922e-f52a-4e91-40c6-4f1358972786@amd.com> <202309251051.EE3ECE7B@keescook>
In-Reply-To: <202309251051.EE3ECE7B@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Sep 2023 13:56:16 -0400
Message-ID: <CADnq5_PaXmFa6N_2-NRp7_2+m3TYt8s--4aYm1UTnQKXDUhwYw@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table
 with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, 
	Emma Anholt <emma@anholt.net>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, 
	Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthew Brost <matthew.brost@intel.com>, 
	Karol Herbst <kherbst@redhat.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	amd-gfx@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, 
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, 
	Andi Shyti <andi.shyti@linux.intel.com>, nouveau@lists.freedesktop.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org, 
	linux-hardening@vger.kernel.org, Lijo Lazar <lijo.lazar@amd.com>, 
	Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Melissa Wen <mwen@igalia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xiaojian Du <Xiaojian.Du@amd.com>, 
	Le Ma <le.ma@amd.com>, freedreno@lists.freedesktop.org, 
	Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
	Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.das@intel.com>, 
	Lang Yu <Lang.Yu@amd.com>, John Harrison <john.c.harrison@intel.com>, 
	Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 1:52=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, Sep 25, 2023 at 08:30:30AM +0200, Christian K=C3=B6nig wrote:
> > Am 22.09.23 um 19:41 schrieb Alex Deucher:
> > > On Fri, Sep 22, 2023 at 1:32=E2=80=AFPM Kees Cook <keescook@chromium.=
org> wrote:
> > > > Prepare for the coming implementation by GCC and Clang of the __cou=
nted_by
> > > > attribute. Flexible array members annotated with __counted_by can h=
ave
> > > > their accesses bounds-checked at run-time checking via CONFIG_UBSAN=
_BOUNDS
> > > > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-f=
amily
> > > > functions).
> > > >
> > > > As found with Coccinelle[1], add __counted_by for struct smu10_volt=
age_dependency_table.
> > > >
> > > > [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/exam=
ples/counted_by.cocci
> > > >
> > > > Cc: Evan Quan <evan.quan@amd.com>
> > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > Cc: Kevin Wang <kevin1.wang@amd.com>
> > > > Cc: amd-gfx@lists.freedesktop.org
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Mhm, I'm not sure if this is a good idea. That is a structure filled in=
 by
> > the firmware, isn't it?
> >
> > That would imply that we might need to byte swap count before it is
> > checkable.
>
> The script found this instance because of this:
>
> static int smu10_get_clock_voltage_dependency_table(struct pp_hwmgr *hwmg=
r,
>                         struct smu10_voltage_dependency_table **pptable,
>                         uint32_t num_entry, const DpmClock_t *pclk_depend=
ency_table)
> {
>         uint32_t i;
>         struct smu10_voltage_dependency_table *ptable;
>
>         ptable =3D kzalloc(struct_size(ptable, entries, num_entry), GFP_K=
ERNEL);
>         if (NULL =3D=3D ptable)
>                 return -ENOMEM;
>
>         ptable->count =3D num_entry;
>
> So the implication is that it's native byte order... but you tell me! I
> certainly don't want this annotation if it's going to break stuff. :)

In this case, the code is for an integrated GPU in an x86 CPU so the
firmware and driver endianness match.  You wouldn't find a stand alone
dGPU that uses this structure.  In this case it's ok.  False alarm.

Alex
