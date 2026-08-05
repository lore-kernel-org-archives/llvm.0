Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0152840D563
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923506; cv=none; b=f3a9YTjpq5C+FTK6ydy3Z9+Lijhj0mlH5FV/yApwaOBlH9T/v7ABAXi4fO/rqyIIKxG+lIGbPhf+YyyUrurlUzidsXmByEVSF/vWv+StQb+w/riUBYscyY96L62+aorkz3ywsZ9KR1PlpApSS6YR/H9Rx/d0H0ldgUgTct6JuCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923506; c=relaxed/simple;
	bh=QFM7AMKU4RXwGP9obr9bM9LikH8JUn/fNm7E3dfSGRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XihOB3p5Ovs/y8PGhKUrDHULSoAZZ1vPDv5EdRnmjQ+uQkqjbR24Wx5CD/x1d1O8SgEbuh6uNl3ojH+6h0fwJd214qJMvUWeZbBdRlcZ6whkz8fpcoaCtk6Nm5zi2sJL+3pLVrUQYKQGokZz0kyywZLNbXTC5OD4WruYuTYqz3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meZ1yApO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1gsh7HQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meZ1yApO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1gsh7HQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dTvu2663446
	for <llvm@lists.linux.dev>; Wed, 5 Aug 2026 09:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1IU+TsuZ564fFaBd33xIc9jlaZuK+lX3HGJbEgaHb8g=; b=meZ1yApO36DwW3G5
	W2RlIfPaGWXXsr4/9NKjL8wrNqrfq9z2iBHeeWFAiN7OGo9zFg45utFeNQ1LWqxH
	j5474T9+wznaWwdvwrmiAuBUmwgv8lhoqIesbIYS3m0ETKWcu8CGQyVwjAtHFF3j
	mJwJ7ed1XCMqa/cJISRWGHUsQYhgrktqgqcZc8/Es2RYT+cj9sRAGMOnPDCyz70w
	ATWfBb5T8OAtU5LN/8J7dDSRNaaGz1sn6QIE8jzJOEq/nsNuds5FoOf6/+OcxNLq
	S6cGpQuFazHVYyiKvmMb+H1osRPA2WEg6tmHeGH09Wt++dBva5kBujlCXGehrYLv
	8RymtQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv14w8k39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 05 Aug 2026 09:51:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so16581595ad.2
        for <llvm@lists.linux.dev>; Wed, 05 Aug 2026 02:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785923502; x=1786528302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IU+TsuZ564fFaBd33xIc9jlaZuK+lX3HGJbEgaHb8g=;
        b=f1gsh7HQsjFGJcK5J0Qarg0+Gw7IKIBmad23LgzDQ6uAKuG9TBAG6yisdljUOO7jOI
         pAJGRe2+hyS/UIqRcgoCpvndsxdcgvUW68wj44G72JutbyMNy3SfeB4HabkqYwIzBBkL
         G46TRomaYgr3USWuAat+3KHipamLXawqhfCgCUKATucuP1n8LCx0vFI97JsJ+84mDDhn
         bCeRgleJa4cfz468vUyhLi0fEjZhxt6Oyhp7T4yIeLrdnse7ldUcUOUK19n37n0AjaZm
         dxP5/MJzUeLSGPaBeDlMW1A0o4Yd2shR3J7X3DbbZ7XnLVJOPjdpJqjgcO//wEyJMV9C
         +3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785923502; x=1786528302;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IU+TsuZ564fFaBd33xIc9jlaZuK+lX3HGJbEgaHb8g=;
        b=HXLULY4yFgI3rwVRD3vFDWM8vu4wP/GoM0uxvqxST2hDr8RU9acypWjX7T2nvQupPn
         Io9E/Jt30ufISDB1LNIrkQ3J80SuiIimn9MU7QpI7oSLP/TX3r52ytppZD5RfP7HVO1k
         IB4uvXjksn5SavJv0jICN1qwcVO7ibuU70XF49mBHXUwpETwW4/aISFo8a6tMNisU4ts
         j5FDRlPDW/FhB1aj90vB/0QlcvaUMZ2KW6dVaNo2hcScLFnYL+gZbaWtng7rAqMVLiq0
         n26NBmiL8yNRy1na/8uC5AvQddX1M6orgwNGI1eQC9t4z+6Z/9k96CfwQSjS9J2E4x54
         +E7A==
