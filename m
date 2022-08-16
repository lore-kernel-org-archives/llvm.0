Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7061108
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 14:37:23 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gMxkxNHLCSrgA2h5ZfvMQDnF9E9DxYQJ4YMdBYue69RL01/G1Qtc+UwNc5JzhotKtt5PoUKyUCiLMAj8CDtOnDF664STcYmmOSxt2ifkoESxXFLyxXa23I/lPiU50+c7TrQcdDfAuGCtxPNUX7ZoyOWpza0RGDN67//afSQfe0BRlTrK3Ej75t5BGjhJCxFlbqsMN2yqifl+bY3/YIlH9G1vRSONjTrNzkIB0fvUjf6eXgG3DOZ31ngzsSFMjt8H2ntmYaqTGoSIciSPWzICTjoVIZv0Z2UTqSq3jySK9G+dpwGDDKuWg5ifnFqh0HHAPALzYlwjBN69Bq7rA+Cwdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGQrOcOAgt88ZH354c7M/nIgYTQnQ7kQpWh0JeiV30Y=;
 b=Y7QBpIrBWfY4xrngnnYKEfeY9irSxA82lK9DMM4gXvxMcu9TIx2bZSUJA16Dizwk704gK8hgDgdxqFzIS6/JT90MOx5Rxp2FaYs8gMQTbZNrEJhRJPZkVLJHyZlDFr8TCnAtdyP0dSz0u6nxynPiCe1fAf1eL2xcKVTDF1dQZMU8hXbWOMSk3KVc2IkQZGoauBYFFGv+OAFi4C5O3GTNQSgniyIuy+1359XfWqGAAxYYjdOw1KBSbaD/SZeYCMy4vrVsGcTnZYH5KKfrhYqQqc6FBdhHYKCIbX/2yLctsoZidhMQ9zoJoD/7gEMYNWY0xEQxeT1DJqGzgEQXKFANhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGQrOcOAgt88ZH354c7M/nIgYTQnQ7kQpWh0JeiV30Y=;
 b=iPwKufp8YOn0+l0WkhcN3AiQu3zqVLN4wV2bIHzNgc0D9JZ+KeX2o6tFlYWR2k/KV1OWA/8JNUCP6BhpKeN08KqCx4ueXUD5PfknJ7yVkiejGg27sIWvohZOP80OeoUSemxslxtENCquKke5SOycdESmMlLbMrtleWp1x48DJTQ=
