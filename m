Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D323BE;
	Sat, 24 May 2025 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748101531; cv=none; b=MN+T0VvX/ejtBQepTDVavSBXGvd8LJ+czJSOiaoS/5Mkhm259u0qUbYLOO8Zy7cR25JuNJZtcc+86h98SwsLxRXkYYQbYSsK0ZQrpqzhKRjuGM+S4WlpbYv1OXyE6nfgAsSicct0f+i0bdz9/y4R8EOeRbO+cnIocPng0SAqEfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748101531; c=relaxed/simple;
	bh=tpEhOydDN8Yu8wyX3wws22t/KqWIcLHCP1rtym1bsTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iMPL2JYn+6J8fmY8yDIGVly8+/cFY5iVeN/TLBuCCB++ny1VI/j/35zeCDLjS4BYLIHoUNAC2DXR34TM1UMjFvJXV1Ct9mkKkG8IZPcGO2jpEmBgZWuJ12mNU1eIFxJSJl0j2dJgVGE1itdBaOqcWcYTvZ6W90JnqiQ+9/2C6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dDHkj+fw; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dDHkj+fw"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O4Etkt020991;
	Sat, 24 May 2025 15:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SiFUmP
	4qb87tjrWVvEWrkcv49QTSOiIcbJ4bZomYXhg=; b=dDHkj+fwx7vz3TZZ/Zwdii
	dSMK3SI0AoZVkV/Z2uL8iJln0l5iT7dTY7TRhkZM1609jja2Vj/49VarQ8VCmn+X
	N/Qu+rNmX7BGYqOjT3I55Yd7hJuJyFSe2AKYgjkam+UI9ogceCh9hQYbQNVJHH7a
	2oVjGfzz4HuBI2KLhpgsMPTVTf7dr+MRFZ/TDq4xeax6AR8bsCRslV4i8A6epfW3
	Zya5ejRdHGVC/7ewSlw8+/NT3do2YYU1S91k3IwrkIaXo8DqV2gtOPbyNLaYNEOi
	oEzWqLIpItw3Jqm8KyXeElhgvtgDoqBqJeOikJM/f1TfiQskfQAYr3UikxPTEfTw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u3hrj35v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 May 2025 15:45:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54OEcNT6024709;
	Sat, 24 May 2025 15:45:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwkrkm5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 May 2025 15:45:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54OFjOqf54198596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 May 2025 15:45:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0583120040;
	Sat, 24 May 2025 15:45:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 398BB2004E;
	Sat, 24 May 2025 15:45:23 +0000 (GMT)
Received: from [9.39.30.28] (unknown [9.39.30.28])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 24 May 2025 15:45:22 +0000 (GMT)
Message-ID: <4ed46786-7b9c-43ef-87e7-42c4f10b07c7@linux.ibm.com>
Date: Sat, 24 May 2025 21:15:22 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] sched/core: Push current task when cpu is parked
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20250523181448.3777233-5-sshegde@linux.ibm.com>
 <202505241517.5L95fW8h-lkp@intel.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <202505241517.5L95fW8h-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=AOOMbaiN c=1 sm=1 tr=0 ts=6831e996 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=o-2g_wVk12G3IjXy7ngA:9 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: 7EpGPlVyKEgawakWUtZgxEZFppaWJuJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0MiBTYWx0ZWRfXwfDDXNMZG/qw NwjVrnxN8JtE9AtABqNQpfStpyKGRL14JqucW9/pMEOrPAm4DkuqEXM7wvU15B3E3cRIiftCwxc B6xrDPwBRD4xD+UJN/7qxPUyHkuzg46tdizkW8feRrzGtOEqjKH8KFKeojJeZPrFGsQ/5kx4eA5
 a6HLOeGVUWZUyxAOIIhRzPmTocGIzpGw3YbG9b8wgxT5+CtgQVXyRsTJ//omosy8HmkLSv9SwIw J2c6uqaTvk+EWbJPaIMB90mT5FXcSWa0GaByd1hihs1pbeh99vsxU8dJneXd4C2C6lrp3DuwkuA uRXdIR7IopUfPogEaKybcWseNUTa8kHPkWBQJb+mfA597BNffn3+dZgri+oMxip3NkzGnHi34tp
 smXB4efw8C3E6kYHMKJazWPHAUVc9DR8WhcQG7Fgc0RHVuy7X7/+6q/A2jbtRJLTI+xhPGEx
X-Proofpoint-GUID: 7EpGPlVyKEgawakWUtZgxEZFppaWJuJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240142



On 5/24/25 13:09, kernel test robot wrote:
> Hi Shrikanth,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tip/sched/core]
> [also build test ERROR on powerpc/next powerpc/fixes peterz-queue/sched/core linus/master tip/smp/core v6.15-rc7 next-20250523]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/cpumask-Introduce-cpu-parked-mask/20250524-021851
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20250523181448.3777233-5-sshegde%40linux.ibm.com
> patch subject: [RFC PATCH 4/5] sched/core: Push current task when cpu is parked
> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250524/202505241517.5L95fW8h-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241517.5L95fW8h-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505241517.5L95fW8h-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 

Thanks for the report. This is due to NR_CPUS=1. will get this fixed in v2.

>>> kernel/sched/core.c:5660:6: error: call to undeclared function 'cpu_parked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      5660 |         if (cpu_parked(cpu))
>           |             ^
>     kernel/sched/core.c:7667:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
>      7667 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
>           |                                        ^             ~~~~~~~~~~~~~~~~~~~~
>     kernel/sched/core.c:7642:1: note: array 'preempt_modes' declared here
>      7642 | const char *preempt_modes[] = {
>           | ^
>     1 warning and 1 error generated.
> 
> 
