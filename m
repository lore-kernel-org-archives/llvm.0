Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E35471425
	for <llvm@lists.linux.dev>; Sat, 19 Sep 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814466; cv=none; b=fK/u3VFWHx604igKfHcLHfVWdIWFuyCn4p0pqVvpx6lp+X1FCJjLBFexDQaJo45rKqm1bhuTJm+tFPc97+tygbTRQDYGgxl39PHHkXAS8ve8hCysI6WTdmvnWUYMtWy7noyDRGeINJiyWukjTpGzucXfpwZKgvg79EyLMc/7neA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814466; c=relaxed/simple;
	bh=/zVhl/58ppW4f8bSySDdz7RMQAkYtKlqpvoNw49/sj4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KoOX+YzrJ9FdJx42+dR8cu86OVqABnBAPUzMTJG9KXL04Ajf5nnNxIktSJnifE9+PpdkS5D+6rHki7zClT1ss/lW3xsO7qh5ETjDKTZFkYXrLbTroKCFlDBRsyiFih0zIgnWtNgtUtXRILsVYHVGq27w8lmtAtWud2sITsZD8ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCaACT68; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCaACT68"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so11257385e9.3
        for <llvm@lists.linux.dev>; Sat, 19 Sep 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789814463; x=1790419263; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x47tJsyRRuS9WWsrQkleNMY57Cc3HHS/YjAw1Ng37/U=;
        b=GCaACT68x1CwjaWdbB5dYE6FnMqm5vO7sOvmHw/4/l7PEGS4E7zVOFz7FISyHJa+Of
         yxbxw/sjnIUyz5rvs7/u+HqtNuMUXT3M0Z5cUm7QyggoGrFItkhSYCwJJVx1QC/A5U05
         pYXHTxmmwWwFIjZinyyIj3bcILqs/Y2e5a0gcUbsuTHuRyKsON2RxtP4ErIDAU5UKyqw
         zm2g8PBxR0OnJrKIqf3P5VFQq/PP/C+QJv4oiyPDbKEGSxKOXVPZEnFb3QpmUm5efHjH
         vxv4H7aMP8+FHNsl/y63+7ORJDdOl8qQJW2pD7nRTAlKU1E1ZsJtl8BqSIYb+OsdCeK3
         NMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789814463; x=1790419263;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x47tJsyRRuS9WWsrQkleNMY57Cc3HHS/YjAw1Ng37/U=;
        b=fcSYo17oPSx4FQyBowdJtrOgVpsPQ8jNGfsaTqkFwk3a5hOpbnECGGh71/4llCRP5I
         IlDnaP4lgVyy8Yx40ZH8gcJZuaeBhRoWqB5BZeaeOL94Wwv7a87SOxt/wPUHCHe6ryH3
         o+CPBFu4GxrHlQu+EiQTpDloXztdy2+ntj289aGfnPg/BaaXrozhfUdPWgE+Q8GNuM0B
         PfgwDpwZwlsUGP/r/Vbe8CFod5Tm1LHZfzQepVp/RAPdnYbJiFVspzJ61tndjyAwHsMF
         RYbRku8PHyDUn2+YAkNySNc8yT+hFyPbqKy1Lx6G0vVQGKLIRnx3WBhguxXD56LfL5pr
         IZIA==
X-Forwarded-Encrypted: i=1; AKwUvByzMBaSnOWxmQ9wJrnF7q5+z6p7r9qp9/ZrtPExppcgGGwXPZImf+lMsMFeSqlj+OgJmqKi@lists.linux.dev
X-Gm-Message-State: AFuF++km6UNgG+m3Ps7EPOBJKJ2COafNHqzelImnvgNprczu6vOQCUcs
	2oofTpHYsoxEKKTS2UR56e00QlsKgaHqSStK2NpHwE7OlwUum+2u6p1A
