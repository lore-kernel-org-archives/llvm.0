Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBC3D9DCE
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 05:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032460; cv=none; b=Zo7R0NFeDBrvjp+kmBPjaYCMRlEj4PcJs8HNLoSCvi7N4QbhMgRQLETzl/Mp995Irpq4Y0+aLHJSLAeFqysSXgweQERL7x+uDvruRpYlILjeHYC1f6egqinNdi/7tT29C+R9DFxe6CQdL9hwCvAItMUaDQHJF/bwzXZbunOsnvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032460; c=relaxed/simple;
	bh=GosCLyy1/VLuOxPlTGn0Ls10HQdPNBqTDEuKCEOC9lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2Cmgk/7D6ftTFSw4bfR9yAF6XQ7dnegEa9B3byKP4HLzwVylz+wxH0+ncijBj59RABGEyhHzBMIZfnSzcd+BEVrk5rI4EKiCrkrs17Jv/ku9Vec8b5ykEsFV1r+MFvutgsis4TUrO/HfP84seAff3Jbkx1AIm6C5kWsaMjkEno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrbmFUAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hzu0IvFh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrbmFUAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hzu0IvFh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I45l0s4187015
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 05:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=; b=nrbmFUAASt8pesrB
	u6WXz3wMqamtjyeAym9VEQ30v6hrhOpqNHLRXUYW1z69xos7AnS5/aaIr4VCSczG
	2hUyBz7eu41USoVjZRxHSV1xEdUrpHXsUMerp0kOsHW3MKOd8F7PuiLIRmdfdFMF
	tEzdmZDbZOx/GPAPsRbBnqRa+7Ju90vC2pfkQfnj76wXlM+/ZF4vXSCDIcFsbfVu
	ruQQdsAJ8IFCQ5EA450ikk6EUspdIKiobXhzSvQCBGFerd0bZfdwoHz4Hb6k+3mK
	2JmbjRf6C8qC9vAorkSv/A42ODwkMaZRZWjXqkTjUwHinLZysyNdsyl0lxFjjXSi
	MwL3vQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p0evx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 05:54:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso7674072a12.1
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 22:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787032454; x=1787637254; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=;
        b=Hzu0IvFhZXlmXF38FDPkfZtsZodQbjEaY2gfTRmb4aswLUtUFubRKbKkNOyjd78D84
         87lwYU7VbWEHxer9JHxR/hddJ1foN9slbAzrxKc30bUMvCHtT4WRHlmPgxsJGXMGiPRv
         AH16ovEegosDT2XQxy9uqcIkPsC2likuZDn88+dk19owe3cstRwKx18FIhVeJMz4Q3IP
         GTbFrWEpBYQmoYeVqRjMRQOYMOIzHlWirprJ9IWE3PgsXysteuEPYOvGWfMraKPgX8Vt
         2Z9HewUJiQL67x1Neigd6fqRqXTqfoi2tw7oW6pbWJEcbWYvb2o+4qa5Er1T4WtWTak2
         IEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032454; x=1787637254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbCaoRP4jgmLhzxgTcurQvCQNdUxxOfgWCAkLYtazKo=;
        b=rqyzMFKT/nuZl7i5GEafLjIkpbFzjCYO+jx9K+oBxQbYJGm2KYDpmwfxgUi+zFVL6D
         m+XpjD0Dfo7OmDbALGeiGidKYUazqm09PUAwiC37KD8W8wyiCOoD3C4CpPZWojO0+HWQ
         HVRLGYf/t/IO/HtXDfsp8dsmui3ydalbtlregOJSJDMD1UAZNw9MnSOMNKXQxBUJm5r5
         bdR+5XSDy0aoufVUZTzWNjok2DbsXtU0TQ0pX5UOc0+ErVUpWNCdQISkntegIfPOfVIH
         Zmxr+qrAFqL8YB8XyqjZTTyE525P72OtHpOdo/1a0Cnk3chpXA67nFy9rMXGxTxkN2xE
         yuAw==
X-Forwarded-Encrypted: i=1; AHgh+RrLVdHgcISjKGe2AP0dw7vA9S4Eje/RUsSC6KaEKIFuXibgX6PZ2bI3eJUJJkjf6bGQr4cT@lists.linux.dev
X-Gm-Message-State: AOJu0YwwRPkO2ucBM87MxKxWDA2wzb0k8QdoMIxlmjdFcdzC5+GCP9Cv
	6/L20ktCOBCBftg1DKAjpYn2kfuDWicoamCSOO3EEnxydh9DdNbKeq/Kz23IZTrT6bvhlRU9bQx
	nETkz+c91AjU9bVSM7w8ZXqTQWmMLJ9HwSTz0bA2maiAufIw1mWsP7qGn
