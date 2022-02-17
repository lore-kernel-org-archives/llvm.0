Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E1C4366
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 17:17:22 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id a6so296748oid.9
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 09:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k9zgQPfz8LOJwvyN9TkCqdRl9MbRaNDX/aR5wunJ990=;
        b=DINAnzkZ3yxrbaFtDAYZmhpuXrR/mzBHe+vr2DEiBG3ftwzLyGNCDwNo0aWdundMlY
         sYYPRo2ua/mUlkwsglmxpqxr04T8gzaIFbZPVILJZWFtt6KG8gOjF3ltKVAs7NB4Ll5A
         EYztNyGCg/NYX3KCvFPleeQ8mjTULOIut+sofWlAJbUmSJoGUrcL1hBg30XDPTzG2P4w
         UWMCShLbWEJwlle7OziBionFS3Twi3vfDUcs+1sPf0IUcWblXibpCNNarLcSJGdhlNIm
         72+weM6Yxvsi1mB0VDx+GRhGhoxE3g+vEl5TjBcOqh2X+IF/XQmtQZkwcqnFb9FB84W5
         fZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k9zgQPfz8LOJwvyN9TkCqdRl9MbRaNDX/aR5wunJ990=;
        b=vf44kbB7s9qxbqubW7QktFGffNzfxArBYoTvhc/KR5G0oT+Ubc5Y6CU3ukXQdrSX89
         15LCJHafivyM+YHZEgGOZYJNEeX7eMEurxljS9iUsVoZheYsjaASNpjORz1vK209tFxM
         vIrmS02/61T/Vcg8Fdt12hXkx7+uWvAAUsUYsu61zj7pGVTOjStWmH52vScBXRaQqcSh
         XpLsTH3Rr5bz9Mkw+KKf6tvBpoMijz/a6XuRLCJ6cmSHwQtoxXPEIKTXlENZV274ju+4
         jWJuHOph6ZygbT+yx2u/B6qR969hgtivIERSwORGBdmL1mfGpmoFsr7vzMajgJtd9iDv
         sZfg==
X-Gm-Message-State: AOAM532qndT/pqqspD6ZjCtykQJeVPgtX4PmVzGrXiuLp9h0rrgeotlt
	dghZlbxGypgEHGXjSKFMBWtEwN8kYr58n5pxpRM=
X-Google-Smtp-Source: ABdhPJw6jj/QGKAkol2tdthTwTYyyoP4CDqrp37TKDAO46tPjdL6fNFaDwTVUFznUtAy4H33vyaax1MFxyQNLygI+KE=
X-Received: by 2002:a05:6808:f8b:b0:2ce:6ee7:2c99 with SMTP id
 o11-20020a0568080f8b00b002ce6ee72c99mr3309777oiw.199.1645118241433; Thu, 17
 Feb 2022 09:17:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217164110.3258269-1-trix@redhat.com>
In-Reply-To: <20220217164110.3258269-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 12:17:10 -0500
Message-ID: <CADnq5_OasHZ=P_tkZrSSA87HACHJhQ49oMGSdFxzQ5g7GhjWMw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix typo in setting enum value
To: Tom Rix <trix@redhat.com>
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Kim, Jonathan" <jonathan.kim@amd.com>, llvm@lists.linux.dev, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Nathan just sent out the same patch and I already applied it.  Thanks!

Alex

On Thu, Feb 17, 2022 at 11:41 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang build fails with
> kfd_packet_manager_v9.c:267:3: error: implicit conversion
>   from enumeration type 'enum mes_map_queues_extended_engine_sel_enum'
>   to different enumeration type
>   'enum mes_unmap_queues_extended_engine_sel_enum'
>    extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This looks like a typo, the function is _unmap_, the enum
> extended_engine_sel__mes_map_queues__sdma0_to_7_sel  is _map_.
> To match the packet->bitfields2.extended_engine_set type
> it should be extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel.
>
> Fixes: 009e9a158505 ("drm/amdkfd: navi2x requires extended engines to map and unmap sdma queues")
> Signed-off-by: Tom Rix <trix@redhat.com>
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
> --
> 2.26.3
>
