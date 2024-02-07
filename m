Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7D325772;
	Wed,  7 Feb 2024 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707301786; cv=fail; b=iS9i4mTfN38SXb/kcv19gdMRiXkLG+uL8UxwW/Bo2vvHrSACZOLYt1lymSESc/RzIEb4jmOLkFOU6pdbbnRj8lpAKfJjTBkFWCDZr0F4d5UQDylo7fOkdIBuHFwSphN4zsku8yY9+9DuO4hBAHTbZtVyQkG5jd0C3ovtVsirtY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707301786; c=relaxed/simple;
	bh=x185XMse7j9J0vQ5CWN6Z7WiquKhwl1png9CiNCaKKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sA74CR55HPpNzdb9vAFWiH1/bHqG96sSIYFFxbIiye3K9kdk6bw6asWUsRWobBsYLf5SDJZOyyLtmIuMG+1Q7XbxkfDvEEmF5YHn2yoiP51NMLCHxQpeVPk4A9JdiU4j1Dy03WYYsusNrejLfY47qxhJwbJ+Dqhlc+XZezxUeD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (1024-bit key) header.d=Sony.onmicrosoft.com header.i=@Sony.onmicrosoft.com header.b=WbfgwaPZ; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=Sony.onmicrosoft.com header.i=@Sony.onmicrosoft.com header.b="WbfgwaPZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvZ0JfN7mXaykdOMbTjORmkPFlYiaAsDtgQxlvtFE2e77uEDfjn9eEu6Qd4cBTnu927tbOVJCSJeYM0kqaE/RjW4qMFOMtLFVwANflg9vHX94dqDXd9v6Q0FxerVPSwWlY35B25INoPPwgb8sLmBIUv1kBuD94WGIHZ2M1SzdQAvFslQYUdzu63/aSDa/iP7hV+gfPXHca2oBoGIbNZqkHFroGsD+ePSJZbwTFinaWtqWI0J5C84ib4AbjwuRBWZapxqClOTl9MwRUEUprXiuT1ubhkms7UHNnA3iJGy6o+ViGmeBX3IoVRUJ/t/K+3O+L+Z60ECOrYo4ND02oCpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhjftIa9SxbB1tLQwhy6m1U4HR4WlAcV7egukUB9VpU=;
 b=cPVYlQCQ4FBVTZ88S4gqf7cq2f6BXqPUWJMdVzOu68XTPKc1rpvrdTNr0N7jeXH/p6d/SOv4OVvidyCfYt+xFJIQCLaaiiSiyea/mUsOp1C7Hnr6QCTzSEsOiddF/5rW4X5bJcLHI+2NnKQ7k6jVdfnKu17EG86HbVW64a95ttr8xEwilpRLrnH8OrEFcXHmFkS0NYr8+C606Vzxb0/ChnfZX4ns26MBT50zHsIwqJ777pJ1vHd7JsYo0ufyEm3C8jUJhXGW4H7wwz+axJgW6MbycFGnMIS3SsMFoNXDZ+m8LLI4gzCsaHgitr1JMSgZkH75hboBelG+CqTCCeInYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 121.100.38.196) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=sony.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=sony.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Sony.onmicrosoft.com;
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhjftIa9SxbB1tLQwhy6m1U4HR4WlAcV7egukUB9VpU=;
 b=WbfgwaPZkEZOPq38Om3/O2A87v3OTRavigVxzEd2uynCjPzFzyhqVutpVo5+xus1itILWJ5u1X2Qw5emFCQtmbB9TWET8e8G5N6c5/BjaPT+3V77/kZi7JKKIz2RCmM+bwYN3v4QLFZaeLBSMeuL7Z0rYC8gul+8f166StqPSYY=
Received: from MW4PR03CA0020.namprd03.prod.outlook.com (2603:10b6:303:8f::25)
 by SN7PR13MB6253.namprd13.prod.outlook.com (2603:10b6:806:2ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 10:29:40 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:8f:cafe::3e) by MW4PR03CA0020.outlook.office365.com
 (2603:10b6:303:8f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38 via Frontend
 Transport; Wed, 7 Feb 2024 10:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 121.100.38.196)
 smtp.mailfrom=sony.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=sony.com;
Received-SPF: Fail (protection.outlook.com: domain of sony.com does not
 designate 121.100.38.196 as permitted sender)
 receiver=protection.outlook.com; client-ip=121.100.38.196;
 helo=gepdcl07.sg.gdce.sony.com.sg;
Received: from gepdcl07.sg.gdce.sony.com.sg (121.100.38.196) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 10:29:39 +0000
Received: from gepdcl04.s.gdce.sony.com.sg (SGGDCSE1NS08.sony.com.sg [146.215.123.198])
	by gepdcl07.sg.gdce.sony.com.sg (8.14.7/8.14.4) with ESMTP id 417ATLWS002203
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 7 Feb 2024 18:29:37 +0800
Received: from mail.sony.com ([43.88.80.246])
	by gepdcl04.s.gdce.sony.com.sg (8.14.7/8.14.4) with ESMTP id 417ATAI9004205;
	Wed, 7 Feb 2024 18:29:10 +0800
Received: by mail.sony.com (Postfix, from userid 1000)
	id 8FEF620C1DBE; Wed,  7 Feb 2024 15:57:40 +0530 (IST)
Date: Wed, 7 Feb 2024 15:57:40 +0530
From: Sreenath Vijayan <sreenath.vijayan@sony.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-serial@vger.kernel.org,
        Shimoyashiki Taichi <taichi.shimoyashiki@sony.com>,
        John Ogness <john.ogness@linutronix.de>