Received: from AS9PR06CA0751.eurprd06.prod.outlook.com (2603:10a6:20b:484::6)
 by AM6PR08MB5287.eurprd08.prod.outlook.com (2603:10a6:20b:b0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 16 Aug
 2022 14:37:19 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::34) by AS9PR06CA0751.outlook.office365.com
 (2603:10a6:20b:484::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.16 via Frontend
 Transport; Tue, 16 Aug 2022 14:37:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Tue, 16 Aug 2022 14:37:19 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123"); Tue, 16 Aug 2022 14:37:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa14830a67c3f499
X-CR-MTA-TID: 64aa7808
Received: from 2303d08cc9ab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1ADE7974-4C52-4492-A6B5-A9664C1780A6.1;
	Tue, 16 Aug 2022 14:37:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2303d08cc9ab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Aug 2022 14:37:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM3STPHEFOb5xEJGiV9CUcSsLbtx4gZ6vDuNMDl4Qlg/pl173vg4AVkn+jYWf/cf3ikDv/Z2mfSyjBZM2l9/EuuByuib+jxO69rYVs+STLIz1gY2WiJub2BsxjFjP68u4pyleil7hNlE8LQGh1l4ZqtLbFN+exBCZ8rQQPvES4SnKMzoweeQKnTwcXOHch9fXkDY5dXgwmexSeJjINC/tWc5bS69Cb1V/ENMJQHMurk/CIwkUWsuQ0Oss82saMfxzCn3oEkYdbwON5GqlFUfGauXeWir2/a8Av5hsflgqyKoN9RRyXo/zkx/IysZtmVZga1Vw8D7BnCMw3Pj1PGPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGQrOcOAgt88ZH354c7M/nIgYTQnQ7kQpWh0JeiV30Y=;
 b=gnByNw8W/Hlyp8emh40X1dJn/efw6th9Oa6i0v6uPsmiukbUDtg/N1TWkShujCNSbPOhfAWYDMO+Uu2xz421IcXAESP+aZwpDd5lolU1amoQfPML9VOPx4Zf8SkyYQzS3acoF08qRW6UXVpyV7oLyIYArhDOMlVGrQ1d4xVARvF1Cx5XhreNXK8TfeOkzVI0TkUQLLAZfoal+tWEhORaoRD89Mm638Y2rE6kaQYNcqKe6S5/2r2KuJO+3gWsCUMhwXjuV2KsaJlRbbMDRqKRNSvG4UwkMkmwFWWFtKEwZzZX7xHBRk1O00AzALgNwN/9vGhvDW12Ege4julxnbZVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGQrOcOAgt88ZH354c7M/nIgYTQnQ7kQpWh0JeiV30Y=;
 b=iPwKufp8YOn0+l0WkhcN3AiQu3zqVLN4wV2bIHzNgc0D9JZ+KeX2o6tFlYWR2k/KV1OWA/8JNUCP6BhpKeN08KqCx4ueXUD5PfknJ7yVkiejGg27sIWvohZOP80OeoUSemxslxtENCquKke5SOycdESmMlLbMrtleWp1x48DJTQ=
Received: from DB9PR08MB6553.eurprd08.prod.outlook.com (2603:10a6:10:25b::15)
 by AM6PR08MB5079.eurprd08.prod.outlook.com (2603:10a6:20b:e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 14:37:10 +0000
Received: from DB9PR08MB6553.eurprd08.prod.outlook.com
 ([fe80::3504:7d41:e86d:7494]) by DB9PR08MB6553.eurprd08.prod.outlook.com
 ([fe80::3504:7d41:e86d:7494%3]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 14:37:10 +0000
From: Andre Simoes Dias Vieira <Andre.SimoesDiasVieira@arm.com>
To: Nathan Chancellor <nathan@kernel.org>, "ci_notify@linaro.org"
	<ci_notify@linaro.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [TCWG CI] Regression caused by llvm: [TypePromotion] Search from
 ZExt + PHI
Thread-Topic: [TCWG CI] Regression caused by llvm: [TypePromotion] Search from
 ZExt + PHI
Thread-Index: AQHYsPY2ELhEWGgbykyWGsnvroZHD62wsTyAgACH8sGAAFfbFoAACDtE
Date: Tue, 16 Aug 2022 14:37:10 +0000
Message-ID:
 <DB9PR08MB655354566AE2AA875B62718C886B9@DB9PR08MB6553.eurprd08.prod.outlook.com>
References: <1465164958.6648.1660602445528@jenkins.jenkins>
 <Yvro06Uid0t0Ou1M@dev-arch.thelio-3990X>
 <DB9PR08MB655357C80DA0779B8D3DA863886B9@DB9PR08MB6553.eurprd08.prod.outlook.com>
 <DB9PR08MB6553BC679E061DFC3B2AE5C7886B9@DB9PR08MB6553.eurprd08.prod.outlook.com>
In-Reply-To:
 <DB9PR08MB6553BC679E061DFC3B2AE5C7886B9@DB9PR08MB6553.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3e525db8-b0de-4200-32bf-08da7f94d2bc
x-ms-traffictypediagnostic:
	AM6PR08MB5079:EE_|AM7EUR03FT033:EE_|AM6PR08MB5287:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QG+jAT37fsxHEJ4oAgPkxVI0BSuaCCo3tumrkUDvKU2MarpNEdOiFH2wK290Y82H4JzkFMPMxqmQo/bskLCv9IfnV+f5R8ziI/gENm7Kfi3D0f1WHpqgQxtrtSDlPlV1PkKmIXVYOux9QMQ4dAYWEbrycoKwcUjl8F+9nZRSgDhT5v2sb77uL749oIrqubAshusZd/+SUCp1nTEBqs+LfS3tOXawOdfe4CcY19tYqz7pZryaV4yeWg8Tknjd1K/nUdcElK2LmoeBFrrgEubbV5dbxMDLxf9lzBs8TjW10KzLPChOloTjAcvnUtmEF7dibCWRJh9VV3j4LTfbYL5lKsu2o5H1wgWSVHK/qmyEQHhI5ayD1lMyucl97GWGD0Peoapj9fGSyhhvfQTWrTOiDqiIq5vlFZ95Q0U+8LQDcZR93f/lEjHykrk71sNppF2hRmZf4PEuQfS9UtZrqSeiKs97N+Bk2qKyo1LYhfL+IZakQ/z9sh9ed96gdBrN1P0QPMSNJolz6EYm2O3tX2nGU1g6Y1qVHWfslvXKokgN5tXVJAUNhM2aJ2vgiscDN1196TQpt1nK/Wi1Mp86cmrktsnGZW4P8uUREXZ1IkR99hZCuSg2nI8692Q8Nn3LGt+aJt0ODaA0l3TqIdA6zueF84IqNzR0ZOwY1EwIrFuhDX3+nSzKoHLAJ/UeYcAD/Xri4pu1RjI9pLxCsn08i/bAhEJKzyNs2EkTXjDDsPWcoq1njNAqrrtd/0TwLwo33ZOfcu762mvIFH4oiLZR9rZpwM4zo/8NwFnRwS5/Ps487K2O1u+Ij5BA2uStt4VgDmaxIpk4GDkImz0e5bBGGnZgwzxfk4X7EpgmDBPsyacd9nHKDOrJUSqW8hgDB+cJl0kl
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6553.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(4326008)(2906002)(26005)(9686003)(2940100002)(7696005)(52536014)(55016003)(8936002)(53546011)(6506007)(86362001)(41300700001)(110136005)(71200400001)(478600001)(966005)(33656002)(38070700005)(83380400001)(186003)(76116006)(66476007)(8676002)(66946007)(91956017)(66556008)(316002)(64756008)(122000001)(5660300002)(38100700002)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5079
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c407dbf-9441-4f05-b928-08da7f94cd59
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X7y2yD2uKc75TlVP2ofHvgD5KxEzXmzfmrr/5n3R8KmoKXma+HfmvnBN/FiVoStQeG6/qFwjRcnyfvFc0nQlOYuY2fjLI2Dq2Lpv2bkhmybh7T8DktgFg4o4/NiovlvEWrgxzNncyC59I/+xz3nfbrNpDGIkSRXba07x0hh7E/lX8+pBGbNL8RV/VdbupReSrDPSqXwTZkfZCApZmiulxk9aFAEM+F5gXx6wCWqu1dHZOpPvbawfQsuD1hzstEjvF7kAUANifeit8m7/5/cAM2i5+5hvgJonhf/zxlbp8NavZYepFz/CJ6Sym9HfKbN9eqF92Ii/0nOYX8RkIAR0FmCGeWZv+1UN7lPHQ3lWkLYX5ND50h6/X0a6/jigdoZGQgo/6//RwmFeDW9CEUiDlw4pZXDtz6934r9MMiVuBXUe/6LUMUIOd+B/Wp0oD6Pe2uaVPKwBCKi5Jm0mgXIoO9qplmJO3SYP5SeWDQBLvIH2lm59xCYhtwSe4XywPrTZUKVqrxnt/PgbRilZN9OVHnsykWSK422jLlRSdEZGyhL8iAvJbpCIH++usfW0FHUZIpJTB9mZ+SzlnMapejjsPDPfZxsiRGrGdUplfO0GEtUaVn4I8iMT0UKhjKN5i9Kpo/0LNlcpnf6taCPFyyeEuBlQj7Xs765UpLC90C4R9qnNZ0GOULOnveyENhzWEFjlzTrQfWKkne/Bbx4RWJ6ov2ZEIokg/74VNrLt4qDa+yfY/rDAo3ymI7HykLcoZvl5T+sqCIFI1BgkBG6ggZXiXvwlReS7K2Q8/2EgGpIFjNKXcnRWjez4L21ogQKrk8hnzutUS+TtafrYgSA1/MWDBsAnGYWhhaZnnclobwKX968=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(40470700004)(336012)(33656002)(6506007)(53546011)(86362001)(26005)(9686003)(41300700001)(47076005)(186003)(2940100002)(966005)(7696005)(478600001)(83380400001)(55016003)(316002)(70206006)(52536014)(82310400005)(40480700001)(40460700003)(8676002)(70586007)(110136005)(356005)(36860700001)(81166007)(5660300002)(4326008)(8936002)(82740400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 14:37:19.3314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e525db8-b0de-4200-32bf-08da7f94d2bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5287

FYI: https://reviews.llvm.org/D131966

________________________________________
From: Andre Simoes Dias Vieira <Andre.SimoesDiasVieira@arm.com>
Sent: Tuesday, August 16, 2022 3:08 PM
To: Nathan Chancellor; ci_notify@linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [TypePromotion] Search fr=
om ZExt + PHI

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
