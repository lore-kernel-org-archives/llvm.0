Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCBA3921C7
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546141; cv=none; b=lWtN5VPlKZN+VouLvlmEgH29AbLRv1Mk/1p7X8KDJg8fdvaZvih0I5vX9bsbOaMDkFfMZnEbsrgoXbG1n4Wv9javeiCMjbL1BZXxi2JAflNayqircWnSE0VanMCDrNhQ6WgF8ZabO6OI4wmnW0gOqcMXdi6tHS4m25mCOOR7JKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546141; c=relaxed/simple;
	bh=bppB/h3Z5J342NzpmUMAPQd/fD8oY6yWw6XBNpZTEOs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sJagExtfEGQojFfcfRbTcITD1opLcLW2gfnYCmANBMlpUoJwNcQfnV6rCFXQ2fOw/dYVmG4tphZvOH24zVE5XRLMm0rjwGMS5beiE95OldfN9Y/aWuFpbePo82mF/ZcGq6kcMzoTebl1d3TxQvTumx+tmMOojhfq1oRL5C4EshM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OV5cZRu/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3KEWudwq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OV5cZRu/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3KEWudwq"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775546138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iUFp+O5EtBAiEaUUWnqZaZkuO8VjWkhg5QNOTwvremo=;
	b=OV5cZRu/Gww7Ff+EMZDyC/de8sRB24qQsA+lN8H6qbntBmYXpZLdzV0lHG8u37u2wDM8VA
	1htROkf/O7YbbMJVmhqofGSkZwRb2ZEGGrxJo+xGJ56+mjnRSLdcD3E3YvTE1vqDLIXv1w
	gIN+DL83FbBOqJ/TnVDDqnaeC3ikkR/B6NBXA4eOQtHyl0i7iSME3BLYHQV74f7khVA43O
	TseePlh9SKSBOe1gFLJnTP95rtTZc3kMHrATcVQRNaBMaZbDekYG8jpcJegOAVZSGnYFg/
	zVjGkiy7/3Qi5OfJYQt2PIWtLaIelYpGuY3ETYo283fVNIBOAtRJAVQVL4g7Pg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775546138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iUFp+O5EtBAiEaUUWnqZaZkuO8VjWkhg5QNOTwvremo=;
	b=3KEWudwqnkedlRGGf1CsSEHnWvY3mWEzZ82YB0LL6OrC9KgURmSKCHBhmSaaoDoIiRA1xx
	9ezsHPtAVV6qPsCA==
To: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] riscv: Define
 __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START
In-Reply-To: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
References: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
Date: Tue, 07 Apr 2026 09:15:37 +0200
Message-ID: <87zf3f44x2.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nathan Chancellor <nathan@kernel.org> writes:

> After commit 67bdd7b01387 ("riscv: Split out measure_cycles() for
> reuse") and commit c03ad15f7cf6 ("riscv: Reuse measure_cycles() in
> check_vector_unaligned_access()"), there are CFI failure when booting
> kernels with CONFIG_CFI=y:
>
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_words_unaligned+0x0/0x50; expected type: ...)
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_vec_words_unaligned+0x0/0x24; expected type: ...)
>
> The __riscv_copy_*_unaligned() functions are now called indirectly but
> they are not defined with SYM_TYPED_FUNC_START, which is required for
> assembly functions called indirectly from C to pass CFI checking. Switch
> to SYM_TYPED_FUNC_START to clear up the CFI failures.
>
> Fixes: 67bdd7b01387 ("riscv: Split out measure_cycles() for reuse")
> Fixes: c03ad15f7cf6 ("riscv: Reuse measure_cycles() in check_vector_unaligned_access()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nam Cao <namcao@linutronix.de>
