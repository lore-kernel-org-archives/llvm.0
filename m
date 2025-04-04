Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCD28F4;
	Fri,  4 Apr 2025 09:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743758728; cv=none; b=iw3d7xOVeYmq7iSWH9HGqkyah8++PQwLmnQEmAzNu72tEgkvn/VyZVp/dJ+3sqFZW542j4snGP1TulbNcUkWVNoO9ORvl3YT0SRmTpa/my5tDZrwYhJkeVm/wUycdVilOFPX56VQPix+bx2q0k2dNrOQHCDXWT8AXVbN1FX1ZsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743758728; c=relaxed/simple;
	bh=S82FIYVXxQTeUPIObIIX9CBz9xH8k+Y+dxS9y3ek140=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iksptaj7C9/IJ0+qetDwmryfA5xO63uOmymHbVtWvkD+w9ygmEMLMB2cU4BTl81sQ3NGFlzWf3LKGS7sP3ziY1Q5ShyDIasV33B32Ip3uKipGhhXdsl1EKD9yAEd+9R9BMNAtMi4+I5Ur2E2X1ptsnZMQPIWWjBaCylHyo9Xjrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aXHlhnBH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aXHlhnBH"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5341i1HC000742;
	Fri, 4 Apr 2025 09:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nAl3D6
	DoNreLZxVkM1eM7RisqvDGvIwT8MfvsLhwtLM=; b=aXHlhnBHJHhHauEW/ks741
	T+T/kZfsYEcizMAWlayDrwOMvUy1MyXzpbGr8KeNWWD1qnylwF6w28oFeq6vGsBM
	G0DD0+tuZrAvB/E+SkS4heJ8XNeP955eWXpA3hhMZ6pbJH6YcNpvavSrVqQNACM8
	jMH5SGGNeunNCMiVo5h2TEySne2q8a/UaQzq5V5VP8IRFQ61NDJV5r3mUyYUlSme
	rHOX4aIU/hi5Gz+ZuT0+kekOSjvOiNlIvx7cYc0Pj8FEwaztPzScPnbULN/0uYU/
	4nU+dz3cZjg64vQaS72L59PZveDtvBJmjxyYJs19Qz10WQTHwpj5SJnNi8rays3Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45t2qajd6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 09:25:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5346gUw1019416;
	Fri, 4 Apr 2025 09:25:23 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45t2cc2a69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 09:25:23 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5349PMwR33882732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Apr 2025 09:25:22 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 740E058061;
	Fri,  4 Apr 2025 09:25:22 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 201DC58057;
	Fri,  4 Apr 2025 09:25:21 +0000 (GMT)
Received: from [9.124.220.248] (unknown [9.124.220.248])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  4 Apr 2025 09:25:20 +0000 (GMT)
Message-ID: <8b1cc90a-5096-4f17-93d4-215611f69841@linux.ibm.com>
Date: Fri, 4 Apr 2025 14:55:18 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] mm/swap.c: Enable promotion of unmapped MGLRU page
 cache pages
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20250403141032.22743-1-donettom@linux.ibm.com>
 <202504041529.Z00E8TJC-lkp@intel.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <202504041529.Z00E8TJC-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3w93ka7dz9gWbAKgBPrFYIsl6ya-tFyS
X-Proofpoint-GUID: 3w93ka7dz9gWbAKgBPrFYIsl6ya-tFyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504040060


On 4/4/25 1:34 PM, kernel test robot wrote:
> Hi Donet,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.14 next-20250404]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/mm-swap-c-Enable-promotion-of-unmapped-MGLRU-page-cache-pages/20250403-221222
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250403141032.22743-1-donettom%40linux.ibm.com
> patch subject: [RFC PATCH v2]  mm/swap.c: Enable promotion of unmapped MGLRU page cache pages
> config: hexagon-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041529.Z00E8TJC-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041529.Z00E8TJC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504041529.Z00E8TJC-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> mm/swap.c:401:8: error: use of undeclared identifier 'sysctl_numa_balancing_mode'
>       401 |                                   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
>           |                                    ^
>>> mm/swap.c:401:37: error: use of undeclared identifier 'NUMA_BALANCING_MEMORY_TIERING'
>       401 |                                   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
>           |                                                                 ^
>>> mm/swap.c:402:8: error: use of undeclared identifier 'numa_pagecache_promotion_enabled'
>       402 |                                    numa_pagecache_promotion_enabled) {
>           |                                    ^
>>> mm/swap.c:403:5: error: call to undeclared function 'promotion_candidate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       403 |                                 promotion_candidate(folio);
>           |                                 ^
>     4 errors generated.
>
>
> vim +/sysctl_numa_balancing_mode +401 mm/swap.c
>
>     382	
>     383	static void lru_gen_inc_refs(struct folio *folio)
>     384	{
>     385		unsigned long new_flags, old_flags = READ_ONCE(folio->flags);
>     386	
>     387		if (folio_test_unevictable(folio))
>     388			return;
>     389	
>     390		/* see the comment on LRU_REFS_FLAGS */
>     391		if (!folio_test_referenced(folio)) {
>     392			set_mask_bits(&folio->flags, LRU_REFS_MASK, BIT(PG_referenced));
>     393			return;
>     394		}
>     395	
>     396		do {
>     397			if ((old_flags & LRU_REFS_MASK) == LRU_REFS_MASK) {
>     398				if (!folio_test_workingset(folio)) {
>     399					folio_set_workingset(folio);
>     400				} else if (!folio_test_isolated(folio) &&
>   > 401					  (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
>   > 402					   numa_pagecache_promotion_enabled) {
>   > 403					promotion_candidate(folio);
>     404				}
>     405				return;
>     406			}
>     407	
>     408			new_flags = old_flags + BIT(LRU_REFS_PGOFF);
>     409		} while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
>     410	}
>     411	


Thanks for the report. I will fix this and send a V3.

- Donet

