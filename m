Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659B7277C88
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751929; cv=none; b=OzZt8+2gpJZmx4HJ79uqYMt/g+yLqketpa1QvxQBUBVRiFGeODdfJlMs1bIZOF2qNdFGpEO4oytYQRBlVGnoAoNmCUmk8K7/GwqHzTVN7p/3LGSiRRnzcI9/EFjmILkD1hU4/OtF04Ha187AUH40QP6jfWvHP0BL6/L+UyletKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751929; c=relaxed/simple;
	bh=b3TbOLaOaVdbEoxxuz1CQtZAQmDctOUjkFHF9gAxpXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+w6MqsFDebDxilUUJXbJijv2az8xnntYV5grBEiASEiTm7gXbKd8eD1VmS62hp2p0no0QD8TrTH6CgFlCOJ4UbXbtxjfXwm8cFxk8pcZWGiPffPerAN3sR4QYxefiPd8HiuHvz0hoZDeSaWSswhKff1D+kj9upRsMQtvaE6Q8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlNd3RgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQaEpoRO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlNd3RgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQaEpoRO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCM3HN699283
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 13:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jnYIpJgtFEZlWrcRFiUwalcwxZjoeOSevlSYM3+k2M=; b=hlNd3RgXSWmiQxeY
	bbtdV+I8fqLURJiyTIgClpz0Tr8jUPb/86Dv5BytCuvpCkSiYE7mnx38abo6bJMq
	GjE9WG8+JKCJkKlYb0RJS8sWBugJ4FbAMqRouy5blxcv1fQmCGIbm1oml9W6uyTH
	ef8Pna7IoNIgndJZ1ObAEwbaU9/pb0zYQD3t3Y2UWWqkWOu4IwJFSUPGu1aLnhYm
	214P6eaLNfyjtRKPHkvmniCr8A9BwTWFvK0eJ42ay9hv8UG22ttXfiGKG53RNmSF
	MQhJEe/Hv4GgzNS9dwjZUsGE8AREGlMrUpU85qt8eCx75ccDuh9q7j208avufXzG
	pstV8A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a8at5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 13:45:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so1428569a91.0
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751919; x=1788356719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jnYIpJgtFEZlWrcRFiUwalcwxZjoeOSevlSYM3+k2M=;
        b=eQaEpoRO3I6tD8Q3zz5j8digcyNUe5uMciWthDkjekJhe9B/GtmU5a2aUfrDu2sbsT
         lje1aRt+P8PKm8MmDH207+TjAq6rzWFIRBkjwdI0kWWD+PyZKJnWh9DfHD4MYyVkm4m8
         WKcj9de7UFjaQPVi6kTWSzdz8eKHmfzY/S8R9Fh/gctOFdSOhiUYrj3M+aE28gHNo6WM
         CKnhs21YE5XLu3rFOf6Ckk9eQJI5M6V5JJ3vA/CWizWQkJtkYwvpC1frrWDx9cWS8Dlr
         1RBoDt8dcafrhsdpnsdNGfehAo26aJCYQbdZv1uWRqo7LAqfbZ4U5A7+jMaV0reLwAYn
         oBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751919; x=1788356719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jnYIpJgtFEZlWrcRFiUwalcwxZjoeOSevlSYM3+k2M=;
        b=QidfyZophFM/Qpjpjf8yJpsyYTO4jt9B4QwuBAAan99Uk+K//MyUw9JZZTr5Vvrr8K
         u7unieDpOP8yfn4zkh1vRJCDHX3mqvZjjAcvKhU1Y/8YznRQkUg5aufRbk47p6ABFrzM
         k/qcBNVlYuAnCHJ2/bRy8DpOATBkdRSSTfibFZQWqgZd7skvBSP11dufl5tF/9/nFHh2
         Q+RFbeMOFr3cg4sElfm5Qyb/BFIAdn/iP5NYwwj/vBGOTYRCU+IuwwFnz4bLPjTqetyK
         cLjSbePNjfOITizO2Ih5t7EMwRwKSMTj4Iwk2FtxD53fNQkCVCItcOCEaT+JadKpLt8i
         7P5A==
X-Forwarded-Encrypted: i=1; AHgh+RqIsp1hw0k09x0/g4y2xJjwbYRGqGwXO19+cmMcqhUR7eqz6m8yJqUaWfwgIjKkPRtx+JJK@lists.linux.dev
X-Gm-Message-State: AFuF++kGrjvyGMr485DbtS3Po2TeL+uezPXMOGDjhNC0jyS8QXm+H0bB
	HP996JYY13L38/q7osS/kX8tF7bPlVFNQfGuuZ0oBOW9dGPToMtImB6HO31UNQl+0puPrUJQ1Ad
	DAMYK2PYyFOV0QOGH3fMZKnhv38txZt9TrWEePJe65hn50ibL6B6j+K6p
X-Gm-Gg: AR+sD130lw7p2xmYpFwRJy1fCaRruEfWUDMaVCqA6KM7W3CSZSsR0f+eL/qEpJN8FrI
	jktlMBqLk0WG5CeOGJ2OJ+ZILGuEaUjh41x8YeCht0i4ZO6WIjXaSjg74XZAGgda67pZMyh8ha1
	BdYNQGXljot9QCeGVJGL2jaOKKQQQFH5JYocEn33GK2MFWHAPdQM+VwVMVLnuRCCY4Isb2uO00O
	q6+o9DdV8Aeq1oA374cbCy5HQn+5hmltrQojvQY64gb2S9uyQMk4SFLWG4vslokUna+9ohjCPFw
	LXKfY0/pEOAkTMK60HxGAafuUQPISkWSyYTXcLxhgaM75JnhI8ZmzPHmTP/IPKWT3qxAlDKpteB
	QNIz0y7FbbwnakGyTM1FdBKyttDuXiQ==
