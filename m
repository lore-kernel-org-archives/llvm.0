Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449265;
	b=27cYwdviTLycSdZOmiK8Ua86oZ4xyQhE0M6yyZeEFPTE4wIhVhxMyn2rs9SQ/Q/9z0P3
	 XwlCGTIwvEJK5oWJIqe3Wvy1hAw8Qjys8dcEhCam4pwvZ7vIuS7kyp82uiiqMjThuFCzM
	 s85HymnIKNeGzgP3gjC4OfXbtEFto5sIuG8fLO/wBVnDXxtoE+oTT0ZmSzJqUIb0zIkc7
	 GnphM+X5kD2q8WdKKBmvvUg3vPrmjjG46vZj/Ef3HjmQxwmXYN5JL6jNRu6O8BEp8tnim
	 AQ+p9oeDOho44+3lQzu+TmxuzMZR93k/0k98sF6dRfJ9kdxGFn+Yw3A/cA93PNgQMQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
	b=nf+MC+1yexqwSC8pRmSG2fKr9JROUlOKXT9ZZ9BWdkjpkwhaNxJYEOiccvj5r0j9Ilp2
	 Dd3i2GLHiu3NXGdKvlwqtp/m4WtbtMMgz+/aSBODvG0tWQrISy14L4xTmdLfBDodHleph
	 n5E0SpDRM2wOxkaqp1IzJe4Hhn12S9Atil4Kyc2dI6Thp5xWOPwroranp5+00kAAvKzsc
	 aPnG4bi+HyPFa2s9M5CL+0eJGf3U73Ao2+G/38Ai2qBqr0f/kr1y6hk4Ge95s+YRmo0V0
	 rYZqfQ0FwSO6/2i0kr2EUe6SdnaoB9edz/LRNxmw0W41AhZORYGPWc3psmOYNR4mfiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nj4QAdQs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5171606A31E
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 15:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5171606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nj4QAdQs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKsJw2621998
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 15:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=; b=VR1fJlMt4WmeCj/9
	MGhs9jNJ4GGEbFs+HFKXU65iNmMWlrSiSCMdRLD/GJb3ZEEuxdWeQyoB+4jBvi4k
	sWcC0X5u+pdJ+Z4z2tkXXTQ93G0GQ5V8Pn2DI3/6AA8eXVOIakbVqcvDk4aczLsK
	S5BZ3GwKcpX9fi2JyR3SyamK19igcSpo1g276napf70pl2O91dMns5iB7vyfO6PQ
	HW/1Uhk/vQFwUOXiNcDislXDqaNlBMObGvWMRTgODOsAb/1NdVbn9Je0ViD6G1cD
	kBmpSaJ1SB+EbJu+8cmg1mJ6rDcZFbWxGQBgoUlRvxUWND3X+Gd+alTrM6YHbjFT
	A6INrg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa72a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 15:54:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so1187199eec.0
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 07:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795449263; x=1796054063; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=Nj4QAdQs+tBQ2Lm32pqGOrp5FKGQprOW7qwgX5lZjV+PdAj/M6sGnAwRrLFlG1ELbs
         P7Zjv0NmeQgrD3WRhhNEgVUCFteznDXaDU1RBLqdCnn3wkgE61te3S2fN8Y0OB7aM/Zb
         VCM8zijXjZLoYU4RIk5/j5bxp9yCLLbOcXlNXiqPWY7eHTOupV33sP00txsJ7RSbq9r3
         nJ9HSwAp4ciCllgyS5vN5dfQWsnrlV/dtyPLybzI1SnZ+toOZv2FYgYCsPDLFfPcZ6el
         fLvnYWYhH7KuWaHd3SUy6ApjSb/iw4eokxbOxqjh2/RXO9T4s1f2FVFEFDp1lLFqJUmR
         LQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449263; x=1796054063;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=1CIv5tywq8IIBX3BltbQmf185Hu8aCsar2jwVRmhzegg03cxGzWQpH5RXE5TEAtopv
         qXqIX9CYJR2SocsWkTsbWn0ig5a2AJHB0CE3SIZKd5jzW4ioYuvf9MFLM+vodPj+hdCi
         6LDMteXhjMiF2FczFrDk7sL9zlreH6mMjWb1AKB5NY3zsNLnVD/xuZtGWN8cZjeIV/x1
         8Syy+YewyGAqpl5XitBamHolQmwpF0a9l3YbzaGG8p4QVB5svtvEsrCd30bNEHuhJtvs
         LJay7XriiMJvfyFeyOUrGUhSvl0WIhUNiASyDBndn9bFx8QvYTpqjcA5KaV/4Azey4BO
         DA/w==
X-Forwarded-Encrypted: i=1; AL+hErFOpSAK/B8EqddkdrRMlI2UBCvw1WkL+9e4csCjZBzKPonCrYf9pwKsLHcSRUnSsibafphm@lists.linux.dev
X-Gm-Message-State: APuU4Z8+MxuyJnmIJvNkuKoQUoSAWd2ppqrjV43z3t3DuzGZDUP1eaDZ
	bIJvu9tAQWuCn0BMH7T2FJ9buRmcuLW03EljWXBq4h1m2E1e0lw+2mlAOxnPdlofPkyVv4zskkz
	GchJMXfDOiF+U8M4Uzg5PiNl2JagM5Pp+AXJLF5cosZndg1nehBwwNhuV
