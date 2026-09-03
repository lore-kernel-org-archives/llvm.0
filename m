Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F144C64B
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434886; cv=none; b=YlPDlaQV/fr4Z+vywoj4KX0DUaDj1B3NDMxgaZf1UWIRTkgVwzgdtgSZcZKaR7372y5+eSVHgHhURCL010Dd7z4Umfq73I1XQ0e3/3ZNYCLxtkXxCYBBqRmoR5Ae51PtDt7YJsxg0Y42+VNkpnm39jyP5Kcp+C+hHh2UeCsziEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434886; c=relaxed/simple;
	bh=Z45IKqKNmKHMoDxnTs1W9/1hhzkoL1sjpuMqPRPU54U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSfAKn681RHX/bcUQooOk9ZPMExog+XyWih9vzmkXplZUYBvzgTH5+JJU8gbuzhO/dSj4FIZ0FFgKsl01iE5CyYLWARQVJP1LrLbi7j6Afmuj1eC9oBpfkUT9PedzNs9pJG3d6NAvpYmAZc/KPT9wfS1/pU9uhTMCjJQOdb4oyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5tsVqlu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIRpQiRd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5tsVqlu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIRpQiRd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHFwu440393
	for <llvm@lists.linux.dev>; Thu, 3 Sep 2026 11:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=; b=n5tsVqlu08K2ECY9
	mJjVCzKlbOrlYE8NezbdYjdU9cm3Vxro63CbYswlKBQwE+PM0mYnHKEkC2H5pcNz
	EkRveaEDet+OB3UOjT6DVvTQjp8tlJQBIBtvnGF+L0f05s6gBAciXoaQTRrDJ1oD
	ArllJBbAuq0LqQHyCXvE0vA/Cy0r2xbNwNAr0vSZ9zmC//VLQq7nJ9XqO7/Eh/Mr
	+M13hDqvW765GgZY0/Y/DL+LgvXaaP0Y96GTxpbktxnAYck7jz3PNeL6JahLg/fI
	+AXapsbMbfZZ2dL1v6u31aVZV+EOnbPeHwZA+hNew0JxzNisjqZTc4w1nt+U3aU8
	9FA0fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70bfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 11:27:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9310484c005so44925185a.3
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434879; x=1789039679; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=;
        b=hIRpQiRd4IamcYokcpOMEPyq0deIJ/Qc6qKnuPao7tjAlVJqXEnKe2XfPG3dfUDVY/
         GFxXofBCMXvW/lGhyg1LHs3ozTA1Rv8jzze7D+qCcVxQsxdbZVXi4TqXN3CLMnEFKUwR
         xvlzKqNHmSWI+gO1aqJAfxQgRMObqaBzKb4ss2WqJZwdXCErewRqtjwoRxmZBaEr8Yf8
         krpoS+j4gKqXP/eoKGZ7PmcYW62mvnYKF6crtB4C2YEmJexbJnp0dIMk/AlN8SnOcl19
         8GOgxmt7mtjrvgvBN1qLYxL4O31M18ll0naR67VeZR5Wb/pAzKulVFBXtQpdfMxcuv/p
         K4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434879; x=1789039679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=;
        b=NoSvxWAteNXIB7dq6yMfEah90NBW4ShU8DVWFHDbrc3mwHRwoRO47+yk/7dLKdeycw
         WT7bExEi7fw4KWCY3aKhjE7BXNFiju2ZP1C8uPGZFPlq+XxI8oKQwS7zkzuH1RlC/22s
         tJGaC3Xhs1IHzJtxkYSWm6vcmtuv3HMOpdfFjasp45ngFxVuq2oC2ib0iCuaZHd+G7RY
         ShNsZW10W79WDC/bRrcke6hDauPLAwj7QH1Vcp6DZmApevQ9rXPp4FKmKetYOLQj9eaG
         ypqiMKaHlaH5KW3iXBT5c8h+lYdk6+PBw14bMYV366naj7V6gcCeEp2FmzACTozg/f0T
         DnyA==
