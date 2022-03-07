Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747013B38
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07B2CC36AE2;
	Mon,  7 Mar 2022 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646656211;
	bh=pMA67n9Csz8E5tZQ3OW7VwogqSPNXbNWYTt/Qt8n1/s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NEY5UIfIEJfMeVJ7kv2/Uwv1Ly7Q179boj4eVgqPWich1o5CsJ7D+qsXnnA/67ZDD
	 WH4VVEPVsgy0MP1sW2z+A6fnCvm9tjqDOzxls1blPT6PICca0gYvv+LYHiLho3TwV4
	 DPxF8VnoiRXWELkr4BrYszdoCfeYueeqg2eHm+VYQY4U4yOpxWGzqQBGf61lHZMo4+
	 xVRf9OUhNDt5rCBrCr/+YQv+60/WgW7bqs0Entk0nGcj3TwoS7SosrxLQiwuSVkoSm
	 Kl6VpZZIA2GEl6c69nKeYy08GAh0LoPBTH4kptNYOvo8rHkQ0C4l0EsFFpxDm5mzTW
	 vMRUKVmHHAiHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DCEE9EAC081;
	Mon,  7 Mar 2022 12:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: rtnetlink: fix error handling in rtnl_fill_statsinfo()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164665621090.9112.14322415575261103193.git-patchwork-notify@kernel.org>
Date: Mon, 07 Mar 2022 12:30:10 +0000
References: <20220305181346.697365-1-trix@redhat.com>
In-Reply-To: <20220305181346.697365-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, idosch@nvidia.com, petrm@nvidia.com,
 edumazet@google.com, avagin@gmail.com, yajun.deng@linux.dev,
 johannes.berg@intel.com, cong.wang@bytedance.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat,  5 Mar 2022 10:13:46 -0800 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> The clang static analyzer reports this issue
> rtnetlink.c:5481:2: warning: Undefined or garbage
>   value returned to caller
>   return err;
>   ^~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - net: rtnetlink: fix error handling in rtnl_fill_statsinfo()
    https://git.kernel.org/netdev/net-next/c/57d29a2935c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


