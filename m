Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7063A9002
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024909; cv=none; b=azf8ooDjxPQTMxhsJv9yJXrGibSR8Q4/szB5aIcowYj0u05YvvatOs/PZIaXo5xyF1s5iaCFHM9DGjAVZKO7LVXxETvCztWoAZnA1UgVvNosehwERpMmJIm3w2zLJL1aZvO/B0o/TY7Se2DYl4JPXDJhLDXhTPktRIr3wQvtG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024909; c=relaxed/simple;
	bh=274ubsZNFLQDldOL5Eiz3Zl72Xl4ZQjrmRgtjTkbP/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jv7NbRljESUEqYFsJwACCYmf4zkzTK+N0mczSpgW6Iq5l9FszehhfdWZGeGmpE3Yrz/eI7t3O2ZFbx5eN88CxaCZy3Oy5uKfEE8CV9DedFdFPEuV8CtAWaVNEVH+C14sENBCKmpS+zolRpHMrUWtJayKkYZdmIqU/CJz8Ej2nC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrJR1hkk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwPxcF77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrJR1hkk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwPxcF77"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkmBl3566667
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bXRS5rh9jAJP3tYbTw91AwAt
	64eiYAnV5pL1NFBS+kw=; b=jrJR1hkkjxicDvKwYQNE2jU5RTmV0lIIVKelab3P
	UfYbP+Y4otWMjtQPr2NntdzTvuK8Z0twLgKCUklVQZiblZ87nW7yLziXFSAyg1Mc
	SB7i/7uF9kKZC9CeCbbGn50T+BC8BqHuNHiQzEpnFvI/TFbdhP5S84SutqyeQKrq
	qOtTeOZF2GsTpUVy5MH15pluhblIgj2phoVDZypSKrgUgq3FOXSznXWMTgeD/uhR
	T8+JqIt31HrqiPF47XL99in9izUGbiJhINLMAdWJ2X18ysQof9b9HHqpMnsKFdBm
	kmdIBexMbo64W9BhFfWxjX93EwR0BNWYKcOWbN2hjF9kHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0smhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:48:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so534035885a.1
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 20:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787024906; x=1787629706; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXRS5rh9jAJP3tYbTw91AwAt64eiYAnV5pL1NFBS+kw=;
        b=WwPxcF77APssxygVvvfNWoNcfQojOURedqW93g7miyi6z0SQx1a+HMPmLa03NO8vb8
         eFa2BoFCRIQ4uiFZ+0y6NkAaTPWPb5CPxQyXKi6iX/3BFlPZxmoOMK02W1KTsJ4zCRzY
         FUBr+l96wzjtw7D080FvpvPORNEIVhCF+BP0hw+mG2cZeZYzcr+yAfFGwnhDmXZ+5ll3
         5FOdvYFU9kCKCfJ1mA1tILtHBfEUzvW2K3Yp4qXvhs8o3FZ34Pdg7SExZ6azIZ9OFqD7
         gD0CUMpjOKp2gHXjtj8jQxh+drCkOtzYHiGxhH3+HiRzlLxlV710Yu85Sa14+J1zqGUH
         WUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024906; x=1787629706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXRS5rh9jAJP3tYbTw91AwAt64eiYAnV5pL1NFBS+kw=;
        b=PgV1tjOt+fJ3Uml7mT66p1o5iauh74WQGjcMtcNC56Bwm+ppsbEefzHwpM6xi6gi8d
         gVKSyjvWItraYJImbwI/XW2AT1GBupA/R16pOuAaoVqEyX3mymamoM9+ldt/Z7XPwsQp
         AuJffCt6HG4e62Sf2fLbObVmxdseLYm1WDNYBvv3NE41l4oJxGxeDyRa7RELOwFnIBML
         43/qaAqziaTgc1R9wM0GNNna+MTfH0F6MgyTLcHE6e0CDQPXyikZfcpKHuocoTdXKuiw
         pA1humkcFe43d0vKiQIUUFnirbHiWmITgHt6EIS8rOHXNEj8gGbk+Rj73I/iBk0tkrUQ
         dBBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5OJMDalEa9A9Zr93aD4MHcmzGdcQEdZaOsmLGqfq2iaEJvYbXyuEu+NSakrDCEQQj23/i@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg5lwtX77HUUsXwYWE/2Ua9oaWNo0Dm8/c8MGu0cTDJ0wqn2lK
	uWECJORO6muT/oE5BGgTLlsJHpfcrcMpE2fIodUAQDX4yFjJVbwxX5K3WkmKSkB4I5Xhh44ieYz
	7bhREPEzvAeF4lU0/xPz2FmFrfkX55gBZqUsSCtyMXYFY877bXedQXbXg
