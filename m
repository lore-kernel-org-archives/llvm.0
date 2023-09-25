Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B2B224F0
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 21:37:35 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C7224C32DC
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 21:37:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21C7B1C0003;
	Mon, 25 Sep 2023 21:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695677840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+MbpunQASxv1AWuVJ9bN9SKqKRFM7WNZ5Xe2hEdzA5w=;
	b=kW7z5d9cqLL/D+DSp72pmvMhNhFtli2ArXy3l6x6qfw1/vvye6sToRUGoT5nDoSutPDcCu
	Anv0T/1pF+HZJAYULlu2Q4oKp/rJoZwXYjgdedZZceJHPTiHQJhnbI34yR0SWCDG97Xgdr
	1IfF9qFR+YWckOYk6LsgvNuiNe6Zss10Av0gF+XIhbyulrfUiDau0FXImzJTe4Ij5Ay9El
	SPA2qSTJRvU5V8IJtdSGQVMpuqbc/QCQZXY/a+P0akemUEoAloHx/AouF5KmU5qSbqK3yV
	3yfQN+tsuW+gEd38WS49VzVIV+4jZHrI1EUv6sOEahZLA+Mm2Y0KjKKU7alARA==
Date: Mon, 25 Sep 2023 23:37:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Kees Cook <keescook@chromium.org>
Cc: Conor Culhane <conor.culhane@silvaco.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] i3c: svc: Annotate struct svc_i3c_xfer with __counted_by
Message-ID: <169567773740.243402.6244573348098066977.b4-ty@bootlin.com>
References: <20230922175023.work.239-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175023.work.239-kees@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com


On Fri, 22 Sep 2023 10:50:23 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct svc_i3c_xfer.
> 
> [...]

Applied, thanks!

[1/1] i3c: svc: Annotate struct svc_i3c_xfer with __counted_by
      commit: a8b163e184dede158c94f6392a406ac40a08fb1b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
