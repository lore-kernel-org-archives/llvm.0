Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC037749D
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 04:42:51 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9ad8bf9bfabso1610560666b.3
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 21:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695876170; x=1696480970; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtW2DaDex4/qq5KYNshzbiXk1ZKdWPIH7i0eyiB1QPA=;
        b=mWQM1Qnpw15ZCFWHwROjiLyOGjzJ0IrxXbtPzcscZ2WcoRJwSfcJWYIH4/O6PuBI37
         Fm9b5UQc76h6U7UU90L4TA4Zf55uK7uE8lSXnDC4AgzJ38U/6Wa0GvJ9OvpkanNQ4S8t
         dWFTgw6YryS//RDc0WwWRIH9eLcg+GP5QVITgERemPAjgY3oN5lMhkOkxCHAMzpuYB6I
         8b5LD2pgPbod/KMPrW/7Zq5K+gttx4HPVkoyQ28htk+1mgF+FO5Q1W4z+6F3jQEClP55
         nDGREKAiuCvEUG5uJlvfkKdZxV7DqFGrusvzKqogDvPHlY/iiEt4tizhDO817o+bNXe9
         XsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695876170; x=1696480970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtW2DaDex4/qq5KYNshzbiXk1ZKdWPIH7i0eyiB1QPA=;
        b=RJIoxVCGBF70SxuAk8E5NsiPfAmeIFm7Xw455wT24KUGdxCWXUFfMOqUX4oiiKRS+b
         TvT0pWh22/jlwcreNK0HrM1I7BxGU4SuC47w4Y1CzEQdc3bvj6CoJkzItfQB+wtYCxcq
         um/XQpgC5o4B3fpbTTD3OUMq+OYf1iObGUtj8aZHbJsBCWVMdXtEjIoiM/UmoS5lSKGb
         6Ibng/ocJsfcH0QQxIrmlcOCE/f1t9l4dYha/clGuqq0+or9Mvwd+fAoHASjgZdIeUtg
         BA+JL9RuQRsRwJ38g0jifyet1l8pER0hwwz+AAsvi8SOPdNy77/t0nvLto2GbIdQWaeu
         qt3w==
X-Gm-Message-State: AOJu0YzinjOSrwesj+UsA6RRU14bfWcOqMes1vO37z3Dcsl3Lu6296nc
	9Ngk5Y0grIdxuKKZ82Sc0BKEJu0jwkG+iACmYxYPVw==
X-Google-Smtp-Source: AGHT+IHPBAmhx+er6QkuJRIUAhKqf0BCJK7e+59Jegd3S5xW+6aqnkbAfNHzBG5wu6mzEd52bNAKmrbIN7pJkCOCyI0=
X-Received: by 2002:a17:907:78d4:b0:9ae:588e:cdde with SMTP id
 kv20-20020a17090778d400b009ae588ecddemr163330ejc.11.1695876169938; Wed, 27
 Sep 2023 21:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175344.work.987-kees@kernel.org>
In-Reply-To: <20230922175344.work.987-kees@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 28 Sep 2023 13:42:39 +0900
Message-ID: <CAFhGd8oz9zTVacJMEWv4-hpNeXbPLYQ6fnb2z_2Y++rWyVSUow@mail.gmail.com>
Subject: Re: [PATCH] hte: Annotate struct hte_device with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Dipen Patel <dipenp@nvidia.com>, timestamp@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2023 at 2:54=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct hte_device.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Dipen Patel <dipenp@nvidia.com>
> Cc: timestamp@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Yep, this flexible array member is counted by @nlines which
is evident throughout hte.c:

        gdev =3D kzalloc(struct_size(gdev, ei, chip->nlines), GFP_KERNEL);
        ...
        gdev->nlines =3D chip->nlines;
        ...
        for (i =3D 0; i < chip->nlines; i++) {
          gdev->ei[i].gdev =3D gdev;
        ...


Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/hte/hte.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
> index 598a716b7364..1fd8d2d4528b 100644
> --- a/drivers/hte/hte.c
> +++ b/drivers/hte/hte.c
> @@ -88,7 +88,7 @@ struct hte_device {
>         struct list_head list;
>         struct hte_chip *chip;
>         struct module *owner;
> -       struct hte_ts_info ei[];
> +       struct hte_ts_info ei[] __counted_by(nlines);
>  };
>
>  #ifdef CONFIG_DEBUG_FS
> --
> 2.34.1
>
>
