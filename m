Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EF73839A8
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024999; cv=none; b=kuyr3uMEMWtwDGVSV9LLA4lW55MpjzRQ1CgVb4Pej5beaNTbP0NqiWRVuEJoX9QJYG5pJPsWddveJ1UsD0KrRnBtmROVscu9/E0YhDX4c0+AgaBtPzjPIYnrwZbVzCGJagS+np2XxxlovmpfJT8PKDu1JQRaA+lmV9co+aTLkNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024999; c=relaxed/simple;
	bh=q3ya2SblFC86iZpNdDmbejj6B4Zp4Ad+lutz+pAZX8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuDJIV/tnPGLkMRmnaylgiuWTiLCBWY/EVhEQ7dLmDtXX4aipQXPC93ozckDp1XJTc9e2qO75kaPp53jhgPpjW49w2ir0AKLPv4U4bWNDiajQoJa2MFyWwtfl25wXYZ2BwpFXAuxRk8qtiMsMZ/h0+UgmnxBW4r710IVRUfW+dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmoUky8+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpzSHYuH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmoUky8+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpzSHYuH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkSUN3531939
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cSsOQKdmDY+6H5Rq7yKqDY43
	lcWOkS/eE/giYEixucg=; b=VmoUky8+H+tjDDwaT3tM/4TVnvJkBfcAcpBpHare
	Tf7ZwlFpTALetiJ+Fvm0LbqbSRc/dZGRFfa8pytEQjoefL37MLLuERLHkEkAUiZu
	Sosalko1f1YAkl7/boT/E1TtemNYToayV0JhE4ZrXJdehbCVBfX38x66O6lpEn6Q
	a0a4W8cNuILfixuWvnT0a+fTX3Vp8HRfQzW3s/hv0DlBr0Mm9piiL5Egb+ZdMJ2e
	jiuRWF7y/EE5Gz97gPBHwxkVD4Rjycs+S+VeZcMpgB1WRsziKUe0s1XmcyloOdiQ
	VP9hSUNqfVcT32jHu4iQNKS6CjrBKG0ukVV+i1sdfVUs4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615j9tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 03:49:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso58361261cf.2
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 20:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787024996; x=1787629796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cSsOQKdmDY+6H5Rq7yKqDY43lcWOkS/eE/giYEixucg=;
        b=YpzSHYuHzGwrZXZu8BY7zM0/j7U06Ou+BFaSF+UEO5KERoXb42khhjr3wvbS5KXzoQ
         uEM+Wp7g7YI7+TQpyq34S4cKkBMCxbXGGWAjDgJn/cPIKDgrlBF4ZmGwjH9jE3Z/JG0Y
         uk/amYiwu/JGCLDqqEfu1CIYUa/GRsVAklLnRlkTqtvOI/R7pvXnifDrwDvA25ju1Eu6
         /a7JaXp5afo/5nn6gHOM62ixYXn9bfovEDYwHZ4QUFfNDQuscLtkmmRoHDXgszbuZiyu
         FIjm6yHHJCo054fbRMFmE+xoYAEFNQM1XmwcnAAH+8Mr11ODRlyUyJTAjNco5UV6C/58
         3vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787024996; x=1787629796;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSsOQKdmDY+6H5Rq7yKqDY43lcWOkS/eE/giYEixucg=;
        b=nFaWhXq989kZ/DeonfHFFQZL20ePGDHH7uDZIwZ/g2qxbdOwGsgA1J1Je7rNdUqRj1
         3MF4NJM2GmfGtHm4ykGcW7vNa8UnegxG+iLX1DgqrnB1wm/fClI9shROjywUgpxc7zeL
         wgKB/F50JkrRxOunT+iJ2aTtYx+jHuJO5xhyWRrEIRN2KrDgFVivHkLi5E0xvdHSBaod
         UHqlAMxHKJXLghHcvRCICf++0lvBPEgLtncvC4Cs57wnCJmlrssWx4ZTUIcbZEKPJBEH
         UUrjNBegz69dfCsYygUt+tLA/03EcOztDJkYzwoVPLbc8Up9H3vEyovJl6LCNN2ilXps
         2bXg==
X-Forwarded-Encrypted: i=1; AHgh+Roo4MEuAKnJuO2xgvoCOwf06m5zRmUNehWS2mzWyaddfPztGpF6hdDhGRKeU6EVhI427SGB@lists.linux.dev
X-Gm-Message-State: AOJu0YyTPWKiksrl5Jn5RiyLuDVEphhZhgglX31egJTTkyYfig5j5ALu
	sfF2gwJo+P+4itBfR9BpjqDWKdAFAhey5Rq3Y3gIft9w1/q4nn1Az9yafhLTpwLo2aUcChs/nIU
	jiQAjT/4jYnIfkbbvZWDFcdDlhXesU6cOTdRPSgFwplq8nlAvMzdCZRto
