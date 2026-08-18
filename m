Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302D3769E7
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 04:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787028331; cv=none; b=EvIL6UZ1Mmr5JjT7amxCr0QhZG3isuOGo8avgjZyaZZxcbk7AoOMGRABPmjTrTUB3Fr0UYhCx59K385xamy8a7ZLGha5f2FvwwtwS7CKMPw5buw1/5WSmB6/bnam9JrOO4ULWRIkTFGZUMz2Ve5aLJBKfaq6/VuCIdbQAxgAk7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787028331; c=relaxed/simple;
	bh=4aUJK7VUOQ/uCRWZ29j9yj0ZivF1P99o5NOl3kBlKyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHqfgrZz9KMmZtnNS4munvo5NTKGZGuXZ9sCmoTZijCfoTvv+RgBQWPtBDlORtb2Qexq4Xc2bz/8cJymSVwfk9WRLmmIHBEUN+dHPuAHrQ5+E+JbTD/JmgCPa1uomtLA9wLyuy7FebpqBn703Bn/Ou2Po1VDyNLVJEfIB0/gpmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZLXrhLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heCDIcaX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZLXrhLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heCDIcaX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I12IX0297601
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 04:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+GMonc/RpYRTRb39qbdjpzhy
	wf/yWb6wWhYjSvEgMFI=; b=AZLXrhLKeOIaJbOQhN1f/mV6AmzKXDGGHr8sd/FP
	7A+yZhwyDyc8rsYV7paaj8MfyyGlu2+8FEHFBxB3FDNNe575kDViwsLOaRFA/Hkn
	aTx+Dd/oz1uZtz9s7Bs0vPRDMM0ykNJ8OrjZnOB7SVbgL8vi67NCBkpxcrXdsMCw
	lI6kJW9ReRAeujuzScXbbRs6M7hMEhzHGVpVVHLiqIjLfQ1dJAW3Dt0v7ZRziutA
	AP3P4MxLAFodKbVBWk+25KmxZ62v9kYY+6gFRk5Y8nZAtNJZCVALufyWOBMsKMY4
	vafCsyO1RxVJJrxpQ/VrLht+HPB9lc+PSnApQn6WOBAMAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn0rjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 04:45:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso381409585a.3
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 21:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787028328; x=1787633128; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GMonc/RpYRTRb39qbdjpzhywf/yWb6wWhYjSvEgMFI=;
        b=heCDIcaXyYrm48Bqs73oI5iMK6DG2Y3+XZxUiIqPg9gO2IreBTOKgWR1/MLFiJ0Dxc
         sX8MwwGroF9iaWsMh6OkyhGZ1WZVm1v+Z3Hd6zYuLlu7htjnM/L15vyXavctkai5wNFL
         UqyvVnTKb40BpE6I2tXn+erbshGDpI/4JBF3SrMQHotv6tGDeuH5j0lcR5zp0z8eDXjy
         SbZBKQu2NgG2xlsB5AKZNFL51Zjkdxvnvwh23a8yqBC/5TQWWyKsk7UgGDNFXotVIOVh
         82e/I9f7UooG3C+or3U1B1cjZ8Q571/2gzGdkUC+9XBVV2x58ABvVpf66rrXf4SkBlfc
         q+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787028328; x=1787633128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GMonc/RpYRTRb39qbdjpzhywf/yWb6wWhYjSvEgMFI=;
        b=aIKb//PI+yF7FoY0f62dN55rIKZiQtHOm2HhlvR3yMcjWpCffDRLP5iBrdT2hX5tPV
         uXua+UvvZwFzNuoe9TSVIjyTM783x7gSvD5CBFfZZvTOTLdnSc9UHamG1oihcBWj4E15
         XlxqqPwtsjCvkc/Etge4sweVAeUYIhSVnewQC6JPDb0p9LJhi+BlxVhns7QcQMUoooo0
         Wa21ZSnt0l6D0Ymgn7z6MI0JsB/y9PiCmx9s9u/DrVQDGu3sCYH77hShrAXrSxbFk8Hu
         pbMwBYb8QM/eWlic/bWSxvFAsJwhYvySuzylJZ+DRe5+FnfyhHKvmCwZ3KRdwwAaozyt
         mXTw==
X-Forwarded-Encrypted: i=1; AHgh+RpQm1kwOkmesuQRiJAAVHJgZxy9iS8AGcjP9+/AKhyzGgCwuB0Tf+6XBE1Mf7DODHjSurMj@lists.linux.dev
X-Gm-Message-State: AOJu0YwlK+fdW+AJ9gjAV8beqXcoZLfJpChLhfTSRXymMIrQq6jarAaU
	x2fxTzNrjwnnV5hudwnfB8gDjRNmJHoL9QnBNrjzNYmiFpDigxb3hof7++fm27H9/82Gkz3KH8Z
	GNDsGDM0K0MnfbVtHT7UWPi7ePxkGMD6sSeZ/lf/lnjy05HqTcE61mSKc
X-Gm-Gg: AR+sD12xQqJGThwLuAyURwZwQcvW3MSDXAPuf66GaX2ZleuwZNRsL72Sqets7k5fiE0
	nCfWIS/2Vzcf2ro4rGX2uvWIet8ZypTK31cbkd/3xVkoI571uQHm0gA9HRtyO9k2TwvDR2af6BS
	ik+ZOzl9xsCT+WC/LJNbqF+EyP7CUn+ARsF8HTgESymlatxpUTjhrRKRHPH+uGKkH1ucXcZc2VV
	PuFl0W9OebNjr5KHfAgWPGCulo0S6tPtugrcjT3ZLoTQW2SFCgvr0r4h48yirihPU6SCp2soOqc
	8SmOFYKxUboD0SMA5fdzFwrdOO7IVrmxRvYY0j9YCSMqZdgb9RntqxcWr6++xc7guG12pIej5z7
	7I1HWi8NblD/yugfbbEaogAxi3mjj4j7HkqdtOCzkSDjyBOSuvi+zXuKgEcSXXU4YE8UiD4uvrI
	frSTFcxYpqiJa1
