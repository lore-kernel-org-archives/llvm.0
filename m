Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEA13A9615
	for <llvm@lists.linux.dev>; Thu, 25 Jun 2026 02:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782353639; cv=none; b=e0N5tno0z9d+0OJHidRVvV8ToQEsDvUV2HYBoYFX9qA68KcdIYSThtzQPZup431ZayoSaZtfHhgc4LKjvulf5sY1e3IxHSAxYeaHONgTZdplVMQecvTduMQDyq8HrqzSxPMGZAVqGn2k0R2ohE5Hqt8J3F15nzTbRjkSubJjuec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782353639; c=relaxed/simple;
	bh=3WbksS4OXC3H/R/y3ene2Smt+05r/VjFWi7qduSGFgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cN4PGNrxQzAaN3iVsQaOgvFnJ6pbiPTkKsU65oatDDR8JgnmpLlNj3SCMzCKTBNLLT9Dc0jX9l+KzELV6qSDbOBcna2Tv+ewh+rlSE5UZeyF7fJopQMf+vvhck8POmD5nfkfxa40I80LCbzJra9/ZmW6kKq254zR/NZVkSmxuFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLWHjpfy; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLWHjpfy"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37d4ab2e7c5so1540431a91.2
        for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 19:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782353637; x=1782958437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=acCx/txA6YotBH4NCsBpzCuBo/7kfUAZ8KYuBks7nNw=;
        b=iLWHjpfyfkgl8c5dEnKuUI5/jmbb6NYCT37jRti66UuRrYwLl6+YkQVWJenY96tnRR
         x7QrXUQc5QJ0w0sqaHoK+lDMUMqgTWdnjsG2DdVfMCGV4H2TafUS5ngLh/Q9FaFLKBCM
         vBaHxcMHEuwBLuDUPonykJ/ZsGCXBgTHrv9sSDMGN3XbVi+Gsuz7O90kwGspYnilPqv5
         LYmbZv1LxEL5aVCfadfYXdtHc9IyIJJRfbPTVXHUdN0/iB+PD9HNmt/fQkxG4hM2eFP/
         L87XEB+rMpUxKT+sA0TAfg6Nx7W7E9xOZuj3SvqPGAxgcl9jbpYSUm3ib17EFyd0HnqK
         ADxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782353637; x=1782958437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acCx/txA6YotBH4NCsBpzCuBo/7kfUAZ8KYuBks7nNw=;
        b=ONu6Sld5j07ic9j/cOVLHytG8ltYPwAqWqCPkHFU57L0zrCzO2111lAmP43ctlTaF8
         T05TzfO7egGwFD5rudHH3DIeXHPsJ0My+lyAkq3iYvrz+XNbhaxRc/Zr976RF7Ih4IiL
         0qbng4TySwe7W9ohzIJs7scq6pt1FHh6VysJqFWKMoKtJpF80JsOiTlmxM9Jb484GAsq
         uMOx+GGC22jhhsYYEFY5TevN39uwniVcjaVN2VFQFABXMTYI1B0/dXQmcKMgyjfsjJTA
         QBptvr0RocPCOomvv22PDgREK+otv4myOt6atvaJaHh1rucqn3QHn7u5KoAAt4y7Cy+g
         KdHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRpGaMVVdEqrpebwfN4DzcX5D63/txUkD+hFOh7oqvEQqjZdHjRigJZSDnHTpFbNG0ljCw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw++6Od8fgPt0tYGOXR8PvGaOu3/a+MlEqe2tqVIlo4HsDypUhC
	tL3Ko2UkWrrfaIvlGDJXUObOzfy7od2BEOv1LIQwPZPOwm5G7wjKXzC3
X-Gm-Gg: AfdE7cnT/h6VzbathmXkLiVXlb2PI25+Jl4cPKgcQMPdKsPf8mkySra+qGaATOYlgQn
	po47OdepVdLmBWRxD+n0kRX3y4et1v+iLihps8404iFBRh/4yrQGRNvtXGVfUvFEZGty3POcKQC
	BKwBhk/rqMr3s+yGZbkZP4XB1EMpIAMISxkkUzlyAp9nRpKoCL5W0OqdpTkATvTQiR07U4fJ7ap
	9sZUneSiaebuOvO+cLd8mYoQ3Q1r/QGrIJsw8Vb+txCrdv9TV0PWV1xbMvbt2VfzZpTh7VrO7cW
	xKUhXhUgYeSPzcsc5zLOSAa14qRrs1Z1DTPtMQBvGr1af5zmU82CZGG8jRabd9pr0esbbnexaUh
	M94qoEieu3n4K0gqSfuoXcQJpq+YLiK6SJhpEErCOmGUFANEC39j/TVlhOgVlYnl/RE3OOLFvfV
	pjXjPsVdKFBgZDbeC2C0X8nGHoQUtB77r+jZ8I9uA69oBX5n835yz5uAonc1QlD0REMJEMcAIzq
	NIX1IFjjA==
