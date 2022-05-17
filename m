Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97F10E8
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1SCVVAHtClu+1FWsc5YTD1Uvr3wge/WoMABPfJaW99k=; b=qEhWpebbnSLca20mptfUhLsTth
	WXioCEDPccsX+uQXKR/gNXlIgWiHbdAeMKWBC3RPXtj8U/eKff585U7QCd1O5daXFEFQ8cMp4Jl4Y
	6ucOdd0e7zRlMc01/8mnuXEB9tmsngezC8p/5pk9TFs2YmKQdEqDtsqWWnRQmBq9dguXgThGChB1d
	eQYTYGwlTANRuZ2lZoacSC6p8jTaNBMV8GcGpbFTkueKbBRe9G/nL8HwoZKXzSvDfcYpSHubktF8/
	gh5FDjm/ukuL1HUi7uRaJ/Oe4G1cyieglJHOgoA76LSOPxolv74x2YPVA5V5/JIZvN7bSKmCmB+e4
	uM8I4f7w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqt1c-001BZn-V9; Tue, 17 May 2022 08:57:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3367130018E;
	Tue, 17 May 2022 10:57:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 18EBE2023D0E2; Tue, 17 May 2022 10:57:50 +0200 (CEST)
Date: Tue, 17 May 2022 10:57:50 +0200
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
Subject: Re: [RFC PATCH v2 00/21] KCFI support
Message-ID: <YoNjjjb3ygIKnwfj@hirez.programming.kicks-ass.net>
References: <20220513202159.1550547-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-1-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:38PM -0700, Sami Tolvanen wrote:
> KCFI is a proposed forward-edge control-flow integrity scheme for
> Clang, which is more suitable for kernel use than the existing CFI
> scheme used by CONFIG_CFI_CLANG. KCFI doesn't require LTO, doesn't
> alter function references to point to a jump table, and won't break
> function address equality. The latest LLVM patch is here:
> 
>   https://reviews.llvm.org/D119296
> 
> This RFC series replaces the current arm64 CFI implementation with
> KCFI and adds support for x86_64.

You have some weird behaviour vs weak functions (I so hate those)...

100: 0000000000000980     9 FUNC    LOCAL  DEFAULT    2 __cfi_free_initmem
233: 0000000000000989    35 FUNC    WEAK   DEFAULT    2 free_initmem

With the result that on the final link:

   179: 00000000000009b0     9 FUNC    LOCAL  DEFAULT    1 __cfi_free_initmem
  8689: 00000000000007f0     9 FUNC    LOCAL  DEFAULT   65 __cfi_free_initmem
173283: 00000000000007f9   198 FUNC    GLOBAL DEFAULT   65 free_initmem

This is getting me objtool issues (I'll fix them) but perhaps it's
something you can do something about as well.
