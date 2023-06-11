Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83FA2900;
	Sun, 11 Jun 2023 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686490916; x=1718026916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ng9I8hh+x0QEQpFiywpRHKk00kbNcjZx+0//QSlGe14=;
  b=hmBvMD5YQAjUMWTDiZYMIfOL4naJujUleZ+dNTDB0oqFGiTSUtGGOMZc
   WMVSrPhfhGC+f8WQLGJ2pCzWNkyRMyc2UMDrUso1UHIKpm5i8PcUUU3S1
   3l2KSfK+JV0VjVdtx3TgxUjpKlS280Wuv7OWlQfPewKsUXpW6BDjUfZeg
   NkJjEf4hUFDfC305Hb7tmHyEf/PD0jLtKB5RZfYZpPYvLyeohz75pMd4T
   Q62mYF/qbXjaiK3Ph52V6F6dDeNNOLTIMHqKcMWwT+2e8/lBrJnOswucU
   r+XUO40SjM7utwm4lJzmtMW1AQTAlx9KsXRhUF5ZBm76UNf62f7kZamEm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="444230579"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="xz'341?scan'341,208,341";a="444230579"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 06:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="780874771"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="xz'341?scan'341,208,341";a="780874771"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jun 2023 06:41:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 06:41:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 11 Jun 2023 06:41:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 11 Jun 2023 06:41:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 11 Jun 2023 06:41:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3eyGqR09MPRDnw090UF+Mq/1N3VjamUxTH0h01NVNlzqUk6MWhA8MZAFzj9JFh7ez0afu4VeXV1w54haIwuyeLmO2BhO6G5nmWv+kPoiT9eo359A8wcRFz4qMY39Roveor5CI28iwBH+MZ6e9eb/0D3+AazpyoBDaAxZCYtSCDUscCIlSY9QeZTn83rnmNazKC1R/lLXA0U+7aEFj+qoItQjuSB4IoUygTanIx7H8J6Up8wg+F4Zdzg8Jm1frVzmpcu9NyO7hlMXjZ6C2fRn1QwM3Jxv6apkIuclcTeuXBdxir35jlG6qzi7ri9VuqOmR87bhauzh18g7qF2C1q7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBpGkrb6oTbHivunIVfw5wKKenB0kgOw0YnUdQ+5UBs=;
 b=YkX+GAs6cPo1v9vKSJPH3utmW7uade8Mxhy7VveRJDoXsDJTYL0gyDXGI27BDm3Z1ibbHIM/L1yYTNqc2h9HpJaT3ITSq1e8ic3lo+5BG/deY0nJDa1IKGoC41ewiePbVs1flRALQzJOR864zEF4SkvMw3am8iuDTi8vULZCPKUO4b6SoU2Sn+t03NefUBF9OUv+1ZsNcK8tAKOeqmr9wIds8qe+6I5vITjOR97ateic9EqZQ55u3SPs06puzjj0gCQbErZZFjzlca8e7SCDgug8cVIWojddHwgVZsnNltsJdw6KrhVRpyby8ZyLVJ+Emk1nFkZEQRzkKCY+2dtzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Sun, 11 Jun
 2023 13:41:42 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::35cf:8518:48ea:b10a%6]) with mapi id 15.20.6455.028; Sun, 11 Jun 2023
 13:41:42 +0000
Date: Sun, 11 Jun 2023 21:41:30 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kees Cook <keescook@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Masahiro Yamada <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, <linux-kbuild@vger.kernel.org>,
	<llvm@lists.linux.dev>, <oliver.sang@intel.com>
Subject: [linux-next:master] [kbuild]  df8fc4e934:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202306102333.8f5a7443-oliver.sang@intel.com>
Content-Type: multipart/mixed; boundary="NfprJpJ10GW0wZHM"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|PH7PR11MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4837cb-e75e-43d4-eaec-08db6a81968f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZbaI5qoPDgvt7xXBnYzU77DXpADsXDsTLhbU/Bp9tXdOfe+A4vV645q7s7Rkx1HFUnwWlGBuN0vFI1E1FUCg64Q9fk9Zh3NHR3xptCBJE97UhzDEmjTfpuXEGWL9J31BuLDDjiFwEIy/JuaiqiYNe20rpIjSJn9h5zYtLZ9+KglklNZSzBieiDcBvLrlmgAkp6M//0JqwPChP/vlhxMIrmL2rS3QYuquomOJN6WYI5msPZKAO3hO27hzxntQTFKa1AsMCkJWVSBMTW1xqCj4ZgWmLXSW9httB0W03wQpXUH6SdTKq8RuiaondZqAaSa4MBVaehpD3/CtpId4FXH/ycPJLIfYvRjp2w81JkLXiE3JWwrFlcqOdxZ4u0VHbiMuAD9+2TGUlpOnjTxWN7rISRvz357GMdqkSLRbic2CGbcgDtQjLQLo4c9GKzeFEUNMYk9gbAnCIZxJqoYa3kNg8pjgDfk63ySSYom12SyL9kM7Bj8NRzGtUG0d7ggjyD2gPEFEFEY7E6bzhGIFTbo2pd/k9cNOYMhwJiix80wSYBwN55kAfKHkLgoyS3mz+N/TNQ8c001aPgCXDCDhUrDPNYipxTxj1zw4HBvEE/FQ8XAq/eZIH0eX/pAkUKKTmaQRogxVfl81YSmQtyRL/3okA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6779.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(8676002)(107886003)(8936002)(478600001)(54906003)(966005)(1076003)(6666004)(44144004)(235185007)(316002)(5660300002)(41300700001)(6486002)(26005)(7416002)(4326008)(6506007)(6916009)(66476007)(66946007)(6512007)(66556008)(2616005)(186003)(83380400001)(2906002)(82960400001)(38100700002)(86362001)(36756003)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jAGYmQ82R213rzJc6XIvaaYCsRg38aB1xZU62viqh25zNiipX/YzP6BCoslq?=
 =?us-ascii?Q?SI0AkDHKDdeRmqHUzZR/P+5QqsrclbYZeccdRJLuXtXtELNnj5PJ6c44hLSE?=
 =?us-ascii?Q?TiOt6j3CfeSDOxv2GNo0Y364l9CZKDdbZ8nCe+FmKXhEgGmY0oD6J+HyEwui?=
 =?us-ascii?Q?yXObJAQQU6gTX9dj1fJrcEi6+iuaz0ChTH/FLDoW3sPiB0MmJ/3Lh4/0/Kba?=
 =?us-ascii?Q?xSn2qbiXO0pmqz3CuzXmusn3e11JHjUv9LMVmnMEPsm0azewKvgOvkc7KED7?=
 =?us-ascii?Q?Y+Bxrrtjv4Nt3+3vpiNkIovDQKzC9Y/NIemAi9KzYOm063RBtD19nZnlzvrF?=
 =?us-ascii?Q?1ZDftm+FOq1R/+Kl3dZPEr9Tx2Bl5zr4yhRxxqwaWOYpipiLaBWGxGQlgh+m?=
 =?us-ascii?Q?JcvhcpDGcw3IboSoy+u6UHSnKwCbCfrsYhzkHDV1d01yCrJmoCfJU8Fjy4s9?=
 =?us-ascii?Q?9G9BHTZksMa+sSScHCn5+bSRChW/W5Za8MUAU1JLbDG2LbdALDx3E9JfiHq8?=
 =?us-ascii?Q?F9R9VDP6UBa2bwBqXBHQwHcqsUNe97v+8rwXuDKm1mb2C74/9NQU7zMOk8M8?=
 =?us-ascii?Q?7xcCWS/6L2+78701nerqNAKaaZJM0keIa6HZHC8U4EI8mJ4Bi2gF7idAmTp3?=
 =?us-ascii?Q?ZsFMHQefLL+J/aP7ZmtLlqVPt4ndhjdGXkWxup79nck5hTa47R3QfAfz1xS2?=
 =?us-ascii?Q?t+cENYdgNYaFfdWutXQei0bhc+EPe3LLvOv8pYreeO7UH/4sheGgcvf7qe/A?=
 =?us-ascii?Q?VoPIBmbo7YyV3wmHWEVERRBMByvFIN++bAxq3UnuFYZ3OkR4qcC8zuERBnsn?=
 =?us-ascii?Q?u6EwrVsFkDnAWrV2gI0Rh+g7Pd7DiXuwHR+khOLlCSscgeL3u7DprgS4vsIu?=
 =?us-ascii?Q?stZpdOF7bfDNEI0GZJgulfIpKFcViIDMeY3hhFWkmIfWRVrce3W0ks1pIiqE?=
 =?us-ascii?Q?prMBKd10rSabH5JWgxzCVLAYAqlkknI2WGU+cXRiqBVWA8YxQAHHJJiNTLpk?=
 =?us-ascii?Q?INbPlQA65GU9S3d0U/XwFlt/F15jAEzE/xEJlVOwTIbTvUDz63nKCbqVAg61?=
 =?us-ascii?Q?LJDTk6np3Q5i6VNaHHVCgKejAaoSUTwJmyvEynG0bESXErIEOyoDU1l4e7EK?=
 =?us-ascii?Q?KcQk/vlBQP7tGlpkCL4DrxdSdoeTcbkA4auiDOZE5aOApd+/s/JVeHHPche8?=
 =?us-ascii?Q?Qi9zkH2C4OqWfvjElmp83egGhIzuWo32AXsEbWnvEZ/qh2XCRWxBygvslvhe?=
 =?us-ascii?Q?IOegBUok5FuApA4Bc2FPrAAk1lWGs2aAeem45w049MUyJtLxzNGz1+MLtz1k?=
 =?us-ascii?Q?GWlb/lY0rGdXC8EoMOQZA/w4WggntvgcVw51D8kdLvHtarZG88naC+naf5nh?=
 =?us-ascii?Q?KPsynLEzsywKj+U9l8utFc8wGdQk369RzwUeUb8g1fqw0tAhBJEuM38KF7PV?=
 =?us-ascii?Q?Zxsut0yeFXqxCYWo2m3KnZ9FVbaVFeorza7sKo0THTQyhbwRNc5RkPb2Uomz?=
 =?us-ascii?Q?iEsUWCX+IUSufAhzVFO5jvGeUQT1Xx3f/HU8GFfkzd7T65erEKZIZHFmeXQE?=
 =?us-ascii?Q?gUuF/TsnymqKp+FSt7lm3U37N/XY7nxHbSQ9hGGq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4837cb-e75e-43d4-eaec-08db6a81968f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2023 13:41:42.1403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XikBYE+PhuHbBvpM7nU/6C/Zv2pHWbX106+dkMSSn11iKkO5RWDuHg9UeSFSZcU4tZuBF8H68UAh01uwViZvOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8033
X-OriginatorOrg: intel.com

--NfprJpJ10GW0wZHM
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


hi Kees Cook,

the issue we found below is by clang-15, but we confirmed clang-15 we use is
commit 8dfdcc7b7b in llvm-project. it supports the flag already.

llvm-project$ git show 8dfdcc7b7b:clang/docs/ReleaseNotes.rst | grep -C5 flex-array

  .. note::

      Randomizing structure layout is a C-only feature.

- Clang now supports the ``-fstrict-flex-arrays=<arg>`` option to control which
  array bounds lead to flexible array members. The option yields more accurate
  ``__builtin_object_size`` and ``__builtin_dynamic_object_size`` results in
  most cases but may be overly conservative for some legacy code.
- Experimental support for HLSL has been added. The implementation is
  incomplete and highly experimental. For more information about the ongoing


at the same time, we also tried to run same tests upon clang-16, but we didn't
observe similar issues.

we are not sure if it's a compiler issue, so Cc llvm@lists.linux.dev, too.


Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 ("kbuild: Enable -fstrict-flex-arrays=3")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master abbd8bb42915d9ed06df11b430bf4ecb3d8ac5ad]

in testcase: boot

compiler: clang-15
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202306102333.8f5a7443-oliver.sang@intel.com


[  228.605608][    C1] BUG: unable to handle page fault for address: 04090300
[  228.606532][    C1] #PF: supervisor read access in kernel mode
[  228.607325][    C1] #PF: error_code(0x0000) - not-present page
[  228.608100][    C1] *pde = 00000000
[  228.608262][    C1] Oops: 0000 [#1] PREEMPT SMP
[  228.608262][    C1] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W          6.4.0-rc2-00010-gdf8fc4e934c1 #1
[ 228.608262][ C1] EIP: string (lib/vsprintf.c:644 lib/vsprintf.c:726) 
[ 228.608262][ C1] Code: 73 43 89 c1 8b 44 24 10 89 04 24 89 5c 24 04 c1 fb 10 0f 84 a7 00 00 00 31 c0 89 ce eb 09 40 39 c3 0f 84 9e 00 00 00 8d 0c 07 <0f> b6 14 06 84 d2 0f 84 95 00 00 00 3b 4c 24 0c 73 e2 88 11 eb de
All code
========
   0:	73 43                	jae    0x45
   2:	89 c1                	mov    %eax,%ecx
   4:	8b 44 24 10          	mov    0x10(%rsp),%eax
   8:	89 04 24             	mov    %eax,(%rsp)
   b:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   f:	c1 fb 10             	sar    $0x10,%ebx
  12:	0f 84 a7 00 00 00    	je     0xbf
  18:	31 c0                	xor    %eax,%eax
  1a:	89 ce                	mov    %ecx,%esi
  1c:	eb 09                	jmp    0x27
  1e:	40 39 c3             	rex cmp %eax,%ebx
  21:	0f 84 9e 00 00 00    	je     0xc5
  27:	8d 0c 07             	lea    (%rdi,%rax,1),%ecx
  2a:*	0f b6 14 06          	movzbl (%rsi,%rax,1),%edx		<-- trapping instruction
  2e:	84 d2                	test   %dl,%dl
  30:	0f 84 95 00 00 00    	je     0xcb
  36:	3b 4c 24 0c          	cmp    0xc(%rsp),%ecx
  3a:	73 e2                	jae    0x1e
  3c:	88 11                	mov    %dl,(%rcx)
  3e:	eb de                	jmp    0x1e

Code starting with the faulting instruction
===========================================
   0:	0f b6 14 06          	movzbl (%rsi,%rax,1),%edx
   4:	84 d2                	test   %dl,%dl
   6:	0f 84 95 00 00 00    	je     0xa1
   c:	3b 4c 24 0c          	cmp    0xc(%rsp),%ecx
  10:	73 e2                	jae    0xfffffffffffffff4
  12:	88 11                	mov    %dl,(%rcx)
  14:	eb de                	jmp    0xfffffffffffffff4
[  228.608262][    C1] EAX: 00000000 EBX: ffffffff ECX: b4eb1d1e EDX: 00000000
[  228.608262][    C1] ESI: 04090300 EDI: b4eb1d1e EBP: b4eb1ca4 ESP: b4eb1c80
[  228.608262][    C1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00210046
[  228.608262][    C1] CR0: 80050033 CR2: 04090300 CR3: 03967000 CR4: 00040690
[  228.608262][    C1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  228.608262][    C1] DR6: fffe0ff0 DR7: 00000400
[  228.608262][    C1] Call Trace:
[  228.608262][    C1]  <SOFTIRQ>
[ 228.608262][ C1] vsnprintf (lib/vsprintf.c:2817) 
[ 228.608262][ C1] vprintk_store (kernel/printk/printk.c:2191) 
[ 228.608262][ C1] vprintk_emit (kernel/printk/printk.c:2288) 
[ 228.608262][ C1] vprintk_default (kernel/printk/printk.c:2318) 
[ 228.608262][ C1] vprintk (kernel/printk/printk_safe.c:50) 
[ 228.608262][ C1] _printk (kernel/printk/printk.c:2331) 
[ 228.608262][ C1] __ubsan_handle_out_of_bounds (lib/ubsan.c:209 lib/ubsan.c:343) 
[ 228.608262][ C1] get_string (drivers/usb/gadget/composite.c:1314) 
[ 228.608262][ C1] composite_setup (drivers/usb/gadget/composite.c:1871) 
[ 228.608262][ C1] dummy_timer (drivers/usb/gadget/udc/dummy_hcd.c:?) 
[ 228.608262][ C1] ? check_preemption_disabled (lib/smp_processor_id.c:16) 
[ 228.608262][ C1] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 228.608262][ C1] ? check_preemption_disabled (lib/smp_processor_id.c:16) 
[ 228.608262][ C1] ? rcu_is_watching (kernel/rcu/tree.c:696) 
[ 228.608262][ C1] call_timer_fn (include/linux/jump_label.h:270 include/trace/events/timer.h:127 kernel/time/timer.c:1701) 
[ 228.608262][ C1] ? dummy_free_streams (drivers/usb/gadget/udc/dummy_hcd.c:1782) 
[ 228.608262][ C1] run_timer_softirq (kernel/time/timer.c:1751 kernel/time/timer.c:2022 kernel/time/timer.c:2035) 
[ 228.608262][ C1] __do_softirq (include/linux/jump_label.h:270 include/trace/events/irq.h:142 kernel/softirq.c:572) 
[ 228.608262][ C1] ? __lock_text_end (kernel/softirq.c:529) 
[ 228.608262][ C1] do_softirq_own_stack (arch/x86/kernel/irq_32.c:57 arch/x86/kernel/irq_32.c:147) 
[  228.608262][    C1]  </SOFTIRQ>
[ 228.608262][ C1] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1106) 
[ 228.608262][ C1] __irq_exit_rcu (kernel/softirq.c:653) 
[ 228.608262][ C1] irq_exit_rcu (kernel/softirq.c:664) 
[ 228.608262][ C1] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1106) 
[ 228.608262][ C1] ? do_idle (kernel/sched/idle.c:? kernel/sched/idle.c:282) 
[ 228.608262][ C1] handle_exception (init_task.c:?) 
[ 228.608262][ C1] EIP: default_idle (arch/x86/include/asm/irqflags.h:37 arch/x86/include/asm/irqflags.h:72 arch/x86/kernel/process.c:711) 
[ 228.608262][ C1] Code: 2a ff 83 c4 08 eb d3 00 00 cc cc 00 00 cc cc 00 00 cc cc 00 00 55 89 e5 83 3d c0 e8 96 b3 00 7e 07 0f 00 2d a4 02 36 b2 fb f4 <fa> 5d c3 90 90 90 90 90 90 90 90 55 89 e5 e8 78 04 01 00 5d c3 90
All code
========
   0:	2a ff                	sub    %bh,%bh
   2:	83 c4 08             	add    $0x8,%esp
   5:	eb d3                	jmp    0xffffffffffffffda
   7:	00 00                	add    %al,(%rax)
   9:	cc                   	int3   
   a:	cc                   	int3   
   b:	00 00                	add    %al,(%rax)
   d:	cc                   	int3   
   e:	cc                   	int3   
   f:	00 00                	add    %al,(%rax)
  11:	cc                   	int3   
  12:	cc                   	int3   
  13:	00 00                	add    %al,(%rax)
  15:	55                   	push   %rbp
  16:	89 e5                	mov    %esp,%ebp
  18:	83 3d c0 e8 96 b3 00 	cmpl   $0x0,-0x4c691740(%rip)        # 0xffffffffb396e8df
  1f:	7e 07                	jle    0x28
  21:	0f 00 2d a4 02 36 b2 	verw   -0x4dc9fd5c(%rip)        # 0xffffffffb23602cc
  28:	fb                   	sti    
  29:	f4                   	hlt    
  2a:*	fa                   	cli    		<-- trapping instruction
  2b:	5d                   	pop    %rbp
  2c:	c3                   	retq   
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	55                   	push   %rbp
  36:	89 e5                	mov    %esp,%ebp
  38:	e8 78 04 01 00       	callq  0x104b5
  3d:	5d                   	pop    %rbp
  3e:	c3                   	retq   
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	fa                   	cli    
   1:	5d                   	pop    %rbp
   2:	c3                   	retq   
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	55                   	push   %rbp
   c:	89 e5                	mov    %esp,%ebp
   e:	e8 78 04 01 00       	callq  0x1048b
  13:	5d                   	pop    %rbp
  14:	c3                   	retq   
  15:	90                   	nop


