Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F751476683
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150298; cv=pass; b=lLGstYnkb6WaIFKJ3qPWtHLdFyy92/oWc5RSmkzaDEbzyqXvUdz0Iuse1qrYafsibEKtjD6XOff6rl3Yh/mBtEJSZCa5s68WsV8QJsX3VzFmKKnXCJ1sU//f853jPxaPWMQ2W5TOOlkyhvCl1bipZsaM8id1eILxFT9WtOekal4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150298; c=relaxed/simple;
	bh=JOHfuMDahWJpprTXbJI3zSINoNZd4BLeLIcmol+bfrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eS8hTUxbhIG1OcRAYaJTnIXegas4ElRPDY26snFmP4Cu65QXpuwxJVaAd27GhYwWBvNExPvmKTXGKMfO5My3YwNjVQ3G+tqz+3VWZA62oduO4HHgWOobImGV7hmeZexULbnIIxmBMnk9vagVfa01nRQG3d0grIC4aEoGsas9Uzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPeudUYz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q9Z2D8Cq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPeudUYz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q9Z2D8Cq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEboDX1117489
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=; b=GP
	eudUYzAmwpt46XExjtHoL24a2I/8JX5JZHI9Hy6CbC7dO1tazpRAgFP+VcfrugoN
	qQqsW9ubazohF9DaVxrl3s/LKRe5kznPmCK3LoVzh6vJ+iebuKHns765pvdU8/jk
	Lx7WZ4bv8UVCBWYHz3m6v5/GnJT2VNZ0ww0LUj8Ylet1jPbTbGqxlh474I7MyGKO
	RI1PPcRlaETWg5xn/0/ig7ssX0OVcLJI/cDW3vOkQPZjH9SybyNVUYXczHdUhTB5
	BQOZ3N3z7a1vzgCS4xi5BbzZii7NWgVe1Zsvy1mFlVQsrVsTo6F9HCwWhsQoGkSA
	JLDz4rujLqSxMRs9pEMA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpup6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 14:38:13 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6ae8d87a96eso753646eaf.1
        for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 07:38:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787150292; cv=none;
        d=google.com; s=arc-20260327;
        b=HW6q7YE7B1wOTjliXlBh/5R2pTVZY6ME06WY46e5kbpFB7+I4KRJXmcHbLv2q3qwli
         o5/Np5Bb9jHq2501je9NYipO8P+NMkZ0wPUiEvrmNQxJ9IAXIEgEBuGmFZP3+YxRPRlD
         cfiofz6ohfp/++RFK0K2OB96pyradX+TI6p3gix6DQOrvAys6OuaXwnHVrvvyjAht6KH
         kpP3hplLZkvf9YEcUIl7GSryjPSZTjFsVghuUq2tKroVoXCbrWkg0YxFr0rezZ6cO8uR
         vC5nHz+aAKOCl1ejtwrG2YU0zU2lYgSX12S1odret+3ars8NFozk8pxHaCKGGHcFKT9I
         blFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        fh=YTKDnL/YBbA5l6YE94053kpKiIB/PallrDy4UFXpwUA=;
        b=r4a0KgqsHaE0rAZSltVsiLcOBop2rph/7s9HMAoECejaqh2iK4ARy09hn//ir4KQE3
         yJcO8WETkQWwLulqxWWpO4hUpZKQ5DOqCAO+rzec5wyWkfUTrK/0R2RxxGqI4TXmepmM
         UjppRwL4JkQFHLzCZ7VxoiZP2ziRm6rA/scDuJSIHG4E2t/lkhwKR29xRljlnv4yxIDU
         XndxLq2l3Fm2CTPSOgfAmYCLQ4Tjz4QqLmvo9Df7RB+/pydF/Y8VOOf7nFwGZavpLXNu
         Nii0WWCWlKHAatmaRv42MLkmd5F8TDSuIhBeG89WWA6DwGenV9AxSVNGzKhUEDOYc70v
         o2nA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150292; x=1787755092; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        b=Q9Z2D8Cq7DOKAI6AMnCnxUHsuTlipq453Fcxj8hGHq7oCm2b4Wjvp6suuvYbKieGz/
         dvQaFs8kXXVECsnDU55WjLPcOvo5TT6L+DiUZZ5dzkfJN9jHmCxSvbT0AhHfbGkkL1wK
         uIbV0snOavO1Xz3xiqqgNAhqmsoC7Gq+FJrBE6exwgnXUgl1FjPsxCd/rvwyRu9JBa2J
         USOLeqcfEAlc9vRFqoCZSQuvMhcXiq67bpQDZhkwdQ1xdEzOfycykiAjRfx3khgHJNJS
         M+eSKjUDsnYkltj9tsVttDoBHvUQxI/6TQ1Fdqe0Svm4hfE+mQqKkpjnGHLgpPVEjy29
         fIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150292; x=1787755092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OV4Etzi0F84EHavFR+Cnl8cEpGoAZCQzZFi7p8gpeMI=;
        b=h5Ci+nkBetugjSXQziWCvU+cAnfXf+JklZQhRuWkAdf/LXsUCNwHvWNRpE21ZICRCG
         Wc73J7V0ycPEUDGI5Qp9B8BI8lhejQURjP5fmoQ8uGMFulE9RJQUyLOgU/P9n7ODYGP5
         doSww7XXY1A6rHwuIziK7fST3k151l3bDDQsTCQQM9Fr9jMEM0LrISGdj4Sl1fKC3DR7
         5Wgdzl9mb//85YlD9W9RY0Qbs7biDPanJoKYneC4jDUWLYXrTRlBx4YdWeGDnwfcg3nT
         cdvm9AztHARcLqKlWbicdAMcFAunEVhCNR4nizvdEqo5D8cAk+oLy4LlTIhfzmcwrHUR
         IdGg==
