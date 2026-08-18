Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49F3368B0
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787034365; cv=none; b=hWjC7N2ZMbNOA34dY9hY9poSBHLqcdxiV5vzEoIlomBNBp+h1EMSfKazHbyHnMAKjxOKqugDzcsUSA+V0eZBZkeXfmlUFhZntkNWzNEU4Y6pccCkzTgZClZcHAfF4WkBPJGd/LT4+oCpkjWtCnp2jGDPunoj6ZFsm0tEoJQvKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787034365; c=relaxed/simple;
	bh=2mrRYBUZB6QXqcc/lWECjrJo8ItcqmQvUwDzXzT2cek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0WaHKkVvJWHH3inQUinupSYCR78P1/8ZGhlpStr+pJr05flZynUBPtT9Do4iB/GS77OxdaeZ9GTNfZgNmhMP6djR6q1iCqBis3/bEGTwYwctYxmfSX+OFiUFo7jlW6HceDoCEow5B9GNTHE3Pj/rhzkVqyyJiyXwZs/ep9pToA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2sYxbLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyQR6toH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2sYxbLV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyQR6toH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I45mLW4187023
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 06:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QpMSnfPhODIl1ejhgbQgYJBMEXQkyaJTdofbzdBjnW8=; b=f2sYxbLVVxHHE8ah
	BLL2hEOs11e8uGfhMGoJwcmplrDhvwX33dAV0qiWRM2gDpjxJVPos/JU02gMW9FC
	LXwzVEPGU7rJi5TIK5da9CVzvzkcJVuj6EHpmZzzxojPfowe4uWJw1vE56Kh38vH
	PpjZDe3+yq0qUA2tUIqzPDgLNB+qvDT0CvDtc8kuiXB875zbfvrZ0HBTaer95ILn
	iFiq1bXLOsrZHIspu9HOdT/hDYdagYLCnHuJc6s7BLHeQiteNQ8b7Dv4wzHpIzVF
	NbRytfgkQu+PFQ5J28BanMviMap2OBU3khIdZ3UoRxyndp/8zj7rcQHuopvzHk/C
	giU5Xw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p0js9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 06:26:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so6695271a91.3
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 23:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787034361; x=1787639161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpMSnfPhODIl1ejhgbQgYJBMEXQkyaJTdofbzdBjnW8=;
        b=ZyQR6toHkf9IkUEx+WJlF9ssZATnoHMdoZ8CQI94qto939Dam4pEt3Zz3Y6pwBgeIp
         rZiOr+4eq+hi5Kwjy8rrjSLBiWdtCwz8EYFPYiYlwonAntu04Vwh7fjZW/ivgWwnu1Cm
         90M+u3IXifreXNhKYy6h3ZGabGi+vsjbk++Vl6EMduiX+K1pZWZ9+cqwuME2MiMZ4/nm
         EyyFZTmACWk9R6JiD1oQ75BJ7+3WXhM9HAkn3+kx1sHykdQSzZzLraC84cyPnRww6sY3
         Te7yq+PlerYj7CRNMK39Tcik+ji6j+wFbZG4s+qGhc3O1Xa7DP8meH9JJ96+krnsTSaC
         bYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034361; x=1787639161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpMSnfPhODIl1ejhgbQgYJBMEXQkyaJTdofbzdBjnW8=;
        b=lHtbbb/9NB7DdkXDSEOvrGUWznrAqUF68TXeR3sJRm4ygk8FziKQO1VBeC2c3ad/UA
         M5PROP3Ken/8BthTh3jmxgvfL9M+yWyw7w4eNX4jqUNGAtTjhN0lvQGxx5i9LGSWZpr2
         0GoTEzXuKeu/Us6QtB6yJHfUocoMujSsnXXta4+wRTmwERPpSq9+oqV5561KcJPHkleF
         Xp2xYWFvNC2QVJ9VvNq5MdDXNVb0CA/rOqj9sCkgW/xryQyX1iWPdn7ZSG6xRpxvo5qc
         M83bhJEYNu9ZYgSTmOe/4f+C8rDA/PAtnG+eG5a/e7dNE5QyvkBn5SpIgWIMkX8rpGoh
         rKHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpivH8E9YBoltTR7Hc6xY4c9cp9HgQjDZDFoXkGdWed7mqYhE/IQ6OPOh0GNFR1MUMLXNu7@lists.linux.dev
