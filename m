Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6040D3A5E71
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 05:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787029839; cv=none; b=LTthTbMpvBvEw0j3iui9sqwpk1QUawog2SYTV5p4t+KhftzzK/SeAZabZNOhCnRtrOBu8bMB8+oeYx0mfB+Zg68pJ20eHR1qvJQhyxP80Y2YSiM2rt07AziihXu+RqufPZ3slAohZFJiN/AohD2zGAM2X8Mw9m3wCFG6SUdan4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787029839; c=relaxed/simple;
	bh=FeAbcPh2BNksaU1ol+KzsK0r4wOWdTJppcdaT2TRPqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSOGiS573mgBiqCzpkuAbDUQKsyEReqi80JRcB9umZtHvV0Ux9XfG2VP65NwrIa5PiRlHNLTyGNvDSr6ZM0CMbuAa10w0OGgjspeM5cNIkHc+3MGqUriTsmbXGcUuDaglZzu3t1zzsZgUnDsikeo2IrMrRXqOFP4A8zDgUu33y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeBhHxQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1UJLIFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeBhHxQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1UJLIFV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I4iN3u3566444
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 05:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=; b=KeBhHxQZWxpTR36D
	Psjvj/wq85jpkNoelRCr7GA7IQCCNbmQzbbatB7HF/+kMmEmIX47iSfKo78TrcSi
	zRz5ZSG449nqvSpSoNWzt68dQQgrrECiYvvocNwe0bQUC3g/OuRn/tEfNoxb24oC
	O9wbXTcyPL56yRHFNej8KVXdeaEMBbZEEIPNDfRrpfJcoG68OgijLhbpI6ejiKy9
	0/VB2vb/qCwEl8lPPqalgpvM78u5K5Sp+CNMHTxsKImtrqVSh44YqH9H+pABffO5
	hr6Tf/yxspMv8oPqYzuJdIWNp2SdtEDSQsiwbvkCPxvoGVfB+nOTF1tlZ9n7YP78
	D4B/iQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0sx7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 05:10:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8486c3411c8so5351801b3a.2
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 22:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787029836; x=1787634636; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=;
        b=L1UJLIFVi38VYseot5c96Nh7KQVr3yr/lADqzD6WsFh+YZ5m9sF7m33BCCG2xf8CF9
         XsZoIqKBDIHBJ2U9L6cB2HuK4YJQd/yp6mDTF9poBMmSEngoogW1lf4yBAEv9qZk++Q8
         eSxoEx4tyMdOLQn2/xI9oYbCk/XhUVs3So4MYoOsdCu/Af2NpRcUlM2BlIsfLZZ6Bzyx
         SyjKrzm626z4nHAEy0MPxev+po8iewnDudgBYKUdliP5HKJcI0eny7DPVr2Kw38Bqx02
         yfXYtDpA2qEs4FWNYiHWg2DS8f63gyWQ2ZY8atGXnD13dA+rIFPgr+SJvC5OIFwXONU5
         L84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029836; x=1787634636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rp3lIMjCbjVBjSLiXhtJRxpN1gXNwjBR1B2cE1UgyMk=;
        b=ZZ/RuT5EYM1oAlvOmoMH1twLOlElhjFof0Q1w5Jj8YoXgwPACnOpdn+OxJ5EbUfAij
         fOeYKh9pPTAaGe8MA0rHQ/jno8WaopEwHrpYGXYhq6Ke2tX/AVGJ+oPk1OVFiONUyawl
         vajGcbltHHINXoPbtydYQtypYNd9rPR+Ybbq3o577+quWK0Zmv9qddQfbrtAxRugP7nO
         86TUT+NtdFNfmkqr74Os9AiV/ESB/AvD42857fY9GwAcb2YTJqL73oRY03ATOhrQP/zK
         AIxlz8GR/IqYXWwHswiXJwax6t3xeTk2jNbK9E3A4yfh+KlWyMsXEiYsBEdfYyiGJo0Z
         B3Ig==
X-Forwarded-Encrypted: i=1; AHgh+Ro5LeSxET+TXkkeMmbnJj9eylk3AZxB3tkeXAHWpcur40p4oGcbLzMS+f5h3e/wYF+/4U/t@lists.linux.dev
X-Gm-Message-State: AOJu0YxqNPIPKor9196QC2CvThovEqOPUBBJ6McV9iSAWKht3ktf0Gwf
	Wq+WdvSXe8eS3uXhr8R6hv/Ucxc/8XosBuv7XZfTFod+3xKNEcIbhsKUYp6HspDdvmGhPDhNA7h
	cGCEcS5lk1Uy45acgvAQKI/OzP0gzGU6+oBI2Xr7HE968RVbSOb0Yor18
