Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016893914F8
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050919; cv=pass; b=jbeha0M0hvtLMsZgsXWkyIcmDPyW23ePHQ3yMlAZRsa36fFpQWa8afxl8+d46yDGlIW4NLmK1y2iw8FA97SSo5WlXUVF44m/f4TLwj/DRp3L5RqzydxRdvWR71B+tw4p3Jv/Njfv9ardL8RbHiW0sALBhFvWy77L8UgFFcganvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050919; c=relaxed/simple;
	bh=L17jW+nhc8y1D28H4hUsSAjmsNdLIugvjTy77S1ogVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZ7pEf+Yo18FElpXcSrXJwX/L/iVQmBXDGBYZW5rBa00XJGd/f5IpEs1H+HJYojXBapoU3hQ91EheQ4MXJUUtRrYRXA0Tn/SpYp08srGtXiak84GLCQU5F9ifOrgES4bnL7ECtVikZ9CgoV376f4A7e7qscodXCpQjgRsGdkd34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvUNUCO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X3PCfqOC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvUNUCO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X3PCfqOC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7avB2029176
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 14:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=SyGRoRxzrS9S8txyYHsaj+mP8c0hLvS0zXlhKlwEOiU=; b=kv
	UNUCO2klR7aLImxRdmF3Z15bCCdCU5EZ044eyqPngnL+uZc2RhgiuUz+oYZSZdZk
	56VBbETrEa6iL7EveTRjlur3uW1cPUR8TpFbH7ux3fULnwgdH73Eq66jGz3uedIH
	S1eDkBNwgvZwelMdRg0X4ppMObzYbdzHa2mwMkXbwBHnwKeIPrdPCU01MpdUXHst
	Ln7z+MenafPgon1Jf/YeZUwTfBGQiw9QBJyW9zcPPwm5ciwljTxyDM52S/YgctM0
	CJI6nyL6EDCtDa0jFBe4jaLWzRO7reSWTqPHMDPiMLA2eyOaXleFZqmYKKhlvMeY
	erm7mCpzN+ly0WgiLwpw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhcc8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 14:35:16 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a49f09233dso4815386b6e.2
        for <llvm@lists.linux.dev>; Thu, 10 Sep 2026 07:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050916; cv=none;
        d=google.com; s=arc-20260327;
        b=oEjxkYt60bWYUNNtjlhUAA7UGTXBgNngc2P5FIAdiY9vdk5AmNMhPTZHborm2UqyRh
         jrwPjC/vZyIn8xceDwX17+G8dcsZtUJhEJ55ol9f2XSVjhRD6mshPXttF1xuTT+fAIUv
         vhx1G46N+2diENdSvPnRGPm1y3MItcMJasavxO6EZGUK+wRA7hEBAiP8PilKYWWxkQfr
         EgwljKVE3jGtNYBDUFARR6pScykdSnoTGcfFYQ3oa8UYKqtkUWgJ8ZfSU6mdaTOmhm35
         iBumusbIJStCxc67osP3leK6FR/Jd2p61NEScUWJnGfcXVulA/iTznJGpQReki+ajL7C
         bEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=SyGRoRxzrS9S8txyYHsaj+mP8c0hLvS0zXlhKlwEOiU=;
        fh=YdmTsDWmXILAPNB30oUSL5EHE0gK4Eo8PDLovPxgNFY=;
        b=TymJhLwSqTomqTmPoCrdqRz2U6iVOWcghqIWFIe7VJA8sdIa6YhvmWcLtC8jqjpg/d
         krduSnxv1SPr1mW9ZcfVB59/6uyj7l61fGnXXicxoLE6kRs5SZ4uadAX1YrGiM+huXa+
         iOAie1zcBktkWdJSyNCE8Yl0rOzfXjM/vNE+qsQOzH4pR8FbuaUDnN7AxgiKM+z3XBDb
         edpYNF+R2m0YdzCQl81EiEr6npjdC9KENYvutORz0QU2883zfSv5kY7FrZthxsgbbbNC
         kU00bJr96yHAKLmwpHrSB8gepFoTh9cUFbF6LAG4pUICT4t4vgmfpxynO19gR83skVXR
         ernA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050916; x=1789655716; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SyGRoRxzrS9S8txyYHsaj+mP8c0hLvS0zXlhKlwEOiU=;
        b=X3PCfqOClpAO26GWM/QXdBnJ9gvBxTS7Ivm59cy0enpm6v0Lc/PGujTkbwrrjrx7r/
         TrUXtCtBBBZpiyeZX9ABLuNiijJeftNgBNidnmA7SLBjX3IMtEt75HmO8aBGI7EkluEM
         yGNj/vBZvVMefI99WifJ36oxaWhqEfXyLeYqBkeenINPX8fUjZvrWP+msQTEC6Ba1Efo
         snp1/rafSv6lRB3ElKuGeZL5oHBAyXACWnd728PWw3BYbxXYSQmgbQAiYIKlqOy6RiJM
         bvwvCz2hmWFYsf6jRbO4mOYgDjrhxmGDb1xNvhmGmjkGmRfLzl+byHB4N0n44xWmghcK
         boQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050916; x=1789655716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyGRoRxzrS9S8txyYHsaj+mP8c0hLvS0zXlhKlwEOiU=;
        b=KRrXhiPZB55omx3HRGTfASDTGJD0yycOeagTOqVavdwaYToCjJLUoU43bs6CvySXzF
         n2UjPGTbt0E9BTwn1kSbMYIJV7L9OXsEYSR2rgP4uCwowwdeub8kAGulvV/IYFx8jA3q
         1FVJCRAV+8qtHHXP4Q6lkzNbx8D9labvOACEUcRXNBEIfTTyX5sPmfoLSZIqwWwknHUw
         TAzHX12dCGRnJLK4H0WYN1Ntchs+WlqMGbT40/qCOLoGIT+g3iqUV0jTC7oOwnt7lf2L
         e2Tli+hrO93I5j/BKPpsN0QTuX+dPEKMnm2M5gbchWkQ0vmoPhKZDs5xPENCgiXyk5Yf
         vraA==
