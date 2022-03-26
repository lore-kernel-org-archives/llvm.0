Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D433D63
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 18:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B58F0C340ED;
	Sat, 26 Mar 2022 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648320610;
	bh=Wqw4eQuViEzG4+yfG4QJHnYoM5iKeaKNB4G1IP3GJmI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cdhxYo+QdLZRWafxS14zZ3iKCxSJjXGixUDqYZNEcOX0gTDC5Du96oSSQsYzi15MY
	 dGQLz83hhjvOZGrHMPLXxkMJ52b0TF/JyPbFxCG08F9hGOonGOCBcq+nayWsy6tjUL
	 nBULx3KKBhIezCgfL92wVML4CvDU/PQvuJdaRez+2poYUyg5xFeWInUXlVj3qFQikB
	 13qXhyWIeoDQvymy/3CYYRHpdse2WeJ3JZpCqB33yOjID80PdFFj+olDQDewnP1/Fa
	 RLgXNLDlMj1SBqjoovWvAgVpptqfYwDUZX2VfnCQYTm4YkjytcL+pb44EGUaF24HGU
	 UvHoFDosTNvwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B717F03847;
	Sat, 26 Mar 2022 18:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] qlcnic: dcb: default to returning -EOPNOTSUPP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164832061063.28772.2120074851105666171.git-patchwork-notify@kernel.org>
Date: Sat, 26 Mar 2022 18:50:10 +0000
References: <20220326172003.2906474-1-trix@redhat.com>
In-Reply-To: <20220326172003.2906474-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: shshaikh@marvell.com, manishc@marvell.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, sucheta.chakraborty@qlogic.com,
 GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat, 26 Mar 2022 10:20:03 -0700 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> qlcnic_dcb.c:382:10: warning: Assigned value is
>   garbage or undefined
>   mbx_out = *val;
>           ^ ~~~~
> 
> [...]

Here is the summary with links:
  - qlcnic: dcb: default to returning -EOPNOTSUPP
    https://git.kernel.org/netdev/net/c/1521db37f0d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