X-Received: by 2002:a05:620a:a217:b0:936:cf64:97cf with SMTP id af79cd13be357-936d239212dmr3033327385a.41.1787028328477;
        Mon, 17 Aug 2026 21:45:28 -0700 (PDT)
X-Received: by 2002:a05:620a:a217:b0:936:cf64:97cf with SMTP id af79cd13be357-936d239212dmr3033322485a.41.1787028328017;
        Mon, 17 Aug 2026 21:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf960b6sm911796e87.13.2026.08.17.21.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 21:45:26 -0700 (PDT)
Date: Tue, 18 Aug 2026 07:45:24 +0300
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
Subject: Re: [PATCH v2 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Message-ID: <bi3zx3rvebd4ywnyzhsu2ft2sqz3rnoblcgt3jpmyik3n4dxar@nnddlv2susx4>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-8-69a02e9090d4@oss.qualcomm.com>
 <r7bx25akbxomzhxxyqd644efy2vc65etwcnhlyha7wm7xrt7ea@p4v5sesn5rzw>
 <c54f5212-809e-4517-beda-f86b375c086f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c54f5212-809e-4517-beda-f86b375c086f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lm-hP4YmMI2j9ov0nNECNWVstKe0NHo1
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a83e369 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=SJmWK-JnP90tPv7FAzsA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: lm-hP4YmMI2j9ov0nNECNWVstKe0NHo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfX923PdCccjBWZ
 E/ipOy8ohSTUjG3IzPpaR1bLNv7sTLu96iIWU1aD/u21FNvii0xbX5ojgu1DywrQG9jmRiZP8yN
 LQwjpUe5NsxsZbwpwZjz1OHoPxJbNbhh8afCQNkeoJIBGgDSjlFb9EhL+XYB11MHCCrH/wr2yGZ
 HOqUszMHJYe7DKwK4FkL5OeiVjl6QxKbVHyiRglh3qPpzKGomyF6VBnfNU4YcioKLL4z4zf8Ghp
 4N1CjlLVCcxVS9hAhlfri0QRgbpQCX2QcVT5BuoYACF7W3VfUiVHWx4Z1GQ1m78mlsU+/LnqE+x
 2If1TVGx9jnoIw7OhHY94DxpVkumdtK/LWdh6PXfXx88AFXre8P6WNXQY5ZBW6XgcujUoYDOtm1
 nGRiIvIDGUR2CZX3wT6QJnc/Lr4LbhQuqTb0Xs9wBqCQVRU8dnuzSPd9GfmVySth8CTJtq2oykp
 3eXYPl9N1YP+uhDzcOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfX0kTv+X5UFOPz
 zpmGrskujUK6uDd1LNOItIPL4Ga5eZMiTkVVUG1kj+lkkl79plX4dVywaacfMEGBOm5RqmNkDiW
 ijAzc1kiLHHolpXsdvzTiRILvSN42G8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180032

On Tue, Aug 18, 2026 at 10:10:16AM +0530, Ekansh Gupta wrote:
> On 17-08-2026 12:28, Dmitry Baryshkov wrote:
> > On Mon, Aug 17, 2026 at 10:17:43AM +0530, Ekansh Gupta wrote:
> >> Introduce DRM_IOCTL_QDA_QUERY, a query IOCTL that lets user-space
> >> retrieve information about the DSP a given /dev/accel/accel* node
> >> represents.
> >>
> >> The IOCTL takes a query_type selector as input, so it can be extended
> >> to return additional parameters (capabilities, attributes) in the
> >> future without adding new IOCTLs: drm_ioctl() zero-extends the argument
> >> structure, so new fields can be appended to struct drm_qda_query as
> >> long as they go at the end. The first supported query,
> >> QDA_QUERY_DSP_NAME, returns the DSP domain name (e.g. "cdsp", "adsp").
> >>
> >> The UAPI header include/uapi/drm/qda_accel.h defines the command number,
> >> the DRM_IOWR IOCTL definition, the query_type values, and struct
> >> drm_qda_query. It follows the standard DRM UAPI conventions: fixed-width
> >> types, a C++ extern "C" guard, and GPL-2.0-only WITH Linux-syscall-note
> >> licensing.
> >>
> >> qda_ioctl_query() validates the reserved pad field, dispatches on
> >> query_type, and copies the DSP name from qda_dev.dsp_name into the
> >> user-supplied buffer with strscpy(). Unknown query types are rejected
> >> with -EINVAL.
> >>
> >> qda_drv.c registers the qda_ioctls[] table with the drm_driver so the
> >> DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> > 


> >> + */
> >> +#define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
> >> +					 struct drm_qda_query)
> >> +
> >> +/* Query type definitions for drm_qda_query */
> >> +#define QDA_QUERY_DSP_NAME	1
> > 
> > Why is it necessary for the userspace?
> Currently the requirement is that on systems with multiple DSP domains,
> each is exposed as a separate /dev/accel/accelN node, the library must
> query the domain name to select the correct DSP to offload to and use
> other dependencies like shell etc.

Commit message.


-- 
With best wishes
Dmitry
