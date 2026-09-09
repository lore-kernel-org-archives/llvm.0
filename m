Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9E35200F
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940430; cv=none; b=kEc6m3acavL1Ajgo0F9+1Junf+LaU454ZrD0c0+B3S36FvHaSEku6Sp9kQgVQM5187p1R0PaOL5zJv0p8S0//98rSsz9d2Wl61D80KGHZN7PICTRwU68cwpeXtBpTCS1wPd0OSJMG8BmairO7fhMde/Z5JsjYoRgo6+piDdg4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940430; c=relaxed/simple;
	bh=MjEa1mE5Ps6Q3lUg66pSiS+PNEddq3EUs4UY8dMBW3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8RgLqzdqNuc1XO/dOp1oVSglFJEvYIsM0C9JyaT/XehPIagZnEadPbq0MvtWCzvmPvBTnR4i/fXPrrWTLXa130XfU7o2+t9uGaIN21erHR5owuqn02Qh2g8EbDiwsUmIiabrrkFcrEes15lFIBVZ93yKFfnXaVNyw8DCSurKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awEjX0iD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrAKrUWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awEjX0iD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrAKrUWM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893p8sh3771444
	for <llvm@lists.linux.dev>; Wed, 9 Sep 2026 07:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fTXYHOV3KBPJQ32Zh91Zlf5yN7Iu2qtX163LKYkR9as=; b=awEjX0iD51BjJkE8
	LwNHHPSHht3oE1KO7F9cPjyuUZ/ZZ3WfSUWKrd3Zueupcsj3uUeQydE5y2DJ+y55
	KJUggAzPHNiQU8Qjenkh1pO8F09rxk/riqCs8XLOXT46iowckp7LijOmp6m2gqu+
	BB/aoXDDfd2OPM5zhwv6juBu2zBS5OC4kVGE7LMzPz0o6Hit791NO2SkI5WnnhsX
	NZj3c+gT+PqNxh75knGC0+0yKyq5vba/qmsWUdSy3Bi3hlmVZzluIpR7qzIdf8Ci
	Z0L7C7CkubJVGNqD4V3kNVSjvQLGCq/cdH8B9ZundNT6skwxpTgizWrVsByKW1k3
	fIBT4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr0vn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 07:53:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso2809276a91.0
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 00:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788940427; x=1789545227; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTXYHOV3KBPJQ32Zh91Zlf5yN7Iu2qtX163LKYkR9as=;
        b=XrAKrUWMNm2HAOhnBPEmkQu8lO7LWRmqauXJLkoY/yAWKWaTPWTiA8OYhKSFHkHhA3
         NCiWt3kCdhx/V2QqBQoQrr6zbSW/ipAKnDGRMNez8+DoyPOlGEwopVah5iZLdI3I1MLW
         bdyncqCC0aPAyZtzAsNrVDQNmi8RZJ6lT1ddHDkxm7VrAGc4PcnIsmcrwSV53ZhXsgkC
         dCZ9UwJX+kWE0xGJ0tN6bkNg82NhXUyM7qCL37XPhjYLBm25CkudDxr3b0oYkFXY3ebU
         BBhOCvhcC0dRhzjrSl09AU/yavXoe7yxmdUBrYMPczssO22l7BRsOL4NIgGoiMfcprUu
         o1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940427; x=1789545227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTXYHOV3KBPJQ32Zh91Zlf5yN7Iu2qtX163LKYkR9as=;
        b=jTtATm570U80NLXNfWwGM4x3vi3Y/q/jfQpJZEGnf8adni1nxY9SZujyKeCXZMQEVO
         +EK3tGm4Xs8YDZOFiqkG1nd91iWw8UIQnXcCZlodXoSd212xX/7o9C+ITRIsRVgO83nQ
         LvDRTJmPpOUgvk2N2OZTTTqDPXEYVQ/9fEHjmnBfMOOnyI82/S5o1WWIdm5pqTmV9LjZ
         MG9gNUXxLfTce4EBRplIzCqos1QsIZ7I+8WkBRJ3hE2rj3aCgC6RW6/9heWbdyFEiZIf
         W+Ejb3JKJm4GI8Z0qKtt0+YkyJzFV2GxAK6JWIHAQEUL4KPaJVyXopIZyb/HK8llRsM8
         g9ig==
X-Forwarded-Encrypted: i=1; AKwUvBxPijxRYE8CBaNin0etNfHl6O407+F13jvLOSDo8gx6Yi8d9o/6K5O47pZJibdPIKSI844J@lists.linux.dev
X-Gm-Message-State: AFuF++lhy1IHUO5hK+eHgL5HOmw1g2dPEyLiYW4Jfkt4xFtrhw0E49Nn
	HooiW6I3zWOh/dCpPql/+SIA16kE6DGInncPamTUzq9OE37R9QN4gZqZhRJWRduuh8FYmWbzs3K
	j00R4VD2s/l/MKB4TsLgrV/4zMaMKgGFzQNKyBeAl24yoeR9S8qkQnyJn
