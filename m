Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530481;
	b=42HRF8Z3lLXAw6AnY4uMCiENO4gPgDvSi3qYdkxGGJnARLw0LxnJUBe2jAQZdKF8iIIg
	 NXCzG6cZNU0mRK0UahsRoWZzkhaAiOBOyVaSZd1tObam3o4Dgk2VJw0mEAWnEy6PTnTS5
	 zdgxKV+uSWP73ttYpCMqaTN7UJpZy3odqWTQhgk01DOcZWkqAzk+HXzsUtk06Ntvyy4xG
	 O7gcys8eEQYCbW8S1cN4KdOFjQURl2C+xgAi4cwl8UPUHelgNwy+lYvszuNqR0oV5b8B8
	 cAhUNEmpo3lWT2Hxuf43dpW32u1ZEDqHp0z8nsbAq0PsjB9XCjmM4oCI5c9uNK5kVvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530481;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
	b=tBiaKhpcGPDQSH/YwY69dIIXFd/ivilNTW5po3yVQWhmvCcb+N2DKjpQaYdrh3ryLPA2
	 DNN2TthWOSPl5eCXO54JQ58bS6Q4kEQN7nqSttSKURMSru7jLrKFEnnMaWVSoZit1ZwR5
	 TH0o+43R9c9xaKTnyxeIP8VYWqAmW8Tuox5gBTFX9nh0ZSUYtp3GZyUsecQo0JEl4odR5
	 8+FaNG7i2f3rp7huoBuKJJvM+V6j4F0CkIkjy6WT5rKBuNzXgC+mPo/XYMGspx0PgYCj6
	 gwv0NyQZcJc0wUfJKbmaHUoBO/2W/uZXj7Xm9BaZL0OENbsS1TizFori0veOeW4JPEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5+JCqU9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7274A606A31E
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 14:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7274A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehHEymiP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5+JCqU9
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAua0f3299629
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 14:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=; b=ehHEymiP2vHy9XnQ
	ME9obw6CtHFbeMT2Aw/3n6M3lSRaUO5J5xly4qxrWUub6qa6o/aDmymIFsNuD6rT
	644KKRGOjTuyAx+fISCxw5uJzuDgb3429BOIaPk5s8uvOdXZDPyIGf5v6I5yrSpS
	eG9gVyRdOpcHf/yHojuxyBpiDDGpjCk5RAvPmX2bWeNF/QXJQ2UH/KPhZ0stBiD8
	+Q/roXCceCYAKGJzSpktDc9qmshL8ojn/FiFneH7pSJax52Y4G01J7aA9SwOoIlG
	s4sH3UhufW4ODC3m8EcaIln+HSmK1V1JJPL6M8nKYx8fIf1NBfGrXRsu4TGJXOla
	Of08Xw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy139jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 14:27:59 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67de1a8a5e7so8076353d50.2
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530479; x=1796135279; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=I5+JCqU9wqghPxPfN0bPIkwg3r+Se5fyXvu9sLAhn6g7lCitFS7mUzpbleClfOV5Wp
         tNuurvJGoKbGMGJDrNjsapQDcqp4Amb4qVlLACv5FETki5vlLlY+3CNW6TBaSk+DZIbf
         k6rh3Yt08yYxzXC1+dmMsdMeSjbVzGFTD8lfq85sHrI0uiod2ZXHlqD5gBZa32MXp6Dm
         fxUfIgDCPsX/RvetIPAjgs1MDL7DwKaBH3uEp7UkzN4SlzU1gTjc7XISpYH1jv6sWUKc
         NIuSXRoysV00PW28xAnub/21UbeWf9xAiUrJtIkNCZWRQKXwusDYJQcH6gAWn5k5mEZM
         LK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530479; x=1796135279;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e1f8mH50dVq3zUP41WlpUgQLkq7jx1cCFUDQDKor2E=;
        b=euqz9DWITNenBTcsS+n5RBrFbZUTZc4NKDfHqAvweiTd7QWhtCHNagyDrGSPlHsmGa
         ga4yIbV0Ia+TXXh4Eavw/uGifFEqKzBjM8NPJ2pJCb1YGpo46A42YEWNJlI+CM4PfB+i
         HzV4sp9UPsCHTp6fIW/pJ+Tpxr49eW15ofEUpTYiyviKoXhlsu+zPem4z8N/5htbQAMe
         Cd8gXSuFdkyNlnz5RYGJu/rKop6XvFDNVblapBahQabgRjT1mn7KvxKMmyPkmI4H82LU
         zRwsTHrEBascKMMAY0wsu0cUoxusu7Bx5jjqTwgWdKTKCp2IWyHwO67wJjd8teLwoPsI
         ffNw==
