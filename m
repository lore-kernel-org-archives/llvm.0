Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AE0280331
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233335; cv=none; b=G3d5mHBW7oWWm5p3NUJLFG8Bxkglt69nFez9/cPZkx4hj2dcTgJhrlylSgH8sKAe7YqsShL5KGhC+ycrucfHa6n8DrNA408RfQN9K3RvnIiFILnXBtx4FnWYUvQcXIsraf2L5YnN1Du4YM1teZJ2wsghliK+ZdKs2LQT+6F+1F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233335; c=relaxed/simple;
	bh=PA/ALeOd6a4Oefj4lbpJfvjNcw4qM4xnR9FG34ig7qI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYH4CYFtWg1qElf/q40v7AOf2HelufjRPipjkb4TYYV85n9362f9YTDQXqKMdbvBtJm+GAaAn3Sr1edUJOdaVjdB6Jz3Bnv52El4n5wAS8qPDD+eqFux/NvlGCy3eG1Su4Uo0+AR8IyeQ1IODGMAGxr7AJw5w9W1VZ//q8CyIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0b2bVr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/3fU+Ld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0b2bVr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/3fU+Ld"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FNrGQ71491444
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HKo9QyHNWouySmiwlThiD4YVRnPH6rYAbov
	2IQI06QI=; b=Q0b2bVr4hUAy1Wn9sH9RPwRvuAoA6jtJ9S3DBWZoM7dxVe2ALdp
	EPR6giMGwig6KtFww3fFp/ppunFf5AxibtkWjvweD60ohEqtSZOOFgTu4f/jHB72
	SZ9SbayAzDAfXTts5HxN686r4S5bdNF6nJtoPqh3cnvBVbWLyn5PiSAVTJtkbxxn
	aF7anlvuKEtBfgZbgfN3CicCMo0hjqjN9D2TtcivXta75eh5O82rHm1jsWarePBD
	AFqIRe2gmK/AdKcxYKVbOXKltE7kYf/wO/QjXSPwjE8HgP21mbM9ZlL3CSK8HAMj
	Ju49VEqJST5qNIvAp+K7sk1F7BsURARqU2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cajb8uw9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 09:15:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3fae6f60so1872165185a.1
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 01:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771233333; x=1771838133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKo9QyHNWouySmiwlThiD4YVRnPH6rYAbov2IQI06QI=;
        b=P/3fU+Ld2CLR8sRKstZv8ljRs8uFqOP3CQ8SH0vPkFNfimij8cRaPB6oV5KBJy4VG2
         H3PDIMwR43C44a0eXayarxMpJe/bVYmwvZU2ngWhWunAAasU5guGl+p5vLQtzvw3t+2h
         1jmQUe+Puijh98WL6/ICJf25EZFI+ETbSA904shUnGzzfnsWn8hKArI0QNoh+35FfwBG
         E43VpdJEWVzXXGE60qfrfZmzlEZohOsQ7QSZWKEtXoNQpZ7Nud4+knyPBCUhTpMq4dEP
         W0PD7QIJYi6qCO70EprNb4sTJOsowS1STAkJrxf8othHEzPw9FFw1lhZJdKQH4SB5LyR
         ZAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233333; x=1771838133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKo9QyHNWouySmiwlThiD4YVRnPH6rYAbov2IQI06QI=;
        b=lySGDObjN+say2Amjq+MTj38ND8tl4ybhoWT9y21IO6h5P6F5ohOQtBulprN2+1LoC
         SJZetQ2oa+EMP4Ds6dySOcWgvFNH6pQljgptawgI9oPeyR4yKfApI8QomHqfen2gwuP7
         X48+69jON10bKej72VfQ0cojO306S4WuLZf9oWDC3aSPnjkIp+jbV/CG+D+Q9/rfFfqr
         orb7eCnpfYX5BYgL5qDIbkwUNjdpQ+TYZ+7zSpVhR/oU+lHIZXT2KKmjtJmwCz0tA7m9
         VlWOvLZQl6qLd3HqKmW85lM/ky19cIlRfY3ewhyGseFPw9fVp9O848AIgWmHKklR+5tB
         VyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcyr0JFA2avjmBXqP7pZ/1Gn9hDusnnvlvlaXXcDUJT54Fqmbk0UGT/UCukE7UVVsgzkf0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz74ojjQLmb4///4jTTBcR4aMnMiPVed0pd8SSh0XsBksuwz5WA
	IiZ7xWm44b5V4hMbKGVWPYfQg5qk7QvPG1acH1sPcKjN1PXT0YsEGkalofdPPKaVJSZw3G6g0YH
	jU06nmsYs5OAYWXrPu1qGeW6AUDa9Ljt5WZit0KkUebOIa5PRhuIT+PZK
X-Gm-Gg: AZuq6aIiaE/jGGtTrLTYbHdm1bc6Z8d+VF90M1TlUHY65ZNSzzF41ltZGlslD7w1mGj
	de65cL8H4NGR5b8fLSr71FIGgRhsDIu2n8WbSpH97O370m/fRGOJGBeycHUmd9Q0MkWuE5MyygW
	geXTqgHisrIvYhBX5TF2Q1fNzMRcGLNQSe+XRn8gjavhUr+c/xRkPdCl4G82dUazWSaiWsH/Jub
	Kgd9orhdrqbwOu+LXh4lD2ONFOmtVnEcfc3YRH9zzEU5xsWZ8IZekrUnM6PWjbDajDQw/9I1dQS
	IxrFPKPZgycqFWxUgM4fgqVefS2io7DkjweyG1BwP5dN1jdwnYyJN3d5MRfVT/NLyfGbiT9h6GV
	lxgDqsXSzgxifiyavkHfYw6wP2nPgRwc0gKFVog==
