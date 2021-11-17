Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0269772
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 21:40:42 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id q25so9573323oiw.0
        for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 13:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=80qrjaKuckfIxKf3DLVTv6a7iYoyD9Sd1U/A6GrtV40=;
        b=AjM9ULmodQVC58Cu0Dno9jz4ysnFH2WEnIivupLTuRkk7hn0LPaYS477qAkjYt4T76
         4L9um1lijnyvYCMUp3vkHhHEDwwL/1CjaDGhIxJcnnL+2upS7hXM90dXhFInZVc4fUTG
         ZOwqBRuF+Js5dkKZXWrqx2eXCoY7ZJNxokKNSmIKfQKUma6a8m2ue84OLVluZsP0qKlQ
         vIYnpkWXh70s1glTHAWmfwHfJwIUmkDDjM2dKUKeRnIEbSnMTK0WtHlJV0cuB4KAtI5t
         qsIwC5bSbizogJ/rE5xWK/vJwUecbWTGUe64Q0bawFbMB1+1hZ5mf3M0zO8tDfQIhLtu
         bQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=80qrjaKuckfIxKf3DLVTv6a7iYoyD9Sd1U/A6GrtV40=;
        b=HPegLiMHkC8H0APNGaE+XqZG/9f4OotEKpze4My5yt1zqTustpsWOEaX1LbHtEtg1l
         bjOSmNr+dzvcRY5eGuci3SI/37XOm9jWdnSqB3kq4e34x8MXjMk6nnmhksg9Wo73XZVd
         SuekuDnLPL4TTrA6lBayC2vOuje5N0d1v92Ps1tUti/G2MN9ajstULDsK/Z/b+tSmRBJ
         3xeUqw4vgYV7tq0TLPoYfmGK0qcnZ9x9oBAcLK1yaKhuHdjnmHI+5Bgxx58To0iyjJyt
         d8DMdwKQ0Vs6EdmORN0ywLANLpEDj7qsQXwgp9J112VhRaz17fKblgjZTuY+WIWiLe00
         rNow==
X-Gm-Message-State: AOAM531nQ6+nv4TQByoBEfA1pofRCGfmbYz1tKTTLpkh8i9+UZe7Lz9y
	8J3AlS5ZbLQTuBdkAf0cWDP1bZ7cQh9RZeKidVA=
X-Google-Smtp-Source: ABdhPJxrs7xTtPn1zFRtZ5i3FY/8UZ/DJotfsZ7+hYwxZMxL6ar5KwSQnPGsPX0qTiwORjQm6ItE+gRSOvERV7I704w=
X-Received: by 2002:aca:3f87:: with SMTP id m129mr2809816oia.5.1637185242017;
 Wed, 17 Nov 2021 13:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1636963819-19726-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1636963819-19726-1-git-send-email-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Nov 2021 16:40:31 -0500
Message-ID: <CADnq5_O+h4J5hYrnODix4_bdMgyZMt-wcUsSWr6DGrWwUkJFog@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: check top_pipe_to_program pointer
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>, llvm@lists.linux.dev, 
	"Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, "Leo (Sunpeng) Li" <sunpeng.li@amd.com>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied.  Thanks!

On Mon, Nov 15, 2021 at 3:10 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Clang static analysis reports this error
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2870:7: warning:
> Dereference of null pointer [clang-analyzer-core.NullDereference]
>                 if
> (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
>                     ^
>
> top_pipe_to_program being NULL is caught as an error
> But then it is used to report the error.
>
> So add a check before using it.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 39ad385..34382d0 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2867,7 +2867,8 @@ static void commit_planes_for_stream(struct dc *dc,
>  #endif
>
>         if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
> -               if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
> +               if (top_pipe_to_program &&
> +                       top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
>                         if (should_use_dmub_lock(stream->link)) {
>                                 union dmub_hw_lock_flags hw_locks = { 0 };
>                                 struct dmub_hw_lock_inst_flags inst_flags = { 0 };
> --
> 1.8.3.1
>
