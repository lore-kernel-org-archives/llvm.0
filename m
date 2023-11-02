Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B02421A03
	for <llvm@lists.linux.dev>; Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6Qo4iPa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9143DC433C9;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698956430;
	bh=XIqNneDvwTUx7cZETBqQ41jJPKUkTvgEnD4GcJ4v2qE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l6Qo4iPat8GOPplyhUoIrrYPBX9OsgqRtj7hPbT5ygjd3kcrurT4pXbrpw7oSQr+1
	 +C4cnwXyza0086uofo81tbCsVwG/hjZ66OAXIF0frdhhrssZQeujDzBO1+dICvbB+N
	 /RUrJ3pfFFJ0lbWA4qmD2E52ndGB324EVVEz545K/2ONZLmwFld3D7g9LVWbVu4J3I
	 xDLJ5gBAfXlqrhNlfrbsYH4EKerSqYwFQ113ClOBP8Uml3PwRETc9Ukfc56ZG42byR
	 OLuRFDmMZAXcoKs0TKGvEaugi+OKUu8d849z/vzxQ1WuEghkVPMnsyDi4KlqlrE0vb
	 rgRxSwAcGdNYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6EC45C691E1;
	Thu,  2 Nov 2023 20:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/6] riscv: SCS support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <169895643044.22248.9260509736343720996.git-patchwork-notify@kernel.org>
Date: Thu, 02 Nov 2023 20:20:30 +0000
References: <20230927224757.1154247-8-samitolvanen@google.com>
In-Reply-To: <20230927224757.1154247-8-samitolvanen@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 cleger@rivosinc.com, guoren@kernel.org, debug@rivosinc.com,
 nathan@kernel.org, ndesaulniers@google.com, maskray@google.com,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 27 Sep 2023 22:47:58 +0000 you wrote:
> Hi folks,
> 
> This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
> uses compiler instrumentation to store return addresses in a
> separate shadow stack to protect them against accidental or
> malicious overwrites. More information about SCS can be found
> here:
> 
> [...]

Here is the summary with links:
  - [v4,1/6] riscv: VMAP_STACK overflow detection thread-safe
    https://git.kernel.org/riscv/c/be97d0db5f44
  - [v4,2/6] riscv: Deduplicate IRQ stack switching
    https://git.kernel.org/riscv/c/82982fdd5133
  - [v4,3/6] riscv: Move global pointer loading to a macro
    https://git.kernel.org/riscv/c/e609b4f4252a
  - [v4,4/6] riscv: Implement Shadow Call Stack
    https://git.kernel.org/riscv/c/d1584d791a29
  - [v4,5/6] riscv: Use separate IRQ shadow call stacks
    https://git.kernel.org/riscv/c/c40fef858d00
  - [v4,6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
    https://git.kernel.org/riscv/c/245561ba6d5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


