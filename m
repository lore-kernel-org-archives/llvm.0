Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421B83DCD92
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846005; cv=none; b=bhLn6XoJMWPPO1vxlWuLcM9+hLle5EJeS1nM5AfkwhXkoz5/vTwu+i8A50b5IPwhYUlBvrH/0ZQHh2YzjC1Gjwy0svoWLrQ11fY4x0125IyV++PggCQEFJxFFckZAR6OUsTyqDQxII1qIWVR6K0gbMAW4TdmJQaRFcweiBfUjes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846005; c=relaxed/simple;
	bh=yexuTRGO7pFMOiC7s6TIgJwMxFGGCuMdHIr5KblbMeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjMsYOQLm0lAmfjjVcHaUNrK0OzH2f1DWJnw6wVdCe19He19R1cuX96IzEHjQJZT1Dy/pDazCkwllClOXsgm2mRAVf1JCJjlveC1/XpKM8DdEfKCCF7XWUE8SVe71eoN1ffiQpGbFGJ7Kja4pLzescYrdhnCXtuvj35ujDAgc5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1A+JtJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqpLCmIU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1A+JtJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqpLCmIU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9MuEM3358496
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 15:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uh4fOJXtDJzMwDO/bK1gSi/CJGtyJDbqAAiuVzFFqxw=; b=n1A+JtJHtip4cIYV
	if9eIluoDP/ws/9uHbs2v4qOjcRVDBCaI984p6EhO9c/OJWpivq9p3muAWeUqGvm
	lZXU9ps6stZh4m+6iOw4AVyZgH6G/AGwAcJBk8yUBj8FFOY7lO6hNEM1FJ3+uivq
	Phih/Tdvs4GooweewWKbyZUyz/v14RtNf/hf8nZbxy0yjMxMMiZzl64ExfHTBCKY
	ysdsBnF7bIElDKdRAFBORWv+OAnPzeZDVGWMrCBtghwtRHHhBhUIltrsqr5Ca405
	rp5PWweIYAafo/P5pZwT6q6Mg8vfvbd5Iw55oVterNcAk6bqkWSB2dKltaKxcRIT
	DyNaFA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb17ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 15:00:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509007aea22so321797981cf.0
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773846000; x=1774450800; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh4fOJXtDJzMwDO/bK1gSi/CJGtyJDbqAAiuVzFFqxw=;
        b=GqpLCmIUvS5GU1plVbWYJGWSMIE5SYwFoEt0/+YBGwCy03yelJBOw9jLn2+QJmxCx/
         h5rqAGYn/sepkl+FngXHQFWREeLYGmUd4yybeLQ7FMbXuR/M6bl1K+RBJYvKH5rQUmBd
         kMst20m0ZAKoy3H5TVOFeiHoEVItjogTQGajirfOHwYG+rS0irnS379Y/Vpj7tKntD5S
         s0Py+LSOfimZGRFqko3LuC2Fw8rdjTs5oVQ6PE+OVn6BRGkr0rnEsmn3uW+rasRzpFDE
         Eo+zVO0XIxpDCVcdwEl+HP1rvEH7SplQXsUjPKNjuunN0Doe4E1IibCXiEWZPgyjVnAO
         UiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846000; x=1774450800;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh4fOJXtDJzMwDO/bK1gSi/CJGtyJDbqAAiuVzFFqxw=;
        b=FuHRzF1epwNodYTh0JqKZA8Wvo9dywZxOPX0DeSaiaTm7ZfGPCC1pmlOShYwo4A7g+
         6TqN8DoY8lqFoBg2/ehGk18bDOzHoK4GkgoQivhR/ex4mZICwHGHlyu2Zb5eO+oRST8v
         iE97m+fmXYRVFfyplG1vxLE3gNgyLK0i0QNszfZyRh/7DcPg97xZa8qxfL9TI3UxsAzL
         OQsWMbXeuR31sx6sUyAlBo1otbpm4/P1GjUf3vUpxHfVpZUK+1BMNtMAMKlbN6Cd9GWC
         l9RMPhmV90+ytA5/Wa6UkqE+Y4P7v57BBE/Fl9N1qfE9zTClAX8SIm9Wbg/4ZN3SFCxj
         3OgA==
X-Forwarded-Encrypted: i=1; AJvYcCVovKYiAt+KrmlA5MFNZV4HKQgBW1+XV/IP9ij8NBcLCETyQARJo/w13qBs28p91rDo5dSD@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd9dEkp8Tq4eoXWOZ0bBLtDw4ERL02eVfIF7Wq32AhmMCqhyar
	VB6eS4SFEYCvQ2tKQ1+sU3XQO7Woqd4YAziJ5zCI1QFIlYPmA0uSphprW4vqO4i3YpHsx5ihtwA
	kW7xLLVTicNtN15hTbsNR8IUj65wbOM6p9ERKUYnffpYNOslQhhR3MG3c