X-Gm-Gg: AR+sD13omzKWxKIU8aurbq/J/z8XdBP6cZUzf2OmrZQGPFnEhcxE8VOFeGlp82XH830
	o2JODbENV0k+uofZC7qjeqyyH/rjQAjkX6GxfXybbra2HXFspu0hMxTQ308kqGPOKGwxmc1DdzU
	EwV98VAOwKwxTv8Gdd1YwpBMAfWr655xbIOfnAEddfwCgjrnhs4u7e1hhutCOaJZ5+RRIhCvs/w
	5lU5OssR4NfYDyfMP13gWUK7zSHwVX/FtXgKqzGRI6IB+paX0vlmA6LUpLxXhViCPbtL1g4mdfg
	QBrK0m5hq/UFWbWlhcD92Ir0eJYwlZPccrcYr9XbBngYH+/8fMgNuDEkVj12PfOvnVYCqiImWOt
	7q9/v6PurFrcYkejoW77BSafIWms2AM1m7CgJGWG+wvrpeIQXL13UEm2R+NWZXQKPMK0+yprHus
	9Bi0BzrQgD4AiP
X-Received: by 2002:ac8:7e91:0:b0:51b:f217:539f with SMTP id d75a77b69052e-52d85354a61mr315349571cf.17.1787024996079;
        Mon, 17 Aug 2026 20:49:56 -0700 (PDT)
X-Received: by 2002:ac8:7e91:0:b0:51b:f217:539f with SMTP id d75a77b69052e-52d85354a61mr315349131cf.17.1787024995589;
        Mon, 17 Aug 2026 20:49:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa875bsm875722e87.32.2026.08.17.20.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:49:54 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:49:52 +0300
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
Subject: Re: [PATCH v2 10/15] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
Message-ID: <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
X-Proofpoint-GUID: VZdImNdzL21V5qa2_Da3_MIaefRkGcb-
X-Proofpoint-ORIG-GUID: VZdImNdzL21V5qa2_Da3_MIaefRkGcb-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNSBTYWx0ZWRfXxqWSpAk2S/yK
 yk4xyexPg104EjkX8my6RmgX2zXU0HpiR6aGNh/ky4DGWTczMmUnlPTJIOkn+samBXjlwRwkvKU
 izDn+KwfM5w+gbkIZWsg06rAw6um9B+EHZhAPb5poCb6h0yoIJ27WT5tCcnHXhHRcYqyz+43MV5
 bZbn4wozwAu2jwxwx2m/dcycAVHLNdd0SpiI5oF4wMxbYFKMj3GJgGBWr2ChSDLgw0mWjbOrlt2
 OW0iqg1SSJNPXyEM8ZwhKhH4pmbM3fwlCmeXvcPz4/CRIYNbubwMiBxX1ChIZaCFTjShiUZswUl
 Gfp+eo4+K02ElINIkH0BQV1YLspJij4XaCx092ntlUjs4BDJ5VGIVh/3eOL9ZeTXZR9ty3ua6yS
 XXEZ+DcCjw+bfWZ97JaZCf/T9DmTAnJOK7p1YgRoIO6UneuuCA7og71LI7tbEclfIz4Tqrh3e0z
 VTqnef51pHKiUgWQLow==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a83d665 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=eI_CTGzUyT5ilQvOjN4A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNSBTYWx0ZWRfXyBJw+boMvinN
 mKNlcdJ7f0gVAqhGjA4HrTUF8njMcsyr4zF5XrZMKDf0Ed7XabupMVXlUTnLVCgIP24mb30WMhR
 AfgM+YyudmKIEsKbZOvNJOasUsmLqQQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180025

On Mon, Aug 17, 2026 at 10:17:45AM +0530, Ekansh Gupta wrote:
> Expose two new DRM IOCTLs that allow user-space to allocate DMA-backed
> GEM buffer objects and retrieve their mmap offsets.
> 
> DRM_IOCTL_QDA_GEM_CREATE (drm_qda_gem_create)
>   Allocates a DMA-coherent GEM buffer of the requested size. The
>   memory manager assigns an IOMMU context bank to the calling process
>   on first use and performs the DMA allocation against that bank.
>   Returns a GEM handle that identifies the buffer for subsequent
>   operations.
> 
> DRM_IOCTL_QDA_GEM_MMAP_OFFSET (drm_qda_gem_mmap_offset)
>   Returns the mmap offset for an existing GEM handle. The offset can
>   be passed directly to mmap() to map the buffer into user-space.
>   Imported DMA-BUF objects are rejected by drm_gem_dumb_map_offset().
> 
> DRIVER_GEM is added to driver_features now that GEM IOCTLs are
> present.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/qda_drv.c   |  4 +++-
>  drivers/accel/qda/qda_ioctl.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_ioctl.h |  2 ++
>  include/uapi/drm/qda_accel.h  | 36 +++++++++++++++++++++++++++++++
>  4 files changed, 91 insertions(+), 1 deletion(-)
> 

The patch LGTM. THe commit messages needs a rewrite

-- 
With best wishes
Dmitry
