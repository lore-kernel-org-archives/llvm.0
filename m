Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D498C01
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 16:18:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B21D2C1391
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 16:08:47 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF9061BF20D;
	Wed, 22 Mar 2023 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PSmnxBcZaUN7gsWHWZ45hdp2vXlK1DT4al4TDhvtl0=;
	b=Vcy9+zDUUhG2rn8iTHsAKvO4V15dpsX94dRn8OkrHPjFyLXe6ywWgPbEPvusnyMYH83Q97
	tCQOmTrZ1QcXbh3HZjJ4zYRu4tyyvNoZL2WRA95hzgT+EaIOdLuxFDbjOS+TMApsc79d1E
	Jw0delv/2t3kli1J9Z18PCMXo2myl74EE/QERYaiKu2MWG3XEM9lSOy/Bc4PpynWLKSECi
	UC7w0ZxbhROnrZGgnMiOlnxjBn/Ub8+UbKPPNq3V+tyw4q/M4Z+W7vbR3UVmY4DN2gdKCl
	515mFRhlCtFGdgLnoHWcwXtvJGgMnYLVbVO9KbQ/z+wJMGPZFfg3Y8Gu/ZcwZw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tom Rix <trix@redhat.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: remove unused is_imx51_nfc and imx53_nfc functions
Date: Wed, 22 Mar 2023 17:08:38 +0100
Message-Id: <20230322160838.2232894-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321114638.1782086-1-trix@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cb70cf99abae487941bbb5d3661653c02a5103cc'
Content-Transfer-Encoding: 8bit

On Tue, 2023-03-21 at 11:46:38 UTC, Tom Rix wrote:
> clang with W=1 reports
> drivers/mtd/nand/raw/mxc_nand.c:1602:19: error: unused function
>   'is_imx51_nfc' [-Werror,-Wunused-function]
> static inline int is_imx51_nfc(struct mxc_nand_host *host)
>                   ^
> drivers/mtd/nand/raw/mxc_nand.c:1607:19: error: unused function
>   'is_imx53_nfc' [-Werror,-Wunused-function]
> static inline int is_imx53_nfc(struct mxc_nand_host *host)
>                   ^
> These functions are not used, so remove them.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
