Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B523A4
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 09:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 792D3C385AE;
	Fri, 22 Apr 2022 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650619811;
	bh=4BJZmEVhYZrUvVU6UDMs/63mofJAqQXx7Fh//ZtPELE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oXcUm3/OfvUQrRqFPjGM0708vHge2XT6eA9yNra/Z7rzAVXzJMqznGzwyGKUaa3dE
	 4HJ59SaClIzZs1Y7BSyRnpPhRmvjpaLO6XsUvvhm5cvtg2rihNhc0txbyFMKJB7f8q
	 yhn18KnB9MmT3eWZxf4gdyMVwbO/t9kLAQwM24rtFp9qETAbwL3+2PTAML8ZHFYu2C
	 xVl3jjrKTJjKe9u/XKGNao9v4vliuvgxKrnrK6KrOZbxljUv9Z8HnJkJ07gBWjS1jg
	 2TECGWebuJH+N7WByXUuMnDt2gxguJosqQzrCzbAj/JYqXSzNWHov40yo+5a5VSy1V
	 8wegkRaY0Ckfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65203E85D90;
	Fri, 22 Apr 2022 09:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] myri10ge: remove redundant assignment to variable status
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165061981141.24106.14578807719178720929.git-patchwork-notify@kernel.org>
Date: Fri, 22 Apr 2022 09:30:11 +0000
References: <20220418143759.85626-1-colin.i.king@gmail.com>
In-Reply-To: <20220418143759.85626-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: christopher.lee@cspi.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 18 Apr 2022 15:37:59 +0100 you wrote:
> Variable status is being assigned a value that is never read, it is
> being re-assigned again later on. The assignment is redundant and can
> be removed.
> 
> Cleans up clang scan build warning:
> drivers/net/ethernet/myricom/myri10ge/myri10ge.c:582:7: warning: Although
> the value stored to 'status' is used in the enclosing expression, the
> value is never actually read from 'status' [deadcode.DeadStores]
> 
> [...]

Here is the summary with links:
  - myri10ge: remove redundant assignment to variable status
    https://git.kernel.org/netdev/net-next/c/1c604f91b773

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


