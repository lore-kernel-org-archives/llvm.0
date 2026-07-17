Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8623F9F28
	for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292343; cv=none; b=T4CXDen5ThDvb4xnTsJcUhL1AcnBizKWZihIrnpgoQQyBnjAPOJr7q61zVWvbEJgs9+v5fRDuMxtenaYe9yEO2N7usNNTZZNtVvrmdZepfcDNhR9D3Ulz73g8YK3oRKbkvuz7vzrJw5UFGSh4Zff/Ups+l4rrs424Wg9Gg0XPc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292343; c=relaxed/simple;
	bh=RieLsRVJ1mDAmUp0yKGXNWj7JDhW1POVMFYiCRfMPo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXpHQggzSNFG+Jw1h3ykfmmr/l0D+A37bejVo8TtOPLeQYqOu8QzGtvlS02dyUVW2QZn18Z7GpBxSckH14FZ1crVgSuec/S57DQSC1XlMly8x5RdcF9WxVfuKg6WH1ixETgao7hsX2IXByQghjwZsNQtl2t1lW3AnZ20VvMFVaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/rN4uVB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/rN4uVB"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47db714766aso776765f8f.0
        for <llvm@lists.linux.dev>; Fri, 17 Jul 2026 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784292339; x=1784897139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pidhZMI94NTBLbc5TNcQD1D0S0S0XdPelFHQKt6o2CM=;
        b=T/rN4uVB4JotuC634fcqGadHwmmQpoH55yKCPvvOu885lGPV8nrrVRo27tYXX9+TwM
         mD91Jmw1KjqMFeacCxUwPftmA05cqvJOAxQPrN3yUMvoV7QQhbd/OSvpaVLPqikDk8yp
         N5CqGzPSlOIlVVxD2criJ0rBIojw+NWCT7HIS4XUETOsO0asl+X+f90lGhMskLDKOIB+
         MfKC+IXDGc8q9DEicCDjXdXjDK/a2jLXNx4n/BYxg4b3/qYj8/4E74vTeD1ptaaR6PZd
         pMQw7An0C7yZeHrlpiRrWp0WCSZ7S0ZWQJtzvSY3FTgK4lA1ZOPJlXXfeWKiAAMv/5+b
         byDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292339; x=1784897139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pidhZMI94NTBLbc5TNcQD1D0S0S0XdPelFHQKt6o2CM=;
        b=PHtfSUrTjgRJyy1w5sJBHzNp3PcXTjNfAT3PIqOrmljppk47qeiLzilpURYf0LILMj
         jMy8MH4nXdP6iFbjyQm5bzqxdPv++EqEy8CNPTotoh+jfdJXOf1m6XadEwOpl0YSmzOS
         duKcNtGfNH8XpgV2E0TX+uZb3RWAVMafizWHYZ417LTuDbtlrFYwFRiBNqHnxQBc65V/
         C3B2kVLfc9TA1y5oSUN9EBwBilyf93GeTSqZgv4oQyC/Owjcdgw1nbxSCDNblXVtfYmp
         booFi/7geylqse6HKA+XvV/xh2UEUsn9lNRup+GXCv5q5l2YI3zTyjij0vMY6xEIH+kr
         3G0A==
X-Forwarded-Encrypted: i=1; AHgh+RqztNNKSG7y48XmyrDtx58+UIbOMxv7sIdpf6xBtnt1fiq+T3nhp4AjQkD+P5JJSqXse+R3@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9K01wQuLK7Kra17OyfX8H/xbiPyOvidk0NY8yu3Rgo9/qNuvE
	pjuYXhGqjh2YdWgby4ibKFu/4AYJK6oWcMWp277OPJOhZw8901x08YFL
