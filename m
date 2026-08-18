Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB083A5E87
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 04:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787028031; cv=none; b=qxYifqi04P8P6KVUU0yjqvnqZlcKELi2jfkvVk/qn5cCmuQ0JJAyy0MM9UfPJOFid7kz5PECPzVFkgYJlohG+NCeCbBZIcbAkG8JYSU4zm1T+x9pTGtBSUmheI1J9B+Jof6y+OcCNNTuslKz54gDhVqCTWeVlftN8n/pYmjLmUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787028031; c=relaxed/simple;
	bh=SkI+jLB5PybtzDBAVH3JBTwadJx+1GhjlOb0OamvgDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfEnOyJlROBzPW5c303JhaIsf8pA9ykyQVK+WDNussVDbww7EOqz7qYgj+Go0z+SDVfPznvUa1YWU4Mj4SKiXHl80vMOgQOu5u3CKdfOHHFo4gXj3YrbuF3m7QXzHJTrN59qBWndaizdAX2SObsSVObuK3JKGjT0lLFuoTVlePY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZmsGspu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHGDos4W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZmsGspu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHGDos4W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I469bF4187370
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 04:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrzWHA3rSEs1ygei9S1vAZxJ/Pn8mnrI8++ukqsmDEA=; b=bZmsGspu7FTgZAHE
	gRBd0rBWRXtpP7UkhP9KoRFyc1yMqLpm1m7xHGcmM01K9ftPJHOXw0rweGqkv2Bp
	KZlNiULXfhiKK/ax3kHG7QDANYBAsOW+Ex5hiTRGux7/qwXwfsPb6uaj9QisHiLg
	ZIlc+4m8fRZ2wrXVEeZV6qNF1t+KRQKjhLB9T5IFbPdxmOo+cMtR4XJIrPXwyVq5
	gVwLx8g0XNw14LqnvOiGtFAhAF7kdz5GmS0DztvUapAM1PYaiGtI+mtKgqyZsEp9
	CMqva/aoq+bPOzCZrbZ0ZX3NfYqG2H1L+ecxx88lH0gjmEfPXwOU5VbH/PSJc5/J
	Gczyyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p04hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 04:40:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so627827a91.1
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 21:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787028028; x=1787632828; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrzWHA3rSEs1ygei9S1vAZxJ/Pn8mnrI8++ukqsmDEA=;
        b=NHGDos4WLu/NxXodgvQszZQkxMYuThiUCdcyM8EkRhrxhUFht5ar0NlmGuPadwCOHy
         SpkcZqrgvFYgfnSdp387TDWN3boroOFmhDKKp/qRAdwqeOfURDTvd8nbdbtcmt6y/88N
         q5p1duvtypBg4BbBd5Z8iFmNgM9lVVjOJh7lM5Xu9y/ggAJVLGwwJvj8XATsD44xG0lG
         VRrgL0lRA9FdvXYHw9BevKnTJl9UU4/NGvQlN8ZT7S3gRIljjT+mxyozFRNfFhsv8hkO
         gq5WCIc3Ebm3HSt/t4FX9e4l/JoQAHQ+Cb7C3tNrEGVTznmiJ4glxr2AlyYI/ux+C56/
         UcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787028028; x=1787632828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrzWHA3rSEs1ygei9S1vAZxJ/Pn8mnrI8++ukqsmDEA=;
        b=GX/d438YKaX0b5GwdB8mxKh4q2DlJbTulf1bCAnBpzllMo7pyOY/MTdvjCCiIYVdCr
         rUjwFeKUK4v3333cmJBxxhaAhV3ECk8HoqGrWwgE17LsONj7Zz9tP9wXq9LFnOBlx5TD
         pc3jWC6RPQaWPQVF+Eg5BstHezYdTZXail97rOb8NGgvexBn5iwQ9ciLPV6iUFa6u/Lk
         0nHwRFTllHDeRllCblm5Pga7x2yjw3UuaiH8Umr9CNyMQ9VsHak2qv1cnYqZNR393Wtk
         Xt6lJzMkVaR81MapuRFv+2u2dZ71ttnMg3Wasin5pHHsKjIHr/spKAg5fIn0dsvrecA0
         YfXw==
