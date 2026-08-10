Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0C6266B46
	for <llvm@lists.linux.dev>; Mon, 10 Aug 2026 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372004; cv=none; b=qCwlEneJ0lt4FjUR4wa5SgX9Lcdt4p683MDi/ugznoh2iWVgIKGzsZjxgDGIGQlfLhRRY3Do11D4GeCumV/lggFvLMe3VVhePuLGnyYRchnRy/J8G7QLhzVUp6UmXDj2S0+FaXcIh3MMHVRbOZj45yjPVgtUM6bWea9u7y3dTeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372004; c=relaxed/simple;
	bh=zjwgjmw2Cz13wapOkkSs//vcr48fzlSgref4mNwk7G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkXAJ9H27gWoo1IQ5xjM+FQIIzAQ7t/GJDrRHLDoRL5Ho4Ve3tcYS8o+Flyd51dApuSz68r99umppHZ9DlOjJKt1Eq6+iwmBX+DASzDjzP5f49GRY/9orqRrQ0lOdROlIfse03BflSSiU0XA5c7cDNoLEOw54WBn5SsLlbjUPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RYvBoyne; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RYvBoyne"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1844F14BF;
	Mon, 10 Aug 2026 07:26:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6F13F86F;
	Mon, 10 Aug 2026 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786372002; bh=zjwgjmw2Cz13wapOkkSs//vcr48fzlSgref4mNwk7G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYvBoyneZzEB3QMUtepP5JZcL2qZ+JuOAZwBiaM/TSdhVOKhY03ZdOFmOILXJmU9g
	 YxbXxDzoppQKGeEGhNbOlI+M+b5dK/yJhBm2JwYln3hkY7apaie9v4BpG1yCxp1CyF
	 58C1yjwQ58S5Ot+C8g/lua8+t77ra7YAvHvOWeFw=
Date: Mon, 10 Aug 2026 15:26:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
Message-ID: <annfnXskDJuyzMKD@arm.com>
References: <20260808105622.62026-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808105622.62026-1-kmehltretter@gmail.com>

On Sat, Aug 08, 2026 at 12:56:22PM +0200, Karl Mehltretter wrote:
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 32c9f8ed7ae20..0798a714da87f 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -259,13 +259,16 @@ enum _slab_flag_bits {
>  
>  /*
>   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> + * It satisfies the alignment promised by __assume_kmalloc_alignment
> + * and keeps the historic value 16 where that is already aligned.
>   *
>   * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
>   *
>   * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
>   * Both make kfree a no-op.
>   */
> -#define ZERO_SIZE_PTR ((void *)16)
> +#define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
> +				ARCH_KMALLOC_MINALIGN : 16))
>  
>  #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
>  				(unsigned long)ZERO_SIZE_PTR)
> @@ -622,6 +625,12 @@ static inline bool kmem_dump_obj(void *object) { return false; }
>  #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
>  #endif
>  
> +/*
> + * Keep ZERO_SIZE_PTR below PAGE_SIZE and the low pointer poison values.
> + * 128 is the largest in-tree ARCH_KMALLOC_MINALIGN.
> + */
> +static_assert(ARCH_KMALLOC_MINALIGN <= 128);

I'm not sure we should bother with this, or at least make it strictly
less than PAGE_SIZE since 128 doesn't have any meaning for the slab
allocator.

Otherwise,

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
