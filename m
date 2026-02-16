Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708F2D0C9C
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240301; cv=none; b=c+fTW1tcgHZu3ZQYo4zQHztHaOr3ZwTzvSl18Sn5tXxrNuLEZMkSNv14+oDHLOv0w24Zbif7PymyJTZtrek7LQWZzm9alvNOocUFraTHSBhK2iDmdNrUniEB399rfUfUkkaufvWJDnJVAwKcC8UQX5AKLUfl6b4LfWbQH3nTtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240301; c=relaxed/simple;
	bh=29y27mL6tUOMnoXbnGAKdGPjKx7fYV1FlCWTRdzh8Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vtk4oINaFT2Ov/bTGv/m5bp6uxntcysJetFDKDWCB/RsXThQuJTJDR/kTLG+z2XRH94jpleej8SUUNMnD2kqKwEztODKAWFSoOGMmnagUV0SUlgRdHafegBeQB3j3ORr9KIb6yYMzeycSI9jcgIszm502oY8H1OXIBtDeMEFnIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQ3aZ6jW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0FD9i9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQ3aZ6jW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0FD9i9F"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G0sOvR2617484
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKB6cyGrE4BAJIV9F50Ui+1juuhpnbI6RlG2V3H6wT0=; b=TQ3aZ6jWYVGwZeLe
	p62YQGl+hOOxwlBdeAlDzWBruQNFqGQaGUh1lHSEtTNY/G/Cztp0ZNVPsZgEODJ9
	aFOH6mZ48ygWhmGb5ej2j4h2j1vjzN4yAr97lvVWqU1ky4ZUFWOe9t/y+tYU35bF
	ENIFr1mwG3htXVaELpXkpQun076L1b4/xeZVaZoIL8p6o2ZL0zo6NtWF0u+pnz8e
	/9qP50c10jSKiBDaf0E+26hWB8cboP2FCTBzE4J4Y69naPJrPJP9H+NM0u4ilyV9
	j4OS86ncyJ5c5qfBvpY/BFgoIOSfhm8FPxH1OXWP9jrTHN4nFUD8CooEYZZCUPIn
	SLVL8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe6497t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:11:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954937be97so23589616d6.1
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240299; x=1771845099; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKB6cyGrE4BAJIV9F50Ui+1juuhpnbI6RlG2V3H6wT0=;
        b=O0FD9i9FUwpBwglKiK7qfSejtez/+01ZQtCLk39piNX3uyvRPLO7ubbHpKoNHndGyj
         prYh7xCoDCEkMEdyZkvB/hVpJFVaG4daeNzXrFKk499jGmFy8q3K3HJTPCtc0rXHRTuO
         zWpmBWstzda0Ooa5DY8xQl7l3jPXQ1qxOAsUMgIISbZ1KOt0xPv8eIU+w0I7XS01DMA7
         Z+5Fnwm75o9ZYgvzKY2zzpH03YSCiNn8dfAn3DtXmLuFNZCqWWUOaxLqlxNMAx4zZI0Z
         ZHXdvjIwRQzZh9OOYr4n2KWbmj2cx4Yto5MMlbTb8YqS/QKSQ9FRXIgq6FwcfDjouaSK
         NBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240299; x=1771845099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKB6cyGrE4BAJIV9F50Ui+1juuhpnbI6RlG2V3H6wT0=;
        b=tR7XZnaUTHXgZ34/SxZk4aeT0RsxsdSacNiLPXMYu/l9JovCF96DHXEeYFKAu2Saww
         Hq18dxXGTmZN7chOy8wdRsT+vbIvdkoxgDKopFHOMoD3q/zBmh28Xzzcd/E8mBQ5o88n
         6RaXW3ySodizh7DzauU5aFZOhNjC9qTS9ErZx0tS18NgiPEzPTjnGbowd6Yaq5Ijyr1B
         qJx9P7egk67J5wvQWfOJ78ezFBbT9aTbbBbyZboe7wn6HQrvp3N3LvrIwIoPSsia5dh5
         giFJoYmdGz6qX+FSXOThxKlhlLtihPf1H2/1Hw+It0Eo9BbrOE43YCS/Yso2EGjOROKD
         c7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXSAe83N21GCxx8YrajJBvMyn0dyhTgSxO6kbOv5wPXUZk+75nSLvQQCFx4fDdhYy0sQtUB@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn8f5ipYrqeEnnh/wb95+uLqxonaz2dABPCJ8vVVxoWeKu5cJ7
	Dex1hy6MInu3+9wvylbX5caUVKG8ZbRGejortsViUimOWRsaVhyRmU86zaacVOZPgKvjWugqoQL
	TboD17GeKfLfn9+Z6AindF7kFBtljW3cCYdaLbRrS/X5M9W9JAZ43jPBB
