Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B93BF67A
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153004; cv=pass; b=b4FPiEc9+KDaNgHmCXgd5FWGNmaVko3ni/f+PQnsxoSlbsJk4nAELcfBkiqVVorxEI3ZG3p9qFJonS99GpvZ9uo6KRi/oD0SkKt3B398Pm9plosgw6M/kb1ijYupOXWILwJPjFmfNlo6MUpwlSzl9abLdzg1/+q6T6WJ5yNanjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153004; c=relaxed/simple;
	bh=zgrW+FnTM1DV6L5kMs4FP8rCOUdtYt8xe+26qvHuZGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJB15h/HPNAtatUspj6ERBixIHxohfsqUHxDyph5pdzJaGP0zfJE42Qt+y13iW5PHlczb3KrN/ww+MLo+kDYSCycDuy+tpbuN1BIJlOK+k7VeqE5br2eYr5GQUv5riJQfoIHp6XF63PA/+/+VCmwRaqBzJ0p99boUT9weOH6Rqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqtYERns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsc/6ZZY; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqtYERns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsc/6ZZY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF26gX3606034
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 15:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=; b=eq
	tYERnsZTS3kFgGZ+V6OYIfQSuwal+Wyf6alsTQxpOdLChbPicqOUuXLXL9yBVLVI
	DpPL8hQD+TSwk0o8IG05G4gjVuVAj19T/RyMlhPzZbqqBkVYB8y5x0mvZZim1dON
	idZbReCveIfOKPoQSCJrzVNApr4H2re1dYjZjPK6cXbayggYeOpiBcniVOe8aStj
	ldhZb7RZiklrnboO0MquBUxcpdDAnR3aFOnL/HzIXssMdY8hn9AkeH6xDVR4tofX
	rYW5hyrLveNflJWVikkwx62Dd90MdJmAlFQG53w/5Rw6/T5k++Ln0+TyhdZxnNsM
	JzA/VA+0/v6s5OPvt43w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esar3kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 15:23:20 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48e5de5a23cso1336512b6e.0
        for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 08:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787153000; cv=none;
        d=google.com; s=arc-20260327;
        b=deusoZiaa0FNYptlfb0vYPtB/iEXkBQyvsqpi33hb0gcA6MmjV164n2NYWINKEHe8p
         0FLR+mEoxuww4A0+pLka5OSUuKJKmk7IGzebD0J3y4I6KWPhvfb9qrbxGrn0uQS3eTdc
         RyiPyL0R774LwvP+roVe0vvGd2aRM0IuSPhYrkaUCoXgTzGbBOLrzmAnPH8JsKGemJPH
         rEyWJQzUTy3shbqmm6GyY1qj9D15AKTwMyltR+uuFr9rCHMxvG17PPgCBhLM8wxB8arB
         qs4peDgmHgZdueQf3+C40wjIcYfjgrzWfR2zuf6XIOiF0AxnaQsoBGtZU7tl4od88NTo
         vHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        fh=fcQF5w7LjDm+shhZDXpaIvdJQ054b+TJaXap7QFE3iw=;
        b=QByMq22FFbUmagUTH745Woh6dFWdG38Znm08hsbwm3GB4iGaX1R6wMq2HxNUOvkA0F
         n2Ys7vgG8VZcXuRStcA1fJ6QdnjDKGX5Q/4uOKpBEfTxV5IPSPfiTestIak1qJIyhSQx
         fLCZLS/r3q+MwqCkJOum4EINPL9AF6fEjigwDtBfYkB0dq/6mgfD/EmeYm3yZTSFOfUr
         URWeTDEf5ZqOkGph+WHy9P0qKb/cqfaHD7f4VHxw/FNn2xtNkHSY3I7bBo73t8DGVYBx
         Fj5TeK094fPiazKEhzhhbgHAgrTbKtkgAe6LCdvW0r+MsTmC7YiBYmeEpjwXLdnz8C3I
         OjaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787153000; x=1787757800; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        b=bsc/6ZZYmc2MiMVRLvtsaQu5NDJpLayoPIIO95MeLh1xeh9axbIBlwmS35nLiEfwHG
         5Z7I/n0N/BDoNBAjCSv3JzSCRlynUoPI0ehgnn5ImoVcz8L9G+kqqMYlehU1+DQCJOpI
         2+97u1Ajx8IqGhInVhYLY2U2819q41Fj8frvDBSFgRfEIQqjyylvM8xp6bmF/WNTQUtB
         QqilW6haBg0gTHpt2i9akt1hKLmugd+4HevP9b1Kack+UMaBJLAYyXyJ4HmGTWE0W/Gg
         WBejHTQiHfYxjb0si0By1UwUmOT5d4l8BKu2J+TQaejib2velogj4ffxY97qdduP7mr9
         lLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153000; x=1787757800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBH/fUIgWYWW3/6b3lc46QqFXFbnfFKPLKLVEnp7Rdo=;
        b=shGfKy84uwMdt3demE5x6lTAAIeTb8YGTy002KoHz0WZcaw0aFPzKzoH2ateiGvpNO
         JjMs55uSV97K77curuZ63iYFXx+gxZ3YK2qm/55Gx3OYljv9KQ5uBoFPDRdtur5hbz/i
         RVzZvPBO6U47xzuNXUWkgRIocwSgkQ2Fx8LRA89bHl9d0OvPXd8hrqeNtc8OBFAWLRjD
         4V/h5TMszBoY9WqrB1pUG+jaQPBKtapvLwL2lkrhdpDgSgZ9XN1sHpEoHEIEF7QdHeNL
         lmRGmIb7j2jHCYXWOPszxpv1WG/TeXjI+eg+MJxQ4q+pi3os0iPHBDn0cLdLMZc76yEZ
         rBgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Xzrv4UoislIO9CsjBh8o0sW2e4NuHmzOLuX2LQ0KW4obhKT/xaTYY83FUEsKldYpwYqd@lists.linux.dev
