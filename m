Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270991;
	b=Tg4p4Y4E4SukbztOjAjpH2NX6jWNf/MiYL7sk3f/BBa4zvLsCA3eAtQC3i2YbRH3cOr3
	 plGI9LhXBnOtvI0n80q6TZ/GB0kL/oqLcA81zfhTPTnQcYLLE54xJYE+CYSJHTT8AjShi
	 AEzSYzhxJUJU+lkTn5nS13PKTkQCJqCo2k8cxrTYBKqtcswtJveBt5ScIm+2TPTrAHDRY
	 eZDT2By7G+dLWVHdeH0NPlXlGS5RWUftk9d2q3M5p5GU4Ri1lfT466qT78KdvLhd2x00b
	 ITeFPIbOa94DAR3J2qmkZS7K7HtRuyEoDwmtlh0siyafmoAgjURzTLslTrFW7XdFsTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270991;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/NhbA9fB5U0zgiVf8m+1gQo2k4PXkduqYRS0YylKnto=;
	b=0qjb+rnS9pPvPvkMw5wMVqR/RK2BoXnIXn74AnMY/TicRR2Q5zweFM61wxX2hGE/uODI
	 wuGRaqxXXmS92/F5JRIBJprN32Y+fDhw1JzZGJBFTrCaIZZyWdMKExtTVEIIm93so725t
	 AmnwrJu/rvxe+QtCs6QygVKGBmbXVHPwBFgjW9CK1VxCl+TdbhqJHEauMJGaCse9Ll5Bq
	 3G/+izHy2ImX9i777Q4CyBMkwYWQVs1zzeSHa6Kmp2MHo6LIXCR35fbl9WdaFmJprL1y7
	 +dB8R0rI60NZZEOiB2vS/py5bl1aCQmpFhEbQbBU7CNZc3E2jKP5tQ9puyQTw+pYXpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=K6vCzeVO;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2DD606A31A;
	Thu, 29 Oct 2026 10:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=K6vCzeVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/NhbA9fB5U0zgiVf8m+1gQo2k4PXkduqYRS0YylKnto=; b=K6vCzeVOYegO/VWfbMUjaFtVYv
	Thr+m6GPq0yoSEJrAdcB/w+EXKbas2sw6IT1GV7gOgkftDPIvTHC2BLIkn+aINsTW+uDYDIAKNyKZ
	uKgnzh/AtSkyh7odod9r+Kv4Hp8Bb5vwB9dXnTrH+cLFc0vHo+iCyp4HV+xIXlpovf+EzgQEHrwPB
	X6QeDP8yzOGcVYt7DbrP8knK2APIfRwP7utmCw4zkmudc2oMJQi65Cgpw0emHZuVY0B+1T1u1RtRO
	RvSPjx9u15e7Qi48WLFB+KpfHoTnDQx+kvBY2AzbtxLIx0rLErYr9v8d4QARpgAtqDlvm6spjN+EW
	ybyHwxHQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNhT-0000000GsxF-3Ajq;
	Thu, 29 Oct 2026 10:49:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AE302300312; Thu, 29 Oct 2026 11:49:38 +0100 (CET)
Date: Thu, 29 Oct 2026 11:49:38 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>

On Thu, Oct 29, 2026 at 03:27:23AM -0700, Breno Leitao wrote:
> Linus' commit 1e3ad78334a6 ("x86/syscall: Don't force use of indirect
> calls for system calls") dispatches system calls with a switch
> statement, so that syscall entry has no indirect branch for BHI to
> target.
> 
> As noted by Linus in the commit above, the compiler can either
> decide to generate an indirect jump, or just a series of conditional
> branches (which is more expensive).
> 
> With CONFIG_MITIGATION_RETPOLINE, clang emits no indirect jump, and the
> switch becomes a tree of compares and conditional branches. That code is
> built in, so a kernel booted with mitigations=off still walks the tree
> on every system call.
> 
> When neither the Spectre v2 nor the BHI mitigation is enabled, nothing in
> the kernel protects indirect branches, and the switch buys nothing. Use a
> static key to call through sys_call_table[] in that case.
> 
> The compiler emits that call through a retpoline thunk, which boot-time
> patching turns into a plain indirect call when retpolines are off.
> 
> On next-20261028 built with clang and booted with mitigations=off on a
> Xeon Gold 6138 at a fixed 2.0 GHz, perf bench syscall basic (getppid)
> and getpgid. Mean and standard deviation of 30 to 45 runs over 2 to 3
> boots, and kernel instructions and cycles per call from perf stat:
> 
>                          CPU_MITIGATIONS=n  =y              =y + patch
>   getppid()  ns          131.2 +- 0.2       134.1 +- 0.1    131.7 +- 0.4
>              insns/cyc   310 / 212.1        331 / 218.1     314 / 213.1
>   getpgid()  ns          129.8 +- 0.3       132.5 +- 0.2    130.0 +- 0.5
>              insns/cyc   302 / 209.4        323 / 214.1     306 / 209.8
> 
> Kernels that enable either mitigation keep the switch, behind one extra
> jump.
> 

Bah, this reminds me I still have these patches:

 https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=x86/syscall

which make your patch impossible. The reason for not dispatching through
the syscall table is that syscall hijacking becomes a _LOT_ more
difficult.


