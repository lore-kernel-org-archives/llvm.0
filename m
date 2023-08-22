Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D83B2018C;
	Tue, 22 Aug 2023 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9C1C433C8;
	Tue, 22 Aug 2023 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692738036;
	bh=Bfl9Q+5PUYbGX93gC/p5dsy9+HHVDK69a8BX8HMEtCU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GZpOGvaIQjPh2lkGmj4jrgl7PGiUtpu6L07cneYELTEjIgB8Hz1gzNwk2c9ObPAmq
	 viXdFFEbVNOD43Gz6sCjHQZxQg2e7OAsXHdD+UyK/NKk2j7zavpWtjgyY3YFxBAuUD
	 C5fTdTtWEBm/Czz5ibqpn8wVDDdGM4w+3QQD9eLk02gSAZZ/ZASO+1gq+pRPVfL/g6
	 0CJ6lGLxQyjRE+GQwlQ81qbXHjZLqOlRNZzGVBv0zyniq/nrtBm6+rbslW53DAMctp
	 K1pnfey+QNClhJ3zugG68htX/BGAUZW0g8Wva8QEjsr86rP7rP3X/BOzWOYRu6JmnN
	 IIym9YlDIldXQ==
Message-ID: <cb4f740cd5bcb6c9b19ce970d8573388.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230817203019.never.795-kees@kernel.org>
References: <20230817203019.never.795-kees@kernel.org>
Subject: Re: [PATCH] clk: Annotate struct clk_hw_onecell_data with __counted_by
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, Qin Jian <qinjian@cqplus1.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspe
 ed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 22 Aug 2023 14:00:34 -0700
User-Agent: alot/0.10

Quoting Kees Cook (2023-08-17 13:30:22)
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>=20
> As found with Coccinelle[1], add __counted_by for struct clk_hw_onecell_d=
ata.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>=20
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
> Cc: Takao Orito <orito.takao@socionext.com>
> Cc: Qin Jian <qinjian@cqplus1.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-phy@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Applied to clk-next
