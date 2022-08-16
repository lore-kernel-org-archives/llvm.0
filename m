Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130088.outbound.protection.outlook.com [40.107.13.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660A3D7E
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 14:08:20 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Hh3wRB/fbStodfbKjUx4J+om8bM0Jr9CkJWrI0icFbqaq6JQCgTvLjrDgN740MB6pSKaj1zMrFN/BPGurbP3pc4HLAQ4ywu4DU6ajiT2zRD1auuPpwGOG4k2IUjVRXFtIYT1keWEv+jJP67NoPRUu7juhavrRW2cel541LauSFAswlrDN9my1H7woE0tSSYbxiuW4HF9Ay9dSrbS57jAI4x6zZCc83BzAts9iX6hIh9RBxrcTKxSlAzQgFZcAkgOjKzYABBOrkrFcRVcAIY38i99N6SOKk3ss61ZT199ZOoER48RuP7iMts/G6ttd6Sq/78EZCCZ1f5aZLMdx7HcEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l97OIVzfIcWGOSAg9V9LAEpNNxr2aZv0bCe6CVmJAok=;
 b=D8Q8ss43vdy0HMUe1emWgATTLiwOmayBUcR2ZCokKjVjbzxDi4TAXfOzYF/U2cEQ9Vfa7bk2txwuWQjfwDUd2kRjH+4xyJ210A2/O778D9RlhN5OtQlH2gn5RxK1Rikpk5wThVtppJJA6FlJozAH0idHnvUiyBrxhx0dYfRxpHR2zISTTSUS/FCnOK9dXoU9mmbtyGt5mqjYe4ki2ihdFFySztjyXLJaKzu6kT2U0V252xiL+mZalLnsJnHXsj7KN2MMnFu2h9wp1mAjk2BeTQHGVmqIxcvVAvNXbenSfN9FgsfKhMfmoopm67X3+wiqSrs4hI7r2zNpbQSSpfZ24w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l97OIVzfIcWGOSAg9V9LAEpNNxr2aZv0bCe6CVmJAok=;
 b=Od/edhpL0CoaZH5BG1wPu/zB9iN5EEnz4kAi5gePg88MYaBI5sm976AsnZXmtJEcZhPX0FjEfXsaUUHc3xsaTa31bIUXsLLs6jpiDP2w+pAOMldG55HdTFODbJEOlFgLUH5lbTmPslVcfsQ7GKNkdQiu2LwzIUZpCLnoZ5YVA/w=
Received: from FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::13)
 by DB7PR08MB2971.eurprd08.prod.outlook.com (2603:10a6:5:1c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 16 Aug
 2022 14:08:16 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::23) by FR3P281CA0118.outlook.office365.com
 (2603:10a6:d10:a3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.15 via Frontend
 Transport; Tue, 16 Aug 2022 14:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Tue, 16 Aug 2022 14:08:16 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123"); Tue, 16 Aug 2022 14:08:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f91dd762ccaf0af1
X-CR-MTA-TID: 64aa7808
Received: from aeafc8f3eb55.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 23BE28D3-72CB-4F72-8C9A-76FF373F307F.1;
	Tue, 16 Aug 2022 14:08:09 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aeafc8f3eb55.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Aug 2022 14:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZWKSu3Rx1N6Hk5tWtireGywFRmQHou2BOTrGAN88Hld0SIQd45xt0hQ9mB3vwaWdxUTh+9vJDPIkdnLtdY+BaySDyGBOEG9DbhR4cYrwoYCGKlLa2zX6enbwdMs/H+O2SidFziCJM28pJWEQ7KZQw8oWX94LaGUCTrUM9OJ31KSTRQlhkJ47nwMwg1LPPnHyJAkG+aOBQupLCbjjDFlwQLQO0D3mkAhO9WPgnmU/0EJJvqqTl+GAi/WJ1SDXfH/wDtCsgfC8ryAJPG5tWwfvhqlPlwFi2ZVSbk3k4rkEqNHlgZNU8uYOFLVcOM7a1oJkd+8uCZs4stuKt6tJYU2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l97OIVzfIcWGOSAg9V9LAEpNNxr2aZv0bCe6CVmJAok=;
 b=gDgEZ8z7bS0KxOXQSsEfvFwr1DmGa8aBizvQuWVsbWbErwL+nDs0XnhAUeaHffxNu5UkAJgsZ4xLgmDWrNTPMEwswm4hEzQZ3h9ZdvIYUoc64om8R6LVgp7EqdIJ/tLF84NYTr3zPub4ogAp5j99PGURgvfYuVv//JfHQ3VwkKfFcATtWKR5c6FcsfE/srsMxShuSHvhn4vG6KwLn/qd976Cl3FJDbfqjwwb2pOcqIIQFfES4NJbwj2a/KQEk9U2IXyORh9cDGRthA9ijA6Y5O4ibhZsPZSHRSh9D80AeFIRq6MzMbsk/SXrz1BUlC2l6958X/gUnCClahYZAKui8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l97OIVzfIcWGOSAg9V9LAEpNNxr2aZv0bCe6CVmJAok=;
 b=Od/edhpL0CoaZH5BG1wPu/zB9iN5EEnz4kAi5gePg88MYaBI5sm976AsnZXmtJEcZhPX0FjEfXsaUUHc3xsaTa31bIUXsLLs6jpiDP2w+pAOMldG55HdTFODbJEOlFgLUH5lbTmPslVcfsQ7GKNkdQiu2LwzIUZpCLnoZ5YVA/w=
Received: from DB9PR08MB6553.eurprd08.prod.outlook.com (2603:10a6:10:25b::15)
 by GV2PR08MB8122.eurprd08.prod.outlook.com (2603:10a6:150:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Tue, 16 Aug
 2022 14:08:07 +0000
Received: from DB9PR08MB6553.eurprd08.prod.outlook.com
 ([fe80::3504:7d41:e86d:7494]) by DB9PR08MB6553.eurprd08.prod.outlook.com
 ([fe80::3504:7d41:e86d:7494%3]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 14:08:07 +0000
From: Andre Simoes Dias Vieira <Andre.SimoesDiasVieira@arm.com>
To: Nathan Chancellor <nathan@kernel.org>, "ci_notify@linaro.org"
	<ci_notify@linaro.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [TCWG CI] Regression caused by llvm: [TypePromotion] Search from
 ZExt + PHI
Thread-Topic: [TCWG CI] Regression caused by llvm: [TypePromotion] Search from
 ZExt + PHI
Thread-Index: AQHYsPY2ELhEWGgbykyWGsnvroZHD62wsTyAgACH8sGAAFfbFg==
Date: Tue, 16 Aug 2022 14:08:07 +0000
Message-ID:
 <DB9PR08MB6553BC679E061DFC3B2AE5C7886B9@DB9PR08MB6553.eurprd08.prod.outlook.com>
References: <1465164958.6648.1660602445528@jenkins.jenkins>
 <Yvro06Uid0t0Ou1M@dev-arch.thelio-3990X>
 <DB9PR08MB655357C80DA0779B8D3DA863886B9@DB9PR08MB6553.eurprd08.prod.outlook.com>
In-Reply-To:
 <DB9PR08MB655357C80DA0779B8D3DA863886B9@DB9PR08MB6553.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 534e27f1-4bbe-4670-84e5-08da7f90c3b5
x-ms-traffictypediagnostic:
	GV2PR08MB8122:EE_|VE1EUR03FT048:EE_|DB7PR08MB2971:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oy2xHiJBxDMV/yMvl2Znk3bg2+pbo/eBZ5iI/DBg2aeqdyxInOPvIBv+kVxCfFgVU07NFiIlhALHeM70qstZQddClppcA5ePRkLd/xVoIMuBh8yntMQFWHBNxZagZf9TRoGaKR2ZYAh6PNZktgvimfAvcM5Mibz7DJhZxvJoE+eO9LxQc26HTDnuHLzOnGE467xNyIqD3lxwfp9Gvk2vkbtqZ+y4rqCBHUoNzUilHD4vuDI6mt7rN0l/6+sv7ju6bW2gVbcKJ2ORUr6jPF2fKYHafmtPfqqK0hVtxbbvMFz2y0IjUDilgPwW6t+ekiI0V+9W1pJ4iqHC8X1fdyJ+qjmISoF5KPOI8cmqLPDwpiVLkvIhLA6RzbS/gUEf958JyXiaRHh5Rp2ZJUDAIFrs7XQT453OvaydB/JGE/trJUocY2CXQ6gJbQK9sehqkhaU599o0HN3AGUkMnRyzoUn6iGiwXDemTVauXRIwIWHs9Envtgw3i/kUGU1a9wAcrHYJu7Frl86rjiuAjdwhkf4yQ3vkh9eehk1FgUIbfjkGefoZL5sQbhugXbQJ69TfQWeHUZS8E8z2NIk7cBknyQuDg3klYuunwGEyIbQv07vGu4dk0wq86sluPBolxT4bHrCTNJCWVaRXx0NtyzFsg+71ePZ+q1Ltzp7yQPCTJzFkGkXgzNyMCIDryIU443S6Q3vnZZXgkDwxoOA12S+THDiNa+FoiFQ5siXqli4lmDevssg2563beI+ItR84XmJNDxPRA+rXLYbwIAPJKTBTSMHlXHi/vV1nIEQaGZV/Fwhi6ZwqwjwGWcjEBj4KZz1uJAWAQeExzr7c5Qx/PpDSeVQky7JujdXhXj+zejd723NBwoMpeKaFXQFmZKAvk9xJyGL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6553.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(86362001)(186003)(38070700005)(83380400001)(38100700002)(122000001)(5660300002)(52536014)(66556008)(66446008)(64756008)(66476007)(8676002)(4326008)(66946007)(76116006)(91956017)(8936002)(2940100002)(2906002)(55016003)(478600001)(9686003)(41300700001)(71200400001)(26005)(53546011)(966005)(7696005)(110136005)(6506007)(33656002)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8122
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d59d7353-e323-4103-4e63-08da7f90be4d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PgOJ/KdLVbN5nO1ExLHJfIhj+vh5FyWEJJEk8Ue7i1zidCXBr3+NXRyJaXhjMNaTXTV3FAipdesXquaobvgJsFK3KwJtN9AGIOTuypbagpF5qcj0BWGvmv9a+INbrYwJms07ZJKS7T+0CZ/j/q6PjW5GW6GA4o7jnG6u63q4WCXmffnF8/XeG2P3ENMTkZhjcRfw90CD9S8yDv/x8m0eeiIDTuq4fXior9aRMB3bk8YX1fmiSedu5VVvh/IP3ewsGd5fXgTYkqmHnXOPT6L3UMqIAG/XRyoHpV3OQViRUNCeQjc9oxPxmXSO3MQvHn5nzOy+q519RfA+QiW2NiDhqE/3ll9JOvCxVoMovuY6vXMWbakmCh6SMcU1sFVBpCUghDNYdVqY93uoKw8hulyeFYVptvTg7Noi75ZvvnFnBuH0/eyExRBGDqLhM/vrGD4h6CCe4fEJUXYhcz5McRaATTdJXwE+A1mRllkx8ug4yu+hmsG0rYMaf+x3tgqReCRocA9MU5fvlStHKBcsHu52hHUuXbi/pvOW8UyFOp8/KDFmXs/KzHNG4qTmU3OMV3lpc0l/Rm07UjFXqqj3fBBh0pS1cE4PUkkQ4nzPW/p4PQqys0zzTj88PK2vM/0AxDdTayAy0TWzAcGOSEN4EDC4WbyXgw1k8FGfgrifoRi+qb6fZE8XiKThCBbcOs6x9BoUK9P2Yc9+RYG9qL95D4Y1gGewJf2He8LMr2BFdVmI0iHg4gObsR88YIQIyrb6QGRjtUoZkBSFo7C2K15ZdtfXCuzbB2uOCUhaqx+M4lECu/elBfo/CeN07sXXsqiK59gt9DM2kqfjgEVkNs2moKG33pTsCGDXYrFnOetEuXR8C1BoF0eEWyxkyW2lqjKmEl6I
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(376002)(36840700001)(46966006)(40470700004)(86362001)(26005)(478600001)(7696005)(9686003)(33656002)(53546011)(6506007)(2940100002)(47076005)(186003)(336012)(41300700001)(966005)(83380400001)(40480700001)(82310400005)(55016003)(70206006)(8676002)(70586007)(316002)(4326008)(81166007)(40460700003)(110136005)(36860700001)(356005)(5660300002)(52536014)(82740400003)(2906002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 14:08:16.0724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 534e27f1-4bbe-4670-84e5-08da7f90c3b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2971

Yeah that is my bad, I should have checked that the PromoteWidth is not lar=
ger than RegisterBitWidth. I'm testing a patch and will post a fix today.

Kind Regards,
Andre

________________________________________
From: Andre Simoes Dias Vieira <Andre.SimoesDiasVieira@arm.com>
Sent: Tuesday, August 16, 2022 9:52 AM
To: Nathan Chancellor; ci_notify@linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [TypePromotion] Search fr=
om ZExt + PHI

Hi Nathan,

I'll have a look thanks!

Kind Regards,
Andre

________________________________________
From: Nathan Chancellor <nathan@kernel.org>
Sent: Tuesday, August 16, 2022 1:46 AM
To: ci_notify@linaro.org
Cc: Andre Simoes Dias Vieira; llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [TypePromotion] Search fr=
om ZExt + PHI

On Mon, Aug 15, 2022 at 10:27:24PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [TypePromotion] Search from ZExt + P=
HI:
> commit 164067918725d1ee8875e38213b6aee9be13383e
> Author: Andre Vieira <andre.simoesdiasvieira@arm.com>
>
>     [TypePromotion] Search from ZExt + PHI
>
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 6329
> # First few build errors in logs:
> # 00:12:33 ld.lld: error: undefined symbol: __aeabi_uldivmod
> # 00:12:33 make: *** [Makefile:1208: vmlinux] Error 1

I noticed this towards the end of last week too:

https://github.com/ClangBuiltLinux/linux/issues/1688

I added some reduced reproducers to that thread. As I note in the
original post of that issue, I am not sure if this error is a standalone
problem or one that comes from another problem we are actively dealing
with:

https://github.com/ClangBuiltLinux/linux/issues/1666
https://github.com/llvm/llvm-project/issues/56153

Cheers,
Nathan
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
