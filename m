Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ED23A1B0;
	Thu, 18 Jul 2024 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296165; cv=none; b=B4i6rUo7DfnoGKY7r+4wqy5xbYeffYDgP2ZvSu/bBGY78+2CEADtiY4irnuEQ/NsXjXMAXMEPm+Ieq01yojma4P1Cb/yF6Sj7cq7vnykCCFnG8vgWkWzPsB/mWWW7ESvLGY65qTdGpptMzZ3wvDoE0UWe0L+YWlXR7ORqxzFCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296165; c=relaxed/simple;
	bh=EogEFIFm1pGmSPSAIiH69J7xaAnZJigRylou0Bvfx9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j0dqLuYfMO2flbLd5SJsLX1OClEZdi3SniM+RCUDYOIW4C7avw6rJygKCjpp1n+jsWDEzZeDCkrNg4P+EDiVtFqyXCJ2XdZx9Ye/QMNpVlUCWMveiy8RRUesA0Jw9qT3OBikTP3KqyaP37aYbUfuBzfHiFrUZKKfr3KonQeRS7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=osE978QI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="osE978QI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I9OnsR031888;
	Thu, 18 Jul 2024 09:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxIGlUH25cr67qIsLSBnWblmw8oifFsdfiBGOgKuQnQ=; b=osE978QICJiOTolm
	C/vgLC9ZJ1kZ2s9NucVq3gNHFnZQQ7ABV7ovF/mK1+10KLVUloYMsjr1OsWAswbY
	efpj/Ltkdl0bej4L4URDK3rH+TGHt8bZ1MBU/m7zIZ99842+2m4BLx9xdjcNmJvh
	vcir3lPTbhefutCfbGuhG11hHcmr2m+dygpak5Fd5TyqgB1JSexxb4xeGxMvil7M
	PoazuAU+VB2AnO2CO5RRMX5LZ/BpMsfqGlAYT2oR0qnoU29LLfyBdDxc6/EROclB
	o4TI3EH3+HPaSgruXEHlaF7pKQ+86kJtfVMPCd3tPW/Zrkph2uPuP1b61C0q8dmM
	SWoHxA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpn115-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 09:49:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I9n71K017962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 09:49:07 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 02:49:03 -0700
Message-ID: <ca6b403b-60ce-491f-8254-39e9d8e2eeba@quicinc.com>
Date: Thu, 18 Jul 2024 15:18:47 +0530
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
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <edfd90b7-b94b-4b1d-a625-a240a8446f1e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N2C0xfEls1-y_3w29hChjKm-EIM-Djkx
X-Proofpoint-GUID: N2C0xfEls1-y_3w29hChjKm-EIM-Djkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_06,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180063



On 7/18/2024 12:18 PM, Krzysztof Kozlowski wrote:
> On 07/07/2024 17:20, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   0b58e108042b0ed28a71cd7edf5175999955b233
>> commit: 09ea421652a832083ea380a72addf383965f3682 [7766/10451] clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver
>> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407072331.baglL4Sd-lkp@intel.com/config)
>> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072331.baglL4Sd-lkp@intel.com/reproduce)
> 
> This and this:
> https://lore.kernel.org/all/202407072212.WptVaUDt-lkp@intel.com/
> 
> are reports on linux-next. They were addressed to you/
> 
> Jagadeesh, how did you respond to public reports that your commit has
> build failures in linux-next?
> 
> It reached now Linus' tree causing huge rant, unfortunately not in the
> direction we would like that rant to go.
> 
> If you receive a report that your code does not even compile, it is YOUR
> DAMN MOST IMPORTANT TASK to address it IMMEDIATELY.
> 
> I don't think such code should be ever accepted if contributors do not
> take responsibility for their commits.
> 
> Krzysztof
> 

I initially submitted my change [1] by passing pdev to 
qcom_cc_really_probe(). Seems like due to [2] which changed the 
qcom_cc_really_probe() parameters from pdev to dev, my change was 
updated from pdev to &pdev->dev while applying.

When this issue was reported by kernel bot, I checked out the linux-next 
tree but I didn't see this failure since the common change [2] was 
already merged into linux-next. I apologize for not reverting the same 
over the email thread.

But change [2] was somehow missed and only my change [1] landed up in 
Linus's tree, which led to this failure as Arnd described in [3].

[1] 
https://lore.kernel.org/all/20240602114439.1611-8-quic_jkona@quicinc.com/
[2] 
https://lore.kernel.org/all/20240507130531.3286999-4-quic_luoj@quicinc.com/#Z31drivers:clk:qcom:common.c
[3] 
https://lore.kernel.org/lkml/ed757bc4-38ba-420a-9da8-d7de1f1123f6@app.fastmail.com/#t

Thanks,
Jagadeesh

>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407072331.baglL4Sd-lkp@intel.com/
>>
>> Note: the linux-next/master HEAD 0b58e108042b0ed28a71cd7edf5175999955b233 builds fine.
>>        It may have been fixed somewhere.
>>
>> All errors (new ones prefixed by >>):
>>
>>>> drivers/clk/qcom/camcc-sm8650.c:3573:29: error: incompatible pointer types passing 'struct device *' to parameter of type 'struct platform_device *' [-Werror,-Wincompatible-pointer-types]
>>      3573 |         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8650_desc, regmap);
>>           |                                    ^~~~~~~~~~
>>     drivers/clk/qcom/common.h:63:57: note: passing argument to parameter 'pdev' here
>>        63 | extern int qcom_cc_really_probe(struct platform_device *pdev,
>>           |                                                         ^
>>     1 error generated.
>>
