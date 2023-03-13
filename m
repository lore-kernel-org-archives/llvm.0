Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367D72569;
	Mon, 13 Mar 2023 13:01:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DBBTOT006518;
	Mon, 13 Mar 2023 13:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=k0dY/SZXkHuYybnXu7s7XYK1csA5ifYFS6bAtPsvg7I=;
 b=Qcwg7idMUo1Jex8qTAJ+J3lLeY/LDmX5yq9gPxp/5qu0b0d/u1LNBTqz7XPQ8ljC74Kd
 hEtQfdXn4/Psds+0F6Jo/in2hhs34HBbjNwizQb2yj1G3SShM6Zh+DmxApJy/mwOaT7F
 17ESctS8BSZ54qo8wz/+dwTPHx9wvre/68mwxJilp9yULmZQVAB0K1GaFzuCTYiIlx9W
 rB7DovEwyDE5XGfGVcWhvw0mRhScpdV0uRws8YzfDM6OMVIjsPN3RE5mgH/xm8KIXhMV
 WcYb6IqI1ZpYglbdRDMcrYupfrSgnggEZ1hfS6WIVAh3ARjAwjsPgg7E9PPnmhrOTOYq kg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p9yew0tu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 13:01:11 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32DD1Alg001710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 13:01:10 GMT
Received: from [10.216.8.170] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 06:01:06 -0700
Message-ID: <81aed83a-8c11-b76a-3b38-50d9120c3a79@quicinc.com>
Date: Mon, 13 Mar 2023 18:31:02 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/5] soc: qcom: Add LLCC support for multi channel DDR
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        kernel test robot
	<lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Rishabh Bhatnagar
	<rishabhb@codeaurora.org>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230313071325.21605-5-quic_kbajaj@quicinc.com>
 <202303131722.uo5Li701-lkp@intel.com>
 <13ad09ae-1995-271a-1079-f9e4f6e06eb4@linaro.org>
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <13ad09ae-1995-271a-1079-f9e4f6e06eb4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ng-Vc-bMzdFkpgfwkY9yF1Az0zdG00J_
X-Proofpoint-ORIG-GUID: ng-Vc-bMzdFkpgfwkY9yF1Az0zdG00J_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_05,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=818
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130105



On 3/13/2023 3:31 PM, Konrad Dybcio wrote:
> [...]
>>     include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>>                                                           ~~~~~~~~~~ ^
>>     include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>             __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>>                                                           ~~~~~~~~~~ ^
>>>> drivers/soc/qcom/llcc-qcom.c:20:10: fatal error: 'linux/qcom_scm.h' file not found
>>     #include <linux/qcom_scm.h>
> This moved over a month ago. Please send patches against fresh -next
> and not some ancient tree.
>
> Konrad

Thanks for reviewing it, will send next patch series against fresh -next 
tree.

Thanks
Komal

>>              ^~~~~~~~~~~~~~~~~~
>>     6 warnings and 1 error generated.
>>
>>
>> vim +20 drivers/soc/qcom/llcc-qcom.c
>>
>>    > 20	#include <linux/qcom_scm.h>
>>      21	#include <linux/soc/qcom/llcc-qcom.h>
>>      22	
>>

