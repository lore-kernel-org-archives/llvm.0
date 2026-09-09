Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D28526AB9
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954504; cv=none; b=RMdvzXlsC6ij2/ga3qd8XxdAXwuUOEgXsOaxCpVjk58N6+fhBlZYIPXy8ibxQ4WDKDXqZeZMAHDdvYGPwcfE04mKcqvLj/GHAd0vnIYkUF/p4Aip0vuSHjTivxmuR4iGJnFqBajDkra/2Qmm5Wgfxi4HWY9O6jE8his3OH/8NOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954504; c=relaxed/simple;
	bh=dLJlSF3ZBqSGM+EH98xrjrLEEm52J5wKUkimSUCNjCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oU9ff0Btzomb5dNKOuFKS3LYPVJdV3q6P0h31u0Q/cRQhXcgFWg+CFxjsWhXj4bAke45jzBe0YDe+qTeAWHLQ6gFq0INb2xKdBWs7gJghUubVoJP0bdpi5xHCdrR02dTORxuo949dBDD6nqcd7lGeseLZnUTX9EKITGJ9HGt96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOlwnT6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsF2E/ir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOlwnT6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsF2E/ir"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7E12959455
	for <llvm@lists.linux.dev>; Wed, 9 Sep 2026 11:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z/IzRDyDMUb5WeBWrbeDr4JRHgfSmmkXO35ZSpjMdXg=; b=SOlwnT6agTOsVW4a
	mefURN9OqRc+Ls8K8x487MHwuXzShNHtwFaEVgGsTN/jth+bPnCedNHIu0veEYR8
	fUtqPfTYzAFgWcYIbB0CMoNQf/Ep+b1MjM7q5PXLpKZZ3wbTRqXZsU2WmK3Th6ev
	tlojy6786k04j4VEEi9OXbkpV8HlBNsOt0ALkZlSwlfHCBN4GscTKtY78i9QU4Ub
	hhkZHHd8nzNhZ2LbAuXxjOw3Uzbgx16p4YDcrgEqE7tI+jsj4wHKyIc1WvbspENN
	ULFor86m/7DoGRrVDSSdZ+Ei2kjN+B19bIvEhivc5wdgWCes+FkBXRL3K3xY6dn8
	k7bVrw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw3wq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 11:48:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb2f3c6f7so479112241.2
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 04:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954501; x=1789559301; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/IzRDyDMUb5WeBWrbeDr4JRHgfSmmkXO35ZSpjMdXg=;
        b=WsF2E/irwy3oBIAr9UbEKGQWwr65jy4vCBrL9KIfn8OemR/R+UvxeXP5pPkuQn6v2b
         oEWJxZOypuIAMLQl2dWv/H4XG4cMpriWwyHTAiqKYIh2jGk9Q/AAm3WkV/tFyI+5OHTD
         +Kjw7CmS3FCWQxanm8QW2UEfkzqguwvJsV7hNIVZxsFyKWz0oK5eR48eEAt4ZFUB5XT4
         IjW2U+vBYM4QIR4E4h0z2tL4MGDhRG8WeP8P9yd6cinQrNqcq1vTNQD0akTOnlDkTEtc
         lsph8a1pCsLC24OpnTigrGAe/pUl2AqKf2b7qUNYKbCRxgjAE1Fud5Bdi5WnvWwxpupL
         QpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954501; x=1789559301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z/IzRDyDMUb5WeBWrbeDr4JRHgfSmmkXO35ZSpjMdXg=;
        b=I9JF9S1FW0aNEBjti33wW00ODBh40kLfP2LtmpAwA6Vyge3IGGnqeFpQDRXulqzj2P
         viLBtJ46qhJXsQ/+hGubc+0FP1irtr/4Hg2QmkZkiGqP9r2qkhowktCfihLLMMGbm+XZ
         7Ykv+Sbh41xy8rrQ99KZEtWrorPe8Q8k+idt+O2SAL8aKEK9sWVBXi6lXlJODHhIhpeA
         VHVIbq1fGPc/JyGZrJjOc81ZcNHxMlpsbrjFrPsOg8m5+e1Wr35uN5fgzrvasS6hyh1A
         apjIXOnJ2tgkB+ZdFxht1v5cuZZBq4a7N7z7PgV9j4qZButC1rqgefCcMAQScztfVeoJ
         AYAQ==
