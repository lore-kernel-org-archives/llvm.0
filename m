Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794853749;
	b=F1B+a24cvxij/zqkcNwyrSzRtn2ebyr7LLHl2+jMlRfkAzKpIRqaPKAmRrqLXut1YDju
	 wEqE2wDssiyxz0Hm/Wt7E7EJ/qfF/Uy4bce/LeFWVkKtJqk8KaXbAL29YRMTViBaQa3G9
	 bmx6aWBrAKMusabQB1BWQlFLF+yphUrOCkpR+0gwJoDfAbuVrNEwnYQVQVb5HepfPSPq6
	 PNPFVehBdaXKCPdg58d3rsxGkHZAuyWuELQPvSYs1jCh4RZgWnak5qYZywxVi07CZwSMc
	 ZiiW+sT0sg43CfO/I+YjXtwizxXK00DEE7aKteM/Uy79ibdMMxF94WKxhAk6LNvUM2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CMURHZUEjPGHjKxsa4r9UiTn+rQOp1qEEaG1lKbmkKI=;
	b=4QZUyKj4ohm93lHG4KVM/Z6QMwF2sYK8Ogm9einf47wh0tdEr977Sc5RiZCZzYTMM8jg
	 d3wjCHU3ShjmnK4WsO4bqqPaD6JE937vS9a/dyZow/JnRO9/JKx6UyRoyvQGHT7x5Xfix
	 5mohi/RPMhpHuKmlFlCctD2vtmmgtNhOZWvBOodMA/lGRaw2foB8Acd5tYyKjDdIscbYW
	 7RgfJq9qUZ/wcs1nVOupHlLNfy+sdMtUbjo1MwTFZ04RtuPD8zFnPFj1xYBHBg6p+T+te
	 JQYeMw5z+p5PJLY9T+seX4FkO5/u118FayiyMS3wZcfeBYWi5pO2EEhdf7SdDv3gczw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oRXtMQKk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0422F606A31C
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 18:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0422F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oRXtMQKk
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3edaso93027f8f.1
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 10:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794853747; cv=none;
        d=google.com; s=arc-20260327;
        b=HQoqjBr/JtDN8vg3Dr01u9SYypHaS4yG6v2taFoRdJjgNjRqCbNBplDIhd12ng8KA+
         mSep9t7pMHZHsZa8lPtgGpfARqM17u2b/73/ONTNgfrVzgYQRHdN4PWZ0IsKM97+45k8
         cXzN3hiqYlFRK9koYwj8asjzi6z5LkFtplA/f5Aw41JF1zoAzeHfb/fp4VIGfsTHBys0
         4mTkDLHQV9PpPFF1V/YUbC+TJ/IA2nD0VmN1XL21DHE66RHPYQGBv1zTrtOqBn3WSPeB
         b4iW/nzHfOyq/o92S39fMc3Mwrq11AE0pMoFjdhsugSA187cl5Ko/t+yj3w0Z04fMmea
         ixrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CMURHZUEjPGHjKxsa4r9UiTn+rQOp1qEEaG1lKbmkKI=;
        fh=S31tSJweadmsi39ibPARU6As6eyvxPWaUhvc6gdYsBA=;
        b=b4UZfUicf8KZiQRJ75LdSJWP4978wLrRhkhILWWWH1ZE5bZVx35r5KbhS3Gt21+5Oz
         cNAs9EDLfV8T6vh7V1Wf6uLgM2NfTAdpfDmAtTWaRBCehqMAS4Uk1ul3ZpS16V9iGgpb
         7Hh3cIMbKkFZPjxVgU9zvcCQsvyn8OfZo55FHcR+TzHlUzL/FzjeT48O3WSTapzZIebe
         jyI+EsVSdrt2t75CHIoDfUGReA6fP2al0HE2llImA+1AwxdoH52qSVPtbQSRPcWrU0uR
         IwdmMRzLCETUIkDfLS2LAqpFIzAsl/31TjE5BojWGsxz8TvlODYUuMQuUD0yeA85azX3
         sN5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853747; x=1795458547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CMURHZUEjPGHjKxsa4r9UiTn+rQOp1qEEaG1lKbmkKI=;
        b=oRXtMQKknIoxySSEhhyQb7YRNUIIao+yV97vc/mELGkfbKAW2c51wKPYPPvgjnsXm/
         EWLdejr5PzM+1LaLX9UXHOmjncTUYH3U4RKBCIxaUVnCAHAlmNsvL2JA8VnhIurkD7xP
         ieIC5q1WsKVg/FcB9X8VvE/p7DSIesFYUWr70DQ5NzCEy/weKRF5ebxWDvTmA7aASek1
         tfLHg+osYsPlY2YIApoYycKADMahETTt4H8c15PZeClT64UhuVLfwU5Hb8OsZoTKfSz4
         B1HCNt8tK0ZVB4bF/vl0xwpTEoClofGj6nU37L9l2UKYUEcvIOBCIEU5XCBkNsZLap5R
         Rmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853747; x=1795458547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMURHZUEjPGHjKxsa4r9UiTn+rQOp1qEEaG1lKbmkKI=;
        b=qz3VacCqaEIEj5sNR9xv/6EWZqFp6JZXaoHKarW7X/GWvMM4pYXja/BJZ26sMcUQMH
         k6LkgiIulDBIsmyqcJI6cNgu+wJH8V4e9Mtw9iY9Ayifx0/UVp4ICoHPYJXYEx9nUjiQ
         00wxBgHBodkhVsMeYAJ+6haqJwaL9iXq3U87PhI/2ZOkFFJFvpWQwmUVVxJLUFsOs1qb
         +ArcEvJN2jvMAHeSrhlz22LjC2frrL9oUbYOkpkaiGOZOoaJVTsMEz2XYImIVSnKBCn9
         OcQF8qrHOwiE9ehIwQzuLuQKe3sApqiU84haMLshO3SP9qoHyQrCWcPiktlOSBt87WQT
         sskA==