X-Gm-Gg: AYBFou1VI3nn2sf0WY4ysDARBpmi9dJqU/NMHqHHegb5AAA/m9Ho7RmgLAH3HHGFNJp
	YVYWVdMBd29jQI7m0/QVMAt+lwSqXbhJLx20POAFVsxFZ5U6rEX/cc2IEfhgNUrDNEztcY4Uctp
	BupCHpcKDawq3JwZTjcTFIITL6zFERW4DnJU0Fmp5ySvRtlLj4zWrst2VmL52H+XoFiBb6Djv4z
	8tu9wQr6wlz1/7Lm/atVI2WoWpqq9FFdiotgVlaxurvNYKXehq6Znq/WXxtQEBe+7sRfsyQZkEI
	kgYPPqerfuPEbpseCMv1ot66+zYMoomivJzKF8gQYuGnvNgbYFzRNSfrl/t8XwB1CTAJBspzM/C
	n+vMclPfLa5/6S9tyM8fHS7RnLSKTzg==
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr52084947a91.17.1788940426983;
        Wed, 09 Sep 2026 00:53:46 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr52084889a91.17.1788940426365;
        Wed, 09 Sep 2026 00:53:46 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm65319126c88.4.2026.09.09.00.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:53:45 -0700 (PDT)
Message-ID: <09f62d84-18ad-4d7a-ad18-9abccfd5e508@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:23:34 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: rob.clark@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
References: <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
 <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
 <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
 <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
 <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
 <23e31249-cce2-421e-88f7-1a2af66e34b6@oss.qualcomm.com>
 <aqCKgM1yCbWjFdgO@baldur>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <aqCKgM1yCbWjFdgO@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa1108c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=ZGy5um1dRlDb5ydww_EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4NyBTYWx0ZWRfXziJXTDVBB1jr
 OsljJKc1knZLe90NjAWlF7O0i0ajoV40w376sakwr8VOlQkJK+LzIhxyUWAlq67+zuqyL7mhY+3
 sRPWmEIr+RUf3mXc11serr9gRVUHR3iFwGUHJYwouZgokXKUoPdvzWE1vid3XJXxOVqTIpeyoXs
 v8tPC4ldNNDPigXO3vdixqCf+Lc0vjMF3tdCpmQMg2zUktQGiuRwAxYyd9weGGJBIeJLQDSZ22p
 6g7jrZp0lfQWBq3JUq3s/KMvEAq6za88SUjsEvTne5wj8Sd5VcBzuNIsMokxy8SLPLUTkz3vKiD
 P1I7l8+rNqNAbBEMKS8NMkhoEo+rTlierB1PCzSa7d64MfDDKdJjjNdjWhHMEeKN2L28TiiRcgd
 SAgNk1YvwmtXQrVPlSDqA2oYy6OnSml7kzgp5fUW/VEt1yBmSoCcA8lv4k2X9qmKAqbGRsVMPID
 oN0j548NNDHuJKZpmkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4NyBTYWx0ZWRfX1v9jpIkyFnby
 Wp+K+rWIqQiCnDCDsVmk2M9oXOqsydQ81aZtZ5DnGuKolvb0ClCAa39+oCkBZmI1JVL/pnsH0WV
 l5Iv3VvYZ9vBxdP7RvGNcOcLXHvr9Zk=
X-Proofpoint-ORIG-GUID: gQ5YNeo1MQQpDMRMOrzqQ9D2CzTLdCSq
X-Proofpoint-GUID: gQ5YNeo1MQQpDMRMOrzqQ9D2CzTLdCSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090087