X-Gm-Message-State: AOJu0YxXgFoRW+3MrpjFopqAl3euLeCaNwOpN+THczQsYPBm2288JmM7
	4Rxhap+Tfu8ZpSapVzJA0+k08F2Be8AFQ3SsCBesDwNSvtdYrXm0uTmZbT2HYHIZAIxMZN+v6is
	vWaqjSCsGZS2gAmeIC8U0WWBp/Xn08pLyQbKdY7+BQzPls2GmJaFb8o8y
X-Gm-Gg: AR+sD12nFfOxsabQHoIyXt3QRMKSsgefeyXPMaAW7/gBqJcPbXv9rWY75+men//R9hk
	T6PbeXSrPZVfRuSOb3N7C8uRICpNw1UaYfMlNJ/ISJ5z409WcWgBxkFut+jQEjI+vST/SfXyuwp
	5tG5kcVM4QPPnT4UGlTh1xuSeh06qHpZMx4GvogfqCFSRSvF19rWNxL9aHie0BaA61udVGjaeWe
	4XWElappk63gu2m+Tvgq2iIW1Lu7xb9SBuK8s2ztCVAYtmDbf1QnppGmJbGAF/hm7m5bh2AMI+J
	zUzoHUWwR27Fdf7172jT099r35RXrlbyHm1FtJDjPfqcIDjU53xOjcllre92Imgsby/lEVHSs2n
	cGoAM8UV99N1Z1ja2t2AQhxnZPjJ1kA==
X-Received: by 2002:a17:90b:48c1:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3933b792c20mr35951557a91.9.1787034361265;
        Mon, 17 Aug 2026 23:26:01 -0700 (PDT)
X-Received: by 2002:a17:90b:48c1:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3933b792c20mr35951459a91.9.1787034360780;
        Mon, 17 Aug 2026 23:26:00 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531ff679fsm7486482a91.14.2026.08.17.23.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 23:26:00 -0700 (PDT)
Message-ID: <c1da4243-36d1-4b65-a5da-f660ab8c63b3@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:55:50 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] accel/qda: Add PRIME DMA-BUF import support
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
 <20260817-qda-v2-v2-11-69a02e9090d4@oss.qualcomm.com>
 <l7gt2mr3rrnzmkc46ntqw5e5sirdimavv5do4wmdf6jktryp7g@772ovv3qlgcv>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <l7gt2mr3rrnzmkc46ntqw5e5sirdimavv5do4wmdf6jktryp7g@772ovv3qlgcv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n1emKFTTw5to-Vlk3mSZDPWssZavycte
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0NiBTYWx0ZWRfX9p1Jfr3YKKRc
 sg+wZ3VL4IsxbgqWORL+fI1bVn3YPmLaufyIb402MOYJM0fLRiReZgGABjcYwvotJgDIFmzxCd7
 Xe5CJVaT4BTWD+x7yT7O0KYn9Hhbg6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0NiBTYWx0ZWRfX406CL/7Btpk9
 zl0/HXTweQn7A0z1oMPTJVED5aPEm0uNSKmhJ0++rJ/LCpaz2RtIkmBQxAmZ1VB2hNnohYhg7AC
 kKSQINmjoorU1fxTv0pHmo3JD2i974bIaG1gE9QekR6wX1O8YS7oCCvPmeZR8KUj1cP67qoX8YW
 WYq8gshKbe447yeLTF27I7ttMRw5wPlIC5GUN8tiWAhv7xi4TY5N+NXrNDe54cuyjq+JRXRj6hf
 l0heJdolAEFzO8QX8XjPWg8W+zdGGXdMdVa07CcnqriVaKsn+5eGyEMOVaj4iGXL4owwbvmpeVQ
 qKrrJlO6bE9KdPNq0LNUDk+ZpTTfKvg6XD7guadIk3uGlehyVKDWWNMaDVIIC+0m/L49+66z/l/
 nZRwRWNWG8dtpLDtQyGEP418WX0368DVtecv+kvnEIU4nWRcyvDA97zgD9Cc29II4HpONQMIIuU
 chTzNbuiPMMlbpBb6WA==
X-Proofpoint-ORIG-GUID: n1emKFTTw5to-Vlk3mSZDPWssZavycte
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a83fafa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BHqhARD1X7WWxJJUoOYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180046

