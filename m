Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16867E
	for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Au1HGF148lMOJhXl55fVMciphrL5/N0EfS5Fnj76E4g=; b=mEliRrXDDk8Kw7VHKsS5hSUMl4
	ldXJVGmCkr1vlznPtsLVyufPQRpdwWxbJM26bCbyLMFDA3DfDM9Vx3J6/4xa1hdXg4VdA3liP6QUJ
	iE+k/ZYn0JdTpTNJMmmyk0C/xKYHNJyvhhZmIZ6lwsVaZ2gf8LNalXxtYHYs5VU0FUbu+RYWkXTC5
	nrKgc2Yu69XwE5JDSshFTh25FCuHs9C9VIoZryu2Dp/TjpDrdk3AuJEUlxVt85SRX/rg6bWUqBVz7
	quaURGsRd8ujKm5fVJoli/YWMw7eYbdehGoUQDiJEuBPFN5M0E+SWJVfOxQKUjRKWqkYV7CUdMUJs
	abDFoBaA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrjY-00EfR9-1y;
	Thu, 13 Apr 2023 07:51:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F0FCE30002F;
	Thu, 13 Apr 2023 09:51:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id D5214235CC4A0; Thu, 13 Apr 2023 09:51:06 +0200 (CEST)
Date: Thu, 13 Apr 2023 09:51:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: ndesaulniers@google.com
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] start_kernel: omit stack canary
Message-ID: <20230413075106.GE4253@hirez.programming.kicks-ass.net>
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>

On Wed, Apr 12, 2023 at 11:32:11AM -0700, ndesaulniers@google.com wrote:

> Nick Desaulniers (2):
>       start_kernel: add no_stack_protector fn attr
>       start_kernel: omit prevent_tail_call_optimization for newer toolchains
> 

Your second patch has a vile comment style :-)

Other than that,

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