X-Forwarded-Encrypted: i=1; AKwUvBynfdGHmJsK6WrUnXGEMNpGwfCKG4tiTOXgMt+z05XHLUMty/aUWyWl9/kF0bdVdqQlCfEm@lists.linux.dev
X-Gm-Message-State: AFuF++kNqlufymEgCCf5f/wFcNjHupFx6LQKt1ZyLL+L7NW/eRXkG/0Y
	+rERgzq51uLaYGCKQrZ/cLNjRlBGwL4gRgb9X7GpcQ4EKLgCcyYKQe6ykO0AtPK04MS/4LdekpK
	fgHvn5SXPDscYfuwKqeRb9X5rO4dfzvQBvQ/AgwXqY6QsxstrCreeUse0
X-Gm-Gg: AYBFou1sTcqHv3nO8zEfZaUyuEfnGR3/OgDfwMD/LY5x3bKAtMWLPH9Xuoda6MW+BAy
	2FWlG8CgW4bdQPG4WRRkrfknayPJiUDYmMV/uFnlVGQhQ1FU/X/a7mg+i4r99/mDsUW7oSKS93I
	kQfoQVuq1Znhe6Vd8htPB3OAItIH2bztuvAm5wSmVINjmDOAEGAL+IhaV/Aubd7yp2EaNYRm2B+
	lsGlai+ol36yAXt97EhSyOmjUXMS5XgqELW4lRBu4vsLKog20Gz5sRN8xD0A5LZC8uL+qvb/n0e
	iuLBfQGKDBAAbdAq9dZ12mQx0+6UUwip4DhJtto06M0a+DJg4LQl3nGaijbBM6LZLWLMUkKvLNi
	X/GkWBh0rYUlDSfV/sSp7TjRmQt8EjbvP6gxXIjT7VKYPuFOeeZVhbdB4N4Yskd0/ov5hEka9Zi
	7AdY42C1Mq9UuG
X-Received: by 2002:a05:6102:644c:b0:786:d33d:af15 with SMTP id ada2fe7eead31-78a4a94a067mr14441113137.6.1788954500901;
        Wed, 09 Sep 2026 04:48:20 -0700 (PDT)
X-Received: by 2002:a05:6102:644c:b0:786:d33d:af15 with SMTP id ada2fe7eead31-78a4a94a067mr14441070137.6.1788954500288;
        Wed, 09 Sep 2026 04:48:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370599810sm42910711fa.24.2026.09.09.04.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:19 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:48:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
        linaro-mm-sig@lists.linaro.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
Message-ID: <rh5ufacfap4x63rjmgd76wlwgn3n2wuelpe4sqwy4yda27nsiq@lg4ltoqwz7ba>
References: <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
 <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
 <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
 <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
 <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
 <23e31249-cce2-421e-88f7-1a2af66e34b6@oss.qualcomm.com>
 <aqCKgM1yCbWjFdgO@baldur>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqCKgM1yCbWjFdgO@baldur>
X-Proofpoint-ORIG-GUID: hIgx7xGU82eTs8UuP_OAVaXSONBwZNBZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXyOTL+uduHcQg
 hUvCBF5BLNJfo/On8wjMzDRb1pur75mlg1w8TZjUXEgRJBYCG70cDPlFf48SJrLS7AkiPjX39o7
 14jKNmVeypd8FsYKRiBKgs5zWCc7B1Y=
