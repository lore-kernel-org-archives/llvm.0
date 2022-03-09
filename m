Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C91A5387
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073C8C340E8;
	Wed,  9 Mar 2022 22:35:15 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] arm64: Do not include __READ_ONCE() block in assembly files
Date: Wed,  9 Mar 2022 22:35:13 +0000
Message-Id: <164686530868.2021143.5226596562469342998.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309191633.2307110-1-nathan@kernel.org>
References: <20220309191633.2307110-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 9 Mar 2022 12:16:34 -0700, Nathan Chancellor wrote:
> When building arm64 defconfig + CONFIG_LTO_CLANG_{FULL,THIN}=y after
> commit 558c303c9734 ("arm64: Mitigate spectre style branch history side
> channels"), the following error occurs:
> 
>   <instantiation>:4:2: error: invalid fixup for movz/movk instruction
>    mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
>    ^
> 
> [...]

Applied to arm64 (for-next/spectre-bhb), thanks!

[1/1] arm64: Do not include __READ_ONCE() block in assembly files
      https://git.kernel.org/arm64/c/52c9f93a9c48

-- 
Catalin

