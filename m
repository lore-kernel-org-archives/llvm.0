Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD137F31C
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145482; cv=none; b=vE5XxolKuGZwHRzE5mb0lMVZpXmdbyWL0I01EWZecESXPPNnT2q/+HfHwDnyRBN6xJHU+IIFDr21+bk3lG90UqXIXZa0Occ6yAp8otzKC5inaq1oOHwY/P1u7L+3oGy3154gopP652u1OclbSmWgyBPeIuByMy604aARaCku/8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145482; c=relaxed/simple;
	bh=+dq/mMnDe9QFfq17yLaBK6nHu+80T6tyc8mfK+ZvPkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iolBcQJeIuMD35EdXxYFVzF6fRZh5n494jrqwzkkPd+071tRn7uvnBYr6kH5CR9O7jFYGT3TVko6u8FkFsItdp9GdIuGGgLwl+iEkOueXgbXqiL4M7yzQH2RRQPUneEjHos9EM4ZS8ceMcbI/fBUD+j+djXyaG7lyZDOSXZQm6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTR/FC8r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C501jhYs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTR/FC8r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C501jhYs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD08tg174197
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHcojprWwMclTR96W1Kcp7mAYQX7rnuvUTwbQrssUdg=; b=dTR/FC8rtsTF0qmw
	JN8frrhbf2bjGgTihPM4XakQB12zomE1VpKen0fOtSgG46aHEXyCWFOTuRZKS7Rs
	ErV6+SGTMSgG3cxaldLhHs3QGPdbiyn9rNpTe7JjLbSzMfqopRCRG987PZcfAFP3
	4RMg7P2JPaJrnnQ7ssoi1uBBUtLtsd+EBKmGH2JOp3iaFEp2xOORM+hyYlcjI+LN
	uVpR0jSaAvc19aIOHICGZ4lUAbji2Hanp3LjYjHTNKhVcpF/n17pggSk2jnYp/4E
	l5I7Lf5/9XTlCfsMkCZYDby3WDNf8pXxOLhPUtjSUGqljtRZ+UaznP0NSLi1KdVB
	2EiJDg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkfjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 13:17:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso1172800a12.0
        for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787145475; x=1787750275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHcojprWwMclTR96W1Kcp7mAYQX7rnuvUTwbQrssUdg=;
        b=C501jhYsdW3Rs7N93PuW5MtL6uPt4DW4v+O1L+JVxSVh4KO2ZMbSbBcqaPKjjYo0sx
         pSBtK7omDf8+PGpQvrGeSc083rTfThP4AGknnl2TjC81DmTcZBwb7e+pJi6GlxBDxIuo
         yP4UdnahgG65NwbOvFAqXNvsWpX4KSgponWNanmnSv1sZwSKKtc1XUldi1DyyAz72Yyy
         0Wg+ZDWd7o8bN/EeYLUrHMWdatIOfnYUxZoQfut8M1Hn3i9F0QqbDCUu23kKl9lTl1Pu
         Pz67YRT4MM6cbACL3EgkfMCVvX4PmbELqwDK1jmhf4T46PjB4EeXUsIaGDajp2mKKoIZ
         3t0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787145475; x=1787750275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHcojprWwMclTR96W1Kcp7mAYQX7rnuvUTwbQrssUdg=;
        b=BIoTscwb3ZwRpUBR8DYfRnHHtHSmYOJL3b8XjMSoK6CqUQ7RqQz0EbYVq6389vRMBy
         ZFDOl0+e7FYWqdbRBsyn/EtfML5THarkJfH6gZOGFkq8zb9ngySYPaOLtucZ/0iapj3I
         wk393Hoq58JxnE/yVSDl0stztWVtHRPh1dycd4X37Ev5d5vkXrlYW2ZcEmSDokPrbYmm
         7f0NAk8nbsD1uzIM9Md705Z8YNcGGxinn1Mb3B3IuuxVbZRdtENH2FnYgrCW8pXHsvhv
         0QI4sRh4GQvrHrE06llvLErYzvcxzfh1uNZAP43gKP5BuOB+DXufkNfDe93p2xd/HGz0
         g4nQ==
