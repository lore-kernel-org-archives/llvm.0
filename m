Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BAF7C
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 18:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5300FC34113;
	Tue, 24 May 2022 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653417012;
	bh=GP5RryM2eOy2O5bC9iq4ToSK1JrnSaWXLglPy8paLP4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V+Py4Q54RGyMQshiLufQfFQYp26TUly4S70IK1zOy+Igy72ZdM2vd0rCEot9l7FcA
	 fw3wPXKmXi9ahusl6hz40GnKcu7LH9Du10etw1/xJcrbDzXP2/xKgqTPareZ5ZnOYL
	 pBEYfvppRKaqc9B8UUBWbGj6QzFhxRPWOYWqy/KBZlwt3Rp/lcWJr9Vi0bdQJ7SwHt
	 5hV1NGPKObdzwkjxkNhdD6t3oWriZQlEdQh9XC/oWOcrlw3vxkzgcMXXWHMB4o6LQq
	 ueQJBkFpHpE6jnZR3jcnnVocxD0HEJSlCm9IVnr6YSsvWQHqSFzMj2h/JigUrYApvp
	 WBV7tEbxfTTpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36FE6F03943;
	Tue, 24 May 2022 18:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ath6kl: Use cc-disable-warning to disable -Wdangling-pointer
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165341701222.5478.18284548057978733772.git-patchwork-notify@kernel.org>
Date: Tue, 24 May 2022 18:30:12 +0000
References: <20220524145655.869822-1-nathan@kernel.org>
In-Reply-To: <20220524145655.869822-1-nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, kvalo@kernel.org, ndesaulniers@google.com,
 trix@redhat.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bot@kernelci.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 24 May 2022 07:56:55 -0700 you wrote:
> Clang does not support this option so the build fails:
> 
>   error: unknown warning option '-Wno-dangling-pointer' [-Werror,-Wunknown-warning-option]
> 
> Use cc-disable-warning so that the option is only added when it is
> supported.
> 
> [...]

Here is the summary with links:
  - ath6kl: Use cc-disable-warning to disable -Wdangling-pointer
    https://git.kernel.org/netdev/net-next/c/48a75b979940

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