X-Received: by 2002:ae9:e905:0:b0:8cb:50f9:20f6 with SMTP id af79cd13be357-8cb50f9246fmr535599685a.34.1771233333176;
        Mon, 16 Feb 2026 01:15:33 -0800 (PST)
X-Received: by 2002:ae9:e905:0:b0:8cb:50f9:20f6 with SMTP id af79cd13be357-8cb50f9246fmr535597785a.34.1771233332747;
        Mon, 16 Feb 2026 01:15:32 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm23110552f8f.34.2026.02.16.01.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:15:32 -0800 (PST)
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
Subject: [PATCH v2 1/3] firmware: qcom: uefisecapp: Simplify mutex with guard
Date: Mon, 16 Feb 2026 10:15:26 +0100
Message-ID: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PA/ALeOd6a4Oefj4lbpJfvjNcw4qM4xnR9FG34ig7qI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkuAt4IViU8A4dWN29pTp5Ek6xfCl4V/3oyJ5J
 QI3fvh+X1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLgLQAKCRDBN2bmhouD
 11czEACFGr/cvt6gSKz9PG8VDvdQYu3m+br71YgSyCzsapDN/5i/1cQJhG4ZwNF/gBHxIwfv8Vc
 7SQazyPyKpjvapb4OvSC14++Beuiq2LLFxPL18Vq4PuK8q5Mp8Yx5UrWQ4d4PiVMnDNhV2i9I8e
 Hnr2loo8p+92PlMYVV4ovUYHzEJFRsWUHHtwKy469ICG05zSN3Fr99dhTN6sZeoBGC553tZrUie
 RzRGMxAymmVlg+BXt4NS9UahmjEaUrTO/C/VuO0E3sA4lTlP7TuXDWdNDFEVUU8yHFJ/tU+IySf
 Uc8DdXV75vYJaHBhOK647tan/uk96amibLrXkl8YjyuSmE/319tIdfedInuu7VLQ1aGiqoiVqPm
 tD9oYuEGjkjyJiUOuyxpyQoCb+gyeOWgsIWXMKMSr3GVLGf9CioYv22KiixiEUBxt4Pnl30GvsY
 IqdCUXHTAhEqARsP+DzZ3o3cr9v6Uk92vD1J/AOYkXw9KBfXEpaotlSlVzT9i46AfR76aLAr0+V
 7OODxYu1yP5Xv+IdV9E9JBB1scDnksdcWvPNza9S+yPSpBQWrXQETpflq63TyqX0mSTVBkrXbmv
 uuLqQhjFFYeATUnEanOfSCS1NED4/HUV1vcgTamy/KcL3+YF57fXDOB4tnG2+ytEzyBn5+FtuhM /9d7ZCqpyQR9M1g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NyBTYWx0ZWRfX1FM9Wk83499s
 tYVeBPzp0HTh76G5sKo6KVsjope95lsyW5Q+JvCBoq/1MXtQoCbsmvi9AIcEblSIgYz3FcO47Uw
 9o6godmfWu+pi0hByx4ngFJ1Tjt16TOIF3gw7Io/VJ38CM0/m5uoAay8Ts2tbRoKzmHHCGU6K3R
 xM/nxjro+YSrZHwWR2OzN5BLuwRUJJdCy12E9RFrwIrpzeeFclc4TvtkmLCfrRV318A+hPrfOhy
 Et8O2XHFvN0g8cVmSVQ6Ft+rLNkClS5ouVJ2EoOtAI9ScLO3WMDtWChPdTQxYGOkvpMMPM/PE7M
 74siepNTgVLQ+J111+Ie1Cbemx/dzLL0za45RslAzl3M+nhLqiL8eAeVcZgE4zproLTwPWM4yus
 7+cFs1FZvsYieM93CtE45vtr/UbP9bUejwawQunDaiV+aPsKWNenOq0ZLFzVRl4pR/rrzANLftG
 6X1zb0STKw18pWePlNA==
X-Proofpoint-ORIG-GUID: PHcFThGcbfITQkrnWoTn5eapb5YrS1mz
X-Authority-Analysis: v=2.4 cv=Pe/yRyhd c=1 sm=1 tr=0 ts=6992e036 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SNk_nCt-9yVKVlh-3MUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PHcFThGcbfITQkrnWoTn5eapb5YrS1mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160077

Simplify error path unlocking mutex with the guard.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
None
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 98a463e9774b..21be447374aa 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -699,16 +699,13 @@ static DEFINE_MUTEX(__qcuefi_lock);
 
 static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
 {
-	mutex_lock(&__qcuefi_lock);
+	guard(mutex)(&__qcuefi_lock);
 
-	if (qcuefi && __qcuefi) {
-		mutex_unlock(&__qcuefi_lock);
+	if (qcuefi && __qcuefi)
 		return -EEXIST;
-	}
 
 	__qcuefi = qcuefi;
 
-	mutex_unlock(&__qcuefi_lock);
 	return 0;
 }
 
-- 
2.51.0

