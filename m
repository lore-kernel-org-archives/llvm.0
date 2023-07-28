Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0568B11196;
	Fri, 28 Jul 2023 10:16:47 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36SADPZh026936;
	Fri, 28 Jul 2023 10:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=V8ZuA/5uQYat0FLEsCPVTr4WyelLisEtg2FFE7Kl9Xs=;
 b=e/f1PLkQqYlhalJ2gmWyCyQbW0pe4/ejWeORmVptP+44PyZK1MuUEq3SfJsxan87qVXI
 ArqdkU3VDzSAi3MjYoGC5sAaR4uawQ0syCKKeoRfKirQAGHI8lkoL4fl5qK/DgENxxkT
 BPJnXekP4b2b7LQHXIuhgbERuRRAZCTuDpgNi3wXgh0JPT5qsAWzxSsebkzoMDb4rB8M
 DgNvrXnjo3PoaHquaRtkeiVC5Zokk6rThWBE4H5dQKioCa3czJiACeOgXhoqlJuMuyjA
 FLewl55tQ3c+wtosKtUb3PhC3It4E9on8e/6v4jgtE/TGLvvGUaWwLNL/593bxs6qBzT Qw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4bqw82mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 10:16:35 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36S9totQ002639;
	Fri, 28 Jul 2023 10:16:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0txkn0g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 10:16:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36SAGXwi59048416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jul 2023 10:16:33 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 336C220065;
	Fri, 28 Jul 2023 10:16:33 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A73720073;
	Fri, 28 Jul 2023 10:16:31 +0000 (GMT)
Received: from [9.43.12.215] (unknown [9.43.12.215])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 28 Jul 2023 10:16:31 +0000 (GMT)
Message-ID: <19c401d5-4712-a7c1-eed5-232d4a1d2258@linux.ibm.com>
Date: Fri, 28 Jul 2023 15:46:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [linux-next:master 5015/5284] arch/powerpc/mm/init_64.c:201:15:
 error: no previous prototype for function '__vmemmap_populate'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <202307281617.OxcXz84j-lkp@intel.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <202307281617.OxcXz84j-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uuE8Rj7HYpJ8iwD-AmSd62gNTugI8D5u
X-Proofpoint-ORIG-GUID: uuE8Rj7HYpJ8iwD-AmSd62gNTugI8D5u
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280092

On 7/28/23 1:59 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
> commit: 5d1acc0d9b24e48fde5297a6a40cb9c1a682d740 [5015/5284] powerpc/book3s64/radix: remove mmu_vmemmap_psize
> config: powerpc-ppc64e_defconfig (https://download.01.org/0day-ci/archive/20230728/202307281617.OxcXz84j-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281617.OxcXz84j-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307281617.OxcXz84j-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

>                                            ~~~~~~~~~~~~~~~~~~~~~^
>>> arch/powerpc/mm/init_64.c:201:15: error: no previous prototype for function '__vmemmap_populate' [-Werror,-Wmissing-prototypes]
>    int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
>                  ^
>    arch/powerpc/mm/init_64.c:201:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    int __meminit __vmemmap_populate(unsigned long start, unsigned long end, int node,
>    ^
>    static 
>    13 errors generated.

Thanks for the report. I also identified missing `static` in __vmemmap_free. I will send a fixup patch to the original patch.

-aneesh
