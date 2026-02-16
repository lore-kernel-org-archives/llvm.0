Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3858285050
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233338; cv=none; b=gM9r724yjQt2F8F4323ZggZ1zNlq0Zsa+Wi9lGsNUVfzsJdCYAIJ0NBUUluohEUAywqw1df5oXLKyOfFWJUaQy8tnUM2HjmfMC4ng4SutCjUZf3Y9xGASTYDoHr1lQV7y6wdkI4J04Hv73oB6UPAVHH2KjYmWo9QKvPaf145XQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233338; c=relaxed/simple;
	bh=JmSUF6nzeFIiMbbktm7w6KIxnSf4YOjIhjN2zIzdL9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMb8oP9JPRzHBkGBCbGqkHPk7Gdy4VkcQuHqqLEYea4HgaTK93gqoC1t7YBW3RevaxXilt3JO1B5ml/hy9iXbcAtFsAsFCjb3B47ZZGSUlj7bGciR00zYqAMrmzBttASmWNDpvkxxzzCccqPyhAjYaQaxuDsDcFA9zZGSSFm6Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKWTSkNB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DtwhFWT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKWTSkNB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DtwhFWT2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FMtM0t2311401
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vzLHoWueb5L
	H4XMdM/4ZuLuh6B9f4jYT8Gdo7eblWVo=; b=hKWTSkNBvI2sYVMVgIQtriRZRxz
	Gw2M9e841jBvQQeJ6LBxjnMyw+1Eyk7EouG86gZOkopPnyFo2qdMtKGtQQOPDK6U
	QLxp+VMnDs2JgbsY9y1XAarhjP3OXprnqHywyz/0OW0mj9EUSW7R6zxOGCMKRDKt
	SJSDm0xrh70e0QEbphisQvch94wL0REvlvNCSAZq71+fd4WRDbHwevij2C/Ao70y
	ivOZWvLwXCon4xR0wK5lH3zSFPTnvqk4kXErVVbUNcGYbfC6hge4/hXeoyomoICa
	BXwH90qMsItokgZPqc/fCl8iqEhi8cIPhrFegv9zDHpqWruzfoImrLwvAVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf42w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4b8e9112so150192785a.2
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 01:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771233335; x=1771838135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzLHoWueb5LH4XMdM/4ZuLuh6B9f4jYT8Gdo7eblWVo=;
        b=DtwhFWT2XLlgXTEwFrW8ItRDh16e/Zd0h2HXTDQ3U2Cqa1met+WU35DdYJ+0daT2KT
         V9GwmlVcTWSV6Fw3SDI8KaYLVdz6BtAu3H5bZ9uDbQtv0N7tvgeXXPuWarDILInSWx+m
         plinTMpfwhmKi2Qnyk9oLu5OtjumFv7hhyTuO5xsA9REyq/4WUq5Tevt5vDS+FT3qlBx
         vf+aI9w0dmLMQ4afBZGE/3qRp7vE+/NyLEwRG39GkHAQAMuLeO+ItHvNVGlERiRVGpVk
         r5onC3LJK5s5JfnfbIBmpSG6z7RAmRJqNQTa8GRP+P25mqDzT7QK0jhZaxjXx8wlzlwK
         85uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233335; x=1771838135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vzLHoWueb5LH4XMdM/4ZuLuh6B9f4jYT8Gdo7eblWVo=;
        b=J1X435DfSvjnnuX34ZN4QkHBiECu0p7v3vrrDwHa2XAo+An5wJL0WCi4iLIECghGpG
         oCwvFfwQOMzu7G4SeaWek9sDZvcSsTgvHFRY2+wJZD1bVNDW3W5NYgTO5/bnrp6IPzhq
         XlAmhxhGP2eN4O9zblEFQMP+Reoaw9mAOupgPoUI9cXd78lFSD35z82cqcsZAeDFhWuC
         ZrtfHw35IcFyrIXC2a19G3oLzBI0JVNap3aYNHFY320oN9I4+ar3MQOHTgqgiJKzg0Sw
         qTijufghrYj4NVaiL0JcDdPQbtfhflmnp+jpxB8XIeL3UwPCuON9FX+8qxNxnJDPuJHr
         q3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8CPhCJcN4xoz2XN6KzXDHG/djgHWE3Z3HhYKu7uZpXghnfboT8HHrRPPADk4yd36njGDW@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyf34ZYUZrUtK0zKruLemiTaS+6lT7SjBuRzxDSNW9oHCBLUIg
	4DYUeJyGTjjuDvfxBJrs4acuDdm8RxCHEUPTDi9a0KdOOg4zT28jygz/cmDBCTY1wWKhlmQsZ3R
	ffljGi0sP3wFWns5rnXxJGa2Dwxr+lLsWMecf+xdFuX66Cus0kNF6K9Di
X-Gm-Gg: AZuq6aIn1dxxFGy9TZHR9fSLJmB2F5HddcH3mnjUf0AHSdufbT+aYWqpIGm5TU3hQQ+
	NthApzflT+YtVLsBolb5SPmjmi7muTT3u7GUo/4D2sPOSn8s2JVrrvQdddj1JdLCF1B2THN2ClS
	WOMi8r30S0gb2TN7g3A5uVaONicNHFqEZIF1X9Yn3lX6Nu6Jp+A0CLpWDIhUtxOniVtJAjR3zC9
	Qal1HYa+h5Ihq/+lKygj3wExxaMzJqvhZONI1KYLFgTwqy6a/1mglN3EPZKgMxRJRqg2Q2U8lXD
	x17iogK2ZySVLbZ0+P66D12XkygbzY9US8FJBFR/lVLKhGScWsbJTSRcYJ0vZLj+d6Z9FYG5zp5
	h9zfxQF5VmnGQjhWOdnIarnp5HFrznud0AocOpA==