To reproduce:

        # build kernel
	cd linux
	cp config-6.4.0-rc2-00010-gdf8fc4e934c1 .config
	make HOSTCC=clang-15 CC=clang-15 ARCH=i386 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=clang-15 CC=clang-15 ARCH=i386 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

        # if come across any failure that blocks the test,
        # please remove ~/.lkp and /lkp dir to run from a clean state.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



--NfprJpJ10GW0wZHM
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="config-6.4.0-rc2-00010-gdf8fc4e934c1"

#
# Automatically generated file; DO NOT EDIT.
# Linux/i386 6.4.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=150007
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=150007
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=150007
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=125
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
CONFIG_USERMODE_DRIVER=y
# CONFIG_BPF_PRELOAD is not set
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y
CONFIG_PREEMPT_DYNAMIC=y
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_BOOST is not set
# CONFIG_RCU_NOCB_CPU is not set
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC11_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_SCHED_MM_CID=y
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
CONFIG_CGROUP_MISC=y
CONFIG_CGROUP_DEBUG=y
# CONFIG_NAMESPACES is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_FORCE is not set
# CONFIG_BOOT_CONFIG_EMBED is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_ELF_CORE is not set
# CONFIG_PCSPKR_PLATFORM is not set
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_X86_32=y
CONFIG_FORCE_DYNAMIC_FTRACE=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf32-i386"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_X86_32_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=2
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_MPPARSE=y
CONFIG_GOLDFISH=y
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_BIGSMP=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
# CONFIG_IOSF_MBI is not set
CONFIG_X86_32_IRIS=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
# CONFIG_PARAVIRT_SPINLOCKS is not set
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_M486SX is not set
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
CONFIG_M586MMX=y
# CONFIG_M686 is not set
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
# CONFIG_MPENTIUMM is not set
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MELAN is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MGEODE_LX is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_MVIAC7 is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_INTERNODE_CACHE_SHIFT=5
CONFIG_X86_L1_CACHE_SHIFT=5
CONFIG_X86_F00F_BUG=y
CONFIG_X86_ALIGNMENT_16=y
CONFIG_X86_INTEL_USERCOPY=y
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_MINIMUM_CPU_FAMILY=5
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_CYRIX_32 is not set
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
CONFIG_CPU_SUP_TRANSMETA_32=y
CONFIG_CPU_SUP_UMC_32=y
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_CPU_SUP_VORTEX_32=y
CONFIG_HPET_TIMER=y
# CONFIG_DMI is not set
CONFIG_BOOT_VESA_SUPPORT=y
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=64
CONFIG_NR_CPUS_DEFAULT=32
CONFIG_NR_CPUS=32
# CONFIG_SCHED_CLUSTER is not set
CONFIG_SCHED_SMT=y
# CONFIG_SCHED_MC is not set
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
# CONFIG_X86_MCE is not set

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# end of Performance monitoring

CONFIG_X86_LEGACY_VM86=y
CONFIG_VM86=y
# CONFIG_X86_16BIT is not set
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_TOSHIBA is not set
# CONFIG_X86_REBOOTFIXUPS is not set
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_LATE_LOADING=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=y
# CONFIG_VMSPLIT_3G is not set
CONFIG_VMSPLIT_3G_OPT=y
# CONFIG_VMSPLIT_2G is not set
# CONFIG_VMSPLIT_2G_OPT is not set
# CONFIG_VMSPLIT_1G is not set
CONFIG_PAGE_OFFSET=0xB0000000
CONFIG_HIGHMEM=y
CONFIG_X86_CPA_STATISTICS=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ILLEGAL_POINTER_VALUE=0
CONFIG_HIGHPTE=y
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
# CONFIG_MTRR is not set
# CONFIG_X86_UMIP is not set
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_INTEL_TSX_MODE_OFF is not set
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
CONFIG_X86_INTEL_TSX_MODE_AUTO=y
# CONFIG_EFI is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_KEXEC=y
CONFIG_CRASH_DUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
CONFIG_DEBUG_HOTPLUG_CPU0=y
CONFIG_COMPAT_VDSO=y
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_STRICT_SIGALTSTACK_SIZE=y
# end of Processor type and features

CONFIG_CC_HAS_SLS=y
CONFIG_CC_HAS_RETURN_THUNK=y
CONFIG_CC_HAS_ENTRY_PADDING=y
CONFIG_FUNCTION_PADDING_CFI=11
CONFIG_FUNCTION_PADDING_BYTES=16
# CONFIG_SPECULATION_MITIGATIONS is not set
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
CONFIG_PM_USERSPACE_AUTOSLEEP=y
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
CONFIG_ACPI_DEBUGGER_USER=y
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=y
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
# CONFIG_ACPI_FAN is not set
CONFIG_ACPI_TAD=y
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_HOTPLUG_CPU=y
# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_PLATFORM_PROFILE=y
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
CONFIG_ACPI_HED=y
CONFIG_ACPI_CUSTOM_METHOD=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_ACPI_FFH=y
CONFIG_PMIC_OPREGION=y
CONFIG_BYTCRC_PMIC_OPREGION=y
CONFIG_CHTCRC_PMIC_OPREGION=y
CONFIG_CHT_WC_PMIC_OPREGION=y
CONFIG_X86_PM_TIMER=y
CONFIG_X86_APM_BOOT=y
CONFIG_APM=y
# CONFIG_APM_IGNORE_USER_SUSPEND is not set
# CONFIG_APM_DO_ENABLE is not set
# CONFIG_APM_CPU_IDLE is not set
# CONFIG_APM_DISPLAY_BLANK is not set
CONFIG_APM_ALLOW_INTS=y

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
CONFIG_CPU_IDLE_GOV_HALTPOLL=y
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

# CONFIG_INTEL_IDLE is not set
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
# CONFIG_PCI_GOOLPC is not set
CONFIG_PCI_GOANY=y
CONFIG_PCI_BIOS=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_OLPC=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
CONFIG_ISA_BUS=y
CONFIG_ISA_DMA_API=y
CONFIG_ISA=y
CONFIG_SCx200=y
# CONFIG_SCx200HR_TIMER is not set
CONFIG_OLPC=y
CONFIG_OLPC_XO15_SCI=y
# CONFIG_ALIX is not set
CONFIG_NET5501=y
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_COMPAT_32=y
# end of Binary Emulations

CONFIG_HAVE_ATOMIC_IOMAP=y
CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y
CONFIG_AS_GFNI=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR is not set
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=8
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SPLIT_ARG64=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_FUNCTION_ALIGNMENT_4B=y
CONFIG_FUNCTION_ALIGNMENT_16B=y
CONFIG_FUNCTION_ALIGNMENT=16
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
CONFIG_MODULES=y
# CONFIG_MODULE_DEBUG is not set
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLUB_TINY is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SLUB_STATS=y
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
# CONFIG_COMPACTION is not set
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
CONFIG_CMA_DEBUGFS=y
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
CONFIG_ZONE_DMA=y
CONFIG_HMM_MIRROR=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_DMAPOOL_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
CONFIG_SECRETMEM=y
CONFIG_USERFAULTFD=y
CONFIG_LRU_GEN=y
# CONFIG_LRU_GEN_ENABLED is not set
CONFIG_LRU_GEN_STATS=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
# CONFIG_XFRM_SUB_POLICY is not set
CONFIG_XFRM_MIGRATE=y
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=y
CONFIG_NET_KEY=y
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_NET_HANDSHAKE=y
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=y
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=y
CONFIG_INET_ESP=y
# CONFIG_INET_ESP_OFFLOAD is not set
# CONFIG_INET_ESPINTCP is not set
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_TABLE_PERTURB_ORDER=16
CONFIG_INET_TUNNEL=y
# CONFIG_INET_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
# CONFIG_IPV6 is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
CONFIG_BPFILTER=y
CONFIG_BPFILTER_UMH=y
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=y
CONFIG_SCTP_DBG_OBJCNT=y
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_RDS=y
# CONFIG_RDS_RDMA is not set
# CONFIG_RDS_TCP is not set
# CONFIG_RDS_DEBUG is not set
CONFIG_TIPC=y
# CONFIG_TIPC_MEDIA_UDP is not set
# CONFIG_TIPC_CRYPTO is not set
CONFIG_TIPC_DIAG=y
CONFIG_ATM=y
CONFIG_ATM_CLIP=y
CONFIG_ATM_CLIP_NO_ICMP=y
# CONFIG_ATM_LANE is not set
CONFIG_ATM_BR2684=y
# CONFIG_ATM_BR2684_IPFILTER is not set
# CONFIG_L2TP is not set
CONFIG_STP=y
CONFIG_BRIDGE=y
# CONFIG_BRIDGE_IGMP_SNOOPING is not set
# CONFIG_BRIDGE_VLAN_FILTERING is not set
CONFIG_BRIDGE_MRP=y
# CONFIG_BRIDGE_CFM is not set
CONFIG_NET_DSA=y
CONFIG_NET_DSA_TAG_NONE=y
CONFIG_NET_DSA_TAG_AR9331=y
CONFIG_NET_DSA_TAG_BRCM_COMMON=y
CONFIG_NET_DSA_TAG_BRCM=y
CONFIG_NET_DSA_TAG_BRCM_LEGACY=y
CONFIG_NET_DSA_TAG_BRCM_PREPEND=y
CONFIG_NET_DSA_TAG_HELLCREEK=y
CONFIG_NET_DSA_TAG_GSWIP=y
CONFIG_NET_DSA_TAG_DSA_COMMON=y
CONFIG_NET_DSA_TAG_DSA=y
CONFIG_NET_DSA_TAG_EDSA=y
CONFIG_NET_DSA_TAG_MTK=y
CONFIG_NET_DSA_TAG_KSZ=y
CONFIG_NET_DSA_TAG_OCELOT=y
# CONFIG_NET_DSA_TAG_OCELOT_8021Q is not set
CONFIG_NET_DSA_TAG_QCA=y
CONFIG_NET_DSA_TAG_RTL4_A=y
CONFIG_NET_DSA_TAG_RTL8_4=y
CONFIG_NET_DSA_TAG_RZN1_A5PSW=y
CONFIG_NET_DSA_TAG_LAN9303=y
CONFIG_NET_DSA_TAG_SJA1105=y
CONFIG_NET_DSA_TAG_TRAILER=y
CONFIG_NET_DSA_TAG_XRS700X=y
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
# CONFIG_VLAN_8021Q_MVRP is not set
CONFIG_LLC=y
CONFIG_LLC2=y
# CONFIG_ATALK is not set
CONFIG_X25=y
CONFIG_LAPB=y
CONFIG_PHONET=y
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
# CONFIG_NET_SCH_HTB is not set
# CONFIG_NET_SCH_HFSC is not set
# CONFIG_NET_SCH_PRIO is not set
CONFIG_NET_SCH_MULTIQ=y
CONFIG_NET_SCH_RED=y
# CONFIG_NET_SCH_SFB is not set
CONFIG_NET_SCH_SFQ=y
CONFIG_NET_SCH_TEQL=y
CONFIG_NET_SCH_TBF=y
CONFIG_NET_SCH_CBS=y
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=y
# CONFIG_NET_SCH_NETEM is not set
CONFIG_NET_SCH_DRR=y
# CONFIG_NET_SCH_MQPRIO is not set
CONFIG_NET_SCH_SKBPRIO=y
CONFIG_NET_SCH_CHOKE=y
# CONFIG_NET_SCH_QFQ is not set
CONFIG_NET_SCH_CODEL=y
# CONFIG_NET_SCH_FQ_CODEL is not set
CONFIG_NET_SCH_CAKE=y
# CONFIG_NET_SCH_FQ is not set
# CONFIG_NET_SCH_HHF is not set
CONFIG_NET_SCH_PIE=y
# CONFIG_NET_SCH_FQ_PIE is not set
# CONFIG_NET_SCH_PLUG is not set
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_CODEL is not set
# CONFIG_DEFAULT_SFQ is not set
CONFIG_DEFAULT_PFIFO_FAST=y
CONFIG_DEFAULT_NET_SCH="pfifo_fast"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=y
# CONFIG_NET_CLS_ROUTE4 is not set
CONFIG_NET_CLS_FW=y
CONFIG_NET_CLS_U32=y
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_FLOW=y
# CONFIG_NET_CLS_CGROUP is not set
# CONFIG_NET_CLS_BPF is not set
CONFIG_NET_CLS_FLOWER=y
CONFIG_NET_CLS_MATCHALL=y
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=y
# CONFIG_NET_EMATCH_NBYTE is not set
CONFIG_NET_EMATCH_U32=y
# CONFIG_NET_EMATCH_META is not set
# CONFIG_NET_EMATCH_TEXT is not set
# CONFIG_NET_CLS_ACT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=y
CONFIG_BATMAN_ADV=y
# CONFIG_BATMAN_ADV_BATMAN_V is not set
# CONFIG_BATMAN_ADV_BLA is not set
# CONFIG_BATMAN_ADV_DAT is not set
# CONFIG_BATMAN_ADV_NC is not set
CONFIG_BATMAN_ADV_MCAST=y
CONFIG_BATMAN_ADV_DEBUG=y
# CONFIG_BATMAN_ADV_TRACING is not set
# CONFIG_OPENVSWITCH is not set
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=y
CONFIG_VSOCKETS_LOOPBACK=y
# CONFIG_VIRTIO_VSOCKETS is not set
CONFIG_VIRTIO_VSOCKETS_COMMON=y
CONFIG_NETLINK_DIAG=y
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
# CONFIG_MPLS_ROUTING is not set
# CONFIG_NET_NSH is not set
CONFIG_HSR=y
CONFIG_NET_SWITCHDEV=y
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
CONFIG_NET_NCSI=y
CONFIG_NCSI_OEM_CMD_GET_MAC=y
# CONFIG_NCSI_OEM_CMD_KEEP_PHY is not set
# CONFIG_PCPU_DEV_REFCNT is not set
CONFIG_MAX_SKB_FRAGS=17
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
# CONFIG_CGROUP_NET_CLASSID is not set
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=y
# CONFIG_NET_DROP_MONITOR is not set
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
CONFIG_AX25=y
# CONFIG_AX25_DAMA_SLAVE is not set
CONFIG_NETROM=y
CONFIG_ROSE=y