X-Forwarded-Encrypted: i=1; AKwUvBx96EZ/+repLwLtEWJNI/W6EHfA5DC7wGqGxhU0hDjLqkNt0B2jBREzpgeEkWWEY2wmkKGb@lists.linux.dev
X-Gm-Message-State: AFuF++kJgcUsq8D59gwapv8milihz+ftClHTQ7vcFkno2j1tcBZBk+tE
	WIIisHOSGCQkFKRSyi3+EmHR9bzozXiWP0zwcxDtRzBqWr75GB5v9FIghuDidESxRpN2k66ksyJ
	tuYthhDz5P0PkgpYFV/aRmFrv7Fovs9VIjXiF5Nk1VQHFTA6OxTrU3W9QmFlCVKN73KkKa84CgL
	Bec1RTUTuFAqCjudISYxs8hA6wDde3dxA=
X-Gm-Gg: AYBFou2iFvmij9Co7NxYT9Sw6F3dPxketXkuOB9XZNJZSwzSdwd3W0X1/pvoECEfAAF
	nqQBgAx75eBFPM1pULvm0J9cj3fzhZHkdz0OrxSvOu0qAaRyTn0wObGgyTln95FZr8+FsHMH73b
	/m853FpmjjSqcYtF9KtWsdMb/mU9ssKbUJZasdvpXDCxzTZS+6udK+eeet
X-Received: by 2002:a05:6808:1c0b:b0:4b9:a88b:8890 with SMTP id 5614622812f47-4b9a88b9027mr20758194b6e.38.1789050916047;
        Thu, 10 Sep 2026 07:35:16 -0700 (PDT)
X-Received: by 2002:a05:6808:1c0b:b0:4b9:a88b:8890 with SMTP id
 5614622812f47-4b9a88b9027mr20758168b6e.38.1789050915578; Thu, 10 Sep 2026
 07:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org> <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org> <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org> <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
 <23e31249-cce2-421e-88f7-1a2af66e34b6@oss.qualcomm.com> <aqCKgM1yCbWjFdgO@baldur>
 <rh5ufacfap4x63rjmgd76wlwgn3n2wuelpe4sqwy4yda27nsiq@lg4ltoqwz7ba> <aqK3QiR3nsXtHTwL@baldur>
