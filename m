Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B532E73E
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749634; cv=none; b=l7N0exPJ2yCi2vQYkRZ+QzwRCSViiVzl3WVw58sXGOnSvcGwHGoO5Tg6f7CW+Zs7HDqPVoxO0Tz4FA8tl0Y3vHFKVIwzYmGdOcxBTHSU6QX6aASZaagj+mzJOy5sPdK8yFJG/arI7XSAr3bizLAd5z3/DqO059pjzwfFQY/EyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749634; c=relaxed/simple;
	bh=LiZoxw5u7OkTtmxFcQ5+LUeZikX3PH8TbD4TDRPPn34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQY1OxqK5oe2qSGthKCULhMTHOO45Hoep918iv+owDlYH+7CRJTnBGQl4tTkp2I/awDmcrCcPER8g+OUFu5rdCS0a+8nO2+gcnRpFJK7B+nnj8fNHAX8fjLEHHBmjN2msBn3T4SFuf2xAwVnqlSXi+E1VSKTuTRk7Ql+Dh4CN4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVbTFTRA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOjjVypL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVbTFTRA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOjjVypL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCIXr882134
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 13:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8ZCL6UB+xi0N5gctLw16/d9ULv3ZvLsxlJFre/dyo4=; b=cVbTFTRA/0lJJsRz
	1IV7KZRvSOcP707QMxiFBDWZD+bzVxbypuiePC1uTTRkmKqETUDEwn9XxGilb6pY
	nRuU9fKpMbKGrcjVsVzzh643jTiVHuUF16XEVgFG4M94fzO4W6GBwUnRmEhruP0w
	PZtGHsyaaFb15Pd8eG1wAoQa8Mj162q4fAXkPWdGWNIbNJXYfT7HDSkKPq5REeDD
	yhFKk8BUoueF/HzJ9yKMbqs+3FAjLLq8jJMx5yqfj7auX0FamTYxWUHuusLNwd4+
	b3b7eFpusiLHNVzlA6RQFl3DBqwbkLpvjIhmoDRvwt5aEX6drirvxoQp6ujPpWhC
	EHsyFQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k28b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 13:07:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e375d9736so903845b3a.2
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 06:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749631; x=1788354431; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8ZCL6UB+xi0N5gctLw16/d9ULv3ZvLsxlJFre/dyo4=;
        b=hOjjVypLftyKXKaRRjkE/kSvr99hNBf62mDFvHNAisI75vnK0LHPDG24AF5p4BzXS4
         Z1RkIkpiR92BWQrmwX7UpwzJ92tKSZnQNhvSMUpHUie4rhs/+Q7nC4AdasxS+EjaDXFF
         A9A21nrnb0+dpxQjS6QUiGXDZC6iwQoVqH/gnn/VDbTrAf30s215uaOItAi1O5q9k3FB
         a02aYfSz223aheltzPJRpp0GurbXMOj+LV86BXGKWWVczstkX30rMYtaJXHIGnSNd1Zu
         OhbyIfOLEekqKyQY/9YxpvTNdGLgmA5ql25Ml1otfDkOJ8ncXTP5OYOl6NrlEjHKF1dM
         6+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749631; x=1788354431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8ZCL6UB+xi0N5gctLw16/d9ULv3ZvLsxlJFre/dyo4=;
        b=d+843VuMhdE13NRmGJkkx93uaXwdRZ5z/RNLYHo6+tL0TqjNomKQc5NcZS9jlDIcNX
         dZ0GcDFZJIDh05kqhdszbLs2GECVN9RVmw8VFQbZ9+4UF4Wu3xUsuNSjZqMNVBLCN2AV
         uGBJ/6ocv4LyedSO7prQxr8v5Tcxu1g9Oh30jOnHjO1erpYATTacg07xI1rnNe8AABzz
         h3bNxxlane0OqiRM9H+m2G1tBjN+0BYSdFV8APD0SjPKMOChqHlYytygNXiFeHvJdaQ6
         Tv3EivHsoOsWzQZP3eCYNhCJo3VoxZE9Xj/ug7/VCRYtWXlTdkDEdOb4SjT40Fr1qbd8
         99wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpos9ao1xklPLJ+0L487QM3kC72foKl+FPLogaUJMGCBp4nJ7H2zpLteny3CluFwci1GVXx@lists.linux.dev