On 18-08-2026 09:25, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:46AM +0530, Ekansh Gupta wrote:
>> Allow user-space to import DMA-BUF file descriptors from other
>> subsystems (GPU, camera, video) into the QDA driver via the standard
>> DRM PRIME interface.
>>
>> qda_prime.c
>>   Implements qda_gem_prime_import(), which is set as the driver's
>>   .gem_prime_import callback. On import it:
>>   1. Short-circuits self-import: if the dma_buf was exported by this
>>      device and is not itself an import, the existing GEM object is
>>      returned with an incremented reference count.
>>   2. Attaches to the dma_buf and maps it with DMA_BIDIRECTIONAL via
>>      dma_buf_map_attachment_unlocked(), obtaining an sg_table whose
>>      DMA addresses are IOMMU virtual addresses in the CB device's
>>      address space.
>>   3. Calls qda_memory_manager_alloc() to record the mapping and encode
>>      the SID in the upper bits of the DMA address, matching the
>>      convention used for natively allocated buffers.
>>
>>   qda_prime_fd_to_handle() wraps drm_gem_prime_fd_to_handle() under
>>   qdev->import_lock, storing the calling file_priv in
> 
> Why do you need a separate lock?
Will add details in commit message,
The lock serialises the `fd_to_handle → gem_prime_import` call so that
`current_import_file_priv` is valid for the duration of the import.
Without it, two concurrent imports could race and each see the other's
`file_priv`.
> 
>>   qdev->current_import_file_priv so that qda_gem_prime_import() can
>>   retrieve it (the .gem_prime_import callback does not receive
>>   file_priv directly, but the context bank to attach to is per-process).
>>
>> qda_gem.c
>>   qda_gem_free_object() is extended to handle the imported-buffer
>>   teardown path: unmap the sg_table, detach from the dma_buf, and
>>   release the dma_buf reference.
>>   qda_gem_mmap_obj() rejects mmap requests on imported objects, which
>>   must be mapped through the exporter instead.
>>
>> qda_memory_manager.c
>>   The DSP is given a single base address per buffer, so only buffers
>>   that are mapped as one contiguous range can be described to it.
> 
> Is there no IOMMU in front of the DSP? Can we remap the buffer to a
> linear are inside the DSP map?
The DSP firmware's buffer descriptor format carries a single
{base_address, size} pair per buffer and it does not support
scatter-gather or multi-entry page tables on its side. This is a
firmware interface constraint that we cannot change from the kernel. So
imported buffers must present as one contiguous IOVA range, and
non-contiguous ones are rejected.

Will add this information in commit message and during the check.>
>>   qda_memory_manager_map_imported() therefore walks the imported
>>   buffer's scatterlist and rejects any buffer whose entries are not
>>   contiguous; contiguous imports (for example from the CMA DMA-buf
>>   heap) are accepted. Whether an exporter or IOMMU coalesces a buffer
>>   into a single range is not guaranteed, so this is verified rather
>>   than assumed.
>>   qda_memory_manager_free() skips the DMA free path for imported
>>   buffers since the memory is owned by the exporter.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Do not assume the exporter or IOMMU maps an imported buffer as a
>>   single contiguous range; walk the scatterlist and cleanly reject
>>   non-contiguous imports instead (Christian König)
>> - Document that only contiguous imports (e.g. CMA DMA-buf heap) are
>>   supported
>> - Return -EBUSY rather than -ENODEV when no context bank is available
>> ---
>>  drivers/accel/qda/Makefile             |   1 +
>>  }
>>  
>> +static int qda_memory_manager_map_imported(struct qda_gem_obj *gem_obj,
>> +					   struct qda_iommu_device *iommu_dev)
>> +{
>> +	dma_addr_t dma_addr, expected_addr = 0;
>> +	struct scatterlist *sg, *s;
>> +	int i;
>> +
>> +	sg = gem_obj->sgt->sgl;
>> +
>> +	/*
>> +	 * Verify that the imported DMA-BUF is contiguous. While some platforms
> 
> Which "some platforms"?
I'll rewrite the comment to be precise.>
>> +	 * or IOMMUs might map buffers as a single range, we must not silently
>> +	 * assume this is always the case. We loop through the scatterlist
>> +	 * entries and reject any that are non-contiguous.
>> +	 */
> 

