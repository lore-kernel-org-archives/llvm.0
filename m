Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE9848E
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 18:21:43 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id o11so40636416ple.1
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680891703; x=1683483703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZdRaKow9MiJw77AIs6HNE5L6Bt+Axun0Z6165dll/w=;
        b=o3WtKycKtV542XSaicFZz0CZ/dev938aAn+qeeNOY8WRyHVIze4YnJcFgiiCsWaJxV
         Ajd71OA0ng3Iisqa/ZJw1jna4z9PJi5fh7kAxvyGHi1kAoeLTxecd7HJsNnkjtM/ct+x
         emcM3MoywW3r3eCx1wcYy4wWI2bv+DS9v1sL47O7H1elmMk597W7oAgHNauc5/iOBFpH
         6Wnov6/4+cfjUr6gNj+wyBLCt4+2Xk9D7yEQQESblpkSTIwBCJElhNz6OS5Rj33wpnKO
         cnOUzmdDfEz++ahqDKTY62TN4cPZL+eaoeUJJFSxTblMU2G2LmxcljBt5McsPw1BoSWu
         m72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680891703; x=1683483703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZdRaKow9MiJw77AIs6HNE5L6Bt+Axun0Z6165dll/w=;
        b=SgFpCca0l0F5B1zKn+5Cx3IqABXFzj29oc/bvJKyGYnu1ScxA32UhsEw1CWLzIj6Ro
         qXt8kxZDAB6WhjKOVz6Ei/vsXchobwOz5lCT6Pzx8ZeSMbDJWJ3INKJ3ZD+wOR1koogK
         qfaAaI3SYCW+FBzreU61+y1suKkEMINEyL9FPH571MMamMJ8+XjPvXHUFMUpwkMvxHc4
         SdC3Urpz1RGmFCxXAoUI2P+7PtKSVK++aC07wT+uzrjbYHg5812xnLqVMX+DB8ZDkpUc
         6ilRoLgHP59tHCxz5cpoFNx3sOCNCwZ4yjlBI9KmVGEuOcFk1I7YztDFJapcemhaVJFw
         CvVg==
X-Gm-Message-State: AAQBX9fd88NlhJVOG1dR7qXxJ3MSeHuTu30xjoZv8hArUeOKKeJvly/K
	aVMH9fl5Wm2MtvATWZBvmRSjdNSiVsg+ohYp4TI0lg==
X-Google-Smtp-Source: AKy350bi6/Eqyz2r683FnPvRwH6NTPyo8wV2nEG2rf8+C/NqkAczhLhuqlNMO7AwVBgrZzZVxiS/kkIt6VR0vqaeXZs=
X-Received: by 2002:a17:902:da85:b0:19f:2aa4:b1e5 with SMTP id
 j5-20020a170902da8500b0019f2aa4b1e5mr1212280plx.2.1680891702918; Fri, 07 Apr
 2023 11:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230331172423.1860083-1-trix@redhat.com>
In-Reply-To: <20230331172423.1860083-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:21:31 -0700
Message-ID: <CAKwvOdkoYTVYeN9G-YB5ADq1Lt35d265pJHCOcy-Ro-22PFM4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/qxl: remove unused num_relocs variable
To: Tom Rix <trix@redhat.com>
Cc: airlied@redhat.com, kraxel@redhat.com, airlied@gmail.com, daniel@ffwll.ch, 
	nathan@kernel.org, virtualization@lists.linux-foundation.org, 
	spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, fziglio@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 10:24=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/qxl/qxl_ioctl.c:149:14: error: variable
>   'num_relocs' set but not used [-Werror,-Wunused-but-set-variable]
>         int i, ret, num_relocs;
>                     ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Fixes: 74d9a6335dce ("drm/qxl: Simplify cleaning qxl processing command")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

That commit should also have removed the label out_free_bos IMO since
having two labels for the same statement is a code smell.  Tom, do you
mind sending a v2 with that folded in?

> ---
>  drivers/gpu/drm/qxl/qxl_ioctl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_io=
ctl.c
> index 30f58b21372a..3422206d59d4 100644
> --- a/drivers/gpu/drm/qxl/qxl_ioctl.c
> +++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
> @@ -146,7 +146,7 @@ static int qxl_process_single_command(struct qxl_devi=
ce *qdev,
>         struct qxl_release *release;
>         struct qxl_bo *cmd_bo;
>         void *fb_cmd;
> -       int i, ret, num_relocs;
> +       int i, ret;
>         int unwritten;
>
>         switch (cmd->type) {
> @@ -201,7 +201,6 @@ static int qxl_process_single_command(struct qxl_devi=
ce *qdev,
>         }
>
>         /* fill out reloc info structs */
> -       num_relocs =3D 0;
>         for (i =3D 0; i < cmd->relocs_num; ++i) {
>                 struct drm_qxl_reloc reloc;
>                 struct drm_qxl_reloc __user *u =3D u64_to_user_ptr(cmd->r=
elocs);
> @@ -231,7 +230,6 @@ static int qxl_process_single_command(struct qxl_devi=
ce *qdev,
>                         reloc_info[i].dst_bo =3D cmd_bo;
>                         reloc_info[i].dst_offset =3D reloc.dst_offset + r=
elease->release_offset;
>                 }
> -               num_relocs++;
>
>                 /* reserve and validate the reloc dst bo */
>                 if (reloc.reloc_type =3D=3D QXL_RELOC_TYPE_BO || reloc.sr=
c_handle) {
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
