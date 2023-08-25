Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CCD322B;
	Fri, 25 Aug 2023 19:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzcojxGttXI3WpMwmd1D2FY3xHcD+0eD/ex21C45cZM1zqM5ynh/1OXw4rA1B3Xt+xd4zKHlMw4L4RezZCwGj7injrMVjIfl97cBOZvhjHkI292uvKjrUHI4Kxlja97Hrl08ZDY+P86Z/7LXVL7cIJiAL3qdUGuiGiT24bSXh+bBnYdmiGqeTB8Bk+MXB+QZza3yqAvboeuNZkOmxdOEYUXzUSa5s2yUoVKPrMEzr4PYm68f2hIPTs1FzVGRxCBqRK5/m6ij35VaaxxgxADg5WzLgJhQD/akNQQuMDoTeZ8RNuaL3bFCTAZMgm1Q3WgdtlxAIvuQM7b5s7xlX+674w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRk7cmQuFYvAtqbrwgnGrdRMyiyYzpcibbvfr54ezn0=;
 b=Y4m4Ce7kakyG5nA2XYIUD60FYW0QRRl6lPUPiqWTAkcZR6AY2cIH8uPYKD/L+kjgw9WkuA33ClC/Rmfs9xHfBTIP5G0GyMOjI5zA0WCLNbmQcGG7aijFF/c6fQGTpYM4877y0TMkqI9mesnGlA8JCw7Ns7ps6X4mTD+RwPK+fxhT6U+I3XqmoauVDpo9gwYCIHU/JMMQlwyjiCB73gKGsnG+xJoBpInstKs/2nxuYp2KrME/L4p/6ZY1OEoQVwOoYB4zNSWKKyiAjhKeYe0Se0IhYn0i83I7BgXzCNyuYgIIX51Ape4wX8pFuHkKKIXUsXVCTN8qEFdzKIrim1XZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRk7cmQuFYvAtqbrwgnGrdRMyiyYzpcibbvfr54ezn0=;
 b=Hl3iHrnGst1z5SGp65Ow4qF+mZam9EXyI9idh3JDr2SP+o87mYyP2/+/o+5paJUNrgilA9fzQH6CohGQ0J7ZafA6LVScFeaER1rBNVBHRcWnQ6EWggWbk0pscTU37RF8R2UBq3UNmcHGw/PP1usqT/3p68bLuLgWPmyrLvPYLoPFHR0413C6DxGB5v5oFG5SERQP9Qq5qNmg/fgcxw2pUOKqspdH9EM6FhTFxhRMgaOn8UpseK+LhtVPMOgAV/d+lS20VUyvFxyEh3nLrEcn4sPbKA++NaHp0vbu+tnm6llLMDCNl1CmPy6uW/B/EtyKL69Xm7S27UDq5GAPvp1jvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 19:40:47 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.032; Fri, 25 Aug 2023
 19:40:47 +0000
Date: Fri, 25 Aug 2023 16:40:44 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Yi Liu <yi.l.liu@intel.com>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>, Jessica Yu <jeyu@kernel.org>,
	Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [linux-next:master 3581/12910]
 arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: error: attribute declaration
 must precede definition
