Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753727C
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C30FC433D7;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663638017;
	bh=rwLvn3VkBU5KV5IslYbkFXJLACc79KCCalOdlifBzR8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qWCklRA1NXon8XI6F+w6RN2hGAwQ/uecsnaJGZoA2mvngswqjo80p/hqh9QuDfCkr
	 4BjpGJ9Z82nI4+cy+46j+wvGEypmz2d5YQ9AKVAUdH1yVcg26MpaktNdq8s36LD7FP
	 UUfePb4dRTUaq2gzOaPgylgkLKFl0sp+Lde0w6dzRwDnlYeMKAM0UZH+PUZ+gtyXD/
	 OkI4IqorWvOcfo2zkipxyT45/ShQoyT2ftzBgl+4hpZLrfetL8tltAsJnt5PLGTmqL
	 uy0eFDXzSifPj1C1w2elmZSZM5TAkBmZYt/AG+YSmniFRLWXlghS3tGMDDT88ZQGfi
	 gdI6sqQe8FlWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06B19C43141;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: korina: Fix return type of korina_send_packet
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166363801702.6857.15735774566278514927.git-patchwork-notify@kernel.org>
Date: Tue, 20 Sep 2022 01:40:17 +0000
References: <20220912214344.928925-1-nhuck@google.com>
In-Reply-To: <20220912214344.928925-1-nhuck@google.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: , error27@gmail.com, llvm@lists.linux.dev, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 Sep 2022 14:43:40 -0700 you wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of korina_send_packet should be changed from int to
> netdev_tx_t.
> 
> [...]

Here is the summary with links:
  - net: korina: Fix return type of korina_send_packet
    https://git.kernel.org/netdev/net-next/c/106c67ce46f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


