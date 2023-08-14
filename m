Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E2BE6B
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 17:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88967C433C8;
	Mon, 14 Aug 2023 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692035971;
	bh=FS2sEL2B80bH8ltwGIi7XOqH2+c7YsqW7sPWp/SuQ2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9Ga5o8ukskYsbpvWB8DCdAIH7+jkzTTwlEVWzn7Y9m1TeA0d3qL1/g0royEgWaZA
	 XKRrzRa8QUIM8kfuAPH+KPAZnW9Si/53wBxUxcIRf9r7rtytGsAVNebXKzykpqil7/
	 OqDI4NSi79K9fsQmivTcG9Y817LtdgjUBe/AmlmbLwHcA25Ox4ZZ+7kfQu4bg8B4ZY
	 9cq05uEvOYFhgl+Id9gHFEM+6B+Jdtx/ZE3SVK0iQcbz+RmR2za9MFa1VqHZUjuTbP
	 +EVrAfumNhvOLhl8aCy9WzqOUS/v+sCK5MB3TKfIb6M4zH/JgsgO9scOErtu5BmDOp
	 bVd3IRztrPIHg==
Date: Mon, 14 Aug 2023 10:59:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>, Guo Ren <guoren@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] riscv: SCS support
Message-ID: <20230814175928.GA1028706@dev-arch.thelio-3990X>
References: <20230811233556.97161-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811233556.97161-7-samitolvanen@google.com>

Hi Sami,

On Fri, Aug 11, 2023 at 11:35:57PM +0000, Sami Tolvanen wrote:
> Hi folks,
> 
> This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
> uses compiler instrumentation to store return addresses in a
> separate shadow stack to protect them against accidental or
> malicious overwrites. More information about SCS can be found
> here:
> 
>   https://clang.llvm.org/docs/ShadowCallStack.html
> 
> Patch 1 is from Deepak, and it simplifies VMAP_STACK overflow
> handling by adding support for accessing per-CPU variables
> directly in assembly. The patch is included in this series to
> make IRQ stack switching cleaner with SCS, and I've simply
> rebased it. Patch 2 uses this functionality to clean up the stack
> switching by moving duplicate code into a single function. On
> RISC-V, the compiler uses the gp register for storing the current
> shadow call stack pointer, which is incompatible with global
> pointer relaxation. Patch 3 moves global pointer loading into a
> macro that can be easily disabled with SCS. Patch 4 implements
> SCS register loading and switching, and allows the feature to be
> enabled, and patch 5 adds separate per-CPU IRQ shadow call stacks
> when CONFIG_IRQ_STACKS is enabled.
> 
> Note that this series requires Clang 17. Earlier Clang versions
> support SCS on RISC-V, but use the x18 register instead of gp,
> which isn't ideal. gcc has SCS support for arm64, but I'm not
> aware of plans to support RISC-V. Once the Zicfiss extension is
> ratified, it's probably preferable to use hardware-backed shadow
> stacks instead of SCS on hardware that supports the extension,
> and we may want to consider implementing CONFIG_DYNAMIC_SCS to
> patch between the implementation at runtime (similarly to the
> arm64 implementation, which switches to SCS when hardware PAC
> support isn't available).

I took this series for a spin on top of 6.5-rc6 with both LLVM 18 (built
within the past couple of days) and LLVM 17.0.0-rc2 but it seems that
the CFI_BACKWARDS LKDTM test does not pass with
CONFIG_SHADOW_CALL_STACK=y.

  [   73.324652] lkdtm: Performing direct entry CFI_BACKWARD
  [   73.324900] lkdtm: Attempting unchecked stack return address redirection ...
  [   73.325178] lkdtm: Eek: return address mismatch! 0000000000000002 != ffffffff80614982
  [   73.325478] lkdtm: FAIL: stack return address manipulation failed!

Does the test need to be adjusted or is there some other issue?

Cheers,
Nathan