On 09-09-2026 04:14, Bjorn Andersson wrote:
> On Wed, Aug 26, 2026 at 06:37:00PM +0530, Ekansh Gupta wrote:
>> On 20-08-2026 20:17, Rob Clark wrote:
>>> On Wed, Aug 19, 2026 at 11:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 19/08/2026 17:48, Rob Clark wrote:
>>>>> On Wed, Aug 19, 2026 at 8:27 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>> The rule of usptream development is that we do not accept duplicated
>>>>>> code, just because a vendor wants to write something new. This is
>>>>>> basically the concept applied all over the drivers tree, where we pushed
>>>>>> back against all sorts of duplications all over the vendors.
>>>>>>
>>>>>> What I miss in this thread is why would there be any exception here. We
>>>>>> do not grant exceptions from standard practices on "I want" reasons.
>>>>>
>>>>> I agree that we should not have duplicated drivers just for vendor
>>>>> lolz.  But when it comes to adopting common frameworks and integrating
>>>>> better into the ecosystem, this doesn't seem like something we should
>>>>> actively discourage.  I don't think this is a case of vendor lolz, but
>>>>
>>>> No one discourages it. Following standard Linux kernel practices and
>>>> requirements is not discouraging, do not twist the narrative here.
>>>> Again, it is standard upstream review telling that we do not duplicate
>>>> drivers. Ever, unless there is serious exception needed.
>>>
>>> I wasn't trying to twist the narrative, just trying to come up with a
>>> path forward that isn't "no" or "improve existing driver", since
>>> neither of those gets us towards a future using common frameworks.
>>>
>>>> I asked why there should be an exception granted? Is the reason for
>>>> exception following:
>>>> "We want to adopt common framework"
>>>> ?
>>>
>>> Possibly?  But I don't think we want two drivers to be any sort of
>>> long term solution.  (Ie. as long as venus/iris have co-exist.)
>>>
>>>>
>>>>> rather reacting to drm/accel emerging as the standard framework for
>>>>> this sort of driver.
>>>>>
>>>>> So how do we get from here to there?
>>>>
>>>> What is wrong with my proposal?
>>>
>>> Maybe I missed something, my understanding was your proposal was
>>> "Grow/replace/improve existing driver instead of coming with a
>>> duplicate"..  grow or improve doesn't move us toward common
>>> frameworks.  Maybe "replace" is a valid option.  If there is something
>>> I missed, then I apologize.
>>>
>>> Options I can think of are:
>>>
>>> 1. Hardware cutoff.. new hw gets new driver, existing hw gets existing
>>>    driver
>>> 2. Backwards compat chardev registered by new driver, providing existing
>>>    UABI.  I'm not 100% sure about the feasibility/drawbacks of this..
>>>    AFAIU the fastrpc folks where planning a backwards compat layer in
>>>    userspace, so maybe it is possible.
>>> 3. exception?
>>>
>>> I'd like to know what the feasibility of #2 is, since at a high level
>>> that sounds like the best option.  Possibly limit exposure of legacy
>>> UABI to existing hw so we don't get into a place of needing to extend
>>> the legacy UABI for new hw?
>>>
>>> But #1 sounds like a non-controversial place to start regardless.
>>> Possibly with #2 coming as followup and necessary step before eventual
>>> migration to new driver for existing hw?
>>>
>>> Even if we start with #2, how do we handle first-merge-window
>>> bugs/regressions without reverting addition of new driver and removal
>>> of old?  It seems like we'd need a window of a couple release cycles
>>> where both drivers exist?
>>>
>>> Maybe others have other/better options in mind?
>> To all, I'm seeking on the approach I should follow to go ahead here. I
>> can work on implementing #1(as per Rob's list) with hw specific
>> compatible for v4 if it's acceptable.
>>
> 
> I don't see any reason for you to define a "hw specific compatible",
> because as you have shown in this series (and as Rob point out), there's
> no difference in the "hardware".
> 
> The only reason for your "hw specific compatible" is to make a software
> selection in Linux - and that's not what DeviceTree is for.
> 
> 
> As such, I don't see that you have a DeviceTree problem at all, because
> this is a Linux-internal problem.

Agreed.

> 
>> #2(compat driver) is something that we are still exploring as we
>> couldn't find any standard way to achieve it. We might start a separate
>> discussion for that once we have few possible designs with us.
>>
> 
> This is the actual problem!
> 
> We have existing user space that depends on the ioctl interface exposed
> by the current misc driver. You must not break these.
> 
> Hardware cutoff is not a viable solution, because that's just a
> declaration that we'll let the old platforms rotten - or alternatively
> you commit to maintain two drivers to the very same feature and quality
> level.
> 
> So the only reasonable solution is #2; from there it's a valid question
> if you reach that point my stepwise migrating the current misc driver
> that solution, or if you present a new driver with the fully backwards
> compatible interface, alongside the new ABI.
> 
> 
> But this does bring to a question which the cover letter should explain
> - but doesn't: what problem does this patch series actually solve?
> 
> Regards,
> Bjorn

Agreed. I'll target #2: QDA implementing the existing fastrpc UABI
alongside the new one, rather than a driver split by platform.

On how to get there: the blocker we hit in v1 was that legacy fastrpc
buffer semantics appeared to need a drm_file, and there's no exported
way to construct one outside the DRM core. I want to re-examine that
constraint rather than treat it as final, since the legacy interface's
own buffer model (a dma_buf fd as the buffer identity, no GEM
involved) is not inherently tied to drm_file, that's how the existing
misc driver implements it today. I don't have a concrete design yet
and would rather work through it here than commit to one prematurely.
If anyone has thoughts on how the legacy UABI could be served without
requiring a drm_file per session or if I can somehow bind drm_file with
chardev by exposing some APIs from DRM core, I'd welcome them.

On the cover letter: fair point, and I'll fix it. The problem this
series solves is that a miscdevice interface requires us to hand-roll
what the accel/DRM subsystem already provides as common
infrastructure: GEM for buffer lifecycle and reference counting,
PRIME for cross-driver import/export, per-file (per-open) context and
handle-namespace isolation, and the existing debug and lifecycle
tooling the DRM core already ships. Every accelerator driver added to
drivers/accel (habanalabs, ivpu, qaic, rocket) has taken this path for
the same reason, rather than each maintaining its own equivalent
inside drivers/misc. Building QDA directly on this shared
infrastructure, instead of extending fastrpc's own ad hoc buffer and
session tracking to cover the same ground, avoids that duplication
going forward.

I'll put this plainly in the cover letter rather than leaving it
implicit.

/Ekansh

> 
>> Happy to take any other suggestion also.>
>>> BR,
>>> -R
>>
>>

