Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068FD2C82
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 14:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95D49C340E1;
	Wed, 19 Jan 2022 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642603209;
	bh=G4p5XIvQTrhdr3/JW6GjIPyASfXW3iBFXQuSMUg6NWw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UZziCWkZS3z0auxlo1XPtzsME24/xtB56O9k6KtXefhkVKcbd2AhUO+JkJYp1dz84
	 dA5vgiyCMYbeCks2l3cvKtZdXPEzHMxtHGYhkbBaUcCK2GvxCKe8KTpvgiEKe9l+8f
	 rIWSZgJYIR1U763dmusMDlLXXu2OjdlVWrpYVHH2vnzU0Jj+DFbXb5jssW0kt3rSJT
	 6s3TIaLU+MTdNMuzz0eN6FlW51j/s7e7aiKmNsOv11gHodUCbb2ldbD8fcdheww52I
	 fR/8GJ3O4+mJIvw4FPfSZtZRDG1GTzhRgGWtomDvxVlKN1ppDdlOWITFoCAg2dcoyF
	 cVozd2l7LMsAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7DDADF6079A;
	Wed, 19 Jan 2022 14:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: mscc: ocelot: fix using match before it is set
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164260320951.14096.15974915502034156396.git-patchwork-notify@kernel.org>
Date: Wed, 19 Jan 2022 14:40:09 +0000
References: <20220118134110.591613-1-trix@redhat.com>
In-Reply-To: <20220118134110.591613-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: vladimir.oltean@nxp.com, claudiu.manoil@nxp.com,
 alexandre.belloni@bootlin.com, davem@davemloft.net, kuba@kernel.org,
 nathan@kernel.org, ndesaulniers@google.com, xiaoliang.yang_1@nxp.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 18 Jan 2022 05:41:10 -0800 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> ocelot_flower.c:563:8: warning: 1st function call argument
>   is an uninitialized value
>     !is_zero_ether_addr(match.mask->dst)) {
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - net: mscc: ocelot: fix using match before it is set
    https://git.kernel.org/netdev/net/c/baa59504c1cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


