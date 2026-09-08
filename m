Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9BD492E21
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908723; cv=none; b=lcuBckpuLFz0Mv513r+zS+ddX7gOJJWRMDvzSFUtPRPFG2vSjXDVBjbQ9cZqWeZjCpggAn+rwvBc5b6a9fwXtNO88IIAvbZisidaDJOsH+oJ1y5RFuORH2oo0N8oGdxbIa3igjO0QTGUvYBYRie3NTK2BxvGB5a0dArqRTIBiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908723; c=relaxed/simple;
	bh=Uy/e3pYwP42TDDIvFNQ90B89CTw2CPnfTxb4AAbQsCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnLaqj8LhTvBF9Kc6kREbj3558SXYBKeSVWYlivtlxgwykbqI6qXos5R9kuSL0VHRk4p/trC0HQSKdAQYJLULwmgjX5o2P03PTpMVvWg5LWs3Yw61e/HAT5qSDtkzqhD+qyLmH7ULJrKIZANXWz43XJwv4yet50LMixovqQ6mCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmzqmxQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcWMGduN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmzqmxQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcWMGduN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688MgAib129688
	for <llvm@lists.linux.dev>; Tue, 8 Sep 2026 23:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=; b=hmzqmxQ42BEaEeVT
	IvNKp7PG5jp6hEdrg0XvJzRNv5f6ND/AmKEpWuGd/N5xmhEiJASv/TWngbjQAqzh
	7gCMVK4IQCk3Z8PBOM9Xh6ZkGqqHV+2j+WW8hmFsyWuexQbLjafy+z73SG47xBcX
	vAuyJtWjOgbFifUvlCB9tSXi3R81jy9c33TvL6BpYJg1M5iS8RVvdpjCRTLvPoGl
	UTPT/0dCwtgWp67I0l7aZZViLCVvM+LgN6AZrRF27MyKSN3vxxEiJYL0VbzAGnSO
	R/yKHeK5QEM8WyHi7a0gvAdRlAo/n68JhMLAeMoDRwTKEdMroGjl9mbWdW5fYszH
	KQoBtQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjntphp07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 23:05:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78481f4ba52so4680376137.2
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 16:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788908720; x=1789513520; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=;
        b=OcWMGduNtARGhT/2+gbKx1JI8P3ngmVBE1bJoglI88rRMN9lSbp2a+nTJAqpuRgJkR
         Xy2YkeRbpwRn8P1hg7375T698DIprcoa0y/FFYqH0q9FgC6SJArCe/dmdRG0JUhtGzEf
         23/RQzXjlVNW79pHQAw3TnIt3kWkiU5oucu3Z3+l2le/HVGOwJLreTReKBZwE6ZlNPJK
         rTXY+gBTxKsgySLuPPiFUO66gTRSXae8hSxgK9vLc+yX0wvdRLVcVINhvPVHs0HlRsfz
         6OwH3IsMDC8ydT1YPJMoSmihXdKN0fYpBpIDHBejRREmYaWqEN70mH+XZzZOaUqBBLlc
         yJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908720; x=1789513520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/GhhHa8OWdtOiPSMUGlb1pW6jJlr+86zcpdLSW1zB4c=;
        b=p+K8EZPfoKCc/EalCIk2bJagd+uJ725ZImhJpLn0KszffkuDnsuonNZOsu92CtpYTh
         twYjUC4Se5XoINYbVfsYv0JEcecyUm9pwzRRDgR1KGmwvRkPlU14dWBCZgeEblJ0x6zQ
         +t7r/0FUzeQXs1P0dyjFEdHT61pGo8hmjSRccLsAQtzQ9gfAwrFEbL8QGWp/VvJvBDvb
         9dAF0mxxcBLE/fR0lu3NqkGNNfWwnYKPz5n8XFSUzZtFWweogWfEdcV3PzqI6hxWwCn6
         MkdhYAkqrfyjf8cGP1jxV1axU3Z4/wKnav1L0iUXN3ZkdrWVhY0uxgfLfe53bORrg6Zw
         ggGw==
