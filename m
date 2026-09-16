Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A6D501F4F
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567635; cv=none; b=PKGFIO3GtCDvGFvePalQPk9TWO/4opv5ZKGMfBNTWRJj6kWWKO1TA8XcdIWIhUJV0xiX0PmjxcRnpfLd0MAhHXE4a8HF2nHKTpMMJOM6ohLqq0jJ1HwYo311mEpCkOJmAqrR0xBpBCpa7qOqBLRlIyYoZaGDoty8f9o1nRJTIBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567635; c=relaxed/simple;
	bh=MGV0/UiveNiiGplXBn4NQhOcOJpFAI97dT32wObLO5Y=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Fa5LlZNNkRTxB9nGqvVAQyAVcD/eTibNkkHusZCFhEbU3feh+Bdreq+nW2ToKi/1brwyjBrd0BAtkbYUrzrsFfiHB4ihC8nA/iTWARJvCAi2nbg0FJ1QJS9lJt903hNgW6CAYrQASj06bVUyZhdVv1WMscxxcaMej+NGs5nLiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=deAxxL2q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=usEP3hhL; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="deAxxL2q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="usEP3hhL"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 7F760EC00D8;
	Wed, 16 Sep 2026 10:07:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 16 Sep 2026 10:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789567632;
	 x=1789654032; bh=Be2o5M1d9xljHYCRtuNcdhNIc/2it5l8BznRP32aB+E=; b=
	deAxxL2qOz3i3Nk280cG2SuqAGf0LERKkb+BKPxddkO2Uggd14mT0texUPBovaEQ
	U9mx9skBudy7DVI5XFPEjTyPgiSnnY3sR3Dgvrv+O/16UiOhJpQbUmhbPwfxvaiO
	Oo8i04bkxS0tZmGyjWNJu9Bcwo70WPSy1ft7ZIUoYMH8uk0L4LoPSdTu0aoGe2vT
	Lf7CpUcdN1ceH8IqpBf9efrfO4dIN+Diz+X/7yX+ZNEJ/VFyZvUMjzyE7HZ+atjS
	fGxoGE8k3Xdz6d0H9qxYVFk67YMdFy0QFZAFT9hpWLyg2iURMGbHhvG2swWodIrW
	gSeGT8jxhQmJo+m5IjNkkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789567632; x=
	1789654032; bh=Be2o5M1d9xljHYCRtuNcdhNIc/2it5l8BznRP32aB+E=; b=u
	sEP3hhL2wPucrF8g4+DIgHERL4yiNo6RMR+5ANpjRjwcKSnlQ3R58oi1A8Wijzbh
	Ted5NbSc2V2q7tpOYpaanPrrlGd68k0Y9e+rVTBpFozJl6r9Uqx5ky5uhS4C2RvU
	ZNu8ggu04ssOSbPoKG5n0EzmPr8wvbdHcQCxfhUK9TaVtLPL5FJlhEQ8v0BryiIO
	BlDytGlGtgF5TMO40x/a8WNJMBTdYRW9+UO60IyjEj4Fj/P/S9CCco4eL1wq6lXg
	i2W4wwRkO7kjyQANlP0Z7Z2g8RMfEeGfeMUiQTruTI9GiaFAXte0R4sA+wOv3kDv
	GVVnR/wmp/IXy9rjwK/kg==
X-ME-Sender: <xms:jqKqaoYvkYmOg-UJ8gtDH_R0lw7h0d696x39Mb-7Rccp6FxNPpl1hg>
    <xme:jqKqaipBCGaf_mmfFFtSl_0CdNJHhURYGZk1dNaV6O_B2pEre-0gVZ6Nj-lSD0mSm
    1hZS9Zw2ah39vt68pOVLR8-3kN5SHricV5oniqmw8-oDieVE0PBRxAy>
X-ME-Received: <xmr:jqKqavIPKJmgiv_-NDObdJrhZDHjGPG2qs4Yb5KxqLe2MhMfvE2nWxF4QNlO6MMR4R4qA_ki09qaAcSA5KlLseq3>
X-ME-Proxy-Cause: dmFkZTE24MkS2sB+Rva6s7htY7NC2fdYq4QMZ8DzKsYXOVhrbIfPJcjFGqD8XD9xFUbpzK
    T8v9MWKCaUPHHVWOdP0Ph3S9vCuzfzvk0UHCjo89hw+hw6yCwrmrMh2jlvplimDpg9mX5W
    YhumFteGV+Z0jP5x0bAG7YSoLN5yg0xx9AhfBWUqkivBDuW0btCAIIIBjteGEFXAIH2CKq
    3Xw31wPUpiXBNFegLxJKTpF8ooPmFeH/zfQPNCPE/Yf4R6lW7Xg2opzmbbNczjzmxaZtiG
    e9if0bFXi+w0RveLM37dEX04I+oZmJ7BC5eGY934whHgua1iPsiYlsb2yu1pD7BcHl+FK8
    utjsVakpuqQQ1RG/gYGD1xK4i0ykb5u26Z4udx1f4krPFu1gANlPh7NuZm4TWvxkFOUFOu
    fpnbyfYjIcFoFu5thzd+Jb0sGTJoUqc4mcpwMeHSZMNRxKYuDcHaMv89MyAGNgY6sHT4Sw
    qyXbRdqJLvhHyDb9CgVIVNWck0tpyr45fSXja/hGhvQXLvBC+9iaM2fNXLdVMh61RHhOsm
    VTK4la9FOWe0yRop/SLJqUma9repZGnmq/JqZ70bv6cbSiFpGa3srvc8j2u5VstCXQNvas
    ExDBOTIO2wiP+DNRmJXsFiTYl3RjyJ0E7U7O4Irjvs+6S4HOLmJSspbWI3vg
