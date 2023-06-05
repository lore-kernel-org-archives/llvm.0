Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4DC137D;
	Mon,  5 Jun 2023 04:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685938754; x=1717474754;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4QQMC1aCikz/ftb+1gcfV7+s6vqu74xUhplppldJmxw=;
  b=QWiH0MHQkkCRIxB1m9poUyuCtpePqzG1Y2g47pcEAOIeN44VKyRDFhr4
   Mp/6PYolqvwx19OZcIS+PlrAMezCX7WRMYb8niQH6vlJa2TUrG6DkPdQn
   5mv04mDRdF2j2viGcXbrA0Vm6B6nKycWySkwueCA/VjmBfsse7NzlFHhX
   7ua1geiRMN5YNtLzKToAExqmNMCb00LOsORglaPwImBoOy8Gld9gEJgVk
   nggD/Ikmq2xTj1An2SjGmrSQE/kojYaZVPXUdhgR8FX8u1r/ZBlix5g5m
   +7xHJJUguavgqgo35J6z8ianE4of0VHrsnvgfJuaYzY/Rutk2BUNYM1if
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="340912162"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="340912162"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 21:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="658928278"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="658928278"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 04 Jun 2023 21:19:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 21:19:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 21:19:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 4 Jun 2023 21:19:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 4 Jun 2023 21:19:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b74tjHvq8iegVHGS3FedQ+yk4A82Yr0C351um8Hao3zQsi1wkb2vn+VcCmpWz1S5TOrYhfNuzcfoTTXbl6u31JJDBxbxsl+och8al7gh63bOe0JQXZ/EAkAq0HfLRobtxBtWYIX9DJf4Fj+0XHcMs+HFIlwUW59jnvGfxY+EDmtyat4HtL+ivwKN9P+NZvT2HShECZQhi3c/MpOxwzxI10HoRowK/dGSWKZatIAyEvyBdD2d0IAWeSChMfXd5eQFwh+Y+m9iyyMCZmWSX2BDm/u1DOzz1ojFzLAgmKbuLD6vZPAxzD25w9hR/Smo5CEc11VbpM2nu66d8ne1Ey4hnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kLJvz+4DCcpeftZnhVZxRQFfwN3K2mxIrkkNzxqiY8=;
 b=dDli5kmmWKZ0asmDgGDgf7hXy29AJ4YtYRx7pwV9a6Fa2BIyWxyoqNWMpIbEAdjchswOQtXfIrVUxl0W8KdxgymlJQtnWV3ps3PlSqNk/bcZtI/1ggxGQpLxTbBTU4u99Vuuv+pwUeI+Xmn6yL6coxBMEX4oNeyw+60DQt177Xxc7jznQuUxIMfS3KSTgdPoBLUp2OmvMHisORfEkBisleZCY6Za8VsKIAtYIDGMGx6LpybX0Q6fO8JK+07PkGOty+t5Dr/14U1GkD84ZOe6IU0MDOQOEPa6EMYbYp1I5tLgAh+9iZ1n/H5BC2sShS5YUJTd2aVAGXBnaJaiSq06+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Mon, 5 Jun
 2023 04:19:11 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::df9c:ac34:f263:aecc]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::df9c:ac34:f263:aecc%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 04:19:10 +0000
Date: Mon, 5 Jun 2023 12:19:00 +0800
From: Philip Li <philip.li@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
CC: Nathan Chancellor <nathan@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Keeping
	<john@metanate.com>, <llvm@lists.linux.dev>, kernel test robot
	<lkp@intel.com>
Subject: Re: [stable:linux-4.19.y 984/6017] ld.lld: error:
 drivers/usb/dwc2/platform.o: contains a compressed section, but zlib is not
 available