X-Gm-Gg: AZFdTZeOLd0OZTuaW/keGJ+ifXzfu1nDwEuxgPSNIKmGGMGoQjpZnaMnHKxueqYT2wK
	eh4ItlVKrit0MJ0TXG5T5W6jqvrg2DxFvDKk1O7KUWRQDAdgrdb6hCL78zFKcwRzORlCGPQbUik
	39TYnDRbecMzDkt+ssAsmxZThBBcHYF+YQWjRblGRKkOxJqrkJnoD1e9t4P9yp8d3jegGwvx+kF
	ar2t05SyoEYpz25LO0M0g6mAV26Akoq0FseW8VjC3DT/0o4KMY2rw4DlC5NgW4tKqm5oLs9hlpT
	aQ5qZ7r98JupMa7OfNdB/GgNj5NyzNyWCAmmRfaOUpamcyu+YPWX5O0tCO57WGSJm4Txx5tBJMj
	xLRebQ4dg1BuQTfJKE/ZJgZeiG5Mbv3Tqtq6Z3ReyDeAG0/2ViCMw4c86I5oFdPR1BhxUIneR1F
	OZ80C+3UHFMqkGOsAqoWOReUy0xTWn
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886560eec.12.1795449263222;
        Mon, 23 Nov 2026 07:54:23 -0800 (PST)
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886518eec.12.1795449262503;
        Mon, 23 Nov 2026 07:54:22 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm40628761eec.21.2026.11.23.07.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:54:21 -0800 (PST)
Message-ID: <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 07:54:20 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Language: en-US
In-Reply-To: <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fR6EFYhRNcRa8LPE3uEp4uoWdUaeE5tZ
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0461b0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=wpf9FKuRYqRxeo0qB5YA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfXy9GgUWraJP6d
 Rxq+n6u0qztwUA5Pf+sajcCsmbscK+kk8azigjSKF4/6qEs80WUrgiMV96EmUtv6O4qNJuxUjgP
 XYZNICZeJAI6C4hrAma0PAtFPmXKHhA=
X-Proofpoint-ORIG-GUID: fR6EFYhRNcRa8LPE3uEp4uoWdUaeE5tZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfX66q7Hny/yZ4B
 VkPW4rutmve4we8yTRZBqHsitAJWZlIL33B58sm22R15cZzxj+9ckwXtJnZESMsmrJ4/pxDA5ZB
 GdFRtTI9Kq075uoxnKk6hOP6SwFxeApKdBSkoTJLZs3P1Wxy8OK9xtaWGKtURpG2jUGCK2LPhLd
 fUQt8ShVw2FoVf1MWUNvxAXIdPshpcElqyd4w91cKN+80PysKiC8FFvIp7lKxPoEtji2fJ+HCDI
 G7IplF26H8tUAk/yU0aa05kyUDEmt27bqZqbaPPikkj+EBb377nOkt1SXmFYYD/Eo69z9Tzzk1v
 CJ0k8AW8TKSGgYUFtBz/0Udc/F58eLt984h+gZsbHI5NwIdwbwxG/SBFMpPzHeOEmZIc/d1OjEp
 4DZojsQNeYeZJzoKpXakE8qI5FuNXspqi1mDP2lHy+7KDtDHTr1VqhGx/Jl8yCMAPYqlOujw9o4
 YxBbeNAJcK4JgIY4zWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230063

On 11/21/2026 4:37 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 18, 2026 at 01:45:24PM +0530, Madhavan Ganesan wrote:
>> -  The ath12k devices (QCN9274) feature WSI support. WSI stands for
>> -  WLAN Serial Interface. It is used for the exchange of specific
>> +  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
>> +  for WLAN Serial Interface. It is used for the exchange of specific
>>    control information across radios based on the doorbell mechanism.
>>    This WSI connection is essential to exchange control information
>>    among these devices.
>> @@ -48,6 +48,7 @@ properties:
>>    compatible:
>>      enum:
>>        - pci17cb,1109  # QCN9274
>> +      - pci17cb,1113  # QCN9575
> 
> I do not see any user of this (see submitting patches in DT directory
> for explanation).

For this and the other patches you had comments on, the cover letter describes
the approach being taken. What the cover letter is missing is the scope: The
QCN9575 device support plus all of the Wi-Fi 8 functionality is roughly 160
patches which have been split into 23 reviewable patchsets with 40K+ LOC. This
is just the first patchset in the series.

This is similar to the approach taken when refactoring the original ath12k
driver to create the wifi7 folder and wifi generation abstraction. That
refactoring was also done as a series of small patchset due to the large
number of code changes (102 patches, 20K+ LOC). This was requested by members
of the community who wanted to digest the code at a reviewable rate.

One key difference in the wifi8 approach is that for the wifi7 refactor we
used a separate branch, ath12k-ng, but for wifi8 we want to directly submit to
ath-next. The reason the development team wanted to take this approach is to
avoid the pain that was encountered where there was a "big bang" merge of the
ath12k-ng feature branch with the ath-next branch at the very end of the
development cycle which resulted in a large number of merge conflicts with
parallel development and bug fixing. Some of those conflicts were
unfortunately not initially resolved correctly, leading to instability in the
driver. The hope is that introducing the feature directly into the ath-next
branch in an ongoing manner will avoid those issues since each subject matter
expert will need to resolve their individual conflicts as their pieces land.

As ath12k maintainer, this approach to incrementally introduce the pieces
directly into ath-next, but only enabling them at the end, seems like a better
approach than the ath12k-ng approach.

Specifically for the DT issue, the original version of this series vetted
internally did have a patch to add the device in the PCI registration table,
but it was decided to drop it from this patchset when posting to public. We
can also drop the DT patch until the point the PCI registration comes.

/jeff
