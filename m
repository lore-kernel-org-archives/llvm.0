Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692451;
	b=vXzezzY3Q2pTiyuRcQipC0UKnoaB5fLzdrPaeJ1nvrYa7OvKSbmFYGYwZPrFgU1CloBU
	 vYpyTzxKgL48VQRF7lhYy4EzCXaIuCQNGZ5ELnSAuaWfI9tfcjeDSWOnRQK6NJjFpAKBg
	 NWvBfeQECJATnBsbSGSkX+HX7rMcfz/Ew4nJxwchUFkvgCpo/cVtnsxpU9fCPkTCshvFa
	 6d2sGG8qJvYpyDOwRBtJrGc0EaIB/EHqgzTmujXJ+qaqTB8xcfoqmhRXETdCTPUOe0RCc
	 rkB2aO99v/AQXT0sRIRmG7V8YieWtqEGRDtccTONZo6ybZDph5/Jd86MOhGqctMc6FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0BkCbk1BZezpNWO2fSE0tmudVFsNXM8eMjdZoP6Bz5s=;
	b=PxuNy+h8cG37RYYRK3qxfQDfVtfYXgE64HL+VmGT3WEkqRlK8H6p/V27gMEqhAp6n9HH
	 kPCSIcB/zacYfXZdgFrgVJZ14S0xf9xYyj8zx8T4IObmd/3n1Vss8IFu4BfU4GifQqvpp
	 rLN8V9fKyiENyquGlhipzPaxR35qhDXQawoPGA57I9J9risqGcxv0q9poNznW2bqb4DT1
	 mV0/Im5vUclYIvgfCyE35l8orch2yQWgHt0lvkZNs/wSHADH8aAXzdjMBxrGYIyQtL6Dk
	 nZZ81KtZb8VW6ydme/K+9M0Y3BhMWKDQ37rIj5nWFZ+f6xSKU6FOXdU8gnRibZ+3R/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDwAYdAP;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B11A606A323
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 11:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B11A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDwAYdAP
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso53896465e9.0
        for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 03:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795692449; x=1796297249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BkCbk1BZezpNWO2fSE0tmudVFsNXM8eMjdZoP6Bz5s=;
        b=kDwAYdAP1BDcOHCjqbLWON/fYhMPjUI096+eHgHOqR5mYg8L2P6NR83aAzBj1LZti0
         t81Q5G5eDJwjASG+/kkEUZvJ7jIyjJ/KLL7IXw2rt46p5PD1aQ0lH6ob8gusHMnGBlGN
         aIsYwLcUov6vElmm7ihJmTnYEVc1Dm++RZ44Jjjta4yD1EQHLzAfnegMqZUfA662FM7t
         wOMPcQ1VR7FAdkvOt7UqIJgNwnJpel2MkHFDDf41KW8QaCLb8aaFYK6eqNtmbe+mdEYe
         QQHAGcw9lvTMDf2rG0sP3ANPIUGnOXiBkO1UzKpPxdWQ2wEPMf+5tBRODCu+q1blCSQa
         +eGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692449; x=1796297249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BkCbk1BZezpNWO2fSE0tmudVFsNXM8eMjdZoP6Bz5s=;
        b=xTxAtFaxxQs5eX1CKuRWsCzfdnm6944mB/4+fZElFOdnMZEcizjdToEDlsjdyRwPW7
         gOJm1wpn8xdk71bwdiWM7GTXHEaNihwRshGmTRMF0JZGaXXbHH0a/XYpmv342D9Ngl4Q
         /YO0n97t5RlNz1ESNagq8Ki5QQPD4+qBPj8B1IolcmaL0N0sWRIi2zmO1KQpvBoswJTE
         9tdIj6a5tYL8hbKvr7K0D2gLQxuTqHFvgg0PJpRrgaXpyeZa3RmryEVOTfjDgEJrIkAh
         vcXZqOdQ/OHPLo2H8gZ3SWyOVWoAgd/Y0xDnCXOGFeH0GsEowCTbol1PRscy0PSDAAbV
         H5uQ==
X-Forwarded-Encrypted: i=1; AL+hErG0AWrfOjzkT9Ovm3vOPYLZVtvmBiFGtQo9XleS4kezCOXxFbZIvWAoradoMbz3BA6jqKRA@lists.linux.dev
X-Gm-Message-State: APuU4Z8hZzKMJ4l/XbB8z0H71x9pz5Uxd/btuXLY1Dx5syxiuOy67SX0
	H30K52xirSPfYBkvFHAw49Mi/ytadnejqw9D+D46enxoUL+cYzu71+g0
X-Gm-Gg: AZFdTZfO3n8Ai3UvcJr/MxdVDcBMHQnkcr3h7Lvt4QwuzlUZsWT8LfpsunISt/WU8N6
	jHmrHLAJdQFxq/vQ3tlJrgU70TlBkjZ8YejFF0MjJ0SHLEzitHDhxJ/wP2gWUNhdMd2zOt0rCXp
	sQr6+pqiunatIeZnzDGMVA8V3Yq65Ppi1sDIJejqfwjMxrilrvFXQsvhIRm7QAB31XeUgLSS73H
	CmobdcGRWNSMCcL0RHMoKwfzBgHecwwmRfoLWRyPitPWOvvUk50CbeVtRRO7xaLjDPzXx3AyEeT
	LgHY4pF4ussYN3M+utYXPAiKxX2FmPr2HGKbXBaGM/d+oMqaW9tVWz8uQnaA3i/NbLuaX4AMhSi
	M275ATBEb/W7AsbaCeeUozBv0H64lY3TxUkVTfQm+qrFWYER90bs6sKABx9r6rj6rdgNLiypoBz
	60d3g+K4h65iq/uRBtCCh1XcwlLp6FXvvHYJJbWjNxBB6fJX/5W9jUJk72y/OMT+dJA+Kl75RE5
	BVkUTwwCjkhiLRsZ71qI1v5XughuNAOScqfAVwCjhiJrQhAV0CwWBgCdeYqn6RyreOcwUzwagsc
	eFY8Gd5+9elYs3gUxqZWASdI8h4maNQZ7pAnuDDIvkkOxRJw6nrbFsuSAxiOhSfxiKY=
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr516443125e9.5.1795692448756;
        Thu, 26 Nov 2026 03:27:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm816437995e9.13.2026.11.26.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:27:28 -0800 (PST)
