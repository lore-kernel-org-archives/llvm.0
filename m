Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E72882C
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 18:25:02 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id d22-20020a17090a111600b0023d1b009f52so2022643pja.2
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680891902; x=1683483902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqDA4WRbqZ8pZx3U3y6YYJyg8kkdxxYYCziSSoMs6f4=;
        b=IxJT4QMtg5r1G4F+GoM/q1tJVSZvAIzcvgcNYRgfVw3xxAXMfzR1j8kFIJQ5+3LOP1
         3YHWb+PmbJpffDwUvHHaOXgcH2jW/vRq4CF9OWiUG3Yw3QmAQYL8j8U1clL3OB9jmSOy
         OyqeP0yvsylVpyedaCAmYyRhVhsHlrqYdOQkm6zEPNpcuTzw6LZR0eNjDkzB3H5FNkR2
         wu7pPND7ZoQbJtAPGlxSLa4vkDjlLenKV/r5RHZaltDRU/HzSi58qR/dbY+sR1VRcn3Y
         RBguN4BK97kV/rDwV1gdLloP/3QNpzjoWbdXoWTvO7wu3ee35i1j5aMXZ8rUuik0aKWR
         rCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680891902; x=1683483902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqDA4WRbqZ8pZx3U3y6YYJyg8kkdxxYYCziSSoMs6f4=;
        b=dnR7VegBg4HSk8mqsWsd4RjxLXEvJDX6OVW6Ccx7Xro5DeRbvHjEIxR0u7SjWyguWX
         gltiWm/qIir/VJ0O4bCINVPwMhVcO9e3E3eO2gFs6VYzW6EQ1gtoJBqi8bkP9vcyhS7B
         x+ndSkm60eeBAnjalUOIwpQucDKocj3IN4ruBrClQMxWUnlSidUXrWftlnNq99VEgKDr
         XH7KoNQvjHwDAKdwu9mLxfzAoGLoKUbt7aoTomBEfmj3LZUqheMC7hVCcRmo6x/mnaIm
         iKxFUh6BBSU5NCNoHyFh0DaiQoaz2j7AbtxTodbp4kcNN4H94A9T0We0vi5+6zpT0Mvp
         RSSg==
X-Gm-Message-State: AAQBX9cr0X7TBGpzfHlFEq6wU8HmRMvBkItKlbeL6ghCyeCtDsBNpqwg
	29cjjX2coBkphSPUx5NAm5IsPyB+IvcVyKGY+9b3Lw==
X-Google-Smtp-Source: AKy350bXQUYcPYmDw9ucdCsVzHEhLhSxuODvj2EavnS9lslRG5I8VtiLzyQAXkkbbqqxnfc/IY218hVz5XmMfH2ovNY=
X-Received: by 2002:a17:902:e54d:b0:19e:f660:81ee with SMTP id
 n13-20020a170902e54d00b0019ef66081eemr1104963plf.2.1680891902021; Fri, 07 Apr
 2023 11:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230331204209.1863060-1-trix@redhat.com>
In-Reply-To: <20230331204209.1863060-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:24:50 -0700
Message-ID: <CAKwvOdmkyXgii52gyD5uO7=BwYu0iJ9QZtbOcusE2PeH24f6uw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/acr: remove unused loc variable
To: Tom Rix <trix@redhat.com>
Cc: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, 
	airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org, gsamaiya@nvidia.com, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 1:42=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:7: error: variable
>   'loc' set but not used [-Werror,-Wunused-but-set-variable]
>                 u32 loc, sig, cnt, *meta;
>                     ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Ben, any idea if this was supposed to be used somewhere? If not:

Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index f36a359d4531..bd104a030243 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subd=
ev *subdev,
>                 const struct firmware *hsbl;
>                 const struct nvfw_ls_hsbl_bin_hdr *hdr;
>                 const struct nvfw_ls_hsbl_hdr *hshdr;
> -               u32 loc, sig, cnt, *meta;
> +               u32 sig, cnt, *meta;
>
>                 ret =3D nvkm_firmware_load_name(subdev, path, "hs_bl_sig"=
, ver, &hsbl);
>                 if (ret)
> @@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subd=
ev *subdev,
>                 hdr =3D nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
>                 hshdr =3D nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->head=
er_offset);
>                 meta =3D (u32 *)(hsbl->data + hshdr->meta_data_offset);
> -               loc =3D *(u32 *)(hsbl->data + hshdr->patch_loc);
>                 sig =3D *(u32 *)(hsbl->data + hshdr->patch_sig);
>                 cnt =3D *(u32 *)(hsbl->data + hshdr->num_sig);
>
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
