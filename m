Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620368;
	b=eTxLfKh49Wk7Sjqg0DDWYxRxnM6fAE5pyWApz9G8ORH8L5zAfKKv7teY6apgFKywi+OX
	 3XMa38d8LDrpR/GGPu6T3hQ53DFTgubTBhM3gnlhUQboip6raVoy1ji5WcgBuejl+ptwS
	 /8x4OrMKT5n3UmhQBtjrzNU304T4YXmMTzelERbKCxjXddmzzD5e9u5ouNYUWfN1XgOCf
	 YIymHapBx9qOlGVE0GCnXmKEbxoASzM4TFV452cDbk8zdX1VX1bqkbIIdJ1RYYEgbM8pf
	 59OLv7AHVRnPNWbG9lNBk1jWAW2E+KuHOepibXhT/LlktVuLcNAP0T8xPT2kfAhWtiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620368;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
	b=yNmeRCWx8G7Nb9/1CL6CkOH2lrxqHWqNQ+D7rBS7nOwsYEQnPKkZn0EoeOvovHECxyEx
	 w9INQafradCha6vc+KWuVfAff+5Z1QloNWOudqROAq/8NTDUgfRycoMO95Au70jlDoCTb
	 X3nFckgClCNr90kCp4Z4z+4c00XJyz651pAyIuqx4TKtPJnYC+LUVBvX1g8FSulmxpQ8x
	 q7aNs2i8247zF2R0XySmWib7f38vVg36zf9GLiCW0TinXk1zxVZQEP8Drt0kXiE0adeX0
	 5ZxjooG6KbPVa7zhEZBpLGo4pV7gxfHCJOgZiyclQ1cuTWDdYzWu4XBUn75fkGcz1eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZK8uRJta;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guN2Yhqv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D0606A336
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 11:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815D0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZK8uRJta;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guN2Yhqv
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4MxC2616194
	for <llvm@lists.linux.dev>; Mon, 2 Nov 2026 11:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=; b=ZK8uRJtah+ubMnvj
	orvcU7wwTQKwfVht408Kwkf3kDGd5XxojLTa3Bvs2SeMGciAjtT77smbZM8fNNSp
	cwIn6/Qi89iHaffUh8EXJArcDIO6+pngczv7Oz71xEe0ThyiATeIrGRT9blXeTcn
	b8MhroVQx1gaqwibC6tCq1grkPKBprx6cGel+dDW8c4CE1UaUc3a0Yl0vBeBaj/U
	GyOkv8y3Pmz4k2w17HDHQOPAOxt+6GCANZ1elT/8tf3Q9zXv3YJjzM7M16T1ssjI
	0xMrDoPB7vOlWDh44KhtPdcF+PFjyyF3XUoqrWsYGqAY+FZ55kuQcC/CqS082Y2W
	AThmWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavg59g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 11:52:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so54898885a.1
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 03:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620365; x=1794225165; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
        b=guN2Yhqvq9gZLDBJZoHMCK/jlZUp90CqcU6+FhRAr3VQZZhGhSeFbVnmzTea/4gf2w
         V/iw1A+U0lJR79dyKDjo3p/16KjvrfieWuPkn+6H4CooRaxf93NAF3JJj6KsTSQk0PBI
         /aQzivq/9b/6AKpXsTSAIF89rJ2pPJiJQT63m9+53h0ixY4/7Q0W9po3b0HcbZA05A7Q
         89t1rPu/5ohZ54ITsGe8GKzoVCdh0kQ8cnBLjqJOM39zfooOjZeWbQ6g3a/6CQZkDQz6
         LBNENR6Bm6iqC/ccaQ0a3LgsHJ+COKsCjqC5/zAeZhVNjAUpUq2Iu8KLFMLhNwE4nH0z
         1J3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620365; x=1794225165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4TWMT31f/lhSF0WZOCkUp8azX4lSUxZCkskOlZFhzE=;
        b=0EZrDiWUsQce6zcQZrVcRFUOBpbSgQ8gNJDkpFlcJ44UFBq6hgTVkIhmHCtonqVqX4
         JgxIqNiewaye/006OobtNQVbP7iTxc/c7ksard8MtwOJH5Rlo+T+bg8dneXpuIxCdog5
         bLL7CwCa+oRxK/0Tttn+ma/OVb9Y8Oa03iEt/28O3JPNQEcRlOJBNXHGM32+LHG5v5OE
         sGSJkXZBQme0hPxSQ4eGG00tzfbh02MH3fYttnrFQeLdDpRNDBRUGs+v0V8Cm0Vro2TT
         kxEP4T6DafGyfP961GmN+dfcgv6Z9DGmL5SJKBPXp2fcdQ7ZBql+2g/WyeAmxTZx0xS1
         OBPA==
