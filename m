Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840B13D97A
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 14:51:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D2FD1BF20A;
	Fri, 22 Sep 2023 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05vcLB/XaKrSRu46bMeEmatamQa0kPcGH3AO6FNq7XM=;
	b=XnveTOL/HoZgxP2lRI71EG81nobhmP24xEdoCa9p0YoIO0hvLUt5GZ/73vQIYICi2bnlgM
	uz+w5YoaBhhB9A12i1rExFOm9L9EdJpWRqdAKe6qtKTAXASWSEJaG0OB6efK7/mUlq3HxV
	hsggBI0gfqeU5vID14TXgKoBwLj376gx13yZ6BVLZZ+xdyHVTPreY7wCWjws1wyI5iMoi8
	/UufR+Jm7mmSFf47XzVcV6h6RmDss4vsSkZJOFk8Mro0u7GLvVBr8R5IQnWGOft3FprXyF
	BX/7sclFPi+r5Q8RNwNJcysEKcFJQXGFMaKbsbQF51r9Fq3j6XAIfO0Ix6k49A==
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
Subject: Re: [PATCH] mtd: rawnand: marvell: Annotate struct marvell_nand_chip with __counted_by
Date: Fri, 22 Sep 2023 16:51:39 +0200
Message-Id: <20230922145139.578446-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201243.never.235-kees@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a8eaf3ef549980719c5fcca257d5b220ac0f3f1b'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Fri, 2023-09-15 at 20:12:43 UTC, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct marvell_nand_chip.
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