X-Received: by 2002:a17:90a:d2c6:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3966d3dafb9mr15825965a91.11.1787751918707;
        Wed, 26 Aug 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c6:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3966d3dafb9mr15825822a91.11.1787751918186;
        Wed, 26 Aug 2026 06:45:18 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm13571333c88.5.2026.08.26.06.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:45:17 -0700 (PDT)
Message-ID: <2febead3-0f0c-4e0d-b11a-8c61ec027f44@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:07 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and memory
 manager integration
To: rob.clark@oss.qualcomm.com,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
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
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
 <7030a8f8-f320-4b09-b2de-2c8e897409f8@amd.com>
 <CACSVV00MubttbkVJgMommPMorf67yqn7D1kfwpxVUZ0t-6au8Q@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CACSVV00MubttbkVJgMommPMorf67yqn7D1kfwpxVUZ0t-6au8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Es_RTUVrtVPat1pcM73RAqaI5KUs9r91
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8eedef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sLzL-2GVjjNmCx-rav0A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Es_RTUVrtVPat1pcM73RAqaI5KUs9r91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX+x54mpVPt0Ii
 GXxqnnVfp/dt0DWAKmRP0HdAkWtF73rV51P5TyU+7cLOnXAgpAievIKEAufSqoLbFKaLNtzlJEb
 wHclG19jsBFwx2cUOPazzMm0O3/TXTNysqyaFkfnb8DzABVp5PNXEYerNHkJVVDEYE0LC89rp0L
 YN5heTRYKFvFp+f68U5ofTMjm7fx4ESgTikf1rwjKBW0ng4S7MH454Gdr1/If4ee2YvORAWUGiD
 dbdhs3Fa3wTOm8C0MzDJwtyuFfX5dxKXdFyxfDkbO0TPpyucGsnyo7p0nh75uqMic06IlGquhd9
 Jzta6Q9yZquHQzb1EZv434AMlp8b4PnW3Rvele4HM6tODnFCQO6hghu55vnluLTTywYsdLwLSml
 d6oxt5RD9xWcRjncAMGhCqEDSN7MMQqkk7ymymu1awJkyDFhX8zaeeq/cEtVz0A9Fx6MYUQi/Vz
 0MmsQvOgC0f5igQkgBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX9oDWbnMff+LY
 4rk1a701iZTrn2PVN5/k/c1I09duFKG0/FHvI1vDMfthjHZB17yZwTEsAymVjCz3JgVeMVjtOGu
 hGz42On2ekWVdNk5tWda6KhaOjBnu2M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260113

On 24-08-2026 20:37, Rob Clark wrote:
>>> qda_memory_dma.c / qda_memory_dma.h
>>>   DMA coherent allocation backend. qda_dma_alloc() calls
>>>   dma_alloc_coherent() on the CB device and encodes the stream ID
>>>   (SID) in the upper 32 bits of the returned DMA address, following
>>>   the Qualcomm FastRPC convention for IOMMU address space tagging.
>>>   qda_dma_free() strips the SID prefix before calling
>>>   dma_free_coherent().
>>>
>>> qda_memory_manager.c
>>>   Adds process-to-device assignment: each DRM file (process) is
>>>   assigned one IOMMU context bank device for the lifetime of the
>>>   session. qda_memory_manager_assign_device() first checks whether
>>>   the process already has a device (reusing it with a refcount
>>>   increment), then falls back to claiming an unassigned device.
>>>   qda_memory_manager_alloc() and qda_memory_manager_free() delegate
>>>   to the DMA backend after resolving the correct CB device for the
>>>   calling process.
>> Oh, stuff like that is usually a pretty big NO-GO now.
>>
>> AMD has made the same mistake with KFD and it resulted in a massive chaos.
>>
>> The DRM file is the driver context your process uses and even if there are multiple DRM files for the same PID you should absolute *NOT* share anything between them.
>>
>> The general rule of thumb is to not attach anything to the process using the DRM file descriptor.
> A couple other things to keep in mind:
> 
> 1. drm device fd can be passed across processes
> 2. virtgpu/virglrenderer drm native ctx is a single process that opens
> the drm device file N times on behalf of N guest userspace processes.
> 
> All that to say, Christian is right here.. drm_file is your context,
> pgtables should be attached to the drm_file (potentially via
> drm_gpuvm.. which you perhaps want to use).
> 
> BR,
> -R
> 
>> Regards,
>> Christian.
>>

Hi Christian, Rob,

Thank you for highlighting this.

I'll rework the CB assignment to be per-drm_file. Each open() will get a
CB assigned from the available pool (find-first-available, not
find-by-PID). The assigned_pid field and PID-matching logic will be
removed entirely.

The hardware has a limited number of context banks that serve many
sessions (on fastrpc, via the DT "qcom,nsessions" property), so multiple
drm_files may end up sharing the same underlying CB due to hardware
constraints, but while implementing that also, I'll ensure that the
association goes through drm_file->driver_priv, never through a PID scan.

I'll also look into drm_gpuvm for the longer-term address space
management as Rob suggested.

Thanks,
Ekansh

