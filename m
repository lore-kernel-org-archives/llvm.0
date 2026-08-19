Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A53BADA5
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154530; cv=pass; b=cQpADYhgjc8PoPgTB/VoCyckI/AZ9nBdnuW9VPFpu4lTc08e0E/prnjvsBlIRZ00ifYKgqWJZQag0DamYOfn4qz9v0kWeL86hz1IEZdgrvRtSeQd85R3xh2V+ePXZf2TT3amMB+LiSHSl+hN/tOomPQ6ZMFTIhSklo+nnKLl+wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154530; c=relaxed/simple;
	bh=1xcLzj0C3qzK2ZAmV+j0EOQhBmW7Epm9ml6TC3TBUl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx6dYcqs2R59mard+auYdXHT1B8/shfzSma1J82QUhJkQ1JSJeMBhwPdaDfFVdVnjTSHufm2MTtyOTOgLvXPcatqo3j7tLoHJEZN8q3rxR63dRQvo4z8vqEnsxZvPgVGyPKsIvzM8TictTc7mw5/7M+aMInDjAKpl7ArTZQYxyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJF/eCs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRnYaKML; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJF/eCs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRnYaKML"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1fFI212183
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 15:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=9LwX2wymuNWHp2N3uz9gd+qk90vslZI2iYUW0/6tKgc=; b=RJ
	F/eCs1iKDPKXfdB5ApsmYoJxm/g60Lf9+5/Gjz+wuCzKhgMfVMVe+Cxjk44biNnM
	KdOz4rmYUDmfbVAHeZJskobZsbGPgl6nNtQMPyhL//HGHIxSJEakCRGmZzVWADrY
	ocNcZa3xFT9BaD4aDGfQYcmQHGnOmjxBOFtDaqwG8hJpO3himuIfvbZNfwwoJZsN
	lguO3NPX151/ns4boGy4hZ6cvPJ/63CcCujJAxiLVaz96j256GYBgIrVBfP+kOcQ
	tM1exHWwVoEgkcTjXMDOuuKnmmNnVFPnLYiSUxIXM4lKgusXPi6cmY87/YcaRbmJ
	jgu1IevwRlk9XbJDTqMA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es4g83m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 15:48:47 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a344ad5c7bso925175eaf.3
        for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 08:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154527; cv=none;
        d=google.com; s=arc-20260327;
        b=T4GOObKibcCGTKAl2qYvT+/sVuT4wO13I/mES//G02XmmyDAs3/Ondh/77O1hATUmH
         E0EvAv4xs1/IO1pFe7ZrCol1PS5nwgOsUdw3gkZVALyoWPEEM0SLtKJJ4vNhU+7HyLCb
         nGIWF++OnRCLRAdzhNa6YMsXO3soifFBrDIJIxFrOmFF0q5Hgqfs9p3js6bLC4QZFk1d
         3WtVcbiy6+PTyfwgkGxd7MkNahwUNG5z91BPJ/Qqots/1+XzOv59zbKVSzIYXyySKxPS
         oJzjQT6jo2GBD96Gaazfm3+Mq6TgxooUUH4teBgZi5XpgCS7lhjpJmLHGU9Y9qJs/Ju4
         ClCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=9LwX2wymuNWHp2N3uz9gd+qk90vslZI2iYUW0/6tKgc=;
        fh=9sMM5zB6sR6hIfWCt8XfAmUAMzYem66beFaeQhiZQ9Y=;
        b=QVi24rnEt2ptKQfazrmZpeKXscLHc7nplFix+sM42ouSCkkQX6MQcblW0nEwrMTFaw
         yTNYkmvmq+zPsIeSsgZ7wcnWQm1nVXUIjPqb+7JxJS+MWBMYId09EHkiMrn3jZ+mawvq
         ShM25gZx4Czvp8nF0elsJzKu2sGW7d4fdULXz7QgN1/kE9CmbsXtwn+mlXWF1Xi46Yyv
         LHQmx72eVJJ1X9wdrQs9HON5g5AtVLACQxWEL0+vy0iW6Ks8yI5GSIgsRvrKoFwZlHJg
         Yrm58b5gOHMlE5yC2/pkw+N2whlxtc9YdoOTlTeBCM6tZfKBozFt7iyZ4big8+vy6thH
         jypw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787154527; x=1787759327; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9LwX2wymuNWHp2N3uz9gd+qk90vslZI2iYUW0/6tKgc=;
        b=NRnYaKML05WoGKpyfhIXXp/cz0g/OzYnrHi0i6dPEZx6gx9SFcGrwFBZBT8uCV6119
         Kn0aSxYg6/DMkaZiQg+vPvcntPPkqpfEjh8s7TGxogOq3L1NRRgJSSkZDun3cRVwxaPN
         89NxBMyErOncEsqZFv7ViEtkNNqr1mJ9cUmwsIRTTU9xiDJtocjtTucu4jyG82qK+tHB
         w2O7Flsqa4J2CgDG4xkBrLyv/nFpV1fOvff0vznqt+HRBxODBnDdqc9hXsb7TdyJqrFG
         7m801inZIsfUNdeJelf84NO3yVVMWJBeQTpitpqCgj4km2dD8dHGRMXvgtIYcxldJZyP
         IzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154527; x=1787759327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LwX2wymuNWHp2N3uz9gd+qk90vslZI2iYUW0/6tKgc=;
        b=TfochoQrN5bdnugVjipOAPOJTIeVEjIi1s5N/hKEGAp5OTjyqJSx5/h1gigJgl9+ce
         lNdhujv1+AMYTLzBmMDHwSNohnQIb0ouWbYTaZAW6PXH35W+fidmFyQ4isGEQ4yhcU4M
         0L8EhCaH1gd+KXhPjDvgtCdzNpPcSnTpkkkOe7Nu7UB0ZzfwSdGw8VVRpyb6kTbOWH92
         WryxLq+KueCZpjdoL/L5lwupupsyeNqVpJ6dX5lZPgejDF1U8U/9iecaGuVOLSqRlQCN
         4eTemlAd1Nsgl8yRKLn2RkRMBGUR/DT3xYlI5jwR5Wiz7HJkIJcEvZGY24QeM5KYXzAW
         tyTw==
