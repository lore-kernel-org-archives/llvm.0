Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5797201254
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732734375; cv=none; b=sEkqV4jMJP2BhelM2r4Px2TfioT02iepN5hPQerIlt3r4aNxxtPisd940y1ul48fhwx0pKkvfzjzo0SnTBrXWyJz8tBwAEEp4fs8QkU4hQJaOqz/sn68dBDpgZuc4s/aM3kHtD/hxRwOuPcJCKgYtY+G3qzk6MlJFthG9be3Uog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732734375; c=relaxed/simple;
	bh=R1AfY708jXdHmbfLByxg5ZttNT2kjrD7QHd6g5PwSEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsbcqJ7KN8H55cHfqVGJkJL2VlyWmdtHE5/mzZgLVWwBUJRixgqy5NeVZDV7nVqy+OzH+LBTJsn+PKS313MS8v8BmQxScGOe3PYdZse6AmkHRvQBOMdvkODqLNvFkUgqTnwKg7rhVTNCrCs+XttuClig+j/0Kzt56RE4ieJC4hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGSCUhcc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGSCUhcc"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ea4e9e6ef2so84812a91.1
        for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732734373; x=1733339173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgXnDYjeious6Mn9ABnjIVdAyLz/oUf564mThG/grAY=;
        b=AGSCUhccEba1Dl9S9jQ1PQgkagsLiHT4pcusgJMSO0muzvmVomsxpl3ohQagxSlYL/
         oGdJl+HF8VAYbQVMfiOpOtX3md/H0s7EtkwJl3CTkn1sr8Iy7xhWp+8RPygcfPjUkdxW
         jvtrYl8i/6tE6jGouF+kKCvU4XL8Rg/5Ln6DkD2/eNXi3Pnj3glfXa05W1hB/KWatQ9X
         B4o+semR58lQz3x8TFOQpKRrcoxrD5D40q+HNSOgkyGl2x9nuTafQZZcF/Esh6S2CVXa
         Baml7OVc7v08rHCQ2mFnnjfexh5gZRB4PjLNEmSR//EPlK/PQzxTKmw1vseqTD6n2Qy0
         9gzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732734373; x=1733339173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgXnDYjeious6Mn9ABnjIVdAyLz/oUf564mThG/grAY=;
        b=cOU+K6QL4/Z/MhvjyIl7qq9yEgBxQbutyPbQQA1dM9NQo73EvTH7jZYdg4m2bUw9Lm
         qyxGhzFGVRWkMcsJpqvaErj0K7r5BPV2UQKeoTFkkOYLl7lF7zFx4TgDY4XF6hu5OhdW
         QXodgLI+WMDqxHl939JvH9JLtZhW0kENH47//vWjcOU8kmZoDl1lVGGMCcM156iIirjI
         BIv/nq7TL12YhmbnGnbOYVLAYiwciAnccozAIGguOvyn9yURDmAZIIJSmJ3Kf2548LK5
         GlO9iPGej4XB2g9/p74LEMljsLVi/nKFy3UxYQ1IsRuDYi+kzi7ecqX9ijEtpYZYtdTf
         ugIg==
X-Forwarded-Encrypted: i=1; AJvYcCWR5Lp7ANJTaA42X4WuC1B1+LMHEQIdPo/mrrQ4uTZIAPMkSjYyrZ5R/75lss4LQynm2Dvx@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz2GENvILweMcyDEdNnV1wM7QLRbYIgscwp0H0Jtxea6pPg6+2
	hgE0g65FYaKuF9SNPyoi4Lt15KdIC3o5moS163JVFCs4EEvZVLux
X-Gm-Gg: ASbGnct2XUTWNRKBF1LNdfiLD8O+5oL1znRPDjNHHFErt05dylFrZeD0ORzzIp7e8nw
	B0MI7yAoC/hCCeLguiKlfidnlX7RLMjgPjlUtzIFsejkM3w3VWIIA9z5vFuEQZEE0J1a49jAuZO
	kkmcfeFfQ4YyecRWUbk93JgOyj3RV+gjEKqePwOc1pAnBdrLn2tuIM2dKOdaD1RXFB8OtjLzdH+
	3xh0yl/EFjOFXT02/l1NABPuXQMn9QjHWHFKBZmbXzu2AzRmQ==
X-Google-Smtp-Source: AGHT+IEXoQP6bH9Kzyt4UUpfN2R0wNZnbQ/Gg5zUP2GZDnuGrLc0kFHcLCx0kZmRMXyA8zVMS069QQ==
X-Received: by 2002:a17:90b:1dc7:b0:2ea:853b:276d with SMTP id 98e67ed59e1d1-2ee08fca57fmr6226817a91.17.1732734372920;
        Wed, 27 Nov 2024 11:06:12 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fad03f2sm1936721a91.36.2024.11.27.11.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 11:06:12 -0800 (PST)
Date: Wed, 27 Nov 2024 11:06:10 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: Always inline bitops
Message-ID: <Z0dtohAlZqad841q@yury-ThinkPad>
References: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>