X-ME-Proxy: <xmx:jqKqatZua1_v_2U74D2H352410OtvMkZOOHh_YB04rdXM_nF9yCfQQ>
    <xmx:jqKqamoh3-SJPZp8WCuojHZxYa0aIPpJQMm8Uw9Iv3Eb17mkCzDDUA>
    <xmx:jqKqagCV_cIiXEvUUKpEe4U4zmWLe76izJJea4qeCB-FLIJ863oOZA>
    <xmx:jqKqakl3h2L8Fhaayd568-d0y1cvRztxIK7CK2FB1ZP2wMH0ZV5YeQ>
    <xmx:kKKqahgpoohVyElPk3Kl7S5wiU-zRx3U0PwO4IVEUFMbPx0ga3aJWMbB>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 10:07:02 -0400 (EDT)
Date: Wed, 16 Sep 2026 23:06:58 +0900 (JST)
Message-Id: <20260916.230658.2266384286281034372.tomo@flapping.org>
To: mkchauras@gmail.com
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 ynorov@nvidia.com, david@davidgow.net, joelagnelf@nvidia.com,
 fujita.tomonori@gmail.com, linkmauve@linkmauve.fr,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH V5 2/2] rust: kernel: Add KUnit tests for powerpc
 ARCH_WARN_ASM bug table emission
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20260915090453.1227034-3-mkchauras@gmail.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
	<20260915090453.1227034-3-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 14:34:53 +0530
"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:

> Verify that the __bug_table entry emitted by ARCH_WARN_ASM has a correct
> bug_addr displacement ― i.e. the '1b' label reference in _EMIT_BUG_ENTRY
> resolves to the trap instruction ― by calling find_bug() with the exact
> virtual address of the twi instruction, mirroring what the real powerpc
> trap handler does.
> 
> The trap address is captured at link time via a .dc.a 1b relocation placed
> in .data by the global_asm! block. global_asm! is used instead of asm!
> because LLVM eliminates asm! blocks in dead branches; global_asm! is
> file-scope and always emitted. BUG_KUNIT_TRAP_ADDR is defined as a .global
> symbol directly on the .dc.a word so the linker relocation lands on it ―
> a Rust static initialized to zero would end up in BSS where relocations are
> not applied.
> 
> .dc.a emits a pointer-width word (4 bytes on ppc32, 8 bytes on ppc64),
> so BUG_KUNIT_TRAP_ADDR is declared as usize on the Rust side, making the
> tests correct on both ppc32 and ppc64. The global_asm! block is split into
> two cfg-gated variants (CONFIG_PPC64 / !CONFIG_PPC64) to select the right
> .balign since concat!() only accepts literals.
> 
> Five tests are included in the rust_kernel_bug_powerpc suite:
> 
>   bug_entry_found         - find_bug() returns non-NULL for the trap address,
>                             proving the bug_addr displacement is correct
>   bug_entry_is_warning    - the emitted entry has BUGFLAG_WARNING set
>   bug_entry_file          - bug_get_file_line() returns the correct source
>                             file (requires CONFIG_DEBUG_BUGVERBOSE)
>   bug_entry_line          - the recorded line number is non-zero, confirming
>                             the {line} operand was substituted correctly
>                             (requires CONFIG_DEBUG_BUGVERBOSE)
>   bug_entry_addr_is_in_text - kernel_text_address() confirms the trap address
>                             lies in kernel text, not data or zero
> 
> The suite is named rust_kernel_bug_powerpc and the Kconfig option
> CONFIG_RUST_BUG_POWERPC_KUNIT_TEST depends on PPC && GENERIC_BUG,
> covering both ppc32 and ppc64.
> 
> Tested on ppc64le (ltcfujiaac-lp3, 7.3.0-rc1+): pass:5 fail:0 skip:0.
> Tested on ppc32 Book3S (QEMU mac99 G4, chrp32_defconfig): pass:5 fail:0 skip:0.
> Tested on ppc64le (QEMU pseries, pseries_le_defconfig): pass:5 fail:0 skip:0.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
>  rust/kernel/Kconfig.test |  13 +++
>  rust/kernel/bug.rs       | 209 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 222 insertions(+)

I think that testing warn_on!, in particular that the right address is
put in the bug entry, is a good idea.

I'd prefer such a test to work on every architecture. This one depends on
details of powerpc's ARCH_WARN_ASM, such as the '1b' label. KUnit has a
warning suppression API. A test can call warn_on! inside a suppression
block and check that one warning was counted. The counter is only
incremented after find_bug() found the entry, so a wrong address is caught
too.

I'll send a patch for that shortly.
