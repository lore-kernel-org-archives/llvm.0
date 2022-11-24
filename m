Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC01FB6;
	Thu, 24 Nov 2022 07:54:22 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO44ISw001380;
	Thu, 24 Nov 2022 07:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=wL1Xalc3HF5GAhPLKWSSvRTDsqCoZTJ2cDjN0a9zx+I=;
 b=b0rnxcb392Tkk76lxXkD32jBD73xrDHLBivfC0BV2NcruJq+jMXPcwv367PosIhT0LD1
 gsq4MT8KRS30k0U4wahNU0UERPiNb5qChvZEDHQcrPNQN9k7B7NW68cd3iNGex43S9O+
 EgXJST6FPPrO3b8g70PgppIPR4uClRQ5OrQzF9KUiXknVMT7YQgrZHEvHn3eMXf5VjYw
 vxkZNkG8UT0tj4Azn3s/GtSgjPiLpi2ST2LyuzemcBkMcWYaO1jS/hT+udq41EYa3EoX
 zwwtQkhUFmBrxDT5NGaLbS6/+SUCaCZbNuNj7eP+6GRUT9Bl94vd2HuFYlx5k4fzUTXo lQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0ytbvwv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 07:13:23 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AO7DFbl014563;
	Thu, 24 Nov 2022 07:13:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3kxps8yqp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 07:13:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AO7DJdu30606058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Nov 2022 07:13:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFD7142041;
	Thu, 24 Nov 2022 07:13:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36C894203F;
	Thu, 24 Nov 2022 07:13:18 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
	Thu, 24 Nov 2022 07:13:18 +0000 (GMT)
Date: Thu, 24 Nov 2022 12:43:17 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>, Sasha Levin <sashal@kernel.org>
Subject: Re: [linux-stable-rc:linux-5.10.y 499/9671]
 arch/powerpc/kernel/smp.c:1380:7: error: variable 'ret' set but not used
Message-ID: <20221124071317.GA4026779@linux.vnet.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
References: <202211240721.HSkCm4aB-lkp@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <202211240721.HSkCm4aB-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MvREAVDtx2iOe3RDLor6ivO3b-rl60Nf
X-Proofpoint-GUID: MvREAVDtx2iOe3RDLor6ivO3b-rl60Nf
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_05,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211240050

* kernel test robot <lkp@intel.com> [2022-11-24 07:11:15]:

> Hi Srikar,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> head:   38866e257e18dbc209f4c355fe57123b0c2e0e4a
> commit: e91077cf1780108dc586cedf1d19f65b44fa3870 [499/9671] powerpc/smp: Update cpu_core_map on all PowerPc systems
> config: powerpc-randconfig-r002-20221121
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project af8c49dc1ec44339d915d988ffe0f38da68ca0e7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=e91077cf1780108dc586cedf1d19f65b44fa3870
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-5.10.y
>         git checkout e91077cf1780108dc586cedf1d19f65b44fa3870
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 

Thanks for your report.

1st Commit c47f892d7aa6 ("powerpc/smp: Reintroduce cpu_core_mask") 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=c47f892d7aa6
in upstream which is Commit bf6476152a0a ("powerpc/smp: Reintroduce
cpu_core_mask") in stable tree as is.

2nd Commit c1e53367dab1 ("powerpc/smp: Cache CPU to chip lookup") 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=c1e53367dab1

3rd Commit c47f892d7aa6 ("powerpc/smp: Reintroduce cpu_core_mask") 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=c47f892d7aa6
is Commit e91077cf1780("powerpc/smp: Reintroduce cpu_core_mask")  in stable
tree with some minor modifications.

However when the 3rd commit was picked, it mangled with the changes
introduced in the 2nd commit. (Since 2nd commit is not present in Stable
tree). 

Relevant hunk from commit 2 (c1e53367dab1)
@@ -1492,7 +1506,10 @@ static void add_cpu_to_masks(int cpu)
        if (has_coregroup_support())
                update_coregroup_mask(cpu, &mask);
 
-       if (chip_id == -1 || !ret) {
+       if (chip_id_lookup_table && ret)
+               chip_id = cpu_to_chip_id(cpu);
+
+       if (chip_id == -1) {
                cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
                goto out;
        }

Relevant hunks from commit 3 (c47f892d7aa6)
@@ -1544,11 +1545,6 @@ static void add_cpu_to_masks(int cpu)
        if (chip_id_lookup_table && ret)
                chip_id = cpu_to_chip_id(cpu);
 
-       if (chip_id == -1) {
-               cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
-               goto out;
-       }
-
        if (shared_caches)
                submask_fn = cpu_l2_cache_mask;


The way it was applied in Stable tree combining hunks in Commit 2 and Commit 3.

@@ -1399,11 +1400,6 @@ static void add_cpu_to_masks(int cpu)
 	if (has_coregroup_support())
 		update_coregroup_mask(cpu, &mask);
 
-	if (chip_id == -1 || !ret) {
-		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
-		goto out;
-	}
-
 	if (shared_caches)
 		submask_fn = cpu_l2_cache_mask;
 

Because of the above, we end up with this warning.

Please let me know, how do we proceed on the same.

-- 
Thanks and Regards
Srikar Dronamraju
