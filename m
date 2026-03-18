Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B63D4100
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835389; cv=none; b=ccbqgsQe4dyebASb+5x4kDSJXDuZZojp+zkMhDORgqrY1dMHoafyfQF0/F4PYx83R315dSRPDNem+7aVP+gQAjlgQSjaHvp0KETdH644OoKxLdrOZx/z0/CncdU+4KWPVMaDbueEeBHFvladr5ZXSZdkp8YvTC/xg5ULHKmOADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835389; c=relaxed/simple;
	bh=Stqf3lqpYqt+e6AtlYk7sHqg8drtyUCh1o/op3AjcT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvC/JoL0R0oE/Hr3pr8nrqci5Vni4U//v1gLk/SNOQfg9MVnflMrUKc9RYE3NpLcTlIebf8vxvgx0D0vq8fbwNYGAXI+6+VTY1uqgMyU+2uoy0HFiVc1haTBBn+nRz4CAc7lE6RxGAEyWHUggV+1D1aNMQHOjb3RF5OGIt8NoQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUG4Kawf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILAUBb6x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUG4Kawf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILAUBb6x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9LnQu1144595
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 12:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qjwm62QJsYHzGpcjv5GBtAmLfJJ/nmxfwgjuhbT95mY=; b=hUG4KawfN/2Kdp3x
	cZ3YeKTsrAxE9gYqCDjzstSiBTKTqgThKVM7yzFZb6mhpTf9uf3fx7Hf2dp6YJ74
	QhZvR0K6+TECyNzB1hnZf0+KYmRNfc1YvlMfqs9jbVapEv7xvTSnFrNDLxJoMVsD
	fjkN9QDnDiZpuF8z19aE+elhxt4MgPKErDZ/NPhdAwEOv+j5VpwnSL7iR7rHOTXk
	gbsP2CLtiAZDM/cpG+V1Fujc++76g5LB6BpnCOUpS5LbBp8B6yYopZVJQcsIR03Q
	4s6gUu7auf7HZxcG7xtb6cTPJmZ6kV9B+wBZmd1XGKo119tW9boKq6NalUcInbmY
	czY9qA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3v42r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 12:03:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94eb4245732so921648241.3
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773835386; x=1774440186; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qjwm62QJsYHzGpcjv5GBtAmLfJJ/nmxfwgjuhbT95mY=;
        b=ILAUBb6xoRh+5q6d+EG7PsI0OqQbls8ymTE9nQmIVZ86Eletq2A/M1PBH9Tg/EefIT
         eLfEhk9JuDIT/bolyPjsmg273XI11p6lmfkjOEfhqTrMPeeOqlp6QfMy1HbS0bsmbr2j
         boXSARE8We9g1uHkq/fGWSnzV5UPyURyGSmYWaDMXdR4eR8DlR6T5M9zblrBURfpD6Vf
         gqlfWtDk64J+FgGQv2DI/d05FLtYX8FdUMS9K2jCsm12Py6i54t//fgyiYUYpRfnfeRD
         upzAN/fGXf6AwBgwjc0MF+nSCHBQC7DELH7+1PL+ytQGctqHuR1j54aBahrjwj6IGm3P
         ts1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835386; x=1774440186;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qjwm62QJsYHzGpcjv5GBtAmLfJJ/nmxfwgjuhbT95mY=;
        b=JfT4V8BAAEdm4LE+far8SGs0S4qA5rCacgpm8oNjVn+ORDS3jRSpV/ErO9ndRTaIu7
         QsU2/6WlWiVXj6pKf4os3xr9hPK4Dprlxx1Pj7Es2ZAeE37PjQLLtbpYFHZ8h5ATakAp
         H9Xnv2zGGGvezRf6q4+jDMTlZ5PEPP2bR0QJOHkn1ABcxxmcXeN4tvV8ykavp+LUPxyB
         7WK4SbxP60CNxIyDhaZfhHpCNSy4zDMAi50H6GW5I1bDwTzgCXLECpSVsFXTzfcWx5mI
         JU1ndiLTnRTo7/84+8MfqGZrRM53cPjTD/JyVDLSudoBjB4fS2EKSK8k2jeJYr+mqf4d
         ZcLA==
X-Forwarded-Encrypted: i=1; AJvYcCXKRur0obbtgbXRWjq0jczV7FHQeL3uu7ll94pbDkyfgErQdAYKUiV73IPy4AexMNV6/u2H@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6hV00gW/VUdsZ+wWFZ4nF2KK+0zKKTEfHLQTKAG6oCJhQX8+9
	OqD9j12BZHvMkVpXGxTYsnDM9iWvElhvxpCUzZ+YQo+6mDqFK0+x0VJRieOhNIvlYbKd5H4EIJV
	MQvnIf8+WljMOvh5mLmN+UH+llQeW/hQmql8d2gfZx7P9bdk1EXIShb+r