X-Forwarded-Encrypted: i=1; AHgh+Rperqf29TAWcnNEsHLT8Eu54sTQxmrY8/+53IviIR9ebC06ejXFOW12+nCnu5EzMFfRiadI@lists.linux.dev
X-Gm-Message-State: AFuF++lzi5ji4P8T11MVFyWFBZTC7icgVYp7EFfZJ7c7K2MopcMba2L4
	aq/DFI3wnvQthiLAD/okCrCGDYk7uqmIvNFneOowQ7sdxDuTVVPU/wc+zlVJPBQHbPUgubXK6dq
	Z4TqjHL4tVsJUa0bXuFnSa/knH26MjL3ERUIm+0KE9MJHKhzT0/lS2gSM
X-Gm-Gg: AR+sD12CE/MfMaJgOL1iXxw1gwPqEL/KccADO0EzlslDI/qAx4qFqVaQJb9OepEg+yp
	3m0Hzbkye816TFv5B/GfHAuKgWfL2vwISzLtLm/2vthS0MLsKl4sKUJoAYMeL3AproNCIwmIPVe
	k1rEHgvct1rCmHSz6HfKVekEg+TbthNAdV4WjMPdgCSFCgkUNF8VWEBP6ol9OULvRX7E0zArJll
	ABdUanOUUT4eA7+l+czRCLk3ylf+hsKz2J48Ee1o7ov7JSeB2wv9Pjq58tt6UT11EBqrGHQu2CA
	8+iI//67wQHp2KQ15TCazezWqladHdfKz1AqP2CcNOvrzXwnbPHrKUCpp+AndbYXArhXdf5CFkl
	O+Sd3cjONvuvjdS4NKSMQxKz4YsNr8Q==
X-Received: by 2002:a17:90b:57cc:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-395810e93a0mr8967636a91.14.1787145475191;
        Wed, 19 Aug 2026 06:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:57cc:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-395810e93a0mr8967481a91.14.1787145474636;
        Wed, 19 Aug 2026 06:17:54 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f7c962csm2756751a91.0.2026.08.19.06.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:17:54 -0700 (PDT)
Message-ID: <3476b5c3-7983-4994-a901-3d7d8bd75255@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:47:44 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] accel/qda: Add initial QDA DRM accelerator
 driver
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
 <20260817-qda-v2-v2-3-69a02e9090d4@oss.qualcomm.com>
 <81708487-89ce-4cd5-b39a-2989bdce6088@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <81708487-89ce-4cd5-b39a-2989bdce6088@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMyBTYWx0ZWRfX/osytzmH/cg8
 06gjLxjz9r80xhgCa4k+3F0Qa+9ibvDXlfEPzMstAqZCw9PYNNbJFsA7m5aAGHYG6ksSyCA4SoQ
 2OyS0+0E1ftyWTp5XMaz3y6cqo4pb4A8dfuMKrJs3R0T0W9uksNlFt2aFpXJZGUumkdEjPhcnnU
 gF9c4qA2rSznh2xvqf17P1eqODLknK1D8KDdP3ynwvNEKMGo5O/3rCABjUa5p7NK6TD/SUCpin1
 veVsh3k3H+YABSUfn2BZyYkgPRIqlclLQgiwUUKzQtzondyXYHGnjeQXEVqiEQD4gThgeTsW9OM
 0b7jO/xoMXmmci1vzNonZ2n5IORBTb8qu3TshtoClGcXbHCgyLxWosK9QpcehAwStqF+Fm3FTur
 6//k50PqtUyPwcLz6JOhgS5aGrvoGrf0LjyBYamR3wcMlAWHMD5fd4zQTkz0aaGu5vDzLoEqdSW
 U+M8ByNIb1FW6MaRQUw==
X-Proofpoint-GUID: 0JmQxC9B8217wwYIVsGuvrA-u7hMvalC
X-Proofpoint-ORIG-GUID: 0JmQxC9B8217wwYIVsGuvrA-u7hMvalC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMyBTYWx0ZWRfX4M/36qEJKfAr
 0Msws2woYQUU6SDI3ym4g1lPNQ+EMHotCA/eENyL/EvVCF10+eg0QSuuVikzhksLyStgrK/jjzb
 C4X+WiVgKFu3TPiQhHmn6UGZDZumk+0=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85ad04 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=fiCeWNywFvmbcpy1l9YA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190103

