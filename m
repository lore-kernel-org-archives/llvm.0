Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC92811CBE
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 16:54:56 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-76cab6fe9c0so472295785a.0
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691427295; x=1692032095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5cddJzIOPCTcsiTflLavXmr7qSZtA1VgTifuJQg0Dk=;
        b=VNz6c1jOtKboiDGkYmzFk2dxRBEGQhwM3JVWTqlT6u+8gQeqV1dNNEb+vql8z4uY9E
         XC8gEJo02hnLguERc3oXDPOtJ1uFeNFjeik0QEuR0ICXLEk2i/V2Ch1hX6Uk7p7Kf4L9
         OalbP4FMkppD8l4XIAbqopvPxCx2Qxey0FajTNurZho/fhCIMvdWfuf5mTODjcgMw3p4
         xpvVaOb/hgqGmHGMcO+xdBpC39edYE+8hm1b33AnIFRXI/1iPnZYYBXtlJrST1ja5PLK
         GcusknhpcXYEE+9wvRR3UmTaiKyWm333aPays6oxy+rQFBTaIPF/ytpitjt2en/eMXSc
         poOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691427295; x=1692032095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5cddJzIOPCTcsiTflLavXmr7qSZtA1VgTifuJQg0Dk=;
        b=FlvqbYUaigsUr/AFiNboK1b9QkbMmGacXUIGNKRljM6DcBWVuwJR/XJ9u8pHDsZySs
         fnjgb59Ktu0/E013GHO0vOYaakffBPNEokQhIV9Mei9w+NXWPyzjY5wSsWeid3rxAn47
         W2mkBl5nEiXP2OPTklG19LirQ/y8V1i+QSprHd029+zK8b3JrWaJfHGWB7ir+mRCtAf1
         HzfD8cAsQstG3AKRGIjEi43UqNCM+4KLXzjk4qOLo26wIuqZivop2x3OBgCNGgIcK27U
         zR6n9GXsIKR24nOe6nCQ0tM7KOCSeOcmoMhQFPv7xBY7/z76yC0UwA90x1bf0i/wXLaJ
         7wQw==
X-Gm-Message-State: AOJu0YxJxVbVY3fXjjhbLCfD5OjRm5x50eb1Az5aX5BEpwOKCFAnXHFP
	Irg6Gu5OZq2VU7QbQiXSsrcShxju+oDzvp0SsFrmPg==
X-Google-Smtp-Source: AGHT+IEQiIfK4z3yyCGkeZPF2C+P8nQA6AbqE0wDfTzyMPFrsW44XDNbBzE3YEEGxN3ZSCFic2gL6lZuymo8psJnyW4=
X-Received: by 2002:a0c:f50d:0:b0:63c:ef89:1a5c with SMTP id
 j13-20020a0cf50d000000b0063cef891a5cmr10219908qvm.62.1691427295460; Mon, 07
 Aug 2023 09:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807-missing_proto-v1-1-7f566b7ba5ca@google.com>
In-Reply-To: <20230807-missing_proto-v1-1-7f566b7ba5ca@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Aug 2023 09:54:44 -0700
Message-ID: <CAKwvOdncCH4uoKfTnYf5pgTtY49b-S7XfWoF4UnH4b3AV3R3vA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.extrawarn: enable -Wmissing-variable-declarations
 for W=1
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 9:50=E2=80=AFAM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> I noticed Tom was sending patches where smatch was recommending
> annotating functions as static when no previous declaration existed.
> Surely the compiler could make such recommendations as well, I thought.
>
> Looks like -Wmissing-variable-declarations can make such
> recommendations.
>
> GCC just added support for this warning (gcc 14.1.0 will ship with
> support), and all versions of clang relevant to building the kernel
> support this flag.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 40cd13eca82e..617739eb84e2 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -32,6 +32,7 @@ KBUILD_CFLAGS +=3D $(call cc-option, -Wunused-but-set-v=
ariable)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wunused-const-variable)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wpacked-not-aligned)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wstringop-truncation)
> +KBUILD_CFLAGS +=3D $(call cc-option, -Wmissing-varibale-declarations)

^ sigh, misspelled

>  # The following turn off the warnings enabled by -Wextra
>  KBUILD_CFLAGS +=3D -Wno-missing-field-initializers
>  KBUILD_CFLAGS +=3D -Wno-sign-compare
>
> ---
> base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
> change-id: 20230807-missing_proto-0cb90ec6454c
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>


--=20
Thanks,
~Nick Desaulniers
