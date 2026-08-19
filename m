Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D881B346784
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144736; cv=none; b=r1PiWaknD4YQPDzpdTcg/jky82hBoH7Dp9U0mCcTGZ/xFtcQ9YH1GUm8hYLbvc7N4JqUlzJNH13UAW9hAC5e/iK/k3zDwieYwtHU7JKe5HPLWWVBsqBxFv2N5jCnp3H64YkpTvUR0erBQUBoeeqGm7kAesfx0Tvu/ffDougkQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144736; c=relaxed/simple;
	bh=yeAn53QhD+ejLswrNzkwv8ur2hDkhwUdtZ0G7WwZFdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJPb+GR786hyGA02djVRMSqXWNF/i+UOV2VQOt+OfNOIU2466MRy7/vJFangcuk2xJGCdCANb8evFwy5wz3c/7WQtmnWYVd1QfZ7YpVtUY9G622LjKc6Lz9r+ZCRQV1sFfEVGrC+b6/8JRuTw1rTNrINsfmm2y53RmveyVNYh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2LMLWRM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsSz1nNu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2LMLWRM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsSz1nNu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0eAJ3601109
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=; b=K2LMLWRMhSf9IfQR
	DpB6P5ILQueozCgCu5JXWzSpQPKmbFV9bRj4KnArcWAgE1E5S/gbqv0Vgd98elSy
	2Z7Qd9YrW2KiLmg3GAEsloT8Tny6ZBWrgy6GQZLMYy1EMqRXDc2c4syj+gfFTzQ1
	gjIbgeLR8+sYoUBMBOO/vUs+IBWDVDvT8m77dmmY6dwtHAdVK/5/N6mfB3Wd8rKS
	hkFKjswlekvfHUg/caahLolHW+47x2nNWMU9d3JilgNrSzCYD6KFkCTh69Hyi2bn
	7hlk3jq+7XnFCejQyDo8khR9H/FVbuJIXfSbKO2tEO8qqugq4AIrZYvPWbYY+VLJ
	jC5YWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3acv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:05:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cccfa32670so17427375ad.2
        for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144733; x=1787749533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=;
        b=TsSz1nNubAEjc0/gjeYzz3LRSvsRlpIoOG2dbSSJrGx1ugi1QabMgvzLOK51U+TfkV
         yJ/6FOU0JIw8hh1bPEWXd/wIGCJ4rbZAQMJqbbobn6u2TVkscqe0vORj5pHY3vwY+30m
         26YNvInFkSQQMw3r+z4bvlTNpk92sOkNWaqfK5MAV/qb74itdfORHZjYsomiynZnyFAG
         8lTvcw74hC25Y7YVSzG6gMGfMJ10F8qVKwA+AfuGhDtNnqdeuaOtH+o94LIdyMdYUvyH
         +edIuUkGuSbzsTy+Ti1xfCVvC4OjPqEeZcKVZyNNPR/EL3y7/mQBIzaXDwnjYM+/2m9e
         iwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144733; x=1787749533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=;
        b=poy7lTX6kvZnOcrhBQ4TyBggtSjizSTpLwKP8AsgYUAyqtnXBBtL5Q/KR3XvABN8D+
         8cduyQbf6EbOZeNPdZya9NJYVqRp4KKNYPukEY5GlDVGLvjORIMbk6u2TyPQ9/2sgrMB
         eRsAGbAedkVGNOpb2k61Fgicx765mYPW1aSWhXqy4hhpYn36U5rRNrc/7Rmdg6uLWZqQ
         bIYOseHBdkEw6vRT8ELIuZ116T3Rk/8Q5f5mzbwORAJ/WpX74ehpuxiFiJE6zgIdaLcJ
         y9pSOYEIaU+MFXkHlZYOPD9VOyWpxRVQSh2U6GvsvV5PB9Iax833OjwHZ7d6UWuKXGWL
         JisQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGnl85GNJ9LaWOgjN406BJKpp9jGJez/cncMUgewq4QqnHyfpd9ggnI7bvUN3oM4NkzHTg@lists.linux.dev
X-Gm-Message-State: AFuF++kcD5WkpaCzEM/5n96Xs8xwLcS5TJH1DjJIg89eROXb1vJ0htUm
	Tal7kcevCd8HTIGk9KsEOfpNmsiVrOrRyE8q/sutXrfXte4seTsh/IZtCmnnfHJZtIl57SIb4cJ
	T85kPPV9TifmcVoGbK4hJ8W3d6VR3FMugius6QnS0LuGYWq5aASvkqHl7
