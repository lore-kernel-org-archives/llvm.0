Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1B035CB76
	for <llvm@lists.linux.dev>; Fri,  9 Jan 2026 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974396; cv=none; b=qhzOAOJ+sJIXN0MBSrNZlrX5g5PHS1o3XrelFnwsANNOZdL7qb5P/6CliWEwY2aGIv9Nr72A6tH3bDnocjynz+O+u9HJ1SZcqWsQSdLzNFIsGhySaX5mfBUfs4PojC6tEX1E6eUPKX9X+IDmnpiCYIuE/y+R+/kLwg0ejPwyoAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974396; c=relaxed/simple;
	bh=rTLHUlkEj7FTIIqNtQGpxIHSrTLetqGEyWyk9uxvDMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+eRAgCdJi4xcLjDGm0Y0lpE/LL+gfSRGcccGi0OfOUi5J/WvmZ8osERSmNVVwd+rrWNnHIh+xCfqPAdMlTOHhPBkigUaYvdRzmePDEn2VmQt5+QffN4C23O3Hu6KDnydXP/iShe3gijQ9dnN7cSVTVvhh+t8zlefc4Ykikkkg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SY4eHgWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfKxfIF/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SY4eHgWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfKxfIF/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099XgGo1048208
	for <llvm@lists.linux.dev>; Fri, 9 Jan 2026 15:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=; b=SY4eHgWRegCoCESk
	Yapaho1FIoynUqzahlV8htdbNyfrSp0Z+6UqbTUkS3bPnnRIpEfOIgQFRaYUWMxx
	VQBUSTXrIGj1Z8J5MswbebEHp9sw4Lmybge3HqD0AooIXWnalvyNgK6R0uuw/LbM
	VmVvvDFDvS6HRN24vFvUaHYAQMUKM2hnmh6+z7iQVDdi4oiwgIbnPkW5TFf44ERF
	uMhw/KL9ZxeXcaAk+ImbJCo+MO5qd/XPMkWlILOd7TK3h4NVZv1XqIOTtuYfr5eb
	/JPlg/8gzHuxNgd2L2QdSWBw8OF7H/XRMw5uHtkhO/E+FOtFqOV52j7oKzdqZ++c
	imFCQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b91ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 15:59:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9ff555d2dso1182632685a.0
        for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 07:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767974393; x=1768579193; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=;
        b=CfKxfIF/ai6NoJVNLPW8Jp/dlD/aidcqit+nHgKQJo8wGxYxF+tWrGLvZBOp6Y1bpi
         bFITUTeB6TEy5n/HZdP99MptPp0Jvo7/JNFxLv/7JqT0qPEH+PfOK//XTt4vqu0cNSMm
         1RVx6YuAJor+7VL0Z6iRLi+Rd8eFhqW2di65/bcV79JqSlQPMYaccIZme7lD9ee9l00F
         9cYfFz/MovAupiDWoag+JN0/FN1HD4RkE47RByOFdOvB5s5zOz89a2C3Gqicwj9HaP5z
         kl6GGMsaI0aajOnUBv4EFET9Yc+qcloGRWQV76nGrsjUAu7EPDDPLGKN/1dQ8+SPb3ly
         P8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974393; x=1768579193;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1yJjgm4Rvq3zP6XQkQoHWK4jVZjfp2PJ8VoVGPwhkY=;
        b=tRwt5aLz8cA1dEAifVMkh0QpM9rKlfH9j0P78DpCNCCPpjxgNoijMC72hhaVT80t7K
         CHvsZ+t+SaylQsEdNwbEknybuTErdNbruJB/EzeKh2QJioFXjq4nUqq1jk54x5mvNq0h
         eM0HQOhU66taDhXp5gIWoIbBB7jBxzzZtZGX+HAAOibIxuL3Esmh0w2cZKcuzlXJBwS4
         cncGrvqAenACltjfHOXFBEk2oA6zghM1xGg+2YrVxizP34l7gcbcDlZbRE1OTYDX5Q1i
         BkbxkAlcyIu8UkWjiIJFNKGRmarUhtP2hQFFkoF3+WR2qXWW4RNLBdcVffze/pvpiU96
         cS4w==