X-Forwarded-Encrypted: i=1; AKwUvBxeF8ouJnjfoeTCVfLhjwWLBZBWiie1MqZVy9mkHW3AqFuGQ4QMkDXIhgDWFBb8OUtwr53g@lists.linux.dev
X-Gm-Message-State: AFuF++nYVui7RdoCoCF8JSRLoHq5fff+cG0QBN4tg7j4Q2OpuBIoGCLS
	wrrxAnm5jKs0UYsIcnGLSRAQ9B2JV6SCpfzNtbq7WXUorsQOn2aDUODdla6Y1336rfZeN3GdALU
	HJdPDsOKoLZw6vo75/EsqBFF7o/flcTr457m/A2k0weOUtigdkMdSF+V1
X-Gm-Gg: AYBFou3cE9Y7hLUVHlBAdmsXZVE9MiFmMx/Z20fQDMrYOYBQ4cxLFJScLPcViA4COP2
	Bm4HROU+WjHA0aDJwF19uVT/rhZnWHl3m+34ZT/EHt/0w6mHr2Bmmo6iag7sM8/UAeGnuguRmux
	bKL6gTjFalUeEHHFrZB0B2GZJhFHmDK7jDlYDpPK2secBkKJvy3/FbcTIT0p7aTYxnItn/acruQ
	DhXww593oN8h51rueAppg03Q/KOe8v4TC8JGZwHmibDfKE0AaZXPtf03RwAKUGw+tNdESIFZCM5
	Z2sQ+UCE+Ay4Nv5zFOHTaVnsiNjKpPWASVv/ut9F1KhRvOD9u2OMPcRyGOGl9MnCcX5tykcQFyj
	rd9QCghS0yAWTobgmD8mTeA==
X-Received: by 2002:a05:620a:270b:b0:939:4a24:4de4 with SMTP id af79cd13be357-9396107ce10mr867217885a.5.1788434878364;
        Thu, 03 Sep 2026 04:27:58 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:939:4a24:4de4 with SMTP id af79cd13be357-9396107ce10mr867212985a.5.1788434877711;
        Thu, 03 Sep 2026 04:27:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4244e45sm86239866b.60.2026.09.03.04.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:27:56 -0700 (PDT)
Message-ID: <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:27:53 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pShqBrCMlPRr46GyEFqms-LO2vXu7sGO
X-Proofpoint-ORIG-GUID: pShqBrCMlPRr46GyEFqms-LO2vXu7sGO
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a9959bf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rCHStms5JtS70C2hfqUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfXzp1boqtPQMSj
 PlR/N31Q5uE+4P0RXNoa/EkN1e4AZC7TYEoHwCHfOOqE+Fp1PwzkBTUvH91w0n90cwAuOUeqfpQ
 0pBnPFI981cLMBBmKZX4T1qXLtI7sNA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX3zSUXqVbgYVR
 wcRpKxyv1gvmBco/DoZ7+HqWbtCSjC3hvqjq+l3As5cufyZBRC4G/brGA+zt96zlKA2tObYQOpY
 CLrm5j2pEQuP2+5o/pBEPbbAigwCJdnrAsIy/IE7VAh2kZFIFuRvZhePg7wPeXaOGy/12HVJkfC
 xYI2MNj1nVbeFOf51m9QYoYJCQ7SXWzlPw4VlLmk952i6yB5T2rzZRoHJITDuJF9xsGVgyqktxf
 R4YuUMrhShTGvyQWHDTo3sHE5QcqfM67I+5pgdhfTNIkV/EydEkh/4TtHRrE67EM5p2F4zDn2/j
 2yQqM70Q+Zgth8CZQdeyWcgPTQu0xnkzBBIS2tdjYGIuqCDBRgqz/fBXhOzDotX1zS9zWv8A7bP
 3bM9wyEYqlaGhAOi9Y9s/Xh98RM851X05h4Vj6ZVd/0vQHL/nL1WUwfTDNT/hO1Pp2XUHa40V3b
 fFG+GG4PDw5MvtRvasA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030099

