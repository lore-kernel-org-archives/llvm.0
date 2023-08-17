Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92E91ADC8
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 22:03:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37HKjGCx004051;
	Thu, 17 Aug 2023 22:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=r2HeDxq8rnJM9r/ehEz4B9uk/N72lqfKhWYoS6qrLSQ=;
 b=pdEZxvn5yQm4thoSWGZUqHmlCHTmZpiSaYL3LS/NpViHqocNYhbJ30R8jJwObEXQx5o9
 OOX1TU9AgY7SoQmYpU4VQt9eD82QvMo3Zmsz2tyyhsX9FA2iTiorAGd1vEhzLvFZovX1
 CiNz4cXpD7arQWqQEumS1y2ic97jK4ZAjv68xK//OLseRM/faBGVJ6k/YTAQa1bAtUQb
 RrI1rl0Hdy6W7Stff4tl896fJesfHjtB6tjC5sOAk5uNipCPOcUcUcFjtoyGUZ354Rxd
 fzK32itsr51ORJFWXeEd3gsVRgWhD/Uo88IdisZSz13A2sIp4PPFO/peMVf66vEl+9Bm 1g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sh3xxb44q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 22:03:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37HM3Xsa029199
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 22:03:33 GMT
Received: from [10.48.241.213] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 17 Aug
 2023 15:03:32 -0700
Message-ID: <85c99a95-a2e9-4017-9447-ea02d18de019@quicinc.com>
Date: Thu, 17 Aug 2023 15:03:32 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] wifi: cfg80211: Annotate struct cfg80211_cqm_config
 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
        Johannes Berg
	<johannes@sipsolutions.net>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
        <linux-hardening@vger.kernel.org>
References: <20230817211114.never.208-kees@kernel.org>
 <20230817211531.4193219-2-keescook@chromium.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230817211531.4193219-2-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZeOWaHLTKcb8QBn55LCkjOU255qamDH0
X-Proofpoint-ORIG-GUID: ZeOWaHLTKcb8QBn55LCkjOU255qamDH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_18,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=766 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308170196

On 8/17/2023 2:15 PM, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cfg80211_cqm_config.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

