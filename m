Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE42367D9
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846069; cv=none; b=m6K2B59FGB2QbJagYXqMkwip1EjYFfjtlN1O2pCRc2yET9lsIw8GEkMIevq/9sJTPlFVlkxaxLLDG5QXEExbr15lDzb8FpGdp0bWmTj8KfT5fQ7uK8xH0z8rqgad6zgNGUI/B4wgVkY2ol2Qs4QupQ7A0Ug0nMzDayBajM5CqGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846069; c=relaxed/simple;
	bh=XAa6VmqtNtdLopFuNm9rW/yY4K2VDb8qrgNvEv0xz+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqxlJTT1Lyrem0OtqS4r2KdFb26gZ3QLGo4tKd46442Rt/OicQV6vV95bbO3Cg8E7D3AWDRu5LydUGtP5bUcvIy6m+MonwsDDxmtgNEmADERRomaoaKhr/8NmvjiTR/4o7lpK+9hiSPtWm2QUGABzB3iMBY5GTFOqqsBO7gJbdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtqAR6tM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYRE4Brd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtqAR6tM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYRE4Brd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IEQ02u2789509
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 15:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GoRA2L8D/wURa/t15xJL/5XRoOAzSYwjg4eZrkQhmRQ=; b=AtqAR6tMi3ikpWkL
	in8e0PAi3EBWndJlXJobe6bmgyDzv2lkO+SkJOoZb6pRkKPjhAhtE4/qCbLXxG5o
	C69L+LZtpBAg00LODkiljNSvZ+jlxNUztu5kEHU5a3g+L8xaDCL1tFWJglhcpDRD
	AjXCL3C3ZbH9JbbuSOjqM0RS9Tm/9lWMwuyxj02QtagIBzgSz1biNYK08n/fL0rC
	t0fSKdq25gqKBxOMl+dZYg20x7gWEpzJwqu2DBubchpcHM0SelkUR5LNyPSxMf5W
	XT6mMDnH7ICg9U98Fcwfngn25xLUJ6ftJF4SKpHAZiemlSW7tRPJfQqyDL81SYV+
	kM+Oxg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g32m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 15:01:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so1046622581cf.3
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773846063; x=1774450863; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GoRA2L8D/wURa/t15xJL/5XRoOAzSYwjg4eZrkQhmRQ=;
        b=dYRE4BrdTiYVkPlU/e4PJ6WTpcZpwaBjjgrab5i/w5Ux+opNblx5D6yM7GtYjVCQPz
         az63ZKMF3tv3p+MDHEDAtRjQ+NxJpZcwRnryjJ+VG1DIJ6XyuT478MELvQXJRKhctiMG
         21t3eGLRtGvi7jOv/C2xGKuQKZp0bM6cPRpEK6K8O+eZ31KEwML3oXmrBV5l8mokUck1
         PJB4LVq92qsQq6I/9vbFXVlgsaL0P1UeYZUI0wZNzqx05AVJb+CGXWGSBNrrgdycypoR
         F6H5btRLCVE+z78oLe9PbB6xPLgTHyW4rmEhnz67dLQhSN0Ja6vcsvHdPa5E+5eZ6eim
         vjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846063; x=1774450863;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoRA2L8D/wURa/t15xJL/5XRoOAzSYwjg4eZrkQhmRQ=;
        b=BqvtjC5AAUmz29lNOEh94vN/QzovI5BMrfgGDe8YDERlQf3CPFASUj1vbX7r+MKOKo
         w0IEpWeKQP4s9Gs8JJSGkxyGPVy1aUaqkIbcZO9IlWT5lXantBI92ojciu98bcGQjxBi
         IEcauMbUFqLUt88W5YaPiPNkHUIo4eOctEBavTYjiCI6565YHOyLrOOadU03DVW2+fQn
         m/B7L1VHbxfBaOQs6Vm0Q249wvysE1/+d4WyPQR7y3+xvW8G9O/lV+N58PiiG0+aQrgL
         n5ykJG3leJzJk55IHD0qfH7pQ5smKRP3vFArf92qmhBoa7ZZDtB08sfKDaKuMUZjMJc+
         Rq9g==
X-Forwarded-Encrypted: i=1; AJvYcCVvhfEoAkhhFOyeAAPwZMsG1qaWpSmGIgbd/I2rK0TSiSlFS+3mmOOILF15Scot15N3VWoz@lists.linux.dev
X-Gm-Message-State: AOJu0YxOuEU9g0XJMiqjf26ghV6do+siAkOGzrtQw37hNO3TKMtAoBKZ
	Zx2eDt/HwpVsOGgtHKfz9n7LigRH+hbW1bDqO6BZ4zbENHGzlhOx4V2ChYr6CrSzhgTXMl5OH67
	H4jCE8WO6E1p8CTQTbVB/NMKy0+XnY4yE9qrJIcelhxxGgPLEp4uG6Nf8