X-Gm-Gg: AR+sD11syC4uIq0lkIeoSNWxmI5AtVPbMMC+l2bouZafvdw5SRRWb1nHc1XEdlOIZ0G
	PKKK62Mjn+bQzLLrHEAV0VVLf8TY33St+KROrjwj/UqCExK6/LwH7c63yP7RzpzFIchRfCFX79M
	/N9J31t4L+iZPGYkLyrSMJhaqgfWVvbffL37pf+Cvd+ZOHE/vx5eiRbVBa26qrVEnKlAb6TXRUy
	gqdraouxgmVHEIYxzU4IFyFQ3Wa+FL5CbMn9WWuJf6NekhVFAuxR4oGMnvn6TBu+pmIq0uX2M8K
	xJbVpRs9n1byD89XRllAv1InCq6GG+kMbm/XTQFnJArwowELVeqMYE27JBAqoOjr1SA/2ohD5Uz
	ZadB3bDIGDQ2DMHChINfTcroCfbYsWQ==
X-Received: by 2002:a17:902:fda6:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d60186263bmr89344845ad.11.1787144733034;
        Wed, 19 Aug 2026 06:05:33 -0700 (PDT)
X-Received: by 2002:a17:902:fda6:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d60186263bmr89343405ad.11.1787144732529;
        Wed, 19 Aug 2026 06:05:32 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e54330sm24796285ad.44.2026.08.19.06.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:05:31 -0700 (PDT)
Message-ID: <e0a25f11-5c7c-406f-a223-da29bf6e1401@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:35:22 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] MAINTAINERS: Add entry for Qualcomm DSP
 Accelerator (QDA) driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
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
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-1-69a02e9090d4@oss.qualcomm.com>
 <cc43a545-20a1-4f15-a7b9-ca48842bffca@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cc43a545-20a1-4f15-a7b9-ca48842bffca@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oiojxGc6EU8g0K8Sjs8_gzx6o6cEni2w
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a85aa1d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XbA7GbUpZyLIT2ThUnsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: oiojxGc6EU8g0K8Sjs8_gzx6o6cEni2w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX9aYP2JUXzP+p
 Cu2ekDAVOi2eS/se10mL4p0sZAnHatTZUcIswUTk48XRVW89WF1R/XCPmZaa8+VBsnhCUKpVz4Z
 Rrs9W64PqlbemLVVEv4LAnYNThWrDXYpt7Ldcy+wevQDaAZkDZEImd9gD+XIhmIXRCX76hD/QAH
 n3HEirlKdcHnQy1fvrYGDvQwRqW2fq5oAIJwtzQKeALftpEG6SisWnOBU49XxUxbaehP43rv6dV
 fgd2A4u4SE0rrtkwaNvBX3zPZod6GgXBBclTXGva3WAIlqg40HFMQROE65eX436serBIjYGDWGx
 /mZwaZ1doX408NpEhwN1RCPVcuwd3NSKu/fHUrncWQFW8EFcmVOYg2UfapLrlcm5EdtA4D4NNLd
 9G4wFJN99GnWrFMZFE1UwHhOZArClhcvzfw8jNEfgRCIK5XlW5p2YNzvNKv9E9OA+6gz06rDNJP
 YVFmv/rst/nc2Vg+40A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX6XHBoeucud6x
 Y1gkG09wXYU1C7rIbIvZXKrKOGpXx+jLsKfyNZXA1+icAkacJzWAZOKcf0vH92Czo17yUquvriC
 FKQyklNBWNhULfXf5q6ty4dfUTTTI8k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190100

On 19-08-2026 00:52, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
>> covering the driver source under drivers/accel/qda, documentation under
>> Documentation/accel/qda, and the UAPI header
>> include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
>> lists are listed as the relevant review lists.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  MAINTAINERS | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 912837dd4640..75fa90c137c7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22388,6 +22388,17 @@ S:	Supported
>>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>  F:	drivers/crypto/qce/
>>  
>> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
>> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	Documentation/accel/qda/
> 
> There is no such directory.
the directory got added in a later patch, added this patch at the start
following the comment here[1].

[1]
https://lore.kernel.org/all/zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r/>

> Best regards,
> Krzysztof

