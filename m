Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821B36AEE
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 13:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9AAC433C7;
	Wed, 20 Sep 2023 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217853;
	bh=ZYMgDvz7cLiEi48+fLoU5oYwxYC+RNXpuugTwerelA4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WYgV42Q41zYcX7fcsQWLwwrxbrrEfVse9h5Cv+phqauR1/HCAert4KodJzA2HkWy3
	 5wb0UyHx1o0VXHcCKUn0jNRzJu6mPirdPh0AkNjOfjEPMcqPrX6Ireg2yoYheIqCBy
	 ldUg/NPOhKMcsQgNwz0zG0fd9GnxJnb/ulC14E2LjwHAL95gx65ZV8wVCMjDGBlPh9
	 vv+8yLllFz9LnvyNzDaIvrT/CHK8cT2GuvVL2I8zN5MzJy5HdZJRhRpgW/JDNIaD7C
	 UUHRvK8FRsxpNZa6IRv3BFf2JudeMvzr4gO5/I7NJindbB8LJ388l971g3oLd9K6NG
	 RG/djIE3eg1eA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alice Chen <alice_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 ChiYuan Huang <cy_huang@richtek.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
 kernel test robot <lkp@intel.com>, linux-leds@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230915201051.never.429-kees@kernel.org>
References: <20230915201051.never.429-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: mt6370: Annotate struct mt6370_priv
 with __counted_by
Message-Id: <169521784990.3449392.15396251707007241017.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:50:49 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Fri, 15 Sep 2023 13:10:52 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mt6370_priv.
> 
> [...]

Applied, thanks!

[1/1] leds: mt6370: Annotate struct mt6370_priv with __counted_by
      commit: 799107c1bb9049f9b3f28b5d651e336d09856019

--
Lee Jones [李琼斯]

