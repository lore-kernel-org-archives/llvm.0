Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302C3D6CBD;
	Fri, 24 Apr 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037446; cv=none; b=sJt6WduonDCM85zoAz81J8T0v+MkNXnAKJHqMYz3CHlhvrW5Ep0AtqZx/cVEYohtrGeQjhdPNPChIF7zPQ3Pk0vhQcBIb6WiR03XchYVqSNozSVKiquulTZXcI1hT04KXkKt1a4AJvo/CWF8Kx3jW0xAcqsBn9DnpPVl6KKBe8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037446; c=relaxed/simple;
	bh=RiNuWDFYpfa44/lF4GDzMT8158MNWuPbfUfLAG44zCI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=R/LhBKZOnuL8DdsyYyJYxIwlnMdLlB3iN+XCH0cZorJL8esxfRvKe8GOCPzs8l0rVBym+7zCJfS0+ewswvJcd2EopirLQP8Xt0pkXQhb/qpLrlVigDeUYNt4sGbQM1ByNH2Ii9QsjJMDf9jFbppFnoc9ecQ5cnp0IQpNp0cn+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVwdpoqD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVwdpoqD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2763AC19425;
	Fri, 24 Apr 2026 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777037445;
	bh=RiNuWDFYpfa44/lF4GDzMT8158MNWuPbfUfLAG44zCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QVwdpoqDi0gT3jikgq9PqI29RhXdHVtCBds5aTVhsXCjoZDi2s5gXXwrbCc+wkWKp
	 OpLxaZeumhnvKL5Utk5aQGzz9BeTR1qgK4tikwko8UxK8A6cgPKP7Lh5xoWNvGwCTV
	 P5uCEXBotITljBMP5kP/ik8feGWxVqp7WtxcBMwGXcqHeYUzyomYVMId3AIoyGzDD4
	 xpdo3W+ERs8wMFg0+JC5JeiStxCuXHIQ1Zp5+hNh/1ZYy0EmECJgZjfz0dUjzkiEcH
	 yKklRLM8eOUHIqJ5QsoLFYoPH1nw/5PC9B3x6aVgM7XWcXvkR3MWMZhfsR2QwBpN8i
	 ChT2bzPljo/tA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02FBD3811979;
	Fri, 24 Apr 2026 13:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Define
 __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177703740582.1127153.13431496503049547939.git-patchwork-notify@kernel.org>
Date: Fri, 24 Apr 2026 13:30:05 +0000
References: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
In-Reply-To: 
 <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, namcao@linutronix.de,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 06 Apr 2026 16:25:49 -0700 you wrote:
> After commit 67bdd7b01387 ("riscv: Split out measure_cycles() for
> reuse") and commit c03ad15f7cf6 ("riscv: Reuse measure_cycles() in
> check_vector_unaligned_access()"), there are CFI failure when booting
> kernels with CONFIG_CFI=y:
> 
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_words_unaligned+0x0/0x50; expected type: ...)
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_vec_words_unaligned+0x0/0x24; expected type: ...)
> 
> [...]

Here is the summary with links:
  - riscv: Define __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START
    https://git.kernel.org/riscv/c/70d39025809b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


