Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81CA1C6B1
	for <llvm@lists.linux.dev>; Mon, 16 Oct 2023 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gQZRvonJ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 117C224000C;
	Mon, 16 Oct 2023 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jzhn3DjNSC33v2hlK3z5m8ef6dw4MhEJceWy7BvoV6U=;
	b=gQZRvonJzMX6QAVE0fEIHrohBTTG8kozKJatzGb3Ka3isRzFqed2Y+zVFkVyv/6MhZztdD
	h4oYN2hVTLhddyKydQw8TWSJbcxHNc02HnQYDVJa0U5TVxowg5uT1uDGfbKOLXKOtXxZfi
	11hzDxUdH/3vtSkW+vrThYfsm6qprxcWIjtLv4+W1yXwSZ4E/HQonQ0pOWooa7kx4Eqzhz
	oOShHGPRapwd0+jYqeXsFCswsE5zVg2VcXjUXy6/2W0lhC5nVeUF2KikMDcfTSieLkSF+E
	V56rY1aKk7quCobXEcDYfa2wQtOYF0yPJaq+uBgQKa5DrJnIymNiO8djUIT9Ow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: rockchip: Use struct_size()
Date: Mon, 16 Oct 2023 11:29:16 +0200
Message-Id: <20231016092916.289194-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To:  <481721c2c7fe570b4027dbe231d523961c953d5a.1696146232.git.christophe.jaillet@wanadoo.fr>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1cfa2f76afb1fdedfbcbd83973a233e60c3e7add'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Sun, 2023-10-01 at 07:44:04 UTC, Christophe JAILLET wrote:
> Use struct_size() instead of hand writing it.
> This is less verbose and more robust.
> 
> While at it, prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with __counted_by
> can have their accesses bounds-checked at run-time checking via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> strcpy/memcpy-family functions).
> 
> Also remove a useless comment about the position of a flex-array in a
> structure.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
