Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C33612E3
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 05:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783487273; cv=none; b=ZkcBKYMzPA3H84xNaxY3jICQgS+cgYqjP4F6XBkWovdhsUksecrLqp7q7zK5/qEY/vbXU0nUk9Cnsq65IIU8ci6Hl621MIzKK/sgSQLK2Xj2uwb2cfVUc30FqwUIky5WyIP3n8v0GKKFilj7PiXb6JOqZX5JyIZonNjOxk/918A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783487273; c=relaxed/simple;
	bh=9OfkiKWwlp2qQpsg7dv9lTO4NG2bB8KmHym1X6IBz1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oTkkZTxBLsZYUrlNzkbAsa/LCx2J4Do2njMCqBZyeIgvWaMs1XHqO9BsVBdcV/sdUK40bXhCKBc+WejWkYpqJNVIqiQQHqk/sI86FRRniLpd/dq1ssaOeJZDZDdmJ2vCFQWziZ8PSTCyNKN1ZLbIf4z5FHT3smd/6jpX8YS8G5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbPdG9+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSKwJrCF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbPdG9+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSKwJrCF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66843Lv01527417
	for <llvm@lists.linux.dev>; Wed, 8 Jul 2026 05:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qHLFifMehx4R79sU/ZCv6Q
	sa7O6SacW/K2cZpA2clRY=; b=GbPdG9+RGKYnvXSxbH3c6QSTsqtsexb+Yf8K3b
	nYeUw97h6BA5WqVE/is5nfzbNWpFH2QAl38W9tBBKoLnbFTjMX1evaZ1Zj9oMP4I
	dPDgTId6NCkff0O2jH5hN0h2zLnKdO23WaeLCaPB13QnWqS7oTH9DzvITq8dDKJU
	Hx1HYIQWz5o/JBsyvwc+9Jk2dymtJzKsq61GDGO+C8Ze1HO4bAa7U7FVQUYSpKxv
	T6we/bsIjREJ+6wWsYoBJvQtEmMbXHu9611N2MGVt4x0qRcR2dnQ1oYPGMx9ca9W
	rwItvnFeE+x9s3jw6lkLnCZGmZ7Bg/2n98dZXL0bx0ALSYhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun4waq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 05:07:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384419c6c74so418285a91.1
        for <llvm@lists.linux.dev>; Tue, 07 Jul 2026 22:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783487270; x=1784092070; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qHLFifMehx4R79sU/ZCv6Qsa7O6SacW/K2cZpA2clRY=;
        b=PSKwJrCFcts1S1jBERtzn7Nb+KXUCiyrgaNIHT+kcYrvBduDdxMIqT5MZp+xJKqnQ2
         MQB6Wes0+RCjdowpTCMoS/cpZ+3ssgGLozszJmPnnFFDt3sxkbb4KnOBcxZykQl42KG4
         HBC4J0NPZiKBjSQZNOLhY+adddoe8hVPICOsWW6TJ/RrdoklMCceEuMzN+1iD3QGRZPp
         InTIHWnHtVbpxIqedz80y5BvxuE9YG/TMmC0p0QbRK3GHyyLhdUpf1oZuKQ940/gJPqe
         5C7RBIoNVKpdLuS2mlMfoFiElaomsE/DYMeCnDRXWFmzFGBkqnDigcMPDBm+BHkY9I7I
         2BKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783487270; x=1784092070;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qHLFifMehx4R79sU/ZCv6Qsa7O6SacW/K2cZpA2clRY=;
        b=D1t0aaJXyYw8HfEJHn1WtHBc9YQ2z56QOz9afvtnGmciX9KjUose0dxuUYKNstqyk5
         vNT0rpe/J43oDQa9mSmzlOMEMUQrwHW0uVu/ytNlOUa2Z0bbd/jujlaRkeQ2D6yhalfn
         Koyq2N/xFRiO1x2NLgvPqCNXU+mo3Horlbuzg3DCemhmERmR7oDSoWSkmD9/JkiBoIvF
         9cHq+BnAHtcqnDKcVh4ohQmT4XOvodnlHuTawS0Ph6I59LQMUjtzWVjMLz/v1mjH8t4m
         MlWhjCfG0F9n+GHb/GwSJyLQ92+02lNXYwv1cIfJO7eovXnJFRNKZh6XTGOEkdTKRjSn
         oPsw==
X-Forwarded-Encrypted: i=1; AHgh+RoxPUp7A0yWyxWScDQ4QHtsLm+onmYPqrES1HA9KE5Ro7yMWflOBHoU/UV/+G9PrZ9umMYf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzur+HLP4sKHoeLIunWJd+gErfGTOC9FtR/b5mtQqfeYtY5CmPp
	uFiXIeY/C+gvqmEPict/Vc+DV+F4NzgMPcKC6iVm2RVXIx2lKHvdfxLhW/+tKkLFifWCmApg7Wo
	7+C6yNubJCkdlrxtASeMFgotW246ErLSQI/uBvhZrcPbnw/6fJKSIcV23
