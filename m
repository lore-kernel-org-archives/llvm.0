Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7CEEC7
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 01:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 850EAC4314E;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663638017;
	bh=Re6QNnxF7MInUcVeqTbYE1nN5Lo3NNrpKn4mnmdQ7U0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KGxaWnvHmhykG8AcOOOMBf2wJeGuBEnrr4GH8N9pNcknOgwd3V5VJoRBHbYJ0r+bp
	 a43Dc4/crTJEMSzfPiZVfZmTFOQDH6fauy0TDU0j/n079ABeWmrwQRQyuomwUX7P//
	 zx8mI4K4VAbZ+bZuW48l0UIPK+3Cs6iLEkx4x15yQUaGz6EuMnbZMDrteKICN7XC0M
	 tYA6V12JGRjsGk1ZMizDUd3qCEgK/v2DGXI13uJCG8z1Q4pGU94d2XohR4nAKpHu3I
	 ET4v+uhv+fGtea2pzw7fnMyRdyS4Tt+ZHVltuVB9s6L1w+/WpcWjhGNRy53Dl//tHv
	 MBNDDsxm94RmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6E02AE52536;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: wwan: iosm: Fix return type of ipc_wwan_link_transmit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166363801743.6857.5852475511162302721.git-patchwork-notify@kernel.org>
Date: Tue, 20 Sep 2022 01:40:17 +0000
References: <20220912214455.929028-1-nhuck@google.com>
In-Reply-To: <20220912214455.929028-1-nhuck@google.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: , error27@gmail.com, llvm@lists.linux.dev, m.chetan.kumar@intel.com,
 linuxwwan@intel.com, loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 Sep 2022 14:44:55 -0700 you wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of ipc_wwan_link_transmit should be changed from int to
> netdev_tx_t.
> 
> [...]

Here is the summary with links:
  - net: wwan: iosm: Fix return type of ipc_wwan_link_transmit
    https://git.kernel.org/netdev/net-next/c/0c9441c43010

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


