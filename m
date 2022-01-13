Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B95729CA
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 13:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAE1AC36AED;
	Thu, 13 Jan 2022 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642078811;
	bh=Pcp2+IA9W2UqzZ3KCK/QZsr41sDDGaYv1iGIzsGnkLs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s8ZP0yPIW7qxXczd2S0UYyU9alNOJpDj7xal5H32hGZOLikRbL6oSOjundaYXguca
	 6ECNw+vcRp5DZgPzNmIYJ63V8/K9ECuePte7DoUrzbcfoIrLbvBR102G0W+2CoII5O
	 dOOtAfXFPh2ewin57jcaRutJdz+2oOPChOUq5Zxn2skN5SeVTSbh30OiqNC/HyMu/a
	 J/fcLVP5n9O8AFm3UgHCKaO6GGUgiBs4tDWXotU1JzlT0rFYGuf7wrei7Ti0Pqp9GE
	 qUpw5l747cYcgJmd4pdsLHAWEmnW56HuUEuO0qDUJzw1FFoafGQtE0r/jlDDB5Ixbv
	 pSgRgE9hX1dNg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B627AF6078E;
	Thu, 13 Jan 2022 13:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] atm: iphase: remove redundant pointer skb
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164207881173.26897.4543675322027026942.git-patchwork-notify@kernel.org>
Date: Thu, 13 Jan 2022 13:00:11 +0000
References: <20220112235533.1281944-1-colin.i.king@gmail.com>
In-Reply-To: <20220112235533.1281944-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 12 Jan 2022 23:55:33 +0000 you wrote:
> The pointer skb is redundant, it is assigned a value that is never
> read and hence can be removed. Cleans up clang scan warning:
> 
> drivers/atm/iphase.c:205:18: warning: Although the value stored
> to 'skb' is used in the enclosing expression, the value is never
> actually read from 'skb' [deadcode.DeadStores]
> 
> [...]

Here is the summary with links:
  - atm: iphase: remove redundant pointer skb
    https://git.kernel.org/netdev/net/c/d7b430341102

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


