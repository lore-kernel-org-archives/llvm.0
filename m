Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EE84C6E
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 23:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3141C340EC;
	Thu, 17 Mar 2022 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647561012;
	bh=lBNdt/nO7ZFYgwo/Ygc3BGmzIQC0WVaK+x/djCiU1jU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jS3vRB9JS/QIoJwWZem26OC8MH8F/DGw+nzH7FtU00AhB3n8MzBGB3J7RTpsilK1M
	 gK3TyjtG4g0luzSN0Xrnqo76hpEWzCcvBVCgT9O8AcNGOF+EBd1NzjcapuxcsdWb7s
	 mg0ORIH75CE9E6+RLVaG0/oPN+Bk5+IxMTnQms374thqkg36cKCi38GlXhIxmRApSl
	 BIdftxu6LdUNUPumkZwgm3IfC6vySlYTQs5jgG6LigpBvyDiC7MEN25tV4rb42RPHo
	 6RB+i/H2+4dn8hOYe6qe5/8wkXn3mJMZ1Cs4zHA5AWx1D3D/SnD2kg1BRarEVqcsZ7
	 3wL/f4QpzZtSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B560CF03842;
	Thu, 17 Mar 2022 23:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] vlan: use correct format characters
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164756101273.14093.94529379877808891.git-patchwork-notify@kernel.org>
Date: Thu, 17 Mar 2022 23:50:12 +0000
References: <20220316213125.2353370-1-morbo@google.com>
In-Reply-To: <20220316213125.2353370-1-morbo@google.com>
To: Bill Wendling <morbo@google.com>
Cc: davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 16 Mar 2022 14:31:25 -0700 you wrote:
> When compiling with -Wformat, clang emits the following warning:
> 
> net/8021q/vlanproc.c:284:22: warning: format specifies type 'unsigned
> short' but the argument has type 'int' [-Wformat]
>                                    mp->priority, ((mp->vlan_qos >> 13) & 0x7));
>                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - vlan: use correct format characters
    https://git.kernel.org/netdev/net-next/c/8624a95ecdea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


