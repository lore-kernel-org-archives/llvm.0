Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F7F377EDA
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752938; cv=none; b=p8qz0MEXkEcXRdwo5tUS6UhJtMO8Vu3Y008Zws3y6o/JiJWt0NYL+k3FOuBZoD32yNcwbQCeO7Kn7139icU/qad2sJ0IJgg0LC6SUnhxhZelRFTVAsaQ6ROBdDGEqwACIC1s4/CzBQJafPWaaTLRYOJCI4UZcWzTfJ1aRDzF+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752938; c=relaxed/simple;
	bh=kfK2P00GOS1HGyokkFKCyFr1v2aOTRTV58ef0x8ZCQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pPvJ9sQZrz9z6/gf/AZ2p7ItfWOagNFH4kNAs/wHUz878as5s7UFEn0Q9EAQ7P4s2OXXzrWgqeHYEaxJSM8RQ6pMXeRVAKDVAcDprOo31fUV4+yEpYLJm6ZQckX1yc2RvMcyMnXW5L6O/njvlfUoonvR1POd44eKOA5rM7iTqHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEEWOyMG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XK9nC0x3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEEWOyMG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XK9nC0x3"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7JJPf3124263
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 13:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0VDX03ZM9h3MV8phI/cKgVv2koYIgaCozb0
	lJ+VmqDM=; b=JEEWOyMGS13lVteTYdu3Jy7Z2pYcj2du96D1OiA9boMM1qLaYBj
	8nH+c2xyCAkMy7eyTekiDjxbzlffFPNyAKdyHl3+GptntSUBGIWlxYNtonmfgFrI
	MqjfDhUMqE1qEwmMVNtjqzDzGlWT0BIUzNtmzM56LwG0Xxduc+Dn9L+a0yE99xC8
	KHp7TyAjJ4VFZLHA/bvc4YLxgOwWCEWVMd9iP8HMBOXyWxzHM727REULr4JaX0lk
	npTFvtKZ3uHnYeDKPRFtjQDgixPL9/urBLHaEv4FSPydkuBaFsmZ3x7cG7nvuAJ8
	WP1ZQMLqt7c9EtlqTwGJGkLwLK2qb6i7+VA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2fbs8f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 13:08:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81c571a5so3567304585a.0
        for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 06:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773752935; x=1774357735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VDX03ZM9h3MV8phI/cKgVv2koYIgaCozb0lJ+VmqDM=;
        b=XK9nC0x3DF+8idjdMokizouyVZo1aIklemIVfcx4XLH5MNl1CVE1CZJJ+1LL8Fby5b
         nbmXF0eqXVmvqAiaZQvTppUkOeUGZt9jwEZV+FyTKaEANiv/KGJLsNTDb/54WhIy0GGb
         8cjuG9S6QuxfZMffiWRKbvGCldLlsr+xgGPLgSW5RV+C47PomDYJWMBAtK5F8ncEbPHa
         FXq97UQK0qz7cfP8cckaKIcJ+KWd1P/odeBG4YfLEUzQ7OAaB8uETFSw+3vKjcmoHZRC
         ywuXxvy+DN9IdoFOgg98nOMc2RqjRtFuYkxLeTONYzkXwz21nZWDsDtpHTWwss68qszQ
         djrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752935; x=1774357735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VDX03ZM9h3MV8phI/cKgVv2koYIgaCozb0lJ+VmqDM=;
        b=Y7/CifHCspnadxlbRoSaFqfV1vSUl0KLfuHZmag4VD7PiY+ya2Zwmz8NHxA4Pbm8Jl
         c+cKKMNPXl5O3gezfWAhgNy3YFxRVNwPAqHlrjtQRKyjA06EuAdhPqp8XDMX/Guw+St4
         mnJuRWv25j9zBMKWXKGn6M5hZ1L6RPpRTlPTNsu08X4ZvyhcOjLi/d9Be32AyY/NCb01
         kx3i3BjlZ96MDXqg96RCz8DeGwgL4tqd4+A1BFThEO7TMnNlnGf0ne+tOIjtHYATTw7H
         UHNJwtboP/tNraU2LLju4sbXaitC5JXLOLb17K8hKhf+OFgNuxeGuOnBCmbUbd68qjLX
         QfJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz21lZaphYV2y5FVT9E+UQDxsAz9Wn0PiMXQNTx1nlWGARUL9AW68AC9sN05tmzbxZPuX+@lists.linux.dev
X-Gm-Message-State: AOJu0YzpyuJF3vQ4rUGiErStrtGDvGp9dfFbXgG3vezc58CqPdwjxaNT
	Px+CAm+QqSqCz4DpOqWHYfx8EGGeU7wK3fLDZjXRPHbnDnRXE8aTUvo/AAbwbaoUAnJfkUxB4NR
	uG+JzKu8PXGyRd2+zBE+T6KGeCuVgpy9ixkzVAj1akkw1aEyNQ38shICP
X-Gm-Gg: ATEYQzzUuDv6Q2vRt0eRLa+zDZBDfUBJM30K2YqmZ0VAGp5lizyOr/cxXMyqdpKm0O5
	rKZF7uf9kn+KQZk40iM0kdW2Mz6ivNNyu/jov1cRMa+9JoH3BUcZG6X4o0zOZ6kMZTGL0aOMLGp
	z7pL6JF4c9sKYIKY/F0/pbtYFYOt765YmAY62LAQyDS+vqEEbrbXVxPkXX5ZxMlMARkAQYaeGbM
	Nvak5+6pqV+qHfH1TiitNdr9+aPSA340AalF3U1cXXC+uge3MSIcqYQ+KdJsRKu1Js5NfZdHZV8
	QPF5f0GY+dio9wmzq94h/+UO38xOVdWnJmhyJ2Pkq5SZ4r0gZ6xqzmAYyUpYf+4OwCtLVV89Ujk
	FT71cybm1kI6M0qHHv9fszbRorm3sXLtsQM8Q
