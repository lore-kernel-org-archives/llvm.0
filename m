Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C953118C02E
	for <llvm@lists.linux.dev>; Mon,  5 Jan 2026 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767618337; cv=none; b=QhBO+PUGXu0PhD4IN8FUNqy15clbutKjwu2ON9kuMF6VVSddxtX+F2RJoXClY7rPjKQic1ck6fhxOKihMHw1Tee+LFR42GEETgtJ/vIFVj8IMGwmeckc8uF2ZemnpIab0+++MR+d/iRxZoPaLn7cxYwfSArwGK+aI9zSwVkX/So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767618337; c=relaxed/simple;
	bh=OF0Z1w79CszBb+IjEfCZrCDLofdNtVZCjsmtoUszWeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qKBPszh6a5K06NaVwohGTtHcO2lTZnxpDC1BfzRB/YhnCygP2TOy5fJdkkqZaT8tR2PAmVH2Lc/F4PhvwvLlAHuz3OCDIQRe1gCqlnpwHGBvLNwI+3VNZMgdRB2NOMoiCKwInVS8XrmbYE+ZHnWZXkmeHOhwutMBHjrMUx3oQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVcSIxQ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPz6MrYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVcSIxQ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPz6MrYC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605BTTB41814924
	for <llvm@lists.linux.dev>; Mon, 5 Jan 2026 13:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hi6xppA6IiF1VNFScxIPOX30v2qDntTfWCoxxMRGpNU=; b=XVcSIxQ630saEHyY
	0+qROzW3IL6wweWH0uTYosnIxlp9wfXX+ETURG4i2seE8sc8nShqbUzNWsjXLdYE
	sjC8/sbIzpYBYRdPJrnTP/mYF/0Lw47XS1hdXqdyreICqTaehkgmMOVeQhI2Dyfp
	qaWwLoBSWTUVzx/bLYuCgXQiijZk0h3J7ETcdkWjQJroqZaWbv6jqUSBHEGR8dRQ
	UYcWhwCrRrpwZBkMDUkJpKTDTQMSmK205q5BYmXzROsvUQX8qoKqKOEbUCovjAKw
	1pL9Vlezcr5FGJ3ooJ5Mjf265siq3YiD0sDGJaDQeB9Iux/UYUTWUz4JKubN6ixQ
	Z5tGWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4gyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 13:05:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so439880971cf.1
        for <llvm@lists.linux.dev>; Mon, 05 Jan 2026 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767618334; x=1768223134; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi6xppA6IiF1VNFScxIPOX30v2qDntTfWCoxxMRGpNU=;
        b=BPz6MrYCfQORpiC16GxHW8xMrJfV+ayXSOl+GL3JkrTDCEakFOMfMQPPfhDeGwj5pa
         KxzZXOcX5r9xFNLlB5J56QZUtF74XRknze3oofr0c+DWj3PF5Geq6PvRRNwfGyZJnjv+
         2sRDRQOvwYaxHd0Grf0ftu21a8r3d8OZ8RbaTnxGP5UiidcxLYcaHzhwzN1BYydl3EY7
         glB66PXR40CZNnsvNIMxaKjo59rWPegzqSjnD1WEnGlW9BzmkslpDEdBuL5cUr1W/IsV
         7a2vNhBj3a/HNER4ID1SWKlm0g0Gdd43/GWQm37iYdPiyj0bWdJ8tngczBr7J0SI34c7
         D7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618334; x=1768223134;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi6xppA6IiF1VNFScxIPOX30v2qDntTfWCoxxMRGpNU=;
        b=WCvtxizuFLLYX3NEaonr5EgVmIv0Vr/LbgH/ennKstCM6spxBAsIUNkkW92TBW//fm
         IhwgG98jEGgV9uacji7HeH3b9v5kRI9TjsuaZCkx2mUCx2zeKt3aeEjhvdCSXymR2WjC
         auh3fLw8lxnxdIAsoeixJrPSYMVDQ+OYi2F+LAMjDTeOwQm3w3rndDUDb76ocb0nW+J0
         lmb12czKeE/gxfFP7+teVQIYy8jCm+1y0m6tmK4H7Wq2ibdKC479iCAS13IrxUP5ldCR
         9hVh+nBrvzyh0UDu97tPhH767PL2R5Y/SB29zYDMZ4udNHvb80ag40RLgZODr73DwsRs
         YNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPdAL0pzvPYJ7Nlpk/1KyaBvvB1UiCaJwmn/lF1plO5HaEbpsLl11ErlHgYW8cpa6EwCg3@lists.linux.dev