X-Gm-Message-State: AOJu0YwG+Dl5oGBrttMSzloMh4v8lo1uI0sw77tj4+VkIM7KN2VNEDMM
	FI5g8Yv5mcfVp0UCH9pf2AgMBw67Zr6dkhPcAtT4R9c4i9+gQDa0BBXBWnmzMsbUWw9uoZhg39r
	RLpgzH3VyfQVKreI8ltavbemgIgo3F7gI9VGky51fZhXMOUUWLrBi2KRNGpZlShy7ELQowseJWg
	7UBTnlUj0v8AqGRFKMF5O2tSiu3AX6CZI=
X-Gm-Gg: AR+sD13Cfa55mQNWo/CVrfsbt2tWGdHK6UqAacZGzx5OYUAm4LriyoDFu2j8YQ2Ls3e
	fZXmM8LhAQ5CxNWMD3ccyQ0EGdiI7j4B+lPe7hg8m80qBUxbJH6N1Fhb0HPPaecX2okGUPxlv2T
	UQhzb7cuxXo9sbyEDrhK0KJ97Wkq6djxrnANEJDwRmeJowWwmyAc3yaSAK
X-Received: by 2002:a05:6808:1997:b0:495:eb86:6e8f with SMTP id 5614622812f47-4b2bcaa116cmr4635383b6e.14.1787152999890;
        Wed, 19 Aug 2026 08:23:19 -0700 (PDT)
X-Received: by 2002:a05:6808:1997:b0:495:eb86:6e8f with SMTP id
 5614622812f47-4b2bcaa116cmr4635236b6e.14.1787152998435; Wed, 19 Aug 2026
 08:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org> <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org> <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
In-Reply-To: <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 08:23:07 -0700
X-Gm-Features: AcwNN1WxA9fiQ0CGl4J8t7bFhD1MTRVpPgPEs_G6pBof5jMpK8zFCbjUKPrGqB0
Message-ID: <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX3De8lB95S+4L
 DZ4bLGuliLgrgWJ7p1bUuQLy4iosidjhrIkZ1kWe762YNnNzOf87Imrygd9xm+OBfJda0IzQF5e
 Iliw4+uZVCSTkO6WFvpubEJHK6vJFPk=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a85ca68 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2opUpfO7wUc-A3Q1rUYA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: F5iMUPPj6mXhSIpYBxINLym1BM1Txi2n
