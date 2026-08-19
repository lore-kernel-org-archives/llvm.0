Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511503A451E
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145826; cv=none; b=u6EXfMmadAXXRQJVYvPFdOEne6YBQHn/f/PtXGreLiVbOTfPQoVceKDsvbeolNgkxm5UBnze0e7obHKiBr6MeVvJgU43iJ2o+ve0cl3Db1nR/LqSOng9a8lxPtpEI51GfVPWCuD3pKF+9bn/mUQ3hCaIkyBcEjDPjSZRymiPDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145826; c=relaxed/simple;
	bh=8zEwHcSWYL+PfZ4t4xdDkAMyQ+XUHLz3oKHb9rAeYm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2JHwskBS3Y156ylLi/EAuj2FO4AtPFV3gZE3FYXXa/o4/Xge8p+u7PA9i9zzrOYViOwMEA9as4pNHAwY4wi8F3K9jLdH2001xb7n3ZWADAWnJL1hcD6a/g/o3i+HLMm35BecUjFH67MdNgsFIBsrF0nqkKIccas+3t6ExKY9q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phx23G3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+xsEusr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phx23G3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+xsEusr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0E6b693417
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=; b=phx23G3q36vzMkjD
	VzSOvzfRbKIAW+NIz7GVj/qufa67rrbVOaMgGYh5Vrz/zqSJprH2dHldiPQRoFSW
	sL/UvxndBrdBv4jcC+3gdRO+ib0m+i66VpURNp2yiEQa1txsI425LCh3WG5tyiXx
	PKYaXmLaDUEUreD2ZIxm/RmYvnARoQYjAup3yKJ+rEan1pc6LEdDWR1e0VBgh94I
	ecdJaJYTpYdiw0msc8AQo+ddKlmh16ekSYkFtzXqh7NANfW3C3VJxQbf4v5ClHej
	epJIqB6zEwGILuMhCWFzoywy2kbxqPQ9xIX8ePXSmygwIguQuVx+ud+uZzDwD6DW
	Qm6OzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmbcfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:23:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2065060a91.0
        for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145818; x=1787750618; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=;
        b=P+xsEusrJJ1UsKsBd2o9ao0iKRaPo69DmsDLrtjHGoL1xZO++Tl5t78OlOmTWDPGdR
         JL0i9/x7/oQPrADe8G69gwaATzxBL0ENZ8daNFlbB8JugKBztsixIRgpXGzE8Xt9oHdB
         vAx3DGRUkGLiGxSYKCuIv8EXW+/8H0mkvW70uKLvVh1uMDbkHKRh/L2tsXgyYDAk3G3e
         SKhBOffHj1PlzTcSd/uy5tbWS/QCM/ZjrHAC/La9IQCFRVLu3M7mSfkEi8LHYY7YimxY
         GJty9PIwpf5hZ5axjumhy1JiG/eqyfHEcAj+RvPb0Il0KM1KMtvtRJkaluoIuaSREMRl
         zq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145818; x=1787750618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esjYOP0cHWLWtJ/S0JzZjMyOobiP2YG5+HUVououevY=;
        b=ZnMsOk521DdUEMdOmte0QRw6VTYUCdraNDJMr/9vg+4xGefqT/aIQL2uzf6fJpS/Gj
         mMNbAKvJ+jMW3v/0YEpXzfKXg2Y7jxAHqxcHTBojCz8nTPL3AIxetNQHh6mutkAtWrKR
         KxQW4x8D/sy8OPCd4apS/jNS8boKy+va/KGozjVEvU3gZVAXbumQbvzreQySh86JgzXX
         scC8YZEtATuyZBUHJKVJPwf3Gt+klZQeD7NSMG/r8nlpUKezMQBSgEfORSQ76prV4zSk
         Csp+xi+eEIdsXfGUzPkUT8ca9vBwOOtJRgSQ/4Qs4CBu1eCjz55d3JVoHsWlh4U9jR4t
         XFuA==
X-Forwarded-Encrypted: i=1; AHgh+RrC0SjHCdZlL19enOAbwDfs0C5q65oaBqTQjln2AdzAxhYDkezFXT86WBBNz6GImnuVXpqV@lists.linux.dev
X-Gm-Message-State: AFuF++lVlyGYIKSKWrHSASG/Omu/FTeqeRyPOBqJDT7OYyEWKnaJBi8h
	vHrv3WuiMk1PFxf63z0CCCPJtH93GuyuBIQcoQCcMOU3DncBULEW/s2LkWCmq+G8ZblQ4Fj/HOO
	09n7FBxvyndpfqP41gU1vYD7/mdl+kWgHaF+20McG3p3xC1vzyOiCSdJM
