Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D811E885A
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786202; cv=none; b=HGlJorZN4hteaH8qHJRig7kF90ZGgzlGKdhi7ex/Csi14aKEUncXSF6TpGxs0ADO4rrYZ+TFrhxqmErsbDyKutHzSvRC59qi0uYy7EtI29Srs4uXV5vv5cAUpRrHYoX7I8KRzhPwJ2TseVnZ+M23Tm+pYTT+TjQFTK+4Xc93RTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786202; c=relaxed/simple;
	bh=Gc+O81ogEJ7jg6lTwk7sikDMYWSEoZ1JuGrT/rBhWLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U8vK21QGmO6/zZP+zV+kyZs/HpmFaLJnsu2TV+6pWxSE7gIwTyjSi8mp8gSNFNH/WtmvJR1J/bxwZH/fQL7PNsBUNiJ2dhSg7tfBVmXWaB5T2Ahc/a6fMrA18uSi9vKNRg9SHMZISz4QU4MXgViv3x5E7i2H+GdW6OioDsXpjoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BC3AjxY6; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BC3AjxY6"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso3723203b3a.1
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 06:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762786199; x=1763390999; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yuV15cVIkOZ3osUBoMrFPeh8PgM7VFfcDiPWWGwwe8E=;
        b=BC3AjxY6gF1Db2J3aTFUzSO3i/EfxS0mjRdzX4eQqDtDNeb09irPdb63ETcCo+lOqy
         6S3l//Jn5W3r3OfbzBnFHbvkkKRbqnOfr51n20RIpv0mRIwkckjZUWXG77/LhuZoXYf6
         GNasgtixgDnFT0ag5X2yZPs6mrQM4/evmrS69niw/15jLEsw3S0YpqDs+f/oU+9dxawJ
         g5gDVtuKbjZMOttN5/KWnkIn8W2TyARifGPw5+mCVJNN0YFAg2R/Ms+LpxBzwa8u0v29
         QHSyW3fViGgEoS75HB4bnF4NsI5z7IGdtf0JfnTWHWUbrW7Cb3BltK62bH1G+M5hUUS6
         iB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786199; x=1763390999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuV15cVIkOZ3osUBoMrFPeh8PgM7VFfcDiPWWGwwe8E=;
        b=uETd4QvOxEbscPSse8p66wMgdAqsS4ns+LSVn54EyOH3YMYEbZCLWV1tDXshl64b1r
         m1eyGT7e4vLpVNiuH5qEZdlRKsD8GXnn3Rs59rDA5Lss0mw9uUKQ4OeO+hs3Nnn8vy/5
         P1eRt0d5Nhyc72w3/nB5aWgLB2OMleAsFxPqlpsqqUqdWm7riCAjZ/REat1YXL1JkXdI
         q0Upbf7tu51exxfhSEdYGdMWt1mrBjgkNtBeF19T12bY0I0uvssWyCwyPAqKrv/YMtkr
         ZLtGQUZelwrx+GX59ddSgWj3qhdxZwxUmr5sW+La/HvNxEn6GvneTz3/H+714Nfg1WPj
         b4hA==
X-Forwarded-Encrypted: i=1; AJvYcCWh2O0F+9stSFeGv3U27eB42KoZRfF9Jkx3aj4RcZLMzjSDR6FpBonS9ySHPGrc0g6KHtDN@lists.linux.dev
X-Gm-Message-State: AOJu0YxF9W6/YrD+0Eee7lxDpW8Th4DnCEmDIaWgt+c06eCJNrSy0Yup
	znTYvAzWwCbOoZY1DhrktzQcCn3nS/ini/CtWHgEdhyofHOXXaC9sv0EGjKFYsKFgHVsG9fWYr2
	F/IWq7C0v05aUxU/CIIeGOauwgWIQzmShak2W8LqJ
X-Gm-Gg: ASbGncvrScgVYVhZeJJVs9VxQY2sEReMNgXB68d07W+NA0QfD3O1KxmsLS+ER76B43I
	Svlh8IfZf7ouTk9OKPtNjTtFBTqWZoUiIG1v4+Xo7xHUk2z8v1lTxnz83hTfmUXX+qniWub+HxQ
	E06AvVbeiaRwPJP3bm8w9P3aDpV/Xtd0ZYnPYG5Xzc8YYkdU50q4rRNgRLMOPeIMPhw/G5oQ8q3
	gx3d4SZJcqs2c8vJj+I2P4liVY1Di9DSlioXNkYouqSGp2RmQ5wi7YnGFZaNotq4CLNMuNyfLTz
	JW8VlYOdaUvnuG+ifGj8PnQdMEw=
X-Google-Smtp-Source: AGHT+IFJrWpsYMgqYHxsl7TDahL4sWC/rojvNE8jvjvqAW1DXIbEkhegStBh6RAJqXTedR75u3LJC4XuuR5ASPiDRjI=
X-Received: by 2002:a17:903:2f88:b0:295:24c3:8b49 with SMTP id
 d9443c01a7336-297e56cf5bemr117461485ad.46.1762786198920; Mon, 10 Nov 2025
 06:49:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <81848c9df2dc22e9d9104c8276879e6e849a5087.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <81848c9df2dc22e9d9104c8276879e6e849a5087.1761763681.git.m.wieczorretman@pm.me>
From: Marco Elver <elver@google.com>
Date: Mon, 10 Nov 2025 15:49:22 +0100
X-Gm-Features: AWmQ_bltIHaW2m2Y_rXOjdB0rjwB0avPjx0FCrIDnvZhp3yD5E0mxdw5HHzg9_w
Message-ID: <CANpmjNM+ot5A-pRLhV6Esn=QvCeCStd9fG_pgwrVA=6pxD8aqw@mail.gmail.com>
Subject: Re: [PATCH v6 17/18] x86/kasan: Logical bit shift for kasan_mem_to_shadow
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, pankaj.gupta@amd.com, glider@google.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Oct 2025 at 21:11, Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> While generally tag-based KASAN adopts an arithemitc bit shift to
> convert a memory address to a shadow memory address, it doesn't work for
> all cases on x86. Testing different shadow memory offsets proved that
> either 4 or 5 level paging didn't work correctly or inline mode ran into
> issues. Thus the best working scheme is the logical bit shift and
> non-canonical shadow offset that x86 uses for generic KASAN, of course
> adjusted for the increased granularity from 8 to 16 bytes.
>
> Add an arch specific implementation of kasan_mem_to_shadow() that uses
> the logical bit shift.
>
> The non-canonical hook tries to calculate whether an address came from
> kasan_mem_to_shadow(). First it checks whether this address fits into
> the legal set of values possible to output from the mem to shadow
> function.
>
> Tie both generic and tag-based x86 KASAN modes to the address range
> check associated with generic KASAN.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Add this patch to the series.
>
>  arch/x86/include/asm/kasan.h | 7 +++++++
>  mm/kasan/report.c            | 5 +++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index 375651d9b114..2372397bc3e5 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -49,6 +49,13 @@
>  #include <linux/bits.h>
>
>  #ifdef CONFIG_KASAN_SW_TAGS
> +static inline void *__kasan_mem_to_shadow(const void *addr)
> +{
> +       return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
> +               + KASAN_SHADOW_OFFSET;
> +}

You're effectively undoing "kasan: sw_tags: Use arithmetic shift for
shadow computation" for x86 - why?
This function needs a comment explaining this.

Also, the commit message just says "it doesn't work for all cases" - why?
