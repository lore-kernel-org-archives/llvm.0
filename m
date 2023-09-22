Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226EA3D965
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 15:09:13 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id ECD4FD5AB6
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 14:52:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D72B2000E;
	Fri, 22 Sep 2023 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o23Cc0FFWfuaisglu/zx7gjXkLITwnTaKZbP64i0tac=;
	b=nsxfQPGWVQJRnAu5gkhteHpytyLkF1lnmqBHmQ2eii2GY/8osYzbEekL4VuFeZDAap0iGX
	4sirbERV8nPq2OYeyK0KLsh2v6J3C4pjO08DWeiexwHUwiVAVPDY9BPat0Jv/X7skX742j
	lgFWlwd+qaJn1Im51wu5OX3hV5YD8rf5YSwvfHvhy8m5YqR9GB2uJ/WzxDZtivFEbgRu4s
	uhIZvUhRrFQVvW7N0PImT3b4Gq9Ht+Sb/OWXfbKvXu79kdsHqE1BPiQSQgiLA2gMFby+pP
	9ei4v23LBXp9dbsGhGVg5RKZAq1DbvCTkS7ASazqKBSaYGPbC8mQHHHcwbJsnA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi: Annotate struct cfi_private with __counted_by
Date: Fri, 22 Sep 2023 16:51:56 +0200
Message-Id: <20230922145156.578585-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201206.never.107-kees@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1442d628d05c7aad86e5754fa554f32edc3e77a8'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 2023-09-15 at 20:12:06 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cfi_private.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