On 7/17/26 6:41 AM, Fenglin Wu wrote:
> Currently, when the LED is configured as a RGB LED or a multi-color
> LED device, the same pattern is programmed for all LED channels
> regardless of the sub-led intensities when triggered by HW pattern.
> It results that the LED device is always working in a white-balanced
> mode regardless of the intensity settings.
> 
> To fix this, scale the pattern data according to the sub-led intensity
> and program the HW pattern separately for each LPG channel.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

GPT came up with the following fixes/suggestions:

1] This one makes sense at a glance:

    leds: rgb: leds-qcom-lpg: Skip LUT allocation for off colors
    
    Multicolor hardware pattern setup programs a separate LUT range for every
    component. A component with zero calculated brightness is disabled before
    the pattern is applied, so its all-zero range is never used.
    
    Skip allocating it to preserve the shared LUT capacity.
    
    Fixes: 2882fa0dc1cf ("leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode")

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24b1f570f524..e32388a16537 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1219,6 +1219,13 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
                chan = led->channels[i];
                scale = mc->subled_info[i].brightness;
 
+               /* An off component neither needs nor uses a LUT range. */
+               if (!scale) {
+                       chan->pattern_lo_idx = 0;
+                       chan->pattern_hi_idx = 0;
+                       continue;
+               }
+
                for (j = 0; j < pattern.len; j++) {
                        scaled[j].brightness = DIV_ROUND_CLOSEST(
                                (u32)prep_data[j].brightness * scale, LED_FULL);


2] This one.. I'm not convinced..

    leds: rgb: leds-qcom-lpg: Reuse LUT patterns for equal colors
    
    Multicolor hardware patterns with equal nonzero component brightnesses
    produce identical LUT data. Reuse their LUT range instead of allocating
    and programming duplicate data.
    
    Free each shared range once when clearing a pattern or unwinding a failed
    allocation.

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index e32388a16537..1c4d550c1ed0 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1175,6 +1175,34 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 	return 0;
 }
 
+static void lpg_pattern_free(struct lpg_led *led, unsigned int count)
+{
+	struct lpg_channel *chan;
+	unsigned int i, j;
+
+	for (i = 0; i < count; i++) {
+		chan = led->channels[i];
+		if (chan->pattern_lo_idx == chan->pattern_hi_idx)
+			continue;
+
+		for (j = 0; j < i; j++) {
+			if (chan->pattern_lo_idx == led->channels[j]->pattern_lo_idx &&
+			    chan->pattern_hi_idx == led->channels[j]->pattern_hi_idx)
+				break;
+		}
+
+		if (j == i)
+			lpg_lut_free(chan->lpg, chan->pattern_lo_idx,
+				     chan->pattern_hi_idx);
+	}
+
+	for (i = 0; i < count; i++) {
+		chan = led->channels[i];
+		chan->pattern_lo_idx = 0;
+		chan->pattern_hi_idx = 0;
+	}
+}
+
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
@@ -1226,6 +1254,17 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			continue;
 		}
 
+		for (j = 0; j < i; j++) {
+			if (scale == mc->subled_info[j].brightness) {
+				chan->pattern_lo_idx = led->channels[j]->pattern_lo_idx;
+				chan->pattern_hi_idx = led->channels[j]->pattern_hi_idx;
+				break;
+			}
+		}
+
+		if (j != i)
+			continue;
+
 		for (j = 0; j < pattern.len; j++) {
 			scaled[j].brightness = DIV_ROUND_CLOSEST(
 				(u32)prep_data[j].brightness * scale, LED_FULL);
@@ -1238,14 +1277,7 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
 
 		if (ret < 0) {
-			/* Free LUT slots already allocated for previous channels */
-			while (i-- > 0) {
-				chan = led->channels[i];
-				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-				chan->pattern_lo_idx = 0;
-				chan->pattern_hi_idx = 0;
-			}
-
+			lpg_pattern_free(led, i);
 			return ret;
 		}
 
@@ -1271,13 +1303,12 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
+	lpg_pattern_free(led, led->num_channels);
+
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
-		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
-		chan->pattern_lo_idx = 0;
-		chan->pattern_hi_idx = 0;
 	}
 
 	mutex_unlock(&lpg->lock);
