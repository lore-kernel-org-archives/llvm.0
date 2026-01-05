Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF0339B3D
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615617; cv=none; b=bK/VjqIVyTg42nH7A6JoND0Mt9JdOv4HNs4/SetyDzAy2Okc8zr7I1ZC/PDwDUExOhARqD9XnAeg9pbHS4MR5l1/Oudu3bTEZFMFmzKfwu0wIZ+POV7wxGNa7v6VCViLPVEGeYfs10stR36sRA8kEesBot4C7J0EFtz2wq957TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615617; c=relaxed/simple;
	bh=4jOeG2CBahkA9uGMPQpbdq3BO1OwJNjMXBCeURlKH44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y/Rey5l3HMYe98FSMhMFe5y9qGPbgbYeVpRtVDEeloZlq151ZK3g+gph2skTFTFUjjfrae3WSetfedMJoio7BaE/aoyGR64EngO7hfWnPKBqZit+yILEAHSbg2arGazwU6vIR0UB5p5E1/aFT6kcjn1eCZlhMu7XTcxTqx00IXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3UKGm+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ne8+kTvg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3UKGm+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ne8+kTvg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KLPk3735858
	for <llvm@lists.linux.dev>; Mon, 5 Jan 2026 12:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5O9DEEahiOq
	8f7DGaL9FU/XtJLyxLnrUuw3a/wq1pAM=; b=B3UKGm+4JyuBQJphvYW/e3Yj8m9
	Nr8VMQSXIn02IEOkvSJFprhdOorIorjRcUVbxHphfzaTC//cvjhlChlFaHACh5k6
	PiS6vah+Y9jlh3iy+mOfa+UhSBURIjt3RgvOHfTDVl3h43XB7JSbS5Exys90GWrx
	yqG/SDYzTil0WIENYzIkskpCh1msvLTWlpbtpAej7+F0uI1jHPUdsjRtgWPolA/q
	VNfM57+CAHRzYZsHAj1Hh7ssZMdDBUMQzdZ9wZ0Z6GIUE0slKnTRuibQOAy2LAZH
	MZRX/84Sq0Nj/zim0eQAngNNH6k2CTAbPiLBpbXy4kWr1ZuC2cr/f2bn2Kw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvmbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 12:20:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso479480111cf.3
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 04:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767615614; x=1768220414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5O9DEEahiOq8f7DGaL9FU/XtJLyxLnrUuw3a/wq1pAM=;
        b=Ne8+kTvg0FGwr9bev+Bo+cwZxvflmleTk6g/dHsdQDQUYdS5kwSdipcsUml6DXHUq4
         ozw0J3mGOBRx7wTyCiklX4gaZso0WFT1+Ma6L7VO1R3k5osCWlzGNwoPHkdXhKcA8D6X
         GuaWf/EBcBtJJVFEMCrWf/YZLaNk5i30eQJ8YqK/iq041xp2qwiyGpXCWUMQzJx3kl//
         pX6q11IQaDE7M2Uq3/e7wb6Ryr8WAJctrBZfWIpmwGJLTowkdskUmFyxRPvnK/PFSEZi
         k0zPNbo1SdIGlpUTED4mwXzy9RGYj5q0Biwk3hxAdae4qiCjuPNzhw1YBRBxNbkBHisI
         KWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615614; x=1768220414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5O9DEEahiOq8f7DGaL9FU/XtJLyxLnrUuw3a/wq1pAM=;
        b=dVksf35yU/k8XIeglikNDK9PWucJeAxbuNJVUBp2rzFhopOM6vWKl8FKEZQAqAFfGI
         UHFNWTNnRnrUYt/ZCWoHkG3smywaiT9xz1HG0kNL85kDgTPeJeVAbmK0ATWfA1mPYz57
         9ENpDN3kRsukj2PTRGML/tsR3ykVOxomPBv84EZ1dJ7o+f+uWTHfJKEfqaEwNyqIi4Zg
         AWnWqNUJ1OxoidpUkQWMAaDTu2ScwgWttt0K75zMYl502gdqjfQTzSL8Q/FoM8S60i64
         x/2kLhvhCnozs+1NAcNucq/UCJlkaxT9wT/KSpDJREsfIWinJKXGNBxGy6rsBAxVQQrm
         vGoA==
X-Forwarded-Encrypted: i=1; AJvYcCX66Z2FHUOj1r5dXsUbpv/8eWjG4Aj+lKb4cIsdOQF2GvBQbo46FxWfgkE9bFHHqkpcsYUT@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4kCq8wVk2dKvVRQcokxL43ZRAtmK1oB+xRu/QK7dZ/+PQyMCB
	vRzJiUJQryRMgnplU/1JQJwjPAQo762eytrBmTfWExvlNi27n6gQwH/sy3DPvP0h5AGz55qZv+W
	d/2dLmftWIBFVgk0JvcrXxD4bc8jmiIX3aTO0Wt02SAsvAubizrlz2/a/