X-Gm-Gg: AfdE7clPdnvEnBYAT5Wz6WBjEFJ7i8CYvnWSuGcyYhmzsCVXePKu6WApD7e4HWyc1KA
	1Wk/cXi+wWFokJUYHPunjZ6nJ9is6BHLWYR4UnExiDqx4IrtjX/HEI/lf/yy2WlWLPt0r0TTKiQ
	6YskswRC3Z2cMCDwdiqXslSsdBcGR62Gn+2B9To6QkFc+VB/hWrWCo33Ok4YN2z8UrrVAERUGS7
	wQ7/LlB3erpslfCBz0WHC/ve5VJZVb5k/oSCVqswRQsaxKsXNHLUwotY4O2mX+CnurqWLyd4xWN
	Qp41i428xmjztPsB2NS6c5rkj7X22i/u/VneQeQm2nPpMajMf2j6fkUqWFnLyP2yHRe6VwLJje7
	MsZVMFUDn9jyLh0ZTno8Zi4Qcc+X8fYqmZjJLyr8FO1wmO/W8oWrePVNG+7QG9ZbHEPbu5eRWFI
	aAOquQ0a9oyuJDs4adMJJBOl5q0ekDvnoBwgs+FIZlF51mvEtVxlo4Xm3pwCXqJ4PvFD52p2XJW
	9lPvT2t82v02nwIw1LhSfw+JgBf1aCbqCsPyj+PaxIR0B8A11nwHXY3U/eHfU+X59PhYAoRSuN4
	3cBdKHnqHxN1Aq5uUA==
X-Received: by 2002:a5d:5987:0:b0:47d:f6a5:1fbb with SMTP id ffacd0b85a97d-47f623bc322mr3149483f8f.13.1784292338518;
        Fri, 17 Jul 2026 05:45:38 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a56c-5c01-55c4-777b-77ab-69e3.310.pool.telefonica.de. [2a02:3100:a56c:5c01:55c4:777b:77ab:69e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7e49sm3499778f8f.19.2026.07.17.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 05:45:38 -0700 (PDT)
Date: Fri, 17 Jul 2026 14:45:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [RFC PATCH] slab: don't assume alignment on allocators that may
 return ZERO_SIZE_PTR
Message-ID: <aloin36NATD9-tVQ@unknown748F3CBA5068>
References: <20260712120728.96628-1-kmehltretter@gmail.com>
 <f2def8bd-4eb8-4e5f-a22f-4061297ddb03@kernel.org>
 <d6b1bd1b-3800-4bf2-bd0d-f0e6201810f3@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6b1bd1b-3800-4bf2-bd0d-f0e6201810f3@kernel.org>

On Mon, Jul 13, 2026 at 06:53:40PM +0100, Vlastimil Babka (SUSE) wrote:
> On 7/13/26 07:18, Harry Yoo wrote:
> > 
> > Bumping ZERO_SIZE_PTR to something smaller than PAGE_SIZE should still
> > work: (addr < PAGE_SIZE) check still works, and accessing it still
> > causes a fault. No arch should have ARCH_KMALLOC_MINALIGN >= PAGE_SIZE?
> 
> Yeah, I don't see why anything should mind if the value changes to a larger
> one, if it's still well below PAGE_SIZE.

That should work for the affected architectures. The maximum effective
ARCH_KMALLOC_MINALIGN is 128 bytes.
It exceeds 16 on 32-bit arm, ARC, non-coherent MIPS and similar
configurations (32/64/128). Before commit 9382bc44b5f5 ("arm64: allow
kmalloc() caches aligned to the smaller cache_line_size()"), arm64 also
used 128 via ARCH_DMA_MINALIGN.

Preserve 16 where possible:

	#define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
					ARCH_KMALLOC_MINALIGN : 16))

with static_assert(ARCH_KMALLOC_MINALIGN <= 128) after the effective
definition. This only changes architectures that need it.

The max value 128 remains below VFS_PTR_POISON (245) and
LIST_POISON1 (256) even before POISON_POINTER_DELTA is added.

A fixed value of 128 for all architectures would be problematic: s390
does not need the alignment change, and its lowcore uses address 128.

On affected architectures, the current ZERO_OR_NULL_PTR() range check
would accept values from 0 up to 128. 

Exact NULL-or-sentinel comparison may be preferable for hardening.
This was discussed in 2016 [1][2]. For a power-of-two sentinel, 
current GCC and Clang can optimize the comparisons to a mask/test.

With exact matching, applying POISON_POINTER_DELTA to ZERO_SIZE_PTR could
also be offered as a configurable hardening option.

[1] https://lore.kernel.org/all/1479376267-18486-1-git-send-email-mpe@ellerman.id.au/
[2] https://lore.kernel.org/all/alpine.DEB.2.20.1611181146330.26818@east.gentwo.org/

Karl
