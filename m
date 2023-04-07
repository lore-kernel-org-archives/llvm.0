Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545B0848E
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 18:17:15 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-62ddb232ddaso1036237b3a.1
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680891435; x=1683483435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuwimqlPO9HpY2//fLh7FzFmSEeSG4CgWKNzgwGf5e0=;
        b=Pxebkcm9CczGaHvPx5PvvvRnR6vaeDp6HKms/KgNAqJQXvWemgVDWj5OCZHUEsr5j3
         G9LMgv/KajspUvAGyGLQ7Iszic6kbG9P2k5NSjI2veF2IMW/awCFrSItQeZmJWK2XLZ8
         i6eaSk3xj2bQYr9/oCtHhhg4bWIW25XK+DRij7sRFBY0PrKPBfd43oe3kVErQiVRHnnP
         rBC1NfOjx2peA67xPLFCrmXLrsiOeHJW2kZXiKf92yzvKxgztNNJ4tJanifs/JMLrTin
         Iun3CcwO27658Fb0advMSuPzDrAVtKjlY5wElw8gSey5BR3sb1CzIGcoUtpUEIO4NNiT
         hDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680891435; x=1683483435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuwimqlPO9HpY2//fLh7FzFmSEeSG4CgWKNzgwGf5e0=;
        b=a1xQqOhy2YPsc0kTywEh4HPPBCf5w8EYG2SEmbZw1+kHXHFL6snRcrnJwfLC3yS0G6
         n63UKQAfsI3uJzXy4T25+T/t0WUVwpnTER9fRjJVdNf1qKrZlZhxsA/VcLcEMIykKMyQ
         JSCCGUmHwU4nzKYurg8+nG1OIHRQDV3Ld7wDfR0KRv07dK2i4dMuGtdOR1ttBVdAMr+z
         p3QkkLkPlQjN/r5hsjueO2JkEUvoX5quQ5UHmZveBTgtNyYk1lJXMbUYjKQUSRPids3A
         4n3YZSzZmzfvr11n0hTXEPL6i1syoUVTVhPM7446Cur8eQ7YfWHjQlBbKDSLGUP17qhZ
         L2yA==
X-Gm-Message-State: AAQBX9cgP0TRZReEcQrFdOxh35Qjdc9b02H8yTCmby90vRGcshLXfVlv
	jAKb0lhSU/Bp2wNB1wjLpGvTslYKWvW08rdigxp+tA==
X-Google-Smtp-Source: AKy350Y6wWEggvCrlIf1bje2atujKhf9qMM/qxlunzgcridw/Fvst4ed6hVP1rP9DeneT/1K3zn48LLIF486O17fgc0=
X-Received: by 2002:a05:6a00:2ea8:b0:61c:67d2:a332 with SMTP id
 fd40-20020a056a002ea800b0061c67d2a332mr1427088pfb.3.1680891434554; Fri, 07
 Apr 2023 11:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230331164041.1859088-1-trix@redhat.com>
In-Reply-To: <20230331164041.1859088-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:17:03 -0700
Message-ID: <CAKwvOd=5Uw=6_8erAq0gt_-URUqXgK2ZvtCv5Ch_VZdk01sayQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove unused num_of_active_display variable
To: Tom Rix <trix@redhat.com>
Cc: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
	Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org, 
	Hawking.Zhang@amd.com, kenneth.feng@amd.com, lijo.lazar@amd.com, 
	KevinYang.Wang@amd.com, tim.huang@amd.com, andrealmeid@igalia.com, 
	Kun.Liu2@amd.com, mario.limonciello@amd.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 9:40=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1700:6: error: variab=
le
>   'num_of_active_display' set but not used [-Werror,-Wunused-but-set-vari=
able]
>         int num_of_active_display =3D 0;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Fixes: commit 75145aab7a0d ("drm/amdgpu/swsmu: clean up a bunch of
stale interfaces")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/=
amd/pm/swsmu/amdgpu_smu.c
> index b5d64749990e..f93f7a9ed631 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -1696,8 +1696,6 @@ static int smu_display_configuration_change(void *h=
andle,
>                                             const struct amd_pp_display_c=
onfiguration *display_config)
>  {
>         struct smu_context *smu =3D handle;
> -       int index =3D 0;
> -       int num_of_active_display =3D 0;
>
>         if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
>                 return -EOPNOTSUPP;
> @@ -1708,11 +1706,6 @@ static int smu_display_configuration_change(void *=
handle,
>         smu_set_min_dcef_deep_sleep(smu,
>                                     display_config->min_dcef_deep_sleep_s=
et_clk / 100);
>
> -       for (index =3D 0; index < display_config->num_path_including_non_=
display; index++) {
> -               if (display_config->displays[index].controller_id !=3D 0)
> -                       num_of_active_display++;
> -       }
> -
>         return 0;
>  }
>
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
