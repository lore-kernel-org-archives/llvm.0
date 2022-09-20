Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4B8ED3
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 01:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73DAEC43143;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663638017;
	bh=H5MnugtnF+BmUyz6w7eyxH9iA0NAXtL1BKlxmCuN9cM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TzTg1km1QKDa3vkiZwuX0C0jwZgEdmtwwQ4YEt9NB5b8TZ/ltAslG7KWso2xbBfaL
	 24Z8hZC/TWleoDmBiFoMPfZL3FHoGmjIdUPp0sKsVdHgT85tMtmnlIEzrtRwQlaPQ+
	 WvCD0VYlBGj4rfbTXyaRlHiAqd+lvDKjLniWGbtfTxO79PpEAjhJT6cboQ76s+HZHK
	 qAma1k4qNU2z2P2VkDXC1myr9DeUHirYU61P9ZEQd7kfGRq7eOMRAm/S5f66o7RxMt
	 rZuw7bz7xBameEqHWAW2X3zNCjL/ctTsoY9aX8rwIJHHAzjnCvIhhPPY/YF+YQK/+O
	 aHagrVxOM3CYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50E7AE52539;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: wwan: t7xx: Fix return type of t7xx_ccmni_start_xmit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166363801731.6857.13327980653894760946.git-patchwork-notify@kernel.org>
Date: Tue, 20 Sep 2022 01:40:17 +0000
References: <20220912214510.929070-1-nhuck@google.com>
In-Reply-To: <20220912214510.929070-1-nhuck@google.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: , error27@gmail.com, llvm@lists.linux.dev,
 chandrashekar.devegowda@intel.com, linuxwwan@intel.com,
 chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
 m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 Sep 2022 14:45:10 -0700 you wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of t7xx_ccmni_start_xmit should be changed from int to
> netdev_tx_t.
> 
> [...]

Here is the summary with links:
  - net: wwan: t7xx: Fix return type of t7xx_ccmni_start_xmit
    https://git.kernel.org/netdev/net-next/c/73c99e260365

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


