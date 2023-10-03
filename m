Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A963F4DD
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:26:49 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso255566966b.0
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696375608; x=1696980408; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkOmFORPNdegsvUzletDdGNQTS/35DzAQHoVxYp5MXg=;
        b=nopCyryHLHWBpUEAYSevWYMtoU7KrJg8ZqEm4DpNmTjauf8xbsuj+VzIDmSg2sfxXs
         /IGfMB8yh12RQ9d4TZU2Om5a93a3isMP1HMoRpq7eTGInkyqJhanzpmv6YK+yMX5ijOV
         OLILIJpGWGg5i5PYk5U3F/rHjMwEfZcyAmGfofYntJ5NB91Zqfp4JlSIWMCTXZFwafca
         q2TNjwgiuhgjVDQas7dPwJIWmQMKlT606ZLhLIRqtPY4mdDktvQjID6awhOsZK4+9W23
         PHLqehA7Ulkb58OgaBegbyttr8ZQzGsTJo01CcrjT6sMddG5NIhfdQZntZduW6WGnHMw
         p6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375608; x=1696980408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkOmFORPNdegsvUzletDdGNQTS/35DzAQHoVxYp5MXg=;
        b=jYE2aMOGkWl56BM+yCSseoY9XrdZ+9hqrxeOwNgbi88Uy6/TPp/eAI8JVK80vXInv6
         JZVPFzviii0HlhCj3YLG5Z6EMNy21YZYUKjbzK4fm8u3+Dy71ql9UZq8jfSrtrdVyNZG
         WQGVImfgmOwek6Chdgk6TRid8NsR/tn88epZh61zaFlsaueFS8JUaKzw+tzcoWcscFeU
         MHCjEXGdX6pFFEl7Em8v1kTW8dzpVG1MkK1SX123UGm3UvmvJ3eaS7YsFB7GKHpARRJU
         HZf8kHvf7Lr7HDLgrlT2zYy0Y4dMWEwBsrdUvkm0eDxjD2cwfaNpwl5tfLqSDejIdLBq
         o0Xg==
X-Gm-Message-State: AOJu0YzUMCTRhkxTP+xCb90y3NvXHekJC1EulNkULi2CrHgb6mni8cMG
	lAS90tVODWdyggXrzScUKKWqB9aXCGpisbjQ2UeuHg==
X-Google-Smtp-Source: AGHT+IF1d5AjAJYgdKzsBfMm7uGg6I8MvuOFlaYXOCXzffRCV1Xz22bcMhb3NFM3XTYkvVVirGgXazVoYcInwB6GX3o=
X-Received: by 2002:a17:906:da8c:b0:9a2:139:f45d with SMTP id
 xh12-20020a170906da8c00b009a20139f45dmr657784ejb.43.1696375607793; Tue, 03
 Oct 2023 16:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231003231730.work.166-kees@kernel.org>
In-Reply-To: <20231003231730.work.166-kees@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 3 Oct 2023 16:26:35 -0700
Message-ID: <CAFhGd8qFcusVNabygT2PuuzqaeFH27BJP9BfWiF7Keo-j2RVQg@mail.gmail.com>
Subject: Re: [PATCH] net/mlx5: Annotate struct mlx5_flow_handle with __counted_by
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
> As found with Coccinelle[1], add __counted_by for struct mlx5_flow_handle=
.
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
>  drivers/net/ethernet/mellanox/mlx5/core/fs_core.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.h b/drivers/=
net/ethernet/mellanox/mlx5/core/fs_core.h
> index 4aed1768b85f..78eb6b7097e1 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.h
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.h
> @@ -181,7 +181,7 @@ struct mlx5_flow_rule {
>
>  struct mlx5_flow_handle {
>         int num_rules;
> -       struct mlx5_flow_rule *rule[];
> +       struct mlx5_flow_rule *rule[] __counted_by(num_rules);
>  };

Great patch!

handle->num_rules is properly assigned to before handle->rule
has any accesses.

        handle =3D alloc_handle((dest_num) ? dest_num : 1);

then

        static struct mlx5_flow_handle *alloc_handle(int num_rules) {
                ...
               handle->num_rules =3D num_rules;

then

        handle->rule[i] =3D rule;


Reviewed-by: Justin Stitt <justinstitt@google.com>
>
>  /* Type of children is mlx5_flow_group */
> --
> 2.34.1
>
>
Thanks
Justin
