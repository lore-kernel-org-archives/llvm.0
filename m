Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C31FBA
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 13:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857E1C385A1;
	Tue, 12 Apr 2022 13:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649770649;
	bh=v0nDaaCQ3usmsYxnhE/FHNZck2HIGICmWaiMBdencwI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Uk22QgIvlCLGqhttJUlJHTKFNSZX3+X8U3p7zjNDrYvQZ51Q+P+X/ad8ErHVMVOVB
	 AbsreyM2rucCIm8k3sOR9v5RGUoilV/1m6IzSXvTJ5VW+WDsOrwwC61nkO+ItW/MSV
	 23oD+7nfadTQw0idWgv8adiHLZGLOanERg0NgFEHS2ODvDLmfhqqVe3jpVVHccqGts
	 JIkq8FvcNzgNVvGqIDsMdr09ViFum4BZiR55Zq672PyUeOAJDUURNLOf3RkCKAiX44
	 geNC39ZapXVaX88pE0H4QQ66mC9DgYk8RMs6nV0vuKqKnhEF8zpmInujfPFmMs+0L+
	 8cjrQNJwae/vQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rtw89: ser: add a break statement
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220407175349.3053362-1-trix@redhat.com>
References: <20220407175349.3053362-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: pkshih@realtek.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164977064177.31115.17806762798615887989.kvalo@kernel.org>
Date: Tue, 12 Apr 2022 13:37:26 +0000 (UTC)

Tom Rix <trix@redhat.com> wrote:

> The clang build fails with
> ser.c:397:2: error: unannotated fall-through
>   between switch labels [-Werror,-Wimplicit-fallthrough]
>         default:
>         ^
> The case above the default does not have a break.
> So add one.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I took Zong's version:

https://patchwork.kernel.org/project/linux-wireless/patch/20220408001353.17188-2-pkshih@realtek.com/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220407175349.3053362-1-trix@redhat.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