X-Forwarded-Encrypted: i=1; AHgh+RqOo/qaf2ptfi90zRCdEGF6o/g3hM+HfyLHVMPE6PaQCFG6ze7d3yCzLXxA0CMMdGg8+oeT@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf1VGYp3YVcdnSxbnnmni6BsgcvsNghu6UgMUw9CWxY4RI09+K
	XqwUJ0t/+reI9ewrlJfRdOpBIyyoJV/Poy8dIZcJm7+6WtnWHxzCLp0OTU08DVAUDPVQg9w8vTb
	s/n/u3yuhDXXIhXY/KE2HXiyvoDZnpvcYv9tM8Uu0kn1OXenOuc/y/JdMqZZfXpC0S85TuYeQDC
	8ULGIIuLf2qOD49XPQ8tH+4I8I7fmEy7I=
X-Gm-Gg: AR+sD138yCl3JkmsmNnzZ7KrKP7VviYYZd1nDi4OobwsAo23sE3F6H4LexpXdoUUU83
	F/W9xi0rMqZ9KXmgIriF2O4Qp4J3JwHREFvGHWEKoq91ZNbYTnrxLACRdd4o0MrkdOheUba6x50
	8WlX2afO2zCUG0L3zX9a6FU/y0+aNUCbx2/1IcfsBkRy/Tljnp2IMEUbFC
X-Received: by 2002:a05:6820:1ca2:b0:6ac:b1ae:6ce3 with SMTP id 006d021491bc7-6b13c69056emr3835918eaf.32.1787150292217;
        Wed, 19 Aug 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca2:b0:6ac:b1ae:6ce3 with SMTP id
 006d021491bc7-6b13c69056emr3835876eaf.32.1787150291802; Wed, 19 Aug 2026
 07:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org> <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
