Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614952CA1
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UOz2viW0BElLS+TGumDBU674xDtw0fIIZshAd52tWL8=; b=cAjE6EEetAKPQUBol/TtVXPulw
	08Er2eRCrpxma2QIo9SCOucCehBGFepkEXVt71XUVdW5z1ep9esaa27U4ejHaDFPk0zwiNfgUJOsy
	xJB5Bt95AvLNehRAlc4fBNYy0SeTUNRve5/8LYc6ws1jnV6qIsPurgXVF5+trjM3m6X+79b5dM2yr
	AuQFeerlMjSK0nLe3CvG+XoynFDC54l6Y0gibnVPhYFKQ7DHTQLHgSifuqc01rGs5KiYqZ6gpJo3C
	SY/HvAkX/nJLyTsdNa/7XjF0s3H7H3PvkxuNM0Lc8k7z/u9pPBm/owRCKWKWKLk5JS+AR9esRKYHY
	WXhaqyVA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEqUT-00C02S-3T; Tue, 01 Feb 2022 10:34:25 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 061D898623E; Tue,  1 Feb 2022 11:34:24 +0100 (CET)
Date: Tue, 1 Feb 2022 11:34:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
	Ingo Molnar <mingo@kernel.org>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] stack: Introduce CONFIG_RANDOMIZE_KSTACK_OFFSET
Message-ID: <20220201103423.GT20638@worktop.programming.kicks-ass.net>
References: <20220131090521.1947110-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131090521.1947110-1-elver@google.com>

On Mon, Jan 31, 2022 at 10:05:20AM +0100, Marco Elver wrote:
> The randomize_kstack_offset feature is unconditionally compiled in when
> the architecture supports it.
> 
> To add constraints on compiler versions, we require a dedicated Kconfig
> variable. Therefore, introduce RANDOMIZE_KSTACK_OFFSET.
> 
> Furthermore, this option is now also configurable by EXPERT kernels:
> while the feature is supposed to have zero performance overhead when
> disabled, due to its use of static branches, there are few cases where
> giving a distribution the option to disable the feature entirely makes
> sense. For example, in very resource constrained environments, which
> would never enable the feature to begin with, in which case the
> additional kernel code size increase would be redundant.
> 
> Signed-off-by: Marco Elver <elver@google.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

For both patches:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
