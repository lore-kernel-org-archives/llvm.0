Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F211A5B99
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852984; cv=none; b=hUClZXGeYKiXau/9TA2WllCNoYCjpL3TlJeZ92J3Z4sqdyGEsrltTb1KV7fK7Lgj+62QAw/wCmVyHo8FEGwZ+ErmLgKOPqf/9BD/u5IB1Y1oqzBQFIpMmFwZo/pbbkkw5vfCXwQVjVyR3VjBtiJ9r1U/n68gCnGi0dPnBg/ti78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852984; c=relaxed/simple;
	bh=Y/RO85aVjqQPNi2XGujWPx/9mU+5vSHT2xDBTvt+aQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OjIg0/zopaIxMgYN0Euxvn1PSQpGaL4ulicVUkMC0M8ww8mGCUyoplGrQ0+lsYpmeO7SouAPt9oPO34fiLtc/32XOfBSsPOXvG9CAKQrZuHGmIExEaGzrdLO11VRsvdmOEvhxqazzOXnXXJJPZVpCuLmoMS2hyANgnPvNBpfPYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G+UyZ6gu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9f4jIC50; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G+UyZ6gu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9f4jIC50"
Date: Mon, 2 Jun 2025 10:29:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748852973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=hkgKy/QUlyNlnSk3m53sjulr8OtKHIa03c7yKO2yAy8=;
	b=G+UyZ6gu3vB+3b66XqRSs5jjNmArS4yLCIOwwC80hMp6BdI1U9Ma4Nb9OhVjVBLS54mmkm
	ISF0B5cUkJSclS+BEnFuvPkMje6AOWm1u7ROftSSv9MDoz8a8bkls+UCRFvD+jMAenD0zP
	jiy5Bw3Ix4bSdodDXwTDyHkz/JLZ5IkYqmgEPdf5bp+S1LTuxfBooivc8Tp2APJgQxAysP
	tOvSzuOFgCGzVzZA1rikdPIN4H7X0xMS8nizj5WbQBYbn3pFoRcDpVsu9S++P4ciQa1u9f
	YOYkzJ94rZ663XMSE5SOfjeJ+GVlfkqD37HqQe2FAEYkwClCDK8JJX/JxG8LnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748852973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=hkgKy/QUlyNlnSk3m53sjulr8OtKHIa03c7yKO2yAy8=;
	b=9f4jIC508FM1bGALIOZ5lf5M4u3ubt1omZiWSOotv0lFzENM5YMuI3fESAyOPtp4E53I3p
	B9xpG6XzPEPln5Bg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [BUG?] clang miscompilation of inline ASM with overlapping
 input/output registers
Message-ID: <20250602102825-42aa84f0-23f1-4d10-89fc-e8bbaffd291a@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

I observed a surprising behavior of clang around inline assembly and register
variables, differing from GCC.

Consider the following snippet:

	$ cat repro.c
	int main(void)
	{
		register long in asm("eax");
		register long out asm("eax");

		in = 0;
		asm volatile("nop" : "+r" (out) : "r" (in));

		return out;
	}

The relevant part is that the inline ASM has input and output register
variables both using the same register and the input one is assigned to.


Compile with clang (19.1.7, tested on godbolt.org with trunk):

	$ clang -O2 repro.c
	$ llvm-objdump --disassemble-symbols=main a.out
	0000000000001120 <main>:
	    1120: 90                           	nop
	    1121: c3                           	retq

The store of the variable "in" has been optimized away.


Compile with gcc (15.1.1, also tested on godbolt.org with trunk):

	$ gcc -O2 repro.c
	$ llvm-objdump --disassemble-symbols=main a.out
	0000000000001020 <main>:
	    1020: 31 c0                        	xorl	%eax, %eax
	    1022: 90                           	nop
	    1023: c3                           	retq
	    1024: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
	    102e: 66 90                        	nop

The store to "eax" is preserved.


As far as I can see gcc is correct here. As the variable is used as an input to
ASM the compiler can not optimize away.
On other architectures the same effect can be observed.


The real kernel example for this issue is in the loongarch vDSO code from
arch/loongarch/include/asm/vdso/gettimeofday.h:

	static __always_inline long clock_gettime_fallback(
						clockid_t _clkid,
						struct __kernel_timespec *_ts)
	{
		register clockid_t clkid asm("a0") = _clkid;
		register struct __kernel_timespec *ts asm("a1") = _ts;
		register long nr asm("a7") = __NR_clock_gettime;
		register long ret asm("a0");

		asm volatile(
		"       syscall 0\n"
		: "+r" (ret)
		: "r" (nr), "r" (clkid), "r" (ts)
		: "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7",
		 "$t8", "memory");

		return ret;
	}

Here both "clkid" and "ret" are stored in "a0". I can't point to the concrete
disassembly here because it is inlined into a much larger block of code
and removing the inlining hides the bug.
Also in my tests the bug only manifests for "_clkid" in the interval [16, 23].
Other values work by chance.
Removing the aliasing by dropping "ret" and using "clkid" for both input and
output produces correct results.

Is this a clang bug, is the code broken or am I missing something?


Thomas