Message-ID: <ZH1iNG4IrpA7/hLM@rli9-mobl>
References: <202305251508.iFEInYVW-lkp@intel.com>
 <CAKwvOd=QY_QNWP2+nofvowbCD66noajsY8q1xe-MamV_gF3TPA@mail.gmail.com>
 <20230526152458.GA395537@dev-arch.thelio-3990X>
 <ZHLRexILH7RVNivQ@rli9-mobl>
 <CAKwvOdmBMeOUxAzYu0Q13sGsS6-_cVFBtQsnFgjoSfc_kHE14g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmBMeOUxAzYu0Q13sGsS6-_cVFBtQsnFgjoSfc_kHE14g@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|DM4PR11MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: 729dc771-fa4b-4046-8a7e-08db657c02af
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D8k6Ov4PkDdZqdFHTNARIH3ZNjABX6KrnMGvEkCYADEQAG4yH1nEkIoV3uLBx8X3W71cdRjvmJwSUd2J/DHObj1o5u49sCSrBdRN+i1r0jB9KeSvaPjGueyEMISUmJWmtc9jZPYkQScaUADWw2N2v93N1aS0CvZOiF6MfoXOVolPa2+BVdwPcbyUSNirPMeZjcBdPHt1pX/4mvPoGxEM3Bg3J60qP8+Dx3AEmKD4q5y/BmfrUwfL1lJ3unUXui0YZ7TTCjXq9fVPY+0wrDan5KyjTZ+8a5W4qHy1bHUBo60fg93fCThM+XGWXd13AhHdGzd54TK6hk+oFxR6AK/+ODVRb0JI7Qp7F4OjW3FXrtzaAkGDuLkLB+OVRUOyH8GJ7EzyadW60umvomEfc1J6hl+H0d3mZmaQ44cdcsMLgEXkpsZdZBK8x7DFkKM/XOfYmx7tPV0BpwGisO/mr9A4GtBbGdwSUKxs7D93a9EZa20hqGq+QgYXWpOGZFBoAZ5y7jo59dMyMDQORNysk3RJfZoK2QRjK4BRq6a+ZGazn0w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199021)(44832011)(8936002)(8676002)(5660300002)(33716001)(2906002)(41300700001)(316002)(4326008)(6916009)(38100700002)(66476007)(66556008)(66946007)(107886003)(82960400001)(6486002)(86362001)(6666004)(83380400001)(966005)(478600001)(186003)(26005)(6512007)(54906003)(53546011)(6506007)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjRJSTJFNkZENWVOaHJlazRIeVJmQ0tqeFIzQ0IyUEN3YzgrU2h4V1BzYllO?=
 =?utf-8?B?b2dmYmxlRXB6NzJTYWpzQVR3R1NDUDloK1RGN29NS3hjNG5RYnhwTllYTlJo?=
 =?utf-8?B?ZGdvc1U5ZzRIOHd4QnF3YTJWNEtOc1lRcGJscWVIbWtaMG93UWlCQnpmUzBJ?=
 =?utf-8?B?Rks4T25XMnRjbXJXUW1HTzUvUkxvMDgzY3p1STJzbEJlT1RGaU11cFdvRk9L?=
 =?utf-8?B?Z1JGRlVTZ1kzeGtRdWk3aVY2bW1DVzNYeHdycURDZmtRY0NEdDlGUHJLbS91?=
 =?utf-8?B?U2tqK3Ixai9RQy9SckQyaDc0ZTU5d0o4MzZEZnV4WCtuNG1NVG5WUWpLYk1B?=
 =?utf-8?B?eTQxL0NHNjlpdjlTR2hkME9yZVNtVndkQUxISzd3QzZJYXFMaUFyZCtBeU5N?=
 =?utf-8?B?SDh5Z0Q0V3UxdzhoK2k1WVZLdlQ0KzRjZlVkZzAzcGxnZTU5cFhXNCtJRTVC?=
 =?utf-8?B?YjlOellqV3FLbVZIWE5aMWhKcFB3SHcxdWpLdTVTSkdzUy9ZUHRaNGJZcEs0?=
 =?utf-8?B?WkxtT3RKQU50eVhscm0rRHVtdEswNGd4ODlna1lXelV2YmFzbkJ1KzY3a2ZT?=
 =?utf-8?B?TTVVNUtwc2FVRlhTQWpGMnZhdzZyS1BROThtd2pnNmpHd0lTMW5NWkVRdEpH?=
 =?utf-8?B?N1lKZGd0REJVNi9GNXJBUGpaZmtHTFR2R3VvaTVJc1F5Ry82V1RnbVY2eTEz?=
 =?utf-8?B?MlVNWEN0SlcxUGlndExiSnR2TjhROU5yM2haUXJPMVZtamQ0WXB6d3Fxai9B?=
 =?utf-8?B?QytWQzFWaDRmVkx5KzFyNEZ1UnZDMzhyNG5Ma3B2VFovTUZlOTF2N3NuVzRv?=
 =?utf-8?B?QzBKQmRBeVRKSjF1WWZEUlVnSkExelNWWFlEQk5nUUoyaHNhenJBdmYvNDB0?=
 =?utf-8?B?YlI5Z3dCL081LzllNTBJdWNWRFpLTG9iYjFvNG5IMjNHKzg2RCtkYmYwKzF6?=
 =?utf-8?B?eEhEK05qQy93Ulc4NmV4aXczK0tyWTJSZGRCNHhLNHZRallJL0hGMUk2SjEv?=
 =?utf-8?B?Nks3SFpRb1NqTnU3aUo1enJkQWhzaE9TNkY1cWFNNlJLbGx2aGVYM0ROOGJj?=
 =?utf-8?B?Q0ozRTZkaUZRY1ZaRE9YV0lPYVNZL2RPZWhTVGZkUzdZMDRyUGpTUHAvM0Rq?=
 =?utf-8?B?S1BibEsyYVdPeitWbkwyNDBDVzFOR3ljS3NLY2NXZjR2bElpSFRvbmJUWnJD?=
 =?utf-8?B?Ym0ycmRUMDlhVXMraWZkb29oVlcyMTV6QVdPbmQ5YlR6ZCs3MTRQNUZaV0cz?=
 =?utf-8?B?ZTh6VnRPajdkaWVtRDdqM0M4MjJHN21Gc3pxOHR0NmxFNWdrdUZ0YWxiU2Nm?=
 =?utf-8?B?OTlQUXJwOUZkTmJPWHpLZVhsamswOWVUZ0Z3WHlhRjZRRWN4cFRqWnN3UkxZ?=
 =?utf-8?B?c20rUExSU200ZFRsdDdBQmplL01VM3VPdmtuT1FrWjlnVjBNS04xbllyZ3Vu?=
 =?utf-8?B?aDJHcXMwdU9icFErdExpZlJTTjhObUN3bmJINVQ0L2Q4RTVQL1hhbU4yQUdj?=
 =?utf-8?B?Yi9aajlYTi85SWcvU2V6cnpvU0dLVmpVN043M0w5clJFUXNrQ3FhQk9jbGxx?=
 =?utf-8?B?THdvMDNpTXIyZG5HSk5VWk9PTlQ4cjNjbm00KzF1cXZqd1JoRXNPNW1TVnhL?=
 =?utf-8?B?b2FFeDcvL3hoUzV0VUlXc0wrcnFNU2VEWE1wTHpnYkFwWE1IWlV1eW9wVnpT?=
 =?utf-8?B?bUx5TUdad1c0WDZ3ZWxPSVZQNE54RlpaL3drcmxRYTl3NnpaZjd4dkxYdlow?=
 =?utf-8?B?dmYyRWJwRkRKZXJrK041cXB6VktuTjV2Z3NpTkJybExiY3B0Uk9nZnZENGtl?=
 =?utf-8?B?Z1JRalhaWE9JTkVQY2d2QTVWVE90WStjbzNuWHMwS0xNaFlyazlMdmU3ZlRD?=
 =?utf-8?B?TExQMldGQkJ2Qnl3UktzbTBqcVR5YjBBOTBrb29LTlo3bWpwUURpVkZaeVdi?=
 =?utf-8?B?aThhWlcxZkJqV1F3eUNWS3dzdjE0bDRRRlNQR3E4YXZmZVYyU2tpdTVsTFU2?=
 =?utf-8?B?MnVzRHhxMkZob3ZPZFFoOGVHYUF2bG04S3drenZEcWIrWktkTUZGckNDcmRy?=
 =?utf-8?B?ZUhkOWduM1c5L05uNXFIY1pBZ3Y2V1NtS1RmcThURG9XSTd2MTNQSzAveFZO?=
 =?utf-8?Q?tzpwV/Rf7qBWneRCveHAilZhy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 729dc771-fa4b-4046-8a7e-08db657c02af
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 04:19:10.2283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi7M2iLK3O/wibm1wEgCAij6fscAuxdZbLxJ0SgaVKn7jhqMZwYbvuopOGiCBU8+3skmaJ+k1ekswBdIPq43Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
X-OriginatorOrg: intel.com

