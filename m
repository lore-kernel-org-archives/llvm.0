Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D024428
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2C51C433CA;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=CJBJ2HCdIV23BWEwO+d38KcZ6JefgcQDI6BR3xU4VoU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T3ICMT9Or6XLc2djfkBLwb8a8KothXh8yCKem9PNWTvsVBHojItKJXqGS7RT/vhJH
	 YJ1LQNAYtqeOoQDg5wo7dvLHFArDvh3cCikEd/tYHiIm1HPrLZSYXiYO7Ygp6uIxBc
	 xYo53fzyvqs9zYfoOxoLXnNdmRwDIEmJPbDcEKrLzijFwdzwisoUvoROT87ytHIH2y
	 mxyg6kS/BVLMES/D0gbmY+/93QYFU4/1JOJm4CKtOhHW2ql89T6E9Ogpvyl8Y2U0OZ
	 ZEACKVKN0rv/otxJw2C7DpXIfZX37nQMTur6yazgtukoYukst4l5DqW7dF/2GMw5zY
	 vgKReZJ90DbyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88292E29F3D;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/6] riscv: KCFI support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <169340163454.19859.5631159121933404323.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230710183544.999540-8-samitolvanen@google.com>
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 nathan@kernel.org, ndesaulniers@google.com, conor.dooley@microchip.com,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 10 Jul 2023 18:35:45 +0000 you wrote:
> This series adds KCFI support for RISC-V. KCFI is a fine-grained
> forward-edge control-flow integrity scheme supported in Clang >=16,
> which ensures indirect calls in instrumented code can only branch to
> functions whose type matches the function pointer type, thus making
> code reuse attacks more difficult.
> 
> Patch 1 implements a pt_regs based syscall wrapper to address
> function pointer type mismatches in syscall handling. Patches 2 and 3
> annotate indirectly called assembly functions with CFI types. Patch 4
> implements error handling for indirect call checks. Patch 5 disables
> CFI for arch/riscv/purgatory. Patch 6 finally allows CONFIG_CFI_CLANG
> to be enabled for RISC-V.
> 
> [...]

Here is the summary with links:
  - [v2,1/6] riscv: Implement syscall wrappers
    https://git.kernel.org/riscv/c/08d0ce30e0e4
  - [v2,2/6] riscv: Add types to indirectly called assembly functions
    https://git.kernel.org/riscv/c/5f59c6855bad
  - [v2,3/6] riscv: Add ftrace_stub_graph
    https://git.kernel.org/riscv/c/f3a0c23f2539
  - [v2,4/6] riscv: Add CFI error handling
    https://git.kernel.org/riscv/c/af0ead42f693
  - [v2,5/6] riscv/purgatory: Disable CFI
    https://git.kernel.org/riscv/c/a72ab0361110
  - [v2,6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
    https://git.kernel.org/riscv/c/74f8fc31feb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