X-Gm-Message-State: AOJu0YzGuzACUTnSvKgGYWVug5xd0zUxJRXlInRZQxeVhqfyhrecO4hR
	2pnQQTOXd4xjAYJ8MBqNoaxX85J8PTKhYWVTVC242bjufCZGQ/2cV0D7s4zNuHdqoH10+xepFF1
	y/3CGgAfMWS5pybJOFup9cRxNF2jWfEa9onclSBas07/5GQmuDMNcLqyr
X-Gm-Gg: AY/fxX6Wz9cH4TFJA6Xp0Ze8BgeIia1fWrfPOTe/8lfFxGqsZt5Rw6mj+YASPKzRqIy
	YuL+Mz1B7G+BudagfkmwWGc4Zc8TvCr3vEfIUJqlX3VYkUPjIPYXd/3L9e61JK4UxhRENFGq6Dd
	ApLd0JFQXPjOO9mexddF456huKBA8eD4EKskwnHxHJ8eW0Siky6vEn0L7YP1JuwTCSxVd7+GWUn
	D3q84o6CxEG3jkNhytJn39mnnYIUFuLcAvIafeFP0yGJXpKqhLSilU3OPxSKTBXdd7OED4FGwKw
	n9DXg9pPlcKlGe/O3d4cSUs9iH7no72AvdmbgNlWD/6ghpozYRTTSnbFv8wsJ/vzYGh5c8GLw3p
	aAe19CS8RnoebTtgajjtq/gT4iWzuYsMscWzJ9w==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr618704201cf.47.1767618333734;
        Mon, 05 Jan 2026 05:05:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfJ35pQicqQxvlPnXhffYEueekmedaX9gRCfm9VbqtSrduD7dk8BlkO3qiI9eX3HsabS60XA==
X-Received: by 2002:a05:622a:1248:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-4f4abd8c6bdmr618703671cf.47.1767618333337;
        Mon, 05 Jan 2026 05:05:33 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be7773dsm58741995e9.8.2026.01.05.05.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 05:05:32 -0800 (PST)
Message-ID: <3ca74ed7-fe54-4ddd-b0ab-5f9eb56e6a09@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 14:05:30 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ata: ahci-dwc: Simplify with scoped for each OF child
 loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
References: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105105252.00003b5a@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260105105252.00003b5a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fnRNYv7C00A_qRzCSfMNx46IDESTX35U
X-Proofpoint-GUID: fnRNYv7C00A_qRzCSfMNx46IDESTX35U
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bb71e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NwBXXhG94a3s30lnhPQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNSBTYWx0ZWRfX0WB1SgbSkbA7
 A4d7H4dGRT13L8nN5C/RwtPJHhEryzxJsey0B3IdDFrujNegTXqTqPnG8FgZb8YRY67J/c5hMM4
 qoIqKvFcZk/S/fy2ME0B5XuAM5fo52LfLDgp8xxZazKr3L6/jkVHd399W8GbGshtxsTvjl01zHG
 JDH0DUmtN11cnn1cBBoCZsjA8TmHSYcq7VHulzOHoU9y2Z7m+4f5H74JL4/jFuVynaWZBvSLxze
 sJVGgPRSUwT9EMfjPQ6j1C90VdEnrUrc1KXWhFOf2JgyptayRH7F65ELWnqO71LomZlJDMHSiI1
 7UuxGTYcDRAgBdaTzqKTl3Y3LNw0xf0HwzeZVJcVJvcPmFr9P2hZvPplkNoFVwOFuzgpKKVykdq
 yrQaqQOBLEtPlSCEzshNzC3t6rBY4HijEschaOQ2O5hFuy3ndMa/afetlxxN0lTZ1RjpCphU13N
 1IerNfNuZHGF7bWC3pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050115

On 05/01/2026 11:52, Jonathan Cameron wrote:
> On Fri,  2 Jan 2026 13:50:41 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> A whilst you are here suggestion inline to make it a bit simpler.
> 
>> ---
>>  drivers/ata/ahci_dwc.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
>> index aec6d793f51a..bfd24772ee67 100644
>> --- a/drivers/ata/ahci_dwc.c
>> +++ b/drivers/ata/ahci_dwc.c
>> @@ -260,7 +260,6 @@ static void ahci_dwc_init_timer(struct ahci_host_priv *hpriv)
>>  static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
>>  {
>>  	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
>> -	struct device_node *child;
>>  	void __iomem *port_mmio;
>>  	u32 port, dmacr, ts;
>>  
>> @@ -271,14 +270,12 @@ static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
>>  	 * the HBA global reset so we can freely initialize it once until the
>>  	 * next system reset.
>>  	 */
>> -	for_each_child_of_node(dpriv->pdev->dev.of_node, child) {
>> +	for_each_child_of_node_scoped(dpriv->pdev->dev.of_node, child) {
>>  		if (!of_device_is_available(child))
> 
> for_each_available_child_of_node_scoped()?

Huh, indeed I did not notice it. Thanks!



Best regards,
Krzysztof
