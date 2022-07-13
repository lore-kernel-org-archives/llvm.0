Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A77615AC
	for <llvm@lists.linux.dev>; Wed, 13 Jul 2022 00:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB0D4C341C8;
	Wed, 13 Jul 2022 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657673412;
	bh=FULydODn5+1GIYXvWDq1EJGhxG4JhV2sNKyWpfs2M5c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hXia5bG6S/KfKzswMavDh2reXVXCChM3hWTJmWvVN3oel/rsnilbNDrwJ3hcI1U+D
	 E5v3jp2xzJBzBUc5vtc7vfaT6rH3gNa6PRDryeVn8+SUDz4KYxa56Y5YMNzqZmHZP1
	 lxkzokveLeAwIOlK7CfqEUV0mIKdoOndwLng9uU5YazHeDtQw7RlUpQJ70WyyGEpHp
	 m1LOIX03o8C4v6YNzK3v987gvj1Ny0i/cVRmJGkZZDQBHBusoMOYGGgYx4K5/K+Yze
	 mfseP2ZTWDT5yI6MjQdqu26an4LZMZIZ11RpVUiwJ+SFs6DxNWPDHE4JcSxOl8Z2gi
	 mPn7R4gzbRcFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE7DFE45224;
	Wed, 13 Jul 2022 00:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] nfp: fix clang -Wformat warnings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165767341277.27962.1180847720073982444.git-patchwork-notify@kernel.org>
Date: Wed, 13 Jul 2022 00:50:12 +0000
References: <20220712000152.2292031-1-justinstitt@google.com>
In-Reply-To: <20220712000152.2292031-1-justinstitt@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: simon.horman@corigine.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, kuba@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, fei.qin@corigine.com,
 yu.xiao@corigine.com, yinjun.zhang@corigine.com,
 dirk.vandermerwe@netronome.com, leon@kernel.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 11 Jul 2022 17:01:52 -0700 you wrote:
> When building with Clang we encounter these warnings:
> | drivers/net/ethernet/netronome/nfp/nfp_app.c:233:99: error: format
> | specifies type 'unsigned char' but the argument has underlying type
> | 'unsigned int' [-Werror,-Wformat] nfp_err(pf->cpp, "unknown FW app ID
> | 0x%02hhx, driver too old or support for FW not built in\n", id);
> -
> | drivers/net/ethernet/netronome/nfp/nfp_main.c:396:11: error: format
> | specifies type 'unsigned char' but the argument has type 'int'
> | [-Werror,-Wformat] serial, interface >> 8, interface & 0xff);
> 
> [...]

Here is the summary with links:
  - nfp: fix clang -Wformat warnings
    https://git.kernel.org/netdev/net-next/c/ef2a95db8900

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


