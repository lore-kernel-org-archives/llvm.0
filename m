Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08B36C0D6
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781739685; cv=none; b=ZUlrZ8NNQAh3jflOhey7h1z8lwhxmyLc2LWyqVJrJO98R3RZKZ+DqsHYCxDaJjz4caaCvcK+b9hFvBzwp5xqh+i9bFDMZS7hDnALVXQMr/l6lWRsUZvfPkwQl29yLx79xb06eUECX4OxlRwx4eATrX1eAiE3EuwsFt1Ksf5W9I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781739685; c=relaxed/simple;
	bh=1xxApD3Hb5TuHMmSOnw8rBFtZGA1Y9mAEd5x7+SWaMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyaupslbjy2j0iRDFa7RLuS/kvQ5OJkfYkxr7mv1smFqWaZsquflDBndYMgPzed+/wJascrA1D3OzOK5VvDswe0g4TgvSZv9AENceANVQBerHqPaIR2/H4haNpYTVxaAvd2SPgC6aEjUKxVSSJv3WlrToqo/WoLHcupgL/kWtRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8ZmzG95; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8ZmzG95"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so112320a91.2
        for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781739683; x=1782344483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KA3VIuiaTabMHHJ9iGApHbWoluO34hyLG8PCxZjsMXM=;
        b=N8ZmzG95ASJtMwGXTGhOd3uAFMrKUBVseujWuMaFQx7ifZiNnsogKBEZCk6bolEY1T
         rkvKnsrzdSeb7hyipGXtqajim5D3b+KLVwovqGD6LqDr+cl/pgs+DRXhrBjm7bINK3OM
         cbaRLM26AVQcMcUPBDho2PgEjxFDH6jWrquTfPI21p13RGj0DTARb37wyIQv3GAr2PSX
         xWPi4StASAO0MOJI0WZy9CmI3Q+a6zNddSv9ZDQgU4EzooUTkDu8SUwL0NhGKm6BPsxL
         MaR5wWUXjxLVjypXMxpJwDdnoVFrlVW711RuHGRW79cwCDnvDQpwmqxCRBHGwonaZgYR
         VUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781739683; x=1782344483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA3VIuiaTabMHHJ9iGApHbWoluO34hyLG8PCxZjsMXM=;
        b=nABnPwmf4hzYQHrfZJNPxQVVMxMLzIsnyq93izeRGkjruGUf6pIwgwdc16t42RJc77
         ofa2sHQwURXJISh6bM+E2mmCV8oHaqn/zrLZw09qbs4u58PNAuVj+RlV2IxMpA6XnI1a
         +raq+7JKWwLU1+xp+O4JZQL8b+SRRuOLO4Kf6QzL1RZzOT5OztMsJEbnmEpw/sapFAQa
         ityeExwyRhwQh4ZCOq7Acp2pqPKUs9vwd9oUcuv3vksw8R5BRdJTkyFXsefEmW3XfSmx
         usAWklXSlHILPwkVeZVt8l8ibT7LwT8Dri0/X0r/onc+6wDg8Q0rkEO/VwaVHaTeYq46
         hddg==
X-Forwarded-Encrypted: i=1; AFNElJ+EbzkhtID8MXQP/oF1XI1vPJfpjc6cnFdQC/CTgdwRG/mTaamEfRjL3mZZI2M6e8jmi+Dn@lists.linux.dev
X-Gm-Message-State: AOJu0YzQOm6oLwyxO7vzWsQCCxXQ4HTlcKoa9WPlPQ3AEFku018lA07v
	JRNgbpjkbI/6ZI8RqkUmx7na5+l8hBbyZHKGXDSL5Kw4PZ7VlOH/PpKK
X-Gm-Gg: AfdE7clDLigNpoZy3Al8XWU3Zm6yUvfwPO0w9EY/6ZiC9pecv0rd3OYDwIugEB5l5PL
	Et0eRtMpXXsVKDcuZyMncOpAB0z5cNDYyNpuvX/T7Axe+Sm1GNYJVX8gb/88DZw5EknVPfv1RGl
	9xcn14j46lVWlyMrjqzcQOvoXFfI+QcPfrnRrq883JOOs2Lfz2ozrlKpNlvGcHuHyq9HpD+elkP
	uKqNk6hk948ArBY5bYwDK6OxzvmqDUzuJpl5jAcdOP4VPvvXY0wAIRvpI7put1YdDeynU8UbkWT
	fdA5WVIKoW50brcOTQT75BFXTivPfmDFbOJ16H/aV5FCpCoMRByIfdi3hz572EqN71fo+6GpEw1
	UDNCuW0bU9NGfQIPnQ9PCfVgOZup8YuwTMeHQLIp/CqrCeuSisRMLNo/BQc38xTJ1a3jdmozLPZ
	vFphOpILegonTwYlb41isjKeKq3r4f15tPV4mK5ZnCN93wU/61nC/xyMiKTGrwKhJzqKilPXrEM
	zDAaNauEvmO+lgSGPnR254S
X-Received: by 2002:a17:90a:e7d1:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-37c937055c5mr5722005a91.25.1781739683447;
        Wed, 17 Jun 2026 16:41:23 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7305:54ba:2fb4:e198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37ce68cab02sm238644a91.7.2026.06.17.16.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 16:41:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH ath-next] ath9k: eeprom: alias vpdTableI onto vpdTableL to shrink stack frame
