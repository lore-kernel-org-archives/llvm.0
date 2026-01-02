Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8123B30DD21
	for <llvm@lists.linux.dev>; Fri,  2 Jan 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362406; cv=none; b=NoOGfSS2dsYwvc2jDomc9Xko7gGntnDQedFDc4Ics6hopGP79O8YwYynCLDzS2mGpCftfD9eyD03syqmRiIgbrgZ/K8IwQDpJMzVDfdji687De6DiA34D632aVA2QPEBh2e10X9VxTxBaZFl+e/SEOj9CN7wrJ2MgRRreKHxa7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362406; c=relaxed/simple;
	bh=ELgVrFfch8jx4zNgF23g7jzrBonp6d6Eq/cHi+wq2/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=boZcPYXMDqo++MSOOLb0VLUBcQgSxo7OpqBc6uLv1IbyKSJPzwZZZP2po3WFAk/xuG6XpGd2aRaxP2sZVMchmGAiMA5312dMxLl9wLXhtMpZ8hkMNd/qbffHY4VjqvU5IQ+FaU0CqmoilLlIrRnCYbYiOTjb279JJ3OP1BBlgIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQZjxdWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UcmyN94P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQZjxdWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UcmyN94P"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WEuJ207467
	for <llvm@lists.linux.dev>; Fri, 2 Jan 2026 14:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=; b=pQZjxdWu146rz+Ln
	wuEZ+TCxIwl//TICA4OB9Agfc5KjyaBO4Drs1tF7fJmgmnyyDzye7dgTtPIC9rdq
	1QFZfBeidguqVdKffIcb4wcbfUl/ztF5N/+2FqpRLQEsl7wuEe+WbOdEl4M9CXpH
	UDffpQNRqkEPUmPofSE2jY8U9uBNNCshP1x1f+NYdNA3BaiMyGxfXkFN5/AYqxCH
	OUOCEtymcAH8Tgz/KFq3oKiTJL3zw40Fx1v558dDqRFOMKhyvwuX5DqbPPaPJxOp
	h7mAodYiwpP25mTBVszDgmZ2Dgx/8lcmz1qP7lsHhiGlA/jYHwyjsWfjy1DVsW72
	XnJAaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74cmcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 14:00:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee05927208so55356431cf.1
        for <llvm@lists.linux.dev>; Fri, 02 Jan 2026 06:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362402; x=1767967202; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=;
        b=UcmyN94PUN/0laNcwcDdyRMWmtZo+34E2aCU2vUOw6JlBKpCygKsEwr3atXTammFkb
         CIfxiwnMq1kinyXbjcE4HMowH6lZycrJa75NiZBT3i9d9HQUoTi/DHtSRSpIAUz/msCG
         XdydiPOgfXDML+EZS429mBXnfdzWzQxc5In2g5ahyTVexLf+B4s6slbKrf5xhMu2/TKV
         IfFLQqUzZOtli3Osi8AlZTSbfIjD+MJXZTUpOpFYLKzngALNUCbro514qS2a8qmpouah
         KY9UUstZzrn2a9U6dyVSDYYpgRyFj7NWY01xz11LC4Fe6b+SgzzMRqYsVGxIWYcFVdLy
         lyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362402; x=1767967202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=;
        b=cCA9BHUBuCJtCOhUx476tpan9nKv1SBi6Xh/JgmMU9Jw44qeHizzzCS+t0BHYAtM2H
         HLIOS52kxov3UCaOKPkjpZ98mw9H30jFLEwYGt/wOv+8/F2u8WMBrvnbmJBCEc/OBPgx
         XAqMPxNYjNVirL3V9m9Y2tRHW24oO8xTyg6nqysT0DLH/7qmfG42qRXtCs+aPWuh19sx
         nr3jjMdLYMDJVdsbjHcsF2NlNMOvKPbnvGFyAwxFvD4TWXILTnP6JUAH1I1cffsmNa9a
         f5sSJbA+ngl/O9vVpBpEj1lgv1yMSf2EHnmcH68ag0ULuC3HZ+ciB6UeBS4g0DZKuaft
         0ocA==
