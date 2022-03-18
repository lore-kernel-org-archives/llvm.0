Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7215137
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9620C340F0;
	Fri, 18 Mar 2022 21:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647639010;
	bh=6ZLx1m6ykQe705DmybtQskmGsNNS83XaLRHUMfoEAsI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C7DamhM3ePeMEgVZmCsZHN3KO2A2U9JfPCRy/QOgM3PZ7N8hjg1EknXk1dOpeEV/f
	 GF6zKyVZa5PNKaEXJkwdryz40oWR1YrYrOiPF+yvwZH6vy4rfpE5u/HQVQhDdeqcaI
	 JYP7FPeQY+xDLYJdlkzoyBT6rC4bYjBz8ZlkO800gvChiBznNmY9kSA/eGMbUkxEO1
	 U0OjDX63uoo49G+pZP1rpGUZf2fPRw26RshJcFP+C8TAlJaM1tMLPYSRqbLFtx9iWB
	 PAbJsquc5WGBb1SY+vQEbPb47cTmg5dCbtj4Lqh7/NpkfmmZSJtJc1oFGbdV96H5gD
	 2VR6CTTwyDSfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF387F03842;
	Fri, 18 Mar 2022 21:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] qlcnic: remove redundant assignment to variable index
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164763901071.24897.18138645596476086788.git-patchwork-notify@kernel.org>
Date: Fri, 18 Mar 2022 21:30:10 +0000
References: <20220318012035.89482-1-colin.i.king@gmail.com>
In-Reply-To: <20220318012035.89482-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: shshaikh@marvell.com, manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
 davem@davemloft.net, pabeni@redhat.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 18 Mar 2022 01:20:35 +0000 you wrote:
> Variable index is being assigned a value that is never read, it is being
> re-assigned later in a following for-loop. The assignment is redundant
> and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c:1358:17: warning:
> Although the value stored to 'index' is used in the enclosing expression,
> the value is never actually read from 'index' [deadcode.DeadStores]
> 
> [...]

Here is the summary with links:
  - qlcnic: remove redundant assignment to variable index
    https://git.kernel.org/netdev/net-next/c/79fdce0513ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


