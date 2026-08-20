Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE6374E5A
	for <llvm@lists.linux.dev>; Thu, 20 Aug 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237280; cv=pass; b=lPTbGnLppfhz885TJK5V/eQOUsPxdDW4hX545y3lty6Ne9irjfLtV0vr+FKCRPai/uw5TZ1hJ0CwbUliu1d+8UqIbjd/Aex3GIIrlrHNN5GdyFn0B9u6Uc8O474bGC2qBKL8Ejtqn026g+INIFyaXa2/9YhxFHfGbR53Hui0QkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237280; c=relaxed/simple;
	bh=Tj982Jh94LhkkenOX9KGGw0zBOx2N1w5l+SjfXMkOqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjaICAgl6CGRYYJ9fnyrUTXYO96AkCbI2GlhUqAD9cWpNZqRKhWNViJiNtWyid+6+jvfUhwmw0WVM1gpxdxiqLvb7wBKEa1peMfHH5rieRPK16nt08zDa/J6F27xXcLK3bFvdx6rPiUK3g04DtGjVMDQTTGgTNkpv2Iy9CW2U5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIlzaYIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4NuyDg+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIlzaYIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4NuyDg+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7qs62444598
	for <llvm@lists.linux.dev>; Thu, 20 Aug 2026 14:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=yLR4KHznvXfb+H7PWHV2AIGDk1Msa3uBxnhAbjxWO9s=; b=kI
	lzaYIaMnkLJeut0wYrwIzKu5PkJIhncQceAOkWy0QZ+en9V0SahIzZBQ/Wppo6XS
	e2OQQ5dsjGw+/0JN2opJpNdUhvJFbKpEBa4Yuah5jDSD2nB3EMLkmNDZBsY/qOOV
	/uQz6ezGkCfPLaPqCmNE8Yw/T7lIY2GCG7Dur4QGFPGdOqUX4q3ePnNlzPAfd8hg
	w18DDIJ6pn6sBlpf83trCcQyPoUfNxwHqlpgKCOy7oJuJIctvvy46DW3hPkN0x0/
	nqY3CHwpMb6sMB/05dCd8VbDUJuSfzxziFYVVHToUNMt0iCL5l7I0UGfJQ1BitfN
	4YkTEh42f9Ydcsk2BzJQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05shuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 20 Aug 2026 14:47:57 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-458326d2d9aso2677117fac.2
        for <llvm@lists.linux.dev>; Thu, 20 Aug 2026 07:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787237277; cv=none;
        d=google.com; s=arc-20260327;
        b=fZvCvMGn758mwKYA81lADHxMduIvYtyRmEQ3gPbIXbUUytzhiLN9+lKpOQoyUyY2II
         psv1ZvzxpvnenbW3/nRBbWbYNuT61cU3CxHN941OyvycVOHp9dnr7soTBjHQOi9drqp4
         doxVj++A/fJwX/nRZVsS1rxEX5ZA0PqmIKpfxTqQHH8PkO+/3DIeeMjGzmJEgbbQBTop
         /QNy61WrJpQcuZtWuq4fAUAyCy0oJIZyekYujI0d16I3G6wagvB+GmG2KRDU2yq7BR82
         9I5tr5jLRGTQlYvcRVvckl8LHtTxPeA+1zQya+7Vp/ccnC4CSa0YhP1Rgfkep9WuG3SM
         wT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=yLR4KHznvXfb+H7PWHV2AIGDk1Msa3uBxnhAbjxWO9s=;
        fh=fIUmQqcb0zdMAOvvorzC+68X6MMfB6YGEoen3+ygnhQ=;
        b=PtemND4+8CJl8RRlXgFe9q9jm5jVIZl1HibS4kLRvW4nVyQD8IJu5Tmu26nNRbhOHg
         zMBoLvkaMRWHskKRz7MHe72LDJeLNBxaGsSep/aqZ95ID0PwlAF8zo5f3/p93LxYT6O1
         55KYnO27XXwXn0b29achwxEYDUUslgsrHmku1OR2LHjuDk+FWrPiVvgnrv5+A7eTIJqL
         V9v/mY2/hwgeabySJWXvTyXZGuOfcNFU0uwBmitfEEdegiudYkO1FIxcjsTCNwx6fjxY
         wSSIBTjz0GKfR5HRcpBb9gZaxnPdGkHynbm6I1tPyqSc75yWZSLoueznamRc9zroBeCL
         1PcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237277; x=1787842077; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yLR4KHznvXfb+H7PWHV2AIGDk1Msa3uBxnhAbjxWO9s=;
        b=Y4NuyDg+4rbJhKdrVKRIWMhrJKLnXWZQRIsqBD2bAhe+U75Dlt/o03aeZTYO3zvZgF
         lPEDRqUJXG2IhFvNYkHRxHUzy7o8t88e5zCFZXTM7C1Do2Rv0XoZUHHL28FD59g9WZEt
         iJ4fneOuAK7Tqf28ioF5OSkXPmEORJQLIYGYHeCJBlvepz8tCbie1Um9CnZCK8hugiUx
         RvCbxBMhD1dWtzzsBEdl0gQ7ZMdr/aV36ZKluOLgvqAASgUEkREJJIdiEr/zWOux9WBE
         8NL79bol7j51i3LGzDjZl2KHbrBgQ9iklSQCvuW95aadNhc1yZoKWfmtjNJhy9TfWnMx
         IuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237277; x=1787842077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLR4KHznvXfb+H7PWHV2AIGDk1Msa3uBxnhAbjxWO9s=;
        b=KUo+NhP5AaMR1phY1NFY+6lMiUqM9p10Gv5/Vh2p0O6a7WphJdrt7N5PBz2wyCx0zq
         fuOyo5Kkx5MfC6FHqDEPpJ67Gkw+IKqnsDQKAp6ZdZLcBtMNMfxmCUfpyp9DgZUX1C3V
         1XBlW74VMCxgEHcm83WhAan1h5yB6niq3SjFK9H8edggO5etptsTBUTWavnbLbI79HFJ
         gsYriDq9+P0upG3GTHt8MBGgyRf41cFqGJzlyj34pYR7WeooZZRpzi7R+FGDxkSrPBK5
         gbuZpU1pIgr7t66x5prjCRhnC1E7HTObir6LK/SIwG9XsvPedzMY8Cobkk0rT/NVLZZh
         ofAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRoIicO4vaIjwXLfJ8WLduOqEmyequB2GyHvtsPApv4hFjWK/Raq4jwvOx5RK5DLFwAYB0@lists.linux.dev