X-Gm-Gg: AR+sD120CJO6utrThL82I5Evxrnd3m6HS6jAG/C1oYgtw5KiW9f7yM7yJ020trUv+gC
	oEXCwhCl7Kl4PTDDn4WerdKuIvg3Sk6q5m9MSC31qWqJ5lgVbeEdX/wP38XbQCTwPydXaQW6jK3
	mzFu9edy2AAsljMTxyUh1XbQM+do/ERpqqi2VC2lUDF4PTFxp/FQlXI3xqWG4iJVpkImsX6rwPa
	k5OrYI/Q2dL+AVJNCIhU9hLearWdP21nNKnIma5F0JtjM9M1HkLJAJYHU8l9/X4T5QEXpvwdzgE
	3dsM+pvO5oVtp26iIjjmwQEAlgke8RJmmXtjwTTdXLe0ZEnJKImi+rI3wteAGpes5Wg7F4960mu
	6Ol/drmJoC/I0lrazCy6IwaZn7KSfDA==
X-Received: by 2002:a05:6a00:188b:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fddfe099cmr29499676b3a.13.1787029836096;
        Mon, 17 Aug 2026 22:10:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:188b:b0:845:e8b9:347 with SMTP id d2e1a72fcca58-84fddfe099cmr29499576b3a.13.1787029835654;
        Mon, 17 Aug 2026 22:10:35 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6ff2232sm1015652b3a.52.2026.08.17.22.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:10:35 -0700 (PDT)
Message-ID: <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:40:25 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
 <20260817134416.GA1415075@ziepe.ca>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260817134416.GA1415075@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfXzUOmz12s545b
 YtEuygPuRGAvcsWK0EwxjDMF0AeNo1/dBJq1m0HJsUePjRamOEZtSUqDxsy1MAKZWYFdY0f2PoW
 ymdP8jKar67jEJbHrlHGh9kMgls3bW0=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a83e94d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=UlZBYPnkdO8YS_jrOJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: IHsOthFhTumQeDLVfcZ0c8C9NOTRtlbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzNiBTYWx0ZWRfX6K2p9KiZcT1J
 +0dCwd4M+y1qvLDI5pUWWM11W7PMwyOK+cmcHAozYHs6tYQQGtIaA5KJd2ALhNFBUQGdbBov7xY
 5GLsyDOmojGD//08FGTOn65CkP5TXkrPUp6rbpdXBTl2Ku/9LHVJ0Pk4ZZ2tMDeMTdeZLPbKOz7
 niKHVBmdbP6Ds5sZ5pfA3BiEn0kv2kAswtgYR77TzHaRqdajraHyGe+1LcrpViL73qUtZ7TOz68
 SinXxCGOk7riP7ZHKweIpGBTFasVzz19ijKG//01cGfRnAyzmE3v0GjQXsXWWrGNxC+xFTXsvKI
 88N3lsTtwTn+ffmUckjxGF1tgLLTrMWJchu+V3/P9Fk2JcL0ZzmCSwgeF5j4eqy1Dzm7CU2XUaE
 ub5cRnA+SYDGSWZfWZUoqwbatPHq1DdpX0zcUotbszVoPGSiWb/8ScNIYUpaKc79AUi+FLM7u48
 aCTRADFSjm1xUAQxWfw==
X-Proofpoint-ORIG-GUID: IHsOthFhTumQeDLVfcZ0c8C9NOTRtlbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180036

On 17-08-2026 19:14, Jason Gunthorpe wrote:
> On Mon, Aug 17, 2026 at 10:17:40AM +0530, Ekansh Gupta wrote:
>> Register the QDA compute context bank bus (qda-compute-cb) with the
>> IOMMU subsystem by adding it to the iommu_buses[] array.
>>
>> The QDA driver creates synthetic devices on this bus to represent
>> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
>> so that the DSP memory manager can enforce per-session address space
>> isolation. Without this registration, the IOMMU subsystem does not
>> probe CB devices for IOMMU groups and of_dma_configure() in the bus
>> dma_configure callback has no IOMMU domain to attach to.
> 
> I didn't notice a clear explanation of the proposed DT schema for this
The context banks are described in DT as child nodes of the fastrpc
RPMsg endpoint with compatible "qcom,fastrpc-compute-cb" and a `reg`
property for the stream ID, this is the existing binding in
Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml. QDA reuses
this schema unchanged.
> 
> But it looks awfully similar to the other driver that was creating a
> kernel synthetic bus for actual real HW, that wasn't well liked.
> 
> What is this for? Why can't you have a normal DT binding for the
> iommu with normal devices?
The CB child nodes are not separate addressable hardware — they are SMMU
stream-ID assignments described as sub-resources of the parent DSP
interface. Using platform devices for them was explicitly rejected by
Greg KH [1] and subsequently using a generic shared bus in drivers/base/
was also rejected [2]. Greg's conclusion was that each driver needing
this pattern should have its own custom bus type.

That is exactly what QDA does: the qda-compute-cb bus is a per-driver
bus type with a dma_configure callback, following the same pattern as
the existing host1x_context_device_bus_type that has been in the
iommu_buses[] array since 2021. The bus creates devices synchronously in
probe, calls of_dma_configure() via its bus callback so the IOMMU
subsystem probes them normally, and tears them down on remove.

[1] https://lore.kernel.org/all/2025062434-reviving-grumble-1e53@gregkh/
[2] https://lore.kernel.org/all/2026042442-luxurious-antonym-f20c@gregkh/

//Ekansh>
> Jason

