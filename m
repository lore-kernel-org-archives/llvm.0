Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823B83CCF8
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:12:56 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9a9d82d73f9so266067766b.3
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696374775; x=1696979575; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaFpiEY5JH4xoOaWyLud8W3R/SAnqW0FuICHPBykSfM=;
        b=ZfFwbPtoM493486VVw/6VcGmq/4oxuXb+Nzn+nlLKUhxEe+f4eAPYrvnovnuuuCoF4
         bNye09OPpDXbwIJ/s6PflO6kdMInSI7FbXUqqdrYZukrduULUK58+yi9Zk15CwxO5pAp
         TVl8fEoSK7HV/t9or5P6HhqYJw8RQVix+vnpQgpUtgxyuC2PwfVxa7rxWrE/Yi35cEZ4
         oRBkqSpEKobZzCVb0yD5gQ9NxGEagIxMeNIlQbKpnGqBKmMUkj772qzGWezT4wZeJAAO
         zsQivsJEYIKeRf9hyiqeLpfWTizGc0/qrgqr7U3IiAKCJlJfZNBffNz7whLU0Ivlue0T
         ix7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696374775; x=1696979575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaFpiEY5JH4xoOaWyLud8W3R/SAnqW0FuICHPBykSfM=;
        b=v9mAKmk5uVI1wg9QXSOxg9WlIIAtb0sgX8htSJs3yVW0AthbTOUv08Ovd8jnH86uh9
         HYmudVVUrNICqmhrhWQOHdy66qSXPLd0sHtLB3woO1ykv29g8jSVcS3cvlxfUBl7o+gn
         06NaipM03zXIU3rhncOeJpXikVm3XO3JYh8iAoFDn2gAtHbyOgd96kNMFuH7SOiTH4qx
         hC2fiAr+dnYMhkF3aR8T6aN1EQN0VxxP/ogo1SjxuIBju2MVSzRwXxNLaUU8Mo7lj8pq
         C7NSiE0P2kjQ4ViW4dECdm3QzlTV6NURQVa1fV5FZXGgxqI5BmO9sGK/i+bubLlq0rgh
         RPbg==
X-Gm-Message-State: AOJu0YwkePh9mGftwWTm0IYWTGQCZXiesyG+I9GRDVF0PjgwSRX5gY5u
	f1cjfHcnbjs2QXVRcT+Zwb7akfDycDYRHjirwO4PuQ==
X-Google-Smtp-Source: AGHT+IGIAv1B8l7PPJwCoeN7f0g0yeR5LZROzHms5LHhhlU7a5bSwRk1Gpmtk7Zd8a8qWTdhzqWf4oRXEPk/0ORHwv0=
X-Received: by 2002:a17:906:76cf:b0:9b2:a7e5:c47 with SMTP id
 q15-20020a17090676cf00b009b2a7e50c47mr577019ejn.9.1696374774622; Tue, 03 Oct
 2023 16:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929180611.work.870-kees@kernel.org> <20230929180746.3005922-4-keescook@chromium.org>
In-Reply-To: <20230929180746.3005922-4-keescook@chromium.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 3 Oct 2023 16:12:42 -0700
Message-ID: <CAFhGd8oKZEhWhv=C3FZHH3D3DLevKONV+VdVLLpS1U8JFF3bvg@mail.gmail.com>
Subject: Re: [PATCH 4/5] mlxsw: spectrum_router: Annotate struct
 mlxsw_sp_nexthop_group_info with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 11:08=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct mlxsw_sp_nexthop=
_group_info.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Ido Schimmel <idosch@nvidia.com>
> Cc: Petr Machata <petrm@nvidia.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Reviewed-by: Justin Stitt <justinstitt@google.com>

>  drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/driv=
ers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> index debd2c466f11..82a95125d9ca 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> @@ -3107,7 +3107,7 @@ struct mlxsw_sp_nexthop_group_info {
>            gateway:1, /* routes using the group use a gateway */
>            is_resilient:1;
>         struct list_head list; /* member in nh_res_grp_list */
> -       struct mlxsw_sp_nexthop nexthops[];
> +       struct mlxsw_sp_nexthop nexthops[] __counted_by(count);
>  };
>
>  static struct mlxsw_sp_rif *
> --
> 2.34.1
>
>
Thanks
Justin
