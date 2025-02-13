Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF7D137C2A
	for <llvm@lists.linux.dev>; Thu, 13 Feb 2025 01:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739410103; cv=none; b=KQEZJTerlT8jcsyClWrlG5sDmZ1P2YGcWU4vZxB8VWvWZMcAI0cyAOV7t2tNgDgx2RL5/7AsY8Hne1Oi9jNyymTiJ26nhtc1BArHHqPaUWpGkwm99b8RsE0tjdJNQUUTU/we4VEu45fVVhRd1LTCgOEdsLezRSIn0wIEtGledac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739410103; c=relaxed/simple;
	bh=FnnVExe7d6QVUJNp8Nm3NF0K0bg0bBBcU3T/4AzgGYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRujwRSVtBRV4tswZiCnrUE+Zlh5t5gX/U35/lNG0fPBfJ0J3mNkhezKHUek084OLN/64blE8FY6efFnuUfBKZF/J6TKE3BV3ivgFFvFDbEQdk07QXwgwXsGs8EzerPHYMCuiAMjeOD4/XFiu4x4x1jdCfOcrBB50TSs+zn95dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kT1w2zww; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kT1w2zww"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso13149f8f.2
        for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 17:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739410100; x=1740014900; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnnVExe7d6QVUJNp8Nm3NF0K0bg0bBBcU3T/4AzgGYI=;
        b=kT1w2zwwGZCIjyS6lzx2gX+8UUrN1lPBr02K2KKvdVOirOoG3ibE/Y4Xoc3KBFsnrS
         Q8M9hWD4jyncZmJjxzFv0t8qTVLuiIIQKSG+YqsKCsyV8sIkb0Zl0XPyY8h/kDbhN4hE
         n1RI8KMqXG+2KRUQn0FtAygXe9qwSC7vBUWq8RQxghJt6X0Jvb6C2yOrUpzeWRCoKKNG
         d/LkjDgRm+u9l+cOMKTwHckmnjMp2LflhEXHswLDcxHEQSdREsTFsvUpoj9jaJ0jejS6
         7bh7VypSTMUcykFvSYbuWhnyGPvtB62vxdp/vPGKINxMqxcU+0ml4rrJcG/goNB68LoU
         Nd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739410100; x=1740014900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnnVExe7d6QVUJNp8Nm3NF0K0bg0bBBcU3T/4AzgGYI=;
        b=rGkIOY7z6i4hQvOKRpnc78xlzrlihVy0bPiYh4J5TRkvPJPit+stzmT6pQw1JI43e5
         Qeg+pQU0zW7dd49KqADpTIRl6OmeINP+NwglUJ+bVXvv4ClEl9TN0TQlS6yFXe+OYgBA
         gFhBCrqOhg9HIV3+mGR3rldzAYJfKldVDwsdqYCvUDTzXqr6Uv9v21rO1HZ7fsEpNat6
         6zSUlCFiJIPEwFs/mRvgqUibMX6heiNIrfN20z3MZanBKdJCE9qQVJwXLXKd9ja1b5V7
         kgtHzJZ9kD3RXHoezqLgfjACiiFuwYiL1aiP2K0/F/snocG7+A8Xec7suEzdxzHIX0/G
         HaDg==
X-Forwarded-Encrypted: i=1; AJvYcCUAnclhNRDNl8LGsv3Iv/B6mL+7CnNxK3CXa8gNUXDwlHvjlQBVEo1bqgRSJtxDcvbWn0/s@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb5fhczeoX1U7NXl4oWiA0V7advhL+Ay7lx5Dsx/n41AEpuHbg
	35Mfigez6cvjF+6EqzUwBRqPpXi8+zn45dtVhn1pwsGlsmAWU8I13qd23hOKj9/1athmsFIcAiS
	mTrUT4rCZoEHux6zQ2m2AuBDqmyg=
X-Gm-Gg: ASbGncvAwttAeK/Oj23SKZ5TkEFJqHekemEXpHcrkfMALpwnfBWHQbfcgAbNlCbeJtL
	sIPh9Fqj2GnI2+VRPCQWiwaZvtjQ9AOs/6TWSbjH69uRO9esdA3v9wP3mrAvHmOi7OapcwZLeJT
	A=
X-Google-Smtp-Source: AGHT+IEhltifMX701fYkEDmSU69qM9C3gXECNDsqw8PpPT3Yw5x0mc+ricaPHhG6ElqQmHswedH/T+PZOKbLltISlh4=
X-Received: by 2002:a05:6000:144f:b0:38f:227e:6ff2 with SMTP id
 ffacd0b85a97d-38f244df054mr1302880f8f.14.1739410099435; Wed, 12 Feb 2025
 17:28:19 -0800 (PST)
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
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6> <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
In-Reply-To: <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 13 Feb 2025 02:28:08 +0100
X-Gm-Features: AWEUYZn2XkAKpo5fHBIg4DaefcDCWc7cwclFMrZ0d3cOTpLW86BXbO6cjB81ilc
Message-ID: <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
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

On Thu, Feb 13, 2025 at 2:21=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Tue, Feb 11, 2025 at 7:07=E2=80=AFPM Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com> wrote:
> >
> > I did some experiments with multiple addresses passed through
> > kasan_mem_to_shadow(). And it seems like we can get almost any address =
out when
> > we consider any random bogus pointers.
> >
> > I used the KASAN_SHADOW_OFFSET from your example above. Userspace addre=
sses seem
> > to map to the range [KASAN_SHADOW_OFFSET - 0xffff8fffffffffff]. Then go=
ing
> > through non-canonical addresses until 0x0007ffffffffffff we reach the e=
nd of
> > kernel LA and we loop around. Then the addresses seem to go from 0 unti=
l we
> > again start reaching the kernel space and then it maps into the proper =
shadow
> > memory.
> >
> > It gave me the same results when using the previous version of
> > kasan_mem_to_shadow() so I'm wondering whether I'm doing this experimen=
t
> > incorrectly or if there aren't any addresses we can rule out here?
>
> By the definition of the shadow mapping, if we apply that mapping to
> the whole 64-bit address space, the result will only contain 1/8th
> (1/16th for SW/HW_TAGS) of that space.
>
> For example, with the current upstream value of KASAN_SHADOW_OFFSET on
> x86 and arm64, the value of the top 3 bits (4 for SW/HW_TAGS) of any
> shadow address are always the same: KASAN_SHADOW_OFFSET's value is
> such that the shadow address calculation never overflows. Addresses
> that have a different value for those top 3 bits are the once we can
> rule out.

Eh, scratch that, the 3rd bit from the top changes, as
KASAN_SHADOW_OFFSET is not a that-well-aligned value, the overall size
of the mapping holds.

> The KASAN_SHADOW_OFFSET value from my example does rely on the
> overflow (arguably, this makes things more confusing [1]). But still,
> the possible values of shadow addresses should only cover 1/16th of
> the address space.
>
> So whether the address belongs to that 1/8th (1/16th) of the address
> space is what we want to check in kasan_non_canonical_hook().
>
> The current upstream version of kasan_non_canonical_hook() actually
> does a simplified check by only checking for the lower bound (e.g. for
> x86, there's also an upper bound: KASAN_SHADOW_OFFSET +
> (0xffffffffffffffff >> 3) =3D=3D 0xfffffbffffffffff), so we could improve
> it.
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D218043