X-Gm-Gg: AR+sD12HmD14ASaXSN+UUPY5zvXsOj2OVMYLC8bU8BIl/YqPeZx7NLg9opC9QcGheVa
	Z4d79L2MLFEoHmdNRP4OhsLouugXElzlF5tm8tCmO+GzOYGdJkUQD7S4DXOe2EfSvYYxI2Yj3tF
	Yr4gNXXYa0+U5V1pABGBx6pi3IvPCC06Dwn99QMIGLRkuRbTOR9S/j7osKu/QgjWcyzikO8x4in
	SJlSJyK/S1T9BKoXn/eAzSckb5WA8EyIO4yUYHQB2ROhEAKTv7nT/TgHh48zRpVGhyVAxRCnhN2
	8tUoJVr5nLKDsGxpYLwpO11DxVYsw0+rX+zCKVqJvac5d73DRAWMwjHNal1IspK80yc2jIoIClz
	F4MzSsaMJnotJSpAUBplC+MrgWuYRww==
X-Received: by 2002:a17:90b:4d83:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-39580a91ad5mr8388467a91.2.1787145817282;
        Wed, 19 Aug 2026 06:23:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4d83:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-39580a91ad5mr8388382a91.2.1787145816848;
        Wed, 19 Aug 2026 06:23:36 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f9aaa12sm2843059a91.5.2026.08.19.06.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:23:36 -0700 (PDT)
Message-ID: <cf502956-8c99-485b-bf25-9f89d81975ab@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:53:26 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
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
 <f009a2fe-5c30-405e-a942-696ea65fb2f3@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f009a2fe-5c30-405e-a942-696ea65fb2f3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: znJDDGmIt6A2bdGC4SEGQrSZETSNPc_i
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfXyjZyCCp4Cl3B
 wO1WIr8Kii+7yA/FwBSMjp7oXilyn20AGFirruiVeDAU/UFas6xF2lrHQMsgVkUdWOxqzxyBQSy
 H54jOtyuFGLyd6LWHOhu18KOSgJm9qk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwNCBTYWx0ZWRfX2KKVRK6VxdSO
 oHjiO10yD7WPjgt76eqcyQUrD+7+RCu8q8JletW4m6Tj+jSUHIGfi3ptLgs8OFkYYXHcGjkKenj
 HcrxE8Vp/7CPLHkUmF0nK6N9dyWbXWHHw2UlOadVdA9o/vBqQnCmWKbSTJAhaXWrmPQjzV5d9nm
 o3qbwfNiF5C911lABq0BW7ZiazdwAasLgrjTjzmJDZ+eXofMLU0KW+r4eS0gsy09FDXrIPr0BfR
 Ys4xDS1HpGX4khTYZz0O1FrZtk2jva2h9KGoLbeWviEMYLqdMZbk8o9d7Ld8V97I+514WiZx3+u
 r0Nft7r/zcB+swXBLp0PM9lhVgxY0jIf7XcMwFEnp4inwX/Q3NFsbe6uoHmvbw/MSScxVgVCXOl
 9oIhycDZd3N0hZceg6uM8UBZx72bGRNTshRgLAZcHGxDI66a4Po6n1NxM0MPbR+lUyoVzRs1Vop
 PQslR8tHeatpbK/pxBg==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85ae5b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z9ogCWloIzyHX_id1hcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: znJDDGmIt6A2bdGC4SEGQrSZETSNPc_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190104

On 19-08-2026 00:48, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
>> a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
>> standardized interface for offloading computational tasks to DSPs found
>> on Qualcomm SoCs, supporting all DSP domains.
>>
>> The QDA driver implements the FastRPC protocol over the DRM accel
>> subsystem. It uses the same device-tree node structure as the existing
>> fastrpc driver in drivers/misc/. The approach for binding the QDA driver
>> to device-tree nodes while coexisting with the fastrpc driver is an open
>> item described below.
>>
>> v1: https://lore.kernel.org/all/20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com/
>> RFC: https://lore.kernel.org/dri-devel/20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com/T/
> 
> So this is a v3, not v2. Please start using b4 correctly, so versioning
> will be kept instead of faking the numbers.
I'll correct the versioning in the next post. Thank you for pointing this.
> 
> Best regards,
> Krzysztof

