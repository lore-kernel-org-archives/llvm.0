Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E637C
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 03:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D932AC433EF;
	Tue, 21 Mar 2023 03:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679368217;
	bh=5II7b+BkVoa4QOA60BgChtOdWYA0PzzTAZsvlZtgtLw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GdrpCZCIC8A4OKRXMMTtaTDf3wHFP8iv4In0FTOpLiX8avN+ToWtsJxMLxhF87Y4V
	 QEB2xOeZQlenGJ97WqeaSvioVLljgnMI03y0Jj0ORJDER1mWLGMNpRpxSpPMNfjrT4
	 2TynwHJbpEX/AKMozC/d2kDAiZ1YNIdY+/ZlgfqEOOC0XJZmMpbV+pmTLk2P904jfp
	 szSo6CEJbTXmFifsO/JIQWFgtLJGrJRijiLcD7VWYgOC/ghZQWxm2BgZilmccD+DdA
	 66dsoFaIdyQRdjofw2vUSQVwi2ElUPRanYXfHs3SlmoNDXpRsCfgC1+w7o18YqXmx4
	 sIyTTr7F1e7Kg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC675E68D22;
	Tue, 21 Mar 2023 03:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: cxgb3: remove unused fl_to_qset function
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167936821776.24814.6478937204704825271.git-patchwork-notify@kernel.org>
Date: Tue, 21 Mar 2023 03:10:17 +0000
References: <20230319172433.1708161-1-trix@redhat.com>
In-Reply-To: <20230319172433.1708161-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: rajur@chelsio.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 19 Mar 2023 13:24:33 -0400 you wrote:
> clang with W=1 reports
> drivers/net/ethernet/chelsio/cxgb3/sge.c:169:32: error: unused function
>   'fl_to_qset' [-Werror,-Wunused-function]
> static inline struct sge_qset *fl_to_qset(const struct sge_fl *q, int qidx)
>                                ^
> This function is not used, so remove it.
> 
> [...]

Here is the summary with links:
  - net: cxgb3: remove unused fl_to_qset function
    https://git.kernel.org/netdev/net-next/c/a08df15eab0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