X-Proofpoint-GUID: hIgx7xGU82eTs8UuP_OAVaXSONBwZNBZ
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa14786 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=RNmUHPL9eSbnRv9Ut4YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX9kaD9EcWIVp9
 /K5Sh1QBnWoHnsSMOHsHxai07HGgqkEOKBR6uLuvCluuIfHE866lL5LajDQAJBl9F5bp+QyDnCN
 zundhSEyhdbeY8zSMZ2GIWxZoozRVa4+eeaxG0OzWa3hc5Dcxu2mpxa+m/5jOZC+XvTTJneM5H+
 H7sUvqcFMgdJMf1F7KQq6W3OVMQKQMYNy0CxXIPimnNjF+kXBSQ4OB2ykmL336xfSTv9TYF3jY5
 RNC2Ns6mSmqYjj0rJPihvH6orXlq45ZqEstn1QXnEerETzwVMId1FHxBpZrLQxUumki6/GBe1oi
 zgv8fio37A+H7JmrNg8YMJxDzGgrFrRODgawEHlEMSibqem7EZylNjuxYlk3Dy2TiK3r31JrJKM
 abx3y7XXhDh1l9EEskh08lcY6CT1X4NSq3SyrB0j4BXpmtpQMvIUvgPABD/ZvQyy6ZEGs8+xxTH
 T+Fxjm9K3PjbK2yXkVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On Tue, Sep 08, 2026 at 05:44:10PM -0500, Bjorn Andersson wrote:
> On Wed, Aug 26, 2026 at 06:37:00PM +0530, Ekansh Gupta wrote:
> > On 20-08-2026 20:17, Rob Clark wrote:
> > > On Wed, Aug 19, 2026 at 11:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>
> > >> On 19/08/2026 17:48, Rob Clark wrote:
> > >>> On Wed, Aug 19, 2026 at 8:27 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >>>> The rule of usptream development is that we do not accept duplicated
> > >>>> code, just because a vendor wants to write something new. This is
> > >>>> basically the concept applied all over the drivers tree, where we pushed
> > >>>> back against all sorts of duplications all over the vendors.
> > >>>>
> > >>>> What I miss in this thread is why would there be any exception here. We
> > >>>> do not grant exceptions from standard practices on "I want" reasons.
> > >>>
> > >>> I agree that we should not have duplicated drivers just for vendor
> > >>> lolz.  But when it comes to adopting common frameworks and integrating
> > >>> better into the ecosystem, this doesn't seem like something we should
> > >>> actively discourage.  I don't think this is a case of vendor lolz, but
> > >>
> > >> No one discourages it. Following standard Linux kernel practices and
> > >> requirements is not discouraging, do not twist the narrative here.
> > >> Again, it is standard upstream review telling that we do not duplicate
> > >> drivers. Ever, unless there is serious exception needed.
> > > 
> > > I wasn't trying to twist the narrative, just trying to come up with a
> > > path forward that isn't "no" or "improve existing driver", since
> > > neither of those gets us towards a future using common frameworks.
> > > 
> > >> I asked why there should be an exception granted? Is the reason for
> > >> exception following:
> > >> "We want to adopt common framework"
> > >> ?
> > > 
> > > Possibly?  But I don't think we want two drivers to be any sort of
> > > long term solution.  (Ie. as long as venus/iris have co-exist.)
> > > 
> > >>
> > >>> rather reacting to drm/accel emerging as the standard framework for
> > >>> this sort of driver.
> > >>>
> > >>> So how do we get from here to there?
> > >>
> > >> What is wrong with my proposal?
> > > 
> > > Maybe I missed something, my understanding was your proposal was
> > > "Grow/replace/improve existing driver instead of coming with a
> > > duplicate"..  grow or improve doesn't move us toward common
> > > frameworks.  Maybe "replace" is a valid option.  If there is something
> > > I missed, then I apologize.
> > > 
> > > Options I can think of are:
> > > 
> > > 1. Hardware cutoff.. new hw gets new driver, existing hw gets existing
> > >    driver
> > > 2. Backwards compat chardev registered by new driver, providing existing
> > >    UABI.  I'm not 100% sure about the feasibility/drawbacks of this..
> > >    AFAIU the fastrpc folks where planning a backwards compat layer in
> > >    userspace, so maybe it is possible.
> > > 3. exception?
> > > 
> > > I'd like to know what the feasibility of #2 is, since at a high level
> > > that sounds like the best option.  Possibly limit exposure of legacy
> > > UABI to existing hw so we don't get into a place of needing to extend
> > > the legacy UABI for new hw?
> > > 
> > > But #1 sounds like a non-controversial place to start regardless.
> > > Possibly with #2 coming as followup and necessary step before eventual
> > > migration to new driver for existing hw?
> > > 
> > > Even if we start with #2, how do we handle first-merge-window
> > > bugs/regressions without reverting addition of new driver and removal
> > > of old?  It seems like we'd need a window of a couple release cycles
> > > where both drivers exist?
> > > 
> > > Maybe others have other/better options in mind?
> > To all, I'm seeking on the approach I should follow to go ahead here. I
> > can work on implementing #1(as per Rob's list) with hw specific
> > compatible for v4 if it's acceptable.
> > 
> 
> I don't see any reason for you to define a "hw specific compatible",
> because as you have shown in this series (and as Rob point out), there's
> no difference in the "hardware".
> 
> The only reason for your "hw specific compatible" is to make a software
> selection in Linux - and that's not what DeviceTree is for.