#
# AX.25 network device drivers
#
# CONFIG_MKISS is not set
CONFIG_6PACK=y
# CONFIG_BPQETHER is not set
CONFIG_SCC=y
CONFIG_SCC_DELAY=y
# CONFIG_SCC_TRXECHO is not set
CONFIG_BAYCOM_SER_FDX=y
CONFIG_BAYCOM_SER_HDX=y
CONFIG_YAM=y
# end of AX.25 network device drivers

# CONFIG_CAN is not set
CONFIG_BT=y
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=y
# CONFIG_BT_RFCOMM_TTY is not set
CONFIG_BT_BNEP=y
# CONFIG_BT_BNEP_MC_FILTER is not set
# CONFIG_BT_BNEP_PROTO_FILTER is not set
CONFIG_BT_HS=y
CONFIG_BT_LE=y
# CONFIG_BT_LE_L2CAP_ECRED is not set
# CONFIG_BT_LEDS is not set
CONFIG_BT_MSFTEXT=y
CONFIG_BT_AOSPEXT=y
# CONFIG_BT_DEBUGFS is not set
# CONFIG_BT_SELFTEST is not set
CONFIG_BT_FEATURE_DEBUG=y

#
# Bluetooth device drivers
#
CONFIG_BT_MTK=y
# CONFIG_BT_HCIBTUSB is not set
# CONFIG_BT_HCIUART is not set
# CONFIG_BT_HCIBCM203X is not set
# CONFIG_BT_HCIBCM4377 is not set
CONFIG_BT_HCIBPA10X=y
CONFIG_BT_HCIBFUSB=y
CONFIG_BT_HCIVHCI=y
CONFIG_BT_MRVL=y
CONFIG_BT_MTKUART=y
CONFIG_BT_VIRTIO=y
# CONFIG_BT_NXPUART is not set
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=y
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
# CONFIG_AF_RXRPC_INJECT_RX_DELAY is not set
CONFIG_AF_RXRPC_DEBUG=y
CONFIG_RXKAD=y
CONFIG_RXPERF=y
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
CONFIG_MCTP=y
# CONFIG_WIRELESS is not set
CONFIG_RFKILL=y
# CONFIG_RFKILL_INPUT is not set
CONFIG_RFKILL_GPIO=y
CONFIG_NET_9P=y
# CONFIG_NET_9P_FD is not set
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_RDMA is not set
CONFIG_NET_9P_DEBUG=y
CONFIG_CAIF=y
CONFIG_CAIF_DEBUG=y
CONFIG_CAIF_NETDEV=y
CONFIG_CAIF_USB=y
# CONFIG_CEPH_LIB is not set
CONFIG_NFC=y
# CONFIG_NFC_DIGITAL is not set
CONFIG_NFC_NCI=y
# CONFIG_NFC_NCI_UART is not set
CONFIG_NFC_HCI=y
CONFIG_NFC_SHDLC=y

#
# Near Field Communication (NFC) devices
#
# CONFIG_NFC_VIRTUAL_NCI is not set
# CONFIG_NFC_FDP is not set
CONFIG_NFC_PN544=y
CONFIG_NFC_PN544_I2C=y
CONFIG_NFC_PN533=y
CONFIG_NFC_PN533_USB=y
# CONFIG_NFC_PN533_I2C is not set
CONFIG_NFC_PN532_UART=y
CONFIG_NFC_MICROREAD=y
CONFIG_NFC_MICROREAD_I2C=y
CONFIG_NFC_MRVL=y
CONFIG_NFC_MRVL_USB=y
# CONFIG_NFC_MRVL_I2C is not set
# CONFIG_NFC_ST21NFCA_I2C is not set
CONFIG_NFC_ST_NCI=y
CONFIG_NFC_ST_NCI_I2C=y
CONFIG_NFC_NXP_NCI=y
# CONFIG_NFC_NXP_NCI_I2C is not set
CONFIG_NFC_S3FWRN5=y
# CONFIG_NFC_S3FWRN5_I2C is not set
CONFIG_NFC_S3FWRN82_UART=y
# end of Near Field Communication (NFC) devices

# CONFIG_PSAMPLE is not set
CONFIG_NET_IFE=y
# CONFIG_LWTUNNEL is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_PAGE_POOL_STATS=y
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
CONFIG_EISA_VLB_PRIMING=y
CONFIG_EISA_PCI_EISA=y
# CONFIG_EISA_VIRTUAL_ROOT is not set
# CONFIG_EISA_NAMES is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set
CONFIG_PCI_LABEL=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
# CONFIG_PCI_FTPCI100 is not set
# CONFIG_PCI_HOST_GENERIC is not set

#
# Cadence-based PCIe controllers
#
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
# CONFIG_PCI_J721E_HOST is not set
# end of Cadence-based PCIe controllers

#
# DesignWare-based PCIe controllers
#
# end of DesignWare-based PCIe controllers

#
# Mobiveil-based PCIe controllers
#
# end of Mobiveil-based PCIe controllers
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
CONFIG_FW_LOADER_COMPRESS=y
CONFIG_FW_LOADER_COMPRESS_XZ=y
CONFIG_FW_LOADER_COMPRESS_ZSTD=y
# CONFIG_FW_CACHE is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SCCB=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
# CONFIG_MHI_BUS_PCI_GENERIC is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_EDD is not set
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_FW_CFG_SYSFS is not set
CONFIG_SYSFB=y
CONFIG_SYSFB_SIMPLEFB=y
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=y
# CONFIG_GNSS_MTK_SERIAL is not set
CONFIG_GNSS_SIRF_SERIAL=y
CONFIG_GNSS_UBX_SERIAL=y
# CONFIG_GNSS_USB is not set
CONFIG_MTD=y
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=y
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_OF_PARTS=y
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_OTP=y
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=y
# CONFIG_MTD_PHYSMAP_COMPAT is not set
# CONFIG_MTD_PHYSMAP_OF is not set
# CONFIG_MTD_SCx200_DOCFLASH is not set
# CONFIG_MTD_AMD76XROM is not set
CONFIG_MTD_ICHXROM=y
# CONFIG_MTD_ESB2ROM is not set
# CONFIG_MTD_CK804XROM is not set
# CONFIG_MTD_SCB2_FLASH is not set
# CONFIG_MTD_NETtel is not set
CONFIG_MTD_L440GX=y
# CONFIG_MTD_INTEL_VR_NOR is not set
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_SLRAM=y
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=y
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=y
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
# CONFIG_MTD_ONENAND_GENERIC is not set
CONFIG_MTD_ONENAND_OTP=y
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
CONFIG_MTD_RAW_NAND=y

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=y
# CONFIG_MTD_NAND_DENALI_PCI is not set
CONFIG_MTD_NAND_DENALI_DT=y
# CONFIG_MTD_NAND_CAFE is not set
CONFIG_MTD_NAND_CS553X=y
CONFIG_MTD_NAND_MXIC=y
CONFIG_MTD_NAND_GPIO=y
CONFIG_MTD_NAND_PLATFORM=y
# CONFIG_MTD_NAND_CADENCE is not set
CONFIG_MTD_NAND_ARASAN=y
CONFIG_MTD_NAND_INTEL_LGM=y

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=y
# CONFIG_MTD_NAND_RICOH is not set
CONFIG_MTD_NAND_DISKONCHIP=y
# CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
# CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
CONFIG_MTD_NAND_ECC_SW_BCH=y
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
CONFIG_MTD_UBI_GLUEBI=y
# CONFIG_MTD_HYPERBUS is not set
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_PROMTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
# CONFIG_OF_OVERLAY is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
# CONFIG_ISAPNP is not set
CONFIG_PNPBIOS=y
CONFIG_PNPBIOS_PROC_FS=y
CONFIG_PNPACPI=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_DUMMY_IRQ=y
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=y
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_SMPRO_ERRMON=y
CONFIG_SMPRO_MISC=y
# CONFIG_HI6421V600_IRQ is not set
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
CONFIG_ISL29003=y
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
# CONFIG_PCH_PHUB is not set
CONFIG_SRAM=y
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=y
# CONFIG_HISI_HIKEY_USB is not set
CONFIG_VCPU_STALL_DETECTOR=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
CONFIG_EEPROM_IDT_89HPESX=y
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
# CONFIG_INTEL_MEI is not set
# CONFIG_INTEL_MEI_ME is not set
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_VMWARE_VMCI is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
CONFIG_MISC_RTSX_USB=y
CONFIG_UACCE=y
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
# CONFIG_MAC_EMUMOUSEBTN is not set
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=y
CONFIG_DUMMY=y
CONFIG_WIREGUARD=y
CONFIG_WIREGUARD_DEBUG=y
# CONFIG_EQUALIZER is not set
CONFIG_NET_TEAM=y
# CONFIG_NET_TEAM_MODE_BROADCAST is not set
CONFIG_NET_TEAM_MODE_ROUNDROBIN=y
CONFIG_NET_TEAM_MODE_RANDOM=y
# CONFIG_NET_TEAM_MODE_ACTIVEBACKUP is not set
CONFIG_NET_TEAM_MODE_LOADBALANCE=y
CONFIG_MACVLAN=y
CONFIG_MACVTAP=y
# CONFIG_IPVLAN is not set
CONFIG_VXLAN=y
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
CONFIG_GTP=y
CONFIG_MACSEC=y
# CONFIG_NETCONSOLE is not set
# CONFIG_TUN is not set
CONFIG_TAP=y
CONFIG_TUN_VNET_CROSS_LE=y
CONFIG_VETH=y
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
CONFIG_MHI_NET=y
CONFIG_ARCNET=y
CONFIG_ARCNET_1201=y
CONFIG_ARCNET_1051=y
CONFIG_ARCNET_RAW=y
CONFIG_ARCNET_CAP=y
CONFIG_ARCNET_COM90xx=y
CONFIG_ARCNET_COM90xxIO=y
# CONFIG_ARCNET_RIM_I is not set
CONFIG_ARCNET_COM20020=y
CONFIG_ARCNET_COM20020_ISA=y
# CONFIG_ARCNET_COM20020_PCI is not set
# CONFIG_ATM_DRIVERS is not set
# CONFIG_CAIF_DRIVERS is not set

#
# Distributed Switch Architecture drivers
#
CONFIG_B53=y
# CONFIG_B53_MDIO_DRIVER is not set
# CONFIG_B53_MMAP_DRIVER is not set
# CONFIG_B53_SRAB_DRIVER is not set
# CONFIG_B53_SERDES is not set
CONFIG_NET_DSA_BCM_SF2=y
CONFIG_NET_DSA_LOOP=y
CONFIG_NET_DSA_LANTIQ_GSWIP=y
# CONFIG_NET_DSA_MT7530 is not set
# CONFIG_NET_DSA_MV88E6060 is not set
CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=y
# CONFIG_NET_DSA_MICROCHIP_KSZ9477_I2C is not set
# CONFIG_NET_DSA_MICROCHIP_KSZ8863_SMI is not set
CONFIG_NET_DSA_MV88E6XXX=y
# CONFIG_NET_DSA_MSCC_SEVILLE is not set
CONFIG_NET_DSA_AR9331=y
# CONFIG_NET_DSA_QCA8K is not set
CONFIG_NET_DSA_XRS700X=y
CONFIG_NET_DSA_XRS700X_I2C=y
CONFIG_NET_DSA_XRS700X_MDIO=y
CONFIG_NET_DSA_REALTEK=y
# CONFIG_NET_DSA_REALTEK_MDIO is not set
CONFIG_NET_DSA_REALTEK_SMI=y
CONFIG_NET_DSA_REALTEK_RTL8365MB=y
CONFIG_NET_DSA_REALTEK_RTL8366RB=y
CONFIG_NET_DSA_SMSC_LAN9303=y
CONFIG_NET_DSA_SMSC_LAN9303_I2C=y
CONFIG_NET_DSA_SMSC_LAN9303_MDIO=y
CONFIG_NET_DSA_VITESSE_VSC73XX=y
CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM=y
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_3C515 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0_ISA is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_GEMINI_ETHERNET is not set
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
# CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
CONFIG_NET_VENDOR_GOOGLE=y
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGBE is not set
# CONFIG_I40E is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
# CONFIG_LITEX_LITEETH is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
# CONFIG_LAN966X_SWITCH is not set
# CONFIG_VCAP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
# CONFIG_MSCC_OCELOT_SWITCH is not set
CONFIG_NET_VENDOR_MICROSOFT=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2000 is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_ULTRA is not set
# CONFIG_WD80x3 is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCA7000_UART is not set
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_SMC9194 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NGBE is not set
# CONFIG_TXGBE is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
CONFIG_NET_SB1000=y
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_PHYLIB_LEDS=y
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
CONFIG_ADIN_PHY=y
CONFIG_ADIN1100_PHY=y
CONFIG_AQUANTIA_PHY=y
CONFIG_AX88796B_PHY=y
CONFIG_BROADCOM_PHY=y
# CONFIG_BCM54140_PHY is not set
CONFIG_BCM7XXX_PHY=y
CONFIG_BCM84881_PHY=y
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_NET_PHYLIB=y
# CONFIG_CICADA_PHY is not set
CONFIG_CORTINA_PHY=y
# CONFIG_DAVICOM_PHY is not set
CONFIG_ICPLUS_PHY=y
CONFIG_LXT_PHY=y
CONFIG_INTEL_XWAY_PHY=y
CONFIG_LSI_ET1011C_PHY=y
CONFIG_MARVELL_PHY=y
CONFIG_MARVELL_10G_PHY=y
CONFIG_MARVELL_88X2222_PHY=y
CONFIG_MAXLINEAR_GPHY=y
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MICREL_PHY=y
CONFIG_MICROCHIP_T1S_PHY=y
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=y
CONFIG_MICROSEMI_PHY=y
CONFIG_MOTORCOMM_PHY=y
CONFIG_NATIONAL_PHY=y
# CONFIG_NXP_CBTX_PHY is not set
CONFIG_NXP_C45_TJA11XX_PHY=y
CONFIG_NXP_TJA11XX_PHY=y
CONFIG_NCN26000_PHY=y
# CONFIG_AT803X_PHY is not set
CONFIG_QSEMI_PHY=y
CONFIG_REALTEK_PHY=y
CONFIG_RENESAS_PHY=y
# CONFIG_ROCKCHIP_PHY is not set
CONFIG_SMSC_PHY=y
CONFIG_STE10XP=y
CONFIG_TERANETICS_PHY=y
CONFIG_DP83822_PHY=y
# CONFIG_DP83TC811_PHY is not set
CONFIG_DP83848_PHY=y
CONFIG_DP83867_PHY=y
CONFIG_DP83869_PHY=y
# CONFIG_DP83TD510_PHY is not set
CONFIG_VITESSE_PHY=y
CONFIG_XILINX_GMII2RGMII=y
# CONFIG_PSE_CONTROLLER is not set

#
# MCTP Device Drivers
#
# CONFIG_MCTP_SERIAL is not set
# CONFIG_MCTP_TRANSPORT_I2C is not set
# end of MCTP Device Drivers

CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_OF_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
CONFIG_MDIO_BCM_UNIMAC=y
CONFIG_MDIO_HISI_FEMAC=y
CONFIG_MDIO_MVUSB=y
CONFIG_MDIO_MSCC_MIIM=y
CONFIG_MDIO_IPQ4019=y
CONFIG_MDIO_IPQ8064=y

#
# MDIO Multiplexers
#
CONFIG_MDIO_BUS_MUX=y
CONFIG_MDIO_BUS_MUX_GPIO=y
CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
CONFIG_MDIO_BUS_MUX_MMIOREG=y

#
# PCS device drivers
#
# end of PCS device drivers

