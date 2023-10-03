Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D2F517
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:21:19 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-99357737980so268789166b.2
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696375278; x=1696980078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NEDkCvEYEdfp18YGZL4PXY8c/uK5lT9K+U1l2rQw9o=;
        b=wtQ+l4gFv1dbO6zyELPmd0wPVJRKjX08qwgER0bF/ZsC/ZUrxyL2O0agDgLFwWZHk9
         KainRmBn8TYiQ5EinOPQMlnYZWIDs13j9M58kAqCctP+1ZMspJ8wUztiZfo+p8tc5pKL
         RMT6j90dl7QzRAdlVj0ofjQ6g11sl1+UYAXjYn/sDz6jWyqYUKv7wNp+bsC60qBFESB5
         0MEhO7jdXmjVs06xurqnuy29sPWvQutfjfmdGarMoUj8wk1WigmVrlSP6xZ3m4bFjpJ/
         /QWdIBpQ0nD62EE+k8gDgocmupVASXQSj1E6VRoc0NPKlK0cNnGEVntMQmTyluPYbziN
         87Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375278; x=1696980078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NEDkCvEYEdfp18YGZL4PXY8c/uK5lT9K+U1l2rQw9o=;
        b=UoMPHlzbUvpPj5JzbC/hcknlr4SOnthR7mrisxB3m8ENvHftICg0/JXfeo+WEiIfud
         KCZfjgcanDHcGFSFHisrRdqmoWJiTHjocqyH5TLw0rSo2bepJO7jp/E9iAlR6LbEluCJ
         ZRr6usMZeep50NixZbV2likMZnyt5z6YjRUToo2mY4hGMqUFvQKEZ2+F2qprnjzjxen0
         kjGckz6XrKuxvT10vwH4ZT1gvaZL9K1HRXC99LHQYdp/+YebFcSGnov1zEFyFfPFvNt1
         tN3ep2xTGLG0s1wi+ruyozfc9oWuAezi9AS2bxv4d/jEMjY8QtLK8lnsh0jPangx3sto
         MQgw==
X-Gm-Message-State: AOJu0YyhCOnhh39ZktmpRIsK/ahcGV+j2mwUCcIo0/8d6n9LZnT9p7mS
	0I5XE/0+avclW2FlmM0uTjEB15OOfLZSiFbALSIXrQ==
X-Google-Smtp-Source: AGHT+IG0gPECXGw9A/gIAqloUi1ngSn5XzFSHXVfzJRfB8/udSmpuXSq+v3fUnb1mtCR9QBgn9maksQ6/PKW4YpLkUs=
X-Received: by 2002:a17:906:3ca1:b0:9ae:55f5:180a with SMTP id
 b1-20020a1709063ca100b009ae55f5180amr594658ejh.9.1696375277697; Tue, 03 Oct
 2023 16:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231003231718.work.679-kees@kernel.org>
In-Reply-To: <20231003231718.work.679-kees@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 3 Oct 2023 16:21:05 -0700
Message-ID: <CAFhGd8p_o5xtmrV+Vm0JUR5VQmMenqtm3xbJuE0TSj-_4Bthfw@mail.gmail.com>
Subject: Re: [PATCH] net/mlx5: Annotate struct mlx5_fc_bulk with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 4:17=E2=80=AFPM Kees Cook <keescook@chromium.org> wr=
ote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct mlx5_fc_bulk.
>
> Cc: Saeed Mahameed <saeedm@nvidia.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples=
/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c b/driv=
ers/net/ethernet/mellanox/mlx5/core/fs_counters.c
> index 17fe30a4c06c..0c26d707eed2 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c
> @@ -539,7 +539,7 @@ struct mlx5_fc_bulk {
>         u32 base_id;
>         int bulk_len;
>         unsigned long *bitmask;
> -       struct mlx5_fc fcs[];
> +       struct mlx5_fc fcs[] __counted_by(bulk_len);
>  };

This looks good.

`bulk->bulk_len` is assigned before flexible array member `fcs` is accessed=
.

        bulk->bulk_len =3D bulk_len;
        for (i =3D 0; i < bulk_len; i++) {
                mlx5_fc_init(&bulk->fcs[i], bulk, base_id + i);
                set_bit(i, bulk->bitmask);
        }

Reviewed-by: Justin Stitt <justinstitt@google.com>
>
>  static void mlx5_fc_init(struct mlx5_fc *counter, struct mlx5_fc_bulk *b=
ulk,
> --
> 2.34.1
>
>
Thanks
Justin