X-Gm-Message-State: AOJu0YyH/LAxWYamZAsEXVB+aNP5030oX21KhI8UcjNRIQGqeaihMGxw
	WJeVL0S9ff2BfsZU/5T4REcR8ltzSegYBFDsPlAd56mT78UBsjx798CUbfV5ZdqyzfdU49ob1hl
	mpr8HDPWbYd2ER4yjN3OatNP7x4Dr/MnRbugfFefz9IdR68FgXujgnscUcAsKkCgfeT8g1ObYL0
	/Q55l71uUWkFW3IEbzOzVs8nZnVd2XxKA=
X-Gm-Gg: AR+sD13GcX72nf5qTWY5C3v76okOuSFli/0zX8ptmP5Gj7hfoD6ruuksRe8B8+JnjrN
	Oer+PamhKhFxpfU83l2hG7XPEqu4OOAu7GjhJTqyt36uK/3HH3cmWRAyN8PIice+J05fj0mf7ln
	3xWPm+cFpUAXQ7AD/iZ/P2WHMW5hbwHl0yzHuu5BVoZlm8az5dT65mhJMI
X-Received: by 2002:a05:6870:718e:b0:457:ed1a:9da3 with SMTP id 586e51a60fabf-462f68b3ee7mr12218558fac.17.1787237276735;
        Thu, 20 Aug 2026 07:47:56 -0700 (PDT)
