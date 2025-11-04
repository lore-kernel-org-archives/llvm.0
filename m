Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CEA2D9EE3
	for <llvm@lists.linux.dev>; Tue,  4 Nov 2025 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253844; cv=none; b=IiW89veU1hNa8Y7SL/fP+4ONzT40r4HVJobWutNK4jA6kWv9psm5F8wn5bO09p0vP+Z7nDxI/4mhEEQU8cEmBiLs/nrZA86XrDtTmNUAD/CrNjkFK8uFiZueeDzZnvI7As3Pb7s0Mij2kXDORxLuuINSKCJ+0lnge2xL5vLcAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253844; c=relaxed/simple;
	bh=xD40Qn7ySb+G4ifOmdQ3plBa87zSBnrJ9YWsryZpG9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW6au6eoiRNKBdsdiPsgf7kgloeV+e3Ur9U2DKaoDYSAz6GpDPwRqIL06kzFXJq4fTCzC+4ilODFtnoHhSafwhpLobDf5BLNbqA8YDMYtuw3rMnDMfLQyICZu4MKWDchbHjGRw5AMX8vIA+ibD2geShYMSiGDSyqlEYzAM2ii5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eef/FjtS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkouxXb+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eef/FjtS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkouxXb+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A48gT5l1419463
	for <llvm@lists.linux.dev>; Tue, 4 Nov 2025 10:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17iSZ0rQq9YOzSnIopSJVXFyQroZzaAj5ZsSQQp9i8A=; b=Eef/FjtSWHTDe0pl
	nB9UI/jxuKZvowzXTbsRmCAI07UniPq/9bJ2pFTZDTGO6wc0Xqb7mAk7FxQP4HfU
	RffICIUjQ6IkcOX9PsakdnXepvGebd1VQa1PXawQt9Ii5eOpB0f94Qju87IZBpzU
	+B3dEy+jqRrUpsJ1RPtLVwPrCyoYKXYWYah9Z6YJNrzy7FiBxrAu4tL+E4/w3Kwh
	9iXqhsXxY7xESbNpGA/t3b0Y65ESGDIFbWPJ7YBVvwYbzWfNI7gNrTGj7MnPBKJ/
	kjCq0KEsA10Dw+kyzkNCG7BgjdH/YHXD+ymBYE87Uah9WvqDTw0iWCM5NVtshkwZ
	+xbyiQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70fhtp5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 04 Nov 2025 10:57:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a264d65dbeso4637995b3a.0
        for <llvm@lists.linux.dev>; Tue, 04 Nov 2025 02:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762253841; x=1762858641; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17iSZ0rQq9YOzSnIopSJVXFyQroZzaAj5ZsSQQp9i8A=;
        b=HkouxXb+hraiirgB9jHRIWj9tj9hZBSuYw5HCp379hYIAouieo6V5SA0xeY8k/lJiO
         WLTjB9QOSoS0ZDRy0Kpcjbd9dsrIro3fLPqaWAA1p2qkvPqwC/xbxdsi2ieVIBxMDgg6
         OceKdu/f8vZv/AEofVthpOQI8y/KHMyaZs8if5RxDUYA1WJ1RYtOMT+vsPZR+2Q9uTH2
         lFyx5C71fhV7380oF9zk4uC5TNIhUlp+64HbF/9DSK54T8l8Mjj4yfK0yNxvSsGOOY/c
         Becor5Th4zl3J6U8liCijvrxkXPBKqb0FhcygQi2nkpWSSmomDk13B6BI7vJZCsjtGxs
         kYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253841; x=1762858641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17iSZ0rQq9YOzSnIopSJVXFyQroZzaAj5ZsSQQp9i8A=;
        b=mkhm5RkDaFUQDaFeaj55/fpAnLCrfnAewCP5j8+eP84ifYqmBg808rgK38OgYjWqtL
         U/BMlOroBfCLy2yAKks/nWq9/Gv0iKWWkuYQ3vrcFNCFecbqTOqoWJMt3t7krIx6rV4l
         +jIgeLBvo1hVqvryus/WHvK5KiU6jRobOexTR79bvpM7+6DMfoBhBGoxFIECVxRQfWYc
         84ONQAmsRitK+ehSVtHxRsLSukEMmo3nyoHiXVmWZQaEjp49m9GqHbBmZdqFd1F7iLtl
         l8Al1TC7nmN0Atnw1Jus5I4UAYSUvU+sx8D5v6Cx8d3g1z6DvGnr89QWurH4JsZJEH1T
         xe8Q==
X-Gm-Message-State: AOJu0Ywu7a1a6sOtgeGydUs7EPxD4SzlNjhhRy3vsSE9X+iIZxdRICXz
	7vE8EYalB4s1dhdwNF6q88sDAMJikSxer2LiKfAZGfFmOsgTtCUN6yNofPLIWHcKWcUo1+tcO5F
	loJM7BWQQEiVGBnZVMJIwr5VUe5kVtuEU84nrtS6Ld/60ZcAgZ25cHW7CDTXmGklR
