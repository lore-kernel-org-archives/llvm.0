Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE7329E57
	for <llvm@lists.linux.dev>; Mon, 23 Feb 2026 17:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868203; cv=pass; b=qnMgBfoOHWmrYuqbCm7DRaVxoOHnwZMrWTMqRW48BMSeBWciz3tT97xGeV+Xk9pPdaercWztfLNrntWvoqcB6OlS1/QCRiOam20pbxWlFf8aXs5ytqn5RXleIpoS+63y53KKBR/9BKRwywJglgidY4ewR1QCnuO7gImChn0Tf4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868203; c=relaxed/simple;
	bh=svfS4izL4CtR6CtOwfQ7zAKovDrwRwY4LcCnG72rreM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlDSg/k4L6+7NisAdLACNslixzDQO4FddWpsm5PgBBpW6zOdjY9Dt1Ri87FDAUsycpTxIOLg52BSXb8WCYIR+z5QHP/QxuzQzafIxGPTZE1/w82kowANfWiKIS8bFGug1yEY2Z8CCU8CfjmGSqvDn5548Ec+Z1jajyObNpRHKcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/YAhCMl; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/YAhCMl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c01595276so7009480a12.1
        for <llvm@lists.linux.dev>; Mon, 23 Feb 2026 09:36:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771868198; cv=none;
        d=google.com; s=arc-20240605;
        b=XBBhUAoei7NdfBJWFnYANnYmDknf3Bn9giEYdmMtma+vWTpw5iUmrnh0lOd3+yDzi/
         GKQp/AsoTval9b387ZlDSRVnerF3R2bNCx9RUKVS5Xrui1oESmhLKBiyN4v7OXyD863v
         1rZ/8zGsJ/ln5UsZ9hjUcuBCdwSmlgJKUKbUQ428Pmw5qFMJz75TRf75KzXP2KZGzx6E
         ZY9v9QUCfOGuBdV4CiLmFi+pei/3YbUsI2HoJXBmELdpMMfcEOYgTVEXLnFeCocQRSWA
         DrkekaHWyDNDWTcRskObpB0RuiK68DaXV3XO9SZ6OH4z12rtreby8nwcFC7NBnPZc8lO
         6Rvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XE3aRuDhBpmNR3/dCAv6GjOuayZDtG3XM23vAdRzhV0=;
        fh=Ia8Y3od2GTjCvKBf5GK14THFklRwNU/PD9KrIYYQrT8=;
        b=J2eEtvHDkt7ynohsTkR9IMh09vmoLWh1VuBw0vY9HWzT2HpiQ14L30aA7u0htDsm0K
         OD3+/fAR+CLoWPEtOB9lENn0nFeb7Fndfj7A8Dw1tbGQTI/N+CNP78tyxfImUbO4/U6G
         DluHGalrqfog7tmNymZiE0JHazKV44pnJsyaVjR9MUgB0Eu0JPPdBoamLUn8BUw6qSip
         fFFjategLgfBytdvWpB48mY9j/a9pXIoxwTM1iHquNRXqNmEg8Sw8q93KN5iCxB9qwml
         RxEfuIXkGcVVlXMb7u9sFVxZesHy4RxSQb4ZxXN8D9H3HhqGWKY/tISvlEuEp8fFHvJc
         55WA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868198; x=1772472998; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XE3aRuDhBpmNR3/dCAv6GjOuayZDtG3XM23vAdRzhV0=;
        b=Y/YAhCMlsCg1+nz9zPY+V2F7J/jW2hrHCz3De2XXJqnoRyle3cbxqUiK9PB0FrLPtJ
         MEMoNym1HeqKw3K0uv92cDwZ6gDPFmq00h8RpphpSvcBEcPiwWKoZDJWgIWQhaWoO65B
         rWmkzz7Qc41quLj2GH2UB+JJQvFBkUyZSx8cVOStpEcpp8daX/OXVba4hccZYPVmm7Fr
         tqWwF7LrgIUnyBi3yCOKbwVAnuiiB4XIvkyVSsoHTbo08ovxNQWjLdPqNhOoILDkd2ZZ
         tM7c5SY2MSn9845tN4kJv78nuzlxG4mZUV/dnq81PBREhD4WvYpDlil1sM0mCtHE2mRV
         Hu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868198; x=1772472998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XE3aRuDhBpmNR3/dCAv6GjOuayZDtG3XM23vAdRzhV0=;
        b=sw8e7EEtTWmsFkEx02CTekAi1/A/zUr0tPSB4ZDLxErcoEWVO2ckwltdlV4PYAhupF
         opCErkYdJcofXvSO4UdVYGttWMHVGsIULvoCC/cokUjsHq8tyUZYG0Lbh6BUWoi2g47W
         o9Vr67NjgSplDswmReMs18YY7p0RyMOAoi2j8ItfmV2+9AYV/JZgrcApb2QR6GIcn7Ii
         wWnaCTGlZFtKJcW1d6Vzl70v99icmHIkytQGJAdO9UezwpUP33rVjViB6ZFhfpwW6TO8
         FrC8Qb9vzmyW+v7UsGMa6vdoiPz6H2+aoTzS9ZfbRi2kzUBkVfHVqX0V4fwUXX9R0pQi
         X1/w==
