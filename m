Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792465505;
	b=sf9/PzMus+yu68x+H2hjq4+n81bpYYBbQx0f42N64OL+B8prnqupC+lS+J41Q3MNDr2F
	 lHw8TQCJzkwjxtX2jKWpkR9xlJHr0AbssNGrZTpoIkrpI5rI/8mjFfi3KFNOHNw//hK9k
	 yYXw2yYtvxpd4FwZU4TsoxN1+1AYX9ZDsARo629BOAL8F/WGUOkhFFLn/V7PNQaEBf6UL
	 /6KRxjUvEsMABLtQwIgyD3520V5u8NjcuJKeaxFR005bGHpnfRXowANOe/0irzoXPMVVi
	 JbhT4R85VUdaD7jEb+aJ9e+aiJ710YJvFT7LyjlSQ4dIR4KB8Ox4H0amnqm19525BqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/UnO0lrqhpIDoRs4EsMfyU8OH+FEirJ2iPt7VTHLUuQ=;
	b=kXKR3vNmF5Lpa3n2NcXxXe/BSWuCzI+REKLBryoxyOctheryYKHEEgGhffmRQFTF70ZF
	 6Yi7XT2jrwU2jOAgq5Gh54MsWb7TI40RRQgF/EFjYMWgavUSIbQIxA2ENX1SqvN3SxYle
	 OS0TfPWYjMxmaP8rZ/WGpdkY472o06+SiV+Jbe4JxYFksw7UY94aRf9iQv71k1A+e57He
	 ouQgv+arfqQIdpj23upc9EhvigFENG/AIFl5dppuH1FkS8GFQR9uukHxIgH/hwITeiqKC
	 YZVczuEEvzDdosStsgest57ICbfSd6v9QXeodcpZwPcYoW5DSA0DkQNSsnqByJ1ElPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Q6VL/x2H";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3552C606A326
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 03:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3552C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q6VL/x2H
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so2208862a12.0
        for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 20:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792465503; cv=none;
        d=google.com; s=arc-20260327;
        b=o1GZ0OjCPSxAbfDo5di158Ffl10GdXEzullfMxkUEtR5hL2aJX83eaKet4DUWg7A9f
         +SvoEeAWQHfbLI0suJDQYNjcxsDlr/wcBGxXROkpWR4yQIblx9dShW5PfMYko8U40/nw
         86orCmz07JnjzqjpOGcYkebEGZaE2hZPjb5CdFUWbTkRdYNomfx8mB3avVbNJ9ZGWlHM
         lsitYEG1zXbQGLTvM4MfbRGU/dJObYBhZ/ecg6JFgF9wftwO7ktKpcDtFeuczBomnrvG
         cGolQ6VHp5KdnqZzm3MT3YoncDBZwa9uQs2vJJn98oW/hnOBfG9CSSwCxCE0fxrCfZd2
         KEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/UnO0lrqhpIDoRs4EsMfyU8OH+FEirJ2iPt7VTHLUuQ=;
        fh=e8P+d+UuS7HB9gBmuz677kIFIy1iAtv2icyPPbDXO8A=;
        b=Fgf/5nD+XduKvFFUoE2xXbCm3Wk2uVkBcMDczeG9OzDaRcHFRnKcESPxSg3LHIZqNM
         nClIU2ccGu4FvKwPgRfiOfTxCzfR+ki+is3aI5AV4dTKwBzNXuiy6fr7M82s3g45P7+3
         +d167hqi+l6QEiUDPqAdergCreTqTYORbasTupYLzqPYt25DavlV1NucfKNdUkJ7gSYk
         xYYrBsq0q3i/h6DGe4GsIKluemCupOPfw4QNN7/nEaWbsqq7wFFp/I+O9qQr72gvrGSZ
         RRztdeviT3Kn79xEUV/Z+y/DcDmISoxF9wiHP2XDAuNHiiyhA0pv4vDVKt4Dbbv84VEL
         SsIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792465503; x=1793070303; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/UnO0lrqhpIDoRs4EsMfyU8OH+FEirJ2iPt7VTHLUuQ=;
        b=Q6VL/x2HbMno9gM0wV8zFZ8YCo62lmhZa+EHbqjYzdFHJtiQn666UTYZCA0I45dVob
         v6FQXV8CEVwWYPket0LVdmP6tmOPCbYCA9GCDPY11M1AmkeQOfzb8mDPRNV3zfJ97mut
         YhYWE4SrqqMxknDuhuU2FeN7CkP/m9qPivN8RUPKxdf0KleOvzSuwsImP3msswE4uPhi
         zKT0/PxEPS668FbZokLvbsC/NatZ7YtkPSs3BGQO38jy1h0aTzDIX1NTqFxpQ9NIX/hf
         RqChXSwQy4VJsLd1ba40dmLw7fHZglUDmfdDYepfjC5XcBwSzVSPOhoaztflziHiqVtE
         NkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792465503; x=1793070303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UnO0lrqhpIDoRs4EsMfyU8OH+FEirJ2iPt7VTHLUuQ=;
        b=oGDXEGE1EWuJymQOlXuSHGAUsqPaPNG7dCDAs4xLt2ENh11UXXsVlv4UOLJ3ePR85Z
         ENgdQ3e1SXybYj4hAdxoWr/YSq942hPFnFS4dAVIOo3Tjb1spUprfWQUwlAwoWOPq8Ju
         CLlWWUwmhXpzApnZhIkV7uZsi6eRCk3DKZWSRmkG3EQLyy8vOkC5nBbHwhlQ7lzYhMXU
         bTTDz/BLxYG2gqlAnzzRJvPqwGn14FYiFX+dDUEB9ktCmP67AUDjECnTinnSkvxjKqMJ
         CRGwWWFXfFHkRvmzDBHmS/EjLUYFS4y+QZ7SHsVouq63yx6PZp29B5hxZbwp+Zx1D73B
         h2Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwnWSSvMCjTZapd+VOj1FQ6n8IlQ9SH23/vjOYPBNnga5dsqe9fNTiLBF6RpnvojQiJqs3q@lists.linux.dev
