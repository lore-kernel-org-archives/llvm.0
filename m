Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD349436A6
	for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3hdVUof0"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507bd19eac8so1273132e87.0
        for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697556258; x=1698161058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJQt/dhfW4ljIETmg9qzLnjfnzaDOgcBSv1MQzSSlYg=;
        b=3hdVUof04GKPmC1R8Xj6n8mtSn4Qh2PKxKba+8MQbkJUOJedigiaDOPps59jgQmAoY
         CLRSuy/ZKxud+hZJL3cZoriou7Up/Tf6vLpXdVe4q9/AtyJ2nL00tGBJyw+URK4IGkgz
         x/DkZiy5mqIw1MXAesYXMYvR+MPC+XfHA621o2P0O9S2Yk/uVOYoLj4OIwrB53C7a+vd
         +xecKw8D1N+i47ifJF4sOm+909Bvtu9XriVKZ38ySJRGfogRAh1UH0Sdb73Jwmp9zQzC
         kHbC8xhDevjVXYklNdRnugV2q+HPh/58Pjrd/Dlv9eAxEMIqmFLsy73qmHyn19CzTO/J
         Rukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697556258; x=1698161058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJQt/dhfW4ljIETmg9qzLnjfnzaDOgcBSv1MQzSSlYg=;
        b=Jl4SL/EV8eqDAoP4E3s06W55R99HU/d1giY7QeMynvX4r1kB1pQDIhTAQA9DTSDoNY
         NgBAhXwHljvaiSuIoHpJ74qXCUF1iJPtwpg1ozeF7Oz5YtRh8/niZv4A4dIrtwb3rImA
         lT9QNcmDujRRyFUD1wq8BopCfdkfZu5hrVgGmmqG1Ua+jihQtQBhLsbqZkuCvoCDvNzh
         1VjhELEq7MYWODChpAhtQQJ4jKkujUWnZz3gljT37tnx4YIOpgJZaJiUiXaoz6XZOaVy
         AF9FpqlgWJfaY5eo6hrAYVEZaegsykEPzkWvnpu278BflBJhm7qtwJiBk6GSC9v0GJQQ
         r7hg==
X-Gm-Message-State: AOJu0Yy0DJcVp+iWD/yPGnEr0fOurn+9zPBORcpBZEuIiZhr2rQC2tUf
	yXgRCb2EL4+WiNvgN6Ak90tfQKnbPjxl5/BHZTfgfg==
X-Google-Smtp-Source: AGHT+IFcz8ytMC/IKQ5VVicz7OafNbchdrmgX99jpUoYI5WmS8cc6u+FdSEjoNSsM21v3gMVwMJT/X6xSS/Kya8t5N0=
X-Received: by 2002:a19:6703:0:b0:507:b7db:1deb with SMTP id
 b3-20020a196703000000b00507b7db1debmr2213812lfc.38.1697556257664; Tue, 17 Oct
 2023 08:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231012141031.GHZSf+V1NjjUJTc9a9@fat_crate.local>
 <169713303534.3135.10558074245117750218.tip-bot2@tip-bot2>
 <20231016211040.GA3789555@dev-arch.thelio-3990X> <20231016212944.GGZS2rSCbIsViqZBDe@fat_crate.local>
 <20231016214810.GA3942238@dev-arch.thelio-3990X> <SN6PR12MB270273A7D1AF5D59B920C94194D6A@SN6PR12MB2702.namprd12.prod.outlook.com>
 <20231017052834.v53regh66hspv45n@treble>
In-Reply-To: <20231017052834.v53regh66hspv45n@treble>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Oct 2023 08:24:02 -0700
Message-ID: <CAKwvOd=pA_gpxC9ZP-woRm2-+eSCSHtwvG3vsz9xugs-u3kAMQ@mail.gmail.com>
Subject: Re: [tip: x86/bugs] x86/retpoline: Ensure default return thunk isn't
 used at runtime
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Kaplan, David" <David.Kaplan@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, "x86@kernel.org" <x86@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Marco, Dmitry

On Mon, Oct 16, 2023 at 10:28=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
>
> On Tue, Oct 17, 2023 at 04:31:09AM +0000, Kaplan, David wrote:
> > Perhaps another option would be to not compile these two files with KCS=
AN, as they are already excluded from KASAN and GCOV it looks like.
>
> I think the latter would be the easy fix, does this make it go away?

Yeah, usually when I see the other sanitizers being disabled on a per
object basis, I think "where there's smoke, there's fire."

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/lkml/20231016214810.GA3942238@dev-arch.thel=
io-3990X/

>
> diff --git a/init/Makefile b/init/Makefile
> index ec557ada3c12..cbac576c57d6 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -60,4 +60,5 @@ include/generated/utsversion.h: FORCE
>  $(obj)/version-timestamp.o: include/generated/utsversion.h
>  CFLAGS_version-timestamp.o :=3D -include include/generated/utsversion.h
>  KASAN_SANITIZE_version-timestamp.o :=3D n
> +KCSAN_SANITIZE_version-timestamp.o :=3D n
>  GCOV_PROFILE_version-timestamp.o :=3D n
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 3cd6ca15f390..c9f3e03124d7 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -19,6 +19,7 @@ quiet_cmd_cc_o_c =3D CC      $@
>
>  ifdef CONFIG_MODULES
>  KASAN_SANITIZE_.vmlinux.export.o :=3D n
> +KCSAN_SANITIZE_.vmlinux.export.o :=3D n
>  GCOV_PROFILE_.vmlinux.export.o :=3D n
>  targets +=3D .vmlinux.export.o
>  vmlinux: .vmlinux.export.o
>


--=20
Thanks,
~Nick Desaulniers
