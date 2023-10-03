Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B683E48B
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:06:42 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bf3f59905so266463366b.3
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696374401; x=1696979201; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BED3t2aRrxtx0D0q4ZEBs+ApkSmWh8HJDsZNXZO2H1E=;
        b=1AjR5jaHjjYFZzFMu77I+iOdgjaPJN+oSc3VW4fRUFW6/pY93Z2bcfLa0QXpk0ggwm
         FZuIi2u3ivb9fqSiWi7thdL4Hk961oBRSQMEjekmc0Gbc/tc/qx6LNRAcJRYX/6NeV6q
         0fI9ebT1yL7oT7/QS5xHdjuOCxnoD/guQkVTUnpeDi1i7578IGYqUUTd0YGBL1W0RVzg
         Noka5zwvPrnQQxRsuKY6nPNM4Lq9FoQ9dLZj4n6edQn9pfrjM0cXYxumk31mO6nmgB0Q
         /DB+u5AYqH7HvtHXoKTxxiqsxCjbvskZDhOrN7N6FSXth7vyByTQhGa70setxgspaVm2
         uowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696374401; x=1696979201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BED3t2aRrxtx0D0q4ZEBs+ApkSmWh8HJDsZNXZO2H1E=;
        b=kueryCktrOyQVycNykXcwz5/hqNmolqnbW0jF+bW5r18gUyPJlFcEX9gRzfFOTmAKx
         V7bh93R3rcDmpKZN3Oy7VjHY32yobpssbLHAPb/49CZ0j0PJjDD1+xl6hUgv80/5DlOu
         cKSvZWRfaOX+dbedTqWgOe9ZzCeE+UsaPhrJ69gfgzxWn7DIDUkZbur4CgB16GSkhxFc
         TG/PubTa86y9CTjGaL+NEPfv0zlrhhkXFKInRMdLOYSK4NYAFXW/xjOYjqAp803hpZs8
         hYPblrfdkvW7dHy/oNe8sHL6CwaMaE4cF66qRQJN0no38kUcjbyNHvqlX8QQAxoNQhpx
         J+qg==
X-Gm-Message-State: AOJu0Yw5Wq9lEOk5wgqVuQ7EoyibsJ0cqZF53flm6ihMPZZZfWgqIp8b
	eVOp28dNIJDVLGGX7SLFfeeU2ka0513cCf9HCsRAjg==
X-Google-Smtp-Source: AGHT+IHB2pzA3bg1Fesj416efcT1N1xTYVtbEVVGRJW14+RdrX8v8VDBTH1EuOSCUOzjyMf3H2XQMrs2+N3Lkip4XW8=
X-Received: by 2002:a17:906:74cc:b0:99b:ead0:2733 with SMTP id
 z12-20020a17090674cc00b0099bead02733mr593265ejl.72.1696374400964; Tue, 03 Oct
 2023 16:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230929180611.work.870-kees@kernel.org> <20230929180746.3005922-5-keescook@chromium.org>
In-Reply-To: <20230929180746.3005922-5-keescook@chromium.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 3 Oct 2023 16:06:28 -0700
Message-ID: <CAFhGd8pCJa=qevxwhtQDvXMwdhF-33fV87m90GGaUFkOa6eRuA@mail.gmail.com>
Subject: Re: [PATCH 5/5] mlxsw: spectrum_span: Annotate struct mlxsw_sp_span
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
> As found with Coccinelle[1], add __counted_by for struct mlxsw_sp_span.
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

Great patch!

Crucially, span->entries_count is assigned before any flexible array
accesses.

        span->entries_count =3D entries_count;
        ...
        for (i =3D 0; i < mlxsw_sp->span->entries_count; i++)
                mlxsw_sp->span->entries[i].id =3D i;


Reviewed-by: Justin Stitt <justinstitt@google.com>

>  drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c b/driver=
s/net/ethernet/mellanox/mlxsw/spectrum_span.c
> index b3472fb94617..af50ff9e5f26 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_span.c
> @@ -31,7 +31,7 @@ struct mlxsw_sp_span {
>         refcount_t policer_id_base_ref_count;
>         atomic_t active_entries_count;
>         int entries_count;
> -       struct mlxsw_sp_span_entry entries[];
> +       struct mlxsw_sp_span_entry entries[] __counted_by(entries_count);
>  };
>
>  struct mlxsw_sp_span_analyzed_port {
> --
> 2.34.1
>
>
Thanks
Justin
