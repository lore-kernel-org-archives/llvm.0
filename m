Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048811CCDE
	for <llvm@lists.linux.dev>; Sat, 12 Aug 2023 14:17:46 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-40c72caec5cso125791cf.0
        for <llvm@lists.linux.dev>; Sat, 12 Aug 2023 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691849865; x=1692454665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpf9hEbALEuUwc/AzrOv96eu39vxSdnbjXDdQYMh31k=;
        b=6/a4OUFN88y1BNPvpUT84boEp7O5GkH1laOMakKKCdZu0cbfu/XOpYCl6X6FxMi1/v
         sDFaA9zxXAFIeWNKhdIRaF1pR6PklkOYBHHyQMAgaj8vFieUMFVMnoUZSdvqYGoSawlf
         JzCdMvIVe1qhBjvDmHrSmCy5bnrnaR1/x7Jq2GBQs3a1d0lwLQ7NOPbPG+9VBjFCoWCT
         dUtTg54zmqRB7XoYvbgetuLm9o8AXCI/wH6J91O7FDOwXJOYYE4ayVc/9YZmeWMRr/wr
         UValOYhY3lnoDLxM41+rcrGSbE2+QyJx+9Fc5dpzYCwV2uRo+mG5jfciu/XAD9uQybXd
         Aykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691849865; x=1692454665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fpf9hEbALEuUwc/AzrOv96eu39vxSdnbjXDdQYMh31k=;
        b=guA5LIj8XTr+wGEl293KSbtIXsrPk7r/RX+edu5q96t6+zMDyN84R+d20x4zYrJlts
         nwg99IQ7QpZ/Euw0joPTDtHWsmlGJCD3NI2Kawhh1CeCwoQzys7OxNsEil1AS3pfHSuk
         2b0iaGP2PePCfDnbelYT48fxCCyMnmPpIGZBVrsJH7Fgk67OtHiaQvhQeSHIkkXTTppj
         dJKb7GFFz1yU+Qe4FBElfYBc78IL6j9mjj/h/H45QqHkq/+dxl9pYfPp09hONzhAQhDT
         OH/H9AGsMZ9z0SkF75244TpSoFi9TNhN17AxOn9vho9+Vl9Vb5ZW6R4UXG5AyPoRfvQM
         WpCA==
X-Gm-Message-State: AOJu0YyW8amdJO/XG5ZluxRhwavPI2uNq8td3QU5Mt88dpEn2uHUddv1
	awYKN7nFYWfDTheOFgoVuJxnWRTxuE104hBKttishA==
X-Google-Smtp-Source: AGHT+IFU1EpfdZSSr2VqrW37FrlaJ+InIRS2z5hjDk9XF+Eh+iNK/GZ/fkxhZj+0O9Hk4Im5arsiiAkSF9ac8g8oBvQ=
X-Received: by 2002:a05:622a:145:b0:3f8:5b2:aef5 with SMTP id
 v5-20020a05622a014500b003f805b2aef5mr405915qtw.29.1691849865539; Sat, 12 Aug
 2023 07:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230809-gds-v1-1-eaac90b0cbcc@google.com>
In-Reply-To: <20230809-gds-v1-1-eaac90b0cbcc@google.com>
From: Fangrui Song <maskray@google.com>
Date: Sat, 12 Aug 2023 10:17:34 -0400
Message-ID: <CAFP8O3Kgw-A6jxbQ+0cVU9dtY_5XKdE4y1QvJgirujx3pofo6Q@mail.gmail.com>
Subject: Re: [PATCH] x86/srso: fix build breakage for LD=ld.lld
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Borislav Petkov <bp@alien8.de>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Daniel Kolesa <daniel@octaforge.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Sven Volkinsfeld <thyrc@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 12:40=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> The assertion added to verify the difference in bits set of the
> addresses of srso_untrain_ret_alias and srso_safe_ret_alias would fail
> to link in LLVM's ld.lld linker with the following error:
>
>   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:210: at least one side of
>   the expression must be absolute
>   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:211: at least one side of
>   the expression must be absolute
>
> Use ABSOLUTE to evaluate the expression referring to at least one of the
> symbols so that LLD can evaluate the linker script.
>
> Also, add linker version info to the comment about xor being unsupported
> in either ld.bfd or ld.lld until somewhat recently.
>
> Fixes: fb3bd914b3ec ("x86/srso: Add a Speculative RAS Overflow mitigation=
")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1907
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Daniel Kolesa <daniel@octaforge.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/llvm/CA+G9fYsdUeNu-gwbs0+T6XHi4hYYk=3DY97=
25-wFhZ7gJMspLDRA@mail.gmail.com/
> Suggested-by: Sven Volkinsfeld <thyrc@gmx.net>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Note that CONFIG_LTO_CLANG is still broken due to GDS mitigations. Will
> work on a separate fix for that.  Sending this for now to unmuck the
> builds.
> ---
>  arch/x86/kernel/vmlinux.lds.S | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.=
S
> index e76813230192..ef06211bae4c 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -529,11 +529,17 @@ INIT_PER_CPU(irq_stack_backing_store);
>
>  #ifdef CONFIG_CPU_SRSO
>  /*
> - * GNU ld cannot do XOR so do: (A | B) - (A & B) in order to compute the=
 XOR
> + * GNU ld cannot do XOR until 2.41.
> + * https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Df6f78=
318fca803c4907fb8d7f6ded8295f1947b1
> + *
> + * LLVM lld cannot do XOR until lld-17.
> + * https://github.com/llvm/llvm-project/commit/fae96104d4378166cbe5c875e=
f8ed808a356f3fb
> + *
> + * Instead do: (A | B) - (A & B) in order to compute the XOR
>   * of the two function addresses:
>   */
> -. =3D ASSERT(((srso_untrain_ret_alias | srso_safe_ret_alias) -
> -               (srso_untrain_ret_alias & srso_safe_ret_alias)) =3D=3D ((=
1 << 2) | (1 << 8) | (1 << 14) | (1 << 20)),
> +. =3D ASSERT(((ABSOLUTE(srso_untrain_ret_alias) | srso_safe_ret_alias) -
> +               (ABSOLUTE(srso_untrain_ret_alias) & srso_safe_ret_alias))=
 =3D=3D ((1 << 2) | (1 << 8) | (1 << 14) | (1 << 20)),
>                 "SRSO function pair won't alias");
>  #endif
>
>
> ---
> base-commit: 13b9372068660fe4f7023f43081067376582ef3c
> change-id: 20230809-gds-8b0456a18548
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>
>

LGTM as a maintainer of lld/ELF and the author of the ^ ^=3D feature:)

Expressions in linker scripts are hard and GNU ld has quite a few
rules https://sourceware.org/binutils/docs/ld/Expression-Section.html
. I suspect the rule " Expressions appearing inside an output section
definition treat absolute symbols as numbers." is involved.

In any case, the semantics of the bitwise AND/OR results of two
addresses is unclear.
ld.lld reports "at least one side of the expression must be absolute",
which seems to right thing.

Reviewed-by: Fangrui Song <maskray@google.com>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