X-Received: by 2002:a17:90b:2244:b0:37c:c39c:c636 with SMTP id 98e67ed59e1d1-37dfa231761mr439440a91.18.1782353637374;
        Wed, 24 Jun 2026 19:13:57 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:5b5d::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3b2bd01sm784905a91.9.2026.06.24.19.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 19:13:56 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 ath-next] wifi: ath9k: eeprom: drop static from local pdadc and vpdTable arrays
Date: Wed, 24 Jun 2026 19:13:55 -0700
Message-ID: <20260625021355.235542-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the static qualifier from mutable local arrays in three EEPROM
power-calibration functions.  These arrays are written to during normal
operation, so static storage is both unnecessary and misleading: it
implies sharing across calls when no such sharing is intended, and it
makes the code subtly non-reentrant.  The sibling function in
eeprom_9287.c already uses an automatic (stack-local) pdadcValues,
confirming this is the correct pattern.

This keeps ~1 KB of data off the static data section at the cost of
stack usage, consistent with the rest of the driver's coding style.

As a safety measure, also add bounds validation for the EEPROM-derived
loop limits and indices that drive these arrays.  Without these guards,
a malformed EEPROM calibration dataset can cause stack buffer overflows
(vpdTable rows are 64 bytes but the fill loop runs up to 128 iterations),
out-of-bounds reads when the VPD table has fewer than 2 entries, a
negative-index fallback when numXpdGains == 0, and unbounded shifts in
the pdadc adjustment functions.  All of these are reachable through
on-device EEPROM data and were latent as BSS corruptions before the
stack move.

Also alias vpdTableI onto vpdTableL to shrink stack frame

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
 v2: add bounds checks
 drivers/net/wireless/ath/ath9k/eeprom.c      | 51 ++++++++++++--------
 drivers/net/wireless/ath/ath9k/eeprom_4k.c   |  2 +-
 drivers/net/wireless/ath/ath9k/eeprom_9287.c | 20 +++++---
 drivers/net/wireless/ath/ath9k/eeprom_def.c  | 22 ++++++---
 4 files changed, 59 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/eeprom.c b/drivers/net/wireless/ath/ath9k/eeprom.c
