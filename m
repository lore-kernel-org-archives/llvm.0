Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADC143E063
	for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 06:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453229; cv=none; b=SLK84Qa/1VX6+me7LyfO3LnT9V96frAim+iLBtSHZE0KLK3v6sEYSmMBXH7YTFzeHaCBYsYsacgo/RoRgEPU+qPErBabwvQ9Ay4U0Op+S/V1ErVA5TUsrqgYWHHiLPtBzy1VVR5cvs6Z6qMWsl+II8/VuKtyEXc96I0HcXUyxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453229; c=relaxed/simple;
	bh=wH+dFeWC6vXKEEbfhidfrbJMkAyAxzT8WWn3pPANH18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t14IsTx1ng8bzx3yPZVQOC9nQmPVwylbQzTWKfe8QtDxzjbzxUxfAGD/yEu+r6VpHPeGZWpqOcvjw88ljxYIijq2DvlTeluFnu77EPhQbCXJP9g2lBmrTeE6LSZ3zvwrpz2/pmpvQylHtiZe/w2AA3pdrw3PTOfqfsFTRTQsZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+j/YTri; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+j/YTri"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a5aad413so4051884a91.3
        for <llvm@lists.linux.dev>; Mon, 14 Sep 2026 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453228; x=1790058028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lvj/QENaps3fa980Av3u1jYrzQua2MT1zXpRDbfcu0U=;
        b=q+j/YTrifm6RjHw5/BVp5GAVuJtXuEwFCoZTos3gZJLJQ1clOW59fuzJgP6WQ0Yo8t
         6jdVopg9Gcapz5/+Voy3WTjeycZdbkOu7xLRVl86rC7oEB3dq9Z4fi5NTxSRPsP6MbKH
         cJwt1Y0ObeBHMsUSQyyvAMuPIWTcw80Xviy+xw5aiFGIq6pkbq2OUXHj3PctTpHnM4Jd
         8gid4JF3I7oVzQPCmI63GYLh63OKC3xrQyqw2PI+CfZZmFG16NbEiU/x1NvCB5HzK/Px
         QWrBBagWGWGtq3xCmo2l4b9XmQGXCfQj7Awqcm1LrEMtkjzt7d5jfg3iA1SVcz1W3R56
         +kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453228; x=1790058028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvj/QENaps3fa980Av3u1jYrzQua2MT1zXpRDbfcu0U=;
        b=r6JBuS/rBS/6v4OwvdPk7etLJq54ZeIqKNEQj49CdOKx7/iyB/gejaIn0D1wvowxKc
         T5+X4KtjV+dXk/pZ0MOA3BfAFoM+BxrxfFiB/NWsqCv3G3nT/7CDmvtRRRx2nlymHKQI
         b3Uy8HXVUnd/P4uC3eNO8wyyKeIo5XdjPx2y7GEgj1kHnUw8InSXGLpfjD9cqCYAFOUc
         TIxHt2QwQVS0o6PtZbvM5VcRH5Hqc0fZmHNZQ8GpQxDIxvrT4s5yvJ4h88gMGZ2p74JS
         4w2mg8Toh+slpOzWk5FDlfMqAHR6vjTR0UW1N75mSzP2V5fNeACXJpDACZ3LZ9I2N/iO
         AW3w==
X-Forwarded-Encrypted: i=1; AKwUvBz+uCDE4Bn1HstnYp2+W2HIMtdK2cqcO4ogTIKbHkM3K6ufqPEVR8D+cW2UluqQPLC128OW@lists.linux.dev
X-Gm-Message-State: AFuF++lZ6v40DNOugEYUjau5z2rxm98zCUWSAJR5yQPzCpXDdjAoYR0d
	JbhTs/Fkbc1SDhf7LK3w3SY15u8PHUlJVQWQKshNjbYB9UbRUOzCEfh2
X-Gm-Gg: AYBFou370IVLoI7nKYvONH/B9nIn3pF3rblyb63lqKBDWl9Cer0D5XbCqKlI4PyVz1X
	yAxBeP6qHW00iT1/51ll6pgNvUQm0Psc7yK3JKJxZvnQn/fIh3ygyZcYooUr/DNGHPhalEbMjJo
	sCefJTDTJhWOMVZy++iR6i45dVuE8bUBhOkyNkZYTPk6U7wwmZgqbCYgfpv1AtFB58Fhqukh5jR
	aNxDS9yqcVztFYj9a2iQH0srk1FUIbTzDfWpXpLfMB1ryC/APttX9pIYBjOt+w54USIyk2NzrS8
	eeQon57/kZWHGVY+jAZdz44GgkCO3S1mZMVA0Fng/CxPwGkUm3uigW3FpuWUUCDJwqOG4mdQAEh
	KZJ02BAEOIeR1erDiuB0+FA9E6A3reaqa31sfhZtdeXxZD4TdMk4V2VNadm4XAmJ/QXrUqID1Bm
	eTwSfQOsTY4ra9z/JFiq0fFLL/4WT3TNt0QHJftmWkcySZeKgq/Kz4KOIFs9371nUyUCYankGu9
	jIrWKbX88CpIVh06H441spkgjQKtnTVfZyNgSFtEXw=
X-Received: by 2002:a17:90b:17d0:b0:39d:c3bb:98e7 with SMTP id 98e67ed59e1d1-39debfa60f6mr11787559a91.6.1789453227707;
        Mon, 14 Sep 2026 23:20:27 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm3169047a91.10.2026.09.14.23.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:20:26 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:50:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, ecourtney@nvidia.com, 
	joelagnelf@nvidia.com, fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH v4 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqji0ILj4gkDnkry@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
 <20260912065902.24017-2-mkchauras@gmail.com>
 <DLDJ7TNEH9MS.2I386V2SZ5QDR@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLDJ7TNEH9MS.2I386V2SZ5QDR@garyguo.net>

[...]
> From the current implementation it looks like making "1b" a parameter doesn't
> really help anything. The fact that it internally rely on `2:` as label is still
> hardcoded.
> 
> I think you should either make the label custom too, so you write
> 
>     "1:	twi 31, 0, 0\n"	\
>     _EMIT_BUG_ENTRY(2, 1b, file, line, flags) \
>     ".org 2b+" size "\n" \
> 
> Or you should just hardcode "2" and "1b" and document them.
> 
> This stucks in mid-way and is arguably worse than either option.
> 
> Best,
> Gary
> 
Hey Gary,

Yeah makes sense. Lemme refactor this with labels as an argument and
test it out. Thanks.

Regards,
Mukesh
[...]