CONFIG_PPP=y
CONFIG_PPP_BSDCOMP=y
# CONFIG_PPP_DEFLATE is not set
# CONFIG_PPP_FILTER is not set
CONFIG_PPP_MPPE=y
# CONFIG_PPP_MULTILINK is not set
CONFIG_PPPOATM=y
# CONFIG_PPPOE is not set
# CONFIG_PPP_ASYNC is not set
CONFIG_PPP_SYNC_TTY=y
CONFIG_SLIP=y
CONFIG_SLHC=y
# CONFIG_SLIP_COMPRESSED is not set
CONFIG_SLIP_SMART=y
# CONFIG_SLIP_MODE_SLIP6 is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
CONFIG_USB_KAWETH=y
CONFIG_USB_PEGASUS=y
CONFIG_USB_RTL8150=y
CONFIG_USB_RTL8152=y
CONFIG_USB_LAN78XX=y
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
# CONFIG_USB_NET_AX88179_178A is not set
CONFIG_USB_NET_CDCETHER=y
CONFIG_USB_NET_CDC_EEM=y
CONFIG_USB_NET_CDC_NCM=y
CONFIG_USB_NET_HUAWEI_CDC_NCM=y
CONFIG_USB_NET_CDC_MBIM=y
CONFIG_USB_NET_DM9601=y
# CONFIG_USB_NET_SR9700 is not set
CONFIG_USB_NET_SR9800=y
CONFIG_USB_NET_SMSC75XX=y
CONFIG_USB_NET_SMSC95XX=y
CONFIG_USB_NET_GL620A=y
# CONFIG_USB_NET_NET1080 is not set
CONFIG_USB_NET_PLUSB=y
CONFIG_USB_NET_MCS7830=y
CONFIG_USB_NET_RNDIS_HOST=y
CONFIG_USB_NET_CDC_SUBSET_ENABLE=y
CONFIG_USB_NET_CDC_SUBSET=y
# CONFIG_USB_ALI_M5632 is not set
CONFIG_USB_AN2720=y
# CONFIG_USB_BELKIN is not set
# CONFIG_USB_ARMLINUX is not set
# CONFIG_USB_EPSON2888 is not set
CONFIG_USB_KC2190=y
CONFIG_USB_NET_ZAURUS=y
CONFIG_USB_NET_CX82310_ETH=y
# CONFIG_USB_NET_KALMIA is not set
CONFIG_USB_NET_QMI_WWAN=y
CONFIG_USB_HSO=y
CONFIG_USB_NET_INT51X1=y
# CONFIG_USB_CDC_PHONET is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
CONFIG_USB_VL600=y
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_USB_RTL8153_ECM=y
# CONFIG_WLAN is not set
CONFIG_WAN=y
# CONFIG_HDLC is not set
# CONFIG_LAPBETHER is not set

#
# Wireless WAN
#
CONFIG_WWAN=y
CONFIG_WWAN_DEBUGFS=y
CONFIG_WWAN_HWSIM=y
# CONFIG_MHI_WWAN_CTRL is not set
CONFIG_MHI_WWAN_MBIM=y
CONFIG_RPMSG_WWAN_CTRL=y
# CONFIG_IOSM is not set
# CONFIG_MTK_T7XX is not set
# end of Wireless WAN

# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=y
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
# CONFIG_INPUT_FF_MEMLESS is not set
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5520 is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_TC3589X is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_CAP11XX is not set
# CONFIG_KEYBOARD_BCM is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
CONFIG_JOYSTICK_A3D=y
# CONFIG_JOYSTICK_ADC is not set
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=y
# CONFIG_JOYSTICK_GF2K is not set
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
CONFIG_JOYSTICK_INTERACT=y
# CONFIG_JOYSTICK_SIDEWINDER is not set
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=y
CONFIG_JOYSTICK_IFORCE_USB=y
CONFIG_JOYSTICK_IFORCE_232=y
# CONFIG_JOYSTICK_WARRIOR is not set
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=y
# CONFIG_JOYSTICK_TWIDJOY is not set
CONFIG_JOYSTICK_ZHENHUA=y
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=y
# CONFIG_JOYSTICK_XPAD_FF is not set
CONFIG_JOYSTICK_XPAD_LEDS=y
CONFIG_JOYSTICK_PXRC=y
CONFIG_JOYSTICK_QWIIC=y
CONFIG_JOYSTICK_FSIA6B=y
# CONFIG_JOYSTICK_SENSEHAT is not set
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
# CONFIG_TABLET_USB_AIPTEK is not set
# CONFIG_TABLET_USB_HANWANG is not set
CONFIG_TABLET_USB_KBTAB=y
CONFIG_TABLET_USB_PEGASUS=y
CONFIG_TABLET_SERIAL_WACOM4=y
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_88PM860X=y
CONFIG_TOUCHSCREEN_AD7879=y
# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
# CONFIG_TOUCHSCREEN_ADC is not set
# CONFIG_TOUCHSCREEN_AR1021_I2C is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
CONFIG_TOUCHSCREEN_BU21013=y
CONFIG_TOUCHSCREEN_BU21029=y
CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=y
CONFIG_TOUCHSCREEN_CHIPONE_ICN8505=y
CONFIG_TOUCHSCREEN_CY8CTMA140=y
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
# CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
CONFIG_TOUCHSCREEN_CYTTSP4_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP4_I2C=y
CONFIG_TOUCHSCREEN_CYTTSP5=y
# CONFIG_TOUCHSCREEN_DA9034 is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
CONFIG_TOUCHSCREEN_EETI=y
CONFIG_TOUCHSCREEN_EGALAX=y
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
CONFIG_TOUCHSCREEN_EXC3000=y
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
CONFIG_TOUCHSCREEN_HIDEEP=y
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
# CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX is not set
CONFIG_TOUCHSCREEN_ILI210X=y
CONFIG_TOUCHSCREEN_ILITEK=y
# CONFIG_TOUCHSCREEN_S6SY761 is not set
CONFIG_TOUCHSCREEN_GUNZE=y
CONFIG_TOUCHSCREEN_EKTF2127=y
CONFIG_TOUCHSCREEN_ELAN=y
CONFIG_TOUCHSCREEN_ELO=y
# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
CONFIG_TOUCHSCREEN_WACOM_I2C=y
CONFIG_TOUCHSCREEN_MAX11801=y
CONFIG_TOUCHSCREEN_MCS5000=y
CONFIG_TOUCHSCREEN_MMS114=y
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=y
CONFIG_TOUCHSCREEN_MTOUCH=y
CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS=y
# CONFIG_TOUCHSCREEN_IMAGIS is not set
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
# CONFIG_TOUCHSCREEN_INEXIO is not set
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_HTCPEN=y
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_PIXCIR=y
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
# CONFIG_TOUCHSCREEN_USB_3M is not set
CONFIG_TOUCHSCREEN_USB_ITM=y
# CONFIG_TOUCHSCREEN_USB_ETURBO is not set
# CONFIG_TOUCHSCREEN_USB_GUNZE is not set
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
CONFIG_TOUCHSCREEN_USB_ELO=y
# CONFIG_TOUCHSCREEN_USB_E2I is not set
# CONFIG_TOUCHSCREEN_USB_ZYTRONIC is not set
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
# CONFIG_TOUCHSCREEN_USB_NEXIO is not set
# CONFIG_TOUCHSCREEN_USB_EASYTOUCH is not set
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=y
CONFIG_TOUCHSCREEN_TSC2004=y
# CONFIG_TOUCHSCREEN_TSC2007 is not set
CONFIG_TOUCHSCREEN_RM_TS=y
CONFIG_TOUCHSCREEN_SILEAD=y
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=y
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SX8654 is not set
CONFIG_TOUCHSCREEN_TPS6507X=y
CONFIG_TOUCHSCREEN_ZET6223=y
# CONFIG_TOUCHSCREEN_ZFORCE is not set
CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
CONFIG_TOUCHSCREEN_IQS5XX=y
# CONFIG_TOUCHSCREEN_ZINITIX is not set
CONFIG_TOUCHSCREEN_HIMAX_HX83112B=y
# CONFIG_INPUT_MISC is not set
# CONFIG_RMI4_CORE is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_APBPS2 is not set
CONFIG_SERIO_GPIO_PS2=y
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
# CONFIG_GAMEPORT_L4 is not set
# CONFIG_GAMEPORT_EMU10K1 is not set
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LEGACY_TIOCSTI=y
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCILIB=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_PCI1XXXX is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
CONFIG_SERIAL_8250_PERICOM=y
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_SIFIVE is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
CONFIG_SERIAL_SC16IS7XX_I2C=y
CONFIG_SERIAL_TIMBERDALE=y
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
CONFIG_SERIAL_ARC=y
# CONFIG_SERIAL_ARC_CONSOLE is not set
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=y
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_MOXA_INTELLIO=y
# CONFIG_MOXA_SMARTIO is not set
# CONFIG_SYNCLINK_GT is not set
CONFIG_N_HDLC=y
# CONFIG_GOLDFISH_TTY is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
CONFIG_RPMSG_TTY=y
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_TTY_PRINTK is not set
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
CONFIG_SSIF_IPMI_BMC=y
CONFIG_IPMB_DEVICE_INTERFACE=y
# CONFIG_HW_RANDOM is not set
CONFIG_DTLK=y
# CONFIG_APPLICOM is not set
# CONFIG_SONYPI is not set
# CONFIG_MWAVE is not set
CONFIG_SCx200_GPIO=y
# CONFIG_PC8736x_GPIO is not set
CONFIG_NSC_GPIO=y
# CONFIG_DEVMEM is not set
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
CONFIG_HPET=y
# CONFIG_HPET_MMAP is not set
CONFIG_HANGCHECK_TIMER=y
CONFIG_TCG_TPM=y
# CONFIG_TCG_TIS is not set
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
# CONFIG_TCG_TIS_I2C_ATMEL is not set
# CONFIG_TCG_TIS_I2C_INFINEON is not set
CONFIG_TCG_TIS_I2C_NUVOTON=y
CONFIG_TCG_NSC=y
CONFIG_TCG_ATMEL=y
CONFIG_TCG_INFINEON=y
# CONFIG_TCG_CRB is not set
CONFIG_TCG_VTPM_PROXY=y
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_TELCLOCK=y
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_OF=y
CONFIG_XILLYUSB=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
# CONFIG_ACPI_I2C_OPREGION is not set
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_PINCTRL=y
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_DEMUX_PINCTRL is not set
CONFIG_I2C_MUX_MLXCPLD=y
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
# CONFIG_I2C_ALGOPCF is not set
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_ISMT is not set
# CONFIG_I2C_PIIX4 is not set
CONFIG_I2C_CHT_WC=y
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# ACPI drivers
#
CONFIG_I2C_SCMI=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_OCORES=y
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PXA is not set
CONFIG_I2C_RK3X=y
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_XILINX=y

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_PCI1XXXX is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=y
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=y

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_PCA_ISA=y
# CONFIG_SCx200_ACB is not set
# CONFIG_I2C_FSI is not set
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=y
CONFIG_CDNS_I3C_MASTER=y
# CONFIG_DW_I3C_MASTER is not set
CONFIG_SVC_I3C_MASTER=y
CONFIG_MIPI_I3C_HCI=y
# CONFIG_SPI is not set
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=y
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
CONFIG_NTP_PPS=y

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=y
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_AXP209 is not set
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA9062=y
# CONFIG_PINCTRL_EQUILIBRIUM is not set
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
# CONFIG_PINCTRL_MICROCHIP_SGPIO is not set
CONFIG_PINCTRL_OCELOT=y
CONFIG_PINCTRL_PALMAS=y
CONFIG_PINCTRL_SINGLE=y
CONFIG_PINCTRL_STMFX=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_LOCHNAGAR=y
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y

#
# Intel pinctrl drivers
#
CONFIG_PINCTRL_BAYTRAIL=y
# CONFIG_PINCTRL_CHERRYVIEW is not set
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
# CONFIG_PINCTRL_ALDERLAKE is not set
# CONFIG_PINCTRL_BROXTON is not set
CONFIG_PINCTRL_CANNONLAKE=y
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
CONFIG_PINCTRL_ELKHARTLAKE=y
# CONFIG_PINCTRL_EMMITSBURG is not set
CONFIG_PINCTRL_GEMINILAKE=y
# CONFIG_PINCTRL_ICELAKE is not set
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
CONFIG_PINCTRL_LEWISBURG=y
CONFIG_PINCTRL_METEORLAKE=y
CONFIG_PINCTRL_SUNRISEPOINT=y
CONFIG_PINCTRL_TIGERLAKE=y
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
# CONFIG_GPIO_CDEV_V1 is not set
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
# CONFIG_GPIO_ALTERA is not set
# CONFIG_GPIO_AMDPT is not set
# CONFIG_GPIO_CADENCE is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EXAR is not set
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HLWD is not set
CONFIG_GPIO_LOGICVC=y
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_SIFIVE is not set
# CONFIG_GPIO_SIOX is not set
CONFIG_GPIO_SYSCON=y
CONFIG_GPIO_TANGIER=y
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_WCD934X=y
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_IT87=y
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=y
CONFIG_GPIO_WS16C48=y
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADNP is not set
CONFIG_GPIO_FXL6408=y
# CONFIG_GPIO_GW_PLD is not set
CONFIG_GPIO_MAX7300=y
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
# CONFIG_GPIO_ARIZONA is not set
# CONFIG_GPIO_BD71815 is not set
CONFIG_GPIO_BD71828=y
# CONFIG_GPIO_BD9571MWV is not set
CONFIG_GPIO_CRYSTAL_COVE=y
CONFIG_GPIO_ELKHARTLAKE=y
CONFIG_GPIO_LP3943=y
# CONFIG_GPIO_MADERA is not set
# CONFIG_GPIO_PALMAS is not set
CONFIG_GPIO_TC3589X=y
# CONFIG_GPIO_TPS65910 is not set
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TQMX86=y
CONFIG_GPIO_WM8994=y
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# CONFIG_GPIO_SODAVILLE is not set
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_LATCH=y
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2490 is not set
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_GPIO is not set
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
# CONFIG_W1_SLAVE_DS2408 is not set
# CONFIG_W1_SLAVE_DS2413 is not set
CONFIG_W1_SLAVE_DS2406=y
# CONFIG_W1_SLAVE_DS2423 is not set
# CONFIG_W1_SLAVE_DS2805 is not set
CONFIG_W1_SLAVE_DS2430=y
# CONFIG_W1_SLAVE_DS2431 is not set
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=y
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=y
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_ATC260X=y
# CONFIG_POWER_RESET_GPIO is not set
CONFIG_POWER_RESET_GPIO_RESTART=y
CONFIG_POWER_RESET_LTC2952=y
# CONFIG_POWER_RESET_MT6323 is not set
# CONFIG_POWER_RESET_REGULATOR is not set
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_RESET_SYSCON=y
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
CONFIG_REBOOT_MODE=y
CONFIG_SYSCON_REBOOT_MODE=y
CONFIG_NVMEM_REBOOT_MODE=y
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
CONFIG_GENERIC_ADC_BATTERY=y
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=y
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=y
CONFIG_BATTERY_QCOM_BATTMGR=y
# CONFIG_BATTERY_OLPC is not set
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
CONFIG_BATTERY_DA9030=y
CONFIG_CHARGER_AXP20X=y
# CONFIG_BATTERY_AXP20X is not set
CONFIG_AXP20X_POWER=y
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
CONFIG_BATTERY_MAX1721X=y
CONFIG_CHARGER_88PM860X=y
CONFIG_CHARGER_PCF50633=y
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_MP2629=y
# CONFIG_CHARGER_MT6360 is not set
CONFIG_CHARGER_MT6370=y
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_BQ25980 is not set
CONFIG_CHARGER_BQ256XX=y
CONFIG_CHARGER_SMB347=y
# CONFIG_CHARGER_TPS65090 is not set
CONFIG_CHARGER_TPS65217=y
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_RT9467=y
# CONFIG_CHARGER_RT9471 is not set
# CONFIG_CHARGER_UCS1002 is not set
# CONFIG_CHARGER_BD99954 is not set
CONFIG_BATTERY_SURFACE=y
# CONFIG_CHARGER_SURFACE is not set
CONFIG_BATTERY_UG3105=y
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_SMPRO=y
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=y
CONFIG_SENSORS_ADM1025=y
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=y
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM1177=y
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ADT7X10=y
CONFIG_SENSORS_ADT7410=y
# CONFIG_SENSORS_ADT7411 is not set
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=y
CONFIG_SENSORS_ADT7475=y
CONFIG_SENSORS_AHT10=y
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_AXI_FAN_CONTROL=y
# CONFIG_SENSORS_K8TEMP is not set
CONFIG_SENSORS_APPLESMC=y
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ATXP1 is not set
CONFIG_SENSORS_DS620=y
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_DELL_SMM=y
CONFIG_I8K=y
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_F71805F is not set
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_GSC=y
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FSCHMD=y
# CONFIG_SENSORS_FTSTEUTATES is not set
# CONFIG_SENSORS_GL518SM is not set
CONFIG_SENSORS_GL520SM=y
# CONFIG_SENSORS_G760A is not set
# CONFIG_SENSORS_G762 is not set
CONFIG_SENSORS_GPIO_FAN=y
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IIO_HWMON=y
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=y
CONFIG_SENSORS_IT87=y
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=y
CONFIG_SENSORS_LINEAGE=y
# CONFIG_SENSORS_LOCHNAGAR is not set
CONFIG_SENSORS_LTC2945=y
# CONFIG_SENSORS_LTC2947_I2C is not set
CONFIG_SENSORS_LTC2990=y
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=y
CONFIG_SENSORS_LTC4215=y
# CONFIG_SENSORS_LTC4222 is not set
# CONFIG_SENSORS_LTC4245 is not set
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=y
CONFIG_SENSORS_MAX127=y
CONFIG_SENSORS_MAX16065=y
# CONFIG_SENSORS_MAX1619 is not set
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=y
# CONFIG_SENSORS_MAX31730 is not set
CONFIG_SENSORS_MAX31760=y
CONFIG_SENSORS_MAX6620=y
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=y
CONFIG_SENSORS_MAX6650=y
CONFIG_SENSORS_MAX6697=y
CONFIG_SENSORS_MAX31790=y
CONFIG_SENSORS_MC34VR500=y
CONFIG_SENSORS_MCP3021=y
CONFIG_SENSORS_TC654=y
CONFIG_SENSORS_TPS23861=y
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
CONFIG_SENSORS_MR75203=y
CONFIG_SENSORS_LM63=y
CONFIG_SENSORS_LM73=y
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=y
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=y
# CONFIG_SENSORS_LM83 is not set
# CONFIG_SENSORS_LM85 is not set
CONFIG_SENSORS_LM87=y
CONFIG_SENSORS_LM90=y
# CONFIG_SENSORS_LM92 is not set
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=y
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NTC_THERMISTOR=y
CONFIG_SENSORS_NCT6683=y
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775=y
# CONFIG_SENSORS_NCT6775_I2C is not set
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_OCC_P8_I2C=y
CONFIG_SENSORS_OCC=y
CONFIG_SENSORS_OXP=y
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_SENSORS_PECI_CPUTEMP is not set
CONFIG_SENSORS_PECI_DIMMTEMP=y
CONFIG_SENSORS_PECI=y
CONFIG_PMBUS=y
# CONFIG_SENSORS_PMBUS is not set
CONFIG_SENSORS_ACBEL_FSG032=y
CONFIG_SENSORS_ADM1266=y
CONFIG_SENSORS_ADM1275=y
CONFIG_SENSORS_BEL_PFE=y
# CONFIG_SENSORS_BPA_RS600 is not set
CONFIG_SENSORS_DELTA_AHE50DC_FAN=y
CONFIG_SENSORS_FSP_3Y=y
CONFIG_SENSORS_IBM_CFFPS=y
CONFIG_SENSORS_DPS920AB=y
# CONFIG_SENSORS_INSPUR_IPSPS is not set
CONFIG_SENSORS_IR35221=y
CONFIG_SENSORS_IR36021=y
# CONFIG_SENSORS_IR38064 is not set
CONFIG_SENSORS_IRPS5401=y
CONFIG_SENSORS_ISL68137=y
CONFIG_SENSORS_LM25066=y
# CONFIG_SENSORS_LM25066_REGULATOR is not set
# CONFIG_SENSORS_LT7182S is not set
CONFIG_SENSORS_LTC2978=y
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=y
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=y
CONFIG_SENSORS_MAX16601=y
CONFIG_SENSORS_MAX20730=y
CONFIG_SENSORS_MAX20751=y
CONFIG_SENSORS_MAX31785=y
# CONFIG_SENSORS_MAX34440 is not set
CONFIG_SENSORS_MAX8688=y
CONFIG_SENSORS_MP2888=y
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_MPQ7932 is not set
# CONFIG_SENSORS_PIM4328 is not set
CONFIG_SENSORS_PLI1209BC=y
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
CONFIG_SENSORS_Q54SJ108A2=y
CONFIG_SENSORS_STPDDC60=y
CONFIG_SENSORS_TDA38640=y
CONFIG_SENSORS_TDA38640_REGULATOR=y
CONFIG_SENSORS_TPS40422=y
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_TPS546D24=y
CONFIG_SENSORS_UCD9000=y
# CONFIG_SENSORS_UCD9200 is not set
CONFIG_SENSORS_XDPE152=y
CONFIG_SENSORS_XDPE122=y
# CONFIG_SENSORS_XDPE122_REGULATOR is not set
CONFIG_SENSORS_ZL6100=y
CONFIG_SENSORS_PWM_FAN=y
# CONFIG_SENSORS_SBTSI is not set
CONFIG_SENSORS_SBRMI=y
# CONFIG_SENSORS_SHT15 is not set
CONFIG_SENSORS_SHT21=y
CONFIG_SENSORS_SHT3x=y
CONFIG_SENSORS_SHT4x=y
CONFIG_SENSORS_SHTC1=y
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_SY7636A is not set
CONFIG_SENSORS_DME1737=y
# CONFIG_SENSORS_EMC1403 is not set
CONFIG_SENSORS_EMC2103=y
CONFIG_SENSORS_EMC2305=y
CONFIG_SENSORS_EMC6W201=y
# CONFIG_SENSORS_SMSC47M1 is not set
CONFIG_SENSORS_SMSC47M192=y
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=y
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_STTS751=y
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=y
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=y
CONFIG_SENSORS_INA2XX=y
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
CONFIG_SENSORS_TC74=y
CONFIG_SENSORS_THMC50=y
CONFIG_SENSORS_TMP102=y
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=y
CONFIG_SENSORS_TMP401=y
CONFIG_SENSORS_TMP421=y
CONFIG_SENSORS_TMP464=y
CONFIG_SENSORS_TMP513=y
CONFIG_SENSORS_VIA_CPUTEMP=y
# CONFIG_SENSORS_VIA686A is not set
CONFIG_SENSORS_VT1211=y
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83773G=y
# CONFIG_SENSORS_W83781D is not set
# CONFIG_SENSORS_W83791D is not set
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
# CONFIG_SENSORS_W83795 is not set
CONFIG_SENSORS_W83L785TS=y
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_SENSORS_W83627HF is not set
# CONFIG_SENSORS_W83627EHF is not set

