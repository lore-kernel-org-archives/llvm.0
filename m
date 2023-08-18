Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A96374
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 14:41:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C3484000B;
	Fri, 18 Aug 2023 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzX5gdoM5Yb2BGcVq37IpqionhzjbjtyvP3bnUvQiDw=;
	b=V87xDitMUJrKWq1YkcG7Wsyxo2OQedOTU68DgooM0ImRY44bfh8wkRsM7HLAJwElq39AGw
	PU3iW4u5nZMtWbVzmRFewIS0cLYSn43ActAK8jeCR23NgYzrwR1QJxEahFY4lUhwXosWM2
	oH7hvIzsBAfWqnIdlfjziCyfNze8isSRP/17HLcd2ETibq4emfsr+cx3VEQWMY12Xyzpi5
	TRPGFtZ8P8bZiOGILbotojeTQMcSGNF8GASdtuyOMg+FgwrR3u5JcExuSp/CAQAa7NgQgO
	4C2PTs5oP+ISlghU1+NgGEoXFPfUl4O+DfBIThD10n5QswTMkFskD2eVbgpV4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Justin Stitt <justinstitt@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] mtd: maps: fix -Wvoid-pointer-to-enum-cast warning
Date: Fri, 18 Aug 2023 16:40:59 +0200
Message-Id: <20230818144100.145691-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To:  <20230816-void-drivers-mtd-maps-physmap-versatile-v2-1-433a25272bfa@google.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a417ab334dccb603f6296cbf04c9f8059bc252eb'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Wed, 2023-08-16 at 18:26:44 UTC, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/mtd/maps/physmap-versatile.c:209:25: warning: cast to smaller
> |               integer type 'enum versatile_flashprot' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         209 |                 versatile_flashprot = (enum versatile_flashprot)devid->data;
> 
> This is due to the fact that `devid->data` is a void* while `enum versatile_flashprot`
> has the size of an int.
> 
> Cast `devid->data` to a uintptr_t to silence the above warning for clang
> builds using W=1.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