X-Proofpoint-GUID: F5iMUPPj6mXhSIpYBxINLym1BM1Txi2n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfXwatQBznlj5zF
 pGAppiz+7yLjNZM5/1O3fKJufIAFP4rUg4XEso9USu/q9FxbnMSgGJc49Bx1N6cWi7GDluoUlJ1
 zPCT3poyBxdxBs3LVWy4IrwvAn9KLdoL7fSiaR+1zV62g24blbvXazkR76mPk/H3lGAw0aGqjxT
 tSomEZ4SzTl9JsLnSRoBDKCv5g/s20+8ZyNP9ZWxqM/3b8gxUc75bEz5KzFC2ramgoe17/y6yVH
 jyHFPok4p2d9pUEvioEzmeobRYqPTJC//suKq23ZS2GF+HtvrGk+nBXNqkzprS4aqHPl17gXn0i
 boe5wIULUyCPMc4esvwonURZxpouNu8YEnzC8Rzlo4RE8NwKql5DLqtLiemIGokeuzbEMFJOwgq
 gJvuhl6hKP72NWaTZ+oz62fP5O0Ie7un4CSfXa+VMMEY0mV9tkiEYJhc4ep7pJcE43XKrYGOAnM
 pvlOiiJhjebtYvLX8cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

On Wed, Aug 19, 2026 at 7:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 16:49, Rob Clark wrote:
> > On Wed, Aug 19, 2026 at 7:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/08/2026 16:38, Rob Clark wrote:
> >>> On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 19/08/2026 15:26, Ekansh Gupta wrote:
> >>>>> On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >>>>>> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>>>>>> This patch series introduces the Qualcomm DSP Accelerator (QDA) d=
river,
> >>>>>>> a DRM-based accelerator driver for Qualcomm DSPs. The driver prov=
ides a
> >>>>>>> standardized interface for offloading computational tasks to DSPs=
 found
> >>>>>>> on Qualcomm SoCs, supporting all DSP domains.
> >>>>>>>
> >>>>>>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>>>>>> subsystem. It uses the same device-tree node structure as the exi=
sting
> >>>>>>> fastrpc driver in drivers/misc/. The approach for binding the QDA=
 driver
> >>>>>>> to device-tree nodes while coexisting with the fastrpc driver is =
an open
> >>>>>>> item described below.
> >>>>>>
> >>>>>> No. Grow/replace/improve existing driver instead of coming with a =
duplicate.
> >>>>>>
> >>>>>> That's a standard upstream requirement, basically given on every
> >>>>>> upstreaming guide.
> >>>>>>
> >>>>>> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!=
".
> >>>>> Posted discussion threads here[1]. Would seek comments from Dmitry,
> >>>>> Srini as well.
> >>>>>
> >>>>> [1]
> >>>>> https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@os=
s.qualcomm.com/
> >>>>
> >>>> The rest of the comments is still valid even if you did not acknowle=
dge
> >>>> them.
> >>>>
> >>>> Anyway, regarding above - again, watch the talk from Greg.
> >>>>
> >>>> You have ONE driver. Not two.
> >>>
> >>> Long term, moving to the common driver framework (which did not exist
> >>> when fastrpc was first created) seems like a good thing.  But does
> >>> that not allow for some transition period?  How can we get from here
> >>> to there without otherwise breaking userspace?  Is there some other
> >>> precedent elsewhere in other driver subsystems?
> >>
> >> Yes, Iris and Venus where we agreed for an exception (two drivers) as
> >> long as new driver supports old hardware / features.
> >>
> >> This is not the case here, right?
> >>
> >>>
> >>> I suppose drm exposing legacy fbdev on top of drm drivers is _sort of=
_
> >>> a precedent if you squint a bit?  I'm not really familiar enough to
> >>> say if that would be reasonable/possible in this case.
> >>
> >> Growing old driver does not look complicated itself. The only a bit
> >> tricky thing is to present somehow exclusive interface to user-space,
> >> like usage of one disables the second etc. Depending on actual
> >> differences in that interface.
> >>
> >> But having a duplicated driver is a clear no go and it is well known
> >> upstream requirement. Nothing new here.
> >
> > Would it be acceptable as a first step to, by default (ie. when no
> > cmdline override/etc) for the new driver to bind to new compatibles
>
> You have one compatible.
>
> > and the existing driver to old?  Ie. have both drivers but only one
> > binds on a given platform?
>
> I don't see how is it possible to write such DTS, because - repeating my
> question - how many hardware blocks is there? I believe only one per
> given DSP, so how could you have two device nodes?

Maybe I'm misunderstanding something here.. I don't see any new
bindings with this series so my assumption is that the bindings are
the same.  What I meant was something more like "qcom,glymur-fastrpc"
would bind to new driver but "qcom,fastrpc" (which seems to be what is
used on older platforms) would bind to the old driver.

So single dts node, but different compatible strings picking which
driver is used.

BR,
-R