X-Forwarded-Encrypted: i=1; AL+hErFcRlunhrm2J4aHKfKuQHPILR+vAPSKhSXRUDE3w0rdMFFjhuLd0Khw3eTGm8xZYRpr0hnk@lists.linux.dev
X-Gm-Message-State: APuU4Z+nJU5Eayrj703F9M92kWboUU/OXQbP0BQ8Vo4h1DJ6by1190eb
	2ZojKQiDnC2OQRrPyWyaZC4OxcY4/WF5WNlpAps1CfC0XzLE6ZRHTvuU/9USAt6J3fQf16AAvGj
	wbFn5a+Gtc1LRPGtPw1+qPpEXElFw8RJ/stAyQc1+
X-Gm-Gg: AZFdTZdCX1tOkOGU4/Wqbf94nO4GxKKIkCFCYWyg852XtjELjqlB6ckuJd9UGwynu2W
	gWdXMV7zWiA6p9ZT7jvaafozHAk3UsNzqYdBWinO0pX8RU13xjgdttaGJPikgUowkMwCAiaS4Hf
	o0lJWLP7pbuSkimlAjahiY4xg88lLTt4CgCgIxQCQx+WyiVYFmbaAX4XbCk6JTrIEI4+dHv4Gsp
	V64JqVJA2VH86txqoGTWVzLFdrr8d8vsvwFsjQ1FVvKbgLvcr7espJ1/BUUPP4wMp4mgchAV32W
	jbguoolStf1D4ysZv736pR6B7J7dgK1FavuJ9+S2vxUbfPg5UiomE632EV64tQtX4uYZiLXp/rA
	HHaehyIniwZLOFA7Rwmr31aybQ48bumRd8nQ1tHSPdO7dcraNOGavAGecQcIvPO8gSP5lK1RPD5
	jekEMx3h2ORF4NHLrkJiGMl7UABTBOmIw673syxdyEWpZ7UeG+5myVMnHvr5RvpA+H8C1x9q3K1
	UIfnqF7O96vOQh8Ul9kCLakEuKlVGkZe1zoDE8=
X-Received: by 2002:a5d:456d:0:b0:498:be72:6364 with SMTP id
 ffacd0b85a97d-4a376860342mr482276f8f.19.1794853746846; Mon, 16 Nov 2026
 10:29:06 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-x86-no-march-native-on-non-x86_64-v1-1-cbc8b096d1c4@kernel.org>
 <20261114202524.GBavjDtC9Z3j7PrV3Y@fat_crate.local> <20261114204605.GA173332@ax162>
 <20261114205806.GCavjLXgsKNNwK0zLz@fat_crate.local>
In-Reply-To: <20261114205806.GCavjLXgsKNNwK0zLz@fat_crate.local>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Nov 2026 10:28:54 -0800
X-Gm-Features: Aa3M54qN3_OoGAqkQOkSbWOChdqyPPowLr2H70kPaYwIzW6n-JgVCrQ_Fg1xSn8
Message-ID: <CAKwvOd=f+ib1XVvFfiW2mF8NoWo1jr55fJo=QOuZCJmzQCVmtg@mail.gmail.com>
Subject: Re: [PATCH] x86/build: Do not allow X86_NATIVE_CPU to be enabled on
 non-x86_64 hosts
To: Borislav Petkov <bp@alien8.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 12:58=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> (If it were me, I'd simply whack that native thing. It is such a waste of
> energy).

There's always KCFLAGS.  i.e. we _could_ remove it from the x86 build,
and <whoever cares> could still do

$ make KCFLAGS=3D"-march=3Dnative" ...

(I'm agreeing with Boris here)

Nathan,
Was there a bug on file against clang for this?  I can picture a fix
in my head for this...
--=20
Thanks,
~Nick Desaulniers
