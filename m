Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289063D1CC1
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024546; cv=none; b=brXBhmxcKYhfkRAH8Dg2ttPSa/QEztF4iAoofvtJx1NJ7QxOKDPcqfoMlqQknicwTrbwRGRcby84u7FaFK+8d+TDJfd3YpOSMU7odOThQxwnG9EZCyqH+r35H4Vuin5Z5AJAx1jvrYI22+/SVv51i8P3FmnjEfcZX3u/WLCx07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024546; c=relaxed/simple;
	bh=og0nH85CYCCGni0xB/xCMYW1Oun84u73xVvU8oPwK0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYJmHwPHe7z3JVsRaYHWoUk2MbOTuMn4Ber/6g290TjWSHTPCMYFALH/hhXTxqx3KtkoM/xF+5mn7458LCjMaQ4UWge4u5vxWXoSMBKfDHH5PgaC3HmPnJZZEfFl5AhD9OR2p+jWvGQgWXR3nkFPkxCUUUYvZhw5xqLqVhYC2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1GwYAHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVb+VFwf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1GwYAHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVb+VFwf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3GE1f3834371
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MaABp0/faTANtVcerTDacDQd
	lb7pXZWcETU4q2gt11c=; b=R1GwYAHqL8EDVwyhfRXBq4LeLrPDpen8Be1zsRaX
	XWcXJhOYiY3/auiFO2HbPN7yF4/QJ1KCGEOCw2iLndJ8FVKA+nADhGeo6qst9tCw
	P3bFDv8C6VafbPcV0gPjV9IFpHGN3JqVvHk9x+IhhVNlqKzMiJIBVw+35KXmZDnc
	/Wx9GiURAGiOU2T/DDfWSEXxjbRe/D0ZLTE7nOlkauAXfJpsBi0ykiRwhQ94ayEF
	2sh/eLmcHZLqo1qTPNCjzDlHIoNoiHOgAFOVi/ywV0oMHnIaeQnoNg1nOZr/gTEb
	NLwXlJSaHoGkw7VVmcznRBUBZ1IazoywpwY9OO42hEllTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba82pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:42:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so7446151cf.0
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 20:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787024543; x=1787629343; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MaABp0/faTANtVcerTDacDQdlb7pXZWcETU4q2gt11c=;
        b=JVb+VFwfCZHAAYIUZWI322QYY8AUTNQWdwdpvl5eYRHvDYx+ui2Iw2H+8A4r26uiqC
         8qlZBKsdi0iWiw5pieLXq5kql7XzzUDYgPPC0Jp6l0Idv6TlZwF8qyBn4MCMdywE0dA5
         sapGAC0a+oAr6Zrk06P/Ce5Tdiqhi46tG1EoAkLrVQoELbFmD8uj8TUCsxSoLHpezj88
         G8+8N7Yf2PkbDMWSkrU1A+xUcRQNt1r9Wa51h0J9HL17nw5W0h2B/5BGZP17ELFj3b7j
         XIaB5oXBwUTvc/sktTVWrhIh8TAbA4tBoS2+HykhrogNVCwp16YQiADp+MxlyEdiwzSt
         cd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024543; x=1787629343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaABp0/faTANtVcerTDacDQdlb7pXZWcETU4q2gt11c=;
        b=XLOgPJLWmNGxBROfaKPAfDf1SFr4gKL62n4VoNMVySj3mrU7kVETbYu2A76xsEc1l7
         /cbByJz4i0+J4lhBn1cRklf1+Qy9hAnZKOqCSPZmxn6VGHMlGCYYbro1wCCQ8DyUGuMi
         viG6rdzCiFLNmA7YipAhWy+QqZ4e7GbAOnbAEisWmb6dbDLznasVtTh2vaBxPC7fOhQR
         wrF3jgddvJNbwzBzpi3CL1ANgMQRdjIueHmO0SQUgNSxUjey+rrT+nmgeUEuOnKeZeWm
         KoO4kCZRvOqOZoVz8MpOfi3W0x6wQUMNAL9KtJMO4qx5a7nQsafUEKwDjdgH+SkfZBIw
         wbUA==