X-Gm-Gg: AZuq6aLp/3Usp/BZnESDfgBocA6d5SDoAFd+q7xfXV6zwLIbNlvj2h/PLk1Nolmsu+D
	JFoYD1fDEtGVDtFeEg0e6nbZATNXPhEu3eJfe9xmuTsdwsXVqWxVXTcBuzKkpoR2M2dobf8CVDZ
	RL0hecvKnoAjTpT+NQrECeYSDVymh7/5n0hFVWRCUcxw5xgqLANeK4ZalBwlphxxEZn6QqNv1BD
	kZZVVmoPCr7eEOLG4jqiW3WDXvQbZ9/dtoUIBb/IZQHxK33Esp+UkAcMK92Hz3jmdBtKhYrNZ6F
	aGHkHVlfn0ED2svcyJfxb/tMoJikmWdy468P8onmdLGJvOlyYOrSD/+2EH0rdTUHuAtwBcdHRul
	eqrPy1QUV8ya8k3omtGC+1qCPFiottQbdI8pMOdHhxG4O1O/qf6Gh6nLdeRDXqQAbbdNlyh05bw
	Tmijw=
X-Received: by 2002:a05:6214:5c89:b0:896:fe6b:8bcf with SMTP id 6a1803df08f44-897347cccd8mr106434816d6.5.1771240299011;
        Mon, 16 Feb 2026 03:11:39 -0800 (PST)
X-Received: by 2002:a05:6214:5c89:b0:896:fe6b:8bcf with SMTP id 6a1803df08f44-897347cccd8mr106434636d6.5.1771240298606;
        Mon, 16 Feb 2026 03:11:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766459fsm251257366b.45.2026.02.16.03.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:11:38 -0800 (PST)
Message-ID: <e5a25ae7-a17d-4068-8f56-4b8a55f0975b@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:11:36 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] firmware: qcom: scom: Simplify mutex with guard
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216091525.107935-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216091525.107935-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=6992fb6b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=4QM0Md_L1v-EWR8JfnAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: arssj66BqBxnSfNQGcZ2wjYGzT2qwE2W
X-Proofpoint-ORIG-GUID: arssj66BqBxnSfNQGcZ2wjYGzT2qwE2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NSBTYWx0ZWRfX2v2DNvD2jvOw
 Y0LPTvBs0pxkR5Kd1sQZ3aHdg5M+KRKyqzjBhzmJtH/vGC7ks1kpFsm0rYoCkuxVGIJ4KarNQqh
 IhaNFOjI+wjjYPd/XgfhMRMmZlA3ro75m4vtILN9MEquj07gpRhd6OTCTy2kqT75g4DLB6beQ11
 wmWUwskkb779lpXhGUPiV1yvggjJl9/TQKG10SIFRmr/VhZvzG9VbKEHuMlVFaIbIvvKrJ0NgC2
 N42d2kvJb2ZZUFrVMLNbgdA+PiTMFx1R4QxPcIJnh3a2Ot7n/UrAbPs8/2BhVPJH8sOdohWKGJN
 8E1zVQeGx8Qs0nK7stdWfFZT6PWih6fzOzZyVnIegenPOynRsZynrjVt9EWMA37NbBwa1xFujrh
 rWqH8iLZORxEbr9nn6nH9EgIxcpQX1LFxCwx5qyAg3lsUcwn0QbXlmHOXizQWaY5IWpTTJVi3PW
 VSgIcCzSyiBosK8DfUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160095

On 2/16/26 10:15 AM, Krzysztof Kozlowski wrote:
> Simplify error path unlocking mutex with the guard.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
