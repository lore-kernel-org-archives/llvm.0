Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F8CA2C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 18:26:06 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id p190-20020a4a2fc7000000b0031820de484aso20269670oop.9
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 10:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QlSvtvFbST+JRiZy0nw8qsurosZlPyiaBzL4u9A7NPg=;
        b=HXqACW//Zm0115qK79VxKxElAYlr95AzBf3cBr6QuimTb9boq0VaCrFqwmZvXHTKI0
         wKgj5UvN50iY0OiyrcX6/VJPFTxIBdus86P9uDgMpY7COalhtCiMDuUuNkmlHbDOMFVb
         7c/d/mm4z92AXKDl1cngznbb7e/JgfyeqwLfiV4dnWnr9nBwruWYPE1VizPeGLJfYvWI
         7NwGpT7iZsmEYd4jGbrlyV5wgk4jv2b7smJtuJ3GDbWT+eRbKGnewN7kUrlHZD7B1AEI
         Oiq83ESXQFphER2f1zpQGtfPQD7KZuYuCSsMt7OAkw/q8fXEk03RR3RKro0Ww3Cc5fwz
         yx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QlSvtvFbST+JRiZy0nw8qsurosZlPyiaBzL4u9A7NPg=;
        b=qjPn3//3C73VQMMWfWS7pQeKtY3jVpYqTh+XcfP8wXzfbZtfMzrbR7/WSjg3PRvZdH
         yGCzCGAmTweT2pJT/PdORvDxe53ct4SsbGHYICTgtabGhRgQ5dwcpHobi6/AMejAKJIo
         j77TUDAcJpqLfl3x5CMBmhqS939Xb9eKJpFKVA6c1nX87UgKO0KCXjTwYD0AixjqnmvE
         pb1OgIFKcpnp3HEOL8k059VP3UxQWkg8gXXlaQlv7udNCjY+hWGN5owgYbkzGi8m3wH4
         +uRIKE03e6TPc2d5K5Mcg5iEP/noF98vUMKndmiXRpWZjf869E0J+O8GzbkhRy1UENkW
         48sw==
X-Gm-Message-State: AOAM531gKHbvbn8dHdK5pbffBsUPffiFb71oeWfRLWWhFWmkOA3ydVHW
	ktN0lS2DSVcbTvLtfFaa+lu7MgjKD/6UfBrJ2Qo=
X-Google-Smtp-Source: ABdhPJwwkbSacvGQlLKe3Ok3VHnEV3xZS3SoGcqpH7A0COkvlXN8wexYw97Y95QA9d+schJeyBmufa9z8v8pu+r/cg8=
X-Received: by 2002:a4a:d583:: with SMTP id z3mr20564oos.68.1644863166025;
 Mon, 14 Feb 2022 10:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220214182224.2906060-1-trix@redhat.com>
In-Reply-To: <20220214182224.2906060-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Feb 2022 13:25:55 -0500
Message-ID: <CADnq5_MrrTXmVPv7ukkpq-+WWn7cKbF9CHjhsBnuRzqbriUN1g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check return status before using stable_pstate
To: Tom Rix <trix@redhat.com>
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Tuikov, Luben" <luben.tuikov@amd.com>, "Nieto, David M" <david.nieto@amd.com>, 
	Nirmoy Das <nirmoy.das@amd.com>, "Xue, Ken" <Ken.Xue@amd.com>, Roy Sun <Roy.Sun@amd.com>, 
	"Quan, Evan" <evan.quan@amd.com>, llvm@lists.linux.dev, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied.  Thanks!

Alex

On Mon, Feb 14, 2022 at 1:22 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang static analysis reports this problem
> amdgpu_ctx.c:616:26: warning: Assigned value is garbage
>   or undefined
>   args->out.pstate.flags = stable_pstate;
>                          ^ ~~~~~~~~~~~~~
> amdgpu_ctx_stable_pstate can fail without setting
> stable_pstate.  So check.
>
> Fixes: 8cda7a4f96e4 ("drm/amdgpu/UAPI: add new CTX OP to get/set stable pstates")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index 1c72f6095f08..f522b52725e4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -613,7 +613,8 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
>                 if (args->in.flags)
>                         return -EINVAL;
>                 r = amdgpu_ctx_stable_pstate(adev, fpriv, id, false, &stable_pstate);
> -               args->out.pstate.flags = stable_pstate;
> +               if (!r)
> +                       args->out.pstate.flags = stable_pstate;
>                 break;
>         case AMDGPU_CTX_OP_SET_STABLE_PSTATE:
>                 if (args->in.flags & ~AMDGPU_CTX_STABLE_PSTATE_FLAGS_MASK)
> --
> 2.26.3
>