Date: Wed, 17 Jun 2026 16:41:05 -0700
Message-ID: <20260617234105.284358-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vpdTableL, vpdTableR, and vpdTableI are never live simultaneously.
vpdTableL and vpdTableR are consumed during the frequency-interpolation
step that writes vpdTableI; after the if/else they are never read
again.  Reuse vpdTableL for the interpolated result (what was
vpdTableI), reducing the stack frame by one 256-byte array.

The read-via-write in the else branch is safe: ath9k_hw_interpolate()
receives vpdTableL[i][j] by value as a function argument before the
return value is written back to vpdTableL[i][j].

Stack frame size change (x86_64, clang):
  before: 0x440 (1088 B)
  after:  0x330 (816 B)

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/eeprom.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/eeprom.c b/drivers/net/wireless/ath/ath9k/eeprom.c
index df58dc02e104..272491ae9f29 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom.c
@@ -464,8 +464,6 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 		[AR5416_MAX_PWR_RANGE_IN_HALF_DB];
 	static u8 vpdTableR[AR5416_NUM_PD_GAINS]
 		[AR5416_MAX_PWR_RANGE_IN_HALF_DB];
-	static u8 vpdTableI[AR5416_NUM_PD_GAINS]
-		[AR5416_MAX_PWR_RANGE_IN_HALF_DB];
 
 	u8 *pVpdL, *pVpdR, *pPwrL, *pPwrR;
 	u8 minPwrT4[AR5416_NUM_PD_GAINS];
@@ -509,7 +507,7 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 						data_9287[idxL].pwrPdg[i],
 						data_9287[idxL].vpdPdg[i],
 						intercepts,
-						vpdTableI[i]);
+						vpdTableL[i]);
 			}
 		} else if (eeprom_4k) {
 			for (i = 0; i < numXpdGains; i++) {
@@ -519,7 +517,7 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 						data_4k[idxL].pwrPdg[i],
 						data_4k[idxL].vpdPdg[i],
 						intercepts,
-						vpdTableI[i]);
+						vpdTableL[i]);
 			}
 		} else {
 			for (i = 0; i < numXpdGains; i++) {
@@ -529,7 +527,7 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 						data_def[idxL].pwrPdg[i],
 						data_def[idxL].vpdPdg[i],
 						intercepts,
-						vpdTableI[i]);
+						vpdTableL[i]);
 			}
 		}
 	} else {
@@ -568,7 +566,7 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 						vpdTableR[i]);
 
 			for (j = 0; j <= (maxPwrT4[i] - minPwrT4[i]) / 2; j++) {
-				vpdTableI[i][j] =
+				vpdTableL[i][j] =
 					(u8)(ath9k_hw_interpolate((u16)
 					     FREQ2FBIN(centers.
 						       synth_center,
@@ -605,11 +603,11 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 					(minPwrT4[i] / 2)) -
 				       tPdGainOverlap + 1 + minDelta);
 		}
-		vpdStep = (int16_t)(vpdTableI[i][1] - vpdTableI[i][0]);
+		vpdStep = (int16_t)(vpdTableL[i][1] - vpdTableL[i][0]);
 		vpdStep = (int16_t)((vpdStep < 1) ? 1 : vpdStep);
 
 		while ((ss < 0) && (k < (AR5416_NUM_PDADC_VALUES - 1))) {
-			tmpVal = (int16_t)(vpdTableI[i][0] + ss * vpdStep);
+			tmpVal = (int16_t)(vpdTableL[i][0] + ss * vpdStep);
 			pPDADCValues[k++] = (u8)((tmpVal < 0) ? 0 : tmpVal);
 			ss++;
 		}
@@ -621,17 +619,17 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 			tgtIndex : sizeCurrVpdTable;
 
 		while ((ss < maxIndex) && (k < (AR5416_NUM_PDADC_VALUES - 1))) {
-			pPDADCValues[k++] = vpdTableI[i][ss++];
+			pPDADCValues[k++] = vpdTableL[i][ss++];
 		}
 
-		vpdStep = (int16_t)(vpdTableI[i][sizeCurrVpdTable - 1] -
-				    vpdTableI[i][sizeCurrVpdTable - 2]);
+		vpdStep = (int16_t)(vpdTableL[i][sizeCurrVpdTable - 1] -
+				    vpdTableL[i][sizeCurrVpdTable - 2]);
 		vpdStep = (int16_t)((vpdStep < 1) ? 1 : vpdStep);
 
 		if (tgtIndex >= maxIndex) {
 			while ((ss <= tgtIndex) &&
 			       (k < (AR5416_NUM_PDADC_VALUES - 1))) {
-				tmpVal = (int16_t)((vpdTableI[i][sizeCurrVpdTable - 1] +
+				tmpVal = (int16_t)((vpdTableL[i][sizeCurrVpdTable - 1] +
 						    (ss - maxIndex + 1) * vpdStep));
 				pPDADCValues[k++] = (u8)((tmpVal > 255) ?
 							 255 : tmpVal);
-- 
2.54.0

