Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7148A22B5AD
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240112; cv=none; b=FgzQenTAZDUn8UWls9WFsc9aq8mCuJzVhzI9y9OtLfkcFHOKPcL4Y1+Tp8n5RZSFQvbuSGLACokWyEmhRHgegQL7JO03GGktXY445kOZtAK87vaqAUdc8kaTTeKf0uLxETpTkl7G5nCNl75C3imFdKWVP4jfkbNozQH+k6vwcEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240112; c=relaxed/simple;
	bh=o3ji8ikpSHb30KCcUJOyKO/J/sk4HuPnH5JXHFOM2lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O18ApFMT+8pPl3knNlLA1YtNnuxS1G0uX/u5XgtcRZYvO8Wl8LujibRbYwKD/nK/MENvVyIV0N7hiB8NSdfGkORq45GufUMV3nnKYF5PjsCem5v/uvDbTse6BsEbmrX3T1ycgW5j+CTOBsl+Ih0E8lloKoNw2JMEDNQlz7vX1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oiPYhh5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwbDiWa7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oiPYhh5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwbDiWa7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G9oCF02287406
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=; b=oiPYhh5TaJXW7iMj
	La0ivJN3nLt9RDP5Io4FGGH2GabPKg6RntoldgOleNB4F4BRKMRIhvFFnAJII68e
	eHTZ0sdKvEp4qhMXERv6m1pQkTimzUWYB3WjF8SBhz3ZjJItsj/oPpWlk8auEq9+
	0oTZ7Gnd0Merv3A/L9NU3ZJp/6yV5Fc/1drazGTZ0Xy+j9hIIQrKXyCjAxlJk968
	x+z+33XkRUYRHessQqhJNvJ4ULxoIEC//Pfu5q3QC5fgg2X/EPwUhpuxEe0riUXd
	2dlWucvXRoDlXQ2uaSv8hSHcd0K4zuubVJDwGE9jvcgSr5Ckw6oNtVKwSwCvR4AA
	gmOSYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbfuw1vnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 11:08:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506b3baa69eso24028321cf.2
        for <llvm@lists.linux.dev>; Mon, 16 Feb 2026 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240109; x=1771844909; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=;
        b=bwbDiWa7QujWal6ohoED8TaVyWJfvGxIfUBVQQO5q+xIpAUBIL8VMAWEoueym5tEFk
         MklVKNRSMg8hhP30dit6LksLw7f6Rt7wdqmZgwM8DVxSuFRMOScnn5/C2EPbKOOBEz7c
         tVKAjVLnS0HYMxKU1561mkUNXzGIbs89zNEAhUdR6tQw2n+4WHXoWPPJ9zqlAIZ0IPNV
         yxjxFWKRjNQmN8h2hZIuFJ2Krl8A/TjExOFBUyvcMEz2rIAT+cH5VLk8w039VGmDcmnr
         gJusNs8XNMviSAIbZyDr5/fZ4fiMyTw3q5LOFbNhqDJZRYSIiGCT7/3MBxtU+1toaQIm
         m0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240109; x=1771844909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=;
        b=cdZhWsT/Kid+5Pltt6AAQ3K9oyYlnkqOZOwcBjb31L0VePLZXB3aCHEUhtxovZsZ1o
         JUjha8kO/F8Ifac/ixCaqVnA0Sz7eLab1AZO30Oo4duuwzQ3XM5qYIAjbN50myJMGjaa
         XXanhJGlTAkcepsUyuuX2IRCNbcKMbU3pl3gSSSS4vnYh8QLd9Vg3KdFkMZTD0r6fdlo
         JWYx2836OtlB00QfbimYuvlDfcJK0NFN8VSjYGqTCRI2UlZkFK5WNFgnv9T3s769+/y+
         +FqKtnASdx5SGq/AjzAYdl8YSzs4x1kQzsLDgxtnzb9Rg4VHSE9FiCJnfcC+LSl8aMJ5
         hknw==
X-Gm-Message-State: AOJu0YxEKN3eIZFvBzkvheYd+pANJbwtMvfW/XkAX0fZyXX8RbdyH6BV
	pIJ28EfvxObPhOY6frWyjGcVhVR3IvMws1mV6hzosSxW+fj1mXgMZlUR5mXtchlP8rrhgvxcohT
	zWVFXpTnchcE++NqQdW6jVBaIPUGh/4U2s62wPUnVgUlgwGlmlMVK5ACK
