Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923673597D
	for <llvm@lists.linux.dev>; Thu, 13 Feb 2025 01:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739409708; cv=none; b=Kj9hXf/cZwmSCFcN/YLKKJUAuyhhV3P0+XSwFyGlk6Ha+ALiEYu2MnHtk+kPjCNlXjGZGRDUNuJ8qUTN8cQyPxAijk9+lsXVr8I9o/T1oXoksQGnuEKoNuyhi/yKbfYzsXbrSWJcYLwAB/EtpSND99cPO5W0eEvg+i7AWJTMf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739409708; c=relaxed/simple;
	bh=q+nCXvcuGbP6lZuLocKajT0ORe5EGrF6T3/N8VpC8fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KueByD88zh6dkx1DYuM+ia0sATnA8R+pRuv0j62qvl4CGtwJBXW1kTy7G8haRPDAopWLBy6JYu0Pc4jrpocoK9C5odA8MahMbaxDgq1c7YyC3iF8VhzpQKn3JrTRxuUU0mvxpUBPbLYp7XPWKhb0sTAjha/9R4YgtsBo85SfyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1Mbq1H9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1Mbq1H9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43956fcd608so1977495e9.3
        for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 17:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739409705; x=1740014505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+nCXvcuGbP6lZuLocKajT0ORe5EGrF6T3/N8VpC8fs=;
        b=J1Mbq1H98kFBkQiAVGguHZDIhcJ/fOPEGpRW82dYoZ5jbgbQsrubdL1+DbdFwjh/ps
         Z2iS2WxC9RDVQVMG9iUzSbccX9k/H7GtB4/Uoc8aJ4LhdnnrqqoMDCAKvrP01/sjt1jp
         +91BnUaZlusUcA/b3gv1I3XyVrMbzUWrePb0P7A25zp3puZNY83HiwXw6Mz/3rTEjXc0
         pl9oAYKYpoxlr7Uk/iNA1UPmOLccLhUpy+cJW/ZZLbpZAe4Qlvo0QRLrIe0FtgOAePup
         2qhbdAkv/d1+fdjpUZ557umcPdi/IPNc26NgCC/zAlS4ScKpwIEi1TY0455ItYqj8H03
         N+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739409705; x=1740014505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+nCXvcuGbP6lZuLocKajT0ORe5EGrF6T3/N8VpC8fs=;
        b=Q9UHXtyaGR1bpSPQvVyAdb9Vr/5yGlZNCka+Qrn99bSEdnTS4/hxBAeWyWo2Aw6Eqg
         pv3PEY4unU/IfxjDUAJ8BtdW8S1c6zIotBtWPhlz6pWHBoOQn3kGxYQgWC8cyeCgtYV+
         TIQQwfViTxHfOBs9P5NYCdvLk3UK3jz+I0LPNsL/49RxtGGvl/IhgXWZQC3c8M0MbGyp
         QxgKDJTNk5sSlxihBfOR4+V8g0FFCClnaBuoAx4bDlfElENZ947AcMDIN/60Lgh5lFT7
         IA2Oyt8ZUohqiRpnwNSmwHE7XI2twdAKwIr7IwNtvutU3bJ9HFww8OYDSgzDdBLM5h28
         XA3g==
X-Forwarded-Encrypted: i=1; AJvYcCWUB7Bn+HP6BK6N+aOnDGOfGg3KL0NKolhIXNGy7pTWsXcQepoR0hptBociH5H8qmcyucV+@lists.linux.dev
X-Gm-Message-State: AOJu0YxPx40CZeqLddxtD97lqLowY8hnT0oO7hqn5J2a5uz5a+36zyDw
	SdEYmArwKW7HDvYeNuRsp9x7rW8WRZVqlJdUIb8URi5v09sCioxwtNHQ2oAWhdK4SBH1hXkKmYm
	uP8CKHPxwdGQ82bhEMasJREeHWG0=
X-Gm-Gg: ASbGncu9WiFbYKCfeP1U+L7bI1w7Qh25e2Lq/LXnsucf7dWAgubar/cCIBeH1c4N0YD
	yNT0JsSrWNEEUtyFVYHlNdYVS+pUF8yQ0E/VcjuCueDT/pkWdrFxCwUR9pwPpj1HKyno5dNsrH+
	s=
X-Google-Smtp-Source: AGHT+IEjJMkC/hHaotdqSukhMJQZrOiaCkGtVrbEkJiI15zjYiRvHohJ4FkUwvWx7PY95qrg/tcG6HP5nsDWETkesBs=
X-Received: by 2002:a05:600c:198b:b0:439:60bc:71b3 with SMTP id
 5b1f17b1804b1-43960bc744emr6893225e9.25.1739409704648; Wed, 12 Feb 2025
 17:21:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com> <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
In-Reply-To: <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 13 Feb 2025 02:21:33 +0100
X-Gm-Features: AWEUYZnQToSGphLmBmZFBpfuiZIg1iWlon9vHp3PXB7Fk9evMSAokOcZX5tZFRE
Message-ID: <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 7:07=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> I did some experiments with multiple addresses passed through
> kasan_mem_to_shadow(). And it seems like we can get almost any address ou=
t when
> we consider any random bogus pointers.
>
> I used the KASAN_SHADOW_OFFSET from your example above. Userspace address=
es seem
> to map to the range [KASAN_SHADOW_OFFSET - 0xffff8fffffffffff]. Then goin=
g
> through non-canonical addresses until 0x0007ffffffffffff we reach the end=
 of
> kernel LA and we loop around. Then the addresses seem to go from 0 until =
we
> again start reaching the kernel space and then it maps into the proper sh=
adow
> memory.
>
> It gave me the same results when using the previous version of
> kasan_mem_to_shadow() so I'm wondering whether I'm doing this experiment
> incorrectly or if there aren't any addresses we can rule out here?

By the definition of the shadow mapping, if we apply that mapping to
the whole 64-bit address space, the result will only contain 1/8th
(1/16th for SW/HW_TAGS) of that space.

For example, with the current upstream value of KASAN_SHADOW_OFFSET on
x86 and arm64, the value of the top 3 bits (4 for SW/HW_TAGS) of any
shadow address are always the same: KASAN_SHADOW_OFFSET's value is
such that the shadow address calculation never overflows. Addresses
that have a different value for those top 3 bits are the once we can
rule out.

The KASAN_SHADOW_OFFSET value from my example does rely on the
overflow (arguably, this makes things more confusing [1]). But still,
the possible values of shadow addresses should only cover 1/16th of
the address space.

So whether the address belongs to that 1/8th (1/16th) of the address
space is what we want to check in kasan_non_canonical_hook().

The current upstream version of kasan_non_canonical_hook() actually
does a simplified check by only checking for the lower bound (e.g. for
x86, there's also an upper bound: KASAN_SHADOW_OFFSET +
(0xffffffffffffffff >> 3) =3D=3D 0xfffffbffffffffff), so we could improve
it.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D218043
