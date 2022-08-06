Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5B57C
	for <llvm@lists.linux.dev>; Sat,  6 Aug 2022 02:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B81C7C433B5;
	Sat,  6 Aug 2022 02:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659754213;
	bh=mZjIUOluJXzR8TpUjV4rU1z6DvZWZxltHJ+5P4t0YsE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nHM/lOG8JvR9Kwn82/2TgyJCyWL0YC6o6A1nTg74GzWoWw7ePZzf7KkdM9KHr4tbC
	 HGaFsEbQR797QjVm3Pptlkkv3fJEMzJAMO2y8slTheeJ9QcVZPkLAy0ANVhn9dpK5w
	 tTrqp7CFdiTZb6IbiH1F2cu+c5QicQpOXyS/CW2xayj/u/uLWU4EJe69xH8YM1unoI
	 RYXnNgTIY/ZqCm6Dce9Qc4N+b7OUqhzBhnCsjYZJoR9mFi2Dm7e4SOStCnvGQgHk5e
	 +38EfVy2RFTxE02MJPt56WCWhp0gMjbpA0i9uMsr/Jto0YEKi5ejktu5qYghJ3gPRk
	 nuQaAmsJgoFKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9D6B4C43143;
	Sat,  6 Aug 2022 02:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: seg6: initialize induction variable to first valid array
 index
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165975421364.14232.3802963353792145443.git-patchwork-notify@kernel.org>
Date: Sat, 06 Aug 2022 02:50:13 +0000
References: <20220802161203.622293-1-ndesaulniers@google.com>
In-Reply-To: <20220802161203.622293-1-ndesaulniers@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: yoshfuji@linux-ipv6.org, dsahern@kernel.org, davem@davemloft.net,
 tglx@linutronix.de, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nathan@kernel.org, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  2 Aug 2022 09:12:03 -0700 you wrote:
> Fixes the following warnings observed when building
> CONFIG_IPV6_SEG6_LWTUNNEL=y with clang:
> 
>   net/ipv6/seg6_local.o: warning: objtool: seg6_local_fill_encap() falls
>   through to next function seg6_local_get_encap_size()
>   net/ipv6/seg6_local.o: warning: objtool: seg6_local_cmp_encap() falls
>   through to next function input_action_end()
> 
> [...]

Here is the summary with links:
  - net: seg6: initialize induction variable to first valid array index
    https://git.kernel.org/netdev/net/c/ac0dbed9ba4c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