#
# ACPI drivers
#
# CONFIG_SENSORS_ACPI_POWER is not set
CONFIG_SENSORS_ATK0110=y
CONFIG_SENSORS_ASUS_EC=y
CONFIG_THERMAL=y
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
# CONFIG_THERMAL_OF is not set
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_THERMAL_MMIO is not set
# CONFIG_DA9062_THERMAL is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=y
CONFIG_X86_THERMAL_VECTOR=y
# CONFIG_X86_PKG_TEMP_THERMAL is not set
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# CONFIG_INTEL_TCC_COOLING is not set
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

CONFIG_GENERIC_ADC_THERMAL=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=m
CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=y
CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=y
CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP=y
# CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_SOFT_WATCHDOG_PRETIMEOUT is not set
# CONFIG_BD957XMUF_WATCHDOG is not set
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=y
# CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
# CONFIG_MENF21BMC_WATCHDOG is not set
CONFIG_WDAT_WDT=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=y
# CONFIG_RAVE_SP_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
CONFIG_DW_WATCHDOG=y
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_MAX77620_WATCHDOG is not set
# CONFIG_STPMIC1_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
CONFIG_ADVANTECH_WDT=y
CONFIG_ADVANTECH_EC_WDT=y
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
CONFIG_EBC_C384_WDT=y
CONFIG_EXAR_WDT=y
CONFIG_F71808E_WDT=y
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=y
CONFIG_EUROTECH_WDT=y
# CONFIG_IB700_WDT is not set
CONFIG_IBMASR=y
CONFIG_WAFER_WDT=y
# CONFIG_I6300ESB_WDT is not set
# CONFIG_IE6XX_WDT is not set
# CONFIG_ITCO_WDT is not set
CONFIG_IT8712F_WDT=y
CONFIG_IT87_WDT=y
# CONFIG_HP_WATCHDOG is not set
# CONFIG_SC1200_WDT is not set
# CONFIG_SCx200_WDT is not set
# CONFIG_PC87413_WDT is not set
# CONFIG_NV_TCO is not set
# CONFIG_60XX_WDT is not set
# CONFIG_SBC8360_WDT is not set
CONFIG_SBC7240_WDT=y
CONFIG_CPU5_WDT=y
CONFIG_SMSC_SCH311X_WDT=y
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
# CONFIG_VIA_WDT is not set
CONFIG_W83627HF_WDT=y
# CONFIG_W83877F_WDT is not set
CONFIG_W83977F_WDT=y
CONFIG_MACHZ_WDT=y
CONFIG_SBC_EPX_C3_WATCHDOG=y
# CONFIG_NI903X_WDT is not set
CONFIG_NIC7018_WDT=y
CONFIG_MEN_A21_WDT=y

#
# ISA-based Watchdog Cards
#
# CONFIG_PCWATCHDOG is not set
CONFIG_MIXCOMWD=y
# CONFIG_WDT is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_CS5535 is not set
# CONFIG_MFD_ACT8945A is not set
CONFIG_MFD_AS3711=y
CONFIG_MFD_SMPRO=y
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
CONFIG_MFD_MAX597X=y
# CONFIG_MFD_CS47L15 is not set
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
# CONFIG_MFD_CS47L92 is not set
CONFIG_PMIC_DA903X=y
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=y
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
CONFIG_MFD_GATEWORKS_GSC=y
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
CONFIG_MFD_HI6421_PMIC=y
# CONFIG_MFD_HI6421_SPMI is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
CONFIG_INTEL_SOC_PMIC=y
CONFIG_INTEL_SOC_PMIC_CHTWC=y
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
# CONFIG_MFD_INTEL_LPSS_PCI is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
# CONFIG_MFD_MAX77620 is not set
# CONFIG_MFD_MAX77650 is not set
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77714=y
# CONFIG_MFD_MAX77843 is not set
CONFIG_MFD_MAX8907=y
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=y
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
# CONFIG_MFD_VIPERBOARD is not set
CONFIG_MFD_NTXEC=y
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
# CONFIG_PCF50633_GPIO is not set
CONFIG_MFD_SY7636A=y
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=y
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_RK808 is not set
# CONFIG_MFD_RN5T618 is not set
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_PALMAS=y
CONFIG_TPS6105X=y
CONFIG_TPS65010=y
CONFIG_TPS6507X=y
# CONFIG_MFD_TPS65086 is not set
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
CONFIG_MFD_TPS65219=y
# CONFIG_MFD_TPS6586X is not set
CONFIG_MFD_TPS65910=y
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TIMBERDALE is not set
CONFIG_MFD_TC3589X=y
CONFIG_MFD_TQMX86=y
# CONFIG_MFD_VX855 is not set
CONFIG_MFD_LOCHNAGAR=y
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
# CONFIG_MFD_WM5102 is not set
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
CONFIG_MFD_ROHM_BD718XX=y
CONFIG_MFD_ROHM_BD71828=y
CONFIG_MFD_ROHM_BD957XMUF=y
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=y
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
CONFIG_MFD_QCOM_PM8008=y
CONFIG_RAVE_SP_CORE=y
CONFIG_MFD_RSMU_I2C=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM8607=y
CONFIG_REGULATOR_ACT8865=y
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_AAT2870=y
CONFIG_REGULATOR_AS3711=y
# CONFIG_REGULATOR_ATC260X is not set
CONFIG_REGULATOR_AXP20X=y
# CONFIG_REGULATOR_BCM590XX is not set
# CONFIG_REGULATOR_BD71815 is not set
CONFIG_REGULATOR_BD71828=y
CONFIG_REGULATOR_BD718XX=y
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_BD957XMUF=y
# CONFIG_REGULATOR_DA9062 is not set
CONFIG_REGULATOR_DA9063=y
# CONFIG_REGULATOR_DA9121 is not set
# CONFIG_REGULATOR_DA9210 is not set
# CONFIG_REGULATOR_DA9211 is not set
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_FAN53880 is not set
# CONFIG_REGULATOR_GPIO is not set
# CONFIG_REGULATOR_HI6421 is not set
CONFIG_REGULATOR_HI6421V530=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=y
# CONFIG_REGULATOR_LM363X is not set
CONFIG_REGULATOR_LOCHNAGAR=y
CONFIG_REGULATOR_LP3971=y
# CONFIG_REGULATOR_LP3972 is not set
# CONFIG_REGULATOR_LP872X is not set
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=y
CONFIG_REGULATOR_MAX1586=y
# CONFIG_REGULATOR_MAX597X is not set
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=y
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX8997 is not set
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX20411=y
CONFIG_REGULATOR_MAX77826=y
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MCP16502 is not set
# CONFIG_REGULATOR_MP5416 is not set
# CONFIG_REGULATOR_MP8859 is not set
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MPQ7920=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=y
CONFIG_REGULATOR_MT6323=y
CONFIG_REGULATOR_MT6331=y
# CONFIG_REGULATOR_MT6332 is not set
CONFIG_REGULATOR_MT6357=y
CONFIG_REGULATOR_MT6358=y
CONFIG_REGULATOR_MT6359=y
# CONFIG_REGULATOR_MT6360 is not set
CONFIG_REGULATOR_MT6370=y
CONFIG_REGULATOR_MT6397=y
# CONFIG_REGULATOR_PALMAS is not set
# CONFIG_REGULATOR_PCA9450 is not set
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PF8X00=y
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=y
CONFIG_REGULATOR_PV88080=y
# CONFIG_REGULATOR_PV88090 is not set
CONFIG_REGULATOR_PWM=y
CONFIG_REGULATOR_QCOM_SPMI=y
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
# CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY is not set
CONFIG_REGULATOR_ROHM=y
CONFIG_REGULATOR_RT4801=y
# CONFIG_REGULATOR_RT4803 is not set
CONFIG_REGULATOR_RT5033=y
# CONFIG_REGULATOR_RT5120 is not set
CONFIG_REGULATOR_RT5190A=y
CONFIG_REGULATOR_RT5739=y
CONFIG_REGULATOR_RT5759=y
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6190 is not set
CONFIG_REGULATOR_RT6245=y
CONFIG_REGULATOR_RTQ2134=y
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=y
# CONFIG_REGULATOR_SLG51000 is not set
CONFIG_REGULATOR_STPMIC1=y
# CONFIG_REGULATOR_SY7636A is not set
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_SY8824X=y
CONFIG_REGULATOR_SY8827N=y
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS6105X=y
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS6286X=y
# CONFIG_REGULATOR_TPS65023 is not set
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65090=y
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS65217=y
CONFIG_REGULATOR_TPS65219=y
CONFIG_REGULATOR_TPS65910=y
CONFIG_REGULATOR_TPS65912=y
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_WM8400=y
CONFIG_REGULATOR_WM8994=y
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
CONFIG_RC_MAP=y
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=y
CONFIG_IR_FINTEK=y
CONFIG_IR_GPIO_CIR=y
CONFIG_IR_HIX5HD2=y
CONFIG_IR_IGORPLUGUSB=y
CONFIG_IR_IGUANA=y
CONFIG_IR_IMON=y
# CONFIG_IR_IMON_RAW is not set
# CONFIG_IR_ITE_CIR is not set
CONFIG_IR_MCEUSB=y
CONFIG_IR_NUVOTON=y
CONFIG_IR_REDRAT3=y
# CONFIG_IR_SERIAL is not set
# CONFIG_IR_STREAMZAP is not set
CONFIG_IR_TOY=y
# CONFIG_IR_TTUSBIR is not set
# CONFIG_IR_WINBOND_CIR is not set
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_RC_LOOPBACK=y
# CONFIG_RC_XBOX_DVD is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_SUPPORT=y
# CONFIG_MEDIA_TEST_SUPPORT is not set
# end of Media device types

CONFIG_VIDEO_DEV=y
CONFIG_MEDIA_CONTROLLER=y

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
CONFIG_VIDEO_ADV_DEBUG=y
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
CONFIG_V4L2_FLASH_LED_CLASS=y
CONFIG_V4L2_FWNODE=y
CONFIG_V4L2_ASYNC=y
# end of Video4Linux options

#
# Media controller options
#
# end of Media controller options

#
# Media drivers
#

#
# Drivers filtered as selected at 'Filter media drivers'
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_RADIO_ADAPTERS=y
# CONFIG_RADIO_MAXIRADIO is not set
CONFIG_RADIO_SAA7706H=y
CONFIG_RADIO_SHARK=y
# CONFIG_RADIO_SHARK2 is not set
CONFIG_RADIO_SI4713=y
CONFIG_RADIO_TEA575X=y
CONFIG_RADIO_TEA5764=y
CONFIG_RADIO_TEA5764_XTAL=y
CONFIG_RADIO_TEF6862=y
CONFIG_RADIO_WL1273=y
CONFIG_USB_DSBR=y
CONFIG_USB_KEENE=y
CONFIG_USB_MA901=y
# CONFIG_USB_MR800 is not set
CONFIG_USB_RAREMONO=y
CONFIG_RADIO_SI470X=y
CONFIG_USB_SI470X=y
CONFIG_I2C_SI470X=y
CONFIG_USB_SI4713=y
CONFIG_PLATFORM_SI4713=y
CONFIG_I2C_SI4713=y
CONFIG_V4L_RADIO_ISA_DRIVERS=y
# CONFIG_RADIO_AZTECH is not set
# CONFIG_RADIO_CADET is not set
CONFIG_RADIO_GEMTEK=y
CONFIG_RADIO_GEMTEK_PORT=34c
# CONFIG_RADIO_GEMTEK_PROBE is not set
CONFIG_RADIO_ISA=y
# CONFIG_RADIO_RTRACK is not set
CONFIG_RADIO_RTRACK2=y
CONFIG_RADIO_RTRACK2_PORT=30c
CONFIG_RADIO_SF16FMI=y
CONFIG_RADIO_SF16FMR2=y
# CONFIG_RADIO_TERRATEC is not set
CONFIG_RADIO_TRUST=y
CONFIG_RADIO_TRUST_PORT=350
# CONFIG_RADIO_TYPHOON is not set
CONFIG_RADIO_ZOLTRIX=y
CONFIG_RADIO_ZOLTRIX_PORT=20c
CONFIG_MEDIA_PLATFORM_DRIVERS=y
CONFIG_V4L_PLATFORM_DRIVERS=y
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_VIDEO_MUX is not set

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#
# CONFIG_VIDEO_CADENCE_CSI2RX is not set
# CONFIG_VIDEO_CADENCE_CSI2TX is not set

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#
# CONFIG_VIDEO_CAFE_CCIC is not set

