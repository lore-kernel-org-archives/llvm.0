Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4B409623
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197157; cv=none; b=MbgBWy/4KEW+vkdsA8PGG9/AQ7LU4CykES74x7LUp7f08MUP0p1kjsKkdXInejPPLYODL50hQOVLey5uhOaXHrdfa5NquaXMS26Mt5z1gvVuThTOw/GpCZhX3avPHixwRxNWciuuFN5u3J3uYbqYkUe6V7R91KE/3qNxF8FCOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197157; c=relaxed/simple;
	bh=GDglPgcWhpHbpv3ea0myGcC0pw07Pvch0HH3aFDSKds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u8GLGV/6ulQHuq3KJ6l9D0TmhE0aeNCLpb72GJd2du6exA+DWkgw6idvc6IY36f5wD7wmakBZED8c3Ie3UTvJMdAzUvDmI1ZxGvSYxNV9+sf8pA7ynrL9EubP+5BThQFUZrtZ6w4UdnLrpw1AVUKewgiPqYFlv3kLoVZ0t2vTjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuXhCkby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JK4sN8k8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuXhCkby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JK4sN8k8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JA10I2254218
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 13:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KZvWNF+yRKh/FFzbql4gl8+mQgXlWhOfjdw
	e9W7GeiA=; b=LuXhCkbycpwvQgcYHZcFhZ91XCzDzSdtMN/Qhkmq9TmdE3sgiBO
	Hbe0aBrQsFPkW31Y1sbs/ioaV9h9vUJIJ83gVvjDrrhxb7oqC17yCMGekvGSVii3
	TvFeVqH2FO1Eejo2k8H1IXzt7q5Hxajw3Wa6CvOqN4i01gXgWWeL4Ev0DO/Jn0ur
	AnESmic5fewrv9p8iOLPIkmhgsMlXACzMRuyudK80hb+kOycrNnH/7gN0TJEK2JJ
	HtheWiQReNAH0M9FA7/VnN4rvNt7Frc+JjDqEnE3CNlquGIh9vZGfvJct6IzAagG
	7k8cSmMp2DFJVrJyQOQVJhnQtlsTAHBl95Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8h87t2pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 13:25:54 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575456ad2b2so2470887e0c.0
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779197154; x=1779801954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZvWNF+yRKh/FFzbql4gl8+mQgXlWhOfjdwe9W7GeiA=;
        b=JK4sN8k81sBwCkB06VJweOdMhHo3aR4jXzxV14F60T7I/Ax6kVWmSpk2DjPS9K/qPZ
         x5C5l+jaMEyWGtA9EjU3J9ZDP/YBdjlaaUSEnTYf+mH4CxI/aoFyAq26/1WLJZ+TU33T
         QmO4W1vb/mdG+0gJC6bsjUbUL78VHNphmw0cDI624o0oM7rBAQVoh2DNWu7Jknk/AHK4
         1MadssCdjWxCIX/yTMtkBqGhP4CxSaeHleqVdi51ea0RLhIQ4JyYNwVWFbmkWgRGWjdV
         b67/WVi9xhZkGYYFq4kJVH6wlbLE3E49CYrL29Uez8XR9OKbWmQY0guh0Non+9HJ3/ew
         6zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197154; x=1779801954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZvWNF+yRKh/FFzbql4gl8+mQgXlWhOfjdwe9W7GeiA=;
        b=erKrLM+uo2l5TGbBnH2lTHcygj73MfA2B8P0D50HPLcgYp1iWXObirdiWbIz7G/WW5
         JidXqkQOloFdKo5aG1LnraDLwphKQVqHTRUPvf+DJVMb5Fp0yC/dFtHMHc7924zRSCVN
         TC3Cn/UGcauiWu/kIFvm+nJkdxAXkQKG1hICKd0ZdmxV9zWhW3lgIBFP/Z7qY7FYBI3H
         oNwbayuHtE5OV5q68XFdjYnvI9GcNgYQYRR29fTIViajDGlpXXkmi91KkL0dQx24EFM/
         uV38GqCuj96d6BDXMFYL6tJIxFDvttye93dSmaJordlgKY8xohVyLFD4K1RbaD1ZmDmN
         l26A==
X-Forwarded-Encrypted: i=1; AFNElJ9LFwEXwMGP2c0nlB09HfgF6AqD3/I5EUZmmU16M4AEAAzW19IAiu9WLf1QGdvxAzg+L2a9@lists.linux.dev
X-Gm-Message-State: AOJu0YyWfVIG+aUJrJ5RaZSgp73OvQiy27J90yFmtD9vFiuRomdSX3aN
	4OoDGe4RKWzlHxveEqWitXyEX/KAUP3WQPaHmRQ0YgScdLvEl2rJ+MPDZmmDJupV3chnhS5bqz9
	7bfiSQBgYD/cw4v0L9OFrT1C6Z2NDHP0Dlkwlue3V7/GKVxOUp2sn24P3
X-Gm-Gg: Acq92OG0XOh99w7lotKz2upNNwwuDz/UgyijI7w8HwsWKPjjjOYSkh1JJWLdDbzCd4t
	H41EWhHRneLZLtRNWi862O4iPHeKPubXJ1BvNZHPfV01SmwrWT2jKJE0el7pxNt91RJnBD9Gru0
	Qi+3yBGC1SC0NJ5jWtgYdmoryDzXDWagdi2kB9AFeT3KPcdjcEPy6vroLOSAX/32dfJAdmke58x
	apXqCAjnA5fOtnGyO2aGrf3R7w37DHuI4eJEm0nttkI5h5yhbuo4N2PpDmmUDI6qHPX5yxJ5+5x
	7N1u6Ht3sS+/3Cfu9uxzavzEjNtBj580Im2CFVgPlWrHJJ5x1UA7lFKpqafqbrcTI66fAs0QGPA
	pC7Wty3HWJ/besq+R2PNyVmTDaipaPeKKXm6gCYwf85fGtwQ=
