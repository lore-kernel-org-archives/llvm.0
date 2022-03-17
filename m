Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EABF4C71
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 23:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B02FC340FB;
	Thu, 17 Mar 2022 23:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647561013;
	bh=QadZn0qUlC6fWtS+rwQf4iEhtO2uYxxr8XNlufHcmz0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LTH3QXlqoVeCW3eoZJcmWgm6WWvmKE9Qn9CtynVURy3uYWkKEA4121Wwyvl8tTgXu
	 qm3uaXrCTHQdGP1NCGRwy1vho9piZ1wWujar88kAOtXgTt2BxDU9ZV8Up8iXZoOhjY
	 nAMwz45mDqzve86pXM8cZzWgCdqVBbo6o5uaKGoJmTDsS77slVHBDio7TAl07n67EU
	 /Y8WUwo3SZRuco77n9thaFiLqDuiTnWXl6ev8WDI+VHEyKU2wjVD2xnqdzxED0AsQW
	 q0x6OI1IuRCcKCkgri0Pm7nTE/Ypg5gLZbVKunpT2x9qHBdUINHcbTo8vQlchHPH7m
	 zYcNN/BVRWvfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E77F9E6D3DD;
	Thu, 17 Mar 2022 23:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] enetc: use correct format characters
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164756101294.14093.17775021049883787717.git-patchwork-notify@kernel.org>
Date: Thu, 17 Mar 2022 23:50:12 +0000
References: <20220316213109.2352015-1-morbo@google.com>
In-Reply-To: <20220316213109.2352015-1-morbo@google.com>
To: Bill Wendling <morbo@google.com>
Cc: claudiu.manoil@nxp.com, davem@davemloft.net, kuba@kernel.org,
 nathan@kernel.org, ndesaulniers@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 16 Mar 2022 14:31:09 -0700 you wrote:
> When compiling with -Wformat, clang emits the following warning:
> 
> drivers/net/ethernet/freescale/enetc/enetc_mdio.c:151:22: warning:
> format specifies type 'unsigned char' but the argument has type 'int'
> [-Wformat]
>                         phy_id, dev_addr, regnum);
>                                           ^~~~~~
> ./include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
>                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>                                                     ~~~     ^~~~~~~~~~~
> ./include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
>                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
>                                         ~~~    ^~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - enetc: use correct format characters
    https://git.kernel.org/netdev/net-next/c/df4d35e1f01f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