index df58dc02e104..1f76afb68e8f 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom.c
@@ -241,11 +241,18 @@ void ath9k_hw_fill_vpd_table(u8 pwrMin, u8 pwrMax, u8 *pPwrList,
 			     u8 *pVpdList, u16 numIntercepts,
 			     u8 *pRetVpdList)
 {
-	u16 i, k;
+	u16 i, k, maxIndex;
 	u8 currPwr = pwrMin;
 	u16 idxL = 0, idxR = 0;
+	if ((pwrMax - pwrMin) / 2 >= AR5416_MAX_PWR_RANGE_IN_HALF_DB)
+		pr_warn_ratelimited("ath9k: VPD table range %u exceeds maximum %u\n",
+				    (pwrMax - pwrMin) / 2,
+				    AR5416_MAX_PWR_RANGE_IN_HALF_DB - 1);

-	for (i = 0; i <= (pwrMax - pwrMin) / 2; i++) {
+	maxIndex = min_t(u16, (pwrMax - pwrMin) / 2,
+			 AR5416_MAX_PWR_RANGE_IN_HALF_DB - 1);
+
+	for (i = 0; i <= maxIndex; i++) {
 		ath9k_hw_get_lower_upper_index(currPwr, pPwrList,
 					       numIntercepts, &(idxL),
 					       &(idxR));
@@ -460,12 +467,8 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 	int i, j, k;
 	int16_t ss;
 	u16 idxL = 0, idxR = 0, numPiers;
-	static u8 vpdTableL[AR5416_NUM_PD_GAINS]
-		[AR5416_MAX_PWR_RANGE_IN_HALF_DB];
-	static u8 vpdTableR[AR5416_NUM_PD_GAINS]
-		[AR5416_MAX_PWR_RANGE_IN_HALF_DB];
-	static u8 vpdTableI[AR5416_NUM_PD_GAINS]
-		[AR5416_MAX_PWR_RANGE_IN_HALF_DB];
+	u8 vpdTableL[AR5416_NUM_PD_GAINS][AR5416_MAX_PWR_RANGE_IN_HALF_DB];
+	u8 vpdTableR[AR5416_NUM_PD_GAINS][AR5416_MAX_PWR_RANGE_IN_HALF_DB];

 	u8 *pVpdL, *pVpdR, *pPwrL, *pPwrR;
 	u8 minPwrT4[AR5416_NUM_PD_GAINS];
@@ -509,7 +512,7 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 						data_9287[idxL].pwrPdg[i],
 						data_9287[idxL].vpdPdg[i],
 						intercepts,
-						vpdTableI[i]);
+						vpdTableL[i]);
 			}
 		} else if (eeprom_4k) {
 			for (i = 0; i < numXpdGains; i++) {
@@ -519,7 +522,7 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 						data_4k[idxL].pwrPdg[i],
 						data_4k[idxL].vpdPdg[i],
 						intercepts,
-						vpdTableI[i]);
+						vpdTableL[i]);
 			}
 		} else {
 			for (i = 0; i < numXpdGains; i++) {
@@ -529,7 +532,7 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 						data_def[idxL].pwrPdg[i],
 						data_def[idxL].vpdPdg[i],
 						intercepts,
-						vpdTableI[i]);
+						vpdTableL[i]);
 			}
 		}
 	} else {
@@ -568,7 +571,7 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 						vpdTableR[i]);

 			for (j = 0; j <= (maxPwrT4[i] - minPwrT4[i]) / 2; j++) {
-				vpdTableI[i][j] =
+				vpdTableL[i][j] =
 					(u8)(ath9k_hw_interpolate((u16)
 					     FREQ2FBIN(centers.
 						       synth_center,
@@ -605,33 +608,39 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 					(minPwrT4[i] / 2)) -
 				       tPdGainOverlap + 1 + minDelta);
 		}
-		vpdStep = (int16_t)(vpdTableI[i][1] - vpdTableI[i][0]);
+		sizeCurrVpdTable = (u8)((maxPwrT4[i] - minPwrT4[i]) / 2 + 1);
+
+		if (sizeCurrVpdTable >= 2)
+			vpdStep = (int16_t)(vpdTableL[i][1] - vpdTableL[i][0]);
+		else
+			vpdStep = 1;
 		vpdStep = (int16_t)((vpdStep < 1) ? 1 : vpdStep);

 		while ((ss < 0) && (k < (AR5416_NUM_PDADC_VALUES - 1))) {
-			tmpVal = (int16_t)(vpdTableI[i][0] + ss * vpdStep);
+			tmpVal = (int16_t)(vpdTableL[i][0] + ss * vpdStep);
 			pPDADCValues[k++] = (u8)((tmpVal < 0) ? 0 : tmpVal);
 			ss++;
 		}
-
-		sizeCurrVpdTable = (u8) ((maxPwrT4[i] - minPwrT4[i]) / 2 + 1);
 		tgtIndex = (u8)(pPdGainBoundaries[i] + tPdGainOverlap -
 				(minPwrT4[i] / 2));
 		maxIndex = (tgtIndex < sizeCurrVpdTable) ?
 			tgtIndex : sizeCurrVpdTable;

 		while ((ss < maxIndex) && (k < (AR5416_NUM_PDADC_VALUES - 1))) {
-			pPDADCValues[k++] = vpdTableI[i][ss++];
+			pPDADCValues[k++] = vpdTableL[i][ss++];
 		}

-		vpdStep = (int16_t)(vpdTableI[i][sizeCurrVpdTable - 1] -
-				    vpdTableI[i][sizeCurrVpdTable - 2]);
+		if (sizeCurrVpdTable >= 2)
+			vpdStep = (int16_t)(vpdTableL[i][sizeCurrVpdTable - 1] -
+					    vpdTableL[i][sizeCurrVpdTable - 2]);
+		else
+			vpdStep = 1;
 		vpdStep = (int16_t)((vpdStep < 1) ? 1 : vpdStep);

 		if (tgtIndex >= maxIndex) {
 			while ((ss <= tgtIndex) &&
 			       (k < (AR5416_NUM_PDADC_VALUES - 1))) {
-				tmpVal = (int16_t)((vpdTableI[i][sizeCurrVpdTable - 1] +
+				tmpVal = (int16_t)((vpdTableL[i][sizeCurrVpdTable - 1] +
 						    (ss - maxIndex + 1) * vpdStep));
 				pPDADCValues[k++] = (u8)((tmpVal > 255) ?
 							 255 : tmpVal);
@@ -650,6 +659,8 @@ void ath9k_hw_get_gain_boundaries_pdadcs(struct ath_hw *ah,
 		i++;
 	}

+	if (k == 0)
+		pPDADCValues[k++] = 0;
 	while (k < AR5416_NUM_PDADC_VALUES) {
 		pPDADCValues[k] = pPDADCValues[k - 1];
 		k++;
diff --git a/drivers/net/wireless/ath/ath9k/eeprom_4k.c b/drivers/net/wireless/ath/ath9k/eeprom_4k.c
index 3e16cfe059f3..eec7efdc21c3 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom_4k.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom_4k.c
@@ -288,7 +288,7 @@ static void ath9k_hw_set_4k_power_cal_table(struct ath_hw *ah,
 	struct cal_data_per_freq_4k *pRawDataset;
 	u8 *pCalBChans = NULL;
 	u16 pdGainOverlap_t2;
-	static u8 pdadcValues[AR5416_NUM_PDADC_VALUES];
+	u8 pdadcValues[AR5416_NUM_PDADC_VALUES];
 	u16 gainBoundaries[AR5416_PD_GAINS_IN_MASK];
 	u16 numPiers, i, j;
 	u16 numXpdGain, xpdMask;
diff --git a/drivers/net/wireless/ath/ath9k/eeprom_9287.c b/drivers/net/wireless/ath/ath9k/eeprom_9287.c
index c139ac49ccf6..9ee272d5c751 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom_9287.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom_9287.c
@@ -463,13 +463,19 @@ static void ath9k_hw_set_ar9287_power_cal_table(struct ath_hw *ah,
 					     (int32_t)AR9287_PWR_TABLE_OFFSET_DB);
 				diff *= 2;

-				for (j = 0; j < ((u16)AR5416_NUM_PDADC_VALUES-diff); j++)
-					pdadcValues[j] = pdadcValues[j+diff];
-
-				for (j = (u16)(AR5416_NUM_PDADC_VALUES-diff);
-				     j < AR5416_NUM_PDADC_VALUES; j++)
-					pdadcValues[j] =
-					  pdadcValues[AR5416_NUM_PDADC_VALUES-diff];
+				if (diff >= 0 && diff < AR5416_NUM_PDADC_VALUES) {
+					for (j = 0; j < ((u16)AR5416_NUM_PDADC_VALUES - diff); j++)
+						pdadcValues[j] = pdadcValues[j + diff];
+
+					for (j = (u16)(AR5416_NUM_PDADC_VALUES - diff);
+					     j < AR5416_NUM_PDADC_VALUES; j++)
+						pdadcValues[j] =
+							pdadcValues[AR5416_NUM_PDADC_VALUES - diff];
+				} else {
+					ath_warn(ath9k_hw_common(ah),
+						 "ignoring invalid PDADC offset %d\n",
+						 diff);
+				}
 			}

 			if (!ath9k_hw_ar9287_get_eeprom(ah, EEP_OL_PWRCTRL)) {
diff --git a/drivers/net/wireless/ath/ath9k/eeprom_def.c b/drivers/net/wireless/ath/ath9k/eeprom_def.c
index 5ba467cb7425..be3e6ab11562 100644
--- a/drivers/net/wireless/ath/ath9k/eeprom_def.c
+++ b/drivers/net/wireless/ath/ath9k/eeprom_def.c
@@ -744,14 +744,20 @@ static void ath9k_adjust_pdadc_values(struct ath_hw *ah,
 	 */
 	if (AR_SREV_9280_20_OR_LATER(ah)) {
 		if (AR5416_PWR_TABLE_OFFSET_DB != pwr_table_offset) {
-			/* shift the table to start at the new offset */
-			for (k = 0; k < (u16)NUM_PDADC(diff); k++ ) {
-				pdadcValues[k] = pdadcValues[k + diff];
-			}
+			if (diff < 0 || diff >= AR5416_NUM_PDADC_VALUES) {
+				ath_warn(ath9k_hw_common(ah),
+					 "ignoring invalid PDADC offset %d\n",
+					 diff);
+			} else {
+				/* shift the table to start at the new offset */
+				for (k = 0; k < (u16)NUM_PDADC(diff); k++ ) {
+					pdadcValues[k] = pdadcValues[k + diff];
+				}

-			/* fill the back of the table */
-			for (k = (u16)NUM_PDADC(diff); k < NUM_PDADC(0); k++) {
-				pdadcValues[k] = pdadcValues[NUM_PDADC(diff)];
+				/* fill the back of the table */
+				for (k = (u16)NUM_PDADC(diff); k < NUM_PDADC(0); k++) {
+					pdadcValues[k] = pdadcValues[NUM_PDADC(diff)];
+				}
 			}
 		}
 	}
@@ -769,7 +775,7 @@ static void ath9k_hw_set_def_power_cal_table(struct ath_hw *ah,
 	struct cal_data_per_freq *pRawDataset;
 	u8 *pCalBChans = NULL;
 	u16 pdGainOverlap_t2;
-	static u8 pdadcValues[AR5416_NUM_PDADC_VALUES];
+	u8 pdadcValues[AR5416_NUM_PDADC_VALUES];
 	u16 gainBoundaries[AR5416_PD_GAINS_IN_MASK];
 	u16 numPiers, i, j;
 	int16_t diff = 0;
--
2.54.0