X-Gm-Message-State: AFuF++mj0wkeEf6Wom3qOHnfgOWjdQfh6zwpTeM28jyxmLFIINQf89aB
	BTIWkwO9eAHcOPNtOTspO+dLQrjFwi2yj0aQIbKP/U56j99bxZdSrPgfAbru3GO2y4tLXacUM86
	AH5/GYxFehzp1IweKLwqp6+yz8nPUYyhroHXJRg9b/RyICd0CSHhXkheI
X-Gm-Gg: AR+sD13FLWrp4Nc+dL6Y0lhqEwtoceCt5jvAREdwMZZSrMzmGZPIRbP6HK2QQXWrw82
	rVgadNeXLiBqs/p01owfR3Hv/1RtjfMRo8Et78eJzvb735FhcSq9RD4MJIu2ecTABxaVftEfug1
	WzDmXhLm747UMqWZJjp9x4tb1bTvOIrt1PVroHrhHXcvCcu1nhwD4N/lW4yR7dhB9bpHqd6H0YF
	XFoSebh+Xyb4ENxNW83t51SY9vrKW8lRlRbBTfKaW3DRZENfCxA01ypRoXjoA6P3X4rhVri4lHr
	1NbASc+8EwN/yeXyUyfS92xk8pRAp4iO2gLfuahFKgbObEyj3DysMEh0LRwA2lgmeCw/XScVIV0
	8pGQBd9cOzgaY32N+cVTB/LDOfAh3tw==
X-Received: by 2002:a05:6a00:c96:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-85372ea6666mr12573092b3a.1.1787749630924;
        Wed, 26 Aug 2026 06:07:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:c96:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-85372ea6666mr12572918b3a.1.1787749630363;
        Wed, 26 Aug 2026 06:07:10 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85359cdfeebsm917003b3a.4.2026.08.26.06.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:07:09 -0700 (PDT)
Message-ID: <23e31249-cce2-421e-88f7-1a2af66e34b6@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:37:00 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: rob.clark@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
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
        linaro-mm-sig@lists.linaro.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org>
 <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
 <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
 <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
 <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
 <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
 <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ee4ff cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=HVFQHpX-XFYh-alqn_4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX+y9UeMh6uB8d
 L34K1QFV7FXfb3U3TaxD4qqkVhfxXHNncSlCfsX97muKWGhAO4P3/RSzuQOMspZErx20NMYXtYC
 MVwIDeNo/Zn4ytWb5Yjfin23tdxeZKM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX8Qo/zs9I1EQt
 z0JCxp26xZGcOttgTTVsq+e12RFEH8Mg85ssN2TYfBqVWzvc0c3ScWkamPT128Wl9/Qxb2uubtX
 rfQRbDnw58G/0GpuMPb4j8ZAWgA3m1PxDVzwmw27917xRzPemstjMvYkfPaiXiuMClnbwatvQ/K
 Y9KVR2akMWQAPjfLowm4dX1DpvQwYQkBAvJHOqirvCBlQo73RdTuLDaWZTHZnrYC5TUQfeYTF0n
 +19YDaZwwfPExD16thKuQgIWiaJ5wTaM5XKDMZYxgG1fjL5l/FBYlU51+7kwnhquJbmfkxb0mgl
 6OcmlJBGZYECZxmYDRO/mirTFoc+MaEGAFUJUrDSvPnuwun+gyvJ01qsaWfEVy+Xa9VuswDqvbr
 HHkXnrbup/ow65olRBHZ2C8vgMdnnvk/w1LQwqjrfku21aQbOuAddwWJY7ULtidJhv5C7++bbIv
 XK/VN0jJg8DeFu6E6rQ==