Message-ID: <ZOkDvPOt/UMprbU4@nvidia.com>
References: <202308251949.5IiaV0sz-lkp@intel.com>
 <ZOiapxgvLqM1w+DU@nvidia.com>
 <CAKwvOdmoewb30p1yazbkPAEDPhrSN2csngohDiC2fOJ=3Mufng@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmoewb30p1yazbkPAEDPhrSN2csngohDiC2fOJ=3Mufng@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e66b51-9964-4112-4f36-08dba5a32db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pnhq49fGBR2LhIRXJCL4zfSSbHv90uQwzbIcVbPOCMfixxwowvj0Rte9L6w45nYnUriG+AfEqXM+r2Ah/R4kVWFW/VQmyDYP9SkG3VqqkOie/8XPwJHqkYHdo64whYLFbfNWmP9lPWU1rRzo5okYElf3+1IL4cKdnafiQ7FZ4cvUvwEzRruqGDOUt9IFenbFpg0NI3Rb/asz9aw4Q7/oU2Sbm/T3YCYaBWcLoZ0be7zS5hnOgcYwqMOC/92oQUjToV05Ax2l8cUw+FDPB1QI+5XpD0CipNRtcDkO1M3qwmXaf7M/ZlobRl5Iyh/tc3he9qegf7aVAhzTNjzzxrg/x1yvh4kXMcJc3415eSFfQb4eJOerM4beVPu53whiHLcIHZ3+G7u1rnP/8OhPt3UMCf1UQbdpzwGvtQWPovPkYN4InfbSC84lBLdZlFH12FkQOb5zBjuR7NggQ0/3lfhgCqbu2E8qRXAi+ma+wh0Gtt7c4YjYvKQ1V314dZdbbpjY9+Pqd0emDzQo+WYQ2pU+JI4MKG5kkCXvsBL2+IOs7ZCu6VdlKSuu0xhL75zvx48pBaeViGoYB+W39gLklPPMVph60wjKXhEiq3qaEuumdNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39860400002)(396003)(346002)(1800799009)(451199024)(186009)(6506007)(26005)(6512007)(83380400001)(41300700001)(66556008)(2616005)(7416002)(66476007)(6916009)(316002)(2906002)(5660300002)(8676002)(478600001)(8936002)(66946007)(4326008)(6486002)(6666004)(966005)(54906003)(86362001)(38100700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9tYw1gd/15YNhd1tAfbFR8Lv2+OLkp9rlGCyT+qcnwhq+IP5vyv/wWRZXQbz?=
 =?us-ascii?Q?6Xu8z4ev4U2NLeJec89LlL5/ZMzSarv1zXlNmloku75IBFJy0hRRt+Cpacfe?=
 =?us-ascii?Q?0ET0Q+iyESLPqCBb/X1XSInXQfh/nrcB2h+0H76s9T1x/Yh9S+2jOUSKOqyV?=
 =?us-ascii?Q?T0xpkUbyb4IpXVT777FybJNXm007oSNYVZPEosba6Ol11NmACCehGqxNvN1x?=
 =?us-ascii?Q?vRZGVAetclsRUem1xfQM0qtkSWNajIE9i02XHw5S0ohFyadKS7xRMNM8YaPB?=
 =?us-ascii?Q?9Yaa/ij2YajenslWv8Ir1NIdTr4KCZpFZl8Fj8PUGr8MfbUZFKyqQgV2o0rF?=
 =?us-ascii?Q?0/KQzrfixCKTjJnKJalrAAaEjt4eeHd2Kespz8dL9R2EW/8k+efzGuy29bRr?=
 =?us-ascii?Q?Gx/bSx8AkGKh9KAnLi0wxi3aM+xaBay0tOhnO4toD0lgqzRUTUQSrLLNCJRl?=
 =?us-ascii?Q?PAwrzujnzst7aqV1FUCGfRHjwZ6LqqkOiehn3JK5rnacTvNi/xFy+TUeaN7k?=
 =?us-ascii?Q?0bwlhub4cNc1OW+t9OwzXHUlVXrLovBlZHXRQrhyvQp43KsII5+ygg+eBAwn?=
 =?us-ascii?Q?aJiOPnFah7a5dy/xBxP/jSgh9Hf/Nc2+JbOnP3Obb7u3ExdXXgwIS+U7NuHE?=
 =?us-ascii?Q?HuyF9gqYFWZzoGuMnk0rYO8FzlKNjuxdIZOmfg64SrGkx17k4/ChfyNGsjP2?=
 =?us-ascii?Q?+BE4rfOQaPv16KMDFWpAbrAnTul/L+HHTZmTWHWPt2T+r5W/R78revjN8iZC?=
 =?us-ascii?Q?NBcEMQDzC744FLyLHVFAo7BrtbYlWrdAmdOK6pPbGoZp2K8Bx7/V0KY+voL6?=
 =?us-ascii?Q?7f7wiHPykLOKQ+cNGWho0+ijMtqP7F9DxEEnaQmn/3xj17MipBIH0vK0Ie8F?=
 =?us-ascii?Q?PGtd7GBNp52tCfodasMJh12LgCPBNXjteHyCT8HG0OhYvhdXM00fHGskugKC?=
 =?us-ascii?Q?NAgqgdI05lzvfSQULXHiCtWXQI5KMe51Y/p52YfBj+JADGTsY5L/0+dL5GeQ?=
 =?us-ascii?Q?sYXvFiCjxwzR9QJhX5ZIiBwrcuINNQU/UDyIsFGhkrmKl6df03OtqzBONwca?=
 =?us-ascii?Q?/4F/6uwC+Eghv5B2LLIcjiJkQpsWvCyGmNz+OL80NLO+xdDECC47A9OZUEe0?=
 =?us-ascii?Q?Cmk0V95/uyef9pXOBf29yTBt5cFIl8DVZPsYLSYQqv9pxTGeoqJlhbguSIGB?=
 =?us-ascii?Q?j4AIlGO6FQ1/iQy7zTDNiinmtLSrDbNy0EPx6jx5Rulv3EoPwKyTf6dEZEub?=
 =?us-ascii?Q?eH1UxNq1TOL7dGCtIPJ4NHR+JR/43tBtCzgXYGGImz23dZ2WRLkvCSTP/T4g?=
 =?us-ascii?Q?Y5SzFQjtVWSJCFSzzNF3xaxeWlzShL6breF4D6PCxOItkKzkVYbb4V0vBwY8?=
 =?us-ascii?Q?ye6GEzEfBfZ4axFRMaqmj0UdAFvXuNyhQVWD6sfGp8b51dUy0lcACKTqc9CF?=
 =?us-ascii?Q?HQ8WgFcNkVPmb6uavY/MqF2EjIinuZ9wesI5W7OVnvJdZ/JNuXUKzuRih1QM?=
 =?us-ascii?Q?2LTs3Kjg6/SiTnHw8244ZhIa5/pE5LMXZTEENVO/uChN4rztjAG3ZbGdy6v9?=
 =?us-ascii?Q?u61rkHMRt6EtqYmjHfbTV0e+jxfBy8ff7u01+ZKm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e66b51-9964-4112-4f36-08dba5a32db1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 19:40:46.9892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43TJ6WWnUqCLYExgaDPOjL5ghmbFqrH5LLd2kSo4ftwoCSfCOPx0ApBen5iaE50e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381

On Fri, Aug 25, 2023 at 11:49:53AM -0700, Nick Desaulniers wrote:
> I think this example demonstrates a little clearer what's going on:
> https://godbolt.org/z/9d6scv1hE
> 
> So based on the warning, it seems like symbol_get() can only be used
> before the parameter it's passed is defined, otherwise the "weak" and
> "visibility(hidden)" attributes are ignored.  These attributes are
> merge-able upon redeclaration up until the first definition.

No, that doesn't make sense. The macro does:

#define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })

x must be defined for typeof(x) to work.

The commit I referenced explains what this is trying to do, it is
deliberately trying to change the attributes of an already forward
declared function.

It seems to me from your godbolt output that the compiler is refusing
to allow this if the function already has a body. In this case because
it is a static inline. Due to a nonsensical CONFIG combination.

Making a static inline a hidden weak references seems kind of crazy in
the first place. It looks like the hidden was added to make up for
strange things weak does, but I have no idea why weak would be needed
here. It predates the git history.

> If the definition of vfio_file_iommu_group() is visible to
> virt/kvm/vfio.c, do we even need this weak+hidden redeclaration?
> ```
> diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
> index ca24ce120906..b497b762ddba 100644
> --- a/virt/kvm/vfio.c
> +++ b/virt/kvm/vfio.c
> @@ -86,7 +86,7 @@ static struct iommu_group
> *kvm_vfio_file_iommu_group(struct file *file)
>         struct iommu_group *(*fn)(struct file *file);
>         struct iommu_group *ret;
> 
> -       fn = symbol_get(vfio_file_iommu_group);
> +       fn = vfio_file_iommu_group;

Yes, the prototype already exists in all cases. The point is that
vfio_file_iommu_group is usually not an inline.

> But I'll admit I don't fully understand the implications of that
> change.  

Well, it doesn't work for what it is supposed to do at all :)

> Thought that then makes me think that perhaps even better would be
> some sort of Kconfig dependency expressed between
> CONFIG_SPAPR_TCE_IOMMU and CONFIG_VFIO_GROUP.

Yeah, there are different layers. An iommu driver should not depend on
a VFIO symbol..

> Though I do see:
> drivers/vfio/Kconfig
> 7:      select VFIO_GROUP if SPAPR_TCE_IOMMU || IOMMUFD=n

> Perhaps something is wrong with that, and randconfig is able to tickle
> IOMMUFD=n and still set VFIO_GROUP without SPAPR_TCE_IOMMU.

That should be fine..

> $ grep -rn -e CONFIG_VFIO_GROUP -e CONFIG_SPAPR_TCE_IOMMU -e
> CONFIG_VFIO_GROUP .config
> 4678:CONFIG_SPAPR_TCE_IOMMU=y

I think the issue is that:

# CONFIG_VFIO is not set
CONFIG_KVM_VFIO=y

And

kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o

Which is a combination that doesn't make any sense.

Looks like CONFIG_KVM_VFIO should probably be called CONFIG_KVM_ARCH_VFIO

And then

config KVM_VFIO
     bool
     depends on KVM_ARCH_VFIO
     depends on VFIO

(or similar)

So we don't even attempt to compile kvm/vfio.c if we don't have VFIO
support turned on.

> > (BTW does clang actually work on power, I tried it a bit ago and it
> > didn't get very far)
> 
> So it looks like in CI we build+boot test the following configs:
> https://github.com/ClangBuiltLinux/continuous-integration2/blob/32a9db9c4a4b4950407dfceb4bd4c36bf7a6ac4e/generator.yml#L2686
> - ppc44x_defconfig
> - ppc64_guest_defconfig
> - allmodconfig
> - fedora's ppc config
> - suse's ppc config
> 
> I just tried simply defconfig and ran into some hermiticity issues
> with the kbuild rules for their vdso:
> https://github.com/ClangBuiltLinux/linux/issues/1601

That looks familiar..

I just tried again and it seems to have built with a warning:

ld.lld-15: warning: address (0xc000000000000100) of section .text is not a multiple of alignment (4096)

So that's nice!

Thanks,
Jason