On Tue, May 30, 2023 at 10:09:40AM -0700, Nick Desaulniers wrote:
> On Sat, May 27, 2023 at 8:59 PM Philip Li <philip.li@intel.com> wrote:
> >
> > On Fri, May 26, 2023 at 08:24:58AM -0700, Nathan Chancellor wrote:
> > > On Thu, May 25, 2023 at 02:21:24PM -0700, Nick Desaulniers wrote:
> > > > On Thu, May 25, 2023 at 12:44 AM kernel test robot <lkp@intel.com> wrote:
> > > > >
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
> > > > > head:   3f57fb8b1bd06b277556601133823bec370d723f
> > > > > commit: c964b1bbf179a163084b1ec8ad094b8c8dce28c8 [984/6017] usb: dwc2: hcd_queue: Fix use of floating point literal
> > > > > config: x86_64-randconfig-x093-20230524
> > > > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > > > reproduce (this is a W=1 build):
> > > > >         mkdir -p ~/bin
> > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > >         chmod +x ~/bin/make.cross
> > > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=c964b1bbf179a163084b1ec8ad094b8c8dce28c8
> > > > >         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
> > > > >         git fetch --no-tags stable linux-4.19.y
> > > > >         git checkout c964b1bbf179a163084b1ec8ad094b8c8dce28c8
> > > > >         # save the config file
> > > > >         mkdir build_dir && cp config build_dir/.config
> > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
> > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/
> > > > >
> > > > > If you fix the issue, kindly add following tag where applicable
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202305251508.iFEInYVW-lkp@intel.com/
> > > > >
> > > > > All errors (new ones prefixed by >>):
> > > > >
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > >
> > > > Hmmm...that's surprising to see on 4.19.  I didn't add support for
> > > > compressed debug info until:
> > > >
> > > > commit 10e68b02c861 ("Makefile: support compressed debug info")
> > > >
> > > > which landed in v5.8-rc1 and AFAIK was never backported.
> > > >
> > > > I wasn't able to reproduce this with ToT LLVM (clang-17); I wonder if
> > > > this is an issue with clang-14?
> >
> > Hi Nathan, we will double check whether it is clang-14 specific. For now,
> > I use the the reproduce steps which can't reproduce this yet, even by running
> >
> >         $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> >
> > The clang version downloaded by reproduce step is clang-16, which
> > can't reproduce
> 
> Hi Philip,
> Is it possible that perhaps on your test machine that you're
> attempting to reproduce, you have zlib installed, but some of the
> automation machines on which the bot runs do not?

