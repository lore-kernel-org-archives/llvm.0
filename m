Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAE739B94E
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752949; cv=none; b=TcsJnSg+GXMK18ALWozEwZkrfR9mYJMehAqs5GGB2vhLeNCWg3qPdnApxa4BpjT4Q7QL/cTjg356d03XhrG98YVt0OoAvv6pl/u3hnKQdj6bvHzBfRBk0OvqDuoRtB5u6ve9eFMMpJVBJh/oONDKL/AlwOEH3dtiPmdgC3OteBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752949; c=relaxed/simple;
	bh=96SWoAibFV3tjtjEQPk9F17pt6xqar6t60Ckzs1eJk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mx4GLMqBaAEKCoSAgOrlWQJ/sg2ex2Ouv5Kb+lhryGsJuzhzt343ySVIQ+Na5Z4SwSaG4uUX7hPnjuKBI6O0OlwFqelhM19OYe8SzaukXLRPDgl0TSiJWIqjYzfZ2INABhlChVjpRapBuw/dHJTI81tfTnPUhIWE3v7abze6EcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCb7Qnvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AzesCuBX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCb7Qnvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AzesCuBX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8SnMe1534048
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 13:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GQfb/tx4D3d
	bMU3wHuC9nFeG4ztBltIEORMYAwmiZS4=; b=aCb7QnvxVBIt8Rg5Y2sp4jsI7cc
	nQCHxQGS2H7wq793AuK2tA2+Uy4bOWgRIFHTMnF0DueWMcUa8SwuGUQ7Ac7tfFpR
	8NkH0teazLN1wzs/5GK4DFB18xIWQGoYxaGAqt44NGHmuGeWGR0IYvHMYhdMjfW8
	9IiKtz4jL+b3I6TmhVSyAxO6+UZTfjzJ5QhHLMy9NB2bbVT99GbM0bIQta3mJSp2
	PwsErY6zHN5YvokkesdNe1fC8b0Sj23D7npfN8NI58KpZKXzwXazAqzBjeULmgcX
	A5eDV3/EHYdSmmwggAwB2PV87mI82wSwCWGStmp10dJ8f0MosGPbJcaOMEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k4614-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 13:09:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd773dd409so785257485a.1
        for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773752946; x=1774357746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQfb/tx4D3dbMU3wHuC9nFeG4ztBltIEORMYAwmiZS4=;
        b=AzesCuBXI4R/P7oDcsA2VYK2xRpat6ZC66SWiPxPOntFHU4H8n0Hj3NtDb3Z/uqaZ7
         gJY93OaCP12QS2JaxahkmTKUqJkI5oSjHW7gY1MXq64BDqvf5FLa41RniId6xAAr3AL9
         +aIDzWmvp25Il+WGXct3l0ACtbrMn0mPJMsKdyx5lfHUVvs7ByyUIcGaor4OF34Ftpt+
         p5ICDcXNKMzDA61/WwmO5o4Tz2hB8KQh5cNNRUlj0veBJgEzIzUSZC8tckwDqig2lJqo
         RgcNPniG9oy+PFeOu852JwhESlpYdpVYfpTxR/yS9m88OuWbhLjmCfenwOkuTiG2TLXM
         UDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752946; x=1774357746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQfb/tx4D3dbMU3wHuC9nFeG4ztBltIEORMYAwmiZS4=;
        b=Vkt+Kmn8bWbFbRqmgYRBhD6F3WDWVZnRZwWIUVVNeed6+s5jCnwnOD3EHf8Sli2fCg
         m0Z7FdUNA+9sKWDkWxTJwcv3hpc69Pyjj3W2sT+3P95YXzCCq0pg86Q8NaxJyNj9TQM3
         YKOcvMMRKYMlC4LzjMbAEPKqwkb0riBTgFX6PUTNZt322vKc0Mr76TDldLyK7d7lMw9y
         MGuL28QmaD+ZwKuFMvclOPsEx85m/WttRouCbYinA2zOIDxx0NFDdGWpAdtnMz89edzb
         9nI/Xl0sQRLWzO904lDV8pE3UD5MFxov7lyMTZc8fPFpJlDBdg3cq3fiST5dMWuxPyEL
         Sz7w==
X-Forwarded-Encrypted: i=1; AJvYcCXfWjHjiWmMn7MKLc8d48FD2C/G0H5f4H3nj7jonWdwxM4dXzfLDWeBeVCZeg/hGzpTTbXQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwpQdjYNohLjsmtLjaKMDCbS+bEvEKHFWS9PGzoIuMMbRrsZM30
	hD24fxWDum0/KV8h8T6hUkbO9IcP04mfbqYLrt80U0vvwCcvI/Nd8GriLgP9D789+KVBuGW3JoH
	q96eZVyr6IsA1uBaQ+p2oJzb4hwyoLy6nwxGZ3iMkndqpuRsKB84FPASD
X-Gm-Gg: ATEYQzzGyPkq9xww0uWYn1KJIlAI8tzck4C4GRJEsEsHbrYBdVx2iFUHL9vZKdawisf
	U/yWL2eQXodKCfKTR2Hp7/bAkGfyeaHRnUattQBjuziCMua6UvqwC/k6mOPdm17tmLHrw8dOiGy
	eNd+yW1pOrSyWX7rfDG6+TPwpPh0grqSBPTMbUaSpNnkYyisBSE466oM1Ot44QW5khga6rLS6XK
	ksHzaMg0QIIkAXtoaNIKKl7v2tA1tAFMgJ/8FXB3tGAKLh+CL++PvzPdoTAYovGk3K2CxEs+3QA
	9jzNRtsrp+v99dWiu8Kligw85CQcX2ejC/95EZ2sbS9JnYi/QqDvwqf+GPcNHKN1jz2fU/NTPOI
	5nsJitnXT5h5MCrJQAPwthC035n3PsbOauLdH
