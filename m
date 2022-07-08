Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C1627
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 01:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD73EC341C8;
	Fri,  8 Jul 2022 01:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657243812;
	bh=3qsxC2UJHgQdMvNB3J6vTootEZtZA3FgN4B7niAdi+U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TKLuF6oGwldsso3GxLss9nJe3I6RA8CBIB8JNgPN9B5XHyk4MBYeTlxVfbvB69iZs
	 6DR41KRFsETZmr2DJu/x2wJaYBX6y7mq0DX2rfYBlhWN3ba+R38jGbQv+oRv5SGCA6
	 NQL1H/KMj4zDFVfMRcqY1oeYysIRYMh1QhoW3dr2xqtkK2OIXFQCNu8TZUNjHGXFVI
	 nsdqxE3Ak98OlOL/T9BKFEAPAk6/wsfDQAuQB3UyCoNDIouRaWD5gI0LevrKJv10Q0
	 KHNWN6keIAsRfvDLvvLhUQpkwd/Oba3TJiOKogF1ZBDewY4FxoiLXF8x4TC8mtI2hW
	 +6btEJGSeFTxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9CDD5E45BD9;
	Fri,  8 Jul 2022 01:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: l2tp: fix clang -Wformat warning
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165724381263.6017.3389511636331557428.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 01:30:12 +0000
References: <20220706230833.535238-1-justinstitt@google.com>
In-Reply-To: <20220706230833.535238-1-justinstitt@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: jchapman@katalix.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  6 Jul 2022 16:08:33 -0700 you wrote:
> When building with clang we encounter this warning:
> | net/l2tp/l2tp_ppp.c:1557:6: error: format specifies type 'unsigned
> | short' but the argument has type 'u32' (aka 'unsigned int')
> | [-Werror,-Wformat] session->nr, session->ns,
> 
> Both session->nr and session->ns are of type u32. The format specifier
> previously used is `%hu` which would truncate our unsigned integer from
> 32 to 16 bits. This doesn't seem like intended behavior, if it is then
> perhaps we need to consider suppressing the warning with pragma clauses.
> 
> [...]

Here is the summary with links:
  - net: l2tp: fix clang -Wformat warning
    https://git.kernel.org/netdev/net-next/c/a2b6111b55f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


