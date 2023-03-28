Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F207EA
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 02:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64FC0C433D2;
	Tue, 28 Mar 2023 02:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679971819;
	bh=aQDi9ckmCb/RBFxUSwC2YEMEUG9O2Ay2bDiRKwbkDLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TZ3QLfBeNv3xH9ry2owvom4TXFodO4NkcSldllsjNlTDctwgsMevafxx5+a1qBsSg
	 lKp0OoxFJPX34ElfgiNrWN/bphDZzb/tQjT/5yhfw5UGqNa/pKx01dO5U5nGpWttDf
	 sQbIurqwfZ5UQ1zJ2CCVR41K78mzYxYFc8wKSV8pmIMPGTXfHDPwbbLDhT0Q+XlHf0
	 R4onTLr2yG+yQTFrpT5UQuGAJMKYuBBHCLluRX0GPOhcfvJxmcBouJmUezvalzyxe7
	 W0okBFGgbJHK0953MbAiOlQo37fUBdjIWWzbuIhcpjKOfKPVpRdtPSBBmkPWMc5QGX
	 BJAiL/+YRsVxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 48970E4D02F;
	Tue, 28 Mar 2023 02:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] qed: remove unused num_ooo_add_to_peninsula variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167997181929.12698.4724410106148898115.git-patchwork-notify@kernel.org>
Date: Tue, 28 Mar 2023 02:50:19 +0000
References: <20230326001733.1343274-1-trix@redhat.com>
In-Reply-To: <20230326001733.1343274-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: aelior@marvell.com, manishc@marvell.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 25 Mar 2023 20:17:33 -0400 you wrote:
> clang with W=1 reports
> drivers/net/ethernet/qlogic/qed/qed_ll2.c:649:6: error: variable
>   'num_ooo_add_to_peninsula' set but not used [-Werror,-Wunused-but-set-variable]
>         u32 num_ooo_add_to_peninsula = 0, cid;
>             ^
> This variable is not used so remove it.
> 
> [...]

Here is the summary with links:
  - qed: remove unused num_ooo_add_to_peninsula variable
    https://git.kernel.org/netdev/net-next/c/2bcc74ffd21a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


