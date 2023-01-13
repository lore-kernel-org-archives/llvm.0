Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FFFBA40;
	Fri, 13 Jan 2023 21:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6511DC4339C;
	Fri, 13 Jan 2023 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673644856;
	bh=Tdf6cUFrRR0hwdAWI/Kfn7YtQl15TbwB8vYhi1fhtIw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MyH7bb6ZwkVGaHib10/pqZMusN2vC57bhG7ZlE+9/ivMwb7R2R28MuIhsv+OGJXDS
	 0YBC1meOAVNLgmmr8+6KVKUtM1FeDCOHv08oUS32VF1FV0Nv5I9LLOMr9BTJZN5nlN
	 VkifR/qzchmK0oeCCNzNznT4zsO4YnvvN4kcbXlM2lE5iGA6eZ6hNIHxMq+jKMMQ+i
	 8sh0YPSO9xIKSzpHFXKz2yr4QGxugxnz1sQ+SGBKmXIKBn4xqTKnknjqbk3HYMonNr
	 hjfWv9T+WRyw2xawruOCxbTBVfGbsYL2FBq5q4pihGFb1Yu+dIj3OozwTscWEIAH15
	 LjrC7Rx8WB93w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5325BE21EE2;
	Fri, 13 Jan 2023 21:20:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: initialize the buf variable
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <167364485633.21086.16143246139018637708.git-patchwork-notify@kernel.org>
Date: Fri, 13 Jan 2023 21:20:56 +0000
References: <20230110193611.3573777-1-trix@redhat.com>
In-Reply-To: <20230110193611.3573777-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: bleung@chromium.org, groeck@chromium.org, nathan@kernel.org,
 ndesaulniers@google.com, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue, 10 Jan 2023 14:36:11 -0500 you wrote:
> Clang static analysis reports this problem
> drivers/platform/chrome/cros_ec_lpc.c:379:13: warning: The left operand
>   of '!=' is a garbage value [core.UndefinedBinaryOperatorResult]
>     if (buf[0] != 'E' || buf[1] != 'C') {
>          ~~~~~~ ^
> 
> The check depends on the side effect of the read.  When the read fails
> or is short, a buf containing garbage could be mistaken as correct.
> 
> [...]

Here is the summary with links:
  - platform/chrome: cros_ec_lpc: initialize the buf variable
    https://git.kernel.org/chrome-platform/c/2ae3c610e7d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


