Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9859A2F24
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 08:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5161FC433A1;
	Wed, 12 Apr 2023 08:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681288819;
	bh=YxlN5kBgNva8PX985QQZfOhsFUE2dtvhBiO+B4X7ayw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=igS8Wn3j43wk82qGQXGLzqUvnL6WntHEUGZJzm2qU9JEdMjp+g6qI6J4ZRWexWAXQ
	 JfgOiyOeaHoZDlpMTMzhOMg9RcSZeSdF6hpEVv9yiF35ZnYqys6nPCP3+yveZmNVpd
	 3eLZYH3sPx6g2rYNzW+usR8VR3IcXFr2Q+0A8owNVLbjMmthChZ+0ZY2yECXASiSdA
	 fnHJmpnG0QNYuUAqbhHGPh1D3FfMHWDcsNnaMbXhMg5w8WhIcyBAOcwwX0Bg224uQi
	 kibLtre1oe/idxZ+hM2p5zfUGf6kR9WgeTK0LTxPBhBoZkm4PeorxKPdhS/0ZQvpbv
	 9Hq/LUTPYq52w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2C7DCE29F4A;
	Wed, 12 Apr 2023 08:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] ksz884x: Remove unused functions
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168128881917.3903.10500748834451240307.git-patchwork-notify@kernel.org>
Date: Wed, 12 Apr 2023 08:40:19 +0000
References: <20230405-ksz884x-unused-code-v2-1-23eb8f7002c4@kernel.org>
In-Reply-To: <20230405-ksz884x-unused-code-v2-1-23eb8f7002c4@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, wsa+renesas@sang-engineering.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Sat, 08 Apr 2023 09:47:54 +0200 you wrote:
> Remove unused functions.
> 
> These functions may have some value in documenting the
> hardware. But that information may be accessed via SCM history.
> 
> Flagged by clang-16 with W=1.
> No functional change intended.
> Compile tested only.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] ksz884x: Remove unused functions
    https://git.kernel.org/netdev/net-next/c/ed72bd5a6790

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