X-Forwarded-Encrypted: i=1; AHgh+Roh4NHamH22l7oGUXw8QC6mkQ7NNmDQfcUqbialSH+aEtgpC7NtyJ/2kNKpvaViCrjx1NVC@lists.linux.dev
X-Gm-Message-State: AOJu0YzFwmUZEmDPhDpHTdtt0I3yPwljCPRkBEu6n/DANNtwA7Fsc1x1
	q53DixSYTVk0gjATC8Pbok8O0faHTZ8sFucdV7NiFLTjzsfBBLcadMZp5WkOJ5lgMfqv9mUvtZU
	I25mzV5QkRkuPqw2zSfzO58OEBAU0iZCF0rK6gek/YUbmDOVnzHETAijs
X-Gm-Gg: AR+sD12xEi1CcH7o0/aiJ9Oy62V2M5FkXI+y+TahyVcj36s5hX2qz1vRP4eVPX3aM37
	nVPPUsLmcrS94y2jWGStiGc19IzeRBE9+JZRoHBDLUuZijvMs+uC+CTB7sfkjwZShFoyOdWkOKi
	eMNs0S7BHC9UvucxSAl2VUZJrbZ/RfLLqVej/OiuGlhQJVkYx8nHcrYtBptTLrD6oeON+UwXH7Y
	2hCFP5W99p89EkfNQB5LwKhjWPMquvmFka/29aFv4qnPbZtHSXdE7Pn81LSa2pA+sYiqyOUo09v
	kR/UPr5j48dvUQ19/hSyvXDMfJ+OfBcfW6JswpDwMr9WJhQOb82gi7z5N2sFpIjavi0TIddkYVV
	ZZIKYVcnKnLCXf43WdeDZtWSw+uKKhGYnHS8OduA75ORCYgf6SwzVvDtHM9qqcDgogJzMLCevIu
	5v+AAneFD3q8Kv
X-Received: by 2002:a05:622a:5592:b0:528:ce0:e9f8 with SMTP id d75a77b69052e-52dbecc2fbcmr42318811cf.3.1787024543128;
        Mon, 17 Aug 2026 20:42:23 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:528:ce0:e9f8 with SMTP id d75a77b69052e-52dbecc2fbcmr42318371cf.3.1787024542626;
        Mon, 17 Aug 2026 20:42:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa1811sm866041e87.30.2026.08.17.20.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:42:21 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:42:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 09/15] accel/qda: Add DMA-backed GEM objects and
 memory manager integration
Message-ID: <g3dkltejtlzrrelv77kjteqbkny6vhedyuet7d6b2p7yfix3ys@sop7vjvpdvzb>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-9-69a02e9090d4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX2XiH//kNjuNn
 odXML+CfiYEVlQ+mbucdrJQiGITbHJxCEOiI0Dq/Lp7walId8LYwTnUFJ5VlL7aw4znU4EomiUy
 YoUD1eFkWmmKnQfhjO92ujlmmK1Arzk=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a83d4a0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BBVwHIhhcn0rA1_HgMAA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZF9NpCJ_n0nLNaOat5wRV_idmgVBYUCC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX0Sy9D6YoZo+4
 wW1Mq1hAzw56ZTsIwk2M7ieNZ5r2QsWGY4FDkFkeoxkPywUvpu3gaB5FulGJymjxQ1BDDpEktnq
 jT+5VLefTxiHjygOuu6+WEckxKXVNaLYzVmku/lQTbg22tIv2f34KunV63fBcYuljeTn4ANT/Q5
 HX+YgWKHE+28iYp420WcqLD5vt6rkWDCK4prOYSURCriO2+7hpyv7mJlTIus+U8UOb6MCekM11b
 +bet/X3njC0XGRCwDYeyNEGJORaVvrztSdhxxyBQfkLzeJR9lwQyyxeekIbFZaqEj312XOdPdAe
 RjOfuNVhqRZZCQzKhZKWAVDfO4AXXfBzwNo+hjIhUTL9E5Dk4PgXJvFKCyoSQyaqjTdNlcHs1bx
 feVAQEhYdpXFa8wzBSY5W9CFTMrdhUh2VdqjJF+dR+nVBeX25XWGJmLAPpaMZUQDRFqmngL59k7
 PICcSDW+NnOhTft68RQ==