X-Forwarded-Encrypted: i=1; AKwUvBxZyq5ZxTmRKoxV9cq1Zolm8mKK8Oem0ExsRLpP00uHCkVZSnli2B3JbtmuxCwZ4S5MAICb@lists.linux.dev
X-Gm-Message-State: AFuF++lJF1Cbr0psVAjUh3fPrRjGtEtsp8TmojgMHpPAgDMrGM36q0lN
	N5ek3sqNOWmWwxKq1IEzUNIlfjIzDuGLUbZ+wmy06KXTulKSNb20IyAiQ+E0F4GUSOVajpKFlW8
	FNlUsj96a1nvr+XLUYb2sPJCG+VxSwuVD3TUL/T10QwqKVX6WytPV/kYK
X-Gm-Gg: AYBFou0uoI3sVOreSOpNSTTyBcpfLauInvVajIjtRX34FWYqOsjUFTU2u87P4qexv09
	fBLZbMr8E7o9/IpgAiZg/m3dIaGdnDuaG1U7YzZx6wmcksH7ETSUxp0mVtZu1oNATMMWiXnZK9W
	4b+fmeDtd0SoQfBnk1A4MJArHMAyHeybzPqdvdNFmB3YOV6IMd/yiRaAA9nCmn3ED6/dOYE1nQy
	40k+1cZd6YHk7YhK3w+f9pf7xSvpqyOeEishBvSwWFxE1pAdDhlKdh8D8x0eNbtgATVq7xtKFVv
	nic9sid/3bKWpYTzQD3kME1A/6qBKBd/LjPkvs9lEmwcWj3ZJc/CB57ltn/mgQveiv2DZKRMt/f
	TDGkCg5ithkjvsSY8jFy9QPEsAALhVQyGwA5zuiURnjy/PsxtahfvgQrmpWWMZ/CmedUQv+vSvB
	AUz+vYuEMKEPYq
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-78a4a97bda0mr14097732137.11.1788908720214;
        Tue, 08 Sep 2026 16:05:20 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:5bbb:b2d2 with SMTP id ada2fe7eead31-78a4a97bda0mr14097683137.11.1788908719796;
        Tue, 08 Sep 2026 16:05:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37058669fsm36735161fa.17.2026.09.08.16.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:05:18 -0700 (PDT)
Date: Wed, 9 Sep 2026 02:05:16 +0300
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
Subject: Re: [PATCH v2 11/15] accel/qda: Add PRIME DMA-BUF import support
Message-ID: <d4ykcbhd2bqisv47s6hutrpdtlox2aid3j6pkgif6tptivaqkn@tko3tts7hzcn>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-11-69a02e9090d4@oss.qualcomm.com>
 <l7gt2mr3rrnzmkc46ntqw5e5sirdimavv5do4wmdf6jktryp7g@772ovv3qlgcv>
 <c1da4243-36d1-4b65-a5da-f660ab8c63b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1da4243-36d1-4b65-a5da-f660ab8c63b3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDI1MiBTYWx0ZWRfX3cr14ew88Pg4
 NWo2SG/WEIRVpE/PzyUSGYenu0VrFQCSlIGqZtgcXqJzH1qap3cc0TytNKbowoTUmN+RHmDpYME
 qWoNyPo4ZDskSt65PQsXRG2ssLzj5XlnswoCsjoNrsBjRnzgKuQz8yiXcr6ZDER8vsKv5wIGqhA
 BSgiLeYwBFdhF03R+zjwQF+/OgDIXgTRjdFeoZYdj51NKSGg/bTs4RacaMUlEYED+nvq0H9WdgR
 xAo0ZPtGqQYJoiAMpJRhnxIdYSlMs1SM7/Mvm/dr9YW5xOtfBa3AtHwPZAeFrzKgGflt1MrPaZJ
 rA0IbRLZYRlLiBEf0chI/LLbNj1a91QBfacKQ25L7JuOQCaVVhSMft8ibGkQvr1tiZF0YW5uF9P
 drjRc3KHF/yIwa+LhJHEqXf7VpAU3VqM4jwr/mIV45LMYNBY9TK9yl31PiCSzS4YkXFXEBSubib
 j3EA128mJQIf28OdEjw==