X-Gm-Message-State: AFq9FYLC4TfzsQJi+2lN4zAb8q10I//uSI8bwQgZmnXOMcLRkdyVArfb
	6bqG0/VIWNSswOPCa1FYt/i1D8j+wP/dH2fH4nosMh5MyAuutXnRkgzBViFtI1k2Q5uud0lmO/G
	DdVfMSNvGKRarrB4kMtZHagR8cEq/e28M7Ud470/iyQ409GFVoNaA1Uov
X-Gm-Gg: AYBFou1ngxdY9OwgOP5P8LDlPK7RiVuqpKx7A7YVO5PIA1MA+IVI/BKCNebFdz9z5fP
	tc9eotUzVlmF4AneJBlgnc6SJBq32ZDRUoMXDUwWi+WdcNnV88uaAh65MN8Z6YgrsqBxUO/39jY
	8pLCdhyJmpbeh4MXMugq0FvEV2sH2nxXZom17wPGT/uoA760SJ9B/KzYpEval0pHh4yvlu7OQDN
	XCZrjMyxq5719QwuMhu8h2CiMgN6o1WV9vOrBB8cm1EZ8jJ/Knu9xOsC4QloBwGBOsBhy/b/0ZD
	EC4i4br/148DUQDHrOYdRMpJtfG+7ytgLCNgk6zxD3uN4X5W+0V98IZo4PAp4+LSiSYTsYhvrSO
	Snox6oAhEDtqepv/a8Uj6OElVtVfOl66w9nG7sNlah0K4dQHKc5NQ/06PljKawHwY16YW2fk=
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1759799885a.3.1793620365679;
        Mon, 02 Nov 2026 03:52:45 -0800 (PST)
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1759796085a.3.1793620365012;
        Mon, 02 Nov 2026 03:52:45 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe8f9bbsm380330766b.67.2026.11.02.03.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:52:43 -0800 (PST)
Message-ID: <4a145c2f-24d3-48d2-8e84-3098604bcac4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:52:41 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
To: kernel test robot <lkp@intel.com>, Konrad Dybcio
 <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261022-topic-pdc_map_espi-v1-1-7c481a42bac5@oss.qualcomm.com>
 <202610270827.7SxHabHO-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202610270827.7SxHabHO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX05T18SJ8Kkig
 kP/yBFkZ7+5pusRxD9GVuVNsVC8TTn8MNvx3W6kpq3n0VMMk735k6o6LMm5KAR1y1Z2MKr99y+l
 WQ463b6uYhhk97Vp8gUmBjXDjt3FPXmJeALDZxd348YsLpHx4Mvq71kPB5m72Qkbrm9M4sfKXLo
 d00o0Y2bd1VsQlhKycrhBBJGQv7mNsAO82NHl3fY1VK+5bubJu1Jv7vigD/bm+P+mcCNqSxLXkn
 esdjaP6hrAVUfIyxzatg3ubmqEeG1ZrAqPRENhcFVdFHhgV1nXZk+40vTip2LEMfmLe9ZLNNQH8
 3MP2mKkr+LqxjCtlWQMMF4vdCHOKpFypr0jECP+RprIZoHiu2A9kx8Wfqs0qXudW8Dj50xrD1iM
 cz3qyylCZ3qGB2LreO5nAvnRoGHiY8UXMwP766+2VbQ40eY6Dg+ZuwrTJ+bZP6eGFh1MJQ3rUgS
 n67TuvoAQBUTofCfnJQ==
X-Proofpoint-GUID: QvysSSTnod9Phys41N57wqhqehO5hpXM
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8798e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=bDLz5rJQdqquShatwagA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX7ZilrMR6+T4x
 HHYulhmw1O8TOjRWpPucEq9/l8HbMyF5hh5l6ONs81FfT73WAjW/asz4QU2WThuDMBCqKxT7HRA
 gd9LbYWSVK3/SMgxlJq34VxzMhbVolA=
X-Proofpoint-ORIG-GUID: QvysSSTnod9Phys41N57wqhqehO5hpXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 10/27/26 2:08 AM, kernel test robot wrote:
> Hi Konrad,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/irqchip-qcom-pdc-Handle-ESPIs-in-qcom-pdc-ranges/20261022-104402
> base:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> patch link:    https://lore.kernel.org/r/20261022-topic-pdc_map_espi-v1-1-7c481a42bac5%40oss.qualcomm.com
> patch subject: [PATCH] irqchip/qcom-pdc: Handle ESPIs in qcom,pdc-ranges
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261027/202610270827.7SxHabHO-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270827.7SxHabHO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610270827.7SxHabHO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/irqchip/qcom-pdc.c:12:
>>> include/linux/irqchip/arm-gic-v3.h:605:10: fatal error: 'asm/arch_gicv3.h' file not found
>      605 | #include <asm/arch_gicv3.h>
>          |          ^~~~~~~~~~~~~~~~~~

Marc, would you prefer that this is resolved by:

* redefining the number in this driver
* using the raw number, perhaps with a comment
* making this only buildable and COMPILE_TEST-able on arm/64?

I think 2 is reasonable

Konrad
