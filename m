Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C2347DE
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5a7db1f864bso85298907b3.3
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 11:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697653761; x=1698258561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHdbAm9LJTdw2SIGrMx1plxM0RiwW0DhdkjBzJkwfFA=;
        b=nqqI9smmZ9CIMAM3zxMsYBexdPWH59F67Cr6QdEBYUB13Egwyla2BMxG+M2r7wYcw4
         qNcbY1b68ECWmPt+92f4RNWEWFcyfZERbWX3jDDn7c8hKnnz6eoXdYyt5+gn6Ypl5bDy
         QX3X+mHVGOnPyRq0tRFpeDADCyNbglWCt8zKp06qIkx4B8cFRZETLqYylTK3S4aOlz/T
         bN/HlvCbgH9ncRZ1qrdvF973J7QVX8wU92/Vnsw0TlSD99pfqRW93cOt/bZm+7sGcJGD
         mo3QsoVDoPHaa75WsIrGnZLXTmfiz4CThV/H0oTBpnIJadVBl2PeUZXSibeaBHuWV9cq
         dsMA==
X-Gm-Message-State: AOJu0YzysDnTqDmklnY8qDkSPRJFJEsK04+9hhtmEkJYELte1HIwL1qQ
	fSDeOwJOSQv6rsgvS7NWmuWT9My6jJKYxw==
X-Google-Smtp-Source: AGHT+IHS8x7fasWTeiB/UeEuuCLgUt8JuPUvBmjI8gySQjVyFwNT6uI1FQZZyc9pIHfpVwM/uiER/g==
X-Received: by 2002:a0d:cac5:0:b0:5a7:d9f9:2285 with SMTP id m188-20020a0dcac5000000b005a7d9f92285mr98335ywd.26.1697653761369;
        Wed, 18 Oct 2023 11:29:21 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id df5-20020a05690c0f8500b005a7b785f66bsm1705750ywb.39.2023.10.18.11.29.21
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 11:29:21 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a84204e7aeso57223237b3.0
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 11:29:21 -0700 (PDT)
X-Received: by 2002:a0d:df44:0:b0:59b:ec85:54ee with SMTP id
 i65-20020a0ddf44000000b0059bec8554eemr81300ywe.39.1697653760779; Wed, 18 Oct
 2023 11:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018182412.80291-1-hamza.mahfooz@amd.com>
In-Reply-To: <20231018182412.80291-1-hamza.mahfooz@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Oct 2023 20:29:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSzMJe1zyJu1HkxWggTKJj_sxkPOejjbdRjg3FeFTVHQ@mail.gmail.com>
Message-ID: <CAMuHMdXSzMJe1zyJu1HkxWggTKJj_sxkPOejjbdRjg3FeFTVHQ@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: disable FRAME_WARN for kasan and kcsan
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <keescook@chromium.org>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
	Li Hua <hucool.lihua@huawei.com>, Alexander Potapenko <glider@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rae Moar <rmoar@google.com>, 
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hamza,

On Wed, Oct 18, 2023 at 8:24=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
> With every release of LLVM, both of these sanitizers eat up more and
> more of the stack. So, set FRAME_WARN to 0 if either of them is enabled
> for a given build.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Thanks for your patch!

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -429,11 +429,10 @@ endif # DEBUG_INFO
>  config FRAME_WARN
>         int "Warn for stack frames larger than"
>         range 0 8192
> -       default 0 if KMSAN
> +       default 0 if KASAN || KCSAN || KMSAN

Are kernels with KASAN || KCSAN || KMSAN enabled supposed to be bootable?
Stack overflows do cause crashes.

>         default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>         default 2048 if PARISC
>         default 1536 if (!64BIT && XTENSA)
> -       default 1280 if KASAN && !64BIT
>         default 1024 if !64BIT
>         default 2048 if 64BIT
>         help

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
