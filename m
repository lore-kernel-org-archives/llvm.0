Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA6774076
	for <llvm@lists.linux.dev>; Sun, 25 Aug 2024 12:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724587951; cv=none; b=tw3w4rMnheAG5lQxhbG0hJArBcQ84GtbjC3DHku6xMGVydP4zVcsema5EcSTmPKiyG3IU696suvroSsGYXvULcJ4YBU2rle1J0QiZklENp9xU2CzJFwWMz8QBtYw52wYSUzqUO2mQzGMLOyRcMjt5Af3GB+sNMaGS46gr9ER7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724587951; c=relaxed/simple;
	bh=D7uIUkqdvy06evqcOOap+ibcf1+dWnSSdC1uvDXmmBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c4IKai2+0b+l7l+goHkLI7kCuBRrt8rHE5xVeMkbrkZdBUZJkXPgfuVKLf22L5tBbsnuEq0SnjKb49vV6R9IkkdKc724Q34k5E5wZ6q08DdzYZ94bkRzUVN8lheGSnslyymhv3BLAvGrd0x33irqVI94KHIc8QRyV4JI5IHXUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RriSFBj2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CMp1ks+T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RriSFBj2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CMp1ks+T"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724587948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asbg7BYlj4ZFgiVrwgb1Wswlv6diZDiLLgBcqea48xc=;
	b=RriSFBj2vDDUs2J9MepRaX1WU4HV5T31ItjTQdAPICrFKbnSbJKqI6ghRbD9nepkX0MQTp
	B8MVoOiYVT9zlJS9xBNMdvBUimnGoQkuPqkCtfWVVzOchRNU9SMDupjEjOexXpol0/tbnH
	G06poRLAw9E5XsaxTg34bKYKBPSCh4Q5AE/85Hg2vxlVUCvhHcwtE4t0Uhopt1k1CIFkRf
	ceQibitytHaEPhbMJxnrIvpeQC07fgsyLoOYvRwcyKZdvsE2WTuNcWbe17QvxXCG4E3ZCk
	UQsoIqX+Hl350cnsNW4Gsu4MpoA61jdwQWsILSel4Ttv7wEY9j24TWETTpcDLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724587948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asbg7BYlj4ZFgiVrwgb1Wswlv6diZDiLLgBcqea48xc=;
	b=CMp1ks+TWlx6LMjmObNiYxsYpvfW1kxsSLXGKg6bqsPEM0EA/xzXuJ7hDSi56zSOsJgCmE
	JubKYVxuspFiVbAA==
To: Wentao Zhang <wentaoz5@illinois.edu>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org
Cc: wentaoz5@illinois.edu, marinov@illinois.edu, tyxu@illinois.edu,
 jinghao7@illinois.edu, tingxur@illinois.edu,
 steven.h.vanderleest@boeing.com, chuck.wolber@boeing.com,
 matthew.l.weber3@boeing.com, Matt.Kelly2@boeing.com,
 andrew.j.oppelt@boeing.com, samuel.sarkisian@boeing.com, morbo@google.com,
 samitolvanen@google.com, masahiroy@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, luto@kernel.org,
 ardb@kernel.org, richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net, arnd@arndb.de, rostedt@goodmis.org,
 mhiramat@kernel.org, oberpar@linux.ibm.com, akpm@linux-foundation.org,
 paulmck@kernel.org, bhelgaas@google.com, kees@kernel.org,
 jpoimboe@kernel.org, peterz@infradead.org, kent.overstreet@linux.dev,
 nathan@kernel.org, hpa@zytor.com, mathieu.desnoyers@efficios.com,
 ndesaulniers@google.com, justinstitt@google.com, maskray@google.com,
 dvyukov@google.com
Subject: Re: [RFC PATCH 2/3] kbuild, llvm-cov: disable instrumentation in
 odd or sensitive code
In-Reply-To: <20240824230641.385839-3-wentaoz5@illinois.edu>
References: <20240824230641.385839-1-wentaoz5@illinois.edu>
 <20240824230641.385839-3-wentaoz5@illinois.edu>
Date: Sun, 25 Aug 2024 14:12:27 +0200
Message-ID: <878qwkg5sk.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Aug 24 2024 at 18:06, Wentao Zhang wrote:

The subject line is really not useful. What's 'odd' code?

> Disable instrumentation in the same areas that were disabled for
> kernel/gcov/

> Signed-off-by: Wentao Zhang <wentaoz5@illinois.edu>
> Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>

This Signed-off-by chain is broken. See Documentation/process/

> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index 9cc0ff6e9067..2cc2c55af305 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -57,6 +57,7 @@ KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
>  KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
>  KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
> +LLVM_COV_PROFILE := n

See 7f7f6f7ad654 ("Makefile: remove redundant tool coverage variables")

Also a 'git grep GCOV_PROFILE' shows way more places. Can't LLVM_COV
just use the already existing GCOV_PROFILE annotations or is LLVM_COV
suitable for all the files which have been excluded for GCOV?

GCOV has GCOV_PROFILE_obj.o, GCOV_PROFILE and CONFIG_GCOV_PROFILE_ALL
for a reason, no?

Thanks,

        tglx