X-Forwarded-Encrypted: i=1; AHgh+RqwR6IyU6ETR6XEgxaej8FexhbsTull06EMt4ke8hlLltbRjkC7nw3hxPthnj9zqNdcKw9J@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6cvcl9JAdP9ilJM7uJg14mQvTp3E5FfBUP8yp+E9Pz5L3UiMN
	Bm+TzcCMK9FPKoMjOJcEPQAUH0suzRr6NVMT7eQuXav7AkKkOO8iD6KOJU8rGnxaW61bL+UaA1i
	EmohUX8lq0qRlDIxXUGhVtEFFMu3fpUljfMVM+4k7OOuhC8RroJGIbZBxO1fJtHENA57o/7lNyd
	VfTvde6DzN+Elw9tXBTaqmI1Hoiw8m9hw=
X-Gm-Gg: AR+sD11EjHjqdn6pWZ1cNGnGfeL2w11mq3KicFRExson9ESdX+7Ywduwv1iD4Sd2IT4
	sm/iGfjJ9rgmhDX5qB1eRiGAGY/SvTWvU3und4899VHxlZINrm1wpPr8eiBPyMcKNa9qADvgKpd
	6NnGwNePmMc4pN2fBH6pEOjDj+FkFuQavjkdxSKajn01on60jhExZr7oPY
X-Received: by 2002:a05:6820:1792:b0:6ae:8ee4:e01f with SMTP id 006d021491bc7-6b13c2d221bmr5523518eaf.4.1787154527081;
        Wed, 19 Aug 2026 08:48:47 -0700 (PDT)