X-Gm-Gg: AYBFou2bk3Qc7t01+jHCs+grEfi+PQgKhYhYJVSKAVxctfbLVSRzK0/JE9M9OvMdWtw
	1orsGsB2jDMn5DZLfnhgEf6k6y85BGNyRcx82P5tMaonP+RIi9VUiJ+Bzu7MIekn99sc6o5zYdW
	LyQ4bvcHdsr8k43KWUQc3rRSgTH/g/y5VolW1W2g0Jttx5vFBPxht2QD9UQsUtjIbo0EsID2u9/
	fJqetBaxXD+zCxZ+/tnVmRAtt5RlyxFGqoU8jQam0qqf54yDreDxvzjIIlb0dJnDQMlrk6DdsZ8
	Y8cCjKVZ4k8JTKRL1GDXuOF5SGY4NM+zldgrnFlPomSvdcrWnidU8Th8u42470sNqgfM7OH9PrF
	wa2WPe+QFRjAVLVf6aoBzlwLEapO3W1NYEiYQM+MxsHPM/4tUT2JALBMTa/Z7jx2yRsjRpD+k2g
	3+zFwoGMniClO7DLqMrpU/R7xKkagPMT0CWxAo/wNHOND+mn0z7kG8PdJRgCFstzI3oYVYXTobt
	GdpLaadUVx/dkyo6jF+aZHE6qeVN/ydNNE=
X-Received: by 2002:a05:600c:8518:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49fc5741563mr73992215e9.29.1789814463336;
        Sat, 19 Sep 2026 03:41:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc521f5d9sm32797955e9.2.2026.09.19.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:41:03 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:41:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Hao Li <hao.li@linux.dev>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, Kees
 Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/5] slab: align ZERO_SIZE_PTR to
 ARCH_KMALLOC_MINALIGN
Message-ID: <20260919114101.34423251@pumpkin>
In-Reply-To: <20260903203720.63689-2-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
	<20260903203720.63689-2-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 22:37:16 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> The kmalloc entry points are annotated with __assume_kmalloc_alignment
> but return ZERO_SIZE_PTR, currently (void *)16, for zero-size requests.
> This violates the annotation when ARCH_KMALLOC_MINALIGN exceeds 16.
> 
> This can mislead compiler optimizations. Clang's UBSAN_ALIGNMENT detects
> the violation on armv5. GCC and Clang retain the ZERO_OR_NULL_PTR() range
> check but eliminate an exact ZERO_SIZE_PTR comparison after an annotated
> allocation.
> 
> Define ZERO_SIZE_PTR as the greater of 16 and ARCH_KMALLOC_MINALIGN,
> retaining the existing value where it is already aligned. Assert that
> ARCH_KMALLOC_MINALIGN remains below 0x100, the value of LIST_POISON1
> when POISON_POINTER_DELTA is zero, so the sentinel remains distinct
> from that poison pointer.
> 
> Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  include/linux/slab.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index cda126def67a..563dadc16d82 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -262,13 +262,16 @@ enum _slab_flag_bits {
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

If ARCH_KMALLOC_MINALIGN is just a constant (I suspect it has to be)
this would be better as:
#if ARCH_KMALLOC_MINALIGN > 16
#define ZERO_SIZE_PTR ((void *)ARCH_KMALLOC_MINALIGN)
#else
#define ARCH_KMALLOC_MINALIGN ((void *)16)
#endif
to avoid bloat at all the expansions.

David

>  
>  #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
>  				(unsigned long)ZERO_SIZE_PTR)
> @@ -625,6 +628,13 @@ static inline bool kmem_dump_obj(void *object) { return false; }
>  #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
>  #endif
>  
> +/*
> + * Keep ZERO_SIZE_PTR at most 128, i.e. below 0x100: LIST_POISON1 is
> + * 0x100 when POISON_POINTER_DELTA is 0, and no architecture currently
> + * has an ARCH_KMALLOC_MINALIGN above 128.
> + */
> +static_assert(ARCH_KMALLOC_MINALIGN < 0x100);
> +
>  /*
>   * Setting ARCH_SLAB_MINALIGN in arch headers allows a different alignment.
>   * Intended for arches that get misalignment faults even for 64 bit integer

