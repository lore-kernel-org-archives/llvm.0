Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737C41846
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679233057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4ElBMEAOxAifaU/g2MZDiubtm18mJfcsN/DjXe1709c=;
	b=MCO+MJ+CmSuT0SSamESJuvqJFqF8eg02jlYsrLbPl5iCd/OCafEFhAdWqpG0AcUxBRAZCk
	YLal7Ps3IjZ4Ml6RDeF8CNe8891R83LTN1Yqq9Oy9qY4xc9OFGhLQfgzDDxOE4sJ9HfG4K
	NdFxRI1ZEMN3miytba0QzaLa2NgQ13U=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-bMwlMhcbOjq4Bq7derjhAA-1; Sun, 19 Mar 2023 09:37:36 -0400
X-MC-Unique: bMwlMhcbOjq4Bq7derjhAA-1
Received: by mail-qk1-f200.google.com with SMTP id 72-20020a37064b000000b007467c5d3abeso523293qkg.19
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 06:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679233056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ElBMEAOxAifaU/g2MZDiubtm18mJfcsN/DjXe1709c=;
        b=bpaUD7fZG5EvsYbD/mJivH1dnH7LBhHIFttUIghGhLko0nuOp0+yDdodzatwH4UwS/
         UcM3ja9Ed/ZIMSs62Av5/ztKJFLXkbmve/DDxLtqAed1CKn/+8FyQw3496TtlXO1PTSY
         S2PII8v2Zr/Yw4BdWfNXlYv4UkXg/L3T//7ZSTDytws/f272R5hAxUP5NGhvt8VzmKx1
         5GIGc2pEn49WawEq6Zz3Mko7u6V/fjO5RH5GnYwDr9hdUg7OX8E+9+//jYVZlxRnSCj6
         X6nIW5e8GX/8gD4d9mp0QTlO/yfE9upk/kUWYlslUSvSolLeKuADir/fQ4+4rsi216yE
         IxUg==
X-Gm-Message-State: AO0yUKUcTiWXuSD56BOHZYvndfHjULHEs4TxWMbbNc4Suzjp6faUkyrX
	UBIAGRpKg69XG50JWtnHF3DayhokjpYctbsaIFCVZ/XfzgNj7CD/Z/Fox/pafMEBosGkd0p4Nim
	qXPWt1WHZKaHpKw==
X-Received: by 2002:ac8:7d8d:0:b0:3b8:5bc6:deab with SMTP id c13-20020ac87d8d000000b003b85bc6deabmr23562506qtd.8.1679233056184;
        Sun, 19 Mar 2023 06:37:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set8IdYHA1YnUBVuZoPyzEs2rGkOGdaTNCx3yzfNl2lCRczCgZAgZJ1vDCIHW7RUBIRurqasktA==
X-Received: by 2002:ac8:7d8d:0:b0:3b8:5bc6:deab with SMTP id c13-20020ac87d8d000000b003b85bc6deabmr23562486qtd.8.1679233055937;
        Sun, 19 Mar 2023 06:37:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id h12-20020ac8568c000000b003d75bb8e652sm4551676qta.65.2023.03.19.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 06:37:35 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	sven@svenpeter.dev,
	agx@sigxcpu.org,
	Jonathan.Cameron@huawei.com,
	jun.nie@linaro.org,
	u.kleine-koenig@pengutronix.de
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: typec: tipd: remove unused tps6598x_write16,32 functions
Date: Sun, 19 Mar 2023 09:37:32 -0400
Message-Id: <20230319133732.1702841-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/usb/typec/tipd/core.c:180:19: error: unused function
  'tps6598x_write16' [-Werror,-Wunused-function]
static inline int tps6598x_write16(struct tps6598x *tps, u8 reg, u16 val)
                  ^
drivers/usb/typec/tipd/core.c:185:19: error: unused function
  'tps6598x_write32' [-Werror,-Wunused-function]
static inline int tps6598x_write32(struct tps6598x *tps, u8 reg, u32 val)
                  ^
These static functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/typec/tipd/core.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 485b90c13078..af6ecb54b52c 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -177,16 +177,6 @@ static inline int tps6598x_read64(struct tps6598x *tps, u8 reg, u64 *val)
 	return tps6598x_block_read(tps, reg, val, sizeof(u64));
 }
 
-static inline int tps6598x_write16(struct tps6598x *tps, u8 reg, u16 val)
-{
-	return tps6598x_block_write(tps, reg, &val, sizeof(u16));
-}
-
-static inline int tps6598x_write32(struct tps6598x *tps, u8 reg, u32 val)
-{
-	return tps6598x_block_write(tps, reg, &val, sizeof(u32));
-}
-
 static inline int tps6598x_write64(struct tps6598x *tps, u8 reg, u64 val)
 {
 	return tps6598x_block_write(tps, reg, &val, sizeof(u64));
-- 
2.27.0

