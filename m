Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F380F
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 14:25:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w4so18723692wrg.12
        for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7iufcEvsuaQis8fTM7OSiYyDiFr/RCy5Os8Typpr5PQ=;
        b=W8Zrt0OINJ0xXSf2dRTYbcrYN4U9XpiE+RWgguqdzPreePbsZK3wtm+oMnyweiRs98
         FaANv1T/6osU9/lh/hxRXF5AY7ZfLq4othDMrEI+O5Kk4K8MNBoY4EArUC8RPcsvoNPc
         oidkCuySDhCp76GUteUvbOUCXUOF7otdzK5PTMV08/XO+pM6jU+C2r+fngVVtcYPNXGD
         EGo4Qs1X8BxgFiNB4IXSSM8zo3YLBtrmfw6Fr2EsbqVObnpaNyUvEaIa+LnIOHLLD8Qh
         LYMitYcMP9eTag9CCSdNqp6Wv9Vpg7YTM7hou0S4vDF+MrNwro+YIoIqcE9ohBIwr1/b
         XpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7iufcEvsuaQis8fTM7OSiYyDiFr/RCy5Os8Typpr5PQ=;
        b=bcjaS/NRghmmxcn87euTMfQY1wSVE5OcQNdm93lq86w07OwkXPcBtng0hkhi7UVDsm
         /ian5DSxgPZ3MqmtK/woJ76l0yK4B0sU2++9oM4dXHpmqfUDYplyP1l7wdKlJY48t0qi
         dXA9LOEcbKrKcO6YCljshX1OrDQF94yryPe42woGdiO/AGxmL912U1qDqwN/eIrDAlcc
         bhkvXJWZFGRhWVV04Z7jB5vXfYnUpIvTfqf+CkcaFzAeaIHUvimUCEBgF8kwykkbLv3l
         txeQPj58h9JYCsAJ6iHP3O83yb6nNEiKepBHZnud7Gkc9ygNsNe2jslJEZjazjwz/t0h
         OuXA==
X-Gm-Message-State: AOAM531JfwbmmxGKAwGfLWe/m9HadloiXMLWFswpajAp+7S15xHoe5uG
	4UQF3dt4Ea+2Afutnwsgxj+TradXfy0=
X-Google-Smtp-Source: ABdhPJxgSCQYHJVw47K4IDaCUWF1dHGEQHZ1Wju6gFzH3xzj8cZLw/7ApEOo7PlkwFRxpf1MxN/Upw==
X-Received: by 2002:a5d:6c66:0:b0:20a:847e:10b9 with SMTP id r6-20020a5d6c66000000b0020a847e10b9mr9046593wrz.82.1650291899007;
        Mon, 18 Apr 2022 07:24:59 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t2-20020a1c4602000000b003917d43d339sm10238406wma.4.2022.04.18.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 07:24:58 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] Input: aiptek - remove redundant assignment to variable ret
Date: Mon, 18 Apr 2022 15:24:57 +0100
Message-Id: <20220418142457.84708-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable ret is being assigned a value that is never read, it is
being re-assigned again in either path of the if statement. The
assignment is redundant and can be removed.

Cleans up clang scan build warning:
Although the value stored to 'ret' is used in the enclosing expression,
the value is never actually read from 'ret' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/input/tablet/aiptek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 1581f6ef0927..24ec4844a5c3 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -931,8 +931,7 @@ aiptek_query(struct aiptek *aiptek, unsigned char command, unsigned char data)
 	}
 	msleep(aiptek->curSetting.programmableDelay);
 
-	if ((ret =
-	     aiptek_get_report(aiptek, 3, 2, buf, sizeof_buf)) != sizeof_buf) {
+	if (aiptek_get_report(aiptek, 3, 2, buf, sizeof_buf) != sizeof_buf) {
 		dev_dbg(&aiptek->intf->dev,
 			"aiptek_query failed: returned 0x%02x 0x%02x 0x%02x\n",
 			buf[0], buf[1], buf[2]);
-- 
2.35.1