Subject: Re: [tty:tty-testing 28/29] include/linux/printk.h:275:13: error:
 unused function 'dump_printk_buffer'
Message-ID: <ZcNbHNpwnQscX6-J@sony.com>
References: <202402071252.Zj78sTXN-lkp@intel.com>
 <2024020708-unknotted-ceramics-f6ec@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024020708-unknotted-ceramics-f6ec@gregkh>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|SN7PR13MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1f8444-9c08-4ab6-1b0d-08dc27c7b0e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W9Mh4GmuCUCkFy2nzGBBC2a7Nf70Y8GJMLCiV2IEYWq3/Qq6U9DBxWihgDsk9quK48gyQcvMKkI6S/N0nZLweGPcdH/pCNcJIRKOExqvE+LlJUt46HFVEP9AobZrRGFoAflxmSvtWa4TtPYaeRwz721xZFsNSu+XnxFu/vKB5hXS1RPYlaxW5l48mMIugmukuh2ntCgcDBYmLOdZCOlHUXDXhWsjxdbH/L2h3EbqRJdm+UaLHSdT5pkkVIHJ1c+BByxe2pDFEMUDyuZyvQ5TSICH4OAYduf1o2lRwosBZEBNgezNSh2xplm6z0FfF2yySffGm+uRpXryp4R4B2u9mv5ZDu1XUhr+Fc6EGVnbJAwg1MStkQHQxUsAXenUW2yu7w1CXjLFnhTOq8R6o8ympqIw+9vEbyYkpNEGNf+9l+exBA/o7clJ2nyYIxD4lG5B8pQQLCbv7IV5ZnZpJgy6p1Z3fosbZxd4avuX+3abysm9c0casMeujkQVJ63bHFqG5Oniha7rJciIFCTtGUQ8DFONGpEGBS58ELdI9ZoiuYkwOpRxVyVOCcVqZb/H3Zj9Y5uMESwnJe2BZ59Kj+4IqkS3jACwUJbqTrZZEMfoU6bSbvCmnQwUiYce+zkwUJJTj1ag2evlwxfTc2eRpKn/NBzGYdti48As3T5USHg0new1BmlJERDR08QWucAFO1cm2Dj2wBKcEh7c+rIaDGfu+7aY+ygsr6Ba9dwH4MboDp3c1RanXGUxMiCc1Ye6xGM0
X-Forefront-Antispam-Report:
	CIP:121.100.38.196;CTRY:SG;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:gepdcl07.sg.gdce.sony.com.sg;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230273577357003)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(40470700004)(36840700001)(46966006)(2616005)(107886003)(6266002)(26005)(86362001)(336012)(426003)(41300700001)(966005)(5660300002)(2906002)(478600001)(44832011)(54906003)(316002)(42186006)(450100002)(70206006)(8676002)(6862004)(36756003)(8936002)(4326008)(36860700001)(40480700001)(47076005)(82740400003)(81166007)(82960400001)(356005)(83380400001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 10:29:39.3413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1f8444-9c08-4ab6-1b0d-08dc27c7b0e2
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4;Ip=[121.100.38.196];Helo=[gepdcl07.sg.gdce.sony.com.sg]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR13MB6253

On Wed, Feb 07, 2024 at 09:51:42AM +0000, Greg Kroah-Hartman wrote:
> On Wed, Feb 07, 2024 at 12:22:40PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
> > head:   014e10bea593b963574d607faa34e7eaaad3c02b
> > commit: 558367b641b3802572132e7ed865f5eb887c41ea [28/29] printk: Add function to dump printk buffer directly to consoles
> > config: i386-buildonly-randconfig-006-20240207 (https://download.01.org/0day-ci/archive/20240207/202402071252.Zj78sTXN-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402071252.Zj78sTXN-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202402071252.Zj78sTXN-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from lib/test_bitops.c:9:
> >    In file included from include/linux/module.h:13:
> >    In file included from include/linux/stat.h:19:
> >    In file included from include/linux/time.h:60:
> >    In file included from include/linux/time32.h:13:
> >    In file included from include/linux/timex.h:67:
> >    In file included from arch/x86/include/asm/timex.h:5:
> >    In file included from arch/x86/include/asm/processor.h:23:
> >    In file included from arch/x86/include/asm/msr.h:11:
> >    In file included from arch/x86/include/asm/cpumask.h:5:
> >    In file included from include/linux/cpumask.h:10:
> >    In file included from include/linux/kernel.h:31:
> > >> include/linux/printk.h:275:13: error: unused function 'dump_printk_buffer' [-Werror,-Wunused-function]
> >      275 | static void dump_printk_buffer(void)
> >          |             ^~~~~~~~~~~~~~~~~~
> >    1 error generated.
> > 
> > 
> > vim +/dump_printk_buffer +275 include/linux/printk.h
> > 
> >    268	
> >    269	static inline void dump_stack(void)
> >    270	{
> >    271	}
> >    272	static inline void printk_trigger_flush(void)
> >    273	{
> >    274	}
> >  > 275	static void dump_printk_buffer(void)
> 
> Ah, inline was missed :(
> 
> I'll drop these from my tree for now, can you resubmit fixed patches
> with all of the collected reviewed tags?
> 
> thanks,
> 
> greg k-h

Sorry for this. I will soon resubmit fixed patches with all of the
collected tags. Will add the inline as well as fix the kernel-doc
related warning reported in
https://lore.kernel.org/linux-serial/202402070957.NsPz3RBO-lkp@intel.com/T/#u

Thanks,
Sreenath
