Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEF23D71
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 21:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC3C1C34110;
	Sat, 26 Mar 2022 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648329610;
	bh=0uIKyawOLoHLm394PBEW9HSFN9iKeMVQMYPJNL5EEfo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QRWtOB8X+n+tNJyT813j4O4KjEvNscKDBDZXoo+mVYdnNM06tWh2+qREZYbW+Jgwo
	 98FMcDt87x2y8jvYiR44ERmIyvLRgV5SJUwLpSZteib35Ly56G98muBE6+2j54o2q4
	 lkUnBzOe7fy9VTuQdWB9P2EPW13GUekfxG7LnfC/t85bAh8sK4oUcIUW6emXXcwcEf
	 8DhqlYJocO5D5Hc3SFbSy7kd9n0ObT8mpVX1VD7dzlfZyOJEH0h6sPiBVaol/sMli6
	 /4cO+to8It906fVj58HQuCdJYVqHvrQS7sCzUPIEms+0zaXmGychYv8GozYw02Tgoj
	 796fDx+Ajla3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B88AF03849;
	Sat, 26 Mar 2022 21:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] octeontx2-af: initialize action variable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164832961056.3419.13458141974807020265.git-patchwork-notify@kernel.org>
Date: Sat, 26 Mar 2022 21:20:10 +0000
References: <20220326160306.2900822-1-trix@redhat.com>
In-Reply-To: <20220326160306.2900822-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
 jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, Sunil.Goutham@marvell.com, naveenm@marvell.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat, 26 Mar 2022 09:03:06 -0700 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this representative issue
> rvu_npc.c:898:15: warning: Assigned value is garbage
>   or undefined
>   req.match_id = action.match_id;
>                ^ ~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - octeontx2-af: initialize action variable
    https://git.kernel.org/netdev/net/c/33b5bc9e7033

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