X-Gm-Message-State: AFq9FYL6rN3BMzizKvKL0FUUhUckWot3KTlza5Mxzq0ACKpGT4j1+HR3
	Gjfy0Ae3y8+0v6mEUe+Hgwmzi/6BJoUOdRRsFswOZtz03e9O7/aNm/8fmiA1p2NHKaEhcS+s278
	nPl8SUckQ0YsjlbxfgnMKgcFwypl8qtpJ1XE8
X-Gm-Gg: AYBFou3DOz5qQ8q4Ed2tC9OrU5MxBKtOyXkgBcmquJRcPB1mE2WZTwaxxADKFtyBGej
	kL9/m5m3X8B3hRFq+nw4CZ48tjdgQuN7IzTIZkeDz5n9EKk9FfK0I8sSSsOesErgFNGjaNeADYS
	CTMBC9S6HrI0obACQWqBXipAkO941yjbNgnTJEe9cmbqJA4c90F5U0Iy7v8ttNfRIKosWk2ST4D
	aasAb0oUu/t6JUMyX0668NrnGmEWLN1uhzoaUA0eh3lmwRbO82E5U18aH7KR0UUwALoESHKgAOo
	mnAopKWEwbKE2vMTxKmfUfELBo3i9rbsAGN3BglGJdO+i6NWa6kAknBvcBAvbTvEKxeYNai2fx8
	7UCW1I6dybDxhQKWxMiY06HoUhDeC1/9MBAHUqnabe/Qb8YozChZCnInEX2KbZ8c+ZMCTuUE00P
	QWY7GHSj69E+IID4LgnZjixhYN7AAxPbaSCe2QYt+5jB5pYnQ5SAb/aaRiC+reHG5Fnw==
X-Received: by 2002:a05:6402:21cb:b0:6b3:c422:9257 with SMTP id
 4fb4d7f45d1cf-6b3c422964amr3480579a12.25.1792465503448; Mon, 19 Oct 2026
 20:05:03 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261020003238.2823758-1-sashal@kernel.org> <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
 <20261020011140.GCata_zHOTeTXLdlr2@fat_crate.local> <atbBFRU1Wm94oYB7@laps> <20261020012844.GDatbDzDp1zC0NtI6k@fat_crate.local>
In-Reply-To: <20261020012844.GDatbDzDp1zC0NtI6k@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 19 Oct 2026 20:04:52 -0700
X-Gm-Features: AclHuK9e_i8qFJodJE6sjcdTqZ_dJSB7D7Wbc2TXtNWdPBYiwFRcpycwZQBv_MQ
Message-ID: <CAKxU2N-+q18FoNV-MLZd=dLrpUoJWEVVUV=E9ESwS4Kt-dquAQ@mail.gmail.com>
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
To: Borislav Petkov <bp@alien8.de>
Cc: Sasha Levin <sashal@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 6:29=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Mon, Oct 19, 2026 at 09:17:09PM -0400, Sasha Levin wrote:
> > I'm not stopping you from dropping it :)
>
> I'd love to.
>
> > Any objection to just taking Rosen's? Maybe with the tags I had on mine=
 to make
> > tracking easier?
>
> Thanks, that's nice of you.
>
> I'd like to use a trimmed version of your commit message because it expla=
ins
> the big picture better as to why we need this in the first place.
Feel free.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
