Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8051B3A0B05
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 11:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275808; cv=none; b=PIIVz1UTXpEmHzwwOzD60Xj22kl1FAn3w0TBx7AfUiIOE9HnkXYm1kunGJpOLaVFpoTdEc80wud/zwTM24hWUpfwq7FuXz+dFaZ1+oD691im20En0nYZcCkcqKifldPhVJamtwW3SwPIuWV0eO9HDhTTxZaF47psOz6AdHEa2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275808; c=relaxed/simple;
	bh=bpRfX7E/XCI4WdfVZIDJW6fSsGDUU1ccxHUq45Gn9qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oAUL2yKY+2zTTNRRQ/p3OU96LreWveK8KxUUiK0R2iTUZ47vPGTPriXO3e+QEot9KkONtxE6SuNYikElpiuM7cZeQ5SxsVfQFjf3iIQa11dJTKEbTfAaTeDg0Ok/GZzR4Qsc+DpmK8GRk3Dp8AFOw/i2OCp6CjVuu2JzSjm2O7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2LDmvKf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AE858mzh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2LDmvKf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AE858mzh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nX5v446929
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 11:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=n8LPO6eze8wVsYJxM9DPMdIT0bs2Yo8vf+8
	RsT33kuw=; b=B2LDmvKf5/GmERjsaC9w8Tt3KpwLjK/PGsblxGnTZXH56q33Ty9
	fMj6xMYxnegBu3Txqkp/CtcUiV/sX/KMxdgDAZsIDzko/nXL+GyWeHTTcIAKd1Py
	LeLGpcn783qcqIiwKF/lYocvTZYmeD3GPSUqFSkP5d2VWoVSsnN+tVQubH9AT4YO
	QHH2aWBiApb4VaEKZAfQ9m47mRrpv6jtGVFLBAP/p4ojxHNXHdfqeRkDHgpxqE36
	7lEsUloWqV8xUd5ELNhY21GhaEzHJ24vcop3SCTM5UTG3UfPV9rXua8qCEXl+9KV
	Y17g25+LAXDC6AWwbpwsFbgnmGQHVJxwyGg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrga34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 11:16:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-960476ee6f5so1762765241.2
        for <llvm@lists.linux.dev>; Wed, 20 May 2026 04:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779275798; x=1779880598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8LPO6eze8wVsYJxM9DPMdIT0bs2Yo8vf+8RsT33kuw=;
        b=AE858mzhYFGTd3KhsEahYx0bXb3y8GOosVrVLvQfFYg29iwcrIhj8/X7l2eEWo5cxv
         dhkZiPvryo5ilMMHI+bAvpS+AFAp9MEQvrJ7tACiKOwVZrn0RcLOpPjsWYsRRuf/EXkp
         EDJDKEuvEcY2Mt4mQCS8RToRZ155asaxsshJXfk/hD6YCDX3ulfHFrN0VM+Q5g2udSOQ
         PL9XwgDzM+tn0PvUeKIRL0Xi2g8J4kbph6iPvZab3vgI2WVuObgFVknDTCfBX+LMNU2R
         fvKO+m97Lpb1cMTB5CdVmzkW0IAWUE+dgL0ovgAyZYIIUboj03GLDQ8PdJtXb6j5Quh7
         rbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275798; x=1779880598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8LPO6eze8wVsYJxM9DPMdIT0bs2Yo8vf+8RsT33kuw=;
        b=lZhmQEVqkrHd21NMnt/eweO4MuBEotavv3dnmcA54Fb1svg+olCgTx1PeZSPIfqXvw
         BfOmau8uobUKuZpsNRr/VQ2dgLuSPkPk3Ylwiwfa81FEhIvyi3wirWRTbZdVF72Hz/wd
         TjV0+h4XwH6Hgl7WNTwRTEfK1NG1ISTgkVt8wOBHyhrMfl4JRx6UUU/znWbmj0O+uFy6
         wJs8aczrzQAwwqQSXci+B8KSriqsfQ2bGoKA8F3XRyU4lSN6rOXIsaacNdlxCKgN8FOR
         rgaCoYQH6WmRPv+4iDVVCe+vMSoOPs1q93Mgf0e5eRJkR0Dc6mI/irryMVTlMa1xC7Ti
         pagw==
X-Forwarded-Encrypted: i=1; AFNElJ+YPkuQoygVYrpQZLMidFChQUJ2dWnNGjcypqhAftrRaML7IDwBmgsa6erpytIvHYnirXpY@lists.linux.dev
X-Gm-Message-State: AOJu0YyHwGGUHqk0hn2aBzCsI9mvTYWV1eDyypyGPdNJoNtbw5x8GH0w
	Cg3DiOXP+kUKumihSxoEmDDD9lVDorPKDDnm+/tK1FOzHeKVRbnlUVWAB64yuvfvNMgb36zijVG
	I8+o7lSOqXbTbduLc+N6Enf6ixALnzp8ALxriuhhZbqesM/kfCCAH4Hbo
