Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D77D33E374
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500446; cv=none; b=cO9fHtL3/8iNEtFG1cqwD8xRi5sTupioFL4mBSwqgtFC6QW13RMlVRGEy3uOK9NQkfatEglS2asI0xB2CX05DKisQjUISASyON179y7IPE/VpJDWqVb3Y6ba4yS3gM3j17ZlWIT+F+sUTzWZzFLAjw6afwR/0Nw0/p9Y1DYslLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500446; c=relaxed/simple;
	bh=PHL+irrO7eyOC+RFbe0jf8E6JbpHm5ONjsx7RhOymIE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DCc7ZcLFidwEY7ICoN59eLqEBHA5uEsW8qR3CMEvYSsgoj4oE6djvf7Hojch9y7wvFjaOhZFnueaYvF2tmtF/ypAm7ct7N1Rprgb2iXZ7C9lKnaWkyLb/eDvef1Zt1UWZhgSieTCiK/ChVDPjBhJAPj3RYxbKY50qTrVLx61C0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZRTj72y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKQx2Lnk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZRTj72y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKQx2Lnk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J0ef6r2023993
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=52x38Crp7CeChmiOEDVzwP
	0vjw13npf8/i7PlgMhriE=; b=jZRTj72ylj7z8iaIFTKauHezFjgWPmcgNUT+vb
	LskXTZ0oTII9F5csT5UVazcOgHipFYpHDufw5/Obl3vGdj0Kl9afF/K3ZqbAkbC6
	g+AxtuwkmOyLMJx66JSt988c2oazWHjJPNWqlpsOBeGoHOmyJJ2SkINotVOJgPDf
	ip6KSYbWeXawz4tigWQGYIuULLJriQnJKpLaapZ2JSWr3WMq5DMPAjUQ9OKYyHYk
	UH06um5oOqeC9vy1/SUSK0F8tdZE5b8XKniqM8n55vS0oi6AcByVZiOx6v7PNwyx
	hNBNH9ejhNnpq8i5aXEUxDQhokM7h5ZTEW3dwrmxa9rrqjoA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7ubfe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 11:27:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so539455085a.1
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 03:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500444; x=1772105244; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=52x38Crp7CeChmiOEDVzwP0vjw13npf8/i7PlgMhriE=;
        b=PKQx2LnkRzMJedYyk6EnJ+XPWnlheKwXV1O7Ayb0dBYsppjh+BSY7EDaScHF7Nn+NP
         jdmUuwv3z7qFdgIweWh7nlFntUXqezjjLvdeBL3CP+XPd4RlHcURAqjJBP8SyLQFOcBX
         jN3Z6UDKahLl96QATDksx7GafkVVz3v5dJTLhuQ0Z2FAs5CLe4Sme/vwrnQJH9GM8h3V
         pgiaYT4B9DGntQSMCc62YfvTdlMyBrOqp1goFzowymGEe+fcfBwv1gIsqQANtG22YJhd
         jcfP8lrtlgw+b9Hy5rJ8pV+z3Bx46MI7OymbWrioAtwUHvUc511elyc+Z1KG74eu70Mr
         +3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500444; x=1772105244;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52x38Crp7CeChmiOEDVzwP0vjw13npf8/i7PlgMhriE=;
        b=i97kLHTghXt8Wkjjqg/Pk7BozxWzNWzyCDNIyX45hzMm1Bzxjj5y4RCiDxWoOKJp8b
         ortc9FH7gE4WeIeW2xpB9Ti4+5CjdUyM9gaSYCu/O6DmIA/BS+KTGiuUpR6xdhQxV+XW
         2VAsPwmD7YsO9iAZPN4qqiowuGjDeG1qB5tLnpfW+CwYcWEDb/exOPL3ZZoVuVIOAcfx
         jJkikWziJCUtKmyMjG3O1nBAmlTG5S9llxrUPiq/3khMPWEosz1C7feSPa87FM4HBoEu
         +23rIKHW5U9l+EXkZTzhbAobKhkH04iHmP1kCHWxaIZhyatmjyc/fViUmOfZVlI6V9Rf
         +rnA==
X-Forwarded-Encrypted: i=1; AJvYcCWqqiMfxCQPIwD8t2tdOI6oj2C4+u/14rgHa6ClgYWQIDP+Mz0BNafW38VcxGgcnbXV2kDU@lists.linux.dev
X-Gm-Message-State: AOJu0YzlF+nbMZZiMijpidT0q5vm9rWgr1jqeElhbif4SJ1w0HnhLE0T
	7RDJsNMU3Rg1bh/42K7JouJI3a1hrzNdttUoP3rfxhr3Pm31t1tOXw3kGB+Y98oGei7yL5/7yNx
	uthCX2qpHByOZaIsx9pCYoR05OPGd/NI+7q1HjbuhM6WKVBXXMSxsJ1x3
X-Gm-Gg: AZuq6aLibuBJddL3Os5fvzwb3568Gj5kXqaGa0Zj9WO/wUyIWu5JrCvblzycQm0BmV2
	i9OOIYWX+rrYM0OvjC6TM60EsnB3GVdutJ5mQ2X+iaae9PZa3rRDs5yZ3E9I82FY1T3kzmkxii9
	winsOoLODxrhk28i6GcU+uHCRa4jgh5jhFgWhS5jHoQCuAV8ye6sZjDQwxQoA2ws/SsqaGn9LrW
	ix67OudxraHdrNHbJ/EYZ3gZvwq8U6T3YxgebLu/U3tCHz7XayPcp7LLV7ozt20OfhgapJrhzO6
	CNm5SsikaPuC1xn48/ji364vaeynQh7B0Dxta4Ntl2wNByIz5eYTI2/9xEPqSJmGOWaix8d7fg5
	MZ6zzdYSt7TZnDEmjSWoQfrYGccpv+v7c/xKGiAkIl2k79w==
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb66dca52amr1230732285a.56.1771500443819;
        Thu, 19 Feb 2026 03:27:23 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb66dca52amr1230729485a.56.1771500443277;
        Thu, 19 Feb 2026 03:27:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm48903796f8f.31.2026.02.19.03.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:27:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] firmware: exynos-acpm: Use __counted_by()
