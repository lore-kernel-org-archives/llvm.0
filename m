Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D01736C
	for <llvm@lists.linux.dev>; Sat, 19 Nov 2022 03:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39580C433C1;
	Sat, 19 Nov 2022 03:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668828016;
	bh=WrNWq66A33NIxRY7jVhtSQulqMyrS/rO1WpQZ4OedTQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BE/2dQ7BIpU5chOtEoTkcxHEE3W4ZwuFOEybmIxiXMKbVwFa/k/Z6iwjdzEptNiZN
	 mUi0OyMxXM06WPYt2fLmEhBagkclI8Nnbj9FRpPAAYMZ9vY30sxweltSvlAfOw5oCn
	 483yPDzGQ3G9xp6OQ4eWhdwPyJ7VVy/WcT4nWnvA9SN4hHfpFwwNBOaiT074+rGxTq
	 uKqwH62R5qnyNJzmtGduPcnXIjjuBTa+gCP7JQXcUCaQ+V2p4y/qvTlLgr+Gz3yACk
	 aR/z0svanYH8wdbkCIUIY5qc8E876Rf2n3FffRvDt3JxAuRCFMX6cOgzK4eA/4YcOo
	 F+M3zuvfQnLhA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24D95C395F3;
	Sat, 19 Nov 2022 03:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] netlink: remove the flex array from struct nlmsghdr
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166882801614.12875.6125141397212888728.git-patchwork-notify@kernel.org>
Date: Sat, 19 Nov 2022 03:20:16 +0000
References: <20221118033903.1651026-1-kuba@kernel.org>
In-Reply-To: <20221118033903.1651026-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, keescook@chromium.org, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Nov 2022 19:39:03 -0800 you wrote:
> I've added a flex array to struct nlmsghdr in
> commit 738136a0e375 ("netlink: split up copies in the ack construction")
> to allow accessing the data easily. It leads to warnings with clang,
> if user space wraps this structure into another struct and the flex
> array is not at the end of the container.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Link: https://lore.kernel.org/all/20221114023927.GA685@u2004-local/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] netlink: remove the flex array from struct nlmsghdr
    https://git.kernel.org/netdev/net-next/c/c73a72f4cbb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