X-Received: by 2002:a05:6820:1792:b0:6ae:8ee4:e01f with SMTP id
 006d021491bc7-6b13c2d221bmr5523471eaf.4.1787154526670; Wed, 19 Aug 2026
 08:48:46 -0700 (PDT)
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
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org> <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
In-Reply-To: <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 08:48:35 -0700
X-Gm-Features: AcwNN1Uf01RBOSSs1eSJ6ShN0aw0OhP8jKQH--o7bN6dJI2taQ6GEVNP3fqxrcY
Message-ID: <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
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
X-Proofpoint-GUID: LAiETH_e9ZUvAUJEz02gGvc71KUguvqz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMyBTYWx0ZWRfX6rEH3tWiTOdv
 6gqUphsu6Y8BlWJHI4w4vtQZnlull5G9699r7I8UOqwujPbV74l4zTZ5SLEEefD2xNgwErW2jTG
 UiM2aya+DpHQ8wPkjx5MWMGc5lpNMPy5zAvX7u5GWY3W2kLNBMx0BSxCpJXEXCh9GgqKvlUJX0U
 Vf4g/qZ9156DMzgIzCfGxDGoBYqb3iz5vuO9eTxE/QaCMqlDuWb64J0N++7+Ge09cmPpXlElw2f
 GoKJAdOIeQlYfGZROywKAIGwAtiaRBAld0kh+TG/x9RrzrdJJxTDr7mts0qCbw79pnXH/uIO7B5
 IfJAEBVfEnSlXGmiz942HNBLU0CNqy2Mgi1YB4D2elhOAnp9/RbbnsMjLdv5Wlndu+Nq2gk8HkX
 NEBJTXiANWOWFrmZms5QYCacuuJgiPUzrtfSUy07l74/U90CKrqiEXRpWV2kG0BfuH1GNJJ6Yvh
 8Enmp4B1IEyJNvpEoGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMyBTYWx0ZWRfX4a2QdJMcNiKD
 hD9GQefbnb+bia8fg4t+fD90sZ++dkAPw+x6zhFJQ4gu0ym1GT+Ro0aCB6mS6wjesJ1sEcmV5x1
 7Ox+4mQEoly9dQIe056W08N1ZgvK1G4=
X-Authority-Analysis: v=2.4 cv=CN8amxrD c=1 sm=1 tr=0 ts=6a85d05f cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=mAvluEFbtwFrZWikVwkA:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: LAiETH_e9ZUvAUJEz02gGvc71KUguvqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190123

On Wed, Aug 19, 2026 at 8:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 17:23, Rob Clark wrote:
> >>>>
> >>>> Growing old driver does not look complicated itself. The only a bit
> >>>> tricky thing is to present somehow exclusive interface to user-space=
,
> >>>> like usage of one disables the second etc. Depending on actual
> >>>> differences in that interface.
> >>>>
> >>>> But having a duplicated driver is a clear no go and it is well known
> >>>> upstream requirement. Nothing new here.
> >>>
> >>> Would it be acceptable as a first step to, by default (ie. when no
> >>> cmdline override/etc) for the new driver to bind to new compatibles
> >>
> >> You have one compatible.
> >>
> >>> and the existing driver to old?  Ie. have both drivers but only one
> >>> binds on a given platform?
> >>
> >> I don't see how is it possible to write such DTS, because - repeating =
my
> >> question - how many hardware blocks is there? I believe only one per
> >> given DSP, so how could you have two device nodes?
> >
> > Maybe I'm misunderstanding something here.. I don't see any new
> > bindings with this series so my assumption is that the bindings are
> > the same.  What I meant was something more like "qcom,glymur-fastrpc"
> > would bind to new driver but "qcom,fastrpc" (which seems to be what is
> > used on older platforms) would bind to the old driver.
> >
> > So single dts node, but different compatible strings picking which
> > driver is used.
>
> Glymur is already done, so imagining we talk about next/future SoC then
> we would be at point of duplicating drivers for the same hardware. So
> back to square one of my comments.

I just picked glymur as an example, because I needed to pick
_something_, and toplevel dts for devices available outside of qcom is
only just starting to land.  Maybe it wasn't the right example. Let's
just say "qcom,supercoolfuturething-fastrpc" instead.

I think my example otherwise still stands.

(In either case, kernel cmdline or similar override to get the new
driver instead of old would be a good idea.)

> The rule of usptream development is that we do not accept duplicated
> code, just because a vendor wants to write something new. This is
> basically the concept applied all over the drivers tree, where we pushed
> back against all sorts of duplications all over the vendors.
>
> What I miss in this thread is why would there be any exception here. We
> do not grant exceptions from standard practices on "I want" reasons.

I agree that we should not have duplicated drivers just for vendor
lolz.  But when it comes to adopting common frameworks and integrating
better into the ecosystem, this doesn't seem like something we should
actively discourage.  I don't think this is a case of vendor lolz, but
rather reacting to drm/accel emerging as the standard framework for
this sort of driver.

So how do we get from here to there?

BR,
-R