X-Forwarded-Encrypted: i=1; AL+hErHyAPQ5qQg7VrOeFsD9lhBfh8n4FKasoq9NFnPyS6N6DN2xelBwi0CpvKhdyKVSGde3hPJk@lists.linux.dev
X-Gm-Message-State: APuU4Z+W6jQjA11TdnMtjGFntmw5N8qxdUkw7izvA5fx0PHa8DCs1jCW
	8bs56nBxZ32SYBHScKGm2VXk5BnNg+z75kPA4AbZFfqyeASp0g0kJkU2XjPyB6hIwbNmyridSsN
	K0g4dOsCI9xqcaHJ2v19vF1acbiLOkUEQBzNX+u4tSPhYUJidrBuzxXgW
X-Gm-Gg: AZFdTZfhX2I7LgOd6SrQQlMojZAiYOZ/yEQEeUcfkdbOt/3LezQ3Kn8foZUl6yLdYCS
	AUq88I0CDdmd7TMAKckO5ndtKmJSlgSiqHkP88/cmOoe2ogqkKrc/jtDMGfgQkKt9AYSdxs8EXY
	sWnq3/KL3ubo0iSO2840ggFt5m0Xax6mVlX6M4bA4aPCqQxGMp9dswxTP6jsdY4ZEwnyc8Ej55b
	O9LZPfcyMQhTbWXrjRCtOG5d1w5sjlJqXegCft6BO3h8hGKiWOmP3MPwzlaDT/LzkPPtwzBKdfQ
	uFLzozhYDiVxgqjmlgAYq+0RJLIf5FHcKvpyqeCD8a+iQzhyvgqWq7snE/uPSyShB+xC6LaLk1m
	+HvzU2kCUs86aHdeL1qDcQYfYPDB0AuRyJ37HFZcdDgzS8hoz3AwvERoC9TTnhYNyleTrBu5Hkh
	pxzcW6hHhZnBo225+5m8yAzeHKmtXEusndEg==
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067708d50.78.1795530478732;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
X-Received: by 2002:a05:690e:801:10b0:67d:bbf9:11d4 with SMTP id 956f58d0204a3-67df44b7404mr4067679d50.78.1795530478139;
        Tue, 24 Nov 2026 06:27:58 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33554b5sm7035521d50.13.2026.11.24.06.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:27:57 -0800 (PST)
Message-ID: <748d38da-fb00-4f76-9b58-87ad0fe9b770@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 06:27:53 -0800
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
 <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
 <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SmzQgau5n-LiBa0WjmLJasKGnqtKpndH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX5lh6zJDCm59T
 heonGMiLQnNn4WYaFb8FWT7f+b2qfKClm+QuNhL3FM56eoZK+6807hOTVIdCvaKGm2ifwWMzXef
 PKQRMa9lq7sQ3LwiXw1Ik4bU/surabU=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b059eef cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UQl-3I4BsUNNjRoNwgMA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfXx2LR+daoDlGL
 Vj2R0QmceVWYXz/d9Jleh438IX0eEFjHrJe5wK1P+zLD70KCLZ1aYMi14WP8E3oGZqK7E+mdU79
 gtsaqz8XGNMXj+IhRhyuHvba8qhj5gSbwazVu3RGC4MHbFCptBjTM5AS/4mUCRzuY54W5ZseGtB
 X028rje242veOuLKo8eo9FgcG/O83rkXrIIWjJQA8CDIUIE7GdZQfM+SxUgtV2gaAQDpOrWpIVZ
 rke7NTB5mwJfc1mERTyuIU6FuUViRiTbHTsD/QVAr4CIxh0jScfsMtIytpDJzXM3Rqf2yd0ZQMG
 ynyBOh9IuyrKucsnI0RQ3auBTo/TylE9bT+dehsWUfmn9FNrNGjzRkhlqAe+2z7BGgnkeHxc654
 G0aHBSlH4Ed2LTUNcxODdARnKjAobh5GV8/1SUBZCyz1/5Sn3rUCqXXQm7JDq1+dHSX1XAhX2Le
 qckNV6TCrbuW5yOcPlg==
X-Proofpoint-GUID: SmzQgau5n-LiBa0WjmLJasKGnqtKpndH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

On 11/23/2026 7:59 AM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:54, Jeff Johnson wrote:
>> Specifically for the DT issue, the original version of this series vetted
>> internally did have a patch to add the device in the PCI registration table,
>> but it was decided to drop it from this patchset when posting to public. We
>> can also drop the DT patch until the point the PCI registration comes.
> 
> Still does not explain why do we want bindings without users...
Concur, and I've asked him to drop the DT change until the series that
introduces the user.

/jeff
