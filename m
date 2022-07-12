Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC823A9
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 05:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C785C341CE;
	Tue, 12 Jul 2022 05:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657605015;
	bh=tjDAFWMUaCd/gjFL7LXU8CNijhak50PUBy7ftNMmNfk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kF0dV6jMkR2vo4p2d6kaPVO1CNSGEDZzACTMzh38Ux2XJbdQZJ0PLnJ3saygnIxVG
	 fkDwDn3cslwwfqpLb7MSgmkoHPQv5ovvc7tFBNw9XOMknRZ143KSXr7VNA0N06DWg/
	 Hu5nNwQ3Brx7xWD+lBxYq4ZziI8RFTgTwyAQYmoZT35obBsdf9Z+BVDB0A2rjC2BXH
	 5FWIEAUK6+2kx80FrYRpZvSr6WTMv/m0IH3Jw0zIgOcke5QN//2RiADwoDTDUqzAj0
	 fVPACfEmrFBZ0/7H+sniRTMKpDDcBAt8lseAJajyG7VsnbKk8SHeLF65YndlmV8RSd
	 sw5KM5wSzRz9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 749A8E45224;
	Tue, 12 Jul 2022 05:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] amd-xgbe: fix clang -Wformat warnings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165760501547.3229.11142001754372136783.git-patchwork-notify@kernel.org>
Date: Tue, 12 Jul 2022 05:50:15 +0000
References: <20220708232653.556488-1-justinstitt@google.com>
In-Reply-To: <20220708232653.556488-1-justinstitt@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, thomas.lendacky@amd.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  8 Jul 2022 16:26:53 -0700 you wrote:
> When building with Clang we encounter the following warning:
> | drivers/net/ethernet/amd/xgbe/xgbe-dcb.c:234:42: error: format specifies
> | type 'unsigned char' but the argument has type '__u16' (aka 'unsigned
> | short') [-Werror,-Wformat] pfc->pfc_cap, pfc->pfc_en, pfc->mbc,
> | pfc->delay);
> 
> pfc->pfc_cap , pfc->pfc_cn, pfc->mbc are all of type `u8` while pfc->delay is
> of type `u16`. The correct format specifiers `%hh[u|x]` were used for
> the first three but not for pfc->delay, which is causing the warning
> above.
> 
> [...]

Here is the summary with links:
  - amd-xgbe: fix clang -Wformat warnings
    https://git.kernel.org/netdev/net-next/c/2afe46474ba3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


