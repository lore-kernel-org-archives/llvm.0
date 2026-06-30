Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC682F7EF9
	for <llvm@lists.linux.dev>; Tue, 30 Jun 2026 03:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782789940; cv=none; b=WreDPo0CqMY5Vm9Jimg/M2g+17LOcui5TchUz5aAtWvNmweeBs14ZgLMptkAVRHELk90EOco5sJQ7DI9y9VoJ9LJ8lbGjbCrhz2fxY4W/EQvZzeFX698QEm2RWs3jYMttNu0GW8hf5Xpagz+zNG8YfTN05eAqv7dQ/HyJFGcsh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782789940; c=relaxed/simple;
	bh=KEto8abrbHUWADx3QSqe85k3RGP7klGE2TliF1qOblY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cYP+hEN6yETmPI4rTONBrYaENgFE7/6tzEbTQmswkpj3hlJZUJq/I6EW7kfYLLl5WiRmVeZUdCtwE7Y6rX8lKZfU6vlJyHdX67nzRar9ffKrg4qsJyjbZAywomJuAPgmsWcL0bM21ff5pGUMTx0jb+McvTVpWLv3hAlIp/Fc2T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJKb2vQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aT1geV2a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJKb2vQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aT1geV2a"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U1JISg449389
	for <llvm@lists.linux.dev>; Tue, 30 Jun 2026 03:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N1ybCHgngEG78ue7E2l4Di
	+WJxj0EHYYtZneBRAM3V0=; b=gJKb2vQ4J5VgbgtxlmhMSHXdRTJUDuqWa3lM8G
	5+3UHgn6dMECEGStEIZ6vtczcEZ/VzDjxjE6Vx2SuQlv4XGqtZUdsdEMLIrcsm9v
	8wdiGS2S4TdGTgePlPjSkYzeQwfcZ4vY2k4AFpLk+v6zlIDFAXJ3E5X6qdPgrmdD
	KcJ2+y3cdSDUNFuJ0vjZAuUk+fD0szpQjGv13QV3PyerydUqRbaPglA8pV+wdmaE
	FUeo6b25WCJspIEx4p9tJuXzMey4gsq4sRKt3mR0+K/2c12ibpSljwnW12d7tal1
	s53SvR/1nCv/haiY0yihgnCIA2GNtBNmdQ0fTIsz6/ceugXg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441grbg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 30 Jun 2026 03:25:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4092496eec.1
        for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 20:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782789938; x=1783394738; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1ybCHgngEG78ue7E2l4Di+WJxj0EHYYtZneBRAM3V0=;
        b=aT1geV2aOpWKBI+bHPtPTlAo7WFl3MI3DUu3nSMzgT8Q+qGX2xNImBpyzaBxjhhUrt
         euZfZtuaa5Fc4nIn0mqzcE+IiaIeU3SuhlPUUDT837mk56x5UJ/mqe/uSX1L9EQBBtSM
         S3AzXuq8s3PJY3wL7ElIjT7qnl0ZnDMs4UZ5MQFRYVyZNjlI+WYI32G0WJTih+cuabLO
         BgquM9WYiCxL59jRdDNd0fdwCacL0b1gId6bMTyfW06YADJkmm6z2f6/+twvgIAtc2+e
         PfGJAqLiTWXzeT7Px2VTuoPXi1sxil/H8R+dypO6evSos7o6mKqZcQfRXP1H64LgknfC
         OCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782789938; x=1783394738;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1ybCHgngEG78ue7E2l4Di+WJxj0EHYYtZneBRAM3V0=;
        b=Bp5r2OOOUQZGUl12S67qDnfcwzX7Lt8X9n9VJ3sSWN/Pmuss3N0Q9EWO8am0D7eQFe
         QDQ9yAbcjzZv6u9vlepSFnZjrYwaqPN8+WA57wVEeNIWjzls0SBvQSVE3HalBwa5ZGHU
         mjwuBx2+2rYkLOVB248XMWnJnnhZSnGSKUx/iAer5Q6mBsmb0WZoBkif26NoidW47V3o
         WMkb1w/cD+iwIOU74MZRZgVcHQWYAVMazXonjAJPBbHCDM2vLLuyj+Es0oMGlemgIf6Z
         +L7pd9YGEosBIqhKWcpx4nPmdDucc+bG27aCyccL/RG+jgausej7VIaA7TRSLQSZuAZb
         C7Ww==
