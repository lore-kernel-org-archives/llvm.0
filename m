Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FE3E489
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 22:57:11 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99de884ad25so264463366b.3
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 15:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696373829; x=1696978629; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNJ4V21M91PAJnutJlU6BdqwkvAfNI28YR+w3lb7qz0=;
        b=aweweAAjsBXMumR9Fpxn26g1cngH/0RpxXhHuWJlboU9qSxf4+GVkzEghEENuInVt+
         wDhm4l6WqeVuzYKm/b8PTQqMdn3cvVlniyaPZNb189ws76JjnEyzTAv0BceCBb2yaHpx
         vK2SlGVTp7HMVUEIll0WaZiahk72/AMmA75AxfROIsFsAdPaOh8u4W55r4e4y1U6ubW1
         /c/3Zd5KsBHyKKhQloUtofsAvG4ijAU+JJF+JmaqMgqODHOpccrFxry8Bfelp31N2b0H
         76YhYQp7pdS3yVvfySenMHrL3x9VSx3mYVfkpqcz/1wQbtI3mbtZOvpLtgaGPG275OlK
         lYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696373829; x=1696978629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNJ4V21M91PAJnutJlU6BdqwkvAfNI28YR+w3lb7qz0=;
        b=mFjagCyQc3MaqTVwh9rmb5vKmO7sR8Xzl18d3abh4XRKJHsQ16XhCc4vZ5atIfHd8z
         T3aZclDYpDZ/H883gUaNGpMncQ9v9tZBZtuuvpXmNFLX3eTn8qX33Y2rsH4hDo1Y4vpL
         vhSZSn4JKYtCYIdhqm5x3I+PrpjTsG2//Tav0c/rn5UAMH38CzGAsESSnR2KToA1cu26
         uSw3QYOioNWSe6VBhpcudjXYX1IKOmnuKOKafcWd+BdOEGml7mD6eqCl0mzuHu4Pg8lX
         Y1QXCEVtYvlj2BV5subovCY96lz5yMzIV1l+KAgA438iA/32QOGY5E/5v0u9TsxwMmjj
         JPEA==
X-Gm-Message-State: AOJu0YwUxYkYnA6XwKx0LM3HFSmU5do82LePsbAUi3srTe/n6oTn0g4v
	10WNMCYvMi0boFhMUSbGZN1um8r3vLXpbbEPYdZjfw==
X-Google-Smtp-Source: AGHT+IGU3gyaT977jvt9iRD1Ew9XlWTiuArkryKIRq2HRhld6gv/M4qSWfTxLUS5n5K9yVhjHJogubJlzCAW0Ey3Gyk=
X-Received: by 2002:a17:906:210a:b0:9ae:56da:6068 with SMTP id
 10-20020a170906210a00b009ae56da6068mr563304ejt.57.1696373829597; Tue, 03 Oct
 2023 15:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175351.work.018-kees@kernel.org>
In-Reply-To: <20230922175351.work.018-kees@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 3 Oct 2023 15:56:57 -0700
Message-ID: <CAFhGd8pHzbdcSaxjJHVHTAVrsxVPptn+OfwNjQ0RMEsOS3xRiw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: zynqmp: Annotate struct zynqmp_ipi_pdata with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	linux-arm-kernel@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:54=E2=80=AFAM Kees Cook <keescook@chromium.org> =
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
> As found with Coccinelle[1], add __counted_by for struct zynqmp_ipi_pdata=
.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Great patch! Crucially, the count is _correctly_ assigned
to before the flexible array member is accessed.

Reviewed-by: Justin Stitt <justinstitt@google.com>

>  drivers/mailbox/zynqmp-ipi-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqm=
p-ipi-mailbox.c
> index e4fcac97dbfa..7fa533e80dd9 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -108,7 +108,7 @@ struct zynqmp_ipi_pdata {
>         unsigned int method;
>         u32 local_id;
>         int num_mboxes;
> -       struct zynqmp_ipi_mbox ipi_mboxes[];
> +       struct zynqmp_ipi_mbox ipi_mboxes[] __counted_by(num_mboxes);
>  };
>
>  static struct device_driver zynqmp_ipi_mbox_driver =3D {
> --
> 2.34.1
>
>
Thanks
Justin