X-Gm-Gg: ATEYQzyfeqozya+TIjd/d9s5giPWsB57d50TEOlbKMTUPNSzHIVKKD9/ocDgxMgSwS0
	LzlYrxOWjRo0fydWtB6vnkDPL7xdClh7bd1P+GjnSlBGM3GED+zoOzjbkHRpPuqOoc0ruuZb6n0
	v0fv0TZUOhykiBypN7UZFCHVZuTpRX2yv/mtEJhFfy6VjcfDg4M0m4Zm3Eiv8bGvT1dqTjz94Il
	r2/bOJuKsvz5a9uG+pHVa+YzqdgMMMOTKYuKE9sNJR+L/IXyNV0LqOV6Jk8QHbyrJMNzHkvn0iD
	yuUzuvrEfDT3qXIicxJnmoA1Iphl6i3b4PmndGZ4kLCSSsFmFz3ognE90DIhytTIJruQ87DzMRa
	zI4cGeaN3yMqkZsIpLkVtfiRqOf7xQoNf22siQzWhiz7dH8Rl
X-Received: by 2002:ac8:5f93:0:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50b148bc253mr47157391cf.52.1773846000106;
        Wed, 18 Mar 2026 08:00:00 -0700 (PDT)
X-Received: by 2002:ac8:5f93:0:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50b148bc253mr47156641cf.52.1773845999308;
        Wed, 18 Mar 2026 07:59:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm1767039a12.19.2026.03.18.07.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:59:58 -0700 (PDT)
Message-ID: <ec20e380-e68e-47a9-ace6-6488de14228e@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 15:59:56 +0100
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
 <42b99f91-02bc-4062-93ad-02db3fe81b49@oss.qualcomm.com>
 <abqWvBj5_t_Q-y6m@gate>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <abqWvBj5_t_Q-y6m@gate>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gN25dxmB8aCwG0A-LsVsyAfaXRpUKskJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNyBTYWx0ZWRfX2xScrn+yVAP+
 6xmKrbjhSXrmegavMt5Gtum/9NRY+x0QddGeyNDP7ZeqIcS+awFUhet6V7Aaun1NRBMYQ6f20wN
 Cx3TK6KR+tX/iW3SkWTgY0/GVALg8a8swvtxlJCFKhThZtjhqB03pNxRmsOTCIgsjPcVB3Ep6WY
 RBfTr2weiEwVBdgLKcyFUsi2GVeZqUbgDJtVPa/f74OlaEihSvRM3Cddv8VaiHV/+fE3XoFIiil
 lgPOIzjZ8kBMbHfx/xlrlcM+waI6t1594/V4EjCsAXORVP9Xb6zevPV0PHJZZw3AqheNvZ+M7WJ
 ttjzenGH0N73IOmjiA99GtS15aGqoW+O48wdqr9KQmUOjPHAG+5a76O61zhkhT85+Bq5MNnCVKG
 o5GbTUk/OY1oZzmM3N3eVt/bvLk5NoDBWtmFCrVtoJnPvaKe/o1Y2IVDRpdmiSebPtJo0rXQy1C
 LoBUCp/U2UTjhdMw9ig==
X-Proofpoint-GUID: gN25dxmB8aCwG0A-LsVsyAfaXRpUKskJ
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69babdf0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Pn7rgDPiDJE6iWDejmcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180127

On 18/03/2026 13:12, Segher Boessenkool wrote:
> On Wed, Mar 18, 2026 at 01:03:03PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2026 12:58, Segher Boessenkool wrote:
>>> On Wed, Mar 18, 2026 at 12:54:30PM +0100, Krzysztof Kozlowski wrote:
>>>> On 18/03/2026 12:51, Segher Boessenkool wrote:
>>>>> On Tue, Mar 17, 2026 at 02:08:24PM +0100, Krzysztof Kozlowski wrote:
>>>>>> Return value of ps3_start_probe_thread() is not used, so code can be
>>>>>> simplified to fix W=1 clang warnings:
>>>>>>
>>>>>>   arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
>>>>>
>>>>> And this is exactly why -Werror is harmful.  A boring harmless warning
>>>>> turned into a build break :-(
>>>>
>>>> -Werror does not matter here. We do not want warnings either, assuming
>>>> of course they are correct.
>>>>
>>>> So if this warning is correct, then patch should be applied and WERROR
>>>> is irrelevant.
>>>
>>> The build is broken.  -Werror is positively harmful.
>>>
>>> Yes, you want the warnings fixed, but maybe something else has priority
>>> right now?
>>
>> What do you mean? This is waiting on the list for long time - note that
>> it is a resend - so if warning is correct, for how long it should wait
>> to get to the "priority" box?
>>
>> And why anything needs even the priority here? Why priority has to be
>> discussed, especially for some legacy (I think?) code? Why correct
>> patches cannot be simply applied after some time/review?
> 
> It is totally simple: without -Werror, you can build a kernel.  With it,
> you cannot.

What are you discussing here? This is a patch, not WERROR talk.

> 
> The ***warning*** is correct, there is something in the code that can be
> improved.  That is why such things are warnings: the compiler can
> produce useful output, there is no reason to scream bloody murder.
> 
> The main reason some people like -Werror is because they are too lazy to
> look at the warning messages they get from normal builds.  Such
> developers need potty training, this is not a reason to punish all more
> reasonable people!
How is this relevant to this warning?

Best regards,
Krzysztof
