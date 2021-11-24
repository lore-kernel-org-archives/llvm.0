Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0172C81
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 743106101D;
	Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637781216;
	bh=BVy8LxPgjJhwYfZYArqytmdzHj8T7GuBuT8nt7c89XM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=koiubTcPPYoitRgtbq7KMcXFaXkrkFRBIxBgv/kwfEDIAynEnMEgPTzg9sCDBolhz
	 HtpouwfLfjNt5k46eHao6f6AFLWKRG7+gNXaCprdHKOXJw9pYEmlev5X0ZdJ4KTf89
	 HE7qNtP7vxhsF7AXVtX5pu99MR1rzZPQuuFtZ5gcTyHtgBmKboK4MnDwRo5rtH1DFf
	 0P2yKOI49+XfMlYTI7sTs8yQASktGpLXDs/yOmeE1ZtoUj0JOaPFPKNEtzULnpFwpt
	 nGeBa8JqCVC/nf6xP2BGRjQ0/mZKqKTPzj9TKPTapdz9AhhHx/ZCmuyInRP1/wAozq
	 e3TkB98ncOz6Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mpxhs-004Q5u-MR; Wed, 24 Nov 2021 20:13:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 16/20] media: davinci: vpbe_osd: mark read reg function as __maybe_unused
Date: Wed, 24 Nov 2021 20:13:19 +0100
Message-Id: <7236261ada02edac81d05d8c08864d7aed8f2bfd.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Such function is currently unused, but could be needed in the
future. So, keep it, marking it as __maybe_unused, in order to
avoid a clang W=1 error.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/platform/davinci/vpbe_osd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpbe_osd.c b/drivers/media/platform/davinci/vpbe_osd.c
index 91b571a0ac2c..6b36cae5e6c1 100644
--- a/drivers/media/platform/davinci/vpbe_osd.c
+++ b/drivers/media/platform/davinci/vpbe_osd.c
@@ -45,7 +45,7 @@ static const struct platform_device_id vpbe_osd_devtype[] = {
 MODULE_DEVICE_TABLE(platform, vpbe_osd_devtype);
 
 /* register access routines */
-static inline u32 osd_read(struct osd_state *sd, u32 offset)
+static inline u32 __maybe_unused osd_read(struct osd_state *sd, u32 offset)
 {
 	struct osd_state *osd = sd;
 
-- 
2.33.1