X-Gm-Gg: AY/fxX4h20XaEBTPSo10pj/JG5bnkK0WFY6crD58Ns6f9mbweWkOn2vM8DzHGsW8t1a
	/us9smlDzVVR9gV/uIpS+V2GmUbKGjG4m8U93d4WdZDAc422jTJ2rPyJnldP3ot67QWaJL9Pl7f
	tbqHx+4YtxkL3Om1pn7vvsp6iwan6LFsxda7Qz0jjkSbJR/Dc8n/PxECsSLaOuav0HKsVj792OA
	8T0Ak6Muh5lt/hkD/vf+oEAHC6sCSzAEE1VCkV+laCmvbsYjIHkRKok+aGWPmjZeCoL1x0nDyjq
	VUxCELBdWY+Jbf6X+Iac3d6GxXqPTFFUUAbbERCCW4ZwaDEhpED2er/i58eTgu8ZuNMXFSRlwDX
	+YCby7TB6BOQtNeYfKWq/+qcZSg==
X-Received: by 2002:a05:622a:2b46:b0:4d0:ac40:fab8 with SMTP id d75a77b69052e-4f4abcb609amr716070981cf.7.1767615613544;
        Mon, 05 Jan 2026 04:20:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVqMkvkbOQOtX9mucHXNqT1EemGMuXyPNH4gZ+0U3NyW4QmVX2YkF/y6kPMfBTJNdislg0Tg==
X-Received: by 2002:a05:622a:2b46:b0:4d0:ac40:fab8 with SMTP id d75a77b69052e-4f4abcb609amr716070711cf.7.1767615613017;
        Mon, 05 Jan 2026 04:20:13 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm95467266f8f.2.2026.01.05.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:20:11 -0800 (PST)
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
Subject: [PATCH 2/2] powerpc/pasemi: Drop redundant res assignment
Date: Mon,  5 Jan 2026 13:20:07 +0100
Message-ID: <20260105122005.130449-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105122005.130449-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105122005.130449-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4jOeG2CBahkA9uGMPQpbdq3BO1OwJNjMXBCeURlKH44=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW6x2lMjcKPfqEAEnOwzj/mmHTcff8BVcGS2wv
 /eZBFcvoSqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVusdgAKCRDBN2bmhouD
 10eOEACK2dHfvV/c+dLmn813THxz+/INoXY+FFUiowbT/HbKqi3I+SoJfP1jV5Khditw2VIpdtZ
 BPsqD5IjzRypv5B6shENgQdWGOhkKfkd7DVuxtBKntr2esrTO8b94lO9A56DFlhIDtxXJrlAXiD
 bUxZRUeokfScn8XxNLyl5yayn+oZMXhEIAtVRZ4kHruQ/E1aVT0+BxuH5v39lnCfyPiK6YGhvWH
 aLxmRV39P+jvA39JQcM/44ZUNzvZD/ind99FtRAzquTSguzUfZm6crFQvVX87Jbor97tw/cNPKD
 j1NrMu/uYA65wUR/5kBLlvN/1nfCgQp+Cq8KGI/lglFeBUgvSd7s8xWeM91nFFo/ankBIMz6gdZ
 8dPFehYPglo81t08pGF1R5mmuUr5N9PqGixIGDPYm6mNPd3uXBSRzbH1+bqt4qVrj1yNlWGYy19
 rhT3uCr9/r/7x0RTdtWRBvpvSD+sRVpKOgTHJs/mSOC7B3O4RjOioXbpOcyNy9rQ8+74rB+DuWg
 DGpIHHD6uCqWLgiGlTYHQDj5V++09egONoAj6u/uhRsGanHypjUVB1RCNfQxBth3ndxQ2XzAcvB
 0WEEYbehNYGuz20wy4AiKtevK29lqylGZ+vqw6ky4sLGt+IqjCylbQ0DaGrVvd8qjPVD0RwQvUA Zorfdjy0CaEvWjQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oebkj_X8iqjeLULCZ6xU6oAt3T6osjLu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOCBTYWx0ZWRfXx3r9jzRVOUGp
 eFFmgaOaMFpSN8GgfSwg9hOakveahVk/Ncl5CXuOzABPnYthahiH0HJmV589Fco104zdWYYlCuq
 pJgUeXZPX4/dY+Q8ild+w+aA8s9vQuQePlpNiiGdr11gW06qT+u5+RbHH2kVBu9G6/7pqz75Pz0
 X06ELHMXZ31ADLl4w/03K9eHtgd3SaQmWGhe++MFfkEPke/zvEytC2LdvKgWq+FzDZBjpgR310N
 e4b94tMLFMJqza825aZ4klAZ8Q7FPW810F3o1zDwOOUTd2J+vDaF0NvOJ366esWMlOM7Tf1TMDy
 3gtm02Tp259BUV4bQhoLgD4yDjRGP8tgCQG6wEMyCUCaKzy2rVEYwalwEH5Sg0yiFJjAkLt9dNI
 9AYzBu0UuI2miBuuMnbvohH7t6WnTTnAdoI/4oPzYlpTjhLC/JEJzJQCeHN3RLuE2Njzx261To4
 oFY9QRJhlLNITS71KHw==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bac7e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1PZ5zuzDT7_94hxZgQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: oebkj_X8iqjeLULCZ6xU6oAt3T6osjLu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050108

Return value of pas_add_bridge() is not used, so code can be simplified
to fix W=1 clang warnings:

  arch/powerpc/platforms/pasemi/pci.c:275:6: error: variable 'res' set but not used [-Werror,-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
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

