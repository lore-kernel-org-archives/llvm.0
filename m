Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4D52571
	for <llvm@lists.linux.dev>; Sun, 11 Dec 2022 18:01:12 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id BE494D04C4
	for <llvm@lists.linux.dev>; Sun, 11 Dec 2022 17:14:51 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DBE9F100004;
	Sun, 11 Dec 2022 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670778883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rBDims/zkL1hUiQmCOcc4chEh7a5Jbi2KbYlhUI9MIA=;
	b=memQZf3frHdebnPRjVSe3lRVg/+Xk4rIjKElSq13xvse53ZNtO8mDkF2YZchgSv54YkNFJ
	09cWmF4OoJldYEJRZyL8fBi46G481IgIVUcueJuvQuKB9aKJ8hgdKUphgZ3+XtEM8AAyJn
	mLTPkWCk5wdZWKQkJujdDrfFXM7+uyWaGReB7S55b+lMihH33KxXz0p01blA8zw7ZjZ5VM
	bRR4V4+FpwWvU+ETs71IX9iAPE276ODJgiqDKI5OmDtbVUx7XCWjfzdEyUF8dICds7PsSW
	Q0DElObMBQXu3FDWNJqruvUwpxqWVQVKTGarZVM0oeSr8Pyt1rS0OKNGeYdD6A==
Date: Sun, 11 Dec 2022 18:14:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-hardening@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Romain Perier <romain.perier@gmail.com>, llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Daniel Palmer <daniel@thingy.jp>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] rtc: msc313: Fix function prototype mismatch in
 msc313_rtc_probe()
Message-ID: <167077884687.347026.2422549159298910618.b4-ty@bootlin.com>
References: <20221202184525.gonna.423-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202184525.gonna.423-kees@kernel.org>

On Fri, 2 Dec 2022 10:45:30 -0800, Kees Cook wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed.
> 
> msc313_rtc_probe() was passing clk_disable_unprepare() directly, which
> did not have matching prototypes for devm_add_action_or_reset()'s
> callback argument. Refactor to use devm_clk_get_enabled() instead.
> 
> [...]

Applied, thanks!

[1/1] rtc: msc313: Fix function prototype mismatch in msc313_rtc_probe()
      commit: 21b8a1dd56a163825e5749b303858fb902ebf198

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