X-Received: by 2002:a05:620a:444b:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cdb5b4d2dcmr2133500285a.45.1773752935230;
        Tue, 17 Mar 2026 06:08:55 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:8cb:4dc4:61d3 with SMTP id af79cd13be357-8cdb5b4d2dcmr2133492385a.45.1773752934670;
        Tue, 17 Mar 2026 06:08:54 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b46b41eb2sm14570171f8f.1.2026.03.17.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:08:53 -0700 (PDT)
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
Subject: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
Date: Tue, 17 Mar 2026 14:08:24 +0100
Message-ID: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kfK2P00GOS1HGyokkFKCyFr1v2aOTRTV58ef0x8ZCQQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuVJHcmZsBTdcO2QsppBGSBCOPt3xe/J35A29L
 qNKniyejUGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablSRwAKCRDBN2bmhouD
 14sMD/9UZePTUYjWEmQVApyC5fbqybToJIdplE+zCWT6XcIgZjMA/yV4Eqay0bVg5w9ypQvW6CI
 bnHiJHmLVRrHEr9rpUMKmfUXjc5AQxX7qZmvsBRKtrkK2Nq8+YYXm9e45Etg78VBfVFldLnKky2
 mPMhNEa4IwQjNSnUSToBLesf2dIBoqMmFEkg9t+EMwo9Kk9Tzlz0Ge+9/5jAseWu7issT44lHdf
 0bw61ebC8ObSrAOfd9FoFaGHTSHoB84QADdMuMykgOWf08k7flz70oWllwwruZlzfoNrMEHcOKo
 TuuDqTj9Rkf+9CpwK7ckVAtYyn4x3YjE8OMEOYF6f9PdTUmv6XR1BcLLC0Gw4G/omY3wdnkukOF
 s3ZC1FcDKWqH5mdRAR+n3G9XJz9aFBtLZYTI5wX7vtawwSlrISRCDWCpABZc2E/GlX5VsPwz5/n
 J5gMheGdZwfQbkIVa1dS2B1zASHFuK6L5Exn7cbv3sl9Kp6TafQNiyPVmlCyvFLUsUplvPexMXk
 QIth6mMce/QyVjCtanIjbZsxdwDGAUsyNf/RK1WybQti16qEsylnNvkO/MJw76K8e1MnsEAVpQR
 I3tjJjwkIT8HGJAm0y6sOCMM8hrwpbYIdxItRpsdmokUUXZuxH+pQgXA14uxArmFx0RuTJO3rYb uBwyCdSKIKhcjiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3xyhzSd26IVH__hMvtLw6VpkArHmQOK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExNiBTYWx0ZWRfXyTDXpqRPP79W
 1BPqy6U9M1WREYlBGO9YCRDDJ3gPkZAgxmC5tZpPJJq68UbkVQixuL/sM47NlN4pniMrRFMrVA3
 eRkjUSrP4oPIr97H30mKsAlYeZD2ZWJHH5JgkTTl0Q3W574vuX8TmcZbB4WbZzkkiF7hYu8ofoO
 0uNjTsn66tMH3bYFjR2GwXZvglHjazOmiMWnvq8unglJeCPtRTKE5xemWqTf+Fq7JflArb/O7pm
 rSIUZgV+s6PuxLIyF62OzUI7H+ADtDeYUHOagqzeV/H1lOkvsJDKHnQGTFNMDlkx+85JZPjuCNu
 6RFj6+69LHyTRB9MI0cI6yne3o2TLh+WxfokrEh32m7XzgQpK25ZY6ETET2+O+EPIpuvN+Py/IC
 XWddMl4npIdvdWLT6mK/A12FOdlt7fU6tmK8T7QZGNY1JWRIG2/tTxMp05VB5LmFnO1XiPfzyOM
 5HA6MIX7ibiuBM27IDg==
X-Authority-Analysis: v=2.4 cv=fa6gCkQF c=1 sm=1 tr=0 ts=69b95267 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=AlWDwjukKM133PY4UH8A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3xyhzSd26IVH__hMvtLw6VpkArHmQOK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170116

Return value of ps3_start_probe_thread() is not used, so code can be
simplified to fix W=1 clang warnings:

  arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Resend after ~2.5 months

 arch/powerpc/platforms/ps3/device-init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 12c473768c39..9109c218a060 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -950,8 +950,6 @@ static int __init ps3_start_probe_thread(enum ps3_bus_type bus_type)
 
 static int __init ps3_register_devices(void)
 {
-	int result;
-
 	if (!firmware_has_feature(FW_FEATURE_PS3_LV1))
 		return -ENODEV;
 
@@ -959,7 +957,7 @@ static int __init ps3_register_devices(void)
 
 	/* ps3_repository_dump_bus_info(); */
 
-	result = ps3_start_probe_thread(PS3_BUS_TYPE_STORAGE);
+	ps3_start_probe_thread(PS3_BUS_TYPE_STORAGE);
 
 	ps3_register_vuart_devices();
 
-- 
2.51.0

