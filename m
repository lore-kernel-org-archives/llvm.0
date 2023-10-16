Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E039B1CA8C
	for <llvm@lists.linux.dev>; Mon, 16 Oct 2023 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Cy7Y/sCP"
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id F35D5CF986
	for <llvm@lists.linux.dev>; Mon, 16 Oct 2023 09:29:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 564D2240004;
	Mon, 16 Oct 2023 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ngr+iz1YVj9BWtuExbnfDz262UFwUCPSb0IR05QCKS8=;
	b=Cy7Y/sCPJXzkyyeeZQVLat5A94AXUXVlF6PKjPZZKMbivzP92RWeq+AYXG86uZYngtbNqE
	f6oT/r+l0gb3qt9z9PAbip7tldFQoLsvMg8IVhA3Mdn/B/Jnq/UyGLoLlZzfV52vrw1cW/
	yQavfU9QB4Ic7gmLgUggmC0l1FdGE/4sOi7Pc60pyrRLUnBcwPhvi3qfNDxIP0+FBJwqO9
	knmluKxiUEdKNbZWGHMP8dd4BDg42GHgTIckHlQinEoBMeyaYvBkW9gdp2box9/82t9gqO
	E0IW67tb043EyoH95NiYPkDwRgnDuc8t+YfnExYUxPVOYZJVrtjvqLz5AavsjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <treding@nvidia.com>,
	Roger Quadros <rogerq@kernel.org>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Chuanhong Guo <gch981213@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: Annotate struct mtk_nfc_nand_chip with __counted_by
Date: Mon, 16 Oct 2023 11:29:05 +0200
Message-Id: <20231016092905.289116-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006201728.work.750-kees@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'13241a5ee367dfa929268a0ac484323a37ea7290'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 2023-10-06 at 20:17:28 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct
> mtk_nfc_nand_chip.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: Cai Huoqing <cai.huoqing@linux.dev>
> Cc: Chuanhong Guo <gch981213@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Li Zetao <lizetao1@huawei.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
