Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB881578
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 15:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27493C340F2;
	Tue, 15 Feb 2022 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644937211;
	bh=nGCeJwddwcrOgxUdguUA+7IGx/+e9mVPmupofSCfSOs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m8K/c3AsmMzfRh2ZnGyzPqyCP/2bgN2mZTGR+0q/g794oybul8RXG1rDU3t1v8pwN
	 OBllcD1OP+862nyanc+7JowNAE9cKfV5SdDjpbI+5JWCZaayUoAA9x0uwGRPjWolbk
	 ZeEPZ17Og1apCIRdwbN4/+SJl8uqXZKRsPS82l91PeAJnd263bInRyS3kUlH6hFZd+
	 fA64wy0+FdIlRElkqIuXaKfFzSPIF1TX0AUwuC++oWsUbGw27qxUqnrUmv/YvRWW6W
	 z/4pJkhQADOX1W+gi0f9qmkEZL4ZdOJWDYWKadhTCXRxgLXztzp3DRZhloaG3a/rtH
	 DOg8HmM2Xiexw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F0DEE6BBD2;
	Tue, 15 Feb 2022 15:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mctp: fix use after free
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164493721105.12867.12615995983107309370.git-patchwork-notify@kernel.org>
Date: Tue, 15 Feb 2022 15:00:11 +0000
References: <20220215020541.2944949-1-trix@redhat.com>
In-Reply-To: <20220215020541.2944949-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: jk@codeconstruct.com.au, matt@codeconstruct.com.au, davem@davemloft.net,
 kuba@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 14 Feb 2022 18:05:41 -0800 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this problem
> route.c:425:4: warning: Use of memory after it is freed
>   trace_mctp_key_acquire(key);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> When mctp_key_add() fails, key is freed but then is later
> used in trace_mctp_key_acquire().  Add an else statement
> to use the key only when mctp_key_add() is successful.
> 
> [...]

Here is the summary with links:
  - [v2] mctp: fix use after free
    https://git.kernel.org/netdev/net/c/7e5b6a5c8c44

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


