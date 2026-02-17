Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276732DAFBB
	for <llvm@lists.linux.dev>; Tue, 17 Feb 2026 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319342; cv=none; b=S90us4FQjGwyWK/DsjKCTC8qtIc++CwsjQk8K16qtGkYLwkNyEuDoVB/J6e2L8kv0sbsQvDoqicFiGGgH65u3JNbbZ4LLuVom6Gw0+dI7b2hpNBqPs9B1mz5lJtZO8fldsTzbVaAFRRkFgP8ydJCsjXpF68h3cHL81KWDHyzmOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319342; c=relaxed/simple;
	bh=hc7N3Hcz2X1ERffhBC9n5L1mAQXuOg1k5MmQ97v6PY8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TaSA/F36LsjvfPUkP0zn8czSZE0scHYRRRIX+qQ7LZN6SDWF8U3E/1p6d4tXDtoHQUMX2JRhZbCXWu14letjEyMdpv8F9ebfHskT2SKgVODfklEs1+po5HFbqcg6pX6LZ8AOtp3kZGSII44xNYuqVcOkCKC+YeXQIpPOUiR06YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=TxmyFYIy; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="TxmyFYIy"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 61H98LiM3055521
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 17 Feb 2026 01:08:22 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 61H98LiM3055521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1771319303;
	bh=vjRO4TtNWvyR02oaKkmAKR3Kd+Qq4ZOBV0gsjr9Brp8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TxmyFYIyLIzuk1O/nhygllYsy9F+CktOZJXrBrHGBin9AcwbDreQvm93ujCZLREw2
	 Z9LfLYSm5ZBFbY33ciOKiYJYto4bGff7GhywCpFwb/0EWivP0zZ+zJfXevNlzsGSFS
	 fRM0O0EFNQmRh+h2kA5XnXagiPCt+4tUIloxxgPv3H143tiyIUioiz9Psp7GWOIOxh
	 zKQSLhZsuBbyRCH7vLEcKEr6Q+Rsxu45dFjbzzmbEIkw7CkKSUNNaEhMyLjBeX91Do
	 r+NRH6Tap1SSwBKpDsaITpN2E5RsGVIapum8NWDVELBodJryrW+XughfPEbNoA9BNb
	 /h2zzH6t68UrQ==
Date: Tue, 17 Feb 2026 01:08:16 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Marcel W. Wysocki" <maci.stgn@gmail.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, "Marcel W . Wysocki" <maci.stgn@gmail.com>
Subject: Re: [PATCH] x86/vdso: use calll mnemonic for 32-bit vdso calls
User-Agent: K-9 Mail for Android
In-Reply-To: <20260215142834.1455794-1-maci.stgn@gmail.com>
References: <20260215142834.1455794-1-maci.stgn@gmail.com>
Message-ID: <6414B894-EAE2-4E7E-A5BE-98E81462E8EC@zytor.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 15, 2026 6:28:34 AM PST, "Marcel W=2E Wysocki" <maci=2Estgn@gma=
il=2Ecom> wrote:
>The VDSO32 fallback functions use unsuffixed "call" in inline asm
>that is compiled in 32-bit mode (-m32)=2E  In AT&T syntax, the
>unsuffixed "call" is ambiguous -- the assembler must infer the
>operand size from context=2E
>
>While both GNU as and the standard LLVM integrated assembler handle
>this correctly in practice, the unsuffixed form is inconsistent with
>other 32-bit assembly in the kernel tree (arch/x86/boot/header=2ES,
>arch/x86/boot/copy=2ES, arch/x86/realmode/rm/wakeup_asm=2ES) which
>already uses the explicit "calll" mnemonic=2E
>
>More importantly, alternative LLVM-based toolchains (e=2Eg=2E zig cc)
>contain a separate assembler implementation that rejects unsuffixed
>"call" in 32-bit inline asm context, preventing VDSO32 compilation
>entirely=2E
>
>Use "calll" -- the canonical AT&T mnemonic for a 32-bit near call
>-- to match existing kernel convention and ensure compatibility
>with all LLVM-based assemblers=2E
>
>No object code change: "call" and "calll" produce identical machine
>code (opcode E8h with 32-bit relative displacement) on all tested
>assemblers (GNU as, LLVM 21, LLVM 20)=2E
>
>Signed-off-by: Marcel W=2E Wysocki <maci=2Estgn@gmail=2Ecom>
>---
> arch/x86/include/asm/vdso/gettimeofday=2Eh | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/arch/x86/include/asm/vdso/gettimeofday=2Eh b/arch/x86/includ=
e/asm/vdso/gettimeofday=2Eh
>--- a/arch/x86/include/asm/vdso/gettimeofday=2Eh
>+++ b/arch/x86/include/asm/vdso/gettimeofday=2Eh
>@@ -101,7 +101,7 @@
> 	asm (
> 		"mov %%ebx, %%edx \n"
> 		"mov %[clock], %%ebx \n"
>-		"call __kernel_vsyscall \n"
>+		"calll __kernel_vsyscall \n"
> 		"mov %%edx, %%ebx \n"
> 		: "=3Da" (ret), "=3Dm" (*_ts)
> 		: "0" (__NR_clock_gettime64), [clock] "g" (_clkid), "c" (_ts)
>@@ -118,7 +118,7 @@
> 	asm (
> 		"mov %%ebx, %%edx \n"
> 		"mov %[clock], %%ebx \n"
>-		"call __kernel_vsyscall \n"
>+		"calll __kernel_vsyscall \n"
> 		"mov %%edx, %%ebx \n"
> 		: "=3Da" (ret), "=3Dm" (*_ts)
> 		: "0" (__NR_clock_gettime), [clock] "g" (_clkid), "c" (_ts)
>@@ -136,7 +136,7 @@
> 	asm(
> 		"mov %%ebx, %%edx \n"
> 		"mov %2, %%ebx \n"
>-		"call __kernel_vsyscall \n"
>+		"calll __kernel_vsyscall \n"
> 		"mov %%edx, %%ebx \n"
> 		: "=3Da" (ret)
> 		: "0" (__NR_gettimeofday), "g" (_tv), "c" (_tz)
>@@ -153,7 +153,7 @@
> 	asm (
> 		"mov %%ebx, %%edx \n"
> 		"mov %[clock], %%ebx \n"
>-		"call __kernel_vsyscall \n"
>+		"calll __kernel_vsyscall \n"
> 		"mov %%edx, %%ebx \n"
> 		: "=3Da" (ret), "=3Dm" (*_ts)
> 		: "0" (__NR_clock_getres_time64), [clock] "g" (_clkid), "c" (_ts)
>@@ -170,7 +170,7 @@
> 	asm (
> 		"mov %%ebx, %%edx \n"
> 		"mov %[clock], %%ebx \n"
>-		"call __kernel_vsyscall \n"
>+		"calll __kernel_vsyscall \n"
> 		"mov %%edx, %%ebx \n"
> 		: "=3Da" (ret), "=3Dm" (*_ts)
> 		: "0" (__NR_clock_getres), [clock] "g" (_clkid), "c" (_ts)

The "calll" instances you are pointing at are in *16-bit* code, which ther=
efore need the extra l suffix=2E
