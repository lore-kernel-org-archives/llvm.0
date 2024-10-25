Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8731957F9
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 23:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899099; cv=none; b=k9rNlvEkPxQ+JUpvTUSSPjO9ObPVPXVW2PxM7DXxcgX/vEYcxOSbdG0XaHsF+pATFX97GPC35LqgVcDw8xIFopu/kX4izsdXazVVtCeA50EtkkQRaWFMXWNaVBqPnWOjxs8VhBzyKALZ4YM18U2FlGbqldrtTBXHYCLxF1Hb/kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899099; c=relaxed/simple;
	bh=XgHFAGA1jfADoKVhZBRdfjMgfXMOSfjWYg4NrQbXBBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SymsF7aXlNmiqz+sWSbDCcSZmcKF5JCehVugFMiKCISexzUeQ3raKT0IiVwETKQ3Poo4325Rh+zUmu//UoAocWY48BfXD5yodksvaWmx/1CneleVb1KB6EpbZQkY+qnCVadoo0NPAKzK4rnwKZg2vQsBfQBfmWxLAzEWiCymz9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SqJhh81V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SqJhh81V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PMAYrM029348;
	Fri, 25 Oct 2024 23:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85sjTZNqbYK8ah1GKkOClnCktTkUycIrVE5ofGg7hQo=; b=SqJhh81VZ4LurszY
	doEpVOdOrJA1wBzAtZyiNCMfUqeKF4j7PbBXN8dZh8NIID4Ex4Z9vkl+WEjRVUGB
	7k3cEKLivHq9dVo5uWG8H5kZZ6o2sJglvwGqhQNkYMU/EzK39jqaV2DvJCFpt/qe
	5lrqXjQNT2J8hvlPhRqOHKDZUx4syJBHUfl7KydUm1/UX5CqrfhAjTWRbIWADLZS
	LbEfGhfcXkZ3+YhAUVyB/6b1Vgz50d/wgOBVa/wKBOhUa32UsfD/dehz3v3q5dgs
	DtrL4/4E0/GcaQTgQY6eR8knnda5nXKs6FTDZ+xiYM7cMtHGdWa0F3Uco4KcFig9
	BgctlA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wahyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 23:31:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PNVSUX028214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 23:31:28 GMT
Received: from [10.48.242.80] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 16:31:27 -0700
Message-ID: <75aad8fe-f7a1-4789-9c3b-5086ddc2de9b@quicinc.com>
Date: Fri, 25 Oct 2024 16:31:26 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Which LLVM options impact function stack size?
To: Nathan Chancellor <nathan@kernel.org>
CC: <llvm@lists.linux.dev>, Kalle Valo <kvalo@kernel.org>
References: <bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com>
 <20241025223321.GA3647469@thelio-3990X>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20241025223321.GA3647469@thelio-3990X>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SIiwCxLyLcRpCj2U7xHtf4pClcmDJzOl
X-Proofpoint-GUID: SIiwCxLyLcRpCj2U7xHtf4pClcmDJzOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=888
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250182

On 10/25/2024 3:33 PM, Nathan Chancellor wrote:
> Hi Jeff,
> On Fri, Oct 25, 2024 at 02:31:47PM -0700, Jeff Johnson wrote:
>> With LLVM 18.1.7 I see:
>> drivers/net/wireless/ath/ath12k/qmi.c:3546:13: warning: stack frame size (2456) exceeds limit (1024) in 'ath12k_qmi_driver_event_work' [-Wframe-larger-than]
...
> I would expect CONFIG_UBSAN_ARRAY_BOUNDS to be the difference here. I am
> not familiar enough with LLVM internals to say why exactly this occurs
> but it has occasionally come up for some kernel code that is array
> access heavy. I think it is often a combination of inlining plus
> instrumentation that causes LLVM to be unable to reuse stack slots
> effectively. Arnd has sent workarounds for some issues like this in the
> past using 'noinline_for_stack' or rewriting code:
> 
> https://lore.kernel.org/all/?q=f:arnd@kernel.org+Wframe-larger-than

Thanks for that hint.

ath12k_qmi_driver_event_work() itself it lightweight, but it dispatches to a
few static functions. Modifying one such function:

-static int ath12k_qmi_host_cap_send(struct ath12k_base *ab)
+/* clang stack usage explodes if this is inlined */
+static noinline_for_stack
+int ath12k_qmi_host_cap_send(struct ath12k_base *ab)

Gives an noticeable improvement:
drivers/net/wireless/ath/ath12k/qmi.c:3548:13: warning: stack frame size (1720) exceeds limit (1024) in 'ath12k_qmi_driver_event_work' [-Wframe-larger-than]

Now to repeat for a few more of those...

/jeff

