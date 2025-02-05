Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8ED2135B1
	for <llvm@lists.linux.dev>; Wed,  5 Feb 2025 20:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786292; cv=none; b=dgN05PmaUCGQYjwOywauFFxnfsyHL3dlWO6GJjxaEhn0ibvFzzOR4l7MJLSvj1QumL6s1NbskGGZcR2YMIrQCfHxLcDpgi+LehdLm7mWbbkLMFOA0dqMivjZIwUm3zwC2hjTrDe5qY41dT4WIxWlKCklaTywXjHRq6S6HO72rWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786292; c=relaxed/simple;
	bh=SYRJ92XRnRT/x5NskeDXbjb8HVyYz50Z7VSg1zqM4Ew=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kygODZkj4QAD3vcvfynIW/poTzLi4zHB288jdJTrTVtiYo5MKzBoHD0aiTAcpabWElwTIqeD+CP1DVnXyOVXKxgXTPexwV/xr55tfKoTkyudf/7vbjXR8n95HVZSiARaiWsOwR70JjGsaURzq1svH9yvSXS1DwgXkni/L8Gbpk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=mzVxLSJN; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="mzVxLSJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1738781950;
	bh=SYRJ92XRnRT/x5NskeDXbjb8HVyYz50Z7VSg1zqM4Ew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mzVxLSJNHQzpfsGg8asMfAllni44astZAk7UVDtj61QZhKUA3VzWiQKg025jlDtuO
	 IQQGXZJGyg0hvGfUeE62Iykg9RLT5BzCQoIJZUS7GMDyP3L9aN8Xw3DfgQ68ImYJGf
	 g1vnGP2zayjZxjDqcFnzDr9YcNKprDLECJW554HM=
Received: by gentwo.org (Postfix, from userid 1003)
	id E015240285; Wed,  5 Feb 2025 10:59:10 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id DDBFA401E1;
	Wed,  5 Feb 2025 10:59:10 -0800 (PST)
Date: Wed, 5 Feb 2025 10:59:10 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Dave Hansen <dave.hansen@intel.com>
cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, 
    xin@zytor.com, kirill.shutemov@linux.intel.com, palmer@dabbelt.com, 
    tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com, ardb@kernel.org, 
    dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
    akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, 
    dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com, 
    tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
    jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, 
    jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com, 
    rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com, 
    catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org, 
    ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de, 
    kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com, 
    julian.stecklina@cyberus-technology.de, peterz@infradead.org, 
    kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode
 for x86
In-Reply-To: <fb30574a-d238-424c-a464-0f7a5707c46a@intel.com>
Message-ID: <3dcf7631-d839-7235-10c7-30f80d7f796a@gentwo.org>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <fb30574a-d238-424c-a464-0f7a5707c46a@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Feb 2025, Dave Hansen wrote:

> > Could we get support for that? This would allow us to enable tag checking
> > in production systems without performance penalty and no memory overhead.
>
> At least on the Intel side, there's no trajectory for doing something
> like the MTE architecture for memory tagging. The DRAM "ECC" area is in
> very high demand and if anything things are moving away from using ECC
> "bits" for anything other than actual ECC. Even the MKTME+integrity
> (used for TDX) metadata is probably going to find a new home at some point.
>
> This shouldn't be a surprise to anyone on cc here. If it is, you should
> probably be reaching out to Intel over your normal channels.

Intel was a competitor for our company and AFAICT has issues all over
the place with performance given its conservative stands on technology. But
we do not test against Intel anymore. Can someone from AMD say something?

MTE tagging is part of the processor standard for ARM64 and Linux will
need to support the 16 byte tagging feature one way or another even if
Intel does not like it. And AFAICT hardware tagging support is a critical
security feature for the future.

