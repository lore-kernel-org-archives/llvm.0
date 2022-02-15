Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493A91576
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 14:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E754BC340F3;
	Tue, 15 Feb 2022 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644936011;
	bh=W+PZiXTkYYnYXtN8VwBPcPEFiBLPX741Pr608myZGug=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZZqIsTFR8P4fhKOYLoIsdyVtOw6Ic3k9rD5JeUlevGOn/VHt+ySFeUqtByqqApGFM
	 dkujXNapxRFLOGxNUoOc98VkzM5fPzKyEZ0/ws7vqs7DPySW40EeG8QOxorHwjMcXE
	 RRxA8U69C8Eov70j7L7TpVm9zqQAOfxL7FE+BeYEIItMoVXNY2FmyGnXghtghVD+6R
	 JRu8/ngo0yAFbGJ5igYex2Xkjz8pn9LtqSc6RrE6/ESLpAQUo9vNZLr8di2LXHN5lK
	 SUxyDLl1P8iHP9vsU1J3lkH/cNXuAAh0dW/iTb8XH9gh8f2ga9sFvexxES4vNa+A4I
	 BWBeYBZeX6iEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D23B0E6D447;
	Tue, 15 Feb 2022 14:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dpaa2-switch: fix default return of
 dpaa2_switch_flower_parse_mirror_key
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164493601085.31968.17393307108905491138.git-patchwork-notify@kernel.org>
Date: Tue, 15 Feb 2022 14:40:10 +0000
References: <20220214154139.2891275-1-trix@redhat.com>
In-Reply-To: <20220214154139.2891275-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: ioana.ciornei@nxp.com, davem@davemloft.net, kuba@kernel.org,
 nathan@kernel.org, ndesaulniers@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 14 Feb 2022 07:41:39 -0800 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this representative problem
> dpaa2-switch-flower.c:616:24: warning: The right operand of '=='
>   is a garbage value
>   tmp->cfg.vlan_id == vlan) {
>                    ^  ~~~~
> vlan is set in dpaa2_switch_flower_parse_mirror_key(). However
> this function can return success without setting vlan.  So
> change the default return to -EOPNOTSUPP.
> 
> [...]

Here is the summary with links:
  - dpaa2-switch: fix default return of dpaa2_switch_flower_parse_mirror_key
    https://git.kernel.org/netdev/net/c/2a36ed7c1cd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


