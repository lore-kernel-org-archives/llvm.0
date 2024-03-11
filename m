Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD25257873
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 22:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710196119; cv=none; b=Fs1wmWRtXx7d3G6C+H2KR79YSmlSqvhtpTZFWPN40/kngr/vgUKyyNtqCRxV19+O8hZ0SRAWPy8P1bft69RXfuxm384KvIs0o3mk3AccyAxDscVgnGEEbIqgmmOehVr30Uvrd7y9j51NGcLVZHj7AiFBVIDp14FCymIqqpjN/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710196119; c=relaxed/simple;
	bh=gQ7Ct6zGWdnzyX9pDHTyMtWVXbDBccuMcZuvQWGsqG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDtAYcaNk46viG0fxRWPuXoEPAQdKjeOXL9SadByS2AA8c/1flqTJvYKxew6yrSGLZTs6NzBb5iJ/Kq2ay7g96tpj1k3YjI5L0qPBfw6mf2xOh3p0a/kM65gghuth4v4dEnVUnGIZTP2eb65EWNDple928gizgzbjYi3EVnFsUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T7IuxbX6; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T7IuxbX6"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4d34d9b2d89so617076e0c.1
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710196116; x=1710800916; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQsquiNps7fJqBPosHqKZ+rcTaPqPiVAKtO/8i4tBEI=;
        b=T7IuxbX6n6FpKU51j5tw2dYPGOuiRu+St92QjKuMWl8hZBSVf6t1ZLi8ud54rpXkeW
         Lw1XGEvr6m6vi4/EtgHF+Br5tV2oAs3OXBD8k2oMyJ/KEjI095aoJffiwrau3Yef73T1
         1kfQJuvXu4MdDP3nQGPSk/hZ18STiqqI8YO456GlYdhbIjdfu6nl6Tn2RZYBHr7RD5QN
         EpuAiU/5ouvMoawmu0VzcuoqHERc72lRVNjLGRMIuqx2Fngc8dYQVNC2YPNY0nWVY5wz
         YKjD65R73KKonBbIzhaDxx8lr4YBRzjzHqxhKjWt5vr2H1qKSgQzOPP370CH8mK1dx6n
         f3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710196116; x=1710800916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQsquiNps7fJqBPosHqKZ+rcTaPqPiVAKtO/8i4tBEI=;
        b=Ohvz67SxHJMi7pWpL9vgWiU2Q9r8nEfiusqRjpC5/IEEtBAXjht5jfFbbswFR1w9JO
         8HihqBMwa2Yp1iNIEiNsV/gPwGrs5txReGzo0DXGWynYr9xYLAEIZAzsTJq/dATDj7cG
         YH9B8sBFPWQyJ0XqeSzZ/NX03hsxGqoqVpCiNttnqWRbUGJApjTKF1nrDPkOyOTfaUwk
         ULbUS+mA3H1wHrsiqW7TvxK5XQmfzYslLaoDie8sqidMCFnSAtOxOQWDRTIUOPbvKcRS
         +JPq2nu7xXmKd6ctC5N1gJKfoy7/z3lqxgsVq1mrTXQf4/2VHM1ALc16TB7djVeiq26l
         3IUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf8UtqM4G30He14WjgzhtKef0nyjn3CFcjzoIzUYfCJ2H56L4JbwJoF//e0tagRPJz6D+iJxxmvNjYdO11eYzJ4WYFjQ==
X-Gm-Message-State: AOJu0YztlWcsWKpWusfOIE1VpU7x5a8SqI2O1TRM1GInl7fTTqAN2+M/
	U4rruA90h00b2JkqUJm5C/oO3R/MXwPg1In+800ZdfrH/PDaDZ9Nzho81VaPBSKiizGqPl2Dxm5
	PTHD4OZmSV/4ykf/kMSs5KFiygOfbrIDc/wTg
X-Google-Smtp-Source: AGHT+IFViC+Hzd9eBynxU8DRZ2sJXpF9woum0GtJT0esSbJ5ZHbaeuL9wlc9lawAgGGKM/qyJUyvMnuYGVCzlzBg6kQ=
X-Received: by 2002:a67:ea14:0:b0:473:45c5:5bd3 with SMTP id
 g20-20020a67ea14000000b0047345c55bd3mr1677103vso.9.1710196116545; Mon, 11 Mar
 2024 15:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org> <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
 <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
 <CABCJKuf6CWw5Ff955H5qD1Nva-j3WJZ-5A7Rb1TyBwCaEd3E2A@mail.gmail.com>
 <CACRpkdbjjbRP5cED+qX5PGpvjvBEK9AxnGekVab=7WMrAPe+pQ@mail.gmail.com>
 <CABCJKuf7xmCBs8UrpEbeRtQnofuq2Pp4M=RGT4TUw1+HsvS_CA@mail.gmail.com> <CACRpkdaVkaM4ERUcK-3BqHK6O9hBtj4tEHZaQXbvW9Oh23c8Gw@mail.gmail.com>
In-Reply-To: <CACRpkdaVkaM4ERUcK-3BqHK6O9hBtj4tEHZaQXbvW9Oh23c8Gw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 11 Mar 2024 15:28:00 -0700
Message-ID: <CABCJKucJd-EG1yr6u5SvUW2Frxs3aBPCuo9TH83ba2chdkb7tw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 3:17=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
>   LD      .tmp_vmlinux.kallsyms1
> ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_flush_user_tlb_range
> >>> referenced by arch/arm/mm/tlb-v7.o:(.text+0x0) in archive vmlinux.a
>
> ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_flush_kern_tlb_range
> >>> referenced by tlb-v7.S:60 (/mnt/storage/linus/linux-integrator/build-=
vexpress/../arch/arm/mm/tlb-v7.S:60)
> >>>               arch/arm/mm/tlb-v7.o:(.text+0x40) in archive vmlinux.a
>
> ld.lld: error: undefined symbol: __kcfi_typeid_v7wbi_tlb_fns
> >>> referenced by arch/arm/mm/tlb-v7.o:(.init.text+0x0) in archive vmlinu=
x.a

Clang only emits __kcfi_typeid symbols for functions that are
address-taken in C code. You need to add __ADDRESSABLE(function)
references to a C file somewhere for functions that otherwise are not
address-taken.

Sami