On 19-08-2026 00:40, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> Add the skeleton of the Qualcomm DSP Accelerator (QDA) driver, a DRM
>> accel driver for the Hexagon DSPs found on Qualcomm SoCs.
>>
>> This patch registers a DRM accel device, exposing a /dev/accel/accelN
>> character device node, and binds it to the RPMsg channel used to reach
>> the DSP. Buffer management, IOMMU context banks and the FastRPC
>> protocol are added by later patches in this series.
>>
>> qda_drv.c / qda_drv.h define the drm_driver ops table, the per-file
>> private state (qda_file_priv) and the main device structure (qda_dev),
>> which embeds drm_device so that it can be recovered with container_of().
>>
>> qda_rpmsg.c binds to the "qcom,fastrpc" compatible via
>> module_rpmsg_driver(), reads the DSP domain name from the "label"
>> device-tree property, and registers the DRM device.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Use module_rpmsg_driver() and drop the qda_rpmsg_register()/
>>   _unregister() wrappers, module_init()/module_exit() and
>>   qda_rpmsg.h entirely (Dmitry Baryshkov)
>> - Read the "label" property directly into qdev->dsp_name (Dmitry Baryshkov)
>> - Drop the probe/remove/init log messages (Dmitry Baryshkov)
>> - Return the result of qda_register_device() directly (Dmitry Baryshkov)
>> - Clarify the Kconfig help text (Dmitry Baryshkov)
>> ---
>>  drivers/accel/Kconfig         |  1 +
>>  drivers/accel/Makefile        |  1 +
>>  drivers/accel/qda/Kconfig     | 30 ++++++++++++++++
>>  drivers/accel/qda/Makefile    | 10 ++++++
>>  drivers/accel/qda/qda_drv.c   | 71 ++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_drv.h   | 61 +++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_rpmsg.c | 79 +++++++++++++++++++++++++++++++++++++++++++
>>  7 files changed, 253 insertions(+)
>>
>> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
>> index bdf48ccafcf2..74ac0f71bc9d 100644
>> --- a/drivers/accel/Kconfig
>> +++ b/drivers/accel/Kconfig
>> @@ -29,6 +29,7 @@ source "drivers/accel/ethosu/Kconfig"
>>  source "drivers/accel/habanalabs/Kconfig"
>>  source "drivers/accel/ivpu/Kconfig"
>>  source "drivers/accel/qaic/Kconfig"
>> +source "drivers/accel/qda/Kconfig"
>>  source "drivers/accel/rocket/Kconfig"
>>  
>>  endif
>> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
>> index 1d3a7251b950..58c08dd5f389 100644
>> --- a/drivers/accel/Makefile
>> +++ b/drivers/accel/Makefile
>> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
>> +obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
>>  obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
>> \ No newline at end of file
> 
> You have trivial patch errors.
newline problem was already there, wasn't introduced as part of this
patch series, so I wasn't sure to fix it here. I can fix this in v3.>
> ...
> 
>> +}
>> +
>> +static const struct of_device_id qda_rpmsg_id_table[] = {
>> +	{ .compatible = "qcom,fastrpc" },
>> +	{},
> 
> Device node with this compatible is already populated, so this looks
> simply wrong or you are adding a duplicated driver.
> 
> That's a no-go, you are supposed to work with existing drivers and grow
> them.
I'll bring the discussion again here, there was a discussion to move the
driver to accel subsystem if we want to support new features/uAPI
changes. Please read [1],[2] threads. The intention is to replace
fastrpc driver with QDA eventually.

Do you suggest adding a different compatible, say "qcom,qda" for this
driver?

Let me know if you have a better suggestion to proceed here.

[1] https://lkml.org/lkml/2024/6/24/479
[2] https://lkml.org/lkml/2024/6/21/1252>
> 
> Best regards,
> Krzysztof