X-Proofpoint-GUID: ZF9NpCJ_n0nLNaOat5wRV_idmgVBYUCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180024

On Mon, Aug 17, 2026 at 10:17:44AM +0530, Ekansh Gupta wrote:
> Introduce DMA-coherent buffer management for the QDA driver, wiring
> together the GEM subsystem, the IOMMU memory manager, and a DMA
> allocation backend.
> 
> qda_gem.c / qda_gem.h
>   Implements the GEM object lifecycle for QDA buffers. Each buffer is
>   represented by a qda_gem_obj which embeds a drm_gem_object and
>   carries the kernel virtual address, DMA address, and a pointer to
>   the IOMMU device that performed the allocation. The .free callback
>   delegates to the memory manager, and the .mmap callback uses
>   dma_mmap_coherent() via the DMA backend.
> 
> qda_memory_dma.c / qda_memory_dma.h
>   DMA coherent allocation backend. qda_dma_alloc() calls
>   dma_alloc_coherent() on the CB device and encodes the stream ID
>   (SID) in the upper 32 bits of the returned DMA address, following
>   the Qualcomm FastRPC convention for IOMMU address space tagging.
>   qda_dma_free() strips the SID prefix before calling
>   dma_free_coherent().
> 
> qda_memory_manager.c
>   Adds process-to-device assignment: each DRM file (process) is
>   assigned one IOMMU context bank device for the lifetime of the
>   session. qda_memory_manager_assign_device() first checks whether
>   the process already has a device (reusing it with a refcount
>   increment), then falls back to claiming an unassigned device.
>   qda_memory_manager_alloc() and qda_memory_manager_free() delegate
>   to the DMA backend after resolving the correct CB device for the
>   calling process.
> 
> qda_drv.c / qda_drv.h
>   qda_file_priv gains an assigned_iommu_dev pointer and a pid field.
>   The .postclose callback decrements the IOMMU device refcount and
>   clears the process assignment when the last reference is dropped.

This provides a nice summary of the patch, which is pretty useless.
Please teach your AI instead to describe the reasons and the design
decisions instead of just assessing what the code does. Why do you need
memory manager? Why can't you use existing GEM helpers?

> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Adapt to the dynamically-sized device array introduced in patch 07
>   (kcalloc'd from DT node count, replaces fixed QDA_IOMMU_DEVICES_MAX)
> - Protect register/unregister with the process_assignment_lock mutex so
>   the device-assignment and device-registration paths are serialised
> - No functional changes requested by reviewers on this patch
> ---
>  drivers/accel/qda/Makefile             |   2 +
>  drivers/accel/qda/qda_drv.c            |   4 +
>  drivers/accel/qda/qda_drv.h            |   4 +
>  drivers/accel/qda/qda_gem.c            | 134 ++++++++++++++++++
>  drivers/accel/qda/qda_gem.h            |  52 +++++++
>  drivers/accel/qda/qda_memory_dma.c     |  82 +++++++++++
>  drivers/accel/qda/qda_memory_dma.h     |  17 +++
>  drivers/accel/qda/qda_memory_manager.c | 239 ++++++++++++++++++++++++++++++++-
>  drivers/accel/qda/qda_memory_manager.h |  30 +++++
>  9 files changed, 559 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry
