Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E008482
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 18:01:31 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-50bf6f29601so150797a12.0
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680890491; x=1683482491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q77ZcgCYnodZClKQX1HhPOSoqs2rfxGtOfBwRswul/4=;
        b=b8gKd+6rbeWwg8r+DFOMum1BwImUQSQAJBPrje68ohZORJXaU6x2Xjwzkhvjx0zkBd
         5h5bRrw74dAx8oRlL3w74Jr9fcAfAvcocqj/1iJERl3gENUbwc4NGQ55i5HQ+b+0ZP09
         0rez9y9Qa5huxDLtpYeke3L8uF9vTMjRiL+vSbvl9/TsWbbjtrZCUB3oXEknJi7Yhk47
         JXF9nbuPR2gdw5dq4TaBv2MF+VCKznTZ3GqXyMZ37PRQS5m96O2D+EIpIAaQFlYoGbdz
         WsWo06NQmP1P4MIKU9TIsU4519oxYzv7nhhKpZgz+FnI+GxMuVQaX78O9G7tHEuj/+r8
         t6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680890491; x=1683482491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q77ZcgCYnodZClKQX1HhPOSoqs2rfxGtOfBwRswul/4=;
        b=UwC5L33DFADn0kxv8uOnxkLT70dJr6WfKa8va/8Ub9dwVWGNx/FHS79OncauqiH72Q
         QcvsXjHTWXviGzlD7pAPwhHKxlFEEsWJMsOhK+UvKZ2mMf9Jj4W5uXYhiv93o1UjO0kF
         BxszXF1+Id2pz09hQRwCU+YWSqyfL+j7+QlCCb/sPcHvSk+J4jdO6D+cqG58iHEgXyz6
         RXT7qsHmkNz8p2xX4gPq+jmCR7NwUw1mmxO8AuWjShjIgQ2pkH3/iu0sj9RV7G7xNeo7
         GnidWTsGgNY041FyGBq0oxccbcoTLH4IXIQWtVUmb0xsP4BzZlBhEQzDHVKvdFvrnpyC
         /v7Q==
X-Gm-Message-State: AAQBX9fa5Wf1xjYRUz+5Ua1V/ePyze9kFXQaTtLEN9xH9tAzftOZenlm
	6wLJd83DAWxopwbNZ+FsyLRVERtLXOmMBKl+vFZFhA==
X-Google-Smtp-Source: AKy350ZHpTLUkU+XPnuqC13BzSbCyuTyl9RXM3G4Em3Qru7EkrOtM+34INuQ/mLJt+FyJN0GtVAS94TF68VaGc2rObc=
X-Received: by 2002:a05:6a00:2e28:b0:625:c55f:bc66 with SMTP id
 fc40-20020a056a002e2800b00625c55fbc66mr1615956pfb.4.1680890490979; Fri, 07
 Apr 2023 11:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329231407.1816570-1-trix@redhat.com>
In-Reply-To: <20230329231407.1816570-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:01:19 -0700
Message-ID: <CAKwvOdnQCVZ+gqOWzsRvkSKbYFJdh5yAJEN-TT+7MC4e8tdu8A@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/svm: remove unused ret variable
To: Tom Rix <trix@redhat.com>
Cc: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, 
	airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 4:14=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/nouveau/nouveau_svm.c:929:6: error: variable
>   'ret' set but not used [-Werror,-Wunused-but-set-variable]
>         int ret;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouv=
eau/nouveau_svm.c
> index a74ba8d84ba7..e072d610f2f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -926,15 +926,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct =
mm_struct *mm,
>                  unsigned long addr, u64 *pfns, unsigned long npages)
>  {
>         struct nouveau_pfnmap_args *args =3D nouveau_pfns_to_args(pfns);
> -       int ret;
>
>         args->p.addr =3D addr;
>         args->p.size =3D npages << PAGE_SHIFT;
>
>         mutex_lock(&svmm->mutex);
>
> -       ret =3D nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> -                               struct_size(args, p.phys, npages), NULL);
> +       nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> +                         struct_size(args, p.phys, npages), NULL);

nvif_object_ioctl() may return -ENOSYS.  Seeing other call sites have
comments like:
114     /*XXX: warn? */
134     /*XXX: warn? */

or other places where the return code isn't checked makes me think
that a better approach would be to
1. plumb error codes back up through nouveau_pfns_map() (and other
call sites of nvif_object_ioctl)
2. consider making nvif_object_ioctl __must_check

>
>         mutex_unlock(&svmm->mutex);
>  }
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