In-Reply-To: <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 07:38:01 -0700
X-Gm-Features: AcwNN1UJH0MueaAt4fuAnOTplgnMr9BZwDd-FRtcH8UIxmOIWCFCFvjMK1YdptU
Message-ID: <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
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
X-Proofpoint-GUID: u2fNV9jEGuimPxc5HEaf4Czrsc2fgV4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX8DghuJwsIqKE
 LcnIxcV3zwWZoWd0NBTdsUUeg0QVG+tL2caBw7z69k4wuihlScsklhnEsz4PbgRf1GkpnpFrVKt
 x/ZHwkt37esq0pFM0/waumNcei8/JeegihY7m4cPsqBppvEi1mHeXhOBq3Ohvr8IKy9LMZVkFIQ
 YIFmZNBblmyMHSVOZkdkKR2uZa3YONr9OG7ddmOOF+9GzQxA6iAZlB1oeM9ro89+ly6NBUJbvhv
 4Qoysk6LUH0OkUNh3/FDdGOaf+SFCO/GfwR7B66/1yqnYQUODFh/UIEseMwmF/rmZWI/+I9ocww
 UAN1Uwiw6rE4z1cST7W7h13ARTlTSr/lLLzWYIA4a6HAfPxmain9Jpy0NDaYc8doIM3GwECZ1o4
 mbQLGttB8S358oppx0Dyub/gYyPzMulPJu8QuDP11PfBSRjLGeKjBSxgx9Cz2keRT9tgIddiaiI
 8YTEu2cexMB9576brMw==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a85bfd5 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OXa2z63zbhD_Ho30eBkA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: u2fNV9jEGuimPxc5HEaf4Czrsc2fgV4a
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX6OFwFUKHYqEQ
 T/iyhFnKyeWpXHp1NsVKx7StKxFSdwzz/YPTu9gJjdG1vCCpFQ7oG6eQx15ukwIb55Y6btxH6ts
 ygyjvFOhvniaWLsNWVdSmgbOBNdabio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190114

On Wed, Aug 19, 2026 at 7:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 15:26, Ekansh Gupta wrote:
> > On 19-08-2026 00:43, Krzysztof Kozlowski wrote:
> >> On 17/08/2026 06:47, Ekansh Gupta wrote:
> >>> This patch series introduces the Qualcomm DSP Accelerator (QDA) drive=
r,
> >>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides=
 a
> >>> standardized interface for offloading computational tasks to DSPs fou=
nd
> >>> on Qualcomm SoCs, supporting all DSP domains.
> >>>
> >>> The QDA driver implements the FastRPC protocol over the DRM accel
> >>> subsystem. It uses the same device-tree node structure as the existin=
g
> >>> fastrpc driver in drivers/misc/. The approach for binding the QDA dri=
ver
> >>> to device-tree nodes while coexisting with the fastrpc driver is an o=
pen
> >>> item described below.
> >>
> >> No. Grow/replace/improve existing driver instead of coming with a dupl=
icate.
> >>
> >> That's a standard upstream requirement, basically given on every
> >> upstreaming guide.
> >>
> >> Please watch old talk from Greg - "I Don=E2=80=99t Want Your Code!".
> > Posted discussion threads here[1]. Would seek comments from Dmitry,
> > Srini as well.
> >
> > [1]
> > https://lore.kernel.org/all/3476b5c3-7983-4994-a901-3d7d8bd75255@oss.qu=
alcomm.com/
>
> The rest of the comments is still valid even if you did not acknowledge
> them.
>
> Anyway, regarding above - again, watch the talk from Greg.
>
> You have ONE driver. Not two.

Long term, moving to the common driver framework (which did not exist
when fastrpc was first created) seems like a good thing.  But does
that not allow for some transition period?  How can we get from here
to there without otherwise breaking userspace?  Is there some other
precedent elsewhere in other driver subsystems?

I suppose drm exposing legacy fbdev on top of drm drivers is _sort of_
a precedent if you squint a bit?  I'm not really familiar enough to
say if that would be reasonable/possible in this case.

BR,
-R

> Best regards,
> Krzysztof