X-Gm-Gg: ASbGncu22Yw53bbEklsT+zTZPV7jDw81pm6Hr4K/oscSfM1u59vdSNFB9o5xEvvUeTZ
	6Auxj9Xn1/pMIcXbDpA/fRJq0JzXFracvcGqyAL6J0/7FMPWR74PN/TyMxqH/KWr/03T37AC48F
	kA6sacOKJYbb5KQpIBz3ooSUsc9AybiwHwsD22nA0UEtYFYS6Cy66Dok4VdrOpM3Bw355FcyIw/
	uEYHkDBZqfYep3aksQtXgVWfBH9IxgrHGaDtOxMOwoofI7DiZHa9wPNOmio1v9yEFwhYEV2VROR
	Zs7QtSVOnYwGhFL9C2ElY+AOs46ul+Vuc4ULo5oY/Qw0QDYeGuaIgSL1KiYw+MyZhKPchQM8fsR
	tWKx4KqC7AszS9wq4+N+8nJaGJfs=
X-Received: by 2002:a05:6a00:28cb:b0:7aa:4b8:179 with SMTP id d2e1a72fcca58-7aa04b80436mr8377820b3a.1.1762253841088;
        Tue, 04 Nov 2025 02:57:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHeauPRKvSaQfwjZoWhPXPVkD5UEZgsLll5lxQv70Owt2nEGVc1ASjz7ivNXbz+Pbfiny4nw==
X-Received: by 2002:a05:6a00:28cb:b0:7aa:4b8:179 with SMTP id d2e1a72fcca58-7aa04b80436mr8377780b3a.1.1762253840541;
        Tue, 04 Nov 2025 02:57:20 -0800 (PST)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd382ad96sm2563399b3a.22.2025.11.04.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 02:57:20 -0800 (PST)
Message-ID: <2dd128f2-d41f-4eda-a393-260098749a07@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 16:27:12 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] of: add infra to parse iommu-map per IOMMU cell count
To: kernel test robot <lkp@intel.com>, robin.murphy@arm.com, will@kernel.org,
        joro@8bytes.org, robh@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        bod@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        saravanak@google.com, prakash.gupta@oss.qualcomm.com,
        vikash.garodia@oss.qualcomm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <74d4ddf90c0fb485fda1feec5116dc38e5fd23cf.1762235099.git.charan.kalla@oss.qualcomm.com>
 <202511041853.IxYgvWlc-lkp@intel.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <202511041853.IxYgvWlc-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA5MCBTYWx0ZWRfX8cK9FZ+iSqfO
 lP3L8sd+stqc4WQRgsAF8v743RS/TBn4RVXr7uiRJhf9wkGfdUX4aXr3uRCWdsgtL1YiKL/R5Bi
 b9MCAH3DhfqBscVX5UHkMYTeNv/6FRBsYcc0tnY6U7v2TZHPIOdkkY/JcyOGTyjk7KJFUWsz4yC
 kweg1n0SkTlI+t0p1/c1Y4V9dad4rsuyIL5WrG/6Th9wm8rASLvtNEevPWQwJN3uBolGK2JLdDn
 xHIZYJQEq5OfyCBMI7WIGl2lrH12JSxzL+RmnYrvkIyxcJ2cH9w7tL6j5URTz8sAGAh/bPdi7a5
 07I1KX5TAr/0t1hil31RVfukpPMlolIdFpfIF2U2i2M2AlTOetdT5onT16EgqNNoOLgn4zpZiip
 S7Y6NRXJ3B5CTdP3381I3kC0IIQWUA==
X-Proofpoint-ORIG-GUID: DgtICSJiF8OVm4BjybAM2nYBVUHc4qr8
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=6909dc11 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yE59AjuNBYSqEwnZTzMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: DgtICSJiF8OVm4BjybAM2nYBVUHc4qr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040090



On 11/4/2025 4:16 PM, kernel test robot wrote:
>>> drivers/of/base.c:2127:6: warning: variable 'legacy_iommu_cells' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>     2127 |         if (map_len % 4 != 0)
>          |             ^~~~~~~~~~~~~~~~
>    drivers/of/base.c:2130:9: note: uninitialized use occurs here
>     2130 |         return legacy_iommu_cells ? : of_iommu_map_id_actual_cell_count(map, map_len, cells);
>          |                ^~~~~~~~~~~~~~~~~~
>    drivers/of/base.c:2127:2: note: remove the 'if' if its condition is always true
>     2127 |         if (map_len % 4 != 0)
>          |         ^~~~~~~~~~~~~~~~~~~~~
>     2128 |                 legacy_iommu_cells = of_iommu_map_id_legacy_cell_count(map, map_len);
>    drivers/of/base.c:2125:24: note: initialize the variable 'legacy_iommu_cells' to silence this warning
>     2125 |         u32 legacy_iommu_cells;
>          |                               ^
>          |                                = 0
>    1 warning generated.
Will wait for additional comments and take care of this in the next spin.