X-Received: by 2002:a05:620a:40c9:b0:8c5:3067:903c with SMTP id af79cd13be357-8cb42263078mr1203605785a.11.1771233335120;
        Mon, 16 Feb 2026 01:15:35 -0800 (PST)
X-Received: by 2002:a05:620a:40c9:b0:8c5:3067:903c with SMTP id af79cd13be357-8cb42263078mr1203602985a.11.1771233334593;
        Mon, 16 Feb 2026 01:15:34 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm23110552f8f.34.2026.02.16.01.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:15:33 -0800 (PST)
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
Subject: [PATCH v2 2/3] firmware: qcom: uefisecapp: Annotate acquiring locks for context tracking
Date: Mon, 16 Feb 2026 10:15:27 +0100
Message-ID: <20260216091525.107935-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JmSUF6nzeFIiMbbktm7w6KIxnSf4YOjIhjN2zIzdL9Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkuAu+G/knFvTB1dINucrhXlj8FnGgfpqV057v
 G5NQ1QVBg2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLgLgAKCRDBN2bmhouD
 148nD/9FMmlkh6AOAHdnjguaVAg5YR2A9B2dbgOInHOG4PIufs+hpMgi5gtIAiuPXePXUKvDgO9
 qRZs84dHklxLWej696WvwPch1jWXu83xQl2Y+sQwBYALr5Ji06hCA7T5wf/5glnombTFjCMteAi
 9xBX69Pb8etq+yle9tJwpLH4yrzfWE/0iYkokX+MSObrouL6Hd1absxTRQ6GnA/vag8xRa/mgen
 jtjIIF9bND6Mqs1kA91eF/5xhajDlwbg6BwPj4d53NiB15hXxzY+qOkIJeKqwCzd+2BKXfsuFJy
 UAJKtJQxvQx9Am5y73eQdil/Vb5LlBWIqL1/H3fSjIN5M28FqYWm5oQ5CyU1dKkpH2VWdioswE1
 jh9f5znqp/uzfE6A8FghEUpLyx9E/8dSf/MRL8nlMpI7i03sNsKAMiDllrIhHLJio7ea3LegsKs
 c1FA6fQku/q+faXHUT2CLdGyIVtm84gkYYpZkTxIh1fV5MvMIHST2S125oS6WhUlWiXs0YdBKQA
 ote/Y53HBOlP4idnlh5KV8wOXdXMKbX7R+ofIKlZCO8NPnBH99Q/wwha5696KUVGRSrnHi/d2Mh
 7h+diAHNz0xBRz8CnKAAKfsxK59eDe1icuyGjq7jQIeDr4c3QfMK2nidxb8J/QG8deXtOyDsGWS NpjDwcjFYRgVphw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LkkTUNzQ629thCIbXdWGwMkm5vozQDHF
X-Proofpoint-ORIG-GUID: LkkTUNzQ629thCIbXdWGwMkm5vozQDHF
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992e037 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=bn8xTXm29JKxWhvdH30A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NyBTYWx0ZWRfX998TvGZ/7L7x
 8iI6CdHjr1o5wy0C18EJmIlfPMYtSS6MqOBKfpcIhGgKNqf3VD/cCFThbQDLD/fNcX5QznLDYow
 bP+j2ZK6Fx56ik910Of5GaWYWbJqSH2sC4+R+3dt0ds8K7xIZYcn2xM8kUk0qK7DgKzwjaHZYR4
 AZ/22odhoyAf6j1Kt2ms1iNc8RUcQarpVQzNwMms5Oq7jo6Y7JEW6pHFGJhRIl4EPy71OZmx0qg
 o7fAEiNEaCUGRoDlz9KcPN8cD/w4gaUyXGiv7czv/TfS6gpETrPF9g91eXb/gsGFR7a+w5zvmmP
 0+SLv3p0Qy3uKOdcPNR5uzpzle3huT81pigmsgIsL2SAFuJS6CwDukE+RK4IgAch+U9Ysry9WGI
 NfdxRmSkrW4MOs2/gTPuG8ePfW7JrBMLnHGyxi+Z+zksoJnRQKaU6BzR4y3/DkgD1DVa800sdiu
 KMPCyue5vVRMXsngZJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160077

qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
respectively, so annotate them so the lock usage will be tracked by
context tracking tools.

Note that mutex is tracked since commit 370f0a345a70 ("locking/mutex:
Support Clang's context analysis").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
Rephrase commit msg from sparse to context tracking.
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 21be447374aa..befa68d1dcaf 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -710,6 +710,7 @@ static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
 }
 
 static struct qcuefi_client *qcuefi_acquire(void)
+	__acquires(__qcuefi_lock)
 {
 	mutex_lock(&__qcuefi_lock);
 	if (!__qcuefi) {
@@ -720,6 +721,7 @@ static struct qcuefi_client *qcuefi_acquire(void)
 }
 
 static void qcuefi_release(void)
+	__releases(__qcuefi_lock)
 {
 	mutex_unlock(&__qcuefi_lock);
 }
-- 
2.51.0