X-Forwarded-Encrypted: i=1; AJvYcCUblhMI5BPRREULOqRIcPl70mFvLWHUBP7n3fRMTHYsMX/765u9Pe9ntqhNFzySLgGnXEfc@lists.linux.dev
X-Gm-Message-State: AOJu0YzgnoVm6wIBBvZBU/bp6uMMCjQYQ8wmNY359c/i2VVzqO9fZB73
	By3BWtNXvkGY1rQSef3DkGvLatxbZwcbXA+SlMqRDVyc47VrEUVVW371088+uzqRVHiX3+3vnsv
	qHVCak4ZfErqqvQcEtSiKlkpUPCXqSVw=
X-Gm-Gg: ATEYQzx8mXTbRglvZBbnxHgV3aqKV1jeEyH26KuCay1JMPQAMVPVgGgfO2cvU+UXVU4
	fpu194jNQ7Be+crvAEfXljbIi7evKoIL62OwxWknZtQBVr1NMqFp2qo++9AldCAnnP5ls4zGWHH
	9PzVSlxLLv/NW08wvaVkz/GU+BY4LYYEF44UeliUYpDFrYyXxohcOq0MOgjb8w8ORNpm6fk968l
	O+IBM3vD1O+YAJOT9x7qPgNfhUGG1fZNCmejlEWFG9HWjPOac2PWs2NxtwIs8UrHB/VEk4kAqwr
	cZwxpERd
X-Received: by 2002:a17:906:e286:b0:b73:2b08:ac70 with SMTP id
 a640c23a62f3a-b9081bbf581mr431440366b.49.1771868198166; Mon, 23 Feb 2026
 09:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250407180838.42877-1-andybnac@gmail.com> <20250407180838.42877-10-andybnac@gmail.com>
 <20260221-repeal-emphatic-ddc2e9b94208@spud> <CANk7y0iTjHUBK66xx50b-eT=ssz9g0moFjOhCmipQC1SzkGs5g@mail.gmail.com>
 <20260223-respect-chaste-60c3403b5bc9@wendy> <CANk7y0jdzCeFaLVpj6-mnWiSZvv+rJF=9kgWDYF7g_rjCpiYsw@mail.gmail.com>
 <20260223-garlic-sulphuric-0c1574608d09@spud>
In-Reply-To: <20260223-garlic-sulphuric-0c1574608d09@spud>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 23 Feb 2026 17:36:24 +0000
X-Gm-Features: AaiRm52Y5X8NepG34m2dFfJzvs_KysOs_RCa-fhWauLxea9ysucuctUwLTWqJdM
Message-ID: <CANk7y0iokvWz==XQ67v3aztQ268WVmud22Y4gp-dPd4SrFhzMQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Andy Chiu <andybnac@gmail.com>, 
	linux-riscv@lists.infradead.org, alexghiti@rivosinc.com, palmer@dabbelt.com, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Mark Rutland <mark.rutland@arm.com>, paul.walmsley@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	eric.lin@sifive.com, vicent.chen@sifive.com, zong.li@sifive.com, 
	yongxuan.wang@sifive.com, samuel.holland@sifive.com, olivia.chu@sifive.com, 
	c2232430@gmail.com, arnd@arndb.de, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	pjw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 4:29=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Feb 23, 2026 at 03:41:26PM +0000, Puranjay Mohan wrote:
