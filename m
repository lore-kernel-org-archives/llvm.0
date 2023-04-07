Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A11847C
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 17:40:17 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id z18so24847722pgj.13
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680889217; x=1683481217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKb29bg6tx4CJhhRnFeIAgI2BubugDeo6AhQSNXoOjk=;
        b=ZeOB4N2nMw/T0W+m53HyspppsYTatXHFUsBPQrdircDHtMw9efqiwwPC8ouTXD5mmu
         GzIE9+OQmYiyOhMOwdkgNlwXMnhivea/lDdwCLnEhl07OIkr/snh4v8BDsU9kj1pW442
         nnnpcNzvMbXmlSalIpGUu9AETBoPMxQmphh/+OqdyeCfBJcxrC7ktOmrrk6/7/r1m+Es
         GOkPApNDdYjVeFSF9RDu5xLGpCo5t/z41TOkPkYQO0CezUmwqryKvM+EXpH+WYgIMBzl
         8bN3+fxTUcGaPyn1TMdNEcmCoXvSL7igHt9YU+N2N+I6CBRUQdqN+oJfYsZBoM3wYp+A
         LiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889217; x=1683481217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKb29bg6tx4CJhhRnFeIAgI2BubugDeo6AhQSNXoOjk=;
        b=Z9qj2ObZyEPusH7zNUUXZpSw+7N6wJXhnr8d5Zhggw72ahJy7+3Wz61BrXyNIKcUlf
         ZKDZDeVwvDVyjZoEH8mlvf2e1s6AhtEIw1ByjZTVXwfWs9gjiEpPV5MsGRFapBlisSNu
         1xiZZYJ8O8Lx+lpYK8Wf68juG6IHDMRLiYp1XtkWpo8mGmBRRkVdhYvrlB1lR/ZFWB71
         Yy9Q+NFgNbmNI1Rq3xXKSIysj1D8e9n8kBODlFuJbx2YLiA9H1Xt8hb7zqLw84F3Iw2N
         t9tncQGLPNR+Nbk1vQvtKqskxg66BSdtPb6/iZHn31W8Bao4twHKkzdsnhG3I88qpEso
         RxqQ==
X-Gm-Message-State: AAQBX9fXRAkerDWspGEnH318ikp+i+61qv8LJSKEB/TIIugtxmZO9c0T
	ARCSddb3f3VEuO7quigp81I8IlrbSSP2jrpP2fRaGw==
X-Google-Smtp-Source: AKy350YUCzPBLxgYgXKQV3bzEg9zkHgzG9zgtpSVZEJ7BtTpjnG8NvJ6+yrbg54qCj108b33TAynRrQ6bp7uhOQcDco=
X-Received: by 2002:a65:578e:0:b0:513:a488:f05f with SMTP id
 b14-20020a65578e000000b00513a488f05fmr622511pgr.1.1680889217290; Fri, 07 Apr
 2023 10:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230321182414.1826372-1-trix@redhat.com>
In-Reply-To: <20230321182414.1826372-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:40:05 -0700
Message-ID: <CAKwvOdnrKujpv2A6a-6U6pxpd3Z9mKwV3SgD6ZL+ie4-g4n2-g@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: remove unused vmw_overlay function
To: Tom Rix <trix@redhat.com>
Cc: zackr@vmware.com, linux-graphics-maintainer@vmware.com, airlied@gmail.com, 
	daniel@ffwll.ch, nathan@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 11:24=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c:56:35: error:
>   unused function 'vmw_overlay' [-Werror,-Wunused-function]
> static inline struct vmw_overlay *vmw_overlay(struct drm_device *dev)
>                                   ^
> This function is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_overlay.c
> index 8d171d71cb8a..7e112319a23c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -53,12 +53,6 @@ struct vmw_overlay {
>         struct vmw_stream stream[VMW_MAX_NUM_STREAMS];
>  };
>
> -static inline struct vmw_overlay *vmw_overlay(struct drm_device *dev)
> -{
> -       struct vmw_private *dev_priv =3D vmw_priv(dev);
> -       return dev_priv ? dev_priv->overlay_priv : NULL;
> -}
> -
>  struct vmw_escape_header {
>         uint32_t cmd;
>         SVGAFifoCmdEscape body;
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
