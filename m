Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62682CA9
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 14:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5ED7C6108D;
	Tue, 26 Oct 2021 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635257408;
	bh=i24Vsq0rl4VR7ulu+4emyK41oC5kvHnAgYQhbpX5tJI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TXz1V03AxyGBtNt3TUiLWhnhAag7g7GSubDmQ4rIBgYsEDUHTEiuwR+WYyasrAOQq
	 /BC1OcOwuphMgHRhjvguqg64t1v23SQESv01GEPfTbkjj2OWh0FixG2xSfg7kWbI+j
	 BqrznNgcG6jCuphHphK60uzuZ9zZsW5sKLGfq52Y7fIw6BW8oQgLZYZTguYOpzTuGZ
	 zalkeeN0JrlxJFLE75MEWkAeQ2OkMKjJZx8OgVqyeM176kJbn7qw8Y4wS8x80jRtCN
	 I+Wv34D5uzL5ifx6V7c3MW79IpZfo2pYIGsRuNeEhlDbr8NeP3Aienv3c5bPHUfkno
	 hMcA2if6mz/6g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 44585608FE;
	Tue, 26 Oct 2021 14:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] net: ax88796c: Fix clang -Wimplicit-fallthrough in
 ax88796c_set_mac()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <163525740827.12899.14472352230591916919.git-patchwork-notify@kernel.org>
Date: Tue, 26 Oct 2021 14:10:08 +0000
References: <20211025211238.178768-1-nathan@kernel.org>
In-Reply-To: <20211025211238.178768-1-nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: l.stelmach@samsung.com, davem@davemloft.net, kuba@kernel.org,
 ndesaulniers@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 25 Oct 2021 14:12:38 -0700 you wrote:
> Clang warns:
> 
> drivers/net/ethernet/asix/ax88796c_main.c:696:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         case SPEED_10:
>         ^
> drivers/net/ethernet/asix/ax88796c_main.c:696:2: note: insert 'break;' to avoid fall-through
>         case SPEED_10:
>         ^
>         break;
> drivers/net/ethernet/asix/ax88796c_main.c:706:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         case DUPLEX_HALF:
>         ^
> drivers/net/ethernet/asix/ax88796c_main.c:706:2: note: insert 'break;' to avoid fall-through
>         case DUPLEX_HALF:
>         ^
>         break;
> 
> [...]

Here is the summary with links:
  - [1/2] net: ax88796c: Fix clang -Wimplicit-fallthrough in ax88796c_set_mac()
    https://git.kernel.org/netdev/net-next/c/3c5548812a0c
  - [2/2] net: ax88796c: Remove pointless check in ax88796c_open()
    https://git.kernel.org/netdev/net-next/c/971f5c4079ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


