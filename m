Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB915ACC
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 11:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11D0C433C8;
	Wed, 20 Sep 2023 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695208468;
	bh=4ohIM+PR0LkQKum0byuzz3ycyYgyXeMylliHgM3EBoQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ijaRBULS666AbH3P/pJ1eLSNRJVlcFLP2EhIlkqKmf67PK3VEk0FGPCGvEuEQDmS7
	 j1aCPJ66Nitqle4/qWtja+jVqxH2qBTrvVvTWPAMlK74IvnTkUNAzuSIhvdakto8VV
	 7NNJCtv0QZLkosnal/BdrOVmbQAIvb2TGVVOUd3E6oZbxU8+oSwwktwz/Io2brXEQE
	 e1vd39tAiQkcBu2zMneGhhamjGIlwU57BCfvYreadbW3zg6RkfMXtR5oQSzsh/ikRx
	 bLfGnluPZKjQ2kpMKSOdr4HuUgpvLexkddvsXwOf5eIQsaHg4WOa2UXIUHSAdebaxJ
	 IojSj22oBbFBw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: brcmfmac: Annotate struct brcmf_gscan_config with
 __counted_by
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230915200542.never.417-kees@kernel.org>
References: <20230915200542.never.417-kees@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Arend van Spriel <aspriel@gmail.com>, Kees Cook <keescook@chromium.org>,
 Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Hector Martin <marcan@marcan.st>, Ryohei Kondo <ryohei.kondo@cypress.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-wireless@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169520846255.991705.4120611293307630241.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 11:14:24 +0000 (UTC)

Kees Cook <keescook@chromium.org> wrote:

> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct brcmf_gscan_config.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Arend van Spriel <aspriel@gmail.com>
> Cc: Franky Lin <franky.lin@broadcom.com>
> Cc: Hante Meuleman <hante.meuleman@broadcom.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Ryohei Kondo <ryohei.kondo@cypress.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: brcm80211-dev-list.pdl@broadcom.com
> Cc: SHA-cyfmac-dev-list@infineon.com
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Patch applied to wireless-next.git, thanks.

cf74cdc6e581 wifi: brcmfmac: Annotate struct brcmf_gscan_config with __counted_by

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230915200542.never.417-kees@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

