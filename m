Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A272C9E
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 15:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3526C34611;
	Mon, 13 Dec 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639407611;
	bh=WjcGELbu5JIKbGB4EMlOVci44ait6RcZ0lcliNjSfIA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=psYdtPJZOEQQuzAu/yovjNacJXoUwfT9h2sMTh8oPH0Jf45yQlcUfxbC+3uiYqdS8
	 ePjf4HZhOZIBN4lIh4/i8m6yo9+ZcGptg15ajxDewsplStTINzNycAgDOhRlSpWXHM
	 dBz9f3KjkZPs29f/WPyuate7otj9zYpTqXoV3lvwxcp0KSYr0bAUQuf8w748pFitbw
	 HxIdShlgRuLvo52xBPL1BLObLnwk68393gpvcXPFqVyiNcQptIYdiBPlwaAMigJ3xt
	 mAixPmPLMddJtMgSZmV5SDlcJp+cojEyvn17IDJ+1saDTnAAPbELCW1cdZGJvPTFLz
	 SjZNMoTvw2Daw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D30D66098C;
	Mon, 13 Dec 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] mt76: remove variable set but not used
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <163940761085.26947.2175837807635652318.git-patchwork-notify@kernel.org>
Date: Mon, 13 Dec 2021 15:00:10 +0000
References: <20211213095413.99456-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20211213095413.99456-1-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 nathan@kernel.org, ndesaulniers@google.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, abaci@linux.alibaba.com

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 13 Dec 2021 17:54:13 +0800 you wrote:
> The code that uses variable queued has been removed,
> and "mt76_is_usb(dev) ? q->ndesc - q->queued : q->queued"
> didn't do anything, so all they should be removed as well.
> 
> Eliminate the following clang warnings:
> drivers/net/wireless/mediatek/mt76/debugfs.c:77:9: warning: variable
> ‘queued’ set but not used.
> 
> [...]

Here is the summary with links:
  - [-next] mt76: remove variable set but not used
    https://git.kernel.org/netdev/net-next/c/93d576f54e0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


