Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF69328C2
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 13:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8AFC433C8;
	Wed, 20 Sep 2023 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695216927;
	bh=XOJB4ugM+cR3vGS6Flq4w3KzGhy52BGvvhYoUHMdbyM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NfoV8bItEvkFAnHF36MmLxcTVuQ7VSCT0le95ZO6wKefQMHFv21hTn/OMS78IWTW9
	 w3I76Et9G7W9nuLdS5+vzeeDvZSZuAOoY5yFUf8hILIHyFA9ycDvFIEWzOiCWQ0dPX
	 0VhSikuiP3Vi2PvG0hCRdI5dRWGr+s0oD5boWN5NuRBSF7vlBWxWBKYeqkvbvm1vV4
	 wN9ZpTulGECoSzN8S3DEKBWJ1QDDu/z6dvg4xM4b5Ns84Cou+2XXlTT0ecYrpndSCz
	 sSEv84NiZuHhWv6W1NAazJ3AfEtH08IawA7UTW7P+MLfyj26CPY18NSt7svJ7frUGC
	 7ChsKz5qVI0Hw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230915200938.never.767-kees@kernel.org>
References: <20230915200938.never.767-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: aw200xx: Annotate struct aw200xx with
 __counted_by
Message-Id: <169521692572.3439618.17540674957048720159.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:35:25 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Fri, 15 Sep 2023 13:09:39 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct aw200xx.
> 
> [...]

Applied, thanks!

[1/1] leds: aw200xx: Annotate struct aw200xx with __counted_by
      commit: e43d6b679091d196d9ac7664035155ed4c9637cc

--
Lee Jones [李琼斯]