X-Received: by 2002:a05:6870:718e:b0:457:ed1a:9da3 with SMTP id
 586e51a60fabf-462f68b3ee7mr12218513fac.17.1787237276312; Thu, 20 Aug 2026
 07:47:56 -0700 (PDT)
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
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org> <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
In-Reply-To: <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 07:47:45 -0700
X-Gm-Features: AcwNN1UDFgTj8DhU60we-UxrgwU5qCqC53mRJdhnjcqckwpTsRRAswI7otuboc0
Message-ID: <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: BFhOj0D_d7vHW6r_dj445BrhA_T9Wj7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX4YgA0IDZznJT
 IUitFnIToFA0PnQjGuHvYD30TgqleLtSHsPWjIXhbgnG+Dr/kuIp4HF5ZXyXyMIGcJv27968z77
 550X/tNz6zOd+21eqn3rFncOBSb0gEHYUY4BDcr+5ZNwsfPO1P7nLI38nmEJMPmc9B29T/CsPjR
 w+D51O1BareI0iY9+SQ6WNGDg+eoNJstGWqmH8oIMfDCZPB/TUlipNjLFHOBUi0JhET6MijTHI3
 3BgpWQrvO8DioqFFOmz+jjTwpGsHw1irEC4IECAeGlOALB/ao+HHXi2iLIvUytzzL4hwDCAeyjC
 PujTIst51CerZFS1mJcuQ4/iy34hNs9gePhSnso1pzp7LKCR1cl0BuqAbuHAnnzrQO3dS1rFIry
 vvcTx9OvCnqlJuHDrabMI/rOK+MMByiY+DSNc5mnWbfx9VNG779t8wFwvyomkRqET9G7bf1l0GJ
 NAX6NU9WPoI8mAcTcJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX1mfSIh7PYmLu
 oqpJ4klh1bpWouTz/iM5j8b/WvMmFx0PjIOBIxEoUXGFwc3RhCNGXn58NyrbdIkWDrsfEoOu1oi
 Snc9MBgLavGcMbezlHOpCm5RXn9HCGs=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a87139d cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=_Q5Bhtsilc8r9Aqu0AoA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: BFhOj0D_d7vHW6r_dj445BrhA_T9Wj7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111

On Wed, Aug 19, 2026 at 11:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 19/08/2026 17:48, Rob Clark wrote:
> > On Wed, Aug 19, 2026 at 8:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >> The rule of usptream development is that we do not accept duplicated
> >> code, just because a vendor wants to write something new. This is
> >> basically the concept applied all over the drivers tree, where we push=
ed
> >> back against all sorts of duplications all over the vendors.
> >>
> >> What I miss in this thread is why would there be any exception here. W=
e
> >> do not grant exceptions from standard practices on "I want" reasons.
> >
> > I agree that we should not have duplicated drivers just for vendor
> > lolz.  But when it comes to adopting common frameworks and integrating
> > better into the ecosystem, this doesn't seem like something we should
> > actively discourage.  I don't think this is a case of vendor lolz, but
>
> No one discourages it. Following standard Linux kernel practices and
> requirements is not discouraging, do not twist the narrative here.
> Again, it is standard upstream review telling that we do not duplicate
> drivers. Ever, unless there is serious exception needed.

I wasn't trying to twist the narrative, just trying to come up with a
path forward that isn't "no" or "improve existing driver", since
neither of those gets us towards a future using common frameworks.

> I asked why there should be an exception granted? Is the reason for
> exception following:
> "We want to adopt common framework"
> ?

Possibly?  But I don't think we want two drivers to be any sort of
long term solution.  (Ie. as long as venus/iris have co-exist.)

>
> > rather reacting to drm/accel emerging as the standard framework for
> > this sort of driver.
> >
> > So how do we get from here to there?
>
> What is wrong with my proposal?

Maybe I missed something, my understanding was your proposal was
"Grow/replace/improve existing driver instead of coming with a
duplicate"..  grow or improve doesn't move us toward common
frameworks.  Maybe "replace" is a valid option.  If there is something
I missed, then I apologize.

Options I can think of are:

1. Hardware cutoff.. new hw gets new driver, existing hw gets existing
   driver
2. Backwards compat chardev registered by new driver, providing existing
   UABI.  I'm not 100% sure about the feasibility/drawbacks of this..
   AFAIU the fastrpc folks where planning a backwards compat layer in
   userspace, so maybe it is possible.
3. exception?

I'd like to know what the feasibility of #2 is, since at a high level
that sounds like the best option.  Possibly limit exposure of legacy
UABI to existing hw so we don't get into a place of needing to extend
the legacy UABI for new hw?

But #1 sounds like a non-controversial place to start regardless.
Possibly with #2 coming as followup and necessary step before eventual
migration to new driver for existing hw?

Even if we start with #2, how do we handle first-merge-window
bugs/regressions without reverting addition of new driver and removal
of old?  It seems like we'd need a window of a couple release cycles
where both drivers exist?

Maybe others have other/better options in mind?

BR,
-R
