Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29767E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dcy6i7FRX4l5Gbr0LDQ+gwpAZaDUrfwf4W+C0zpF9zY=; b=XzjWAAubT+U3O39VOBD7COtuQo
	AOf9QP0iEkwskFRAAfV1kC1nLpuLSrszaEmxvEeuo990Q9Rq+UeITy/5G3WtlRuF3o3qfYIaeBMg8
	9b5IqKho5Nsp9pHrndUHstA+vAhdW1N4gLtDFYGzSWhrW3sU3ksbV2hW7dZIE0Iu9SxnUXBsl96L8
	WFOii/NhiO75NBOK1USoyAuejuWJw3374X7yUQfbvIaXOw3TUiA0GdfGvKdhdb5ECmh2wiG090taA
	8/54Ml179UxlGL7PyBjGIsxgu0iY+y8jASEmQaQtaWopJWnfSFOefldSo6UcC/yzTB650j52dVspG
	6LSRR++A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFDCR-0067Mf-Ps; Sat, 23 Jul 2022 11:21:36 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 01AA898016F; Sat, 23 Jul 2022 13:21:33 +0200 (CEST)
Date: Sat, 23 Jul 2022 13:21:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v3 20/20] x86: Add support for CONFIG_CFI_CLANG
Message-ID: <YtvZvYHC1BKzEz1p@worktop.programming.kicks-ass.net>
References: <20220610233513.1798771-1-samitolvanen@google.com>
 <20220610233513.1798771-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610233513.1798771-21-samitolvanen@google.com>

On Fri, Jun 10, 2022 at 04:35:13PM -0700, Sami Tolvanen wrote:

> +#ifdef CONFIG_CFI_CLANG
> +#define __CFI_TYPE(name)					\
> +	.fill 7, 1, 0xCC ASM_NL					\
> +	SYM_START(__cfi_##name, SYM_L_LOCAL, SYM_A_NONE)	\
> +	int3 ASM_NL						\
> +	int3 ASM_NL						\
> +	mov __kcfi_typeid_##name, %eax ASM_NL			\
> +	int3 ASM_NL						\
> +	int3 ASM_NL						\
> +	SYM_FUNC_END(__cfi_##name)
> +#endif

Like said on IRC yesterday, this doesn't generate the right mov
encoding.

	.byte 0xb8 ; .long __kcfi_typeid_##name ;		\

works. Your LLVM tree already has the ZExt patch you gave me yesterday
to fix up the linker fallout from this change.
