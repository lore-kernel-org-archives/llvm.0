Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1192E1102
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 07:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A103FC433AC;
	Wed, 29 Mar 2023 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680073226;
	bh=o3XMwkKFc/9gw3C2hK2L/IcL6DgEwgMxWrL7BZDVfmk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZBQtbh8b29TURLpAsY7EgF3z6dQRIIRgy6J7j6DYhzRjp1o8dWPs387fc8tYWOvbJ
	 qoUQw0iXgpyyfZYzS7tBEPJS5mADsMCMM6JBPXj0CiHK8YzyMaJazYyqec3q1m3PQn
	 uWXAkUA4rb2dtC5q+14eSYWciNnigB7Jxa9EPmxrsOky7RCpsOIJsRA727yYw/qM+d
	 UaPbaR9w+zUvdA37JUBWY9y52p/otcNGqKdlAT57taWMRHCL7Ni1tWWPYYHEblFbU4
	 wu1kSX/SGATcoyirKd4umc2dz9wvbc+/q9nqR0iHXyMKI3MimxM88ndo4XjOjizIIb
	 8S/h0nGzLkIgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A3ECE55B23;
	Wed, 29 Mar 2023 07:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: 8390: axnet_cs: remove unused xfer_count
 variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168007322649.11543.775880323471781097.git-patchwork-notify@kernel.org>
Date: Wed, 29 Mar 2023 07:00:26 +0000
References: <20230327235423.1777590-1-trix@redhat.com>
In-Reply-To: <20230327235423.1777590-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 27 Mar 2023 19:54:23 -0400 you wrote:
> clang with W=1 reports
> drivers/net/ethernet/8390/axnet_cs.c:653:9: error: variable
>   'xfer_count' set but not used [-Werror,-Wunused-but-set-variable]
>     int xfer_count = count;
>         ^
> This variable is not used so remove it.
> 
> [...]

Here is the summary with links:
  - net: ethernet: 8390: axnet_cs: remove unused xfer_count variable
    https://git.kernel.org/netdev/net-next/c/e48cefb9c8d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


