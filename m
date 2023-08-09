Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4818013
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41280C433CC;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691592021;
	bh=rS1VmWngCPrpnlr93e2OHzvT/pKtGX1S57FyWy3qM2M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dBZYMRaMdKwDDcfKgHAVBp4WysQCa1YCVUBQwYN2ahYEnn1HcKCYXhJMi4hGlDTmX
	 OZvjLyrUQqj73yo7fenV96uNsHyUKdZaRc1QEP6/cnnR78XOr2+ESS4IYAvGf0sg0G
	 puTi5bM7Qb15nmV13MrNo4XXBsFA2jkHJEtbfXiOv7/5N/TwWLbExGPSwDMnff/UXI
	 3M1CaUDGkM1yFcK5xQVlHe1QnXKHVhu8m17pUAnGSWhH1OsfM7YVywSO0Se2J40534
	 jqs6Elf111OeGVNFbB8Tbqa9cGXo6UlbKj302wIp5HFGrA5Gokh5ows60BN90g6HGJ
	 F4ay19kBN6J2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25A66E330A1;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: mm: fix 2 instances of
 -Wmissing-variable-declarations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <169159202114.17533.15862327157630311285.git-patchwork-notify@kernel.org>
Date: Wed, 09 Aug 2023 14:40:21 +0000
References: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
In-Reply-To: <20230808-riscv_static-v2-1-2a1e2d2c7a4f@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
 trix@redhat.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 lkp@intel.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 08 Aug 2023 09:35:00 -0700 you wrote:
> I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
> bot spotted the following instance in ARCH=riscv builds:
> 
>   arch/riscv/mm/init.c:276:7: warning: no previous extern declaration
>   for non-static variable 'trampoline_pg_dir'
>   [-Wmissing-variable-declarations]
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       |       ^
>   arch/riscv/mm/init.c:276:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   276 | pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>       | ^
>   arch/riscv/mm/init.c:279:7: warning: no previous extern declaration
>   for non-static variable 'early_pg_dir'
>   [-Wmissing-variable-declarations]
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       |       ^
>   arch/riscv/mm/init.c:279:1: note: declare 'static' if the variable is
>   not intended to be used outside of this translation unit
>   279 | pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>       | ^
> 
> [...]

Here is the summary with links:
  - [v2] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
    https://git.kernel.org/riscv/c/d2402048bc8a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


