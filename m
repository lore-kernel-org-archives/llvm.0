Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C62306480
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 01:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958427; cv=none; b=alPxKof3gsxKR/zdmRjkvjSbgx4DWuWIHU60zG567Sy5m768MDVecqi8mi0qIa774rlBQWmtINZwYuchgeHXsfPNuatcz5fLgEd2MVCoeIZaP+dWaEv18yGNuRC4epICijr5SxV8FvaMWQJUeRPP798L9qbFjCVr5lDGkA4zrao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958427; c=relaxed/simple;
	bh=yyFHdN2gpeMVaZ0MZNtfhX4nPoKWXRKlkTFArxKR9Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eO2AkJtHAbICNJ4sENG6IsgYCDD6ORozotE8KyZM/c5OAu5x85C6UoaoZVmMm8+ZfbMEdA9pbqs6qxDojwCnwkEXO4t/seLjAWZXxAb9BhoSrngmg6lTZQZcttlKcs0Ag8ddTGGTaH3TNf5pM39dCMuSuivg7TzU5neh72bwt4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjhQVJon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRYL2VVb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjhQVJon";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRYL2VVb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHrORI2828139
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 01:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=; b=JjhQVJonIPs7teeB
	ksba57MU7kAC7XFnHE9s6f8gtNHJIOMBivHGAhk4VAEqtFPY3DQF4lTvGnL2e4Ec
	/14EPROD5LweJovoDRwNc+q+RxVlTV65u6bxWxoPn8ZWktwvidpfxWXlkJV8J1po
	U2A6H6lI+HTE5i41B8w1GVXXcGUFkQA5S6asXwHE4D+vmy7Gth+Hi/trxOEY4Pu3
	7UpRKznhwprap3xyWLv5zIa8q2dV8hv+YbwNS3YO2mukxrqM3WHOLoPGYyJU9j1e
	S7Je3YUF/0UegLjdXUWFUGDqfFgdXD/jh8Gnh6GI75TQ1ZkElWrG8C/aaOvCG9st
	sF86dQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btegk9d0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 01:20:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5311864d9so243394985a.2
        for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 17:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768958424; x=1769563224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=;
        b=YRYL2VVbv/hJUHn9FjFTv1bSy9mD/a00rDGzAkiGhRC0Fw26VuHwyq4smgCFQ78CWL
         QahK3NtzpIj6S8bvqI5alVFqi4Kdf53NFwVdgrwmyWbA3/PSLSUZBHKrOxVxLuTZR5yF
         Ieg0afrrA269gxJOFcCeaxWo91ez8fEXSfXjKoG8iq4ekqJ6qKcY5fo1xXbVbkXIlBxc
         9nBFKFigpsdXepOlUcVusutH5Z/t8TvkAXSjQnjKohdIbKznV1gqKs2Bp8G5jkm8dLoJ
         qWflF3bq2NQ/civDbnpQROeVHKuWrS53+MX69naU8d+kK4HK+qPj4K/s6PFAvL0T1dmU
         LB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768958424; x=1769563224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=31X3HJXmE+ewsNzBKQHcu2ys5oB4OdT178S5VcUsReU=;
        b=XWK5c8hl6JmSqZzU5K2rXkuipibAOOuNk+wNuqF4nbNz0YuJ4PC0c9LC0A+5ueCaRz
         k6DKrD54kgu6EkqLTGwSC1I2wgMpCWx2GmvEiUIbLYQiXyE5gD/Tw0iaJWSrCw4wwBfU
         C/SZRYpFWcZrPlEWnaQbOAdjX5qR0doGtOowlkDVy7VdtKGpUNEqcjtj6P6mhqxI9+xa
         stDeCmhgoi0RXXIV9bKwNHqf2c98KTLLY+eDFA+SwiwkZzI+bDVanLamqQMzCpEfNQpK
         uIMq4dU7twDayrh4KtVMPTA3H6Q05KBSzt+k8sPa/ZipaxEzPQh6FjsMTcvWT1t3Hcxo
         CZWg==
X-Forwarded-Encrypted: i=1; AJvYcCXqzphJRG7zpKxqC4ThNhE8CkLUi3OdEnyqvKZia6G8M/SnrpSdLbdLF23jeK14aApgGzsZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyCdyjOfq65FvB3JUa6HHcvpufAbd5pmjesbpNDEirw5Scl4yAy
	4YxMoxOJGv8WDcR1K6cv9RzSyu0Sfg0cx9U2QAZsVk2/Ecd/V8zO/7HPJ18kNm4Sc8c68f/ZLNr
	bOajsGaiK1dqL8DOZcNbnjnBHATy3z1eHan8u8/7HRskTIJyFp7nb+9nK
