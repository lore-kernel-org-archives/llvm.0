Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350E1A4E98
	for <llvm@lists.linux.dev>; Tue, 25 Feb 2025 21:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519501; cv=none; b=ukvU276c3qCTFGkZWZTv5mSj8rSqstOAelpOMdyKjzOEQ5tgf1Xr3AmttjktfqbMYvnIKitB/kj8A77Uw7Q5FH7PYuv/x/Tfry9HLjJI3FSD/EIdFE4rnKgqyvcJk7H8cB4ypRhyIfLmKgGP8UG0EyWc9CvMptbD30+wdXGjsMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519501; c=relaxed/simple;
	bh=fXFKcm0lZuF5OG0aApeKuQOf3+mW6bFB0yCFPCGgwEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbIZBxiqU6j+Iw0YYPlQQt6MaIYLLk46RYIpG3GzSTkbCaJB8prd66d2KS/PY9EcIa0pj/l+bDqxFE3aatDWQbM8xGcRVup4TaOH03Yb87tXQwMSzUTvRb1wKOZQvILg0zW4mMa1mXS3G/T0pdsAzcxdaEWenoQcIib4V1Qd3VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/ODOTiT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/ODOTiT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439946a49e1so39176685e9.0
        for <llvm@lists.linux.dev>; Tue, 25 Feb 2025 13:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740519498; x=1741124298; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXFKcm0lZuF5OG0aApeKuQOf3+mW6bFB0yCFPCGgwEk=;
        b=a/ODOTiT+gIsI4vDK9XYfsawCNWdtK6oJjozh2StTONWu1u5jyFodTVcviWowtHk70
         9lC7jo5A/2eRRwQ3nTNJbRNYnQQTMMRcwWbKcDb71JV192f0VSlW044E/yT1PgI13zdv
         r8BsSB/Mo5ffMWT67ysZJAYghIXF+6di1tjDhEwIJtkHFLed+OFVOsOX++apYw8m2kJ6
         EWEdsiP5dpytUzzzz/dYiUcgK7vviFemM4XVpORp8pRziG706QvR7ClIrQx23w5vwvX6
         MpNF0KnEJ54jKy+EMB+B2THVuYiphsW8378E9wszVmmBa/8LVo1rsKjsfm/f/8nb2/k3
         P4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740519498; x=1741124298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXFKcm0lZuF5OG0aApeKuQOf3+mW6bFB0yCFPCGgwEk=;
        b=qO7g7GGCaBDh88TCUXb5UIp/GOo7+QBht27kuoKnSG2Q3DSURndqPoiogEfYI1xWdU
         8yiEUCs6iRnQj6SBc9PuPeE7gpg25+W1jFt9oLe9f7zXOChkYHIVmXiiIQ0OIhuIEmYt
         qfVgTh1DyYMFi1jh1/KopKq+s0keakehR1zZOLaFeQMvg0itOdhBycm5QN420k23ElEV
         4XHNSPASfgjkgvc2C+AENnxDvCfWpXh0oJIUz+ezd2vD8xnn89K2NvWIsu+EC7QKT/px
         gm6oI2qVeL2fKT6NLDW+xCj/1l9X84L6OPoZntUr2v+/UhrheK3y5HOtiHkKwUFLUFel
         npnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaRW4LuU68/je4/cu3zbqpwS1vUOXrP1rM6mSAMciUhciMfFNqU//ctuXa8++cA2cIlqiu@lists.linux.dev
X-Gm-Message-State: AOJu0Yxypi7jlOTebIib4MHpdZHyrNcYpvavE1jpR9zHiuUgYzm6S47b
	HcejN5W0/zlibsDimhNGZf4YZqPC0NPWhgxYigTiWeSvbU+0zJJR9IhTRDZQylMm33dkhVDvfKX
	WpHQFXtpDBiPx5//+WB5vGZSk4zI=
X-Gm-Gg: ASbGnctNA6CwwAzVZOg02bpzGHqcfbQzFIuOAhNo+ykztHKFw+vicFl+xQ14b5NvfTR
	wLOlEqHKwUhvyPlGCrckMMDCIGorFZ21jSy/2ZyVVvX0nA2PqpezFUszdhC4jU4ihwqNO+GmPHx
	pKvyeJk8DJ