X-Gm-Gg: AR+sD116uIe4xZJJFyURefZRG4qhZ2ewvc6Cqaxes7LmlJF1rDzgx1sAZk+ShTBFM+z
	I2bfzy5VHp6wTwoW1z1Dt6moxVCwxo5e55PVsVxRtaQf7R/kyhijnltIC4XG1UzJRmSM9sWYVf7
	7/z16uoxzzf0Yfqr8rqgmf8oaRmf19Ramr0Xx7i/GfjYu/890a8oGs4iZ9WSRxz2Rrj/izBXFwC
	QV/U7pw2xuYE7+OWIT2BrQXVjtpQ6m4fWsLgdcK7M3aRSVv0KuQ8dAoG2exrRhydeCfWcoC7GVD
	oV/l6am1VwCelTs2hBoOu0vZ6jLcdsN2wXuKKCDUp7lKdPMWFGQvgLCxS+1gsLoxoJJaqeAuKAS
	V84oyLapjP69CLVYcq4831Qtd7SLaTQ==
X-Received: by 2002:a05:6300:141:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cc71b19c7emr37663904637.16.1787032453943;
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
X-Received: by 2002:a05:6300:141:b0:3c8:e10b:7a9b with SMTP id adf61e73a8af0-3cc71b19c7emr37663839637.16.1787032453547;
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13bf26a0esm1592712a12.8.2026.08.17.22.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:54:13 -0700 (PDT)
Message-ID: <376e0fa0-c863-45ae-a8f8-6d4b74ef0b8b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:24:03 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
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
 <20260817-qda-v2-v2-10-69a02e9090d4@oss.qualcomm.com>
 <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <tjfcsz62is33iphcwtensnoiohhpfk2zh43qfe7ijd4b2324pk@v3piffq646ac>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B44szM1P-pWT8OxLnkkIs7L7GqKPw9Wt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfX3TE4QhvgTHsQ
 fTidntjKALUpzSZDKNxePE3sWzsIXWOZPBkTLuX3g/qqiLM12huz5pnqQBuk7gjgSjxa1hFrmf2
 MEaN1htv1utJ4DWCaKfsj6PXkCCkBSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MiBTYWx0ZWRfXzAzxMhHLlqxk
 boQgVt/lSPqEBqt/IgSWealDTqJuUKGu94iUWwYXqQ3As0ZfCDCazPYy22u1Vz/YReYEQEH7dxZ
 jRhwn6LwTIjZQ96w4moy1yLP+2FMtNWS7P/VzX2Qd43tnGj0V/1jSUAihmYjZYBl6wiRaR50VJf
 Equeh3UGHu4fbGfMwCftI0MXXQFKiTUW7YajqvAL/CiBIvnJi6GsQH9fpOr3sDYXzrFokUVGg2I
 O+jxfD5dWT/bYavnJSVcYIjbO+Lhw8t3hbpsUHjiSq22J+n1Y3ws6BoljELrqRmIlIwmPgHwe2J
 kkAI2/hvBqeokXklGnWW10ORrU436FFbp8NUfpaf4EMKRsFUli1gamK6Czpe01qd3tmBE/5d9xG
 xPOQUv5SyItubtGHnj+ZsY20+zIKaTlw6FG25E+ZsUl+T4A6+4QSwYPTkUs8WCp2T13oPKm0Hr7
 WMY4/XY1Duo+jVKi72g==
X-Proofpoint-ORIG-GUID: B44szM1P-pWT8OxLnkkIs7L7GqKPw9Wt
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a83f389 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cA8Zc-eO91vsJqbwH70A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180042

On 18-08-2026 09:19, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 10:17:45AM +0530, Ekansh Gupta wrote:
>> Expose two new DRM IOCTLs that allow user-space to allocate DMA-backed
>> GEM buffer objects and retrieve their mmap offsets.
>>
>> DRM_IOCTL_QDA_GEM_CREATE (drm_qda_gem_create)
>>   Allocates a DMA-coherent GEM buffer of the requested size. The
>>   memory manager assigns an IOMMU context bank to the calling process
>>   on first use and performs the DMA allocation against that bank.
>>   Returns a GEM handle that identifies the buffer for subsequent
>>   operations.
>>
>> DRM_IOCTL_QDA_GEM_MMAP_OFFSET (drm_qda_gem_mmap_offset)
>>   Returns the mmap offset for an existing GEM handle. The offset can
>>   be passed directly to mmap() to map the buffer into user-space.
>>   Imported DMA-BUF objects are rejected by drm_gem_dumb_map_offset().
>>
>> DRIVER_GEM is added to driver_features now that GEM IOCTLs are
>> present.
>>
>> Assisted-by: Claude:claude-sonnet-5
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c   |  4 +++-
>>  drivers/accel/qda/qda_ioctl.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.h |  2 ++
>>  include/uapi/drm/qda_accel.h  | 36 +++++++++++++++++++++++++++++++
>>  4 files changed, 91 insertions(+), 1 deletion(-)
>>
> 
> The patch LGTM. THe commit messages needs a rewrite
will fix to commit message, thanks.>

