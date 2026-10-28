Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196712;
	b=ndsfwL4iklh3LjrSCEmN7dXExfsF+5WcfgFxG2mwvKb7X/9DrK6NrhF5zNgS2+2eo5oq
	 /ayl6F8mqbll0C5UXT7jZ95I0uMs0aDQG3p3agUNxp6YugBHTkBAi4S68Q04kLLSkgIrI
	 5qK0aFW2VPetyl/RgMmMbGrxosSb/9LpscmFoBL0ZP8gfo9Jk8YfQanXYT3iL2YT7SdwL
	 B6X6QG6uxsi2/8mAimLGvSbOQb6tEIMnalH2ilVzu9kKExm6Bhd5PzD06Z+OCJeH/od1k
	 vo6C4IMfAh7XrogDeHlC+tzr6d3RL81HVTA6ZxHuSlK70e2mkFN1aKoep8+e9zBrgBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196712;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JBajJS2Cb5COg7/6bYodYxyuwbqhfYKEOKgSd/X0w/Y=;
	b=zfUuG3nXONN8HfJ/DVaqk8uFYnv3d5By6AJ7KKtM4eN31YZYVitt6nR4lAF2b4HnoWPA
	 ePtJzFQWGfaO4fOmT4OxAQDblHpL/ze8r3DRaW/O7uZy2J6a+eiGo642EgXfm3y1SxW7i
	 Dz8LgoUsEFdAJLwTafdGIj3hwhEQUPK8NdJSam0KaH2T7YqZPLS7Y6zrZewK0/f9RnT70
	 Wal8tEvWutWPqcT3Ux3PWsS649C9tPv3z5GasLVo+poaH7oSkUvF/CdTtxxiRBB3IoFv0
	 UrWPMlDWglVecyBgesbv2kL0+WUREM+od+uRmGRxWSedz3djDokyJ03dmwiXDzIxcPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YO0Upq03;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A44606A31D;
	Wed, 28 Oct 2026 14:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A44606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=YO0Upq03
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JBajJS2Cb5COg7/6bYodYxyuwbqhfYKEOKgSd/X0w/Y=; b=YO0Upq035Shjp6fT/zLdHvtzR2
	yJiEKxsEFo7wGGeZBLsHKaP+BK6T30CqkgpqGUW2+abqosz1W72rnwyCR04n4P2wg1mlHhz2BElSW
	O6cw9kp87nERS4Z+6BVydoMcJG9TUpPc3qX3HxGQTjij/V8edp2VnTC7p4AC/CKaEOj8Nl7fQfkE7
	YCgA8i5iCimmfsji+adFFENTeImUeSPAuerjF1xR8FZOya3wLMcV+F8p35DaOJ6ILIro8BYtLtT9/
	BGyC4+ewhQjNEbTMSpjzRfoTXS74GiYO1v5j8dKKHW0rXZ3BslbQfAiwHPbu5jYdtlb4CJXqy/fEW
	qOorq8Cw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4NY-00000003xkc-3REh;
	Wed, 28 Oct 2026 14:11:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6050030030F; Wed, 28 Oct 2026 15:11:48 +0100 (CET)
Date: Wed, 28 Oct 2026 15:11:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [RFC PATCH 11/20] objtool: Detect code coverage instrumentation
 in noinstr code
Message-ID: <20261028141148.GT2668564@noisy.programming.kicks-ass.net>
References: <20261028120034.871983-1-sashal@kernel.org>
 <20261028120034.871983-12-sashal@kernel.org>
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
In-Reply-To: <20261028120034.871983-12-sashal@kernel.org>

On Wed, Oct 28, 2026 at 07:59:35AM -0400, Sasha Levin wrote:
> gcov and Clang's source-based code coverage update their counters
> inline, rather than by calling into a runtime like KCOV does, so
> coverage instrumentation in noinstr code goes unnoticed by the noinstr
> validation of call destinations.
> 
> Flag instructions in noinstr code, outside of instrumentation_begin()
> and instrumentation_end() sections, that reference coverage counters:
> GCC's __gcov<N>.* counters (including the MC/DC counters), Clang's gcov
> __llvm_gcov_ctr* counters, and the __llvm_prf_cnts and __llvm_prf_bits
> sections of Clang's source-based code coverage.

Nice!

> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/objtool/check.c | 53 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 464f6c9d9ff0b..6382d2a44ef2b 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #define _GNU_SOURCE /* memmem() */
> +#include <ctype.h>
>  #include <fnmatch.h>
>  #include <string.h>
>  #include <stdlib.h>
> @@ -3507,6 +3508,52 @@ static inline bool noinstr_call_dest(struct objtool_file *file,
>  	return false;
>  }
>  
> +/*
> + * Code coverage instrumentation (gcov, Clang's source-based coverage) updates
> + * its counters inline rather than through calls, so it can't be caught by
> + * checking the call destinations of noinstr code.
> + */
> +static bool is_coverage_counter(struct symbol *sym)
> +{
> +	if (!strcmp(sym->sec->name, "__llvm_prf_cnts") ||
> +	    !strcmp(sym->sec->name, "__llvm_prf_bits"))
> +		return true;
> +
> +	return (strstarts(sym->name, "__gcov") && isdigit((unsigned char)sym->name[6])) ||
> +	       strstarts(sym->name, "__llvm_gcov_ctr");
> +}
> +
> +static bool insn_updates_coverage(struct objtool_file *file,
> +				  struct instruction *insn)
> +{
> +	struct symbol *sym;
> +	struct reloc *reloc;
> +
> +	for (reloc = insn_reloc(file, insn);
> +	     reloc;
> +	     reloc = find_reloc_by_dest_range(file->elf, insn->sec,
> +					      reloc_offset(reloc) + 1,
> +					      insn->offset + insn->len -
> +					      (reloc_offset(reloc) + 1))) {
> +
> +		sym = reloc->sym;
> +		if (!sym->sec)
> +			continue;
> +
> +		if (is_sec_sym(sym)) {
> +			sym = find_symbol_containing(sym->sec,
> +						     arch_insn_adjusted_addend(insn, reloc));
> +			if (!sym)
> +				sym = reloc->sym;
> +		}
> +
> +		if (is_coverage_counter(sym))
> +			return true;
> +	}
> +
> +	return false;
> +}

Since you can have many relocations to the same symbol; does it make
sense to cache the results of those many strcmp()s in symbol::coverage
or something? We have plenty bits left in struct symbol.

> +
>  static int validate_call(struct objtool_file *file,
>  			 struct instruction *insn,
>  			 struct insn_state *state)
> @@ -3680,6 +3727,12 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
>  	if (statep->noinstr)
>  		statep->instr += insn->instr;
>  
> +	if (statep->noinstr && statep->instr <= 0 &&
> +	    insn_updates_coverage(file, insn)) {
> +		WARN_INSN(insn, "coverage counter update in .noinstr.text section");
> +		return 1;
> +	}

Perhaps merge with the previous conditional?