X-Gm-Gg: AZuq6aKpMCUO1X5scrWgv6z5NdlWHgi2iT8uS1iXOBU5w94ZPnQdLOBmmanI7qtWknC
	2/bw2JaMrfO5QbeFUSkTl2FeXbTeou3FmWnUSh48sHMlAbSdE6wgj6Gri7BTRylVkXog73/MPCE
	BNVogD9KCeiC1dgLoEMjdq6w5Brdu2dx+JggRpDSVk1Sk6rW4wt1IWlm/LXpra7TK6NPwU5tO/l
	GWHHcv+bzp1GBs65vhleS/Cz86AyaCQN+xr1gJVOjsgucFHZnNTMBDg21HePM+8rTlYeMrCJ4f2
	mtFliNljjuNR/KmvOj1dfsihbSbsQ6UGH8GEkCB9ASsNUWl+tnRJ+TUulmehlyzdQA/OU0BIFNL
	tFAHQm2V7X9Pe8dJ6WwjJILKhaM9chzjjkGXN+Od9mlWsY3zqYrUO2XkXCjAK54ktiYu3WVZ0tx
	E/O4tnwS3/K91U5AuGO1ZPcQg=
X-Received: by 2002:a05:620a:1a10:b0:8b2:ec00:784f with SMTP id af79cd13be357-8c6cce503bcmr456076085a.82.1768958424136;
        Tue, 20 Jan 2026 17:20:24 -0800 (PST)
X-Received: by 2002:a05:620a:1a10:b0:8b2:ec00:784f with SMTP id af79cd13be357-8c6cce503bcmr456073085a.82.1768958423695;
        Tue, 20 Jan 2026 17:20:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 17:20:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
Date: Wed, 21 Jan 2026 03:20:20 +0200
Message-ID: <176895840437.3580355.3757750367730207447.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
References: <20260113-drm-msm-dp_ctrl-avoid-zero-div-v2-1-f1aa67bf6e8e@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sp_5Nwvd6WnszLHjpSl77To6ns2kpfOa
X-Authority-Analysis: v=2.4 cv=X9lf6WTe c=1 sm=1 tr=0 ts=697029d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=OVJ8HEpvijlIqhD3_UYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: sp_5Nwvd6WnszLHjpSl77To6ns2kpfOa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfX+EQulojzWonI
 pDNegYWd4d6vyvw8/y2u8fFXqHMtJSTR0ZsNIzz6/HrW69aeVyCYYs0kEg05DNLEBbORxDjyt8n
 Jok43zJhyEGFpdBTut6ay2IQTVHeORwM4ZVYrCKRudu+F86VBGGSs9tOo028wTgB2dRSSyD1uL9
 ch0NVWpIHDNcRhV6kZr1xXlm5TgVhJD6lGkAeSz7A+Kl3oyh8wBhd49HdOGpWWEBQiuGtzAjpqM
 c0kwkxN7XDc07nNK2Z6CRHu5CPW7tARbhpd/RW5SM45DmX/LawUrtLRh8jgtGoY2eU84RZ46253
 FwHm/y9M7YXsjnd+34ORXFYFBwzPxskvEcufq3hzN377azybgJRru/mA7e72HyHS/54v2qZ2oLM
 Gs2XOwsLKA5dZ7aHlRVs/1d4pngWPbHYOLO9zQVv8GswMEUDeXilXPLdZjQy8R8D4LbgLtu2zwA
 E5n3DlCzpj+gRfIzH0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210009

On Tue, 13 Jan 2026 17:00:31 -0700, Nathan Chancellor wrote:
> An (admittedly problematic) optimization change in LLVM 20 [1] turns
> known division by zero into the equivalent of __builtin_unreachable(),
> which invokes undefined behavior if it is encountered in a control flow
> graph, destroying code generation. When compile testing for x86_64,
> objtool flags an instance of this optimization triggering in
> msm_dp_ctrl_config_msa(), inlined into msm_dp_ctrl_on_stream():
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f185076da44c

Best regards,
-- 
With best wishes
Dmitry