X-Forwarded-Encrypted: i=1; AHgh+RoAhSxpi/RrgN/ujEn56B/cuKnPBPlDRlirdtJ/y6qvhQmzXza5XQZ183TRQDLsXctHF+m0@lists.linux.dev
X-Gm-Message-State: AOJu0YxkBGbZQgeWwVrKrn4/JHWCZVEJqOv8H2ryRDP+cQ3DeCOMkn+m
	vUujR/1V8GCrq6/5RjKzgjiulpPY7djvMPXJ69L73E69JpQYZrpdkO7wpir45F/FIx82+evcLhj
	ISD9hTqtkmU+DQRQ06/AKHn1UcityWYhie9/82BYzmn3sjiNpThSiAxD8
X-Gm-Gg: AR+sD10zgNgkpyFz05Rg4oMpKtECms4SJXOQsvC6808gv19MBxdFv7401UpUVe/8Wtl
	dRSCUPXgyhqgtFo0Ym3SblXi4TDhrcKNuTJCS7Me9CocHaM2kMT/yWNTgai/zkIEPlwHKFBzjiM
	OvCpDn5zhBcC9L6+Wl5xdbMuk1YbPAzfxSygztcV1qOYVRVZEH5IJGYZX/d+vmOu+3e5kARbFEM
	B7QNeXNxisFOUHJTx3QrzVfcltfNuQrnV9UbXWWsUjqZLkrNVUPHQLfw0nH/F8WUF2fWrV2qucr
	m4TwrA5nroYoIKXVALKXHmWuN9rj9vNrBjlTPF5Wo14uTwgUjjjtSg4kRr7qY4kufyKFZJR5CEu
	8uLtjl+iVU+dbDJ5vwidu8PFkEzfM0Q==
X-Received: by 2002:a17:90b:518c:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-3955f17c702mr3916857a91.13.1787028027480;
        Mon, 17 Aug 2026 21:40:27 -0700 (PDT)
X-Received: by 2002:a17:90b:518c:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-3955f17c702mr3916824a91.13.1787028026993;
        Mon, 17 Aug 2026 21:40:26 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e35bsm11880079eec.14.2026.08.17.21.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 21:40:26 -0700 (PDT)
Message-ID: <c54f5212-809e-4517-beda-f86b375c086f@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:10:16 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-8-69a02e9090d4@oss.qualcomm.com>
 <r7bx25akbxomzhxxyqd644efy2vc65etwcnhlyha7wm7xrt7ea@p4v5sesn5rzw>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <r7bx25akbxomzhxxyqd644efy2vc65etwcnhlyha7wm7xrt7ea@p4v5sesn5rzw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZtoJnhrqyHIoTLkGNWbJBGAlAphPrcdS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfX0NRBFa138c+X
 dERBv3WbMZRT3LJpnG2OtMbT2jN4ZP/czkI+8y4uUn12cMbSYtl9OyHlQ+b4M5zcb884y2nokF/
 E7FhnWgbb5/umhvK4515AUQ1GiVYB58=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzMiBTYWx0ZWRfX/W7UteDmPOPI
 Ajvmyb8XuRXT9psdgmbSa00DL65UGfTEZp5T7Yn/qXxNxOCZnfHZzPRF0b5ydG3w+x6LoZOyH4U
 MscQZNb6sANevv4akEgnbtDv/eGp9Eb9iOG8kgXZU9qeE6ouzvKFmBnUllB5SFFzt0Z/d2H2Way
 0aC1Ka/7J71bHO/ik5FwVbp3GcfJI7blr9uDgzbadBiSUEJnQ6EG7aKJcB7NAiMYhPOpCsAWcJ1
 EBSQaxPkpPw5L2GL5FwFiTOF/3QwC9fBkHhiMAe09oQhZP+pC8xMgkOMaUIc4TjsGgO+mHs9/Sq
 FtLbFXJqwDcElod98cWy2elnL0c7cRDrGy/927jV/v+Qlabb6s6yMepU3dhmm2oMAWJrObY3xbr
 5gHE4Yh7v8BNPqgYFyNM2DHJyhn9c5wvFMH/zyOCU+5RejaXLsxpFCPbQQlMmH8GcFDDJ4xGMR8
 N+vUIXWIDZSlafrzbMQ==