#
# Mediatek media platform drivers
#

#
# Microchip Technology, Inc. media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# Verisilicon media platform drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#
CONFIG_VIDEO_XILINX=y
CONFIG_VIDEO_XILINX_CSI2RXSS=y
# CONFIG_VIDEO_XILINX_TPG is not set
# CONFIG_VIDEO_XILINX_VTC is not set
CONFIG_UVC_COMMON=y
CONFIG_VIDEOBUF2_CORE=y
CONFIG_VIDEOBUF2_V4L2=y
CONFIG_VIDEOBUF2_MEMOPS=y
CONFIG_VIDEOBUF2_DMA_CONTIG=y
CONFIG_VIDEOBUF2_VMALLOC=y
CONFIG_VIDEOBUF2_DMA_SG=y
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=y

#
# Camera sensor devices
#
CONFIG_VIDEO_CCS_PLL=y
# CONFIG_VIDEO_AR0521 is not set
CONFIG_VIDEO_HI556=y
CONFIG_VIDEO_HI846=y
CONFIG_VIDEO_HI847=y
CONFIG_VIDEO_IMX208=y
CONFIG_VIDEO_IMX214=y
CONFIG_VIDEO_IMX219=y
# CONFIG_VIDEO_IMX258 is not set
# CONFIG_VIDEO_IMX274 is not set
CONFIG_VIDEO_IMX290=y
CONFIG_VIDEO_IMX296=y
CONFIG_VIDEO_IMX319=y
# CONFIG_VIDEO_IMX334 is not set
CONFIG_VIDEO_IMX335=y
CONFIG_VIDEO_IMX355=y
CONFIG_VIDEO_IMX412=y
# CONFIG_VIDEO_IMX415 is not set
CONFIG_VIDEO_MAX9271_LIB=y
# CONFIG_VIDEO_MT9M001 is not set
CONFIG_VIDEO_MT9M111=y
# CONFIG_VIDEO_MT9P031 is not set
CONFIG_VIDEO_MT9T112=y
CONFIG_VIDEO_MT9V011=y
# CONFIG_VIDEO_MT9V032 is not set
# CONFIG_VIDEO_MT9V111 is not set
CONFIG_VIDEO_OG01A1B=y
# CONFIG_VIDEO_OV02A10 is not set
CONFIG_VIDEO_OV08D10=y
CONFIG_VIDEO_OV08X40=y
CONFIG_VIDEO_OV13858=y
# CONFIG_VIDEO_OV13B10 is not set
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
CONFIG_VIDEO_OV2680=y
CONFIG_VIDEO_OV2685=y
CONFIG_VIDEO_OV2740=y
# CONFIG_VIDEO_OV4689 is not set
# CONFIG_VIDEO_OV5640 is not set
CONFIG_VIDEO_OV5645=y
CONFIG_VIDEO_OV5647=y
# CONFIG_VIDEO_OV5648 is not set
CONFIG_VIDEO_OV5670=y
CONFIG_VIDEO_OV5675=y
CONFIG_VIDEO_OV5693=y
CONFIG_VIDEO_OV5695=y
# CONFIG_VIDEO_OV6650 is not set
CONFIG_VIDEO_OV7251=y
# CONFIG_VIDEO_OV7640 is not set
CONFIG_VIDEO_OV7670=y
CONFIG_VIDEO_OV772X=y
# CONFIG_VIDEO_OV7740 is not set
CONFIG_VIDEO_OV8856=y
# CONFIG_VIDEO_OV8858 is not set
CONFIG_VIDEO_OV8865=y
CONFIG_VIDEO_OV9282=y
CONFIG_VIDEO_OV9640=y
# CONFIG_VIDEO_OV9650 is not set
CONFIG_VIDEO_OV9734=y
# CONFIG_VIDEO_RDACM20 is not set
CONFIG_VIDEO_RDACM21=y
CONFIG_VIDEO_RJ54N1=y
# CONFIG_VIDEO_S5K5BAF is not set
CONFIG_VIDEO_S5K6A3=y
CONFIG_VIDEO_ST_VGXY61=y
CONFIG_VIDEO_CCS=y
CONFIG_VIDEO_ET8EK8=y
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_AK7375 is not set
CONFIG_VIDEO_DW9714=y
# CONFIG_VIDEO_DW9768 is not set
CONFIG_VIDEO_DW9807_VCM=y
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
CONFIG_VIDEO_LM3560=y
CONFIG_VIDEO_LM3646=y
# end of Flash devices

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_CS3308=y
CONFIG_VIDEO_CS5345=y
CONFIG_VIDEO_CS53L32A=y
# CONFIG_VIDEO_MSP3400 is not set
CONFIG_VIDEO_SONY_BTF_MPX=y
# CONFIG_VIDEO_TDA7432 is not set
CONFIG_VIDEO_TDA9840=y
CONFIG_VIDEO_TEA6415C=y
# CONFIG_VIDEO_TEA6420 is not set
# CONFIG_VIDEO_TLV320AIC23B is not set
CONFIG_VIDEO_TVAUDIO=y
CONFIG_VIDEO_UDA1342=y
# CONFIG_VIDEO_VP27SMPX is not set
# CONFIG_VIDEO_WM8739 is not set
# CONFIG_VIDEO_WM8775 is not set
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=y
# end of RDS decoders

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=y
CONFIG_VIDEO_ADV7183=y
# CONFIG_VIDEO_ADV748X is not set
CONFIG_VIDEO_ADV7604=y
# CONFIG_VIDEO_ADV7604_CEC is not set
# CONFIG_VIDEO_ADV7842 is not set
# CONFIG_VIDEO_BT819 is not set
CONFIG_VIDEO_BT856=y
# CONFIG_VIDEO_BT866 is not set
CONFIG_VIDEO_ISL7998X=y
CONFIG_VIDEO_KS0127=y
# CONFIG_VIDEO_MAX9286 is not set
CONFIG_VIDEO_ML86V7667=y
CONFIG_VIDEO_SAA7110=y
# CONFIG_VIDEO_SAA711X is not set
CONFIG_VIDEO_TC358743=y
CONFIG_VIDEO_TC358743_CEC=y
CONFIG_VIDEO_TC358746=y
CONFIG_VIDEO_TVP514X=y
CONFIG_VIDEO_TVP5150=y
CONFIG_VIDEO_TVP7002=y
# CONFIG_VIDEO_TW2804 is not set
CONFIG_VIDEO_TW9903=y
CONFIG_VIDEO_TW9906=y
CONFIG_VIDEO_TW9910=y
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
# CONFIG_VIDEO_SAA717X is not set
# CONFIG_VIDEO_CX25840 is not set
# end of Video decoders

#
# Video encoders
#
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
CONFIG_VIDEO_ADV7393=y
CONFIG_VIDEO_ADV7511=y
CONFIG_VIDEO_ADV7511_CEC=y
# CONFIG_VIDEO_AK881X is not set
CONFIG_VIDEO_SAA7127=y
CONFIG_VIDEO_SAA7185=y
CONFIG_VIDEO_THS8200=y
# end of Video encoders

#
# Video improvement chips
#
# CONFIG_VIDEO_UPD64031A is not set
CONFIG_VIDEO_UPD64083=y
# end of Video improvement chips

#
# Audio/Video compression chips
#
# CONFIG_VIDEO_SAA6752HS is not set
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_I2C is not set
CONFIG_VIDEO_M52790=y
# CONFIG_VIDEO_ST_MIPID02 is not set
CONFIG_VIDEO_THS7303=y
# end of Miscellaneous helper chips

CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_E4000=y
CONFIG_MEDIA_TUNER_FC0011=y
# CONFIG_MEDIA_TUNER_FC0012 is not set
# CONFIG_MEDIA_TUNER_FC0013 is not set
# CONFIG_MEDIA_TUNER_FC2580 is not set
CONFIG_MEDIA_TUNER_IT913X=y
CONFIG_MEDIA_TUNER_M88RS6000T=y
# CONFIG_MEDIA_TUNER_MAX2165 is not set
CONFIG_MEDIA_TUNER_MC44S803=y
CONFIG_MEDIA_TUNER_MT2060=y
# CONFIG_MEDIA_TUNER_MT2063 is not set
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2131=y
# CONFIG_MEDIA_TUNER_MT2266 is not set
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_MXL5005S=y
CONFIG_MEDIA_TUNER_MXL5007T=y
CONFIG_MEDIA_TUNER_QM1D1B0004=y
CONFIG_MEDIA_TUNER_QM1D1C0042=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_R820T=y
# CONFIG_MEDIA_TUNER_SI2157 is not set
# CONFIG_MEDIA_TUNER_SIMPLE is not set
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_TDA18218=y
CONFIG_MEDIA_TUNER_TDA18250=y
CONFIG_MEDIA_TUNER_TDA18271=y
# CONFIG_MEDIA_TUNER_TDA827X is not set
# CONFIG_MEDIA_TUNER_TDA8290 is not set
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
# CONFIG_MEDIA_TUNER_TUA9001 is not set
# CONFIG_MEDIA_TUNER_XC2028 is not set
# CONFIG_MEDIA_TUNER_XC4000 is not set
# CONFIG_MEDIA_TUNER_XC5000 is not set
# end of Customize TV tuners
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_CMDLINE=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_AGP is not set
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DEBUG_MM is not set
CONFIG_DRM_KMS_HELPER=y
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_DEBUG_MODESET_LOCK=y
# CONFIG_DRM_FBDEV_EMULATION is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_AUX_BUS=y
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_GEM_DMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
# CONFIG_DRM_I2C_NXP_TDA998X is not set
CONFIG_DRM_I2C_NXP_TDA9950=y
# end of I2C encoder or helper chips

#
# ARM devices
#
CONFIG_DRM_KOMEDA=y
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
CONFIG_DRM_VGEM=y
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
# CONFIG_DRM_GMA500 is not set
# CONFIG_DRM_UDL is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_QXL is not set
CONFIG_DRM_VIRTIO_GPU=y
CONFIG_DRM_VIRTIO_GPU_KMS=y
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ARM_VERSATILE=y
CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596=y
# CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0 is not set
# CONFIG_DRM_PANEL_BOE_HIMAX8279D is not set
# CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
CONFIG_DRM_PANEL_DSI_CM=y
# CONFIG_DRM_PANEL_LVDS is not set
# CONFIG_DRM_PANEL_SIMPLE is not set
CONFIG_DRM_PANEL_EDP=y
CONFIG_DRM_PANEL_EBBG_FT8719=y
CONFIG_DRM_PANEL_ELIDA_KD35T133=y
CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=y
# CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D is not set
# CONFIG_DRM_PANEL_HIMAX_HX8394 is not set
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
# CONFIG_DRM_PANEL_JADARD_JD9365DA_H3 is not set
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
CONFIG_DRM_PANEL_JDI_R63452=y
# CONFIG_DRM_PANEL_KHADAS_TS050 is not set
CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=y
# CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
CONFIG_DRM_PANEL_NEWVISION_NV3051D=y
# CONFIG_DRM_PANEL_NOVATEK_NT35510 is not set
CONFIG_DRM_PANEL_NOVATEK_NT35560=y
CONFIG_DRM_PANEL_NOVATEK_NT35950=y
CONFIG_DRM_PANEL_NOVATEK_NT36523=y
# CONFIG_DRM_PANEL_NOVATEK_NT36672A is not set
# CONFIG_DRM_PANEL_MANTIX_MLAF057WE51 is not set
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=y
# CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
# CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
# CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
CONFIG_DRM_PANEL_RAYDIUM_RM67191=y
# CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
# CONFIG_DRM_PANEL_RONBO_RB070D30 is not set
# CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=y
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
# CONFIG_DRM_PANEL_SAMSUNG_SOFEF00 is not set
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
# CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
# CONFIG_DRM_PANEL_SHARP_LS037V7DW01 is not set
# CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
CONFIG_DRM_PANEL_SHARP_LS060T1SX01=y
CONFIG_DRM_PANEL_SITRONIX_ST7701=y
CONFIG_DRM_PANEL_SITRONIX_ST7703=y
# CONFIG_DRM_PANEL_SONY_TD4353_JDI is not set
# CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521 is not set
# CONFIG_DRM_PANEL_TDO_TL070WSH30 is not set
CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=y
CONFIG_DRM_PANEL_VISIONOX_RM69299=y
CONFIG_DRM_PANEL_VISIONOX_VTDR6130=y
CONFIG_DRM_PANEL_XINPENG_XPP055C272=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_CHIPONE_ICN6211 is not set
# CONFIG_DRM_CHRONTEL_CH7033 is not set
CONFIG_DRM_DISPLAY_CONNECTOR=y
CONFIG_DRM_ITE_IT6505=y
CONFIG_DRM_LONTIUM_LT8912B=y
# CONFIG_DRM_LONTIUM_LT9211 is not set
# CONFIG_DRM_LONTIUM_LT9611 is not set
CONFIG_DRM_LONTIUM_LT9611UXC=y
# CONFIG_DRM_ITE_IT66121 is not set
CONFIG_DRM_LVDS_CODEC=y
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
CONFIG_DRM_NWL_MIPI_DSI=y
CONFIG_DRM_NXP_PTN3460=y
CONFIG_DRM_PARADE_PS8622=y
# CONFIG_DRM_PARADE_PS8640 is not set
# CONFIG_DRM_SAMSUNG_DSIM is not set
CONFIG_DRM_SIL_SII8620=y
CONFIG_DRM_SII902X=y
CONFIG_DRM_SII9234=y
# CONFIG_DRM_SIMPLE_BRIDGE is not set
CONFIG_DRM_THINE_THC63LVD1024=y
CONFIG_DRM_TOSHIBA_TC358762=y
# CONFIG_DRM_TOSHIBA_TC358764 is not set
CONFIG_DRM_TOSHIBA_TC358767=y
# CONFIG_DRM_TOSHIBA_TC358768 is not set
# CONFIG_DRM_TOSHIBA_TC358775 is not set
CONFIG_DRM_TI_DLPC3433=y
CONFIG_DRM_TI_TFP410=y
CONFIG_DRM_TI_SN65DSI83=y
CONFIG_DRM_TI_SN65DSI86=y
# CONFIG_DRM_TI_TPD12S015 is not set
CONFIG_DRM_ANALOGIX_ANX6345=y
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
CONFIG_DRM_ANALOGIX_ANX7625=y
# CONFIG_DRM_I2C_ADV7511 is not set
CONFIG_DRM_CDNS_DSI=y
CONFIG_DRM_CDNS_DSI_J721E=y
# CONFIG_DRM_CDNS_MHDP8546 is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_LOGICVC=y
# CONFIG_DRM_ARCPGU is not set
# CONFIG_DRM_BOCHS is not set
# CONFIG_DRM_CIRRUS_QEMU is not set
CONFIG_DRM_GM12U320=y
CONFIG_DRM_SIMPLEDRM=y
# CONFIG_DRM_VBOXVIDEO is not set
CONFIG_DRM_GUD=y
CONFIG_DRM_SSD130X=y
CONFIG_DRM_SSD130X_I2C=y
CONFIG_DRM_LEGACY=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
CONFIG_FB_BOTH_ENDIAN=y
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
CONFIG_FB_VESA=y
# CONFIG_FB_N411 is not set
CONFIG_FB_HGA=y
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_GEODE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
CONFIG_FB_UDL=y
CONFIG_FB_IBM_GXT4500=y
CONFIG_FB_GOLDFISH=y
CONFIG_FB_VIRTUAL=y
CONFIG_FB_METRONOME=y
# CONFIG_FB_MB862XX is not set
# CONFIG_FB_SSD1307 is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
CONFIG_BACKLIGHT_KTZ8866=y
# CONFIG_BACKLIGHT_PWM is not set
# CONFIG_BACKLIGHT_DA903X is not set
# CONFIG_BACKLIGHT_MT6370 is not set
CONFIG_BACKLIGHT_APPLE=y
CONFIG_BACKLIGHT_QCOM_WLED=y
CONFIG_BACKLIGHT_SAHARA=y
CONFIG_BACKLIGHT_ADP5520=y
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=y
# CONFIG_BACKLIGHT_88PM860X is not set
# CONFIG_BACKLIGHT_PCF50633 is not set
# CONFIG_BACKLIGHT_AAT2870 is not set
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
# CONFIG_BACKLIGHT_TPS65217 is not set
# CONFIG_BACKLIGHT_AS3711 is not set
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=y
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=y
CONFIG_BACKLIGHT_RAVE_SP=y
CONFIG_BACKLIGHT_LED=y
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
CONFIG_LOGO_LINUX_VGA16=y
# CONFIG_LOGO_LINUX_CLUT224 is not set
# end of Graphics support

