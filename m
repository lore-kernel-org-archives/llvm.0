Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAC1EC7
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 325A9C4347C;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663638017;
	bh=DzmFGWy8YdufwwD1+tSAExu34U8/TaxP+VhEqkfvVMU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QHrNdTu1dFpu8GiRABsyktCQj7wt3Za5INPGrMnWui5fXCb8w1aVa8pqaDnASkRD5
	 nmEAZbShuStUAG7fPlIUUAsA7UOzSSHHR0wNW8TQyxxEd8sUs0GQEyrgkGRF0iZpbO
	 VsHeWNEcg84v9mD8z+rm5S+ygxg1bMOpsdUYXtErWzRbrqjQxEM00p84dQ+UFEoRdz
	 xjzhxA0ZPQXS0RuiuWViVWQujzKewEF/XDsa/M0NQga/STmzkMca4pYkkU9CiQ4lpC
	 Z8tmYZy4PPSAaNGTuJx1a2U4Zh75IM5EHGRlGq1nQwt2VR1g4kYmkzskstyxHvBgw/
	 3YXDlh6XpzvDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16D26E52537;
	Tue, 20 Sep 2022 01:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: davicom: Fix return type of dm9000_start_xmit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166363801708.6857.15887073480116722163.git-patchwork-notify@kernel.org>
Date: Tue, 20 Sep 2022 01:40:17 +0000
References: <20220912194722.809525-1-nhuck@google.com>
In-Reply-To: <20220912194722.809525-1-nhuck@google.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: , error27@gmail.com, llvm@lists.linux.dev, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 Sep 2022 12:47:19 -0700 you wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of dm9000_start_xmit should be changed from int to
> netdev_tx_t.
> 
> [...]

Here is the summary with links:
  - net: davicom: Fix return type of dm9000_start_xmit
    https://git.kernel.org/netdev/net-next/c/0191580b000d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


