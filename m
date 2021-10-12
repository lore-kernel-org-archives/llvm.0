Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23172
	for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 08:47:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9111161050;
	Tue, 12 Oct 2021 08:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634028426;
	bh=RwI+4/mNu7kHzEY5nASHdnF3vRm2cNh3JaAEODmnuGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZnuBK2rBoXvpsq3AAJbdgxZW3nN6jiZnyWCheauxqDteyp8OnmqRQEXOrPsxsyYVP
	 fE2UPew80wdqKI1/npKHaydNEI8bRMOcyeS4JT3afRpn9kHSZZPgzwVjrm8ISgZ2TD
	 VZxX0+OzAlYRfjUHuB72RSxj177xty7SF7N8rhjoFnv1oW46XBf34S2oXiRQgzOklH
	 ezMQY8GWGZ87DELjhr8c8k93lguh+KwcDs0rjynyWCj7IaQADu4vazq3hfOyvUjq/J
	 7RW/7Bp5YCNFkqW/17YalMW/xv4muz8XOr46crxWuDzagK7IuToT/yvIOzHJLGmC7y
	 p+ALLaWv1xGKA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Sumit Garg <sumit.garg@linaro.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	samitolvanen@google.com,
	mingo@redhat.com,
	rostedt@goodmis.org,
	daniel.thompson@linaro.org,
	ndesaulniers@google.com,
	ben.dai@unisoc.com,
	nathan@kernel.org,
	keescook@chromium.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arm64: ftrace: use function_nocfi for _mcount as well
Date: Tue, 12 Oct 2021 09:46:56 +0100
Message-Id: <163402708986.2334492.16010786137157285586.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011125059.3378646-1-sumit.garg@linaro.org>
References: <20211011125059.3378646-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 11 Oct 2021 18:20:59 +0530, Sumit Garg wrote:
> Commit 800618f955a9 ("arm64: ftrace: use function_nocfi for ftrace_call")
> only fixed address of ftrace_call but address of _mcount needs to be
> fixed as well. Use function_nocfi() to get the actual address of _mcount
> function as with CONFIG_CFI_CLANG, the compiler replaces function pointers
> with jump table addresses which breaks dynamic ftrace as the address of
> _mcount is replaced with the address of _mcount.cfi_jt.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: ftrace: use function_nocfi for _mcount as well
      https://git.kernel.org/arm64/c/de56379f21c7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
