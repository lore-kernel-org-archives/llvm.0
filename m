Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04051FB1
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 06:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58DF0C433A0;
	Fri, 31 Mar 2023 06:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680244220;
	bh=fmKCRg7mePYqT1xi/5qnVShpBi8pSuISIr5u0ImVYlE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=d2YYWdaNN9U8UD/b5J8coaLXNftrQdQGmh1bs7WtHO+rxVB9gZz4xODrEhINocACT
	 yP59kkPyHTKUJHtDJZXEKu38o5CORCvbjx96BUUV1DjZh/0Pcaey7rPPKR5ZbVhris
	 ezqUynsJD9FW88zdVj2RkPaOyoTX+WFTjyKuiwC+3Nn3wIf3XyUyz+/7weta8drkPN
	 NDpeGl+yf6V5SnYQP0NUCfRAo0EDJG4hw6JB7eDFHQTNhKn7mE7XmkzE9vcUAG9L/m
	 9zGUBjeqK8nbpt5HlsAnclpuAAxRkcHGn7y0XoqNL/KezWTuA3wCdkd4CQNJZ7Vsnw
	 Hpf2gFzyZ6V2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 35C3BE2A032;
	Fri, 31 Mar 2023 06:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ksz884x: remove unused change variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168024422021.32019.4240324889662085483.git-patchwork-notify@kernel.org>
Date: Fri, 31 Mar 2023 06:30:20 +0000
References: <20230329125929.1808420-1-trix@redhat.com>
In-Reply-To: <20230329125929.1808420-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
 petrm@nvidia.com, leon@kernel.org, shayagr@amazon.com,
 wsa+renesas@sang-engineering.com, yangyingliang@huawei.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 29 Mar 2023 08:59:29 -0400 you wrote:
> clang with W=1 reports
> drivers/net/ethernet/micrel/ksz884x.c:3216:6: error: variable
>   'change' set but not used [-Werror,-Wunused-but-set-variable]
>         int change = 0;
>             ^
> This variable is not used so remove it.
> 
> [...]

Here is the summary with links:
  - net: ksz884x: remove unused change variable
    https://git.kernel.org/netdev/net-next/c/9a865a98a336

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