X-Google-Smtp-Source: AGHT+IGh8E+lTwkx8iX124FdlLJw2Xy9DPydEazX+qcbmRtx4fMlCbmv7VFo9hwZNeA+xmoTq7Gl/a44OapVymXi8YM=
X-Received: by 2002:adf:f003:0:b0:388:da10:ff13 with SMTP id
 ffacd0b85a97d-390d4f3c491mr589082f8f.21.1740519497503; Tue, 25 Feb 2025
 13:38:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <168f775c4587f3a1338271390204a9fe16b150dd.1739866028.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcVSwUAC9_xtVAHvO6+RWDzt6wOzWN623m=dT-3G=NnTQ@mail.gmail.com>
 <cik7z3nwspdabtw5n2sfoyrq5nqfhuqcsnm42iet5azibsf4rs@jx3qkqwhf6z2>
 <CA+fCnZd6O0_fc1U-D_i2shcF4Td-6389F3Q=fDkdYYXQupX1NA@mail.gmail.com>
 <uup72ceniis544hgfaojy5omctzf7gs4qlydyv2szkr5hqia32@t6fgaxcaw2oi>
 <gisttijkccu6pynsdhvv3lpyxx7bxpvqbni43ybsa5axujr7qj@7feqy5fy2kgt> <6wdzi5lszeaycdfjjowrbsnniks35zhatavknktskslwop5fne@uv5wzotu4ri4>
In-Reply-To: <6wdzi5lszeaycdfjjowrbsnniks35zhatavknktskslwop5fne@uv5wzotu4ri4>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 25 Feb 2025 22:38:06 +0100
X-Gm-Features: AWEUYZlodhwAbgPi0Dk16h7YK7x4HrrqY-JVxMx5ByQmdcv8cbnJsNVhi4etBIM
Message-ID: <CA+fCnZeEm+-RzqEXp1FqYJ5Gsm+mUZh5k3nq=92ZuTiqwsaWvA@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Vitaly Buka <vitalybuka@google.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, 
	will@kernel.org, ardb@kernel.org, jason.andryuk@amd.com, 
	dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, mark.rutland@arm.com, 
	broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, rppt@kernel.org, 
	kaleshsingh@google.com, richard.weiyang@gmail.com, luto@kernel.org, 
	glider@google.com, pankaj.gupta@amd.com, pawan.kumar.gupta@linux.intel.com, 
	kuan-ying.lee@canonical.com, tony.luck@intel.com, tj@kernel.org, 
	jgross@suse.com, dvyukov@google.com, baohua@kernel.org, 
	samuel.holland@sifive.com, dennis@kernel.org, akpm@linux-foundation.org, 
	thomas.weissschuh@linutronix.de, surenb@google.com, kbingham@kernel.org, 
	ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, xin@zytor.com, 
	rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, cl@linux.com, 
	jhubbard@nvidia.com, hpa@zytor.com, scott@os.amperecomputing.com, 
	david@redhat.com, jan.kiszka@siemens.com, vincenzo.frascino@arm.com, 
	corbet@lwn.net, maz@kernel.org, mingo@redhat.com, arnd@arndb.de, 
	ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 9:13=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >>Thanks for letting me know about the tag resets, that should make chang=
ing the
> >>check in kasan_non_canonical_hook() easier.
> >
> >Ah, but the [0xff00000000000000, 0xffffffffffffffff] won't be true for x=
86
> >right? Here the tag reset function only resets bits 60:57. So I presume
> >[0x3e00000000000000, 0xffffffffffffffff] would be the range?
>
> Sorry, brain freeze, I meant [0x1e00000000000000, 0xffffffffffffffff]

+Vitaly, who implemented [1]

Ah, so when the compiler calculates the shadow memory address on x86,
it does | 0x7E (=3D=3D 0x3F << 1) [2] for when CompileKernel =3D=3D true,
because LAM uses bits [62:57], I see.

What value can bit 63 and take for _valid kernel_ pointers (on which
KASAN is intended to operate)? If it is always 1, we could arguably
change the compiler to do | 0xFE for CompileKernel. Which would leave
us with only one region to check: [0xfe00000000000000,
0xffffffffffffffff]. But I don't know whether changing the compiler
makes sense: it technically does as instructed by the LAM spec.
(Vitaly, any thoughts? For context: we are discussing how to check
whether a pointer can be a result of a memory-to-shadow mapping
applied to a potentially invalid pointer in kernel HWASAN.)

With the way the compiler works right now, for the perfectly precise
check, I think we need to check 2 ranges: [0xfe00000000000000,
0xffffffffffffffff] for when bit 63 is set (of a potentially-invalid
pointer to which memory-to-shadow mapping is to be applied) and
[0x7e00000000000000, 0x7fffffffffffffff] for when bit 63 is reset. Bit
56 ranges through [0, 1] in both cases.

However, in these patches, you use only bits [60:57]. The compiler is
not aware of this, so it still sets bits [62:57], and we end up with
the same two ranges. But in the KASAN code, you only set bits [60:57],
and thus we can end up with 8 potential ranges (2 possible values for
each of the top 3 bits), which gets complicated. So checking only one
range that covers all of them seems to be reasonable for simplicity
even though not entirely precise. And yes, [0x1e00000000000000,
0xffffffffffffffff] looks like the what we need.

[1] https://github.com/llvm/llvm-project/commit/cb6099ba43b9262a317083858a2=
9fd31af7efa5c
[2] https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tran=
sforms/Instrumentation/HWAddressSanitizer.cpp#L1259