In-Reply-To: <aqK3QiR3nsXtHTwL@baldur>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:35:04 -0700
X-Gm-Features: AcwNN1WgxDRKonbfwtEs2Ayl__oXzThTnTjcC11fJE9LIXFOVR04lHCeSd6EFRM
Message-ID: <CACSVV0273TW2Ws8KfcT0BUS9O7ERWo7YUnpwgVndFYHjE6_yWw@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfX0qza63/RaqnJ
 AqhdVWfRW4IiJblII0taDin1Tl5trggFF1kMha1Mc0ZaDJ7b+vQTcirSJD2qbOaKSYa3ytSlYnH
 4aeGTE0m6akgjs4IpzPiAQxpH+LyovI6TwM4FSCl9y30bNe0OQbD5oEFZNpCVavIhf10iqiAx/Q
 9HVD67Cl0ji4B3k84Up/OucwjIwbrjTlFOQ0U/26TjjdQPyoYhwy2NgCIePpiEmp7Kz2VvxhQIv
 2ao+62BleSOgzpq+X4uiZLeBlYpnBXpvSI2yJFhIy2eG6JmhE/kiOoXtMMUDUO/IMAwWoe3EH7P
 Ac/4fFAvW2yPHs1tvMI7U1gz6j1eKA1KqF7M0Udtj0hP+vyVXfljYbNm0bfKjT+jl+cwIwJz/1W
 74O5FjxJ6WB+H/pqPKFQBFJSAR5bLrGdwia8E+ZvFWarLgOdV7Nw6yUtvCKNZiF2BHhcNkPqz4G
 hYT8z1iLsnRMwcuKVPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfX1x9M0tVMfEFT
 5ZQxUC3FYyPhYc4y36I3c92I7ODJmWp8rN7L8zr6X55/PQbcXI22O2K7/n2i9JnMu8+6gcs/9id
 nYqC8JajMQc+3r7v2MzUXH79St7IYYQ=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2c025 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=r1Mlh0iZuFWrlC140wkA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: 95FZbkBXEsvpJYbr4GUhGiKntDnrnY2e
X-Proofpoint-GUID: 95FZbkBXEsvpJYbr4GUhGiKntDnrnY2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100176

On Thu, Sep 10, 2026 at 7:25=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Wed, Sep 09, 2026 at 02:48:17PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 08, 2026 at 05:44:10PM -0500, Bjorn Andersson wrote:
> > > On Wed, Aug 26, 2026 at 06:37:00PM +0530, Ekansh Gupta wrote:
> > > > On 20-08-2026 20:17, Rob Clark wrote:
> > > > > On Wed, Aug 19, 2026 at 11:15=E2=80=AFPM Krzysztof Kozlowski <krz=
k@kernel.org> wrote:
> > > > >>
> > > > >> On 19/08/2026 17:48, Rob Clark wrote:
> > > > >>> On Wed, Aug 19, 2026 at 8:27=E2=80=AFAM Krzysztof Kozlowski <kr=
zk@kernel.org> wrote:
> > > > >>>> The rule of usptream development is that we do not accept dupl=
icated
> > > > >>>> code, just because a vendor wants to write something new. This=
 is
> > > > >>>> basically the concept applied all over the drivers tree, where=
 we pushed
> > > > >>>> back against all sorts of duplications all over the vendors.
> > > > >>>>
> > > > >>>> What I miss in this thread is why would there be any exception=
 here. We
> > > > >>>> do not grant exceptions from standard practices on "I want" re=
asons.
> > > > >>>
> > > > >>> I agree that we should not have duplicated drivers just for ven=
dor
> > > > >>> lolz.  But when it comes to adopting common frameworks and inte=
grating
> > > > >>> better into the ecosystem, this doesn't seem like something we =
should
> > > > >>> actively discourage.  I don't think this is a case of vendor lo=
lz, but
> > > > >>
> > > > >> No one discourages it. Following standard Linux kernel practices=
 and