X-Forwarded-Encrypted: i=1; AHgh+RqaLd0vrNiiNOoDHPUz243Mdgy3XjUEe4v0ZqT6eVP4OPgglC9+RcfzAxePuSN9bsbTicSS@lists.linux.dev
X-Gm-Message-State: AOJu0YzfnRi7Ir1BKe8RQwlOo8NHfPVeeQ59zMP3MKPa4s/Buu/aNkVa
	f6c+T6JCcvDidzY2pvXsIawS/2JuxXKk3HZYt4ZRU4A7jVnZxGzvask+ke6rb8lYlpLdSFa1tpO
	MKsogeDUx+zVf66CSbGrdW0D2y1r0oCwyoE1gJG3geW7oQk9nGzc17+Hc
X-Gm-Gg: AfdE7ckBEUPQ0eJfo2MtRfRs8sY/3vnP4Gp05AUmXQPi/o3cax+0/jpjvvBE4sARfIe
	MsaM665WoVHOObfXq1mUPLqhziwnFIUlzlQffXzvMCrKYgxEfmAlnt9sXuqOLGt4g+O3RBib3pY
	MNVuS+7Pl+kAdVz+eOsdN/sOZpFW5SNl8YuVRe2Mx2rriiOzFbvaFiBT9kfue12DNCM3XaTF2qD
	VvkkiPdVSD6UaBSWX+fEP8OcQLAPnm9RCOuEApFVTqUtN7dMAwSKoWPtvU8KtfNQAOlBetzfhoF
	dEvEVf6g1CIXppqZWctQy1xBjKpiY4fEqYrsL92rHtiMPGlMDEVF7EH2NHDGdjn+V/EkmnBabuZ
	bmBcCQgSOPVaEzSloxDAgR3u8p64VutrqPbbdLgNktyv8OrnJ0SYdJjnr3IABiSs=
X-Received: by 2002:a05:7300:8b2c:b0:30c:536e:3a87 with SMTP id 5a478bee46e88-30ee12c01bemr1305726eec.3.1782789937429;
        Mon, 29 Jun 2026 20:25:37 -0700 (PDT)
X-Received: by 2002:a05:7300:8b2c:b0:30c:536e:3a87 with SMTP id 5a478bee46e88-30ee12c01bemr1305707eec.3.1782789936821;
        Mon, 29 Jun 2026 20:25:36 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm2699183eec.27.2026.06.29.20.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 20:25:36 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 20:25:34 -0700
Subject: [PATCH v4] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC03Q2oC/43NQQ7CIBAF0KsY1o4BhlJx5T2MC6C0YmqpoI2m6
 d2lunGhxs0kfzLz/kiSi94lslmMJLrBJx+6HMRyQexBd40DX+VMOOWSSlpA2zcQGwM2tCGC0a3
 urIPa32DNBUoplDY1kvzfR5fXT3u3f+V0NUdnLzM4Xxx8uoR4f5YPbL77p2dgwAA5ohRCI66Lb
 Uhpdb7q1obTaZUHmesG/gZy8QvkGbSUGeoKanUtv4D4DqpfIGaQlaWSmsqqVOoDOE3TA3hpl0h
 9AQAA
X-Change-ID: 20260605-lpg-rgb-color-balance-fix-82436649abf3
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782789935; l=10460;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=KEto8abrbHUWADx3QSqe85k3RGP7klGE2TliF1qOblY=;
 b=sBCRy9eQLJZ2MMiMhzTpJrtVMASWI9ntwIqeXnX5KeLkoqfVmWdjUlVIW/O2/0/8dl8qddiVL
 tQs6lmnXy9fCfAFvjEyo1s7/lUJgkvak1CwXT72PVR7fYQH2jEqwk7Z
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAyOSBTYWx0ZWRfX6XMsKGR35Whu
 Lw/x446j99PybjFUuJ1UVW6uoyypoyNwNcKHd1x/9J3DzEh6784SJV2kKb19F1MxdKhEcBqK/0u
 pfwGoKYsocIlm39pc9CD7WWildCwDD8=
