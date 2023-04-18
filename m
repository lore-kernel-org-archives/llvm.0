Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80857AFED
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 20:09:51 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-247122e9845so1574122a91.0
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681848591; x=1684440591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJjRijV5blbjzZLZll3N1JO9eikZc6Mlip365pggL9w=;
        b=RxI8ccMnJU34C26Ht6af/Th3w247gQIO0uQnzRfH2qt11y5bG/KVu1JIv98zlpx4D1
         6+T+7fm9LFj2LYaDIo2LT8T1Xo9ePq7ThXSPvAlSvNHct8dmTKu+ixGW2MxKCmKPEic5
         0NMP5HW32YUXzNX6ZAvMzUZ+r7/o+fZqhWAmOZNWEtuGQr2uKAwqdsnDPOcnCQXkusAL
         lEJpFgOxxgNb/wSBQGjXS2rZ5x92nLQ4+hV53yJlZyN8pSO9LtwYDE3KxhzcV0myrIXX
         ZNsRtuRyCHtRAnfOYgVIMLVSDSYy3KfNTnfDpnhlSRuUbePgyG4vh2nQsd84Uc0WGgIG
         AqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681848591; x=1684440591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJjRijV5blbjzZLZll3N1JO9eikZc6Mlip365pggL9w=;
        b=WLT/Ze1EX8sl5j9WUbjUZas0xZHp9y3HpRSh3SyzLXCLuFOM0iufSehTt3/6vIgIDN
         U9ZS6nIXXrVhvO7Jx2bKhX5r5J4gS6VUknbTW22P27uRmpBkMYIc1Sdtr5ZdAB/lMKjW
         mvQ8f5m8JXQKWHTN0y50+04dq7vp/kifmzr3C1C3k/NuGMhrTUrkQn4apVQr3pkt3wgI
         GT5wSFH6L2UdUxVB64fFCNp/RYxGCkuKk8b1WPV2+c5rH/yO+22Yd+SrDUgjHaBZZVsu
         eFRUfKT7CGPEcn1bFzMYKtK9xqp9Wphj5Yy+gl7VYJZ/JDHT/MJXC8wNGYBlQtWf7I6S
         0iYg==
X-Gm-Message-State: AAQBX9f/XegfOGjU9pWXEvXg9t4s37vTSUoIq0K7hdtFp7AimRcgvcDg
	xn5Urdh5xqlc9Gq1DF0OncEcErWieqakAMN5D3UgzxWPkYWe3Jm11eUd0g==
X-Google-Smtp-Source: AKy350baeGq9wa+UpgsWuLoH1elNcvdt1oOkfqqmaCQpAHbi6Eath+2E2j22ABbywJdPOlHgLe3u3xkeQP5kmoW7nv0=
X-Received: by 2002:a17:90a:fe8c:b0:246:f73c:3aba with SMTP id
 co12-20020a17090afe8c00b00246f73c3abamr618143pjb.39.1681848590753; Tue, 18
 Apr 2023 13:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230408165023.2706235-1-trix@redhat.com>
In-Reply-To: <20230408165023.2706235-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 13:09:39 -0700
Message-ID: <CAKwvOdmFtc0shP45t7S9aoh1+UGXyaX_aodvJd97d-nH5J0HQg@mail.gmail.com>
Subject: Re: [PATCH] drm/qxl: remove variable count
To: Tom Rix <trix@redhat.com>
Cc: airlied@redhat.com, kraxel@redhat.com, airlied@gmail.com, daniel@ffwll.ch, 
	nathan@kernel.org, virtualization@lists.linux-foundation.org, 
	spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 8, 2023 at 9:50=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable
>   'count' set but not used [-Werror,-Wunused-but-set-variable]
>         int count =3D 0;
>             ^
> This variable is not used so remove it.

Thanks for the patch!

Fixes: 64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_cmd.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.=
c
> index 281edab518cd..d6ea01f3797b 100644
> --- a/drivers/gpu/drm/qxl/qxl_cmd.c
> +++ b/drivers/gpu/drm/qxl/qxl_cmd.c
> @@ -421,7 +421,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
>  {
>         uint32_t handle;
>         int idr_ret;
> -       int count =3D 0;
>  again:
>         idr_preload(GFP_ATOMIC);
>         spin_lock(&qdev->surf_id_idr_lock);
> @@ -433,7 +432,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
>         handle =3D idr_ret;
>
>         if (handle >=3D qdev->rom->n_surfaces) {
> -               count++;
>                 spin_lock(&qdev->surf_id_idr_lock);
>                 idr_remove(&qdev->surf_id_idr, handle);
>                 spin_unlock(&qdev->surf_id_idr_lock);
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