X-Gm-Gg: ATEYQzwtsWemtDfpe3ckf7fKKKLcWGM40p60EnE7ftAARlTFZ9+a5O2gyN/DiKVROns
	lbrL5SNkaQn1ZhkH6exkqNP0aYGAki6DlMv728pQ8KSemZ+N70dMvODKBwigXiVu5Cp3+g/K7Xt
	vDZZIjyoXeXgttKMR2SecEiUp0Bcy+hDWipKmn9Y/jOGTC4D4gYjVHZaEl6NbFcQhqymbPDHlTb
	ww0n2KoNNW5gsPaDnG8x7x5DL/cFjSi/OUpbXQZAm0JK+39pf1pNZSSS6yeTIzC7PA548C/shSJ
	nfL07qgE1wzyU7lAImj1P3wWzKPzX3kCODoFMZAcRe5GKNU2bF9vx7oYfx+P+n2LdBwQTPH9IB+
	Yb2uzE6rAOUti+rI/VGjAqGODeVsQqZMtKRWlTcqviY4LKWMa
X-Received: by 2002:a05:6122:20a9:b0:56a:7f37:d18f with SMTP id 71dfb90a1353d-56ba7004427mr1657913e0c.3.1773835386475;
        Wed, 18 Mar 2026 05:03:06 -0700 (PDT)
X-Received: by 2002:a05:6122:20a9:b0:56a:7f37:d18f with SMTP id 71dfb90a1353d-56ba7004427mr1657889e0c.3.1773835386051;
        Wed, 18 Mar 2026 05:03:06 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm7196761f8f.23.2026.03.18.05.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 05:03:05 -0700 (PDT)
Message-ID: <42b99f91-02bc-4062-93ad-02db3fe81b49@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 13:03:03 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Geoff Levand <geoff@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
 <abqRvDiAI85w2bCe@gate>
 <dfb53d65-ee34-47bf-b305-5694c7224ec7@oss.qualcomm.com>
 <abqTSG-wg-9ahRTe@gate>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <abqTSG-wg-9ahRTe@gate>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba947b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=nZMMRn6NZ40Q315s03oA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Ot0or2GJluDs6j9FFnMaQ08IbNPAf5PO
X-Proofpoint-ORIG-GUID: Ot0or2GJluDs6j9FFnMaQ08IbNPAf5PO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwMiBTYWx0ZWRfX8KD9Q3+WXmTC
 gCEoMTpxUPmU9IDTG7b/WwNNOPD+HKw+c88x8nkuWBXtFOQaABAWsZzGLy/7YOdQur9ae+2j6Uj
 CuGRvuIr7WcfZHmXKiD4ufuQkGKoqTN+7F4mOhVoA44dA0rqStq4KSZOm1XYHV73JkZNBe5yh64
 R82N498FXLzYZxpCxzWdQ3dLbKU6LZQcsEJftKdhtttrba6/Hw9EpEv4kaSHhkmFRFONOgCPpE0
 tn/pvxRjK+9d4S3UyC2IaJg+vl3zSjMXwS4Km+OrmZ537LcU/WEFH9Fi/mKwDcz/UIEultOq/6L
 NlVruIKR2RBeDWXZeS3uQp2B9XLkzMVFWlTVtuUNKg5Y4vWjQ4wPFICUeU1pcXKsb+e0oBhn9Qr
 E7T3HelP/IztJzfuAfw5Ck43jaJwC82PYOQltGnOl/+r6pHUc2LPDf8w5oN38e6+PhCF2siUCnk
 aTqB9g6gr2OuDAnyWCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180102

On 18/03/2026 12:58, Segher Boessenkool wrote:
> On Wed, Mar 18, 2026 at 12:54:30PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2026 12:51, Segher Boessenkool wrote:
>>> On Tue, Mar 17, 2026 at 02:08:24PM +0100, Krzysztof Kozlowski wrote:
>>>> Return value of ps3_start_probe_thread() is not used, so code can be
>>>> simplified to fix W=1 clang warnings:
>>>>
>>>>   arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
>>>
>>> And this is exactly why -Werror is harmful.  A boring harmless warning
>>> turned into a build break :-(
>>
>> -Werror does not matter here. We do not want warnings either, assuming
>> of course they are correct.
>>
>> So if this warning is correct, then patch should be applied and WERROR
>> is irrelevant.
> 
> The build is broken.  -Werror is positively harmful.
> 
> Yes, you want the warnings fixed, but maybe something else has priority
> right now?

What do you mean? This is waiting on the list for long time - note that
it is a resend - so if warning is correct, for how long it should wait
to get to the "priority" box?

And why anything needs even the priority here? Why priority has to be
discussed, especially for some legacy (I think?) code? Why correct
patches cannot be simply applied after some time/review?


Best regards,
Krzysztof