X-Gm-Gg: Acq92OGsiIUNPnJk8Y5Q9S7OsNUHzsf4KeMjd1QPW8CkSHKFzL+ZZv666YUd/RXnVEG
	+SdrnZuASFhnw2Nqlxx5f7yNm8f/fDsopUjycB6lQ8ysb1mMxE8DtJNKvEFHf/nQ/80rp8yL+Qf
	O2jUIgz7r4K4X/4qcwAppFAdZS/ZwH+pEFd+EJM9WUVBiwWxQKVD4OxzNnXQnX8gKpiKp8+t80W
	sCXV0ux4JbZ/ILIDEr8k8M6HeK/iEQ1+gZAK+qAEwQx3Qll6hPLTpJKpFDcyIJGHsTGjep8lR7u
	ZzetZF1c/9/SwFlZJz6D03s2SCwn/U5UawGcHhU7Gd7lDqhlp0mPDBVHelFj4bKeb0HEI6T23LZ
	Uu0w3XuuhlffH4ejh0oAIAR5IKwIfwReyw1C0
X-Received: by 2002:a05:6102:d88:b0:631:2472:e832 with SMTP id ada2fe7eead31-63a3ce1bbb4mr11402870137.8.1779275798151;
        Wed, 20 May 2026 04:16:38 -0700 (PDT)
X-Received: by 2002:a05:6102:d88:b0:631:2472:e832 with SMTP id ada2fe7eead31-63a3ce1bbb4mr11402834137.8.1779275797766;
        Wed, 20 May 2026 04:16:37 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm519463095e9.9.2026.05.20.04.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:16:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] memory: omap-gpmc: Silence W=1 kerneldoc warnings
Date: Wed, 20 May 2026 13:16:31 +0200
Message-ID: <20260520111630.89365-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=bpRfX7E/XCI4WdfVZIDJW6fSsGDUU1ccxHUq45Gn9qc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDZgOhJGanrF4VU+u0it6gisGEiiblRZ0i9PVN
 A1ljkrnIr2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag2YDgAKCRDBN2bmhouD
 165RD/4s6ylq3i1H6zWnYdYPCZ4sykHHKNKctsLXk7ozJfbpYs9VMrja1E9wWiMA2IOGEnJ6kmO
 DPZaIwmJjvXJ+RZjAhibQDSYWF66tjggsN2diVVwQcDak7sXueIi7unImkujskiKr9uVkpmrkFZ
 hATjNXnzsIE2HWVK1jcwPjnvpRQJfu32n9X8wD4lwbAY81A/aBEAPBTZZHPQdfOfuAYzPiO1dlv
 1zNydR9WZcJr5P7JMVjbzU3/8dVEnM1rbJDcacXKq4MZVkzYesljDA3VgWwukBtIS0IwGShs1b2
 j7c2g5fBSPDEsLQtu0KPZM0dL/mfElZELBoifj/weCMGmRanRK2z/oTcJAsERS2MAWli5jMdI+V
 By/9aCvADvIgOQjywqnaoWbPKGfzcjeoOQ3+qvoRzxlpO9ET/OCSAVJMAlhi1ixvj++7R45CFrl
 hfHCm08lY7marwvMOLE4vFOPmghuunYKwMOYIum+b8szau1cXP7Iv93Hs73HBM0PEII7w/nzFP0
 c9qGL3xg0KLUxm5Ri08H7KFmQThwq28MtbpAUdX4ojPuM9B12MdOqLo4S13xfGE69cci2hpsgso
 afX4Pq9b2nWxO9/l9Bqe678jbRzhpzEKtQcQb/lg5WdvON2nk9m6XYbJGgsiaA7lOUTdxybUsCd WO8YHIcJkQ6XYqA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XIlO0u2BQPF-W8uoDeCIXTOkaxHzasxF
X-Proofpoint-ORIG-GUID: XIlO0u2BQPF-W8uoDeCIXTOkaxHzasxF
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d9817 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_sZAi5VIHEe3UkwORBcA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwOSBTYWx0ZWRfXyGtRvg6ccmo/
 AJaKxlbErtO7ACIJHPQ0pQNu2LymCl16XcZqg2XIy7G25Z1Vtjdj33+tD8zNJdExjEd/8hGVBot
 cNp75TWTaAIbFikqNOYFIJDEoq4AU76KzMhutd+6ShTN3urDw27yLVPugdg4lUgMtpA9SYF+lxN
 RB6CXEB+FGpswpV0+VWlQIG02D+Fdp/s7dKbdEp6TN9+IKXlq+7ocLbdwSMwPpy8iktBH4kwOha
 v5weJPmgv/vCb8Ol/nL978dxQDdexYrcxU3hDV14UniyTffVdXzznxSmaxca4/t523bNa2qpMtw
 u5FYlYdp3ff+csyRXO97gZnH+rpeDG9HpJv5XpVxNt0Cikba14HGx7C7SzuS8jBql+enfAM1mP/
 Q0cAPcl0tbG3CHSTWxtWoKSJF2+KK1Hg/ObzQMHnlFN1qIYNYIqWRSDrjO0fK4Om0CmkNdeoWh+
 9WjPnNhM89bHgVTqRDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200109

Recent W=1 builds print kerneldoc warnings, even though a correct
kerneldoc is there:

  Warning: drivers/memory/omap-gpmc.c:441 Excess function parameter 'cs' description in 'get_gpmc_timing_reg'

Drop additional inline comments for arguments to fix that.  They are
anyway not that useful.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Drop clang/LLVM references
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
2.53.0

