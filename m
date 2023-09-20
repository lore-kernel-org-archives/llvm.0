Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E770E328C2
	for <llvm@lists.linux.dev>; Wed, 20 Sep 2023 13:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A7FC433C7;
	Wed, 20 Sep 2023 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217129;
	bh=pP1eXibM2XF9AVZiEeducJytLu6b4fRhxtC+s2WLHok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RUtVhgRUXHgvIAUA6eZisimvx4dHVon1muBzkge8QCpU8ixknMmdqE1dxEWSu2Pf9
	 i8NOnu7GTV507B/cVo8FwP/SX9iRm+cw095oWSJkf8l+1cr58qQ4L6/BZy/hV8Do2a
	 sT6nM0XSa/2Qf0ODN3rmEc/bBvc9yrduhxxC5IXmcab2RAS/3GYQBvwhZGER9hahi7
	 cxRiLWIRnG/LNnKjKv5qowsCAlQmHaiv+sMnK6kPu/kJBQAUrKlWOtECUmLAJyIC6v
	 esSofuyHFur3+b11sHaqHkge7eGLul2D/pEo3Oqe/ldsqPmURem+1J/jEIymOcWrDS
	 WzKCtuSTTK7mw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Kees Cook <keescook@chromium.org>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230915201003.never.148-kees@kernel.org>
References: <20230915201003.never.148-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: gpio: Annotate struct gpio_leds_priv
 with __counted_by
Message-Id: <169521712728.3441672.12465778864045972543.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 14:38:47 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2

On Fri, 15 Sep 2023 13:10:04 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct gpio_leds_priv.
> 
> [...]

Applied, thanks!

[1/1] leds: gpio: Annotate struct gpio_leds_priv with __counted_by
      commit: 00f91ead9c8037d044414ae44a0e75ef3df27e6f

--
Lee Jones [李琼斯]