X-Forwarded-Encrypted: i=1; AHgh+Rr1/6FLj/+zVShPrXqOiDRg1eD1kRKeIHjwXZ62vVrwzv1jpuhy1IQv79KZvQgxGqT9qRMK@lists.linux.dev
X-Gm-Message-State: AOJu0YxFSO9yyFeFFFT455WeHJ4Jecb8OAi6bzk21n8vgp8LL/jX/yNj
	5458FFJqAg/545t/Ug89isac8IyvDGnSxRvHbs1ZIopaPrAX/YD8RXfhDyWun0cPpDqXwHqvrNB
	gxrXjnZYsCPIH9ILmoyiwacZwv2oP/HGtMAqvfpSo9s78ZAfUauKmgi6E
X-Gm-Gg: AR+sD10mK6ltyjwrF5Vb4rFQYVat67GyXMQU9X4hYmlMuH2A6kooVHf0riBLzSfZZTx
	PayA9TmpAvWzgMYJhb9v2in7iRiJVAcdoYutDykCxWk/SmM7UzZho0mDiegOTzqTIU26wvir1yu
	IJPerNkdZUYQoUSQTzMgRaCObduz5ttjilA81fTFglNUg+qucPSFQ+v1Xsw8X+HP5SmfhmxGYQA
	8lsBHoYZ/flDBh9/UnqpUsvAbzG73gr/wskZ4/avm9n6OMze+tM7o58zsh3q7VI5Q1eP0/l+sNQ
	Up0OX1O5ONKWlxOLKgzucvBNIRpn+O6fbvZR9CynWsy2RH00EY3wrScpN6FljXMzrqzC9HQiUjP
	BOTjGczADfvoKpwvwbYF9UuBlpJDJTeSHM0hgMQta
X-Received: by 2002:a17:903:4688:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d0ca7fbc9amr66562425ad.10.1785923502430;
        Wed, 05 Aug 2026 02:51:42 -0700 (PDT)
X-Received: by 2002:a17:903:4688:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d0ca7fbc9amr66561995ad.10.1785923502033;
        Wed, 05 Aug 2026 02:51:42 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867d7e4csm14825638eec.31.2026.08.05.02.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 02:51:41 -0700 (PDT)
Message-ID: <63a41170-b20b-4a9a-8d60-12d2226e2f76@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 15:21:35 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Fix possible memory leak in
 ath11k_dp_srng_setup()
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>, jjohnson@kernel.org
Cc: nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
        justinstitt@google.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, baochen.qiang@oss.qualcomm.com,
        stable@vger.kernel.org
References: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3OCBTYWx0ZWRfX0MCnD0c5gFhs
 e/F45pXh2Pxqqc7lDNfgtfgCjjrC4w0R2FWwufeDtKtrDX8rKxbD0Ka52grh9g5yLUxV67gDjts
 ZjaTMHSdXvjN8Z4yfEFAA7c7iM66Zpk=
X-Proofpoint-ORIG-GUID: c_FUl2PGi6lKsaSR7d5l0hGh7N1s9Ika
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3OCBTYWx0ZWRfXz/88gqkpferZ
 +8K/5auT/ymXC0r1YNoScnq06/yPHiJfOuqjZOq4LB/TegYjOkNWNPiC8HH3/zVj1JChBZq3J5e
 9rWvvCsuN3powXbOq7wSkQ+ToC6klpnDY2qzyOd/YEH9cwSvDM2mJJPmyZXHO1FmiUB4bhEyk9e
 yWLf0Xy5qtMkPinUBNJT0hL8UyTV1FvZWY7vsUMW1cSd5N00+BiXZT23RvG+awixfnJpdP8Nih9
 fYtZViSUXBr8C3CKqMRdEzIi6xB+cWUsYVFreF55ujurljoOWpgS+VVq3OdHHYh3TJqCkDLfUIH
 Peeb0DUydskND4DAMEdOkKF8zOXaI7o/nDwgjVfPWlk2kHnrYKoBlh1xh14WZtZHnQhs3b/Ckam
 Zo1hY9yOS83Z0YH2gae9wPcr7M02yhSUag56ZY7lIhPLcoHmnBJX7R2/ZtU+Peun89GdX5FvVpP
 C2uoKNIARWfm7buj3HQ==
X-Proofpoint-GUID: c_FUl2PGi6lKsaSR7d5l0hGh7N1s9Ika
X-Authority-Analysis: v=2.4 cv=Cu+PtH4D c=1 sm=1 tr=0 ts=6a7307af cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i0Dr3GctjLOm-fFF1aoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050078

On 8/1/2026 5:19 PM, Abdun Nihaal wrote:
> In ath11k_dp_srng_setup(), the memory allocated for
> ring->vaddr_unaligned is not freed in the error paths that follow.
> Fix that by calling ath11k_dp_srng_cleanup() in those error paths.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> built on the LLVM compiler infrastructure.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-sonnet-4-6
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
