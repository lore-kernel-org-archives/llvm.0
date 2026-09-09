Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DD33D9DD8
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982709; cv=pass; b=sfxnl1t7Q2/CJHcra5tDNCw8VGVzG++/v2j5JIzp3NpJA2xcxciGZaijgkfo8qV3zzYCZOZ3RjS+t//+M+mYFxqMldJvYBVoNQAoMEHXaBJabzybcmSC4T7rvaDOa5vfb1Br26Lr35BiGkF7YyjWC3fVgXWSH9rP2pb6t+J1Zfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982709; c=relaxed/simple;
	bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROnuLeTdhT4niFNo/yqVejEEZH56SiM/RHE50LnksSn69sZMX75KxJSfstwZbvDGU/uLtUQiNJpeFSp9XljhaX5E+1G7uFedbdtKtZ4Kuz5djYXb874Xqzqz2vhh5UKf2vu4X7cvyTrW4WUJIndK3MQ88EYMb4M1FtAE16gbqEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMPnQK/7; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMPnQK/7"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed443so1574780a91.0
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 12:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788982705; cv=none;
        d=google.com; s=arc-20260327;
        b=eEAi7UyM5GD8eG5qW/hVcOezJTuVmmsyP2SdV5yPdJRmrD1dlLOkQ37LIRAmLOp21t
         qIILedP6HwFGnyXroykIPvooJxl6eMqYHlI49VbwwS8QS8D2VdXSVl774INwDGGzptZr
         FoO98EO0YlY3Hxre69BQcVMXe5ifKRBaq0ZGXDK+W9D5TUsUf+N+16CUGr9cbzbeb14z
         A7a4v7ZQf8t8PcUGHtOAj9cMQl/EvmM83hx4HOteteIhNVp3wTHo3GgP7qUzuPP6MUEo
         eJe8C2dzZkLpQOWagzk5G8cWYwXWVj18scnbg6citnSMN9LZxDO2RZsgeEA1UHuFz7tl
         A7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        fh=Pu6vrNHuWMLmyxV6Ttxq94uzrvpDSj62Mdvkq7QG2Bw=;
        b=A+PK0UCOSV+29zIkh7AdKvABlgcdGtZqPPJTCMcxQJrqMFzsAb1/QySpOd5/Kae/nv
         gVD+af1KbukWnFcVgUXTwtHtGrtySkAU1zmdDXWkCIkqGdA6t1KPmRvhta1qFAcT5RO2
         85w9AfMgWBhe1xQBRVW5Nyse05Vn+9uBY0BIes3b6RniAUP9MwK2NAurgm6Ls3qTWKRy
         ovc9/uwMB3AGRMwPZBw4sI5myWirlphX7lpnT02uscxK0Z4QbBBonB6tCaGa/KP5dXKJ
         9rPEN/8ScOpDqteYRUGYoGJ55vNbq3Wsu8KWhGrJqvOgGhmdQR4SkPihWC7sgPJ24+Aq
         Tjqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982705; x=1789587505; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=SMPnQK/7STCJa7tLv8JQ77Pw8KjjhBCHbKgq+W1ebwQQUxdS4uDMSo6pNPGsjiWVRT
         u05ZvgCVEqphnjLjmC+eqSDDcEe7MeLFlZcB7x0lbfNz8RRFTp1KNFtWlvfG1Mds8U5P
         SH/yyrTHIZvBZaF9Ofv5bnddtePhg4gll7SaQ381VLlwuKTeVW3W5KzNlA/Q9JSTCmj6
         8g77kdKvW06GKfK4NJcFUsmo3OAXoztPXL65j7Gi5jaCKz0EEVZuEyR15K2m+NwJnXac
         VC5P3nthuapLRogfShiNxcTZGo/FIdtyJvOp5hWlmhABb33YwbhHWeeimIU2HoBQLDmF
         V5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982705; x=1789587505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=GyogJMIvvDYrFbD2aThwL8M3URG4wzCTi4/jEQRZtU9YZwyFuB8l70DHX27LtCd4/e
         bX78yR+a9U7c2ksQNSZ/gMCZcWqtKqlOBJ5GCJbQEQuaxWX9tOYkyR+Efkl+QY0saF3H
         uLrOaargrvfwlwBmagf6+Az3RXfT90jtPRl6NUrTFMcSqDGCW786mJxWdHv8HeP/6w8P
         desjzOBHun1n2t4dL5fRO5rZ6sVBh9BU2rNWzEAz3YsHMKRKN5Y77NjbqrBqRCGzN61E
         9AY8rAyQ6W7lDe32VI7iLfFRaGwLu4kg2FnkLj4Bok0jw/a8crZuRthAknO212gtuRga
         9YNA==
X-Forwarded-Encrypted: i=1; AKwUvBxNAOOcMIEww76Kps4DlQ7tQ/TBdD0m50KjgbbWDCdQP5P7x5pLPGAWRdnckUTE7uRdYvUS@lists.linux.dev
X-Gm-Message-State: AFuF++lSh1RA2QqLunxrWp24p7+Smhyogqqg5pAbUPr058oZPLhuRJKx
	WsOeTjiVspHX11G+hed4gLowvoGB6hjD0kCJIUyeMmbgJeowiquhvnWDVal/VgcLDEnpEerLTuL
	PzaoEtepe/2QaGKnTEvWAzf8cKP76M1I=
X-Gm-Gg: AYBFou3nuu9JCEr8a8jD6gDFp1nCj5ROvImughFe8DcRMjCaDih7qpy0pNrnfFyZQuM
	vCQwRUK4kVtsyX5zrxtVdPho/3UD7Q6LCKHNex1J82rGLyAj2REH2UITlKjruZsrh+AxeEUHyeq
	AE6t/qvSUJ0LU0zYRohBWEshAeI45rHUwEZqPNss0hWvBKMuXE7ptQLpwravK+OIFMZeGGPS7S5
	PTL25wtHtoBsjouvqW4af/y9BqkrV0lfBtBaopv2Zudpb/VanmJbh2nsdDf0esG3pDI1QrAeXZj
	XuwdRTZ8COuIub1EoPPlekNXkb6tcRgHvLTsq24Dk0oG1515nR3ZA5+7YNO5hnTPker/iKqdIX8
	1rKC6x4B46estF2qxdwg+EUV9rVZYcwEFTOVbOjgryzS0KoY/P5XV4goN75lGKtbRbm0DYVy9Tk
	xT6fkoi1Un+G+ln3NrSMGuhLw4S+bkPOxDrLfvzx0k2nT478DdgQU=
X-Received: by 2002:a17:90b:3fcc:b0:39b:3505:c72f with SMTP id
 98e67ed59e1d1-39d77b83048mr824934a91.6.1788982705356; Wed, 09 Sep 2026
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
 <20260908071911.GU4120091@noisy.programming.kicks-ass.net> <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
In-Reply-To: <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 21:38:11 +0200
X-Gm-Features: AcwNN1V9A4D3jn7pum7crGv8bcA9jfLyy60O95H9hOe-jZGhQ7AzCwKSAv7z5Dg
Message-ID: <CANiq72=T1487Y7TpAa4c2eTJFMLHoe5Qc7+tRkbkmvrDjfmuvw@mail.gmail.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:33=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> It was going to happen, and now we'll have to suffer the instability of r=
ust...

What instability?

Cheers,
Miguel
