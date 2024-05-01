Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971C18E10;
	Wed,  1 May 2024 17:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714583191; cv=none; b=X/GIXK6lqkaAzkZShDT1urpQXQ4G/aODxc+vV7ibomqQ5R50+nZCiAEv2f5sTovj4csEmU1T4IZT9gHf/MXyv+2rpm9lN6Y0of7rgLJtYZaZvD76KHmFHtqTHxd3PJuUAFxVm+YJ3qaOUYS3KHesmuIINPWgNruohVPVPQIigbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714583191; c=relaxed/simple;
	bh=JD4E3TlDnD/zWlNnsd2hoioc4wFvnJ0sOb14GhziA78=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iLtI0nMLf/Apn65zxbG5D5raahe/Y+gwbup85y7V5g1MhYRnsEcNkjTVpGFRMTLX7UZBc0TNevQYAjwpTvxmCthuJQPd7J97cmd6WDdokhtelZ9Ge7AdaCihFSD+tOPo0hdqg9p4UhW27rcxSMskG0fcDRIMryLrf4z+OdfqB08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B2SXLdyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B2SXLdyA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 441DgKoC024525;
	Wed, 1 May 2024 17:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=LdHuB/Pttr2MzBH59IrCt2SNp2ciL/2HumnTzw4Ae0w=; b=B2
	SXLdyA4TkWy/rjgL+4Bhzcd9KKibNm7GUj03nltF+qjNH6uuIe7DLW+c0v8pONtE
	iqdy0EQWY5n/zjkK18ZGmT84XAcO29UnEme5KAH9UtQX97Qk1joSPneqyicD9Oiq
	Ncai00+dz5dDxoIDwNoxPCqdApeAE2CTYN/PL3afQRPahL95VR7j75YYI1dbulo7
	qdq/cTr0LMNsdeMU+KDfXWQinz7JzxqHDEDUexWxGwi8X4Exo4bZsOhckXow5pvp
	mYKLoQe3ejU8Vrrnqhe7gshObICyLXtCE0oN1sjbrL9yr5JSZmCjiHy5U6/7QJ86
	NrqMUo9Eu+qm+zkdjd5w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xu199341f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 May 2024 17:06:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 441H5lwi025672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 May 2024 17:05:47 GMT
Received: from [10.71.110.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 1 May 2024
 10:05:47 -0700
Message-ID: <e9209693-df0a-406c-87d7-c4437d1f9bae@quicinc.com>
Date: Wed, 1 May 2024 10:05:46 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9793/10134]
 drivers/of/of_reserved_mem.c:465:6: warning: variable 'nomap' is
 uninitialized when used here
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
        Linux Memory
 Management List <linux-mm@kvack.org>
References: <202405012148.1dCXzomq-lkp@intel.com>
From: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
In-Reply-To: <202405012148.1dCXzomq-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XzY_gQna6a8JqHHzQiijkclqX7N01GD7
X-Proofpoint-GUID: XzY_gQna6a8JqHHzQiijkclqX7N01GD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405010121


Hi Rob,

On 5/1/2024 6:45 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f68868ba718e30594165879cc3020607165b0761
> commit: 2acef04ad57cab44b33001542791fc93f81cadf1 [9793/10134] of: reserved_mem: Remove the use of phandle from the reserved_mem APIs
> config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240501/202405012148.1dCXzomq-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012148.1dCXzomq-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405012148.1dCXzomq-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from drivers/of/of_reserved_mem.c:19:
>    In file included from include/linux/mm.h:2208:
>    include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>>> drivers/of/of_reserved_mem.c:465:6: warning: variable 'nomap' is uninitialized when used here [-Wuninitialized]
>      465 |                                         nomap ? "nomap" : "map",
>          |                                         ^~~~~
>    include/linux/printk.h:530:34: note: expanded from macro 'pr_info'
>      530 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
>          |                                         ^~~~~~~~~~~
>    include/linux/printk.h:457:60: note: expanded from macro 'printk'
>      457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>          |                                                            ^~~~~~~~~~~
>    include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
>      429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>          |                                 ^~~~~~~~~~~
>    drivers/of/of_reserved_mem.c:441:13: note: initialize the variable 'nomap' to silence this warning
>      441 |                 bool nomap;
>          |                           ^
>          |                            = 0
>    2 warnings generated.
Would you like me to upload another version to fix this error?
Should just need to undo a one line change I made while I was
restructuring the code.

Regards,

Oreoluwa
