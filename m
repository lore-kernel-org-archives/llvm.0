Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034D7C
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 06:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 912BCC340F3;
	Sat, 26 Feb 2022 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645857011;
	bh=rEhJL39ym3hsLRvBexO7f7Z8xVF2dwN5wlDy/4XSS8c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kBiw43Cw4FxPKCsT/3Y1dGdK+YuZvx6Ia8XS9Gbz90C3tKff8seNXZnoxEEGMy5TK
	 Vxw6xdi3P3rKPj/hhncE1x7/rxgtcGPBRgOFY8XzWkQeKHzdmQNyVs2ExkDDxFun5X
	 r+mtoGw4fZEpU7gIT2ZUqJ7Eg8IpBYD/MyHbXiGPY9PuCjiGPZF+GLHsbtdd3G2j/G
	 KDcWFvWs+3BfETcfz1RwuCeaSVSFcqn+jmWzjKzIS3VfUVfNuk34sq1S0E7QHjvgf7
	 fYZsqoJStcifc0WclDt5IAEftjYcCWvWKSAg7CKttH6iB79dr54hQku4mH6lMwLugn
	 7jW5XW5v05Zww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72818F03839;
	Sat, 26 Feb 2022 06:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] net: dsa: qca8k: return with -EINVAL on invalid port
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164585701146.29742.17771254320187155029.git-patchwork-notify@kernel.org>
Date: Sat, 26 Feb 2022 06:30:11 +0000
References: <20220224220557.147075-1-colin.i.king@gmail.com>
In-Reply-To: <20220224220557.147075-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 24 Feb 2022 22:05:57 +0000 you wrote:
> Currently an invalid port throws a WARN_ON warning however invalid
> uninitialized values in reg and cpu_port_index are being used later
> on. Fix this by returning -EINVAL for an invalid port value.
> 
> Addresses clang-scan warnings:
> drivers/net/dsa/qca8k.c:1981:3: warning: 2nd function call argument is an
>   uninitialized value [core.CallAndMessage]
> drivers/net/dsa/qca8k.c:1999:9: warning: 2nd function call argument is an
>   uninitialized value [core.CallAndMessage]
> 
> [...]

Here is the summary with links:
  - [next] net: dsa: qca8k: return with -EINVAL on invalid port
    https://git.kernel.org/netdev/net-next/c/38455fbcc8ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


