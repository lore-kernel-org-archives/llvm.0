Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA8B7A
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 12:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C9B5C340F4;
	Mon,  7 Mar 2022 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646656811;
	bh=PN/nEQ7czoCcNRM3+QJffb3c4Xa5AaMxJWXIngv9K8w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kDhk1t7u5xGZyAuX5FDKtbBwgq3MboggHhg5cuK0ryEj9J7v5xwfz7bHFrwph4ZVy
	 KHhnrdii2TqOXKCSOKwHeDQUSje+xozy501rzQWX3OspTWq6mGegoa2DgDHwN5/hjd
	 zVpChGKusm+eqKxOAWexPvvfIfLp0GwFtT+ft+2iZiu3ChLCfi+alXkAjt5dOUYNlV
	 d/fCv3xGDMBMQao0Osop7KmisvPiSmMY+PcqLsWZvBz0Gfr+lyC8hUUJVRD4oaKEdb
	 bQibGCtZIAdZPU4xTp8OmkC2mf3/ZEdKy7FT8u5a1j7SHcqnyfYufzAGQjbh3Ej+Ax
	 J7BpMBl+FgTqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61ABEEAC081;
	Mon,  7 Mar 2022 12:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] qed: return status of qed_iov_get_link
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164665681139.14619.5267479786896733708.git-patchwork-notify@kernel.org>
Date: Mon, 07 Mar 2022 12:40:11 +0000
References: <20220305150642.684247-1-trix@redhat.com>
In-Reply-To: <20220305150642.684247-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: aelior@marvell.com, manishc@marvell.com, davem@davemloft.net,
 kuba@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 Yuval.Mintz@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat,  5 Mar 2022 07:06:42 -0800 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> qed_sriov.c:4727:19: warning: Assigned value is
>   garbage or undefined
>   ivi->max_tx_rate = tx_rate ? tx_rate : link.speed;
>                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - qed: return status of qed_iov_get_link
    https://git.kernel.org/netdev/net/c/d9dc0c84ad2d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