X-Received: by 2002:a05:620a:2590:b0:8cd:aba9:d1d8 with SMTP id af79cd13be357-8cdb59ec31fmr2194718685a.7.1773752946411;
        Tue, 17 Mar 2026 06:09:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:8cd:aba9:d1d8 with SMTP id af79cd13be357-8cdb59ec31fmr2194706585a.7.1773752945512;
        Tue, 17 Mar 2026 06:09:05 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b46b41eb2sm14570171f8f.1.2026.03.17.06.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:09:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Geoff Levand <geoff@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RESEND 2/2] powerpc/pasemi: Drop redundant res assignment
Date: Tue, 17 Mar 2026 14:08:25 +0100
Message-ID: <20260317130823.240279-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=96SWoAibFV3tjtjEQPk9F17pt6xqar6t60Ckzs1eJk0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuVJIwjT4JHgKt+40M9i+eQ/qn1bin5yLqCfJi
 fq42xL0wUuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablSSAAKCRDBN2bmhouD
 1x/rD/91QuQeyjntuB6bcfyRqBBT4uZec6/6DliAsD101EpLame/EOIb7GntPK+OYBqhWCLx/AQ
 JQlAXbW36oKt/oYnhIU+1/JKDKR/eFMdsaWAOTbBIMk9GD8x+0Z38/qaTQrr626dR95YyVpcKKt
 8sePby+myDxWCOnyRZLsmJW5ftRm0wdRcWINao/RvPg7gkSENeUo0cGywbskyRj7f1vjwFn7foi
 /DBSAtNEQ6zg9WhlfYmp1bSmK8MOlSFdZV81OoeatBEQSrt6eMNgPb/78GlpYPj2CDExZ4pB7/X
 9Dux6Uf83R1tKlTcDT1La1kn8BPrhhsx5vPl7qD1UbCzyW4Lp0Z3XIWq2crsRtBvYipHsO9GWu1
 bJn3CxSpEDJ9ruXeYROAPS+4ks2NRagBtI5NRrMnQWze46ZgFEyewL07K0k5RYMWEaaRNDtfSbC
 F1tKdjQUd8pvLWBGYAH2ot7+NRnp10gMoSGbIgWR1kKPAGJnvMMN28t0hpp/s4t/BQjGrfiCAfS
 ie3f87BM6V16ALIDkBDbUmOv0YozVDUudcr1FKvo9fB6vKkf2rOWAj5xLM0x+HnGLWuzCdmmwAT
 6f8LxFbaimYBnv8djnrZRy5C5n/wgBJjt8+LpjFzdNqKV+n1EVAmE8jnGkfHb3Qgcm0S2f8xF8v yCl5VuMAGjzlUXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b95273 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qHUQlxOfq5TjuF48b3EA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExNiBTYWx0ZWRfX35c8vKVtIHaV
 hosoG4b3OUUXyzrBc5SHMIqYXWfgnCUbl32vnNO1M83Qtnk46oHOfqHTlmjgWLlYs915d+S24qu
 tywqCztSuxYfxTi4a9weFjvlud0G51I8iCioklVS/Lx/uhmCiLRPfdKd4OXCLO6UUHVxBeFwmeK
 8wCOyASI8K3qd/Jt9IYsuWZYnvuThlM7z37iq7y7e2D98ha7G87nt7WfiLtR4D88LiYY/FUGf1i
 JcRM+5Yj1l1brRuOT/P5NaiaS7bLMLYPHOSj0tcjAxdQTZiJZ60RAQVl2sP5Vr1cNw96LkVRXJp
 DhzZjuYqyS8726MldzT597GxiLz4VBjiA4b2R316jGre8zQq3zWmwRlRMayKjRdKlcGZleIGln6
 VJLICJl3RyIHT5PX+l4/S9Ul4sthhZyLrX7D2MHPKFm9ECC3EkrFVK0eh1YwejC9RTAJGlZQjQU
 y3HkcMtGuhFjC5PptqQ==
X-Proofpoint-GUID: 1nsbnmNXV-o2oMe99x3j-egnvtUD2zVe
X-Proofpoint-ORIG-GUID: 1nsbnmNXV-o2oMe99x3j-egnvtUD2zVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170116

Return value of pas_add_bridge() is not used, so code can be simplified
to fix W=1 clang warnings:

  arch/powerpc/platforms/pasemi/pci.c:275:6: error: variable 'res' set but not used [-Werror,-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Resend after ~2.5 months

 arch/powerpc/platforms/pasemi/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platforms/pasemi/pci.c
index 60f990a336c4..2df955274652 100644
--- a/arch/powerpc/platforms/pasemi/pci.c
+++ b/arch/powerpc/platforms/pasemi/pci.c
@@ -272,13 +272,12 @@ void __init pas_pci_init(void)
 {
 	struct device_node *root = of_find_node_by_path("/");
 	struct device_node *np;
-	int res;
 
 	pci_set_flags(PCI_SCAN_ALL_PCIE_DEVS);
 
 	np = of_find_compatible_node(root, NULL, "pasemi,rootbus");
 	if (np) {
-		res = pas_add_bridge(np);
+		pas_add_bridge(np);
 		of_node_put(np);
 	}
 	of_node_put(root);
-- 
2.51.0

