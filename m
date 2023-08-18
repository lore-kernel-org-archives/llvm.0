Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA16647;
	Fri, 18 Aug 2023 03:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33D18C433C7;
	Fri, 18 Aug 2023 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692328222;
	bh=y9P/3/WGyEw+CQqUCiUgiFpqMBL0DcUQoe8g58/Afs8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TdlFlxaGNnjEfkiv09QR0t1UyigA/lOjQGICLQESx/jXozINFKPufb3Y+LE+CL0WQ
	 ihdW7FWGXOoWwrYDhwz7SrTRXhcIB3N5DexWMqvqeVfMo91H3dw/vk7frXk6HqIYVS
	 fsnxFTitJmXR/UwmsAR5IsyIW/HWvNN9oRfaMCkIyRfgqnSkY3Q85JT0s/s649Vejf
	 rgoYNt7Rs2A3fqilQyEW7WCUnPMtqm+CPzFJ6uZIpTV2fNpj/d2GpeybVXr1T6f72y
	 SOa1utSyGSIWviOUrYLv2C7ugLiHp7AUQjCOCk/fDFcI1YtfRu0EpCAP40+BA+cDEE
	 KoEeKnQc86DVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1616BC395C5;
	Fri, 18 Aug 2023 03:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: mdio: fix -Wvoid-pointer-to-enum-cast warning
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <169232822208.13423.9185597276539868139.git-patchwork-notify@kernel.org>
Date: Fri, 18 Aug 2023 03:10:22 +0000
References: <20230815-void-drivers-net-mdio-mdio-xgene-v1-1-5304342e0659@google.com>
In-Reply-To: <20230815-void-drivers-net-mdio-mdio-xgene-v1-1-5304342e0659@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: iyappan@os.amperecomputing.com, keyur@os.amperecomputing.com,
 quan@os.amperecomputing.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Aug 2023 20:35:59 +0000 you wrote:
> When building with clang 18 I see the following warning:
> |       drivers/net/mdio/mdio-xgene.c:338:13: warning: cast to smaller integer
> |               type 'enum xgene_mdio_id' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         338 |                 mdio_id = (enum xgene_mdio_id)of_id->data;
> 
> This is due to the fact that `of_id->data` is a void* while `enum
> xgene_mdio_id` has the size of an int. This leads to truncation and
> possible data loss.
> 
> [...]

Here is the summary with links:
  - net: mdio: fix -Wvoid-pointer-to-enum-cast warning
    https://git.kernel.org/netdev/net-next/c/f3add6dec36d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


