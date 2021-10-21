Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC97072
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 06:01:23 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L5lcUr010263;
	Thu, 21 Oct 2021 02:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aKWovX9RCZxF7gaEUaT64SgK7Ys4E2hE3oPOqJSHHQk=;
 b=hr8/sCZryTCR3TLfHeGGPB1HvBzvViTJGg/s7KzoX7P2rCFxW1r7PcQQL+jrbUgoGgoM
 HJRMaFDDSRSRunw+Y1QKX+laKsaFZy6/GwhrlmK2T4V+omIfyay5zm/9RR29PC+PwTxq
 O7j34FnFudDNGJo6qF/WvjfrKrr1Jx1UU7ioeqbaRwpMA+MioaCnn2ZOL2A/m7Pe5zKl
 fKJyAxTDKEM2c858wjP2wfkHEzTz9Ho8RAOEnFx9/x9urJBKZ0dqS2w64RFaJl6hYDs3
 jUjGNz5YKh12Wh3WjkjBTLFMrZL1oykbHY4rLtIzMICf9WxVuBaxiXpHlZyowab9H+Q+ /Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3bu2cc087d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Oct 2021 02:01:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19L5w0rh001026;
	Thu, 21 Oct 2021 06:01:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3bqpcab05e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Oct 2021 06:01:18 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 19L61F7X12779890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Oct 2021 06:01:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE11EA406D;
	Thu, 21 Oct 2021 06:01:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC088A4053;
	Thu, 21 Oct 2021 06:01:14 +0000 (GMT)
Received: from [9.43.107.166] (unknown [9.43.107.166])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 21 Oct 2021 06:01:14 +0000 (GMT)
Message-ID: <2815d79c-7c0f-01df-4f61-d11aa8b2012a@linux.ibm.com>
Date: Thu, 21 Oct 2021 11:31:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 3/3] mm/mempolicy: wire up syscall
 set_mempolicy_home_node
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
References: <20211020092453.179929-3-aneesh.kumar@linux.ibm.com>
 <202110210302.HqL0ETus-lkp@intel.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <202110210302.HqL0ETus-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LnibQDBcJRpZZfJAtYC5UjUTVCYpovyl
X-Proofpoint-GUID: LnibQDBcJRpZZfJAtYC5UjUTVCYpovyl
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_01,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110210026

On 10/21/21 00:54, kernel test robot wrote:
> Hi "Aneesh,
> 
> [FYI, it's a private test report for your RFC patch.]
> [auto build test WARNING on arm64/for-next/core]
> [also build test WARNING on linus/master v5.15-rc6]
> [cannot apply to hnaz-mm/master tip/x86/asm next-20211020]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Aneesh-Kumar-K-V/mm-mempolicy-use-policy_node-helper-with-MPOL_PREFERRED_MANY/20211020-172721
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> config: arm64-randconfig-r033-20211019 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9660563950aaed54020bfdf0be07e7096a9553e4)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm64 cross compiling tool for clang build
>          # apt-get install binutils-aarch64-linux-gnu
>          # https://github.com/0day-ci/linux/commit/10f30e8157782f17ae682c2bbca95c226af3612a
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Aneesh-Kumar-K-V/mm-mempolicy-use-policy_node-helper-with-MPOL_PREFERRED_MANY/20211020-172721
>          git checkout 10f30e8157782f17ae682c2bbca95c226af3612a
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>             asmlinkage long __weak __arm64_sys_##name(const struct pt_regs *regs)   \
>                                    ^
>     <scratch space>:60:1: note: expanded from here
>     __arm64_sys_process_madvise
>     ^
>     kernel/sys_ni.c:291:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     arch/arm64/include/asm/syscall_wrapper.h:76:13: note: expanded from macro 'COND_SYSCALL'
>             asmlinkage long __weak __arm64_sys_##name(const struct pt_regs *regs)   \
>                        ^

Is this clang specific? I am not able to recreate this with gcc 10 cross 
compiling.

-aneesh
