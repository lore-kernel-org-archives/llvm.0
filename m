Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF102C83
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD25C53FD0;
	Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638179276;
	bh=Dl4PsWpdjqElHMy7Xe1wnMBXy8V8aqd1CbbHT17BCQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYOcXgDdgiySXP6eKKtxNnCx3F+qo8nNXnc3y8vqzZR4Ev+D+vBFHVqpyYfp3xxt7
	 JcwFNrWTH2VWQHd79Adu2pPgVxcU/IbYvaUGIqtXCk5d61eHhC5Bc1ek+of+Yo5LvW
	 zZLOxHvAfovhoR5r/TiHB/MnzSaPdwx5tvOEWldJfvty3WRi1AP5rNt3/q8/GNDlCL
	 Ct0e/WAKDfBnTakiopIfBToqrsQFsNzPmRu8Mym7ZDpCHvLLV4ZMvoAjpH6YCwCZBA
	 rHxdYVSPaI+m7S+C0GqKwoSfcLY8M4RmH71D6PbsAvvW8b4tcWt1UhA5ZR7KWFEBHD
	 M+Zuu0fhnXInQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mrdGM-000RB8-90; Mon, 29 Nov 2021 10:47:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 04/20] media: drxd: drop offset var from DownloadMicrocode()
Date: Mon, 29 Nov 2021 10:47:36 +0100
Message-Id: <54a313c07f938258eba9038031b3bd4fb64712c0.1638179135.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638179135.git.mchehab+huawei@kernel.org>
References: <cover.1638179135.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The offset is not needed, and it is never used, as the pointer
itself is already incremented.

So, drop it, in order to solve a W=1 clang warning.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH v2 00/20] at: https://lore.kernel.org/all/cover.1638179135.git.mchehab+huawei@kernel.org/

 drivers/media/dvb-frontends/drxd_hard.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index a7eb81df88c2..9860cae65f1c 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -914,44 +914,36 @@ static int DownloadMicrocode(struct drxd_state *state,
 	u32 Address;
 	u16 nBlocks;
 	u16 BlockSize;
-	u32 offset = 0;
 	int i, status = 0;
 
 	pSrc = (u8 *) pMCImage;
 	/* We're not using Flags */
 	/* Flags = (pSrc[0] << 8) | pSrc[1]; */
 	pSrc += sizeof(u16);
-	offset += sizeof(u16);
 	nBlocks = (pSrc[0] << 8) | pSrc[1];
 	pSrc += sizeof(u16);
-	offset += sizeof(u16);
 
 	for (i = 0; i < nBlocks; i++) {
 		Address = (pSrc[0] << 24) | (pSrc[1] << 16) |
 		    (pSrc[2] << 8) | pSrc[3];
 		pSrc += sizeof(u32);
-		offset += sizeof(u32);
 
 		BlockSize = ((pSrc[0] << 8) | pSrc[1]) * sizeof(u16);
 		pSrc += sizeof(u16);
-		offset += sizeof(u16);
 
 		/* We're not using Flags */
 		/* u16 Flags = (pSrc[0] << 8) | pSrc[1]; */
 		pSrc += sizeof(u16);
-		offset += sizeof(u16);
 
 		/* We're not using BlockCRC */
 		/* u16 BlockCRC = (pSrc[0] << 8) | pSrc[1]; */
 		pSrc += sizeof(u16);
-		offset += sizeof(u16);
 
 		status = WriteBlock(state, Address, BlockSize,
 				    pSrc, DRX_I2C_CLEARCRC);
 		if (status < 0)
 			break;
 		pSrc += BlockSize;
-		offset += BlockSize;
 	}
 
 	return status;
-- 
2.33.1

