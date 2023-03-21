Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940B3212
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 08:20:54 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id s8so8349140pfk.5
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679386854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jr1BhuALy9XAego6b5UVtN71EPRczW+dr6tvJtB9h1Y=;
        b=oCzcn+cIlhpZEcIK/AOA0pR/20Gpgd0Tm3VulJkMjV3ceJd3kfxnXDTdsNyRP7gNh2
         cdDBUlOXB1PgGQitsqwzcxc6w3jBm3jbfeY4IZ3Ws/TKTIKaEIB+5Pbnz6SHGE2O2XUp
         2lvDW5kL6ZCgUOa4qgT9d1Rh5WeKTAQqvQniqfBHCSkTlF/RJIppvgDa70px5hYD4fen
         kTIsIQiLQRaRlHxmtg1trk791g2T0SnnTDB7b1TI1ayLXs5U3WjEUdVqF9wuljHpXT/7
         euE+sYGvW8YfjffTIhHBBLQJjrQKLWzFkOuqqkWdPl83yUuDQgNRTA+9/2QwiayA+Iua
         XE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679386854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jr1BhuALy9XAego6b5UVtN71EPRczW+dr6tvJtB9h1Y=;
        b=fN9ixKZUcmIhrhnt8QTRlkS08G0oFFFT3F7p07eknlTxgbi6X0DGWr28tLRb3Fh9bb
         ZZgZ4fUr7BRuxRq7i4eXkuGl9TXxvaN9mxIo/z/kcVnf9M0sZ5mXMhR1/wtPRai17C78
         3iy9bGb5AwEY0YKYXjXrJ4DAcQkmz1RllcJS3itRnRZPscV+K46fOLTtyGikAGLxcLS1
         yF60byaFcTy6UMI6EpGa65I9moMqnCqIrA7kyqAopxFQGcINvKDut2gsfelbZrxN1gIq
         Z8M+0UeaBYLy1wrR/olxDzXmjKWKs+ulK8eXSC+j2O+iOQAgEa/Ncx9IFtD+69ybB2B0
         DtEQ==
X-Gm-Message-State: AO0yUKUehHoX2YXomw6I5ILcFXKVDL1BubIGsS18mAZdhoc9rdY7YzCO
	X7IrKBdDz2DMBq6MoFvI9N5YQ78HIePJ384D2G0=
X-Google-Smtp-Source: AK7set9OHjXGmmq5OcDZabAExRFA2HJQohhoRRbZLZ2vOzaQtU0kJl1n7DBXcS2HNaFfJUQotoJd/CBHL5nDV00YGjU=
X-Received: by 2002:a05:6a00:2d9d:b0:627:fb45:9279 with SMTP id
 fb29-20020a056a002d9d00b00627fb459279mr1258618pfb.0.1679386853807; Tue, 21
 Mar 2023 01:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230319142320.1704336-1-trix@redhat.com>
In-Reply-To: <20230319142320.1704336-1-trix@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 21 Mar 2023 09:20:36 +0100
Message-ID: <CAMeQTsZmJP-RCXfMcLntLx-M=-O=D=hAvu5kNVJWwUzG3Emm=g@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: remove unused gma_pipe_event function
To: Tom Rix <trix@redhat.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org, 
	ndesaulniers@google.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2023 at 3:23=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/gma500/psb_irq.c:35:19: error: unused function
>   'gma_pipe_event' [-Werror,-Wunused-function]
> static inline u32 gma_pipe_event(int pipe)
>                   ^
> This function is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to drm-misc-next

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/psb_irq.c | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/ps=
b_irq.c
> index d421031462df..343c51250207 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -32,17 +32,6 @@ static inline u32 gma_pipestat(int pipe)
>         BUG();
>  }
>
> -static inline u32 gma_pipe_event(int pipe)
> -{
> -       if (pipe =3D=3D 0)
> -               return _PSB_PIPEA_EVENT_FLAG;
> -       if (pipe =3D=3D 1)
> -               return _MDFLD_PIPEB_EVENT_FLAG;
> -       if (pipe =3D=3D 2)
> -               return _MDFLD_PIPEC_EVENT_FLAG;
> -       BUG();
> -}
> -
>  static inline u32 gma_pipeconf(int pipe)
>  {
>         if (pipe =3D=3D 0)
> --
> 2.27.0
>
