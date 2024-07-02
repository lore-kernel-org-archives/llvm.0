Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54081BA37
	for <llvm@lists.linux.dev>; Tue,  2 Jul 2024 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902841; cv=none; b=nfILAvqzmG5McfxwfEpBsBVncUm6OD0LBqFgLT+ug9Zb81xY533yAjee/xIIi2STVxJTVcqUCZr7mRRbhJ2cPQbSqKzRwRjoOY6f5Jc2alWpEejKOkCxLxWVnLUcj8VXS6dD5ZJ/3jgG/dHnxZxmLCH/ac4BTsVWnW9hxhbExyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902841; c=relaxed/simple;
	bh=7AmjA8HOsW3iQB5UhMeCZcUo6g4JrgL8A//vwXj+N/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFkMX+VujcFi4YDjipEsdawz1yx8vXLTriKWFnLSnkEXvEdMrIwmWfUExJozX1j3UwbWlcFNuft0CQS1AeJLuNNrH5VTVgmOe9BsnoZzU6l+/uT1Z404l6fCr2AO2p3CshX3nLnR9MrNwszmxn8WxS/024AcXhqxP7RSrqw3ZzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2zIuqS5U; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2zIuqS5U"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso1395569a12.2
        for <llvm@lists.linux.dev>; Mon, 01 Jul 2024 23:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719902839; x=1720507639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sWHf/BPCxqcOmPmDzQLfmK1gpdpTOLdypHsiZNysuI=;
        b=2zIuqS5U9vwtG/oJfBrHF95MsRJK2CfnCVo1f6pnIoCO5gpNR27yRHaqfFI817U00/
         P/1RrFVSPuksEFymhsaUGjqK7Irr2CPhsU3tOomTInIZyIBxUDsken8nM+mTh84PT9qP
         amWWwDwY1uUskJMsAZFWivOBQvJ8ipYKUyIdpU8D12aGLW2SfqCNq1E3ZRafKBjwHHlL
         ffagfvQ9RLUlf/GgjX6EBu6gVWzxsBpY7NNNSKe4OTTAMbWt+2xQkUWM2rNSYBSNkbm3
         3/rugqXqsr65iDnFVDgWzvD3kAWhhuSpfqJLv2XAWPT42Lvt9dRrVRevFPqUBtirPbdG
         a6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719902839; x=1720507639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sWHf/BPCxqcOmPmDzQLfmK1gpdpTOLdypHsiZNysuI=;
        b=BKYj1LObhzvM6VKlBKQKxV/8jGL79Q5VwEho/jglHiAUtaYgNANs+X8IInfrVKuenF
         7/fYQParDWV4CyidB3Kgwcc7D3R9IMh71PH54Axf/DUW19seNkhx33RDQDt5d+jCZLFq
         GjkMnS+ghcQd2yVWPAN+9I4pR+HU4pYwRqH8LxQqMGzOMDtTGkK5wz7WLQurEwpuwaFe
         zssV+WmZ19Sm/C+JYOmBY/tBRU0BuEavt/p5wxBorhOWYgQ1sG+hIrLhPbPbjPEVthrK
         +IqrY7MR7akF1afJwaPEEXMZQQHM79glbufKzWh9fl516+vE0WE2m5zgJO47yAbFbwk9
         7enQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxgR4jdRMQ3Dnz5Dw03Lx5h8MtD7tWKFvxCdOI8niKq9+vtnzJA8QxG8Vi/ckq8gu6d+x1AtvsggfOnOMsUDow7d1axw==
X-Gm-Message-State: AOJu0YxFaSfhTyeeuIfyVG+v5w8PXtgCMr/eJsoV8n3sM9Krd42qa3zm
	fxF9TL3SUUrRL1xXRSiyP9M9CuZAPr7EPAxA15Pql/8FHmaP9aYyysiYW57gh3ytNoeCM98nhF0
	dL1vpcsYsQ8sjGr/dkcjnoKsmkyytUEV9GUiX4g==
X-Google-Smtp-Source: AGHT+IE7C7ietJ4Y/0+uH2m6mHvh2YOlBatLgbz6q8AofuEHMi7jepOQs6Xhd/J9ZNKB8Vfix6LAyfaQ9R7VRjkSy+0=
X-Received: by 2002:a17:907:980a:b0:a6f:501d:c224 with SMTP id
 a640c23a62f3a-a75144ba407mr634036266b.57.1719902838709; Mon, 01 Jul 2024
 23:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701185132.319995-1-jesse@rivosinc.com> <20240701185132.319995-3-jesse@rivosinc.com>
 <ZoNtrXawP8nvXUds@ghost>
In-Reply-To: <ZoNtrXawP8nvXUds@ghost>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 2 Jul 2024 08:47:07 +0200
Message-ID: <CAHVXubgq8YRTmp5ah2RmfQ6BoPRZDbkrYOuNvGX5yScUcNM7cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] RISC-V: lib: Add pi aliases for string functions
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Wende Tan <twd2.me@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 5:02=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> On Mon, Jul 01, 2024 at 02:51:30PM -0400, Jesse Taube wrote:
> > memset, strcmp, and strncmp are all used in the the __pi_ section.
> > add SYM_FUNC_ALIAS for them.
> >
> > When KASAN is enabled in <asm/string.h> __pi___memset is also needed.
> >
> > Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
> > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> > ---
> > V2 -> V3:
> >  - New patch
> > ---
> >  arch/riscv/lib/memset.S  | 2 ++
> >  arch/riscv/lib/strcmp.S  | 1 +
> >  arch/riscv/lib/strncmp.S | 1 +
> >  3 files changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> > index 35f358e70bdb..da23b8347e2d 100644
> > --- a/arch/riscv/lib/memset.S
> > +++ b/arch/riscv/lib/memset.S
> > @@ -111,3 +111,5 @@ SYM_FUNC_START(__memset)
> >       ret
> >  SYM_FUNC_END(__memset)
> >  SYM_FUNC_ALIAS_WEAK(memset, __memset)
> > +SYM_FUNC_ALIAS(__pi_memset, __memset)
> > +SYM_FUNC_ALIAS(__pi___memset, __memset)
> > diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> > index 687b2bea5c43..bc73325b2fd1 100644
> > --- a/arch/riscv/lib/strcmp.S
> > +++ b/arch/riscv/lib/strcmp.S
> > @@ -120,3 +120,4 @@ strcmp_zbb:
> >  .option pop
> >  #endif
> >  SYM_FUNC_END(strcmp)
> > +SYM_FUNC_ALIAS(__pi_strcmp, strcmp)
> > diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> > index aba5b3148621..b36325a57f6a 100644
> > --- a/arch/riscv/lib/strncmp.S
> > +++ b/arch/riscv/lib/strncmp.S
> > @@ -136,3 +136,4 @@ strncmp_zbb:
> >  .option pop
> >  #endif
> >  SYM_FUNC_END(strncmp)
> > +SYM_FUNC_ALIAS(__pi_strncmp, strncmp)
> > --
> > 2.45.2
> >
>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex
