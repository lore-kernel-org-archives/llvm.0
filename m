Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75FD29A33E
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233339; cv=none; b=Xmpz1Z0ZeVtoGVVB6sdlTG4tRGK7q7mD1mmuc8uWS5FvG20jny1E2I0GSjZs0q12mcHfJgmhiA2v1I9Q+KObGnPfw33w0kwtFgDbjT5W+pD8hKUTN5TK/5n0pGgK11rus/U4UqGyNKNdiUQtL+k3YmUW1Hy4tM7nMERmhvT7l9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233339; c=relaxed/simple;
	bh=/ikJH6De4AbfjOWMT8h6gmy+j7KyeZ/3QQ/KPQ5zSYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkwCNEND/tVMzCCUbPKlO1T8iOHfncAYyMl/b/CGiFI2mKcBiHQMBu1JnoQuM3o9cZ3PWWmF+NHMeVnDqJHA1+CrN6Wq9U6b/xZb15b4qnEyUAUeMSvovzZ1WY7jk/pW2f18R3iUSoFUK/K96085tkb0P4AltC52faf4W34BNRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNTetkbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RVdPFkut; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNTetkbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RVdPFkut"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FMRijZ2101896
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wbafzawO7kV
	+zq2LriGwy1ZpbXwDOmHKcABoZsl+zQ0=; b=eNTetkbddhwxClyWuSZDx66rpu0
	MsMcWHAY57w5Cz3q/1e+N//9qDTQwa0wJMl5bxtIMeamosGPFISFl3tSeZ3jdS0e
	jAL/IidNxgyxkWpSJew66gYKaIHvY3U2tRE+lvc0dXUYZY8BH+XdYxk/J3T2cW9k
	fWFyMhBMqNTTOjR57F5e/NNUxFx8G3btQujz+Rv6aIMWVlI8diITBHzGhqUi+YhO
	0QbVxRFAK9qmpxPezwO3SvQqodLE49kFL5/wT0mTe2i6cargHd2Fo8OAtvUUfszo
	e32rZrf2QDpLJ0BxHpkVihj1JogcyOvKPKZlg4+lS+zi9frW7iLjQzj4JRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6buj9mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so312197485a.1
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 01:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771233337; x=1771838137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbafzawO7kV+zq2LriGwy1ZpbXwDOmHKcABoZsl+zQ0=;
        b=RVdPFkuter7Yt4gNrlbVaBtgRMXWlUqkAElvhVEMbkHRTkll2OjqubN6zI6F12rHow
         ZUcPvCf0y+XlnTR6MOEOamt6I5qOKnb3fiB6iNKmidYwnvXdCfchq0SafrqgXCPVxRaN
         agknZFYiS9phXC6npYEio0PnLf4XyjfH4SP0NvMP84XIt3RaVUR9cPnMO97iMQ/mXRgj
         ZCD1nz7nT4uWmFd4X7xZUHG1tWPzqpICGdjIAWMM8VvpedkmRFTVwfNjU06dJcUs7Dzh
         u4nKf11NkzEmfl4mb+c5u44bFD19gRALhHaaykkVMPGAGizMgUu4jjShDSEJcL3yoyMe
         mQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233337; x=1771838137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbafzawO7kV+zq2LriGwy1ZpbXwDOmHKcABoZsl+zQ0=;
        b=SzTH3rvTonKNJe65H9esUjNs98M05OaT/1UNbG/hGm4Q+uZQkKkHOrurAq2hJlHqrf
         3O4UnSM2ENMMqmrWQGYV3RM8BS6F4xwVOToDtdpWW96CL4fEZpMzmAMvnr4wVMbkyrGq
         Sw1/AQ0EKfkr9OHbgamiiA2XgXwi1OObrZlt6OdaxS0Ha46KVS1RqzGARj41tsReNej9
         D7LSZgcVAO53HnJdrpFa5XZcT31xTTxOr3omtPAtFEzBzxp89kagOry/BHs4QhaCWfph
         VUL+totN1zNebpga1FdijUyStKHjLhMtdIOoyd23mvbibQBZsclIbNH/4xiIVrdgAJ9m
         /yBg==
X-Forwarded-Encrypted: i=1; AJvYcCV7eY6LHGOdRppgJYMMX2RmvFX07HAt8oEZ9mVaZc2e7J/7gAjWEndcuD7vSNd+ycI3FBvU@lists.linux.dev
X-Gm-Message-State: AOJu0YxCVzGV8ivjt0q5wf5ReX86iMl24c/w5M6JgNvBgPJEQ65ilOov
	QZeq1Ghx3nd4e5mjvT57fxavriHneBea5MkIHx/u3oaDQeYC7vE16meV7duRmp+CBYdmHEAddX+
	yO35x1na/4pF0Ib9iWDRFOnRV3Ckjt2OQoWa7DW56MbtAq9h34QM1xsyX
X-Gm-Gg: AZuq6aKleezkQM4d3rxxAEq3R65guLlAdqsagaUkUFxsa2MVWU+o/xAfxxcMKISOBRB
	/XYtrCOwEqD4kW9uMhnd/eB/5ei3dr7c6rHE/NwVERTZDyKCUyTRa3GFQA6KUnz30w/xDExM+g6
	VybHNd3cSe2Ta+cAY5jbHmoTVZzWhrLlZp10iRUfh0yuGOg1IYQe2QExiPddMcRyf2eyv0watvM
	lCaVjNuXr4/2Ha0DXAejktQVaObVGNa/pXIG9+yWqHMJuZ/fU25crLc0o+FI/gJ8KTW7oc9cvbQ
	cjaspa4G03H9I2qGynzv7y0i2hV4u0719UQYmgWxcAbdK1nE2+Dmb6Fm+PHC7JL1LKv1mTuZ3q8
	kJsJ3Lip2p3gye57+IdFBmKQJJTEDu8PmLsZC5w==
X-Received: by 2002:a05:620a:371c:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb424bdcf4mr1130625585a.78.1771233336844;
        Mon, 16 Feb 2026 01:15:36 -0800 (PST)
X-Received: by 2002:a05:620a:371c:b0:8ca:55:ac60 with SMTP id af79cd13be357-8cb424bdcf4mr1130623785a.78.1771233336201;
        Mon, 16 Feb 2026 01:15:36 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm23110552f8f.34.2026.02.16.01.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:15:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/3] firmware: qcom: scom: Simplify mutex with guard
Date: Mon, 16 Feb 2026 10:15:28 +0100
Message-ID: <20260216091525.107935-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=/ikJH6De4AbfjOWMT8h6gmy+j7KyeZ/3QQ/KPQ5zSYw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkuAvS+17eCq6Ioba+tiCTn6eGAHmhezjVjexc
 bOPLKuAttmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLgLwAKCRDBN2bmhouD
 12bMEACZtDf7H99j751dGwDiD9yr+E4Y1o338eBn0zxEOQDT5rFCRxHLBt50CuwA1ZFEPD/vNqX
 JhbnGZguZjmMa4SfldqkJzRYywZcWNMyvxQg0hDR7XqhxGpuQWDvjOjO30YqntTL5QfVpv+eQoi
 jS85l5uHfUfxzk+nql+2Njy5WIjLf3YX0QYyKYXqQWXwOxuIpiDe5gyqxKm1O1Gq7PA6iJJMp4w
 pkA2vk0z2O1B3+P/1si5CQZ77nitSDtWeNttTtaDYcGTUF0MohebvSu+da+2BBOPnjpPsijNMo8
 07s23OO2kydqb/xl7U3tdGSjy20KLurSQ1homV82J78GmAAmkssXhO0yajobw9IvIi50K9h5nc5
 A6yy8pxW46eEVE+XL2xoe6nlCJ7+CgFJgO8tBC1AQOb6uHoYuq3V1N0a+/dcdvk7vD6Qtbz0+pS
 TKaUHKaA+XJqwocoifWHkMowbkD/naCSTJN2qmNbldKikij3hwkf2MJYGYfmmpv5rSyGUpcV3+z
 gLPWWDIs5wbb0cxvIMr3eODvOia6ImQzRLPOxOKyC9fhgq1Byfb/dyqOiCekiyKFNICvPhZN58B
 30z2szP50tNKoxrWO2PQVg3YJIlGpH2MylxgkZ74+P2vDMAa6JkSw0eGRpqOg62q1xALw4205PD Er3jMmh6HELJ7PA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BTqgjNkjiAvAX3-U9Q9zobCCl5m99yeF
X-Proofpoint-ORIG-GUID: BTqgjNkjiAvAX3-U9Q9zobCCl5m99yeF
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6992e039 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=qlTs7ZDSZxy6MtpO9yoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NyBTYWx0ZWRfX4MnBsegweRjW
 5tGJELR9Gt2Qt91BsG97bts91s2XbamJ0T0adMGmfvIn71RiNBhUM741I4b0XzcCO1iofHgDzfN
 feejVnYPdLgf7em8EUisvU1D6ddYApm/kl1BY4OX5FGzKo1vYyTRSp9JJnr8yOboFe5PNKfQgU6
 a96cMp+3383/rnyKMSnmNdlI2iW9KgQqw3aW/qWPSTSRs4fHXS4WYXd008Z2VykrSlyhIIQ7RWa
 RfQMlLSL09VQJZHIp/wikG4W8f0hfi225jA3k3R5U4BkSvMh6FvhYpspmrbeILwQ5GPVRWTGevq
 gLgQWnIvhh1IewMyX2HD+c3i0ono2TBdUWad1ypDRLPZLyDbdCCEMLVrrTl+enrPRJSPdy5MVMI
 Qdzy0BZRc44dq5luuxh6u4u3MCGPpK9P30uULYNNlytZf2K/H+/n1eqG9412tGXpuJc1hZ9xWJb
 y60rw0YskVrQc30rfRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160077

Simplify error path unlocking mutex with the guard.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
None
---
 drivers/firmware/qcom/qcom_scm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55..f1947025d8b5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -199,19 +199,18 @@ static int qcom_scm_bw_enable(void)
 	if (!__scm->path)
 		return 0;
 
-	mutex_lock(&__scm->scm_bw_lock);
+	guard(mutex)(&__scm->scm_bw_lock);
+
 	if (!__scm->scm_vote_count) {
 		ret = icc_set_bw(__scm->path, 0, UINT_MAX);
 		if (ret < 0) {
 			dev_err(__scm->dev, "failed to set bandwidth request\n");
-			goto err_bw;
+			return ret;
 		}
 	}
 	__scm->scm_vote_count++;
-err_bw:
-	mutex_unlock(&__scm->scm_bw_lock);
 
-	return ret;
+	return 0;
 }
 
 static void qcom_scm_bw_disable(void)
-- 
2.51.0

