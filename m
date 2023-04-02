Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095183C02
	for <llvm@lists.linux.dev>; Sun,  2 Apr 2023 12:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1FA9C433A4;
	Sun,  2 Apr 2023 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680439817;
	bh=VWD8AhzQ5saiH3TAQeVQN3iTIBGgdcpAgBHSgDg8uE0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P+uF+XHpFGEBoYo1nLM0vZVF8MWEmioSKbHBUukOeYoQSW1uejwXr8uT2r3XPZcKx
	 Wg7L9nM92pRtIv+wXT2cD1pLPfS1hid0a6vxrCmWJYhfaTd7suOpdXP1kNX+k1Wwr8
	 DTqhPWZDXzDJ6AN3c1mOz8XWwtkGsMEal8hbhZ3/kCZUv1VZpubh65oJWM98obzEQM
	 7r9Ysl7G9s0GkdDdPzjW8FQRrNr9Wk8o2x3Ts7ptgL5GLjwRWu/YSpCFeM933GBayN
	 9lSnT9U5/F9Fx27Imfi8lh6vt9ws0IDa1GY0rWhvuLYLnXRYHg0fS1OMUI/LX5htFS
	 2K+0US0oNmZTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7CEB3C73FE2;
	Sun,  2 Apr 2023 12:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: alteon: remove unused len variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168043981750.15620.10299883476369868511.git-patchwork-notify@kernel.org>
Date: Sun, 02 Apr 2023 12:50:17 +0000
References: <20230331205545.1863496-1-trix@redhat.com>
In-Reply-To: <20230331205545.1863496-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: jes@trained-monkey.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, linux-acenic@sunsite.dk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri, 31 Mar 2023 16:55:45 -0400 you wrote:
> clang with W=1 reports
> drivers/net/ethernet/alteon/acenic.c:2438:10: error: variable
>   'len' set but not used [-Werror,-Wunused-but-set-variable]
>                 int i, len = 0;
>                        ^
> This variable is not used so remove it.
> 
> [...]

Here is the summary with links:
  - net: alteon: remove unused len variable
    https://git.kernel.org/netdev/net-next/c/51aaa68222d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