X-Authority-Analysis: v=2.4 cv=N+AZ0W9B c=1 sm=1 tr=0 ts=6aa094b0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pwSLSVGh1Xxsrx2JAEcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: jn6Pzv-Lt34-JP1XZ93KjCHLLsWixZce
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDI1MiBTYWx0ZWRfXxuxWY4H/4+6Z
 V1HzRZ5GL/26Vx47F59SznO/+CILWchNCzUgeFyUFtlZXqZk5KNxdJalr3uHmT7KdfiJVj9XR6R
 AiygHPTgPsPGcr5hcA78r5m/oikECaQ=
X-Proofpoint-GUID: jn6Pzv-Lt34-JP1XZ93KjCHLLsWixZce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080252

On Tue, Aug 18, 2026 at 11:55:50AM +0530, Ekansh Gupta wrote:
> On 18-08-2026 09:25, Dmitry Baryshkov wrote:
> > On Mon, Aug 17, 2026 at 10:17:46AM +0530, Ekansh Gupta wrote:
> >> Allow user-space to import DMA-BUF file descriptors from other
> >> subsystems (GPU, camera, video) into the QDA driver via the standard
> >> DRM PRIME interface.
> >>
> >> qda_prime.c
> >>   Implements qda_gem_prime_import(), which is set as the driver's
> >>   .gem_prime_import callback. On import it:
> >>   1. Short-circuits self-import: if the dma_buf was exported by this
> >>      device and is not itself an import, the existing GEM object is
> >>      returned with an incremented reference count.
> >>   2. Attaches to the dma_buf and maps it with DMA_BIDIRECTIONAL via
> >>      dma_buf_map_attachment_unlocked(), obtaining an sg_table whose
> >>      DMA addresses are IOMMU virtual addresses in the CB device's
> >>      address space.
> >>   3. Calls qda_memory_manager_alloc() to record the mapping and encode
> >>      the SID in the upper bits of the DMA address, matching the
> >>      convention used for natively allocated buffers.
> >>
> >>   qda_prime_fd_to_handle() wraps drm_gem_prime_fd_to_handle() under
> >>   qdev->import_lock, storing the calling file_priv in
> > 
> > Why do you need a separate lock?
> Will add details in commit message,
> The lock serialises the `fd_to_handle → gem_prime_import` call so that
> `current_import_file_priv` is valid for the duration of the import.
> Without it, two concurrent imports could race and each see the other's
> `file_priv`.

What is different from other DRM drivers which can use
drm_gem_prime_fd_to_handle() directly?

> > 
> >>   qdev->current_import_file_priv so that qda_gem_prime_import() can
> >>   retrieve it (the .gem_prime_import callback does not receive
> >>   file_priv directly, but the context bank to attach to is per-process).
> >>
> >> qda_gem.c
> >>   qda_gem_free_object() is extended to handle the imported-buffer
> >>   teardown path: unmap the sg_table, detach from the dma_buf, and
> >>   release the dma_buf reference.
> >>   qda_gem_mmap_obj() rejects mmap requests on imported objects, which
> >>   must be mapped through the exporter instead.
> >>
> >> qda_memory_manager.c
> >>   The DSP is given a single base address per buffer, so only buffers
> >>   that are mapped as one contiguous range can be described to it.
> > 
> > Is there no IOMMU in front of the DSP? Can we remap the buffer to a
> > linear are inside the DSP map?
> The DSP firmware's buffer descriptor format carries a single
> {base_address, size} pair per buffer and it does not support
> scatter-gather or multi-entry page tables on its side. This is a
> firmware interface constraint that we cannot change from the kernel. So
> imported buffers must present as one contiguous IOVA range, and
> non-contiguous ones are rejected.

I think the main part of the question ended up being ignored. Can we use
_IOMMU_ in front of the DSP to make buffer scattered through the
multiple pages to look linear? Or maybe I'm misunderstanding what you
wrote. If I have a buffer spanning three non-contiguous pages PA, PB and
PC, can we still use that buffer with the DSP?

> 
> Will add this information in commit message and during the check.>

-- 
With best wishes
Dmitry
