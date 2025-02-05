Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD31DAC81
	for <llvm@lists.linux.dev>; Wed,  5 Feb 2025 23:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738798874; cv=none; b=giHFDf00M/KMnff6ZdRl0Q8gd9deTGNyJP8BrNsC3CAA8CqAMB5yPRz9z8zOPhGyCAQST17MaxO4zvZGn0uTN1Ospm2dwYAIKMOhTRhoE9VxDEO3onknFLGYo2z+mnNrw2Z5gp22mALMVbRzXZiwpRP2ovXlhzbJU7nw3I0oKRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738798874; c=relaxed/simple;
	bh=WKEgMyHfPWTlLLqqrmnwtvQK3GmysT72SpoyvC2gz8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKVAT3C/Kct/gIcvlpJi6EgcrJKFwFI5BYImT72mJX6mV+vLLSj4hthZZk8zz0152BlwcwlrihTjtOc99rozwT4bHP0Xzu6TNO8SAL6cM++NMQWv4rbymHTQaOoOWxHKNE22bFYHRbEI5DxpTWgweHuaRV4ZyXplAvd+t6ffSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuMaSmds; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuMaSmds"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so2940865e9.2
        for <llvm@lists.linux.dev>; Wed, 05 Feb 2025 15:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738798871; x=1739403671; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKEgMyHfPWTlLLqqrmnwtvQK3GmysT72SpoyvC2gz8E=;
        b=KuMaSmds0yorR/mtQd95I1jnZcZP17srZENRg8626lHVyjbgOh2afJYfwsRwN4Su5G
         YRmcvYnDyDn8uZyODWouo7ydve0wRHRow44HaYmqEzBkytkZ5ZbsJzl0HH5Ob7h8qgcn
         pix/qOpx4KffvYrLQnoCz2Y0+Qg+zFKP+3T5tob1qqDL/aWwn+7f2jN2iAvnZMCb+BfA
         SAhTqi+QN7v19ZSo89su7l/MJxJXgHfSd+j3/zp6qw2aINVgERZf9giTQ4xkPu4/7ono
         i/PmaaeuwXSvUZ/4qz5m8VT19rF4+q6at63G8NCA8BfJehb9AEK5DHpejPq1molaN+wR
         VDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738798871; x=1739403671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKEgMyHfPWTlLLqqrmnwtvQK3GmysT72SpoyvC2gz8E=;
        b=vQ6jPHFEptezdAdNqaEF3UAFbPa47GxAIl8mgUlAlF5ZDNDu/aoGUOZE3+nCY7dR/l
         DteU4psSCm8yhPh+Z8WDRPO5UUfrDHjlbZp5lbtPiVY9/VQTPoLPVbUY0FVcnGuuNgCX
         yAyNCdymEO1wAcOex0+IeiVGLDRmOCNwnPX6QW7DYBgxefHM8ErbesBgWKeENd32l/MI
         ytIHO0GxIhxQW77QnUZyGvyevqU5zuq4CW3RxkFqYATdz88vKqmUMvZlrVaw9m3e801c
         SIScDNQpa+0p1llyXMABXjQNjJqQ6T+zTGSAErrhvY3oFOpjHrwGf3p91rva0Tm0uB6v
         qEuw==
X-Forwarded-Encrypted: i=1; AJvYcCV5jPUouDBhH5xILygm2eTXX3fPmBbFPTHr+lNquy8XNoOVKKEseSCQGJtdRv3ib3O7zgRV@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbp8lMi/gG9aOWpsPqaDU2FvI5uT3Dme+G32toXdoTem5kZNXs
	J2pIFlDK6s0rZQ8IxVA+OVwGDTI8QMpd0p7u1SwNHTzg1FRTOtWWqFnbCSOXTrm93fjALtTn3+Z
	f1SKd7LJ3rtkgvPucnu/IAMnIYRI=
X-Gm-Gg: ASbGncvvYqGiVfOJkA8QFYN94Rh3PByUMyKN+pUurlEK7I6G2OmZ1EJRbCrTZsI9U+p
	UtRBXDpf340NC5SqdNy/V1LiqjfjFIOangYRutUYRXLosenwFfWUVuzseOqiiOoF5HGA/o70LFg
	==
X-Google-Smtp-Source: AGHT+IFLTv0TDNnJU+yADljvGxMSoZCkyg9G4XwmiEyfBnbRTqPG2jvE/eed1EqqR6nVWHsb9vVYgVGcI2mkW+jV4yw=
X-Received: by 2002:adf:f1d2:0:b0:38a:8906:6b66 with SMTP id
 ffacd0b85a97d-38db492abc4mr3094863f8f.38.1738798870580; Wed, 05 Feb 2025
 15:41:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:40:59 +0100
X-Gm-Features: AWEUYZlz3dbMNs5uaCuCxvHCPA1V_UbROZFgxVVkwngTO-akZcC0zg4IFPaM-WQ
Message-ID: <CA+fCnZd1dpqv+rM2jD1fNGvhU_0+6c8MjzsgEsi2V-RkHVteJg@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:34=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> =3D=3D=3D=3D=3D=3D=3D Introduction
> The patchset aims to add a KASAN tag-based mode for the x86 architecture
> with the help of the new CPU feature called Linear Address Masking
> (LAM). Main improvement introduced by the series is 4x lower memory
> usage compared to KASAN's generic mode, the only currently available
> mode on x86.
>
> There are two logical parts to this series. The first one attempts to
> add a new memory saving mechanism called "dense mode" to the generic
> part of the tag-based KASAN code. The second one focuses on implementing
> and enabling the tag-based mode for the x86 architecture by using LAM.

Hi Maciej,

Awesome work! Great to see SW_TAGS mode supported on x86!

I started reviewing the patches, but this is somewhat complicated, as
the dense mode changes are squashed together with the generic ones for
x86 support. Could you please split this series into 2? Or at least
reorder the patches so that everything needed for basic x86 support
comes first and can be reviewed and tested separately.

I will post the comments for things I noted so far, including for the
dense mode changes, but I'll take a closer look after the split.

Also feel free to drop the dependency on that risc-v series, as it
doesn't get updated very often. But up to you.

And please also update all affected parts of Documentation/dev-tools/kasan.=
rst.

Thank you!
