Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08322C81
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 09:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA04DC58337;
	Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638179276;
	bh=8QgHuLKT09qwmU7NQkYtwYyeui5thGFxIHL/EEuGkxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S7ahT9S5YPTyEDpkiGtURf/JblJkTElHtNQQgTsE/jzdWILAYm8YqCRFVrnFN4f1s
	 hEHR6WZkY6MFaqUtv3qek5r+PUyIWSRDzy+eSsukzmN4F9+ojVD2E1RsR32YsOrVpz
	 Zz9LLs+NCoIY6asg0namKX80m1G/621XUWU1kNqEj+KrpzL1LqrjQmAjoSMz8kDVUr
	 MchQ3Hr/uI6G0XwGI2xr1ebotLxtSv5v7q29pLKFKw58+iPDQzqiqKHebiGEGmW/4j
	 lyAilsxO/ZPVbJ5frPaCk6F65n7V1boZQ6Iqb3Pcjrpv5+5hdt/CPh6dqD935Gz6+I
	 PQXhbw0NQepmA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mrdGM-000RBa-JH; Mon, 29 Nov 2021 10:47:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 11/20] media: lmedm04: don't ignore errors when setting a filter
Date: Mon, 29 Nov 2021 10:47:43 +0100
Message-Id: <be579271678245559c0b3fc940c34fbf596acd2b.1638179135.git.mchehab+huawei@kernel.org>
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

Solves a clang warning.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH v2 00/20] at: https://lore.kernel.org/all/cover.1638179135.git.mchehab+huawei@kernel.org/

 drivers/media/usb/dvb-usb-v2/lmedm04.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index fe4d886442a4..8a34e6c0d6a6 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -423,6 +423,9 @@ static int lme2510_pid_filter_ctrl(struct dvb_usb_adapter *adap, int onoff)
 
 	mutex_unlock(&d->i2c_mutex);
 
+	if (ret)
+		return -EREMOTEIO;
+
 	return 0;
 }
 
-- 
2.33.1