> > On Mon, Feb 23, 2026 at 3:28=E2=80=AFPM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> > >
> > > On Mon, Feb 23, 2026 at 03:18:17PM +0000, Puranjay Mohan wrote:
> > > > On Sat, Feb 21, 2026 at 12:15=E2=80=AFPM Conor Dooley <conor@kernel=
.org> wrote:
> > > > >
> > > > > Hey,
> > > > >
> > > > > On Tue, Apr 08, 2025 at 02:08:34AM +0800, Andy Chiu wrote:
> > > > > > From: Puranjay Mohan <puranjay12@gmail.com>
> > > > > >
> > > > > > This patch enables support for DYNAMIC_FTRACE_WITH_CALL_OPS on =
RISC-V.
> > > > > > This allows each ftrace callsite to provide an ftrace_ops to th=
e common
> > > > > > ftrace trampoline, allowing each callsite to invoke distinct tr=
acer
> > > > > > functions without the need to fall back to list processing or t=
o
> > > > > > allocate custom trampolines for each callsite. This significant=
ly speeds
> > > > > > up cases where multiple distinct trace functions are used and c=
allsites
> > > > > > are mostly traced by a single tracer.
>
> > > > > >
> > > > > > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> > > > > >
> > > > > > [update kconfig, asm, refactor]
> > > > > >
> > > > > > Signed-off-by: Andy Chiu <andybnac@gmail.com>
> > > > > > Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> > > > >
> > > > > I bisected a boot failure to this commit [c217157bcd1df ("riscv:
> > > > > Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")] yesterday, that ap=
pears
> > > > > to be affecting all LLVM versions that I currently have installed=
. From
> > > > > some initial testing of Kconfig options, it looks like the issue =
is
> > > > > CFI_CLANG related because when I disable CFI_CLANG things work on=
ce
> > > > > more. Since this option depends on !CFI_CLANG, but is def_bool y,=
 I
> > > > > modified Kconfig to force disable it at all times and tested
> > > > > !DYNAMIC_FTRACE_WITH_CALL_OPS && !CFG_CLANG, which did boot.
> > > > >
> > > > > I dunno anything about what's going on in this patch, but so litt=
le in
> > > > > it relates to having DYNAMIC_FTRACE_WITH_CALL_OPS, that I was abl=
e to
> > > > > figure out that the problem is -fpatchable-function-entry=3D8,4
> > > > >
> > > >
> > > > DYNAMIC_FTRACE_WITH_CALL_OPS can't work together with CFI_CLANG.
> > > >
> > > > arm64 has:
> > > >
> > > > select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
> > > > if (DYNAMIC_FTRACE_WITH_ARGS && !CFI && \
> > > >    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
> > > >
> > > > would need something similar for riscv if not already done.
> > >
> > >
> > > I think you've misunderstood my email. We already have:
> > >
> > >         select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_W=
ITH_ARGS && !CFI)
> > >
> > > The problem is that the patch broke using CFI_CLANG, due to the
> > > fpatchable-function-entry change.
> >
> >
> > Yeah, sorry I did not see the patch,
> > the original one I sent had:
> >
> > +ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS), y)
> > +ifeq ($(CONFIG_RISCV_ISA_C),y)
> > + CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D8,4
> > +else
> > + CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4,2
> > +endif
> > +else
> >
> >
> > The basic Idea is that we can't put nops before the function entry
> > when using CFI_CLANG, because they both interfere with each other.
> >
> > the fix should be something like:
>
> Ye, this is what Nathan and I both did locally, give or take. I just
> wasn't sure if this was actually correct to do or if it was just
> papering over an issue with our CFI support. Do you want to send this as
> a patch?

Yes, I will send a patch with fixes tag.

Thanks,
Puranjay
