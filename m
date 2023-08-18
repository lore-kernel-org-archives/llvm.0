Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC9374
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 14:41:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74709C0006;
	Fri, 18 Aug 2023 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GnWLZlTRklyIq0gsggN9dgk+3faULATNeMM2pNJ88wI=;
	b=X53g3EnPtfUJXK6TOLZketkkLshIxL6N+tjsmJPq7tuxg4aq40EyHPmoP5BVJMmV3nZxMa
	+0TN8cLFzCK/JmR7Nj2KlZhFCsGak9ezL9t0u7OgpCfulQtxidzB5k8lUVpJ7+Awkt7mWz
	t1qWKh0hJ69tJSd649DBuMeou8/YS27juKbC5K+v0Ua4cFIfVVQY6hKarWeP76cMX13bWO
	ySeSpa2B0L4haMysf/MZaU4j7q1AA/wTmtuQ7Eg0NUHTKzfehWd35H/X11ya3frSwpTXNX
	dKu2WOkyYGqClCORWDI3L80pQ/52YsY5X6kNUE4KwfBb6CuXiOiocZjJ8j5Z3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Justin Stitt <justinstitt@google.com>,
	Stefan Agner <stefan@agner.ch>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] mtd: rawnand: fix -Wvoid-pointer-to-enum-cast warning
Date: Fri, 18 Aug 2023 16:41:04 +0200
Message-Id: <20230818144104.145820-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To:  <20230817-void-drivers-mtd-nand-raw-vf610_nfc-v2-1-870a7c948c44@google.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b9e002a34420e5ba25d4283be870c48e0c9e005f'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com

On Thu, 2023-08-17 at 17:52:21 UTC, Justin Stitt wrote:
> When building with clang 18 I see the following warning:
> |       drivers/mtd/nand/raw/vf610_nfc.c:853:17: warning: cast to smaller integer
> |               type 'enum vf610_nfc_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |         853 |         nfc->variant = (enum vf610_nfc_variant)of_id->data;
> 
> This is due to the fact that `of_id->data` is a void* while `enum vf610_nfc_variant`
> has the size of an int.
> 
> Cast `of_id->data` to a uintptr_t to silence the above warning for clang
> builds using W=1.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