# CONFIG_DRM_ACCEL is not set
CONFIG_SOUND=y
# CONFIG_SND is not set
# CONFIG_HID_SUPPORT is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ULPI_BUS=y
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
# CONFIG_USB_FEW_INIT_RETRIES is not set
CONFIG_USB_DYNAMIC_MINORS=y
# CONFIG_USB_OTG is not set
CONFIG_USB_OTG_PRODUCTLIST=y
CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
CONFIG_USB_OHCI_HCD_PLATFORM=y
# CONFIG_USB_UHCI_HCD is not set
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
# CONFIG_USB_R8A66597_HCD is not set
CONFIG_USB_HCD_BCMA=y
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USBIP_CORE=y
CONFIG_USBIP_VHCI_HCD=y
CONFIG_USBIP_VHCI_HC_PORTS=8
CONFIG_USBIP_VHCI_NR_HCS=1
CONFIG_USBIP_HOST=y
CONFIG_USBIP_VUDC=y
CONFIG_USBIP_DEBUG=y

#
# USB dual-mode controller drivers
#
CONFIG_USB_CDNS_SUPPORT=y
# CONFIG_USB_CDNS3 is not set
# CONFIG_USB_CDNSP_PCI is not set
CONFIG_USB_MUSB_HDRC=y
CONFIG_USB_MUSB_HOST=y
# CONFIG_USB_MUSB_GADGET is not set
# CONFIG_USB_MUSB_DUAL_ROLE is not set

#
# Platform Glue Layer
#

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_ULPI=y
# CONFIG_USB_DWC3_HOST is not set
# CONFIG_USB_DWC3_GADGET is not set
CONFIG_USB_DWC3_DUAL_ROLE=y

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_PCI=y
CONFIG_USB_DWC3_HAPS=y
CONFIG_USB_DWC3_OF_SIMPLE=y
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_UDC=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_PCI=y
CONFIG_USB_CHIPIDEA_MSM=y
# CONFIG_USB_CHIPIDEA_IMX is not set
# CONFIG_USB_CHIPIDEA_GENERIC is not set
CONFIG_USB_CHIPIDEA_TEGRA=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1761_UDC=y
# CONFIG_USB_ISP1760_HOST_ROLE is not set
# CONFIG_USB_ISP1760_GADGET_ROLE is not set
CONFIG_USB_ISP1760_DUAL_ROLE=y

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
CONFIG_USB_EMI26=y
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=y
# CONFIG_USB_LCD is not set
CONFIG_USB_CYPRESS_CY7C63=y
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=y
# CONFIG_USB_APPLEDISPLAY is not set
CONFIG_APPLE_MFI_FASTCHARGE=y
# CONFIG_USB_SISUSBVGA is not set
CONFIG_USB_LD=y
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=y
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=y
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_ONBOARD_HUB is not set
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_NOP_USB_XCEIV=y
# CONFIG_USB_GPIO_VBUS is not set
CONFIG_USB_ISP1301=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
CONFIG_USB_GADGET_DEBUG_FILES=y
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
# CONFIG_U_SERIAL_CONSOLE is not set

#
# USB Peripheral Controller
#
# CONFIG_USB_FUSB300 is not set
CONFIG_USB_GR_UDC=y
# CONFIG_USB_R8A66597 is not set
CONFIG_USB_PXA27X=y
# CONFIG_USB_MV_UDC is not set
CONFIG_USB_MV_U3D=y
CONFIG_USB_SNP_CORE=y
CONFIG_USB_SNP_UDC_PLAT=y
CONFIG_USB_M66592=y
CONFIG_USB_BDC_UDC=y
# CONFIG_USB_AMD5536UDC is not set
# CONFIG_USB_NET2272 is not set
# CONFIG_USB_NET2280 is not set
# CONFIG_USB_GOKU is not set
# CONFIG_USB_EG20T is not set
# CONFIG_USB_GADGET_XILINX is not set
CONFIG_USB_DUMMY_HCD=y
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_ETHER=y
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_NCM=y
CONFIG_USB_F_ECM=y
CONFIG_USB_F_UVC=y
CONFIG_USB_F_HID=y
# CONFIG_USB_CONFIGFS is not set

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
# CONFIG_USB_ETH is not set
CONFIG_USB_G_NCM=y
CONFIG_USB_GADGETFS=y
# CONFIG_USB_FUNCTIONFS is not set
CONFIG_USB_G_SERIAL=y
# CONFIG_USB_G_PRINTER is not set
CONFIG_USB_CDC_COMPOSITE=y
CONFIG_USB_G_HID=y
CONFIG_USB_G_DBGP=y
# CONFIG_USB_G_DBGP_PRINTK is not set
CONFIG_USB_G_DBGP_SERIAL=y
CONFIG_USB_G_WEBCAM=y
# CONFIG_USB_RAW_GADGET is not set
# end of USB Gadget precomposed configurations

CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
# CONFIG_TYPEC_UCSI is not set
CONFIG_TYPEC_TPS6598X=y
# CONFIG_TYPEC_ANX7411 is not set
CONFIG_TYPEC_RT1719=y
# CONFIG_TYPEC_HD3SS3220 is not set
CONFIG_TYPEC_STUSB160X=y
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_FSA4480=y
# CONFIG_TYPEC_MUX_GPIO_SBU is not set
CONFIG_TYPEC_MUX_PI3USB30532=y
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
# CONFIG_USB_ROLES_INTEL_XHCI is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
# CONFIG_MEMSTICK_REALTEK_USB is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_88PM860X is not set
CONFIG_LEDS_AN30259A=y
CONFIG_LEDS_AW2013=y
CONFIG_LEDS_BCM6328=y
CONFIG_LEDS_BCM6358=y
# CONFIG_LEDS_LM3530 is not set
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
CONFIG_LEDS_MT6323=y
CONFIG_LEDS_NET48XX=y
CONFIG_LEDS_WRAP=y
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=y
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
# CONFIG_LEDS_LP55XX_COMMON is not set
CONFIG_LEDS_LP8860=y
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_DA903X=y
CONFIG_LEDS_PWM=y
# CONFIG_LEDS_REGULATOR is not set
# CONFIG_LEDS_BD2606MVV is not set
CONFIG_LEDS_BD2802=y
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_ADP5520=y
CONFIG_LEDS_MC13783=y
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_MAX8997 is not set
# CONFIG_LEDS_LM355x is not set
CONFIG_LEDS_OT200=y
# CONFIG_LEDS_MENF21BMC is not set
CONFIG_LEDS_IS31FL319X=y
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
# CONFIG_LEDS_SYSCON is not set
CONFIG_LEDS_MLXREG=y
# CONFIG_LEDS_USER is not set
CONFIG_LEDS_NIC78BX=y
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y
# CONFIG_LEDS_LM36274 is not set
# CONFIG_LEDS_TPS6105X is not set
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AAT1290 is not set
# CONFIG_LEDS_AS3645A is not set
# CONFIG_LEDS_KTD2692 is not set
CONFIG_LEDS_LM3601X=y
# CONFIG_LEDS_MT6360 is not set
CONFIG_LEDS_MT6370_FLASH=y
CONFIG_LEDS_RT4505=y
# CONFIG_LEDS_RT8515 is not set
CONFIG_LEDS_SGM3140=y

#
# RGB LED drivers
#

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=y
CONFIG_INFINIBAND_USER_MAD=y
CONFIG_INFINIBAND_USER_ACCESS=y
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_IPOIB is not set
CONFIG_INFINIBAND_RTRS=y
CONFIG_INFINIBAND_RTRS_CLIENT=y
# CONFIG_INFINIBAND_RTRS_SERVER is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
CONFIG_DMA_OF=y
CONFIG_ALTERA_MSGDMA=y
CONFIG_DW_AXI_DMAC=y
# CONFIG_FSL_EDMA is not set
CONFIG_INTEL_IDMA64=y
# CONFIG_PCH_DMA is not set
# CONFIG_PLX_DMA is not set
CONFIG_XILINX_XDMA=y
# CONFIG_XILINX_ZYNQMP_DPDMA is not set
CONFIG_QCOM_HIDMA_MGMT=y
CONFIG_QCOM_HIDMA=y
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=y
# CONFIG_DW_DMAC_PCI is not set
CONFIG_HSU_DMA=y
CONFIG_SF_PDMA=y
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
CONFIG_DMABUF_HEAPS_SYSTEM=y
CONFIG_DMABUF_HEAPS_CMA=y
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
CONFIG_UIO=y
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=y
# CONFIG_UIO_DMEM_GENIRQ is not set
# CONFIG_UIO_AEC is not set
# CONFIG_UIO_SERCOS3 is not set
# CONFIG_UIO_PCI_GENERIC is not set
# CONFIG_UIO_NETX is not set
CONFIG_UIO_PRUSS=y
# CONFIG_UIO_MF624 is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=y
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_HYPERV is not set
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH_PIPE=y
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_OLPC_EC=y
CONFIG_SURFACE_PLATFORMS=y
CONFIG_SURFACE_3_POWER_OPREGION=y
CONFIG_SURFACE_ACPI_NOTIFY=y
# CONFIG_SURFACE_AGGREGATOR_CDEV is not set
CONFIG_SURFACE_AGGREGATOR_HUB=y
CONFIG_SURFACE_AGGREGATOR_REGISTRY=y
# CONFIG_SURFACE_AGGREGATOR_TABLET_SWITCH is not set
CONFIG_SURFACE_DTX=y
# CONFIG_SURFACE_HOTPLUG is not set
CONFIG_SURFACE_PLATFORM_PROFILE=y
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_SURFACE_AGGREGATOR=y
CONFIG_SURFACE_AGGREGATOR_BUS=y
# CONFIG_SURFACE_AGGREGATOR_ERROR_INJECTION is not set
# CONFIG_X86_PLATFORM_DEVICES is not set
# CONFIG_P2SB is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_MAX9485 is not set
CONFIG_COMMON_CLK_SI5341=y
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=y
CONFIG_COMMON_CLK_SI544=y
# CONFIG_COMMON_CLK_SI570 is not set
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_CDCE925 is not set
CONFIG_COMMON_CLK_CS2000_CP=y
CONFIG_COMMON_CLK_AXI_CLKGEN=y
CONFIG_COMMON_CLK_LOCHNAGAR=y
CONFIG_COMMON_CLK_PALMAS=y
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_COMMON_CLK_RS9_PCIE is not set
# CONFIG_COMMON_CLK_SI521XX is not set
# CONFIG_COMMON_CLK_VC5 is not set
CONFIG_COMMON_CLK_VC7=y
CONFIG_COMMON_CLK_BD718XX=y
CONFIG_COMMON_CLK_FIXED_MMIO=y
# CONFIG_CLK_LGM_CGU is not set
CONFIG_XILINX_VCU=y
CONFIG_COMMON_CLK_XLNX_CLKWZRD=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKSRC_I8253=y
CONFIG_CLKEVT_I8253=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PLATFORM_MHU=y
# CONFIG_PCC is not set
CONFIG_ALTERA_MBOX=y
# CONFIG_MAILBOX_TEST is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_OF_IOMMU=y
CONFIG_IOMMU_DMA=y
CONFIG_IOMMUFD=y
# CONFIG_IOMMUFD_TEST is not set
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

CONFIG_WPCM450_SOC=y

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_PDR_HELPERS=y
CONFIG_QCOM_PMIC_GLINK=y
CONFIG_QCOM_QMI_HELPERS=y
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_INTEL_INT3496=y
CONFIG_EXTCON_INTEL_CHT_WC=y
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PALMAS=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_RT8973A=y
# CONFIG_EXTCON_SM5502 is not set
# CONFIG_EXTCON_USB_GPIO is not set
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
# CONFIG_IIO_BUFFER_DMAENGINE is not set
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
CONFIG_IIO_SW_TRIGGER=y
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
# CONFIG_ADXL313_I2C is not set
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
CONFIG_ADXL355=y
CONFIG_ADXL355_I2C=y
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=y
CONFIG_ADXL372_I2C=y
# CONFIG_BMA180 is not set
CONFIG_BMA400=y
CONFIG_BMA400_I2C=y
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
CONFIG_DA280=y
CONFIG_DA311=y
CONFIG_DMARD06=y
CONFIG_DMARD09=y
CONFIG_DMARD10=y
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
CONFIG_IIO_KX022A=y
CONFIG_IIO_KX022A_I2C=y
# CONFIG_KXSD9 is not set
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
CONFIG_MMA9553=y
CONFIG_MSA311=y
CONFIG_MXC4005=y
# CONFIG_MXC6255 is not set
CONFIG_STK8312=y
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7091R5=y
# CONFIG_AD7291 is not set
CONFIG_AD7606=y
CONFIG_AD7606_IFACE_PARALLEL=y
CONFIG_AD799X=y
# CONFIG_ADI_AXI_ADC is not set
CONFIG_AXP20X_ADC=y
CONFIG_AXP288_ADC=y
CONFIG_CC10001_ADC=y
CONFIG_ENVELOPE_DETECTOR=y
CONFIG_HX711=y
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
# CONFIG_LTC2497 is not set
# CONFIG_MAX1363 is not set
CONFIG_MAX9611=y
CONFIG_MCP3422=y
CONFIG_MEDIATEK_MT6360_ADC=y
CONFIG_MEDIATEK_MT6370_ADC=y
CONFIG_MP2629_ADC=y
# CONFIG_NAU7802 is not set
# CONFIG_PALMAS_GPADC is not set
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_SPMI_IADC=y
CONFIG_QCOM_SPMI_VADC=y
CONFIG_QCOM_SPMI_ADC5=y
# CONFIG_RICHTEK_RTQ6056 is not set
# CONFIG_SD_ADC_MODULATOR is not set
# CONFIG_TI_ADC081C is not set
CONFIG_TI_ADS1015=y
CONFIG_TI_ADS7924=y
CONFIG_TI_ADS1100=y
CONFIG_VF610_ADC=y
CONFIG_XILINX_XADC=y
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_HMC425 is not set
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
CONFIG_ATLAS_EZO_SENSOR=y
# CONFIG_BME680 is not set
# CONFIG_CCS811 is not set
# CONFIG_IAQCORE is not set
CONFIG_PMS7003=y
# CONFIG_SCD30_CORE is not set
# CONFIG_SCD4X is not set
CONFIG_SENSIRION_SGP30=y
CONFIG_SENSIRION_SGP40=y
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
CONFIG_SPS30_SERIAL=y
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=y
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
CONFIG_AD5380=y
# CONFIG_AD5446 is not set
# CONFIG_AD5593R is not set
# CONFIG_AD5696_I2C is not set
# CONFIG_CIO_DAC is not set
# CONFIG_DPOT_DAC is not set
CONFIG_DS4424=y
CONFIG_M62332=y
# CONFIG_MAX517 is not set
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=y
# CONFIG_TI_DAC5571 is not set
CONFIG_VF610_DAC=y
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
CONFIG_IIO_ST_GYRO_3AXIS=y
CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=y
CONFIG_MAX30100=y
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=y
CONFIG_DHT11=y
# CONFIG_HDC100X is not set
CONFIG_HDC2010=y
CONFIG_HTS221=y
CONFIG_HTS221_I2C=y
CONFIG_HTU21=y
CONFIG_SI7005=y
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
# CONFIG_BOSCH_BNO055_SERIAL is not set
# CONFIG_BOSCH_BNO055_I2C is not set
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_KMX61=y
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_MPU6050_IIO=y
CONFIG_INV_MPU6050_I2C=y
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
# CONFIG_ADJD_S311 is not set
CONFIG_ADUX1020=y
CONFIG_AL3010=y
# CONFIG_AL3320A is not set
CONFIG_APDS9300=y
CONFIG_APDS9960=y
# CONFIG_AS73211 is not set
# CONFIG_BH1750 is not set
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
CONFIG_CM3232=y
# CONFIG_CM3323 is not set
# CONFIG_CM3605 is not set
CONFIG_CM36651=y
CONFIG_GP2AP002=y
CONFIG_GP2AP020A00F=y
# CONFIG_SENSORS_ISL29018 is not set
# CONFIG_SENSORS_ISL29028 is not set
CONFIG_ISL29125=y
CONFIG_JSA1212=y
# CONFIG_ROHM_BU27034 is not set
# CONFIG_RPR0521 is not set
# CONFIG_LTR501 is not set
# CONFIG_LTRF216A is not set
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=y
CONFIG_MAX44009=y
CONFIG_NOA1305=y
CONFIG_OPT3001=y
CONFIG_PA12203001=y
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
# CONFIG_ST_UVIS25 is not set
CONFIG_TCS3414=y
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
CONFIG_TSL2583=y
CONFIG_TSL2591=y
CONFIG_TSL2772=y
CONFIG_TSL4531=y
CONFIG_US5182D=y
CONFIG_VCNL4000=y
# CONFIG_VCNL4035 is not set
CONFIG_VEML6030=y
CONFIG_VEML6070=y
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=y
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_MAG3110=y
CONFIG_MMC35240=y
CONFIG_IIO_ST_MAGN_3AXIS=y
# CONFIG_IIO_ST_MAGN_I2C_3AXIS is not set
# CONFIG_SENSORS_HMC5843_I2C is not set
CONFIG_SENSORS_RM3100=y
CONFIG_SENSORS_RM3100_I2C=y
CONFIG_TI_TMAG5273=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_HRTIMER_TRIGGER is not set
CONFIG_IIO_INTERRUPT_TRIGGER=y
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=y
CONFIG_AD5272=y
CONFIG_DS1803=y
CONFIG_MAX5432=y
CONFIG_MCP4018=y
CONFIG_MCP4531=y
CONFIG_TPL0102=y
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=y
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
# CONFIG_BMP280 is not set
CONFIG_DLHL60D=y
CONFIG_DPS310=y
# CONFIG_HP03 is not set
CONFIG_ICP10100=y
# CONFIG_MPL115_I2C is not set
CONFIG_MPL3115=y
CONFIG_MS5611=y
CONFIG_MS5611_I2C=y
CONFIG_MS5637=y
# CONFIG_IIO_ST_PRESS is not set
# CONFIG_T5403 is not set
CONFIG_HP206C=y
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=y
CONFIG_LIDAR_LITE_V2=y
# CONFIG_MB1232 is not set
CONFIG_PING=y
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
CONFIG_SX_COMMON=y
CONFIG_SX9310=y
# CONFIG_SX9324 is not set
# CONFIG_SX9360 is not set
CONFIG_SX9500=y
CONFIG_SRF08=y
CONFIG_VCNL3020=y
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_MLX90614=y
CONFIG_MLX90632=y
# CONFIG_TMP006 is not set
# CONFIG_TMP007 is not set
CONFIG_TMP117=y
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=y
CONFIG_MAX30208=y
# end of Temperature sensors

