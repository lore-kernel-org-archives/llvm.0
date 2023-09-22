Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF2171AA
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 15:09:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B83FED5A5F
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 14:51:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F3C60002;
	Fri, 22 Sep 2023 14:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxkNTHSpXY1FBSVoWeaPKNX10l14oI/LawwsZvgPfC0=;
	b=lOrRisDvkm2oli7EqfXVLclHRxqKI3Mn1eN2ahFXZmvQjGv6VFSwK+Vximt5IEmcIldgSC
	ZZ6YuTHvOnDLpBhEgDSh6HayOwTez/xagZukxdfzgU9L13tguMC48964xWfggdG34KHKMb
	rdvvog6LNY0wzBTLVY9OJFEx3FEHpkajrG4ReNZfjq2mnSC/BaMYfMIekNBav7IWbf1zI/
	zDx2rPUD/3mCU3MpK5ke3IUktsEa9ItrGNSdVYTFD2UiTfzsqohnGgslpWpLDH4XjKly8E
	U+W2S0HxefYCGSjQrqIV4s2VMbNB3/z9oZpREBOSmR1rJiosJWKNREMD5uBTNg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: ingenic: Annotate struct ingenic_nfc with __counted_by
Date: Fri, 22 Sep 2023 16:51:44 +0200
Message-Id: <20230922145144.578496-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201234.never.868-kees@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e87f0d64c9063eb26337db79edeccbdd0710eb66'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 2023-09-15 at 20:12:35 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ingenic_nfc.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