Hi Nick, per further check, both the local test machine and the bot cluster side has
zlib1g/zlib1g-dev installed. But while trying to reproduce by clang-14, we can't reproduce
the issue with clang-14 even in the automation machine now.

We need do more check and comparision for this. And if we have found useful clues,
we will share it out.

Sorry for costing all's time for this report, and thanks for the help and input.

> 
> >
> > $ ~/0day/clang/bin/clang --version
> > clang version 16.0.0 (git://gitmirror/llvm_project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
> > Target: x86_64-unknown-linux-gnu
> > Thread model: posix
> >
> > >
> > > Something I was thinking about yesterday is that binutils has a bunch of
> > > configure flags to control default behavior and one of those is
> > > compressed debug sections on by default:
> > >
> > >   --enable-compressed-debug-sections={all,gas,gold,ld,none}
> > >                           Enable compressed debug sections for gas, gold or ld
> > >                           by default
> > >
> > > Is it possible that the version of binutils that the kernel test robot
> > > uses has compressed debug sections enabled by default for gas? Although,
> >
> > Do you refer to below info? If not, i will check further
> >
> > $ ld --version
> > GNU ld (GNU Binutils for Debian) 2.40
> >
> > $ ld --help | grep -A4 compress
> >   --compress-debug-sections=[none|zlib|zlib-gnu|zlib-gabi|zstd]
> >                               Compress DWARF debug sections
> >                                 Default: none
> >   -z common-page-size=SIZE    Set common page size to SIZE
> >
> > > if I am reading make.cross correctly (linked above), it seems like the
> > > integrated assembler should be used in this case... It would be really
> > > helpful to have the exact make command that the robot used in the report
> >
> > Got it, let us think of this to share the build log, so far, as it contains
> > some debugging/tracing info, we haven't sent it along with the report. But
> > I think at least, we can extract the make command out as first step.
> >
> > > to know for sure. I do not see a similar switch available for LLVM and
> > > even then, I would not expect to see the same issue because we should
> > > not even have the ability to generate a compressed debug section if zlib
> > > was not available.
> > >
> > > > Just tried and could not reproduce.  Has this issue been seen elsewhere?
> > > >
> > > > Ah, we have
> > > >
> > > > https://lore.kernel.org/llvm/?q=contains+a+compressed+section%2C+but+zlib+is+not+available
> > > > https://lore.kernel.org/llvm/20230404161735.GA1703291@dev-arch.thelio-3990X/
> > > >
> > > > So since 10e68b02c861 is in v5.8-rc1, then for 4.14, 4.19, and 5.4 we
> > > > probably want a stable-only patch for -gz=none.
> > > >
> > > > GCC didn't support -gz=none until 5.1, so that might be an issue for
> > > > older branches of stable which might still support older GCC versions.
> > > > 4.19.y still supports gcc 4.6.
> > > >
> > > > ```
> > > > diff --git a/Makefile b/Makefile
> > > > index 71416fde7348..e6754300021c 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -756,6 +756,7 @@ KBUILD_AFLAGS       += -g
> > > >  else
> > > >  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > > >  endif
> > > > +KBUILD_CFLAGS  += $(call cc-option, -gz=none)
> > > >  endif
> > > >
> > > >  ifdef CONFIG_DEBUG_INFO_DWARF4
> > > > ```
> > > >
> > > > Godbolt only binutils v2.27+, but 4.19 supported v2.20+ (so I can't
> > > > check --compress-debug-sections=none assembler support quickly).
> > >
> > > You could do
> > >
> > >   KBUILD_AFLAGS   += $(as-option, -Wa$(comma)--compress-debug-sections=none)
> > >
> > > no?
> >
> > Do you suggest we can do this when using clang-14 to build or even gcc when
> > such issue appears?
> >
> > >
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: drivers/usb/dwc2/core_intr.o: contains a compressed section, but zlib is not available
> > > > > >> ld.lld: error: drivers/usb/dwc2/platform.o: contains a compressed section, but zlib is not available
> > > > >    ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
> > >
> > > Cheers,
> > > Nathan
> > >
> 
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
