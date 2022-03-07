Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548EC7A
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 12:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED5EBC340F5;
	Mon,  7 Mar 2022 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646656211;
	bh=HPwXi6u2RxyXpPRxeLThCpw0lecTKeSTLtRjAnp6Cs8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WXgdA2vucVVKGhbcrARYbAoCqySvVnegfhdb3jZ/WZWgdw3BX0oP7q0FnDOOxHy2e
	 uik+sLVf8fOTBGh1/XDtQqoGuKoI5jxgZOiwG/noE68GfQEUwlyutPn3+fy1AwXiea
	 EzthY/kP8pnucMTWUCpmA+py3zxx2C98SouPdl8eg5wJ92FV1yb5FxbPqaN9wlIdYH
	 WKJvgSWulIHCUR8NMNI6FAJH2w05691DuzLqxjPIFQNMfhJky8G3XYL/Hqb1Co54qR
	 +Rw7I1qfsOrMVGasczD3459D1x+8M4E8ztni6osgCA7QaI5VJYmXQdKWwn7HohJggd
	 1cIF+IMWHUmHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C819DE6D3DE;
	Mon,  7 Mar 2022 12:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: dsa: return success if there was nothing to do
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164665621081.9112.654277203956305910.git-patchwork-notify@kernel.org>
Date: Mon, 07 Mar 2022 12:30:10 +0000
References: <20220305171448.692839-1-trix@redhat.com>
In-Reply-To: <20220305171448.692839-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat,  5 Mar 2022 09:14:48 -0800 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this representative issue
> dsa.c:486:2: warning: Undefined or garbage value
>   returned to caller
>   return err;
>   ^~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - net: dsa: return success if there was nothing to do
    https://git.kernel.org/netdev/net-next/c/cd5169841c49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


