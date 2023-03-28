Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0ED33C5
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 14:32:00 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AD9C91BF20A;
	Tue, 28 Mar 2023 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680013913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cS6PPoncge7WxV8QMPkorPfEpwyvKDYsj5quzqSchVg=;
	b=gFe5uypXFKGvQoREQ8B7JuD5S7+QZofkTTf75Ht985XN7h+ahqDyeo/BNrgqhpaTuFBh+0
	WhfE+GxAKHMxYktc62eJgZjVuX9NiOLaGWE1zVehPFsxtAlgNRoIbVvbz6RlQHStaxzLW9
	vdjv/k6Q24sLi/ButfuVS/JabW3eNLmOIaen0C64ojmurTW4N6WaKgeD9lDu5/2ioRIgIH
	vjFZl2hLtN9G79o/+UY9T32s/XoZoTa3tBcwjiHdxI4AJKISNGSAYN2hHiQiCwGoidGass
	kcW3Fllye4LbwltYisibfBIqfpt4mIAAq0TqlVQB7fsJnw6CBQ1iOY770zQO5Q==
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
Subject: Re: [PATCH] mtd: lpddr_cmds: remove unused words variable
Date: Tue, 28 Mar 2023 16:31:48 +0200
Message-Id: <20230328143148.441555-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328000620.1778033-1-trix@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e6026eb080fa1c1ef6eec24567b733809a5e3018'
Content-Transfer-Encoding: 8bit

On Tue, 2023-03-28 at 00:06:20 UTC, Tom Rix wrote:
> clang with W=1 reports
> drivers/mtd/lpddr/lpddr_cmds.c:409:31: error: variable
>   'words' set but not used [-Werror,-Wunused-but-set-variable]
>         int ret, wbufsize, word_gap, words;
>                                      ^
> This variable is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