X-Proofpoint-ORIG-GUID: ZtoJnhrqyHIoTLkGNWbJBGAlAphPrcdS
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a83e23c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GCkxi1q0J_mCzIEPFfUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180032

On 17-08-2026 12:28, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:43AM +0530, Ekansh Gupta wrote:
>> Introduce DRM_IOCTL_QDA_QUERY, a query IOCTL that lets user-space
>> retrieve information about the DSP a given /dev/accel/accel* node
>> represents.
>>
>> The IOCTL takes a query_type selector as input, so it can be extended
>> to return additional parameters (capabilities, attributes) in the
>> future without adding new IOCTLs: drm_ioctl() zero-extends the argument
>> structure, so new fields can be appended to struct drm_qda_query as
>> long as they go at the end. The first supported query,
>> QDA_QUERY_DSP_NAME, returns the DSP domain name (e.g. "cdsp", "adsp").
>>
>> The UAPI header include/uapi/drm/qda_accel.h defines the command number,
>> the DRM_IOWR IOCTL definition, the query_type values, and struct
>> drm_qda_query. It follows the standard DRM UAPI conventions: fixed-width
>> types, a C++ extern "C" guard, and GPL-2.0-only WITH Linux-syscall-note
>> licensing.
>>
>> qda_ioctl_query() validates the reserved pad field, dispatches on
>> query_type, and copies the DSP name from qda_dev.dsp_name into the
>> user-supplied buffer with strscpy(). Unknown query types are rejected
>> with -EINVAL.
>>
>> qda_drv.c registers the qda_ioctls[] table with the drm_driver so the
>> DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().
> 
> Please tell your AI agent to stop describing patch contents. Ask it to
> describe the reasons for the change.
ack>
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Add a query_type input selector so the IOCTL can return different
>>   parameters in future, and switch DRM_IOR -> DRM_IOWR so the input
>>   reaches the kernel (Dmitry Baryshkov)
>> - Reject unknown query types and a non-zero pad with -EINVAL
> 
>> +
>> +/*
>> + * QDA IOCTL command numbers
>> + *
>> + * These define the command numbers for QDA-specific IOCTLs.
>> + * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
>> + */
>> +#define DRM_QDA_QUERY		0x00
>> +
>> +/*
>> + * QDA IOCTL definitions
>> + *
>> + * These macros define the actual IOCTL numbers used by userspace applications.
>> + * They combine the command numbers with DRM_COMMAND_BASE and specify the
>> + * data structure and direction (read/write) for each IOCTL.
> 
> Is it not obvious?
will fix this.>
>> + */
>> +#define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
>> +					 struct drm_qda_query)
>> +
>> +/* Query type definitions for drm_qda_query */
>> +#define QDA_QUERY_DSP_NAME	1
> 
> Why is it necessary for the userspace?
Currently the requirement is that on systems with multiple DSP domains,
each is exposed as a separate /dev/accel/accelN node, the library must
query the domain name to select the correct DSP to offload to and use
other dependencies like shell etc.
> 
>> +
>> +/**
>> + * struct drm_qda_query - Device information query structure
>> + * @query_type: Type of query (input)
>> + * @pad: Padding for 64-bit alignment (must be zero)
>> + * @dsp_name: Null-terminated name of the DSP (returned when query_type is QDA_QUERY_DSP_NAME)
>> + *
>> + * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
>> + * based on @query_type.
>> + */
>> +struct drm_qda_query {
>> +	__u32 query_type;
>> +	__u32 pad;
> 
> What for? If you have u8 array afterwards, you don't need the padding.
I'll remove this from here and bring it later if we extend this ioctl to
support other options.>
>> +	__u8 dsp_name[16];
>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif /* __QDA_ACCEL_H__ */
>>
>> -- 
>> 2.34.1
>>
> 

