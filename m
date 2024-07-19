Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A32AEE3;
	Fri, 19 Jul 2024 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721372800; cv=none; b=Ol2Nk4TNX/r/iEfbbqjHkBzvt0aKaFaAl8sFCfbk/NEJiIYDZ0RG4Mxlm63onDT7PtswfaQH9WgVBsUUfwyn/+OpHIKFX7LiY0h1gxnW8iEt58u1ku4q4S7q2pSRX998WoZnsezeTKF0MGbJMMSBcfupeKcQibEOyWriiwWMRWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721372800; c=relaxed/simple;
	bh=K32GTfN4oGG0MjOgdzZpqRj0fp7zYr5VtjEbRv39nOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EofffhYg4zzi0gEEz8oi9SSt9HZ1ddCSz5AE+P23fgE/IUy6KkJDHBIizsWPd4W3NVqBzM65mTJhyXhrsbvLQpwtVJ0Z9wJAlAplffStJNZnk6Qull2yhmC8pWrCr5NgVzzQ1oXgf/U9TB3FQjl3ZyK4E/T2GwEv/pFRxrIOmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j4w6zoeH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j4w6zoeH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J0tIa0032736;
	Fri, 19 Jul 2024 07:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSFCnhTLYq+7gO4dH4MIElWjWBd6oBuSpudE9Awk79A=; b=j4w6zoeHPJe3kgmu
	pCc+ywWHdwYw6zw6qERTL13ps5fgxHQTd2ssor6rkxtBSKjgmdw1p7ytVaeObAfx
	6W2FS3GgYnbeQUtcE1RTJ2bbi/Wz8sucbtQ96Ou8BnxveAVcxktGiPSROh0mg+GL
	dFOmu0uSsV+Jv4i/S2lKbBhKNlhQFRREfWw7EvIeq+bANOebu1g1xorjv2v1O6VN
	Mp89usq+2Gg3f0dr61RQUuf80sEHz6O4IsKU8xxTU4kZYL4OGHVT3G0KlhkMK9bF
	TXIDXpFfPzPq1tlSN/FcHouDBT7IIJUUq6ERdg4uIzRBsJxvK+Zw9jqnJVtJkWVU
	k7eilA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe1d8kw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 07:06:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46J76PW5010722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 07:06:25 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 00:06:21 -0700
Message-ID: <53c18dbe-930b-4b0e-a134-7210bf61c8e5@quicinc.com>
Date: Fri, 19 Jul 2024 12:36:18 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7766/10451]
 drivers/clk/qcom/camcc-sm8650.c:3573:29: error: incompatible pointer types
 passing 'struct device *' to parameter of type 'struct platform_device *'
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot <lkp@intel.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
        "Linux Memory
 Management List" <linux-mm@kvack.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
References: <202407072331.baglL4Sd-lkp@intel.com>
 <edfd90b7-b94b-4b1d-a625-a240a8446f1e@kernel.org>
 <ca6b403b-60ce-491f-8254-39e9d8e2eeba@quicinc.com>
 <b2459009-71c6-406f-9760-13dd07277d6a@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <b2459009-71c6-406f-9760-13dd07277d6a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yhIPqF3NGaCqvucUbY2y7al7XXmvFZxE
X-Proofpoint-ORIG-GUID: yhIPqF3NGaCqvucUbY2y7al7XXmvFZxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_03,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190055



On 7/18/2024 3:36 PM, Krzysztof Kozlowski wrote:
> On 18/07/2024 11:48, Jagadeesh Kona wrote:
>>
>>
>> On 7/18/2024 12:18 PM, Krzysztof Kozlowski wrote:
>>> On 07/07/2024 17:20, kernel test robot wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>> head:   0b58e108042b0ed28a71cd7edf5175999955b233
>>>> commit: 09ea421652a832083ea380a72addf383965f3682 [7766/10451] clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver
>>>> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407072331.baglL4Sd-lkp@intel.com/config)
>>>> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072331.baglL4Sd-lkp@intel.com/reproduce)
>>>
>>> This and this:
>>> https://lore.kernel.org/all/202407072212.WptVaUDt-lkp@intel.com/
>>>
>>> are reports on linux-next. They were addressed to you/
>>>
>>> Jagadeesh, how did you respond to public reports that your commit has
>>> build failures in linux-next?
>>>
>>> It reached now Linus' tree causing huge rant, unfortunately not in the
>>> direction we would like that rant to go.
>>>
>>> If you receive a report that your code does not even compile, it is YOUR
>>> DAMN MOST IMPORTANT TASK to address it IMMEDIATELY.
>>>
>>> I don't think such code should be ever accepted if contributors do not
>>> take responsibility for their commits.
>>>
>>> Krzysztof
>>>
>>
>> I initially submitted my change [1] by passing pdev to
>> qcom_cc_really_probe(). Seems like due to [2] which changed the
>> qcom_cc_really_probe() parameters from pdev to dev, my change was
>> updated from pdev to &pdev->dev while applying.
>>
>> When this issue was reported by kernel bot, I checked out the linux-next
>> tree but I didn't see this failure since the common change [2] was
> 
> So tree is not bisectable but that's fine? How about telling the
> maintainer: listen, your tree is now broken?
> 
>> already merged into linux-next. I apologize for not reverting the same
>> over the email thread.
>>
>> But change [2] was somehow missed and only my change [1] landed up in
>> Linus's tree, which led to this failure as Arnd described in [3].
> 
> Nothing was missed. That commit should have never been accepted to that
> branch, but, since it happened, you claim that dependency in clk drivers
> should as well go to DTS branch? No, that's just wrong.
> 
> Mistake was that particular commit going to that branch and kernel robot
> told you that which you (and Bjorn, but Bjorn is busy so it is your job
> as contributor) should investigate.
> 

Yeah, it's my bad that I did not point out this issue. I will be more 
careful from next time. Thank you.

Regards,
Jagadeesh

> If that's how commits from quicinc look like I am afraid to take
> anything. I will be on my own, stuck with such issues, because for
> contributor "it is fine".
> 
> Best regards,
> Krzysztof
> 
