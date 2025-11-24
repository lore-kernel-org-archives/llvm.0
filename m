Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01A2D8776;
	Mon, 24 Nov 2025 19:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764011751; cv=none; b=XjnDJ+4DHI8PZPDdbFZNGNdMlOnVYzYEBmZPJ5JoVVxVbsIcztPW2SHjsifl7B0eftZnpYB6Gs/4BrQ4cDRGSUyogDlxVbLSXQWWofMq5+KeHlmLsGMOBz1KsXRIpVGR11NHYJJDqTtuaVEv6QRpGfDPZzNDIntIqPBeAIaM1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764011751; c=relaxed/simple;
	bh=0h8VAnmlSmKStEl/tTJDuBFwycSLZh/W1ra86y127bc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=adeq8s0Fd/1KChKfQfAcHNttGSFuBRxwQSewDTTgHnAnNsjTS0SUVczFkrZQYmomK1+iguHkK1DhI2yMtJJfyRw6XP36KI3uwN1qQp2cOVphtAu4lpnUtcn2lyJCJRbcI6hZy2mPTiiNBfeCHM/QQ/qQg40HtDTIozs1tVBr0W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AN/txhTo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BUHhE29l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AN/txhTo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BUHhE29l"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764011748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFNtQO4MJezSq1Da7LRhRWoB6TraF4nvtRNwdskfv0c=;
	b=AN/txhToM6VlnwEgn7HGPRictojfH48IrjrQmrfx8FKoMe1uAPwHyw9DVXi9+p/zBA4OL1
	GjcGXbDQxc+wtE/nTiHWgzAahjG9JmRcY0zwQElGZAl6ao3WjA7xgG2wVgn/7TLVtKFFXM
	Egk201XAqXpEjCivCkaQwqEa7CoVeKRb2tsuV69zjlykGLOxSNiNuBxLKls83K6AkzIjOr
	Xj1rANFRnN5K0wfExrcRYzdFEsdabGo5kr8ZsKOBr+hlGcoRlFDS8bDR8qe4mnCB0gBXwY
	rprUBY1b5Y9EN3OcSAOlXsOkQ+KyM4nInQI/fuAKv58k7u7XNWYCqYipSTn8uA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764011748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFNtQO4MJezSq1Da7LRhRWoB6TraF4nvtRNwdskfv0c=;
	b=BUHhE29l2/cUl/S02UwFWAk8sb5W32l+hFpPVkHbR/s4lrnRqcOvRh24aTl+iTO7o9hQ8C
	7rWaGHg6/XZcxeCA==
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar
 <mingo@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [tip:core/rseq 25/39] include/linux/rseq_entry.h:132:3: error:
 invalid operand for instruction
In-Reply-To: <202511250134.i0Jm8d7I-lkp@intel.com>
References: <202511250134.i0Jm8d7I-lkp@intel.com>
Date: Mon, 24 Nov 2025 20:15:46 +0100
Message-ID: <874iqji6n1.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Nov 25 2025 at 01:37, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/rseq
> head:   21782b3a5cd40892cb2995aa1ec3e74dd1112f1d
> commit: abc850e7616c91ebaa3f5ba3617ab0a104d45039 [25/39] rseq: Provide and use rseq_update_user_cs()
> config: powerpc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511250134.i0Jm8d7I-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from kernel/rseq.c:75:
>>> include/linux/rseq_entry.h:132:3: error: invalid operand for instruction
>                    unsafe_get_user(start_ip, &ucs->start_ip, efault);
>                    ^
>    include/linux/uaccess.h:606:2: note: expanded from macro 'unsafe_get_user'
>            arch_unsafe_get_user(x, ptr, local_label);      \
>            ^
>    arch/powerpc/include/asm/uaccess.h:458:2: note: expanded from macro 'arch_unsafe_get_user'
>            __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
>            ^
>    arch/powerpc/include/asm/uaccess.h:282:2: note: expanded from macro '__get_user_size_goto'
>            __get_user_size_allowed(x, ptr, size, __gus_retval);    \
>            ^
>    arch/powerpc/include/asm/uaccess.h:273:10: note: expanded from macro '__get_user_size_allowed'
>            case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
>                    ^
>    arch/powerpc/include/asm/uaccess.h:256:4: note: expanded from macro '__get_user_asm2'
>                    "       li %1+1,0\n"                    \
>                     ^
>    <inline asm>:7:5: note: instantiated into assembly here
>            li 31+1,0

Definitely not a problem of tip core/rseq. It just ends up in
__get_user_asm2() and then the compiler gets unhappy about the PowerPC
inline assembly for whatever reason.

Thanks,

        tglx
 