X-Received: by 2002:a05:6122:8f8c:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5760c1f3533mr9339785e0c.13.1779197153641;
        Tue, 19 May 2026 06:25:53 -0700 (PDT)
X-Received: by 2002:a05:6122:8f8c:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5760c1f3533mr9339756e0c.13.1779197153140;
        Tue, 19 May 2026 06:25:53 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm339086305e9.14.2026.05.19.06.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:25:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] memory: omap-gpmc: Silence clang kerneldoc warnings
Date: Tue, 19 May 2026 15:25:49 +0200
Message-ID: <20260519132548.315229-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=GDglPgcWhpHbpv3ea0myGcC0pw07Pvch0HH3aFDSKds=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDGTcYCuJb0KMwnQbq7evgSD6wbOxhhWIztt/G
 A06SKFVh4iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagxk3AAKCRDBN2bmhouD
 17n6D/9vMOJP7A+ga93Y+kUWhCm9i7ZKVURsyw4ItuM6aQoSSmEuJlbidOhXDDkpC3vQzK5NFKG
 4tjK49JgM9pxKSWPs9zp9PiFlWKCTnAcBqYXaz7gfPvwz8jn9E6WNaMTKZPjaCVvY9J4fv66Crq
 HHPdw9xmr5NP5J/7+0YwUEPWNqaDGMA6jt7k/qN/NpcbRFwrJGDet1b2MDOdmqi1RLFqtxvPUGI
 7CDw9E6prjqOsdBGfI2vB9D8QW2+lxFrC+D6JyJG/coBkMTyKuDXAKwksuiBwdZculGBWy+wGf/
 fNGUwxC+ZE6OZrySQ0FxP49BcdgssG8Evq4F9He02wYVLvOPgCNAzjC1gywoaeY4BdWqiPhYP5i
 zuO/XnjBv99qv6nt3lxR4W8EjECXhFP4R128ZUWUpHiZFNMoRqeyg4qmBQugbAdq8Gq4ByrfAO0
 ADfFRnDyU6XPfsaATx/7Da0KQRp7rksFT5HqGt1t64/hZpq+A+xgvncFcPRGP+Ll2LDFgXEvGCY
 zQSBMG2lR4H1LcVIg93Hdbfb1dB1GI+e/pk4tWocxtQ9D8D4OomjGT7m1NH66XUBj07JC1wO0Dd
 3OHhyu8WbMAfLRrfg6GrGSQTgc77tfFGlTk+xCkALKK7kggWZ7/iKv1fUaNf4R1s2TKMwbVXoCB BCmdsh3eayoEx/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eApx6-OTBL3ESrvSW-uHzJ132pXzk_fz
X-Proofpoint-ORIG-GUID: eApx6-OTBL3ESrvSW-uHzJ132pXzk_fz
X-Authority-Analysis: v=2.4 cv=a9sAM0SF c=1 sm=1 tr=0 ts=6a0c64e2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2Dvqj_LvCoWKn3WZKIgA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMiBTYWx0ZWRfXzkkov8h+ugEn
 qWOaw6k1d5inR+Rszh1F7XYSyXmoE3o8lgJ2T2s129xUkhJcp+/LXmBraQmuMW7XMQR7q+XuuJT
 cmvzXR2lJPmz4cVPfXKEDSXi3dRFMHWWUnuIe8FcSZ6jKlLHXI8ww1Yf/VTr07z76/wLfXvPyfi
 pa19sZEPBfzyXS4zc2POBUZ8gxaVQPXgq4Bl3SVPWrvCQ32x7q1WGJpCFTkwvjeGWS6tG41y5y+
 QUT0E+lRF5GCMbYZ3W67KLHWqU7nRqASrn6/01Qi6caYzVtC7qL/+/Yf/qMboU0VMK7WB9X1ua0
 kSbx/UflJlODU3HH3GE2/hwNzBBEduaC7137fAoM0GEjsw97UXUN9TPiKxwn5TcWdmRSXqsC/sY
 ceVVS4XjG7ILHWnj6PAifT9rPtjfHrlSNYzFMUOnttFIfWp8xuk671Boszah4elvzEymHB5GZTn
 rvfOEOrPTBq0FsVjdeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190132

Recent LLVM prints kerneldoc W=1 warnings, even though a correct
kerneldoc is there:

  Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'cs' description in 'get_gpmc_timing_reg'

Drop additional inline comments for arguments to fix that.  They are
anyway not that useful.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/memory/omap-gpmc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index d9e13c1f9b13..958d2b0ea54a 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -432,13 +432,9 @@ static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
  *
  */
 static int get_gpmc_timing_reg(
-	/* timing specifiers */
 	int cs, int reg, int st_bit, int end_bit, int max,
 	const char *name, const enum gpmc_clk_domain cd,
-	/* value transform */
-	int shift,
-	/* format specifiers */
-	bool raw, bool noval)
+	int shift, bool raw, bool noval)
 {
 	u32 l;
 	int nr_bits;
-- 
2.51.0