X-Gm-Gg: AfdE7ck7IEGz8zvQHQ/qadkEktIUfCC3+n7zw12CwpNllLWrzhRUgF+YMk1MX3wZjUw
	KXQhOxWO8zdQW4uIQIFTKBBtNq6o9Ohe36OvDRw4CejhcQQCu2L8rZDyCeY3fCmB9f/GIh7B2E8
	jz8lzK+tk8N0+vbScKJiIDclq8inR4mNEH1FOKBjmzM5BE1jSt9sPjx69ujJke8wTMv6qoMvis4
	H+jQsN43KrGkMFCbwcb3PM6P57XCQv+Ab2VHmlw5/4zIrp2fhu7rAUbpj2NZYEGKANVDY2DCD4S
	PlYka4WsD6O0U5IH3bysSlTugfQ9+hcSrhjJ/stMgCAFtZeUGP5ewCTuoO98H0+AmdGVgyMyxma
	9kUQoENyFRconlQcy3lBKghpv9Y9jL0tIGGXtNd/O4P9rGT93z2tO6Hd9XmzDgP4=
X-Received: by 2002:a17:90b:2d87:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-389421ae167mr1022519a91.27.1783487270299;
        Tue, 07 Jul 2026 22:07:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2d87:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-389421ae167mr1022480a91.27.1783487269832;
        Tue, 07 Jul 2026 22:07:49 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38902cb930dsm342648a91.1.2026.07.07.22.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:07:49 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 22:07:46 -0700
Subject: [PATCH v5] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACLbTWoC/43Pwa7CIBAF0F8xrB0DDNDyVv6HcQGUVkwtPtBGY
 /rvUt24UONmkjsZzg03kn0KPpO/xY0kP4Yc4lCCXC6I25mh8xCakgmnXFFFJfTHDlJnwcU+JrC
 mN4Pz0IYL1FygUkIb2yIp74/Jl/XD3myfOZ/t3rvTDM4Xu5BPMV0f5SOb737pGRkwQI6ohDCIt
 VzHnFf/Z9O7eDisyiBz3chfQC6+gbyAjjJLvaTOtOoDiK+g/gZiAVlVaWWoaiqtP4DiZ1AUUDS
 2lpq3Ft27L0/TdAdijdAozgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783487268; l=10658;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=9OfkiKWwlp2qQpsg7dv9lTO4NG2bB8KmHym1X6IBz1Q=;
 b=43bpxAPYrE3J8OEoykallVgWgK4PzJdH2huQVOf8gIcwXK5Bw4E4/ibp02yNoGjLggBIMdeiI
 hB7km7y/6KICWQAIk29dbtlkPLLPhFRDWrV8jRr8l73A0Jsl9TJOrwS
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA0NiBTYWx0ZWRfX78ONpYi/g/ll
 vBi/Mz72tB0TDLATBssPHbgzddMecDHHQ3PI4U41pYd8XbPGKQsm4IXaEw5sqAT165I3kVOpjXG
 Ubr11TdDn2U1ZmD/MqzBiJo9tRr/E90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA0NiBTYWx0ZWRfX8GIklLeFEI9Y
 Tw11/TKLP3FR6XDB/AksH6hzQ+MzjcSsqIhr80HVUvOlxQN/Tlsx+FyPU72ubhBJxHHUGPJE8Az
 UD2zXpHtMkdgUcGVrroKkPH87eOEhz4+l1TjJpubY5VW0p3ahm1PDMPcBWGf+vPkWUQ+AgAqX6/
 miYwHmSF3RPwv0pqKYFh5jPTnufLO7ZnnqHjkRHXxsqqLiTeH09n/AACWbvHa/SB5F+98wLVRrC
 yESyCh3WqEZobBtwoep26yTPxnefy0T8nxDhVy8MMlCX175BlJropJSlgCPPSmalL9i9SP13gXA
 TS4YljOsG/6tMTrCKoqQ4uQSKaUKBwK+ix6YbVACIff1cyofWQLoDONyeoEki0Ziz7YQo0IjNTM
 v3LYR/U0dlRVOIyIA8DfS5ulPz5yHS87vefbiniRXVTETpe+MJaivSH+Hqfi8qKYLw7JEYC0u6g
 1dG3OI7PmGHZPLz74GA==
X-Proofpoint-GUID: XWL0fQYbAERb2c7JiIvMv3mLyAP5RUe1
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4ddb27 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=63AshnvTA_EL1TQD_80A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: XWL0fQYbAERb2c7JiIvMv3mLyAP5RUe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080046

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
Changes in v5:
- Add no_free_ptr(pattern) to avoid it being cleaned up
- Link to v4: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com

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
index d7d6518de30f..7ba4765e7cfc 100644
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
 
+	prep->data = no_free_ptr(pattern);
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