Date: Thu, 19 Feb 2026 12:27:09 +0100
Message-Id: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI3zlmkC/4WNQQqDMBBFryKz7kgcTS1d9R7FRYiTOtAYm6i0i
 Hdv6gW6+fA+/Pc3SByFE1yLDSKvkiSMGehUgB3M+GCUPjOQorOiqkEn0ZvIaOzk0YZlnLlH0tr
 RpbV1bxnydIrs5H1o713mQdIc4ud4Watf+0e4VqiwJuN0W+umVXwLKZWvxTxt8L7MAd2+718My
 dUgvwAAAA==
X-Change-ID: 20260214-firmare-acpm-counted-255f287c3dce
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PHL+irrO7eyOC+RFbe0jf8E6JbpHm5ONjsx7RhOymIE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplvOUy09hU5K7kefbkliHDUSxzyE6+2RqwBnoX
 qJoHi7JnbmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZbzlAAKCRDBN2bmhouD
 19cgD/494oTtZCYqXV22NMxx4hDUSxAi8f5zBcqPOMyTyIVknMtiEKKn/i9jq1MtxHBvzZKmbs0
 s0cC7IY+U3f+KH1p6Lm3SU+i50r+lO33BS5H1NuMC3a+57Xoehbre6BcD4kaIPU4Kx/VSy742uP
 1oxB9rWkOhaVfJJ88Jb8ReHRPdV2XMpDcoZkcBhMLY6BovdttHnBiOfrngHP0hZGzBfvuWiy7pJ
 9sAKdy7ie6sDjynF8eF4TNO/b/WBHcq1Fo5b1AECfOphD+eg5o9CktowPCQhF4BFcf42d7F2nRK
 FMrMYq4cptz9u++mdwYTZrfaLddkdcZuYi8OiZOPLv3ZrfsL14TCEqsWoM4C1VDeQacFqee6sO3
 9jw/q0INffK0Xeu2B/COTEJ8CLxY5oRJI6rZ0wmbZldngTQBrz8EOLRsRfQdWT2UUD3+Dc2DBKz
 rOg1eJFYmlh6YNh6OQ4SdHozUb1ICw5TqRGuBh6QvDUZ0l7FBpP0bmCcsQf1hgmcW5JYTSynKT9
 WtSY3rHiL0sGH6hK0SXGFWI/dhhO7rMGjRwDeYFLo55TMOC/TjjrAyyrvtHFBz8u2shtPsjGqUp
 7liog+6Nnbe86BdjWwuRhPVB+DlC7Ks3vjftNO6rLJWAsSP9dhJLVDWGnMDh8szaeX5IY5d5ISU
 HzrRghSD5yzWD2A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: KVcAi74gxJalx2F3RVw2763I48BoXsKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfXzgPucJrjZvCy
 wFjPolHrjVmgMJkyeSieU7KuaUCN8XOlg519vP/yhIeRA1pnF5k2a9DB0qxBl+mjVj+HD33dS96
 T4NLipeq/c2osI+g6JKCZ8IYaTfK9QDRuj23lM+/XHI8qhiIBuTofnUM8xsyrS8lPpOjG3iHd9V
 uc97Ev0FJfQDToOjj+mrIX/U13NPYxmSgXEM7OcTlrCrJElmcfhi7B1BcZcEjsjaWlsSYcJZtWT
 GBeDXvI+heUbaltGhdyazwVlJgD79mjWKCtm9hzSzuK4TaJek87pKiOUaa6T7Q9+hLSQT60iJIA
 It32hEMHHfC6GHMyGJDWKnz2U/hbQZcUvYWUWKufpsq8usj4bVX4bFxmCOp9KyexnF5/w31Ui+Y
 ZphcufzGdm76IIRPX8Bshb8zLwn12vHwKCmlxpRWxrbgFDLDbRy/RyPB+6zVu1uCkFF3Qo8Fdg4
 wYRuN20fBUxWkIOQVWQ==
X-Proofpoint-GUID: KVcAi74gxJalx2F3RVw2763I48BoXsKk
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6996f39c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=nZb1RMZlaAfT0dxmymQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105

Changes in v2:
- Add tags
- Patch 2/3: typo, single ioread32 lines, merge the two if() for
  txcnt/rxcnt checks
- Link to v1: https://patch.msgid.link/20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com

Improve safety of the code by using __counted_by/__counted_by_ptr.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      firmware: exynos-acpm: Use unsigned int for acpm_pmic_linux_errmap index
      firmware: exynos-acpm: Count number of commands in acpm_xfer
      firmware: exynos-acpm: Count acpm_xfer buffers with __counted_by_ptr

 drivers/firmware/samsung/exynos-acpm-dvfs.c |  9 +++++----
 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 drivers/firmware/samsung/exynos-acpm.c      | 14 +++++++-------
 drivers/firmware/samsung/exynos-acpm.h      |  8 ++++----
 4 files changed, 24 insertions(+), 23 deletions(-)
---
base-commit: 635c467cc14ebdffab3f77610217c1dacaf88e8c
change-id: 20260214-firmare-acpm-counted-255f287c3dce

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