On Sat, Nov 23, 2024 at 07:30:19PM -0700, Nathan Chancellor wrote:
> When building allmodconfig + ThinLTO with certain versions of clang,
> arch_set_bit() may not be inlined, resulting in a modpost warning:
> 
>   WARNING: modpost: vmlinux: section mismatch in reference: arch_set_bit+0x58 (section: .text.arch_set_bit) -> numa_nodes_parsed (section: .init.data)
> 
> acpi_numa_rintc_affinity_init() calls arch_set_bit() via __node_set()
> with numa_nodes_parsed, which is marked as __initdata. If arch_set_bit()
> is not inlined, modpost will flag that it is being called with data that
> will be freed after init.
> 
> As acpi_numa_rintc_affinity_init() is marked as __init, there is not
> actually a functional issue here. However, the bitop functions should be
> marked as __always_inline, so that they work consistently for init and
> non-init code, which the comment in include/linux/nodemask.h alludes to.
> This matches s390 and x86's implementations.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied, thanks!

So we have generic, x86 and riscv bitops inlined, and powerpc and s390
non-inlined. We need to align them all, I think.

Thanks,
Yury

> ---
>  arch/riscv/include/asm/bitops.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index fae152ea0508d2e1ea490fffd645eab99cf387bf..c6bd3d8354a96b4e7bbef0e98a201da412301b57 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -228,7 +228,7 @@ static __always_inline int variable_fls(unsigned int x)
>   *
>   * This operation may be reordered on other architectures than x86.
>   */
> -static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
> +static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
>  {
>  	return __test_and_op_bit(or, __NOP, nr, addr);
>  }
> @@ -240,7 +240,7 @@ static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
>   *
>   * This operation can be reordered on other architectures other than x86.
>   */
> -static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
> +static __always_inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
>  {
>  	return __test_and_op_bit(and, __NOT, nr, addr);
>  }
> @@ -253,7 +253,7 @@ static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
>   * This operation is atomic and cannot be reordered.
>   * It also implies a memory barrier.
>   */
> -static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
> +static __always_inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
>  {
>  	return __test_and_op_bit(xor, __NOP, nr, addr);
>  }
> @@ -270,7 +270,7 @@ static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
>   * Note that @nr may be almost arbitrarily large; this function is not
>   * restricted to acting on a single-word quantity.
>   */
> -static inline void arch_set_bit(int nr, volatile unsigned long *addr)
> +static __always_inline void arch_set_bit(int nr, volatile unsigned long *addr)
>  {
>  	__op_bit(or, __NOP, nr, addr);
>  }
> @@ -284,7 +284,7 @@ static inline void arch_set_bit(int nr, volatile unsigned long *addr)
>   * on non x86 architectures, so if you are writing portable code,
>   * make sure not to rely on its reordering guarantees.
>   */
> -static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
> +static __always_inline void arch_clear_bit(int nr, volatile unsigned long *addr)
>  {
>  	__op_bit(and, __NOT, nr, addr);
>  }
> @@ -298,7 +298,7 @@ static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
>   * Note that @nr may be almost arbitrarily large; this function is not
>   * restricted to acting on a single-word quantity.
>   */
> -static inline void arch_change_bit(int nr, volatile unsigned long *addr)
> +static __always_inline void arch_change_bit(int nr, volatile unsigned long *addr)
>  {
>  	__op_bit(xor, __NOP, nr, addr);
>  }
> @@ -311,7 +311,7 @@ static inline void arch_change_bit(int nr, volatile unsigned long *addr)
>   * This operation is atomic and provides acquire barrier semantics.
>   * It can be used to implement bit locks.
>   */
> -static inline int arch_test_and_set_bit_lock(
> +static __always_inline int arch_test_and_set_bit_lock(
>  	unsigned long nr, volatile unsigned long *addr)
>  {
>  	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
> @@ -324,7 +324,7 @@ static inline int arch_test_and_set_bit_lock(
>   *
>   * This operation is atomic and provides release barrier semantics.
>   */
> -static inline void arch_clear_bit_unlock(
> +static __always_inline void arch_clear_bit_unlock(
>  	unsigned long nr, volatile unsigned long *addr)
>  {
>  	__op_bit_ord(and, __NOT, nr, addr, .rl);
> @@ -345,13 +345,13 @@ static inline void arch_clear_bit_unlock(
>   * non-atomic property here: it's a lot more instructions and we still have to
>   * provide release semantics anyway.
>   */
> -static inline void arch___clear_bit_unlock(
> +static __always_inline void arch___clear_bit_unlock(
>  	unsigned long nr, volatile unsigned long *addr)
>  {
>  	arch_clear_bit_unlock(nr, addr);
>  }
>  
> -static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
> +static __always_inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
>  		volatile unsigned long *addr)
>  {
>  	unsigned long res;
> 
> ---
> base-commit: 0eb512779d642b21ced83778287a0f7a3ca8f2a1
> change-id: 20241123-riscv-always-inline-bitops-0021c4dae36b
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