X-Proofpoint-ORIG-GUID: C18_3SPpxXOrX0R-7-R2PWFJCAQUjHO_
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a433732 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=63AshnvTA_EL1TQD_80A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAyOSBTYWx0ZWRfXzoPrhSpt4n/1
 LWnZm9KMpZX/oe3UU/AHbiYjaTicu/hC5z+bxNXaG/Yb35AZ1RyXLGzCDDKntvvzlfwDsz7QLZZ
 atgbOQSSJl03mbBg234OsbvGn66KWkDSh35GTL/EjSbj8yamV8SgSUAIMRiZS/gNKCu4vh+MqrB
 Tglqc6f0hXlXNmBjmn3XiuNNEbT6uhC6uQgh1nMNwgD1x3URkL/m7EtyhO5qHhcc51YIA/jgMa+
 BzV/DecXqw+snEvSlnfSRrknW+pghTeDE1tgFVKfqMtOFXyClNGBbaahaze+cv3C3ulp6X29lpb
 5Q7FpaXIrYEY2IFOQ1fP1B9wCRJ+CM+tba3apuTocStIHhq1PCKL93lZj/cDiRjosg++5HHOnbA
 4wuExKMBLO1EbGZPEO7IWXMJCXp3qr49755L2C3Tm2N9sSj6s+3Zf3qAOxAnWpG4GRIyLzNLQMy
 i8ikukDid/plS2R+VOw==
X-Proofpoint-GUID: C18_3SPpxXOrX0R-7-R2PWFJCAQUjHO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300029

Currently, when the LED is configured as a RGB LED or a multi-color
LED device, the same pattern is programmed for all LED channels
regardless of the sub-led intensities when triggered by HW pattern.
It results that the LED device is always working in a white-balanced
mode regardless of the intensity settings.

To fix this, scale the pattern data according to the sub-led intensity
and program the HW pattern separately for each LPG channel.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v4:
- Fixing LLVM compilation issue: avoid jumping over guard(mutex) initialization
- Link to v3: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com

Changes in v3:
- update to use __free() and guard(mutex) for easy cleanup
- Link to v2: https://patch.msgid.link/20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com

Changes in v2:
- Change to use tab for the indention in the comments of 'struct lpg_pattern'
- Remove the comment in lpg_prepare_pattern() as the function name is
  self-explantory.
- Link to v1: https://patch.msgid.link/20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 173 ++++++++++++++++++++++++++++++---------
 1 file changed, 133 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..e407742ec3b3 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -148,6 +148,24 @@ struct lpg_channel {
 	unsigned int pattern_hi_idx;
 };
 
+/**
+ * struct lpg_pattern - The LPG pattern normalized from the LED pattern
+ * @data:	The pattern data array (caller must kfree)
+ * @len:	number of entries to write to the LUT
+ * @delta_t:	common step duration in ms
+ * @lo_pause:	low-pause duration in ms
+ * @hi_pause:	high-pause duration in ms
+ * @ping_pong:	true if the pattern support reverse
+ */
+struct lpg_pattern {
+	struct led_pattern *data;
+	unsigned int len;
+	unsigned int delta_t;
+	unsigned int lo_pause;
+	unsigned int hi_pause;
+	bool ping_pong;
+};
+
 /**
  * struct lpg_led - logical LED object
  * @lpg:		lpg context reference
@@ -959,23 +977,15 @@ static int lpg_blink_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
-			   u32 len, int repeat)
+static int lpg_prepare_pattern(struct lpg *lpg, struct led_pattern *led_pattern,
+				u32 len, int repeat, struct lpg_pattern *prep)
 {
-	struct lpg_channel *chan;
-	struct lpg *lpg = led->lpg;
-	struct led_pattern *pattern;
 	unsigned int brightness_a;
 	unsigned int brightness_b;
-	unsigned int hi_pause = 0;
-	unsigned int lo_pause = 0;
 	unsigned int actual_len;
 	unsigned int delta_t;
-	unsigned int lo_idx;
-	unsigned int hi_idx;
 	unsigned int i;
 	bool ping_pong = true;
-	int ret = -EINVAL;
 
 	/* Hardware only support oneshot or indefinite loops */
 	if (repeat != -1 && repeat != 1)
@@ -995,15 +1005,16 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	if (len % 2)
 		return -EINVAL;
 
-	pattern = kzalloc_objs(*pattern, len / 2);
+	struct led_pattern *pattern __free(kfree) = kzalloc_objs(*pattern, len / 2);
+
 	if (!pattern)
 		return -ENOMEM;
 
 	for (i = 0; i < len; i += 2) {
 		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
-			goto out_free_pattern;
+			return -EINVAL;
 		if (led_pattern[i + 1].delta_t != 0)
-			goto out_free_pattern;
+			return -EINVAL;
 
 		pattern[i / 2].brightness = led_pattern[i].brightness;
 		pattern[i / 2].delta_t = led_pattern[i].delta_t;
@@ -1016,7 +1027,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * through the entire LUT, so prohibit this.
 	 */
 	if (len < 2)
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
@@ -1073,13 +1084,13 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 			 * specify hi pause. Reject other variations.
 			 */
 			if (i != actual_len - 1)
-				goto out_free_pattern;
+				return -EINVAL;
 		}
 	}
 
 	/* LPG_RAMP_DURATION_REG is a 9bit */
 	if (delta_t >= BIT(9))
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * Find "low pause" and "high pause" in the pattern in the LUT case.
@@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * duration of all steps.
 	 */
 	if (lpg->lut_base || lpg->lut_sdam) {
-		lo_pause = pattern[0].delta_t;
-		hi_pause = pattern[actual_len - 1].delta_t;
+		prep->lo_pause = pattern[0].delta_t;
+		prep->hi_pause = pattern[actual_len - 1].delta_t;
 	} else {
 		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
-			goto out_free_pattern;
+			return -EINVAL;
+		prep->lo_pause = 0;
+		prep->hi_pause = 0;
 	}
 
