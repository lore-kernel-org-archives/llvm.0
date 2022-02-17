Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8B1FD3
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 16:31:42 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 4so145187oil.11
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bElm5YilB/9jblKEU64fD/ESvy8c+wLEV4cgX1XhWn4=;
        b=Eq1tUKgqg59a4QA5ulUqAVWGJmM7UV+1lWzQXL+zegdCS5/d4qsDlC5deH1OCwWstU
         +C+uqqiZW2o3xKjbO23EnJl0d5uDvEe0lBrIH9PC5UwZ/u7Ts/hHBW7kzkx3yt4hxJ2M
         rw3a0q7ng+L5mm+KXKUAhVfwJoa1z3hmwUV7t8JtlBRa9fIOEL68OVNeV4kmYlgnkITW
         EO5lyysg+u3N2lBo8T8NUN78/kNWlDRnW35krNMGCsbBxLBuhxTgjQcvYJZ0rVp2HesJ
         QStSRNSpghG4F6RXqxSrxcLIbzpF0KewldPbmspmkxAT1On4cwLlW2PHhXBBIHEFLBVn
         5PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bElm5YilB/9jblKEU64fD/ESvy8c+wLEV4cgX1XhWn4=;
        b=UpYeqi+3phD6dT4rVlkBReqaktjTczZC3m9iqbPU/uKNG+l0WffgCzwEhMUmb18sxR
         tfHwB5PUq2cNK/81rgNJmHp+QZVTvp+6tsRg0M7xMvo+sEhZ2e02taf3uvxTUne2PdVG
         MNdOmuxj8iy7vXCcEBLLe3+hyxMuHKRX3lrvr89z3hdoU6bg+lExx+PSZCmRr9WWK9kb
         zlFB2VZrhBS2Al98PD0B3HHN3g7c6pctbPVEdNzLSO/fDjbYCHAE+768WsrXGoq++3Qv
         PC3Js9pFZxB6Bzxj2vzPIJD/D54kwxK20AGxqti32jo6wtjE7k6NIS8IM5phWAuECs+R
         78Jg==
X-Gm-Message-State: AOAM5320qXbRLWnVDa1o+jcWCYWoGVcPok3nawVcJIV4VIWuWlrhvDKJ
	L4Enx2ShRQ2JV9QBfd4FuoO58/ISB8MxEs5cr7A=
X-Google-Smtp-Source: ABdhPJx6a+RRNxIK4nxCa4AWmBuTIaxNxYd6UitmMWxs/iXH4phTUwHGWoWwQkdU27X2KXRi4tD18lfFTVADnZA347A=
X-Received: by 2002:a05:6808:f8b:b0:2ce:6ee7:2c99 with SMTP id
 o11-20020a0568080f8b00b002ce6ee72c99mr3205163oiw.199.1645115501464; Thu, 17
 Feb 2022 08:31:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217162142.1828990-1-nathan@kernel.org>
In-Reply-To: <20220217162142.1828990-1-nathan@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 11:31:30 -0500
Message-ID: <CADnq5_PmT3aWqGR7fAYxAvgAv7875kGjKo5tAQyGKeYuRrvAZg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Use proper enum in pm_unmap_queues_v9()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Jonathan Kim <jonathan.kim@amd.com>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 17, 2022 at 11:22 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
>   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_packet_manager_v9.c:267:3:
>   error: implicit conversion from enumeration type 'enum
>   mes_map_queues_extended_engine_sel_enum' to different enumeration type
>   'enum mes_unmap_queues_extended_engine_sel_enum'
>   [-Werror,-Wenum-conversion]
>                   extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
>
> Use 'extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel' to eliminate
> the warning, which is the same numeric value of the proper type.
>
> Fixes: 009e9a158505 ("drm/amdkfd: navi2x requires extended engines to map and unmap sdma queues")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1596
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index 806a03566a24..18250845a989 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -264,7 +264,7 @@ static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffer,
>                                         sizeof(struct pm4_mes_unmap_queues));
>
>         packet->bitfields2.extended_engine_sel = pm_use_ext_eng(pm->dqm->dev) ?
> -               extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
> +               extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel :
>                 extended_engine_sel__mes_unmap_queues__legacy_engine_sel;
>
>         packet->bitfields2.engine_sel =
>
> base-commit: 3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
> --
> 2.35.1
>