Date: Thu, 26 Nov 2026 11:27:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Jeevitha Palanisamy
 <jeevitha@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Andreas Larsson
 <andreas@gaisler.com>, Usama Arif <usama.arif@linux.dev>, Kevin Brodsky
 <kevin.brodsky@arm.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] powerpc: Add support for 128-bit cmpxchg
Message-ID: <20261126112714.021a3e66@pumpkin>
In-Reply-To: <20261125174035.1412724-2-nysal@linux.ibm.com>
References: <20261125174035.1412724-1-nysal@linux.ibm.com>
	<20261125174035.1412724-2-nysal@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 23:10:22 +0530
"Nysal Jan K.A." <nysal@linux.ibm.com> wrote:

> Implement arch_cmpxchg128() and arch_cmpxchg128_local() for 64-bit
> little-endian PowerPC (POWER8 and later) using the lqarx and stqcx.
> instructions.
> 
> This enables HAVE_CMPXCHG_DOUBLE, which allows SLUB to use the lockless
> __update_freelist_fast() path and provides kmalloc_nolock() required by
> BPF task-local storage and arena allocations.
> Select HAVE_ALIGNED_STRUCT_PAGE to ensure 16-byte alignment for struct
> page as required by quadword load/store instructions.
> 
> The lqarx and stqcx. instructions require a consecutive even/odd
> register pair, with the most significant 64 bits in the even register
> and the least significant 64 bits in the odd register. Leverage GCC's
> PTI mode variable attribute to allow the compiler to allocate suitable
> register pairs. On little-endian, the halves are swapped to match the
> memory layout.
> 
> Link: https://github.com/linuxppc/issues/issues/463
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106895
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
...
> index dbb50c06f0bf..b3164c3c0b81 100644
> --- a/arch/powerpc/include/asm/cmpxchg.h
> +++ b/arch/powerpc/include/asm/cmpxchg.h
> @@ -6,6 +6,7 @@
>  #include <linux/compiler.h>
>  #include <asm/synch.h>
>  #include <linux/bug.h>
> +#include <linux/types.h>
>  
>  #ifdef __BIG_ENDIAN
>  #define BITOFF_CAL(size, off)	((sizeof(u32) - size - off) * BITS_PER_BYTE)
> @@ -617,6 +618,65 @@ __cmpxchg_u64_acquire(u64 *p, unsigned long old, unsigned long new)
>  }
>  #endif
>  
> +#ifdef CONFIG_HAVE_CMPXCHG_DOUBLE
> +union __u128_halves {
> +	u128 full __mode(PTI);
> +	struct {
> +		u64 low, high;

There seems to be a mismatch between the register order that PTI
assigns and the one that C uses.
It might be less confusing to swap low and high in the above
and only use 'full' (probably renamed) in the asm statement.

> +	};
> +};
> +
> +#define __CMPXCHG128(name, entry_mb, exit_mb)			\
> +static __always_inline u128					\
> +__cmpxchg_u128##name(volatile u128 *p, u128 old, u128 new)	\
> +{								\
> +	union __u128_halves tmp, r, o = { .full = (old) };	\

You don't need 'o' in a register pair, it might be better
to just have two u64 for the two halves.

> +								\
> +	__asm__ __volatile__ (					\
> +	entry_mb						\
> +"1:     lqarx   %[r],0,%[ptr]\n"				\
> +"       xor     %L[t],%L[r],%[ol]\n"				\
> +"       xor     %[t],%[r],%[oh]\n"				\
> +"       or.     %[t],%[t],%L[t]\n"				\
> +"       bne-    2f\n"						\
> +"       mr      %L[t],%[n]\n"					\
> +"       mr      %[t],%L[n]\n"					\
> +"       stqcx.  %[t],0,%[ptr]\n"				\
> +"       bne-    1b\n"						\
> +	exit_mb							\
> +"2:     mr      %[t],%[r]\n"					\
> +"       mr      %[r],%L[r]\n"					\
> +"       mr      %L[r],%[t]\n"					\

If you leave this exchange to the C code it will likely get
optimised away.

The same is true for the fallback code in the next patch
where you can use asm("r14") and asm("r15) for the two halves
of 'r' and then combine them with arithmetic for the return.

This would all be more readable with slightly longer variable names.

I'm sure the above and the fallback code could be made similar
enough to avoid the duplication.

David

> +	: [r] "=&r" (r.full),					\
> +	  [t] "=&r" (tmp.full), "+m" (*p)			\
> +	: [ptr] "r" (p),					\
> +	  [ol] "r" (o.low), [oh] "r" (o.high),			\
> +	  [n] "r" (new)						\
> +	: "cc", "memory");					\
> +								\
> +	return r.full;						\
> +}
...
