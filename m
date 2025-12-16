Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F4378315;
	Tue, 16 Dec 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890134; cv=none; b=eqnmW73obpA8nuYxlBW9Bq3KwuqYTK1H3gzgJb8jgnNXIPzdHC2DMdN5DBo0dPM9ViIh93ujlGeH5zqY6deeHiECKYStavF8vryVFaXSxvkjZwpTR0LDuUQQ00/i117TgiGnBHITjG2lqVYtv9U8NI0yyx+o8EUzS67raXH2DFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890134; c=relaxed/simple;
	bh=DMLtQbxUI7NEx9MJ7RqpkZDg2r9em8LjHV/h/bFkfoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBCJZaM4DtwB7pMA/8FErHbOKW+jI7KUR32DZlv8k0s4DVvRmofMqGLcITuM3o8CA23EmTIHXj6IBOeoWUhSI6K/QNTEs3GwD7SUflE/Aa3BKN1WKvD0VGeCpWr0XzMVCwyQD4n7g5Nq7Di7119kUoev5sBS+9c0pJDmYE8eTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S0RX8SpS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S0RX8SpS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QyaIMcuVfmEkqkRegR+RjMZ6wei1xBk2KIGiuOrqh3Y=; b=S0RX8SpSPRgf5LuAPkeYTO+6Je
	FKMSD6cQKRQWKclVrVpdHGICjErYKxb2gM0hOxaSTgavbDrdrlxVVgYX6xdKWAN+/Jvv0DwZFSu1h
	zMzfQCkizmhmX/dXobuV80+LxgpvJ5zUwtMTKoYflt+7+n765ZMt3Exv6QEcJrXys5fMkHbk78wTH
	iWg9H5ZIEJrcffhRvJAQTxvzdbnoZ5Wk/1alQ/wG2rO/9aFYPTEGQbwk4MGC4I754HAVfEthrzlHv
	/0VODtr5AsLMwTyb0aVd+N3idn9OFSXoXJWjDArTSQfrPYgA/Soc4vRSc+5jLg9yewHND8nSxUB2v
	RwG7Nz4Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUge-00000003Ixr-3VMp;
	Tue, 16 Dec 2025 13:01:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C2B33300220; Tue, 16 Dec 2025 14:01:55 +0100 (CET)
Date: Tue, 16 Dec 2025 14:01:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/3] kasan: mark !__SANITIZE_ADDRESS__ stubs
 __always_inline
Message-ID: <20251216130155.GD3707891@noisy.programming.kicks-ass.net>
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
 <20251216-gcov-inline-noinstr-v3-1-10244d154451@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-gcov-inline-noinstr-v3-1-10244d154451@google.com>

On Tue, Dec 16, 2025 at 10:16:34AM +0000, Brendan Jackman wrote:
> The x86 instrumented bitops in
> include/asm-generic/bitops/instrumented-non-atomic.h are
> KASAN-instrumented via explicit calls to instrument_* functions from
> include/linux/instrumented.h.
> 
> This bitops are used from noinstr code in __sev_es_nmi_complete(). This
> code avoids noinstr violations by disabling __SANITIZE_ADDRESS__ etc for
> the compilation unit.

Yeah, so don't do that? That's why we use raw_atomic_*() in things like
smp_text_poke_int3_handler().