That's not exactly true. There are protocol differences. For example,
polling mode is supported only since a certain timeline in the history.
Likewise other interface features are not supported on all the FastRPC
devices. For the polling mode support we were already beaten by the lack
of SoC-specific compats.

> As such, I don't see that you have a DeviceTree problem at all, because
> this is a Linux-internal problem.
> 
> > #2(compat driver) is something that we are still exploring as we
> > couldn't find any standard way to achieve it. We might start a separate
> > discussion for that once we have few possible designs with us.
> > 
> 
> This is the actual problem!
> 
> We have existing user space that depends on the ioctl interface exposed
> by the current misc driver. You must not break these.

This is clear.

> Hardware cutoff is not a viable solution, because that's just a
> declaration that we'll let the old platforms rotten - or alternatively
> you commit to maintain two drivers to the very same feature and quality
> level.
> 
> So the only reasonable solution is #2; from there it's a valid question
> if you reach that point my stepwise migrating the current misc driver
> that solution, or if you present a new driver with the fully backwards
> compatible interface, alongside the new ABI.

I think the general direction was #3 (or #2.1): implement a shim layer
on top of the QDA driver as a separate module. Put all the historical
over-complicated solutions into that shim module and let it die at some
point. Current fastrpc driver lets userspace specify buffers in several
different ways, forcing the kernel driver to perform a lot of work
with buffer addresses. I don't think that this legacy code should be a
part of the QDA. It can go to qda-fastrpc-shim, keeping it out of the
kernel memory if it's not necessary.

> But this does bring to a question which the cover letter should explain
> - but doesn't: what problem does this patch series actually solve?

I agree that it should be a part of the cover letter.

As a person who triggered this work, I can propose my reasons:

- Current driver has over-complicated memory manager (both on the
  userspace and on the kernel side). Correspondng uAPI is not really
  suitable for virtualization. Using GEM simplifies both the kernel
  driver and uAPI. Also using handle-offset-length to specify the
  buffers makes it easy to support virtual QDA devices.

- Current driver predates the accel subsystem. Using common subsystem
  simplifies reviews. The QDA driver has gotten several comments about
  the usage of the DMA-BUFs. It'not unlikely that the same issues are
  present in the current FastRPC driver, just being unnoticed.

- The ideas present in the current FastRPC driver also predate the
  current design practices. The uAPI was created in the ad-hoc way, just
  following the momentary needs. Driver code also shows the result of
  that, having enough of the spaghetti code.

Given all of that, yes, it is possible to provide an evolution of the
FastRPC driver into the accel+shim, improve the code quality meanwhile
and end up with the good enough split. However I think that the path
taken would be longer and the net result might be worse.

With all of that in mind, my suggestion is to continue working on the
QDA driver, get the core of it to integrate nicely with the accel and
DMA-BUF usage requirements and implement the (minimal?) fastrpc shim on
top of it.


-- 
With best wishes
Dmitry
