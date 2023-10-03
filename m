Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BF33F4BB
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:17:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9ae75ece209so270820566b.3
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696375053; x=1696979853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68h/m2Pi2zxdSKkFh1D4c3jbV9GqO3rEkPm7rE0iF3o=;
        b=dRiKxujctOGZ8JcXjEOsTO0A21R9RZFSKIg5GXW6WTurwBrH4UiOR0cbxX+Uq3fhX0
         M6QJVx7SwtdlARox5uJF9JP4AW2qL6Qj28Hn1AMGbc7W9VsWSXm/ypST9rwlyMLoMIf4
         VhIgqpQUT7uRo0AeWSBrgX30NxGPJXQaq7pnpG36noiOdjRGEmi82fFBOzDXeR+dfTus
         d3/X8sC61b0rqgsQcU/lnSHco4UVzsTLq3IWnpWrpDx2/Wrn5HS7YzNzWsy835H01aP3
         ycpI5/DHe4mo0owoj5dTQg/IcXCAxfwRUZmG8SaczfZ4/306uHTnmDLfFoo3FKCZOdre
         y5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375053; x=1696979853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68h/m2Pi2zxdSKkFh1D4c3jbV9GqO3rEkPm7rE0iF3o=;
        b=rwAxQsXKOGqXt712DKXkz/C+kIhSGxGn4Rfn3G1oXFo/zAKm7oePkF127cCNYH0z1R
         2ZvBVArDxmDIm0efIVoqsk2NLFuZ+8vDb7QRdWPS1xYrrqy/P1pUfai+JlfJRguJNJLx
         1i8+OEIb4il0H6VzhlPjlg3jVkYzDfdCBrjvDkL1jWHRsAZZUg1WMaTfv1flfp+h0CHj
         jiZekKxZhINJbN6ZF7P57nCtXVLQDs7jdsmXwslAcuf97ipyqhRCwBAnMgqBP2y+lLUo
         oQUNhIJSRNsQQlga+XbLQrL8slXw49ZBdZgxNA0aIMUo3n9/cRpLrSeNZsPikMfr+qaS
         iCtw==
X-Gm-Message-State: AOJu0YxJnfeCkOOgfRRZrwClmzqN3ppYHsIt59uG5v879sas9jp1aNed
	Hl1OOvql/RHiXCZMxiNOfoYpwmOu4saX9RdNw+Uxlg==
X-Google-Smtp-Source: AGHT+IGEvMe+xIOWkMolJEXQAxQowB6eO5nOtwa3QRtIQtSuD0kxolB5u9x96JruypuWe9ZfCzHgJm10L5ZJ0sCb76E=
X-Received: by 2002:a17:906:7697:b0:9b2:b119:4918 with SMTP id
 o23-20020a170906769700b009b2b1194918mr588755ejm.13.1696375052745; Tue, 03 Oct
 2023 16:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929180611.work.870-kees@kernel.org> <20230929180746.3005922-3-keescook@chromium.org>
In-Reply-To: <20230929180746.3005922-3-keescook@chromium.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 3 Oct 2023 16:17:20 -0700
Message-ID: <CAFhGd8o+0KhH2hfOLD=ru+53TPZEfsPUtjRbYOvG_D5zaz-bXg@mail.gmail.com>
Subject: Re: [PATCH 3/5] mlxsw: spectrum: Annotate struct mlxsw_sp_counter_pool
 with __counted_by
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
> As found with Coccinelle[1], add __counted_by for struct mlxsw_sp_counter=
_pool.
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

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c b/drivers=
/net/ethernet/mellanox/mlxsw/spectrum_cnt.c
> index ee59c79156e4..50e591420bd9 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_cnt.c
> @@ -24,7 +24,7 @@ struct mlxsw_sp_counter_pool {
>         spinlock_t counter_pool_lock; /* Protects counter pool allocation=
s */
>         atomic_t active_entries_count;
>         unsigned int sub_pools_count;
> -       struct mlxsw_sp_counter_sub_pool sub_pools[];
> +       struct mlxsw_sp_counter_sub_pool sub_pools[] __counted_by(sub_poo=
ls_count);
>  };
>
>  static const struct mlxsw_sp_counter_sub_pool mlxsw_sp_counter_sub_pools=
[] =3D {
> --
> 2.34.1
>
>
Thanks
Justin
