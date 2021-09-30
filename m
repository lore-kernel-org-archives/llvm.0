Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD67E72
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 17:18:56 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so8237470ota.6
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0AEwdvslYHUXs1dqzetG2U/icJ2B0o3I7Pc5jNQMpJk=;
        b=Z6NVRoXyvyBymM0wfTEIbRdKEFzPE3zEoQfQzXBE1Sa3C8tcMvesMOL73y29kgY8ux
         Q0tX6Lx8bD/XPIbppY9xCiNQcnwITqaA+VP8kH7xmzG2yPhsVXAC/9llUIr8trDN2aZG
         1q6NoEoZAyr2unmZZGnkm4YCz4bvoALVAdfJtgsRBXbF3Y7AYtM8sfJRcFJ9rrwat2XF
         F6F55z2CU+T+id9GUYKLdeaa6t/Vqwcg8EnOYf1/MpnpWeK0Nm5Y3mVS3n1RT+h60prQ
         n9GfgfylrpmQoLhGkylpedNBAWT3rDQOqo1fLNYm49NAxy91YgXG3LneBVGQXjWluEjG
         NKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0AEwdvslYHUXs1dqzetG2U/icJ2B0o3I7Pc5jNQMpJk=;
        b=BOZVDGQ8B4NjzpJxgN9kdDiJdgkh64BYmDQ7uvN4IFwqwE/FIBMCq1+GnuIlvLWDgF
         adlfV7w0i7ecpd/11Aswu/fciXumoD8oRKCz3MSVGOp1WT3sBs06jiGR3Xk+dKNmLH2Z
         qiaFLDjn09HE6gxmvSJENULo+bfzYzbYIe7kJCj4VlH1T9Ta5fmOKGYLQ6z+5nGcBxQf
         lPgBxdTQLa6hSruOHz/LUvH7820L+yRWBpaT+1boA3YUdYDK68c5lNwTjIhqflnrBkru
         FvZ0fkCSPii3aUWpsD6MDvQTQoOsdFDylUir1tg4YXHLiVRSj4z5WlICqGApevknxAfK
         H5fQ==
X-Gm-Message-State: AOAM532yYDDz7UK7awxGrN855Xga/bolsziefmPcNXta54rjSQg10F88
	Yoxj6IT4gTeUG9maIBqjQhFnv1hHfgfNV1rvsbThqE4q
X-Google-Smtp-Source: ABdhPJwZ+f3/GZr7/EhQcpADsCHcDrnSO+IWU2DxU0XdnmmE+Gn2F4P1HkTjRXY64eJeiizqhK+U7IZvCsBBAiYV2JQ=
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr6263825otd.200.1633022335866;
 Thu, 30 Sep 2021 10:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930161641.2333583-1-nathan@kernel.org>
In-Reply-To: <20210930161641.2333583-1-nathan@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Sep 2021 13:18:44 -0400
Message-ID: <CADnq5_PS3T6GpqL0zi6ct+QFFzutPJEuTy638O=-ik=LETKMYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Initialize remove_mpcc in dcn201_update_mpcc()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Applied.  Thanks!

Alex

On Thu, Sep 30, 2021 at 12:16 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:505:6: error: variable 'remove_mpcc' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         if (mpc->funcs->get_mpcc_for_dpp_from_secondary)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:509:6: note: uninitialized use occurs here
>         if (remove_mpcc != NULL && mpc->funcs->remove_mpcc_from_secondary)
>             ^~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:505:2: note: remove the 'if' if its condition is always true
>         if (mpc->funcs->get_mpcc_for_dpp_from_secondary)
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:442:26: note: initialize the variable 'remove_mpcc' to silence this warning
>         struct mpcc *remove_mpcc;
>                                 ^
>                                  = NULL
> 1 error generated.
>
> The code already handles remove_mpcc being NULL just fine so initialize
> it to NULL at the beginning of the function so it is never used
> uninitialized.
>
> Fixes: ff7e396f822f ("drm/amd/display: add cyan_skillfish display support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1469
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> index ceaaeeb8f2de..cfd09b3f705e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> @@ -439,7 +439,7 @@ void dcn201_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
>         bool per_pixel_alpha = pipe_ctx->plane_state->per_pixel_alpha && pipe_ctx->bottom_pipe;
>         int mpcc_id, dpp_id;
>         struct mpcc *new_mpcc;
> -       struct mpcc *remove_mpcc;
> +       struct mpcc *remove_mpcc = NULL;
>         struct mpc *mpc = dc->res_pool->mpc;
>         struct mpc_tree *mpc_tree_params = &(pipe_ctx->stream_res.opp->mpc_tree_params);
>
>
> base-commit: 30fc33064c846df29888c3c61e30a064aad3a342
> --
> 2.33.0.591.gddb1055343
>