> > > > >> requirements is not discouraging, do not twist the narrative her=
e.
> > > > >> Again, it is standard upstream review telling that we do not dup=
licate
> > > > >> drivers. Ever, unless there is serious exception needed.
> > > > >
> > > > > I wasn't trying to twist the narrative, just trying to come up wi=
th a
> > > > > path forward that isn't "no" or "improve existing driver", since
> > > > > neither of those gets us towards a future using common frameworks=
.
> > > > >
> > > > >> I asked why there should be an exception granted? Is the reason =
for
> > > > >> exception following:
> > > > >> "We want to adopt common framework"
> > > > >> ?
> > > > >
> > > > > Possibly?  But I don't think we want two drivers to be any sort o=
f
> > > > > long term solution.  (Ie. as long as venus/iris have co-exist.)
> > > > >
> > > > >>
> > > > >>> rather reacting to drm/accel emerging as the standard framework=
 for
> > > > >>> this sort of driver.
> > > > >>>
> > > > >>> So how do we get from here to there?
> > > > >>
> > > > >> What is wrong with my proposal?
> > > > >
> > > > > Maybe I missed something, my understanding was your proposal was
> > > > > "Grow/replace/improve existing driver instead of coming with a
> > > > > duplicate"..  grow or improve doesn't move us toward common
> > > > > frameworks.  Maybe "replace" is a valid option.  If there is some=
thing
> > > > > I missed, then I apologize.
> > > > >
> > > > > Options I can think of are:
> > > > >
> > > > > 1. Hardware cutoff.. new hw gets new driver, existing hw gets exi=
sting
> > > > >    driver
> > > > > 2. Backwards compat chardev registered by new driver, providing e=
xisting
> > > > >    UABI.  I'm not 100% sure about the feasibility/drawbacks of th=
is..
> > > > >    AFAIU the fastrpc folks where planning a backwards compat laye=
r in
> > > > >    userspace, so maybe it is possible.
> > > > > 3. exception?
> > > > >
> > > > > I'd like to know what the feasibility of #2 is, since at a high l=
evel
> > > > > that sounds like the best option.  Possibly limit exposure of leg=
acy
> > > > > UABI to existing hw so we don't get into a place of needing to ex=
tend
> > > > > the legacy UABI for new hw?
> > > > >
> > > > > But #1 sounds like a non-controversial place to start regardless.
> > > > > Possibly with #2 coming as followup and necessary step before eve=
ntual
> > > > > migration to new driver for existing hw?
> > > > >
> > > > > Even if we start with #2, how do we handle first-merge-window
> > > > > bugs/regressions without reverting addition of new driver and rem=
oval
> > > > > of old?  It seems like we'd need a window of a couple release cyc=
les
> > > > > where both drivers exist?
> > > > >
> > > > > Maybe others have other/better options in mind?
> > > > To all, I'm seeking on the approach I should follow to go ahead her=
e. I
> > > > can work on implementing #1(as per Rob's list) with hw specific
> > > > compatible for v4 if it's acceptable.
> > > >
> > >
> > > I don't see any reason for you to define a "hw specific compatible",
> > > because as you have shown in this series (and as Rob point out), ther=
e's
> > > no difference in the "hardware".
> > >
> > > The only reason for your "hw specific compatible" is to make a softwa=
re
> > > selection in Linux - and that's not what DeviceTree is for.
> >
> > That's not exactly true. There are protocol differences. For example,
> > polling mode is supported only since a certain timeline in the history.
> > Likewise other interface features are not supported on all the FastRPC
> > devices. For the polling mode support we were already beaten by the lac=
k
> > of SoC-specific compats.
> >
>
> I can see the benefit of capturing some of the generational features in
> a compatible, like the changes related to address width. But for pure
> software features that doesn't have an actual bearing in the hardware,
> I'd prefer if we relied on dynamic discovery.
>
> But none of that applies to the question of "can I use compatible to
> select if we should use the new or old Linux driver".
>

Nit, driver could still have an allow/deny-list of machine
compatibles.  Might be something to keep in mind if a phased
depreciation strategy was desirable..

BR,
-R