X-Gm-Gg: ATEYQzyYexymlD4DSGW1gqMKEcguGHkLV9bF7oGYVvE2Ug62oPY/us8KcrdOIAYx2Zf
	+E+CPkjUHmY4DfNRAXju10QrC5+0UAg1A2GEf0QEUCXUfUKrZg7V10l2nZAW1CmHwCVxvQXgkeX
	QaaUfTbItBb3aRRwDo6lgXjIng+/hujHV/5dHMOLCaq2WwGEvYosoAE7Oo2xRI3UJTz00/SB4fO
	Ev9ZI4TGSYbNeysynT6tTLSrn9CvjSO60/VLhSJ8qkWA+ZdmJpATygl0az9H2vCOdakcZDSJM1p
	PVxiC/G/1kRyfEY8DzcgBrayXySRPlTqcnSqtoO0sgcXr2ZZ2MnNta9H/1oQZwWAwfKzU/HwUWo
	wdBkjcBpsvM/D6C7WHENnm9fTJF/JJAabhx3IxxOe694z1CCj
X-Received: by 2002:ac8:5755:0:b0:509:4410:4492 with SMTP id d75a77b69052e-50b14796234mr47711621cf.22.1773846062587;
        Wed, 18 Mar 2026 08:01:02 -0700 (PDT)
X-Received: by 2002:ac8:5755:0:b0:509:4410:4492 with SMTP id d75a77b69052e-50b14796234mr47710741cf.22.1773846061978;
        Wed, 18 Mar 2026 08:01:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee04fsm144565215e9.13.2026.03.18.08.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:01:01 -0700 (PDT)
Message-ID: <f40ec9bb-ab51-4f20-b67d-c2eda1b646d0@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:00:59 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Segher Boessenkool <segher@kernel.crashing.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Geoff Levand <geoff@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
 <abqRvDiAI85w2bCe@gate>
 <dfb53d65-ee34-47bf-b305-5694c7224ec7@oss.qualcomm.com>
 <abqTSG-wg-9ahRTe@gate> <9434f836-aa96-44e7-8f34-243d6c94f6dc@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <9434f836-aa96-44e7-8f34-243d6c94f6dc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69babe30 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=LO4XtezffzH7F-Og_NQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: PiJovMqCdf8VnO-gBpzfS-_RrVy82t_9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNyBTYWx0ZWRfX37D5HYintzj7
 9tepI2fqhnZWcZLTdQ3ix+sovd9J1wFBkMJmpBS1c9XNc0rG4AYE3eU6psq2n0lJMsOXamSwXs6
 pvHtgdKIS4yYnpiQ2EToBjPJIQ9GJZ2i8K5/VnKKy2GTixGQ8Dqbe7KMS0VG2741HVK6/8mcOy6
 BI1SOCtZ8zuFwyxI5inCwEY8rsB7N6jOVw74V+cYZ6YIVa1SnQ7tib5/agO1sTaVwYR6KQTDGpY
 tNvpJD2fXOtNFqF29jw9pgweXObcT2MzcZb9SlCbxteACzRaonN6tHXwCf6d94iXtxpFuhvorUO
 E8J6GwQAYqoEOQtl8bbsvdLJrJMgA0pZH7mfKAhDmGMV/XqdFLAp9M5U/ki7DLRmLXQUyGCkNRW
 UWNDZY9gRlcx93cTyqS7AU85XYXAUQ==
X-Proofpoint-GUID: PiJovMqCdf8VnO-gBpzfS-_RrVy82t_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180127

On 18/03/2026 13:21, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 18/03/2026 à 12:58, Segher Boessenkool a écrit :
>> On Wed, Mar 18, 2026 at 12:54:30PM +0100, Krzysztof Kozlowski wrote:
>>> On 18/03/2026 12:51, Segher Boessenkool wrote:
>>>> On Tue, Mar 17, 2026 at 02:08:24PM +0100, Krzysztof Kozlowski wrote:
>>>>> Return value of ps3_start_probe_thread() is not used, so code can be
>>>>> simplified to fix W=1 clang warnings:
>>>>>
>>>>>    arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
>>>>
>>>> And this is exactly why -Werror is harmful.  A boring harmless warning
>>>> turned into a build break :-(
>>>
>>> -Werror does not matter here. We do not want warnings either, assuming
>>> of course they are correct.
>>>
>>> So if this warning is correct, then patch should be applied and WERROR
>>> is irrelevant.
>>
>> The build is broken.  -Werror is positively harmful.
>>
>> Yes, you want the warnings fixed, but maybe something else has priority
>> right now?
> 
> But if I understand correctly this is a build performed with W=1

Yes

> 
> Without W=1 there is no build breakage.

There is no build breakage with W=1.

This is somehow total offtopic or trolling. :/

> 
> Someone who forces W=1 on its build can be expected to unselect 
> CONFIG_PPC_WERROR if it is needed for him, no ?

Of course :).


Best regards,
Krzysztof