X-Gm-Gg: AR+sD13nF9aKUfsbxVbPoYgWdrycuhlBCQdeghV24wpuY34hD3gfuTJw9dlomccvA/1
	yXOEmh+ZJ2M1O56/d+Y3sn7Ql4gEGUpuOXzeTEqnWLiJpm6ijUfwsC8a1AchUoO+0BOIiCvtbDA
	PdF1VagOwN/pW1fU56xA+snfEFcJl4Uyow//YMGhlnwokJVBcX7mtCHFOtWSPBQz3HgGtsJ1yUr
	aRW2hc+oQ0n9ct60ZfkxgM2dsQqGiFvM0z7NgflXrufsENErkElZUeLJCGrtFkiHxYWm8xPu/AF
	ro/821Ki+3iSsfPD6tMpNIo1LAY9+IZm+8ryjSC0TfiM4DELHiAk3YM1bsVJhof7wfs4XiEIyRn
	pHhLOQsB3qTjOJL0teZCRinFGNndaW3rPgMnF6tF53Sg00WIg5cPfaPewxMY3fYWqr2UFqZBXwJ
	ZUFssSTcmJXzW2
X-Received: by 2002:a05:620a:4153:b0:930:fad2:fd with SMTP id af79cd13be357-93704b523fbmr526540085a.17.1787024906306;
        Mon, 17 Aug 2026 20:48:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:930:fad2:fd with SMTP id af79cd13be357-93704b523fbmr526535185a.17.1787024905805;
        Mon, 17 Aug 2026 20:48:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm861092e87.25.2026.08.17.20.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:48:23 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:48:20 +0300
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
Message-ID: <pm5yr7fovkav4cuat5zqn3ngf2fxzrqutsgyaobwp5djv4xkuv@in7n4o3x3x6y>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNSBTYWx0ZWRfXxOy2U8/sV5Av
 UtOBRIGc+6scMCSH1mGgijJzufAhhXil4vxK/wR5OJVfKrX7+UE6YLuxgnp97HbZLRbAneYzfLO
 pSQlppqkXbVio6Rl6I80yvrwwM/P4ck=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a83d60a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=biWI9kQzUyu7Ho-RK_UA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: myIZIIGGMIdCYH7EBSnHNeBqut8WPru4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNSBTYWx0ZWRfX1linF5XoFslR
 UPZxYwESSMKqeoK7DbQISBM39aQI5FnrX0Xw+Ss+D7Xq2mFOYTfLHihby1Yc86VSVyZ0MkOLufY
 LFnZq8pEqv9SnGPL7dBDwesMw7Pyeej1IFS4/RIlACxg+N9gAMTf1SXcAFGhzoiVKud0lu9xpvA
 OimuJCuSwjI3WVtXOKhH8jGQTpIm40bfntsFcj3IgZhGjLGBShxWcwDDmjJqovMj2N80U69c7RT
 YAZD74ePIN46dEWdndW15OtV/bJNKrroKAUr/O5D5WK7Qxl40rndniYC2XehozHKlGHQMQctz8L
 O9ce8aw7al+0KFgGWxgz4y9DJOgo2yBty6ykxCaTIVLTBsa9he32eVm0KK2TEH+FBz7rRDj2UQv
 5FFgD59giskMWvau6jjoZIVLor01kr9EwcCeYiUKx07UMjjdYTckXJ0RCKnevocwokaYBcfnG7x
 260P87lCUD/gREjEwaA==
X-Proofpoint-ORIG-GUID: myIZIIGGMIdCYH7EBSnHNeBqut8WPru4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180025

On Mon, Aug 17, 2026 at 10:17:44AM +0530, Ekansh Gupta wrote:
> Introduce DMA-coherent buffer management for the QDA driver, wiring
> together the GEM subsystem, the IOMMU memory manager, and a DMA
> allocation backend.
> 
> +
> +/*
> + * The DSP identifies the IOMMU context bank from the upper bits of the address,
> + * so the stream ID is folded into every address handed to it. The DMA API only
> + * ever sees the plain 32-bit address, which is why the context bank devices are
> + * created with a 32-bit DMA mask.
> + */
> +static dma_addr_t get_actual_dma_addr(struct qda_gem_obj *gem_obj)

Let me propose a very simple rule for you. Unless you know what you are
doing, all function, struct and macro names should start with qda_. The
to_qda_foo(), I think, is the only example up to now where you don't need
to have the prefix.

> +{
> +	return gem_obj->dma_addr - ((u64)gem_obj->iommu_dev->sid << 32);
> +}
> +
> +static void setup_gem_object(struct qda_gem_obj *gem_obj, void *virt,
> +			     dma_addr_t dma_addr, struct qda_iommu_device *iommu_dev)
> +{
> +	gem_obj->virt = virt;
> +	gem_obj->dma_addr = dma_addr;
> +	gem_obj->iommu_dev = iommu_dev;
> +}
> +
> +static void cleanup_gem_object_fields(struct qda_gem_obj *gem_obj)
> +{
> +	gem_obj->virt = NULL;
> +	gem_obj->dma_addr = 0;
> +	gem_obj->iommu_dev = NULL;
> +}

These functions are called only once. Inline them.

> +

-- 
With best wishes
Dmitry
