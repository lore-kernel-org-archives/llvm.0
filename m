Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E4F15AC
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 01:30:17 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j18so174370wrd.6
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y8hWtjydg1Uns+eOzqAaZoK2Vcd2nxaf7d5KD8AEEt4=;
        b=hBcKG/WWy4HsVunBcI3ydG4SVMw/+29z7t+io0+b0TKqfjgmGEmZ6UIS16BlYMVnwH
         LxM8FKgjziksWCiNEINZw5PnnjGyJ0TFNAGqqmfkffcNSldXqTB0ahWuMKbSLTla0rSm
         aVCNkZcqC4xnqvxoIyrYoZe/yVo+ziL8w0HNivZbX7THsXlDKOltYyjBVlrpG6+OExVP
         vNgFLlz++46k3zKIhiMIw6lbWM5rb35CI0eOcQJuefJdUr/J23F3Qp4XLu7ftVDezuAs
         YgRPfekxmOYFaEu2294R2k5pLnxC8R9N46JAFHGHMsjZa5+h4eOh5bRzCemrU83DQHFp
         kNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y8hWtjydg1Uns+eOzqAaZoK2Vcd2nxaf7d5KD8AEEt4=;
        b=DldxrUmwtm+l4saNgs8zfhJbMZ5O2UPjRDx6XaoRAS777aK02UDl1YNWI6Cg9gbsjm
         ujdilMH2Ccyv6rKUOEl9RPoSLWa9F9einv9pH06zb+fnN9Y90cR/Z7f6DQ+xRGwav58K
         2LwiuPNwbo7KZofmTDAGXLJ6tgVlC2+LXUg/e1PPXg26D1y+R+0d5DO0XbpqWZXg11B0
         J0+Q+Dqe57jzQLkDnBG1/ms8SuVFup4CiMjDxhY1GGJxBzlmemzTV6OvV+kdF1de3Z4w
         Ra0cExAMTeQCjX9sknQNAoWuDHYbHkFVNwaTtAOSdD8yeXpLxK56FeFgoh7GN3y+25nW
         c2tQ==
X-Gm-Message-State: AOAM533QEGZ+lR9XEss+Nv8BfXJy1ySj+RysxAmCeUOLRqNl0GnB9TmA
	ff9grBzGLgWUkrKjjQ8F2Gs=
X-Google-Smtp-Source: ABdhPJy44/ZTFxrG+FCtGZtXs1cj8lLzdIGlbJvYj5LgXRGfXlHaGY9J6mj7f3LTMs9tZivMYD9a9Q==
X-Received: by 2002:a5d:59ab:0:b0:203:cc07:8d82 with SMTP id p11-20020a5d59ab000000b00203cc078d82mr5881291wrr.688.1647567015653;
        Thu, 17 Mar 2022 18:30:15 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id n65-20020a1c2744000000b003862bfb509bsm9534520wmn.46.2022.03.17.18.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 18:30:15 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] nvmet: remove redundant assignment after left shift
Date: Fri, 18 Mar 2022 01:30:14 +0000
Message-Id: <20220318013014.90698-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The left shift is followed by a re-assignment back to cc_css,
the assignment is redundant. Fix this by replacing the <<=
operator with << instead.

Cleans up clang scan build warning:
drivers/nvme/target/core.c:1124:10: warning: Although the value
stored to 'cc_css' is used in the enclosing expression, the
value is never actually read from 'cc_css' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/nvme/target/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 724a6d373340..75876f70a7eb 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1121,7 +1121,7 @@ static inline u8 nvmet_cc_iocqes(u32 cc)
 
 static inline bool nvmet_css_supported(u8 cc_css)
 {
-	switch (cc_css <<= NVME_CC_CSS_SHIFT) {
+	switch (cc_css << NVME_CC_CSS_SHIFT) {
 	case NVME_CC_CSS_NVM:
 	case NVME_CC_CSS_CSI:
 		return true;
-- 
2.35.1

