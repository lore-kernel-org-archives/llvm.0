Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458E21B1B5
	for <llvm@lists.linux.dev>; Tue,  4 Feb 2025 23:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738713016; cv=none; b=noZvPeDyb+55EPYwAiRowT1UQJJbjtyiguaPq47qKeANbNM+G1LeRrgyFwe0XRRvbkzXiy8uvzZkcZjYV06z/ZflnQi/eWP/L5mRAs68t+P3luITCLiLKcf5EzE6GKd0XyD5xO2h0hdZr8e80nW+ZNKu8LurDvFc9hjQwmAcnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738713016; c=relaxed/simple;
	bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=byON8coDmOjLMSB/T7n9gdVJDBo/VGawps+Tj1V9rfF670dDrYsmo85cpF7zgNltKfILlGLB6Kzj7VSBm2JzNAdBhpx6IcNW48V1YYrpf8bIaTJHjOVEoqkVXdnEWU9R6JISbKsNsO6srAFym2MOfKwxRanFdQbRKzULxLLFemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=Y+TqlNtw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="Y+TqlNtw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38632b8ae71so5167110f8f.0
        for <llvm@lists.linux.dev>; Tue, 04 Feb 2025 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738713013; x=1739317813; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=Y+TqlNtwbnnhUGsfS7LXvwpgKM2CxXxZSsXreGwivjs21fMPjsWG3HMBRqs67rPWNU
         XyCzcNrqbF6iMmAsjPDSM5yb6BPQedLDmeOTVraHjHYMlYd1XidVl9UQ0LzYd9t6xbum
         NeCzPOusSXDGWYUr0VBq4hHo+/JwECOkpynAzp4Oav7G+r4SAY6CadPNB8dUcejP25NS
         E9ghtDwZrgk+3th9rSdfZvNffHxfxrPaCnvJJTQaRDsQvPmxIxd+DWRN8fq9qQuTPRce
         +YVQ9VV5rGwfj9RNYilrH7FHFo2j7s8CDW5yEV3ccVoo1NQ2CoO7mxR677r0qMS/jOx+
         ajtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738713013; x=1739317813;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=hQc3so8DlZp7PaX/AghekHLMF2AjFr6Ke4xZTPojp4c4D7/ueDoC1kWAFFPrepYWbU
         p2r38JC7xXhqQET9yQ1qLAkDpO/1dLvpeBMyjj8llI8+saMEaoNgXwTrcgkOCcko+JJ6
         0yilnLToUG3MjIJrpiI34snir3DPP9wk3wSeNbe0RNa/PKzHD5QYYVZAoxPOUKTwFQiV
         LTglmOtFiFDwGLYga5O5sUkfVnLU7xMvtuEkQXAWBSWTEww/m1ZLlAaqTG2XbEF6mbhU
         ByOyQC36sfMhoq29fcvdjIBN8MZHpALZTwqiDK+/UvQpCF7XVcK62sdA/Z5qp1VbiRqP
         fv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0qjs4BlPwK0CctlKtMJGIQFUBmpVPBaSMchl9fELR05C9W201bwHX5Rcd4WC0fdoOEQ1m@lists.linux.dev
X-Gm-Message-State: AOJu0YwEXZrswbVYoBnesOOWzQoEm+v9Z6aiIfDW9JJLaLXfAlLAljKR
	xX+n0dvB8xzkcsgp9qSwvvfAIEMMYmCuZ2PXn7qgcltayj+l9hqKoMo1TC0epTo=
X-Gm-Gg: ASbGncu1XezbnG2ocW212jEHe/wnZVY1hO7ZUpQHo5LKgdcV9DykdXe8plPoMocUPxk
	xnScpgQh3Ay94+5y1/xDfQASMar10lFM5Ha0EVCPWFJEQk7NgRv2T2BCZFpRD1FEtu7NbIOpi57
	GKzk4uIp47JVmoVGQaGMTFkjefkSMefMdKUP+++0c5O3TLMY0bW3ySJ/MXma7ShgOdSwiTdbDEY
	7di/5+wnyPa5hrfaAf5BoAXuGvTE4A7ypN0De0VhQ3aCnGstnhpR6sm5ORxQ0Mtb0bsm01NmkiP
	WGYDXErrlS/5n8t+MUx9HI3423lT
X-Google-Smtp-Source: AGHT+IEypTIpZh6mfBdWNl0Yo6S1z/L0NXKr61jortReoHSuVGBqrXhoBHP93m2FnFAjaJ4GCP4WRQ==
X-Received: by 2002:a5d:5f56:0:b0:385:df43:2179 with SMTP id ffacd0b85a97d-38db48bccf9mr352139f8f.17.1738713011907;
        Tue, 04 Feb 2025 15:50:11 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cee41sm16885326f8f.81.2025.02.04.15.50.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2025 15:50:10 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
Date: Tue, 4 Feb 2025 23:36:23 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 4 Feb 2025, at 18:58, Christoph Lameter (Ampere) <cl@gentwo.org> =
wrote:
> ARM64 supports MTE which is hardware support for tagging 16 byte =
granules
> and verification of tags in pointers all in hardware and on some =
platforms
> with *no* performance penalty since the tag is stored in the ECC areas =
of
> DRAM and verified at the same time as the ECC.
>=20
> Could we get support for that? This would allow us to enable tag =
checking
> in production systems without performance penalty and no memory =
overhead.

It=E2=80=99s not =E2=80=9Cno performance penalty=E2=80=9D, there is a =
cost to tracking the MTE
tags for checking. In asynchronous (or asymmetric) mode that=E2=80=99s =
not too
bad, but in synchronous mode there is a significant overhead even with
ECC. Normally on a store, once you=E2=80=99ve translated it and have the =
data,
you can buffer it up and defer the actual write until some time later.
If you hit in the L1 cache then that will probably be quite soon, but
if you miss then you have to wait for the data to come back from lower
levels of the hierarchy, potentially all the way out to DRAM. Or if you
have a write-around cache then you just send it out to the next level
when it=E2=80=99s ready. But now, if you have synchronous MTE, you =
cannot
retire your store instruction until you know what the tag for the
location you=E2=80=99re storing to is; effectively you have to wait =
until you
can do the full cache lookup, and potentially miss, until it can
retire. This puts pressure on the various microarchitectural structures
that track instructions as they get executed, as instructions are now
in flight for longer. Yes, it may well be that it is quicker for the
memory controller to get the tags from ECC bits than via some other
means, but you=E2=80=99re already paying many many cycles at that point, =
with
the relevant store being stuck unable to retire (and thus every
instruction after it in the instruction stream) that whole time, and no
write allocate or write around schemes can help you, because you
fundamentally have to wait for the tags to be read before you know if
the instruction is going to trap.

Now, you can choose to not use synchronous mode due to that overhead,
but that=E2=80=99s nuance that isn=E2=80=99t considered by your reply =
here and has some
consequences.

Jess