+	prep->data = pattern;
+	prep->len = actual_len;
+	prep->delta_t = delta_t;
+	prep->ping_pong = ping_pong;
 
-	mutex_lock(&lpg->lock);
+	return 0;
+}
+
+static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
+			   u32 len, int repeat)
+{
+	struct lpg_channel *chan;
+	struct lpg *lpg = led->lpg;
+	struct lpg_pattern pattern;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int i;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	guard(mutex)(&lpg->lock);
 
 	if (lpg->lut_base)
-		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 	else
-		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store_sdam(lpg, pattern.data, pattern.len, &lo_idx, &hi_idx);
 
 	if (ret < 0)
-		goto out_unlock;
+		goto free_pattern;
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
 
-		chan->ramp_tick_ms = delta_t;
-		chan->ramp_ping_pong = ping_pong;
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
 		chan->ramp_oneshot = repeat != -1;
 
-		chan->ramp_lo_pause_ms = lo_pause;
-		chan->ramp_hi_pause_ms = hi_pause;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
 	}
 
-out_unlock:
-	mutex_unlock(&lpg->lock);
-out_free_pattern:
-	kfree(pattern);
-
+free_pattern:
+	kfree(pattern.data);
 	return ret;
 }
 
@@ -1144,23 +1176,86 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 }
 
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
-			      struct led_pattern *pattern, u32 len,
+			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
 {
 	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
 	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	struct lpg *lpg = led->lpg;
+	struct lpg_channel *chan;
+	struct lpg_pattern pattern;
 	unsigned int triled_mask = 0;
-	int ret, i;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int scale;
+	unsigned int i, j;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	/* Allocate buffer for the per-channel scaled pattern copy */
+	struct led_pattern *scaled __free(kfree) =
+			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
+	if (!scaled) {
+		kfree(pattern.data);
+		return -ENOMEM;
+	}
 
 	for (i = 0; i < led->num_channels; i++)
 		triled_mask |= led->channels[i]->triled_mask;
-	triled_set(led->lpg, triled_mask, 0);
+	triled_set(lpg, triled_mask, 0);
 
-	ret = lpg_pattern_set(led, pattern, len, repeat);
+	led_mc_calc_color_components(mc, LED_FULL);
+
+	/*
+	 * Each channel gets its own LUT block scaled by subled_info[i].brightness
+	 * so the pattern respects the configured colour balance.
+	 */
+	guard(mutex)(&lpg->lock);
+
+	for (i = 0; i < led->num_channels; i++) {
+		chan = led->channels[i];
+		scale = mc->subled_info[i].brightness;
+
+		for (j = 0; j < pattern.len; j++) {
+			scaled[j].brightness = DIV_ROUND_CLOSEST(
+				(u32)pattern.data[j].brightness * scale, LED_FULL);
+			scaled[j].delta_t = pattern.data[j].delta_t;
+		}
+
+		if (lpg->lut_base)
+			ret = lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+		else
+			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+
+		if (ret < 0) {
+			/* Free LUT slots already allocated for previous channels */
+			while (i-- > 0) {
+				chan = led->channels[i];
+				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+				chan->pattern_lo_idx = 0;
+				chan->pattern_hi_idx = 0;
+			}
+
+			goto free_pattern;
+		}
+
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
+		chan->ramp_oneshot = repeat != -1;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
+		chan->pattern_lo_idx = lo_idx;
+		chan->pattern_hi_idx = hi_idx;
+	}
+
+free_pattern:
+	kfree(pattern.data);
 	if (ret < 0)
 		return ret;
 
-	led_mc_calc_color_components(mc, LED_FULL);
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
@@ -1174,11 +1269,9 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
-	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
+		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;

---
base-commit: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
change-id: 20260605-lpg-rgb-color-balance-fix-82436649abf3

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

