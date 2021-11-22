Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F0A2C95
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 09:26:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 123E360F94;
	Mon, 22 Nov 2021 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637573176;
	bh=/6WJgmxHsldFG8WQEw4YO71q1zqG0O4P07uLKTGweRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLaR8tV/5o+/7qew2X9/D/QMucPsulC3Kzopwr+QqjiJpz2piLh/zsDK1Ce60dIu4
	 CyZyzGm7ll7WE5qT/maj/6DucxKBf+mvJg/xUxyo8dt4rz8c9nyukRYh3RYXw3LULo
	 RSzIwbfmoCVA6/wTWSmiT1ELvJjoPVZPVMnF17K//4OeYUpy1YDYx71bhJy9IcD3/7
	 FrEGNKnWrMECAWmcSex30ZFuoADmqEH6KVa3jreaPoMXq+c9X9iLWSzvb4HgDfmgpU
	 u3RMC0AdaKMoXsvpl+qXI3mkKTEXZZU5THtNgQgSss5vpOMtEkqah1V7LnbVjfjB5t
	 B37cffoofOQTA==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mp5aX-003hiG-39; Mon, 22 Nov 2021 09:26:13 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 02/10] media: ivtv: drop an unused macro
Date: Mon, 22 Nov 2021 09:26:04 +0000
Message-Id: <9543b4e3206621e1e45f7e3a5841359a3a53686d.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The macro p_to_snd_ivtv_card() is just a variant for container_of(),
not actually used inside the code. So, drop it.

This address a clang warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/pci/ivtv/ivtv-alsa-main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-alsa-main.c b/drivers/media/pci/ivtv/ivtv-alsa-main.c
index 4cefdb2e4d40..9e13a7128a53 100644
--- a/drivers/media/pci/ivtv/ivtv-alsa-main.c
+++ b/drivers/media/pci/ivtv/ivtv-alsa-main.c
@@ -48,12 +48,6 @@ struct snd_ivtv_card *to_snd_ivtv_card(struct v4l2_device *v4l2_dev)
 	return to_ivtv(v4l2_dev)->alsa;
 }
 
-static inline
-struct snd_ivtv_card *p_to_snd_ivtv_card(struct v4l2_device **v4l2_dev)
-{
-	return container_of(v4l2_dev, struct snd_ivtv_card, v4l2_dev);
-}
-
 static void snd_ivtv_card_free(struct snd_ivtv_card *itvsc)
 {
 	if (itvsc == NULL)
-- 
2.33.1