X-Forwarded-Encrypted: i=1; AJvYcCV069DJrMZdvSKUE1Mwekph0nemTtiMuMnZA4J4cT+44XwERBGxOMjP8ITr69Wl34MXKO04@lists.linux.dev
X-Gm-Message-State: AOJu0YwqSJpSYZlAq0Ud84gYvo+jH31taaokcHSY2MS4x+Pk+mMDMhZP
	sbNWOn1vVhUxGryQbX7wcn5meApbiHZ5UsmWj6AH6eaha0cxKygY50yLliry0+4y+ONph/vXgpW
	yEt3DQz1iIuHu0jRm42FacBseE84REYcSxy2FKqRH7sly0hZ6SrwC5ZuU
X-Gm-Gg: AY/fxX5ucgYFUG56ZrKbxFeR/MwPBg4b3YIDHITfhIfCfMwdJqymsEuPnj0lJrD7W3z
	RlzN1WQp8p5QIdp5EiugY187GnSEiBda9Tb4dma6VNZPW5FVwfK6yM9WEepyIa6I5xyW5KKCRRl
	VqIAN+uHGZEfbot4WjTF+7xz4xMqpaYjx9vcJfuDKwc6Of092JDwXUR8fMZ8D17+yB4hlkHCuYy
	gU8NF9G7uPPljjDooo0jQqtmDUnmByTIJhbgijoXfDRcb9pyPJtDQoio5xBsq4C+4eZHwVitayF
	jmUXt7H6r2g/Br7XrkAArqMx7tuKwMLTHUv2PBxsscM/qzNDKMlVxvCf7N5cT8gHxf55aR6mT+2
	N814xGs3g/rkCIRCI4NHWvZYWUPEU7KW1I0ukvmX5SFaizRdKV6jNe3aBG/SNJSJQpg==
X-Received: by 2002:ac8:598f:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4f4abd7613dmr434910471cf.7.1767362402395;
        Fri, 02 Jan 2026 06:00:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBkOKZSWRFsB6BJFVbH93340vfDP9YfJ3KoJRojpfsiJwEKriedd/ViwC+9G4nwS5XjYG7SQ==
X-Received: by 2002:ac8:598f:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4f4abd7613dmr434910091cf.7.1767362401838;
        Fri, 02 Jan 2026 06:00:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm43735803a12.8.2026.01.02.05.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:00:01 -0800 (PST)
Message-ID: <22121c9e-1cb6-4948-93d3-6e9f9d7922b8@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 14:59:57 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil
 <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YzEiss9j5QNBbM7W5aQb8XcxmUW4Qgag
X-Proofpoint-GUID: YzEiss9j5QNBbM7W5aQb8XcxmUW4Qgag
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957cf63 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyMiBTYWx0ZWRfX5Ob6HQs3S6zZ
 QRKFE3GtH4ybCXyKHRx1E/CPiEOEjeeawPAUDWPDZ+OFTOZEdGKvKT1XsLR3WT3OPjyJcC3Vpdc
 ImUpxXSgVTQ09Hyaq9C+ABYFb0OsxaDHhVoUTjjkuZnX95db9gF07lPJFI8oDzRQ9c6NSNMfkQB
 v44oviul20cKhi7dd7LkAFV7/BjJkosHK8GWtyo1icAZ25u444LBZZlYHBZTtLOHk+PADHzwfJV
 ZIXvdX1GcfnlAEWN+SrZxsgMqqXLVHUNwzCdQkzBqdtfCzFJznzC/U8ngyVU1JRw5a4pye+o3+H
 ffZkZpXj7u1+w8btK/4pOzBsiuUGgQEXKfuvfWOBObLpF7BNpwOceeq/IDP67Uzq3WCGKX9Fu3s
 kMxdw/Li94drOvbpEWhgYeS5Bp1B15vpakxzUOeGoYBiWgFl40VqMSjOHwG9fe/Smk48Ufvo2/4
 yXDyFgwuE8I+hX68G4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020122

On 1/2/26 1:49 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
