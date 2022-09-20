Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FAF7C
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 01:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77E86C4314D;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663638017;
	bh=x9GBtqqH0TiB1gARWPovbT4LJISDbrrg7I6y2/i1zbY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZP0qlvaHyMy+kIdS236QyHasEFTdd8pw1C9+jkhunyC3lSuMeOyiAz6K0nQDGjwLy
	 JWNiM6e18efCrrzfSxF2zt+fOV96CuNJsNHwatmrEeAZoEQ+N5rCNXSKe0mEk3IGXZ
	 jEOsZRr2c3t4jI40rI8hIaPtFy1x1UIgKndWSuFvXbGYVjQgE7ooOokUyaj3XWAFzf
	 lUgSQT+ApyOskKE3DWpO0DAMk2CQnDlS82erXhl+H8wNy1HajJZlIxWCKbAANiBDMH
	 dNuLam3hWa+Q5VYc3e2g7S+PFYz5dzDhx2WRoaMBvGTD+BtLj/cXUDPgKTTDuzDpGO
	 TsZIwgXj/XgCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 608E1E52537;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ax88796c: Fix return type of ax88796c_start_xmit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166363801739.6857.10655836066470169597.git-patchwork-notify@kernel.org>
Date: Tue, 20 Sep 2022 01:40:17 +0000
References: <20220912194031.808425-1-nhuck@google.com>
In-Reply-To: <20220912194031.808425-1-nhuck@google.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: , error27@gmail.com, llvm@lists.linux.dev, l.stelmach@samsung.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 Sep 2022 12:40:30 -0700 you wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of ax88796c_start_xmit should be changed from int to
> netdev_tx_t.
> 
> [...]

Here is the summary with links:
  - net: ax88796c: Fix return type of ax88796c_start_xmit
    https://git.kernel.org/netdev/net-next/c/fcb7c210a242

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