X-Proofpoint-ORIG-GUID: f7_iHl-90hmaO2NzcCDDXMT6MgSvQ3_y
X-Proofpoint-GUID: f7_iHl-90hmaO2NzcCDDXMT6MgSvQ3_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260108

On 20-08-2026 20:17, Rob Clark wrote:
> On Wed, Aug 19, 2026 at 11:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 19/08/2026 17:48, Rob Clark wrote:
>>> On Wed, Aug 19, 2026 at 8:27 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> The rule of usptream development is that we do not accept duplicated
>>>> code, just because a vendor wants to write something new. This is
>>>> basically the concept applied all over the drivers tree, where we pushed
>>>> back against all sorts of duplications all over the vendors.
>>>>
>>>> What I miss in this thread is why would there be any exception here. We
>>>> do not grant exceptions from standard practices on "I want" reasons.
>>>
>>> I agree that we should not have duplicated drivers just for vendor
>>> lolz.  But when it comes to adopting common frameworks and integrating
>>> better into the ecosystem, this doesn't seem like something we should
>>> actively discourage.  I don't think this is a case of vendor lolz, but
>>
>> No one discourages it. Following standard Linux kernel practices and
>> requirements is not discouraging, do not twist the narrative here.
>> Again, it is standard upstream review telling that we do not duplicate
>> drivers. Ever, unless there is serious exception needed.
> 
> I wasn't trying to twist the narrative, just trying to come up with a
> path forward that isn't "no" or "improve existing driver", since
> neither of those gets us towards a future using common frameworks.
> 
>> I asked why there should be an exception granted? Is the reason for
>> exception following:
>> "We want to adopt common framework"
>> ?
> 
> Possibly?  But I don't think we want two drivers to be any sort of
> long term solution.  (Ie. as long as venus/iris have co-exist.)
> 
>>
>>> rather reacting to drm/accel emerging as the standard framework for
>>> this sort of driver.
>>>
>>> So how do we get from here to there?
>>
>> What is wrong with my proposal?
> 
> Maybe I missed something, my understanding was your proposal was
> "Grow/replace/improve existing driver instead of coming with a
> duplicate"..  grow or improve doesn't move us toward common
> frameworks.  Maybe "replace" is a valid option.  If there is something
> I missed, then I apologize.
> 
> Options I can think of are:
> 
> 1. Hardware cutoff.. new hw gets new driver, existing hw gets existing
>    driver
> 2. Backwards compat chardev registered by new driver, providing existing
>    UABI.  I'm not 100% sure about the feasibility/drawbacks of this..
>    AFAIU the fastrpc folks where planning a backwards compat layer in
>    userspace, so maybe it is possible.
> 3. exception?
> 
> I'd like to know what the feasibility of #2 is, since at a high level
> that sounds like the best option.  Possibly limit exposure of legacy
> UABI to existing hw so we don't get into a place of needing to extend
> the legacy UABI for new hw?
> 
> But #1 sounds like a non-controversial place to start regardless.
> Possibly with #2 coming as followup and necessary step before eventual
> migration to new driver for existing hw?
> 
> Even if we start with #2, how do we handle first-merge-window
> bugs/regressions without reverting addition of new driver and removal
> of old?  It seems like we'd need a window of a couple release cycles
> where both drivers exist?
> 
> Maybe others have other/better options in mind?
To all, I'm seeking on the approach I should follow to go ahead here. I
can work on implementing #1(as per Rob's list) with hw specific
compatible for v4 if it's acceptable.

#2(compat driver) is something that we are still exploring as we
couldn't find any standard way to achieve it. We might start a separate
discussion for that once we have few possible designs with us.

Happy to take any other suggestion also.>
> BR,
> -R