X-Gm-Gg: AZuq6aLQ867HuhrtiWyjBmvexrs1AVrmZZ/aO0eDRHl4W4DyfVCW1rLQG0NVXW/Q+9q
	8goUINFzdTmCRQMAmsFAhCUqibnUHT5aEZvo9zrvBMEVIVtOc7NDhExWFkfLdqOyslXklituEXb
	6yPR7zUY+K+nrY8xCPC46E5BQpj+KdM+JlGFpbc5bG1OdGEkdFiJ9frfnCEwkWtGDLlKSplle+7
	kOHYQ2M7s6ugO9/ZMxeYdk9zInawJhYDXMN7UmgBpOPvY4uDTswDo5YTSpsJGefPBh1hlEzAG3/
	QXaKcqQWKTvIbU6fskYlExNr+yxsiIg2E6kPykdZ8wKgXaIP2bEHXMBsM3xAcqa8CtPdWFAXecZ
	bJRmZ3yHODbVVUlDrGdBMj/DkCGJJZOayejSVoLPFQKh4hL8bsXlNj069FZdKwm6SHIxm5OwQ+C
	SWfYo=
X-Received: by 2002:ac8:5ccb:0:b0:506:bb3d:384c with SMTP id d75a77b69052e-506bb3d4c96mr67700791cf.10.1771240108721;
        Mon, 16 Feb 2026 03:08:28 -0800 (PST)
X-Received: by 2002:ac8:5ccb:0:b0:506:bb3d:384c with SMTP id d75a77b69052e-506bb3d4c96mr67700581cf.10.1771240108211;
        Mon, 16 Feb 2026 03:08:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e39ebsm1793360a12.18.2026.02.16.03.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:08:27 -0800 (PST)
Message-ID: <1e7adc39-8e85-4c59-a47c-7850f6c53e70@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:08:24 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
To: kernel test robot <lkp@intel.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
 <202602161009.M2K52X34-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202602161009.M2K52X34-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jb+xbEKV c=1 sm=1 tr=0 ts=6992faad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=JNKdrcoTLt_OEecmFUQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: 3v9UONB8wsEDyxoS8HGiPIXIcsImeFWK
X-Proofpoint-GUID: 3v9UONB8wsEDyxoS8HGiPIXIcsImeFWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NCBTYWx0ZWRfXwQv4FXJ4HScJ
 rzOeooRGrpdjHEhAyGkwUY5tebdR198hDN23EuYbbQBuFAJFpWXgmQxn6K8PYFvE9mHx8gtDTW7
 qkG+R6bHECXaMNsjQBGckxgcAUZiE81x9PnCXu+08i9Iozj7h0s2zb1UXUmIAxyXH527Ta3okQb
 rXDZCk79KZBrxJTtVJJW+3HCC1L+smon4bcmGXS5dV1BFaXi2o7uMM/RPFvnHxCZL+5hHWRH/wK
 EqbKOlYHiKRxdzRj99H6IcWX0v1MaQmaL+fjb83z7lZY+PNxaiyfe1FvUue8yKImgWm6V10YlGG
 Baskn4eWk2SstZCOcHBVOLTSB7lr6Z4bouaCRJutaQANEzPlONkJwmW+msc4gSdGUGXrBnoamkh
 WPQSdKHu/kSSb7rXBz5eawfTKCYdQRjSNvpbE50jNkpBr0t6g3+Nkcmh+d4VhZi+LCJRvBCbE7A
 zDYFirdZ6Zj7cXtixQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160094

On 2/16/26 3:39 AM, kernel test robot wrote:
> Hi Ekansh,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on char-misc/char-misc-testing]
> [also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.19 next-20260213]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Move-fdlist-to-invoke-context-structure/20260216-022305
> base:   char-misc/char-misc-testing
> patch link:    https://lore.kernel.org/r/20260215182136.3995111-3-ekansh.gupta%40oss.qualcomm.com
> patch subject: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
> config: hexagon-randconfig-001-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602161009.M2K52X34-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/misc/fastrpc.c:518:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      518 |         idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));


#include <linux/bitops.h>

Konrad
