Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345417F
	for <llvm@lists.linux.dev>; Mon,  7 Nov 2022 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Dk7D5GNByBuvuPPi4PFa4tRtZJvVZGoQcwk/cPBxzJU=; b=q9YQeKn6k8ydbmUSTD90VE53pX
	GYqMAUqtf8RdGc7RNLU58nnY9LU/Xwi0O44lZvF9igWnPQ6Coij/j7zk5AHkpDYtuEceaS06QG8hH
	p+CXzrD9+5j6BONSuSLe+2yQKeKwnAgzsmqjlXAoQCfpbQBgi++jLlag7+HtkD5s8k5vAasNzmTyu
	kmixoYScwf7X4GTqTlV07DjQQKDM+kb93VxSrOudbfy49BwSjZhzRysT21PLQs1bvqoy9KLtEERnq
	x1KRnWFShUWL72vFmS7+95xvg/ARJ5mE+t0g6gZzYDlvxo6Byxbe7DY+wsLbb3iTUoso2UljY6xw7
	5oxKBb8g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryav-009G81-RC; Mon, 07 Nov 2022 09:39:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E7F76300338;
	Mon,  7 Nov 2022 10:38:59 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 526F4200F9777; Mon,  7 Nov 2022 10:38:59 +0100 (CET)
Date: Mon, 7 Nov 2022 10:38:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>, llvm@lists.linux.dev,
	Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v1 1/2] x86/asm/bitops: Replace __fls() by its generic
 builtin implementation
Message-ID: <Y2jSMz4GtXGJk6rS@hirez.programming.kicks-ass.net>
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
 <20221106095106.849154-2-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106095106.849154-2-mailhol.vincent@wanadoo.fr>

On Sun, Nov 06, 2022 at 06:51:05PM +0900, Vincent Mailhol wrote:
> The builtin implementation is better for two reasons:
> 
>   1/ it saves two instructions on clang (a push and a stack pointer
>      decrement) because of a useless tentative to save rax.

I'm thinking this is the same old clang-sucks-at-"rm" constraints and
*really* should not be a reason to change things. Clang should get fixed
already.

>   2/ when used on constant expressions, the compiler is only able to
>      fold the builtin version (c.f. [2]).
> 
> For those two reasons, replace the assembly implementation by its
> builtin counterpart.
> 
> [1] https://elixir.bootlin.com/linux/v6.0/source/include/asm-generic/bitops/builtin-__fls.h
> 
> [2] commit 146034fed6ee ("x86/asm/bitops: Use __builtin_ffs() to evaluate constant expressions")

I would much prefer consistently with 146034fed6ee.
