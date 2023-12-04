Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D92E62D
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 16:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2eCZCFGK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33339d843b9so1951625f8f.0
        for <llvm@lists.linux.dev>; Mon, 04 Dec 2023 08:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701707315; x=1702312115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ExnfZxVYVMvXtVrPDzieFUCNS347qRDxh4C9hinedE=;
        b=2eCZCFGK4CFgGBSixrJealztRPEuiNoL0T4gfmceOOWf0P9mG2svCJDSM+Hkq0LqOr
         gpxUbRTyFyhfrtJmZr+kIuQLBSWtQ0XwvoVmFfBZQmXaPueg9MNs+aq2yikT2kSIPEeJ
         0ANiVuiXbCLpzQDXGHTzjetwiYqfBCxjfT8M3XkuYWDMJwW9KpXIjnMPBs2FksjVj2B2
         AR8Qqolw22FILFXSq6a03LhTabCfxrVnRCJb6LRXxBk7vNnd5vqAOFXm9Dz2EMOp6CKd
         FQjTGHFPftzQ8bpTNfx2T6LLlX8cQ9EPzVFMNVnxjhwcCFqlBUEdoPcXLsehU/lou8TW
         JzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701707315; x=1702312115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ExnfZxVYVMvXtVrPDzieFUCNS347qRDxh4C9hinedE=;
        b=scIaxH7OPwDePpaTmI5LBn7UO1TbH8dMPJ/SzytAaZKEnjZU9gQ/dieT9XAO/8gyBP
         fLrANOwfH+FFSNRL3pf2BWWYn6tFdzRewBkMycbr02kCOhH5lMJdCsaLoNlKjl4ADLsy
         PMJs0xa3iXDjLjeHgSm7JL74sTsvi/96qh7+PKrj+e2lAlnQefYriEE75OkoX9bDQd4P
         ftVrf4j0ID7mc5JwaHisFApXaAx4h1XB6p2HhoOAdJJcqQca0X/O7fiUmNGJOMGQx+mU
         Q/LV2UANvtCdmL2FS8MDunwsi54CBPgoc9AmiCmsuYFAURnJFojx4fuQXg7yC37TYCdN
         jlPw==
X-Gm-Message-State: AOJu0Yxl+mFZWOtYQB1G5++JKmP8mUYPx70BIWdPv6qYo04/yjSVqNIs
	mPqFXjNmg+4svgTW2kzGtt2yoyDzOId2CzGR+jsShA==
X-Google-Smtp-Source: AGHT+IGnOKjeCz5yB866/XKel7WGP0XqRZykiL2PjFZMSwT0owq2u4yw/k+2hL+LNgiWmi11i0MklXo5mO20cDi5GUg=
X-Received: by 2002:a5d:50c2:0:b0:333:2fd2:5d51 with SMTP id
 f2-20020a5d50c2000000b003332fd25d51mr3535271wrt.131.1701707315273; Mon, 04
 Dec 2023 08:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231120144642.591358648@infradead.org> <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com>
 <20231122111517.GR8262@noisy.programming.kicks-ass.net> <CABCJKufBiJjUdmnuy=HkV+dDnZ=xne-OBwPSfJ21RX9c0AzCZw@mail.gmail.com>
In-Reply-To: <CABCJKufBiJjUdmnuy=HkV+dDnZ=xne-OBwPSfJ21RX9c0AzCZw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 4 Dec 2023 08:28:21 -0800
Message-ID: <CAKwvOd=ZgoeXQAZZoLNYmd0OyuHktsnxLtcKzH4MEoDkPXnqyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	davem@davemloft.net, dsahern@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, jpoimboe@kernel.org, joao@overdrivepizza.com, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 3:54=E2=80=AFPM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> On Wed, Nov 22, 2023 at 3:15=E2=80=AFAM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > So the kCFI thing is 'new' but readily inspected by objdump or godbolt:
> >
> >   https://godbolt.org/z/sGe18z3ca
> >
> > (@Sami, that .Ltmp15 thing, I don't see that in the kernel, what
> > compiler flag makes that go away?)
>
> Hmm, that looks like that's what we emit to .kcfi_traps. I suppose
> Godbolt just doesn't show the section directives?

Filter > [uncheck] Directives

>
> https://github.com/llvm/llvm-project/blob/main/llvm/test/CodeGen/X86/kcfi=
.ll#L30
>
> Sami



--=20
Thanks,
~Nick Desaulniers