X-Forwarded-Encrypted: i=1; AJvYcCV094Y018iMR/Nn8bmiGR6rdwxJAu6i158sYFPphub4SGnhMjHsmrOUaA7Gpz/46GjB5cU0@lists.linux.dev
X-Gm-Message-State: AOJu0YwNRVsLWK//LIA404W2ssKZirWmGm6fm+oBPwax9UhCgv02PKeJ
	IEd/1xntfbnoOUJZCye+5ELc0UDi/eH5qR4DVmwDnRkejOxAFRlXEjwXcILYR0Ls2LPjJAx2Dcs
	jW0fN8aNgYbNWCVPUTQB3LBMRRU9oFL6D1kXtYXJSw1+qEtRJPJYY5Lge
X-Gm-Gg: AY/fxX7SexZsYm0IvqkbkuPyHAJEEL/i/6mQ/9lDoCjjkuGZCmcQqkOWIijndHy/eWr
	KpTnCSlY0NrP6TWMg8UZUNmbxh4VzLKQa+jiA5I3tjVJspqbKLjCVcRUTP5ie6hmLXeF4C1D/8N
	w9oWcTfhVlMGbcgq1Oim+pwCDZ4LvvodrJoHX51H7fG6ybWgSU+NM7AeCD4Y+10335z1f4dxZ0u
	bojZe4VNhDHVSE50MwcEKtB44TTC3/yAmtHCCXQl1t9a/fCI2J+Pia0v3OXmMwnzAp/QBtoKkCF
	mwgXVKCdkupbnBoKodPD5krk1py8B6zwV4kV1HrH7Wf5dTvF5YMumRzb7DwBo/NYoW9KytxzEZf
	B35J7gAGg9E/PnhcZjBUjcmORtnUGxEBIaCKkfw==
X-Received: by 2002:a05:620a:4012:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c38941be00mr1353947185a.87.1767974392644;
        Fri, 09 Jan 2026 07:59:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESJfXgvNwYoKbr+VV5K75y0TEuDRNpdFfr3P8pbO1Z0XQiQDyYbEMWdURI1MI8Vrv8awf0vw==
X-Received: by 2002:a05:620a:4012:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8c38941be00mr1353943085a.87.1767974392196;
        Fri, 09 Jan 2026 07:59:52 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm214846375e9.1.2026.01.09.07.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:59:51 -0800 (PST)
Message-ID: <f49d18b4-f7b1-4a48-8132-6c081cfb78d8@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:59:48 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] ARM: exynos: Simplify with scoped for each OF child
 loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-3-24e99c177164@oss.qualcomm.com>
 <20260106101107.0000398f@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260106101107.0000398f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PO0jC-zVxpNSQEH6nacrzeu1-gdg34ia
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=696125f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PdBTwWr2l7WQ-UydZiQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExOSBTYWx0ZWRfX0o7oTBPEIGBN
 sHZRcxiEyOTGLj3aEpIbJaK4Pilc8niB573YSc3zoYmrOHrLARCULWWkZ91zMX9IDyVd//+j7O/
 OcZaEMYXGRHrBN9gjH9xjUk7hYBC/E6XtqnONzr4zCxu6XdyiHSfsDt3PGqp5Ij1Vd+5KAIB01d
 Yr8pH5pysya2Rs+VfYWs0bUer5ILJD1YPedn10vJHfKX4Mbx1lfrnvb8ZCqjfMP9cbz4MJA/X+U
 qgc8ke3907DQg6Da/Q/sHT5Otn/KZ9uX6jvPqDGSxLorUa+vmCWHTujN6ugOh3yIF94W7tSiSQC
 TrSjrJ2KDulAtuAZhZ+/hsdN8IkPbIu2XYk/PEVAf0l6SwBTtVhjMbKef+ip0+CKVuKJfXFdsAW
 1/J2AcWL5Mn4bFBCA41tTjmFYNqNgfpzqkJZdgaNx0eveLyh/NRwMSUm/mCg2FDS1NbsE2PW/KP
 QogEp5tkr8m1y7VtKNw==
X-Proofpoint-GUID: PO0jC-zVxpNSQEH6nacrzeu1-gdg34ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090119

On 06/01/2026 11:11, Jonathan Cameron wrote:
>> -	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
>> +	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
>>  		struct resource res;
>>  		if (!of_device_is_available(node))
>>  			continue;
> No idea how common this pattern is, but maybe worth
> 	for_each_compatible_available_node_scoped() ?
> Bit of a pain as you'd need a of_find_compatible_available_node() helper.
> So I'll let you assess if there are enough instances of this to make it worthwhile.


I think there are only like two or three instances, so not really worth
the effort.

Best regards,
Krzysztof