# CONFIG_NTB is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
CONFIG_PWM_ATMEL_HLCDC_PWM=y
# CONFIG_PWM_ATMEL_TCB is not set
CONFIG_PWM_CLK=y
# CONFIG_PWM_CRC is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_FSL_FTM=y
CONFIG_PWM_INTEL_LGM=y
CONFIG_PWM_LP3943=y
CONFIG_PWM_LPSS=y
# CONFIG_PWM_LPSS_PCI is not set
CONFIG_PWM_LPSS_PLATFORM=y
CONFIG_PWM_NTXEC=y
CONFIG_PWM_PCA9685=y
CONFIG_PWM_XILINX=y

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_AL_FIC=y
CONFIG_MADERA_IRQ=y
# CONFIG_XILINX_INTC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_SIMPLE is not set
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_TI_TPS380X is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=y

#
# PHY drivers for Broadcom platforms
#
CONFIG_BCM_KONA_USB2_PHY=y
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_TORRENT is not set
CONFIG_PHY_CADENCE_DPHY=y
CONFIG_PHY_CADENCE_DPHY_RX=y
# CONFIG_PHY_CADENCE_SIERRA is not set
CONFIG_PHY_CADENCE_SALVO=y
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_LAN966X_SERDES=y
# CONFIG_PHY_CPCAP_USB is not set
CONFIG_PHY_MAPPHONE_MDM6600=y
CONFIG_PHY_OCELOT_SERDES=y
CONFIG_PHY_QCOM_USB_HS=y
CONFIG_PHY_QCOM_USB_HSIC=y
# CONFIG_PHY_TUSB1210 is not set
CONFIG_PHY_INTEL_LGM_COMBO=y
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_IDLE_INJECT=y
CONFIG_DTPM=y
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# Layout Types
#
CONFIG_NVMEM_LAYOUT_SL28_VPD=y
CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
# end of Layout Types

CONFIG_NVMEM_RAVE_SP_EEPROM=y
CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_SPMI_SDAM is not set
CONFIG_NVMEM_U_BOOT_ENV=y

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=y
CONFIG_ALTERA_PR_IP_CORE_PLAT=y
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
CONFIG_XILINX_PR_DECOUPLER=y
CONFIG_FPGA_REGION=y
CONFIG_OF_FPGA_REGION=y
# CONFIG_FPGA_DFL is not set
CONFIG_FSI=y
CONFIG_FSI_NEW_DEV_NODE=y
CONFIG_FSI_MASTER_GPIO=y
CONFIG_FSI_MASTER_HUB=y
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_FSI_SCOM=y
# CONFIG_FSI_SBEFIFO is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
CONFIG_MUX_GPIO=y
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
# CONFIG_SIOX_BUS_GPIO is not set
CONFIG_SLIMBUS=y
# CONFIG_SLIM_QCOM_CTRL is not set
CONFIG_INTERCONNECT=y
CONFIG_COUNTER=y
# CONFIG_INTEL_QEP is not set
# CONFIG_INTERRUPT_CNT is not set
CONFIG_MOST=y
CONFIG_MOST_USB_HDM=y
# CONFIG_MOST_CDEV is not set
CONFIG_PECI=y
CONFIG_PECI_CPU=y
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QFMT_V1=y
# CONFIG_QFMT_V2 is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
# CONFIG_PROC_VMCORE is not set
CONFIG_PROC_SYSCTL=y
# CONFIG_PROC_PAGE_MONITOR is not set
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_FSCACHE is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
CONFIG_RPCSEC_GSS_KRB5=y
CONFIG_RPCSEC_GSS_KRB5_CRYPTOSYSTEM=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_DES is not set
CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA1=y
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_CAMELLIA is not set
# CONFIG_RPCSEC_GSS_KRB5_ENCTYPES_AES_SHA2 is not set
# CONFIG_SUNRPC_DEBUG is not set
CONFIG_SUNRPC_XPRT_RDMA=y
# CONFIG_CEPH_FS is not set
CONFIG_CIFS=y
# CONFIG_CIFS_STATS2 is not set
# CONFIG_CIFS_ALLOW_INSECURE_LEGACY is not set
# CONFIG_CIFS_UPCALL is not set
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_DEBUG=y
CONFIG_CIFS_DEBUG2=y
CONFIG_CIFS_DEBUG_DUMP_KEYS=y
# CONFIG_CIFS_DFS_UPCALL is not set
# CONFIG_CIFS_SWN_UPCALL is not set
CONFIG_CIFS_SMB_DIRECT=y
CONFIG_CIFS_FSCACHE=y
# CONFIG_CIFS_ROOT is not set
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=y
CONFIG_CODA_FS=y
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
CONFIG_NLS_CODEPAGE_737=y
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=y
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=y
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=y
# CONFIG_NLS_UTF8 is not set
CONFIG_DLM=y
# CONFIG_DLM_DEBUG is not set
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_BIG_KEYS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_KEY_NOTIFICATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_INFINIBAND=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
# CONFIG_SECURITY_SMACK is not set
CONFIG_SECURITY_TOMOYO=y
CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER=y
CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING=y
# CONFIG_SECURITY_APPARMOR is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
# CONFIG_INTEGRITY_TRUSTED_KEYRING is not set
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
# CONFIG_IMA is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
CONFIG_EVM_ADD_XATTRS=y
CONFIG_DEFAULT_SECURITY_TOMOYO=y
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,tomoyo,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
# CONFIG_CRYPTO_SERPENT is not set
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
# CONFIG_CRYPTO_XTS is not set
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
# CONFIG_CRYPTO_BLAKE2B is not set
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
CONFIG_CRYPTO_USER_API_RNG=y
CONFIG_CRYPTO_USER_API_RNG_CAVP=y
CONFIG_CRYPTO_USER_API_AEAD=y
# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
# CONFIG_CRYPTO_STATS is not set
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (x86)
#
CONFIG_CRYPTO_AES_NI_INTEL=y
# CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
CONFIG_CRYPTO_TWOFISH_586=y
CONFIG_CRYPTO_CRC32C_INTEL=y
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# end of Accelerated Cryptographic Algorithms for CPU (x86)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
# CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=y
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
# CONFIG_XZ_DEC_ARM is not set
# CONFIG_XZ_DEC_ARMTHUMB is not set
# CONFIG_XZ_DEC_SPARC is not set
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
CONFIG_INTERVAL_TREE_SPAN_ITER=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_DMA_CMA=y
CONFIG_DMA_PERNUMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_PERCENTAGE=0
# CONFIG_CMA_SIZE_SEL_MBYTES is not set
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
CONFIG_CMA_SIZE_SEL_MAX=y
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
# CONFIG_CPUMASK_OFFSTACK is not set
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_32=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
# end of Library routines

CONFIG_POLYNOMIAL=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_COMPRESSED_NONE is not set
CONFIG_DEBUG_INFO_COMPRESSED_ZLIB=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=8192
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_FRAME_POINTER=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
CONFIG_DEBUG_NET=y
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB_DEBUG_ON=y
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
# CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
# CONFIG_DEBUG_OBJECTS_WORK is not set
# CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
# CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_SHRINKER_DEBUG=y
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_DEBUG_KMAP_LOCAL=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=y
CONFIG_DEBUG_HIGHMEM=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
CONFIG_HAVE_KMSAN_COMPILER=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHED_DEBUG is not set
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y
CONFIG_DEBUG_PREEMPT=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
# CONFIG_NMI_CHECK_CPU is not set
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_CPU_STALL_CPUTIME=y
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_LATENCYTOP=y
# CONFIG_DEBUG_CGROUP_REF is not set
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_BOOTTIME_TRACING=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
# CONFIG_FPROBE is not set
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
CONFIG_TRACE_PREEMPT_TOGGLE=y
CONFIG_IRQSOFF_TRACER=y
CONFIG_PREEMPT_TRACER=y
# CONFIG_SCHED_TRACER is not set
# CONFIG_HWLAT_TRACER is not set
CONFIG_OSNOISE_TRACER=y
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
CONFIG_PROFILE_ANNOTATED_BRANCHES=y
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_BRANCH_TRACER is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
# CONFIG_UPROBE_EVENTS is not set
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT=y
CONFIG_SYNTH_EVENTS=y
# CONFIG_USER_EVENTS is not set
# CONFIG_HIST_TRIGGERS is not set
# CONFIG_TRACE_EVENT_INJECT is not set
CONFIG_TRACEPOINT_BENCHMARK=y
CONFIG_RING_BUFFER_BENCHMARK=y
CONFIG_TRACE_EVAL_MAP_FILE=y
CONFIG_FTRACE_RECORD_RECURSION=y
CONFIG_FTRACE_RECORD_RECURSION_SIZE=128
# CONFIG_RING_BUFFER_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
CONFIG_RV=y
# CONFIG_RV_MON_WIP is not set
# CONFIG_RV_MON_WWNR is not set
# CONFIG_RV_REACTORS is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
CONFIG_SAMPLES=y
CONFIG_SAMPLE_AUXDISPLAY=y
# CONFIG_SAMPLE_TRACE_EVENTS is not set
# CONFIG_SAMPLE_TRACE_CUSTOM_EVENTS is not set
# CONFIG_SAMPLE_TRACE_PRINTK is not set
CONFIG_SAMPLE_FTRACE_OPS=y
# CONFIG_SAMPLE_TRACE_ARRAY is not set
CONFIG_SAMPLE_KOBJECT=y
# CONFIG_SAMPLE_KPROBES is not set
# CONFIG_SAMPLE_HW_BREAKPOINT is not set
# CONFIG_SAMPLE_KFIFO is not set
# CONFIG_SAMPLE_RPMSG_CLIENT is not set
# CONFIG_SAMPLE_CONFIGFS is not set
# CONFIG_SAMPLE_VFIO_MDEV_MDPY_FB is not set
CONFIG_SAMPLE_WATCHDOG=y
# CONFIG_SAMPLE_KMEMLEAK is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
CONFIG_FAILSLAB=y
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_FUTEX=y
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
# CONFIG_FAULT_INJECTION_CONFIGFS is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_TEST_DHRY=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
# CONFIG_TEST_BPF is not set
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_DEBUG_VIRTUAL is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

--NfprJpJ10GW0wZHM
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="job-script"

#!/bin/sh

export_top_env()
{
	export suite='boot'
	export testcase='boot'
	export category='functional'
	export timeout='10m'
	export job_origin='boot.yaml'
	export queue_cmdline_keys=
	export queue='vip'
	export testbox='vm-snb-i386'
	export tbox_group='vm-snb-i386'
	export branch='linux-devel/devel-catchup-20230606-235311'
	export commit='df8fc4e934c12b906d08050d7779f292b9c5c6b5'
	export kconfig='i386-randconfig-i013-20230606'
	export nr_vm=300
	export submit_id='64818da70b9a93b7d8a6f669'
	export job_file='/lkp/jobs/scheduled/vm-meta-101/boot-1-debian-11.1-i386-20220923.cgz-df8fc4e934c12b906d08050d7779f292b9c5c6b5-20230608-47064-1538tj0-3.yaml'
	export id='6a5f28e9d4785fd8e36f0a0bf0c58052d16c1268'
	export queuer_version='/lkp/xsang/.src-20230608-090058'
	export model='qemu-system-i386 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='4G'
	export need_kconfig=\{\"KVM_GUEST\"\=\>\"y\"\}
	export ssh_base_port=23400
	export kernel_cmdline_hw='vmalloc=256M initramfs_async=0 page_owner=on'
	export rootfs='debian-11.1-i386-20220923.cgz'
	export compiler='clang-15'
	export enqueue_time='2023-06-08 16:13:27 +0800'
	export _id='64818daf0b9a93b7d8a6f66c'
	export _rt='/result/boot/1/vm-snb-i386/debian-11.1-i386-20220923.cgz/i386-randconfig-i013-20230606/clang-15/df8fc4e934c12b906d08050d7779f292b9c5c6b5'
	export user='lkp'
	export LKP_SERVER='internal-lkp-server'
	export result_root='/result/boot/1/vm-snb-i386/debian-11.1-i386-20220923.cgz/i386-randconfig-i013-20230606/clang-15/df8fc4e934c12b906d08050d7779f292b9c5c6b5/3'
	export scheduler_version='/lkp/lkp/src'
	export arch='i386'
	export max_uptime=600
	export initrd='/osimage/debian/debian-11.1-i386-20220923.cgz'
	export bootloader_append='root=/dev/ram0
RESULT_ROOT=/result/boot/1/vm-snb-i386/debian-11.1-i386-20220923.cgz/i386-randconfig-i013-20230606/clang-15/df8fc4e934c12b906d08050d7779f292b9c5c6b5/3
BOOT_IMAGE=/pkg/linux/i386-randconfig-i013-20230606/clang-15/df8fc4e934c12b906d08050d7779f292b9c5c6b5/vmlinuz-6.4.0-rc2-00010-gdf8fc4e934c1
branch=linux-devel/devel-catchup-20230606-235311
job=/lkp/jobs/scheduled/vm-meta-101/boot-1-debian-11.1-i386-20220923.cgz-df8fc4e934c12b906d08050d7779f292b9c5c6b5-20230608-47064-1538tj0-3.yaml
user=lkp
ARCH=i386
kconfig=i386-randconfig-i013-20230606
commit=df8fc4e934c12b906d08050d7779f292b9c5c6b5
initcall_debug
mem=4G
nmi_watchdog=0
vmalloc=256M initramfs_async=0 page_owner=on
max_uptime=600
LKP_SERVER=internal-lkp-server
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/i386-randconfig-i013-20230606/clang-15/df8fc4e934c12b906d08050d7779f292b9c5c6b5/modules.cgz'
	export bm_initrd='/osimage/deps/debian-11.1-i386-20220923.cgz/lkp_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/run-ipconfig_20220923.cgz,/osimage/deps/debian-11.1-i386-20220923.cgz/rsync-rootfs_20220923.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-i386.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export meta_host='vm-meta-101'
	export kernel='/pkg/linux/i386-randconfig-i013-20230606/clang-15/df8fc4e934c12b906d08050d7779f292b9c5c6b5/vmlinuz-6.4.0-rc2-00010-gdf8fc4e934c1'
	export dequeue_time='2023-06-08 18:45:48 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-meta-101/boot-1-debian-11.1-i386-20220923.cgz-df8fc4e934c12b906d08050d7779f292b9c5c6b5-20230608-47064-1538tj0-3.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-slabinfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper boot-meminfo
	run_monitor $LKP_SRC/monitors/one-shot/wrapper memmap
	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper kmemleak
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test $LKP_SRC/tests/wrapper sleep 1
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper boot-slabinfo
	$LKP_SRC/stats/wrapper boot-meminfo
	$LKP_SRC/stats/wrapper memmap
	$LKP_SRC/stats/wrapper boot-memory
	$LKP_SRC/stats/wrapper boot-time
	$LKP_SRC/stats/wrapper kernel-size
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper sleep
	$LKP_SRC/stats/wrapper meminfo
	$LKP_SRC/stats/wrapper kmemleak

	$LKP_SRC/stats/wrapper time sleep.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--NfprJpJ10GW0wZHM
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--NfprJpJ10GW0wZHM--
