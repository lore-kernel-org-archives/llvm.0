Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023078.outbound.protection.outlook.com [52.101.83.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8DE5B206
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731124; cv=fail; b=eGMnUKtyYhOZ3PJYUSUqeg2Tk63+W0GyAA3pgSc0v4Kf/qXs/iZqIM1CLZWYVABCfXOkukh6GqxUUjufps3EJyZM+lxmKdJHH/2gwEsAz5tfutf0n5APnh647PVccv/TNeCzlvrfXfC0URawdZus+IdjNAAFNiFklOmJGJRZXhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731124; c=relaxed/simple;
	bh=I+yiB5VNxEOi6ds+epJI11slitDITuSFVbVoLQqtYuE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uv5jX7ya6AOPhfFAGuvYvvLb+mGPorUmm9pO4a+HXsoBli+zRBccslx7Gtd+fWyDMt9iL4Rp+PbSuulotbsUrzUJmgavJcyS7oug267973h2Rnvd2RYpWs7559K+GL6B9Y6u7IiJmr9LV9P9Xp0pW52/winhBSXY+KLwGvk1y1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=I8/cu4VP; arc=fail smtp.client-ip=52.101.83.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="I8/cu4VP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jo4g6WHOo0zr/dfNzhhKPcb6M8L+zUSWxJHLuwWdHhMpCkn0Tl1vSZDQD0x/M/YA9v04euDEghkjoHpHvWCmPv6IKL7YwPQeT1VS98Suw6hihE5kU6iaAxxqD4z9RQU4DD/IsfOz9GS9orY/9eoIvj6dlb9YNozRPctw5jjK6IdBS4UIGpIkPsnRuaEV4gdd7wEbf63YEp4hndyH27NMx5cUmdrWLoovNaYyY/QONAxJyHosImQOiT7TYA76V6J3GPQ9Pu56JAlqaikXAVF802UcMMAHYE76DWBcLyT8fGMlkANfUyC0f71LWRoajlkWM97vUBbbR9Vz6yDRaFAkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQlhkdfz1gzFxtyTszpHIEYekI6iOreTEo0QTFnvBXg=;
 b=PHcTPxl2BaPAjOLw1tyxp78n6QY9O+7GJet6KuD375H6tGOL2UJ2UonLVSjMM+RrXvU7Uo/mm2LxDznKcvFAWTmZ55ASE4xM46JDVSzJc74+Kamkbm2jRELMrh5HBYJcXXauGdv7/wcwd8QuxWNbsQk5ieSadcmqgaT+DQC3Oo548KeG99N6Vu4TgAtIdpOEQwxd/+TMCY3ugi0AtwZCIlc3iiH6jZJN6z7n356zdjzdo61h6Ak3l4a5fcRk93NmKJWEjKiXZET77e5aUaI1tn97/mqWyiZNwWZJcbYmi7CCSpM3Eov4Tg1je8ThwEpI/EcA78X0OVvVEiqHvbqbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQlhkdfz1gzFxtyTszpHIEYekI6iOreTEo0QTFnvBXg=;
 b=I8/cu4VP/+vI4XG9y7wu4+EKIF9noNMIOEqB0X3tg0R4NWUW6mvkfo4m4xhXwWU6aZioDCCQBdztekQuPzVMq9USV6YJOVu9gjHvSSRBtrzO75dqu/TmO6d6LY5Uhv6HufY3jdOsxvT/7BnIOpfFzDc65XzRlqyGbff/DNR8i1BWleMDVtWCVVahTLXPg12H2Ek99cSHv8iq0uB3M7cX4CYgx+fuIKxO9MOrWNgHN6uiwAfMe3bVZ0pMwbkeSznKdwTCQDMIVLNootZY8Vl9b/Q2gfUTfGXQcppm+sEJyFrpqwranRaOQu0qWZrGQmf9Gg5hiPUHC1rXrNWJSUSkSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by AS8P195MB1978.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:548::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 11:31:55 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0428.008; Fri, 18 Sep 2026
 11:31:53 +0000
Message-ID: <bbf069ba-2942-4c89-86ed-444fb6f9ff08@phytec.de>
Date: Fri, 18 Sep 2026 14:31:48 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/9] arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F
 memory region size
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>,
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Stefano Radaelli <stefano.radaelli21@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>,
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
 <20260918-topic-am62a-ioddr-dt-v6-19-v9-1-40972ef1f663@baylibre.com>
From: Wadim Egorov <w.egorov@phytec.de>
Content-Language: en-US
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-1-40972ef1f663@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:10:110::38) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|AS8P195MB1978:EE_
X-MS-Office365-Filtering-Correlation-Id: b97059ab-ba51-4664-b8cd-08df15787071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|921020|4143699003|3023799007|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xX0CFGCju9e4Ac/RH6UgOp/Vf1W1KP4oTMYlgD8pAwgnZAvfnD5ptDU8EKZsxAro991CaGA11e9HGSpgwILneQG08NDHiaSSCMxiLwT9dpxua4STkNxJYEK+ppLrA5kbUqaGZHptOacrA5OTTjxcA7E90ph0V3fEp42puMxIkan2dAwBjzMi1BKcebUphOiQcClkl9Hy7csDHaxC/QVh5J/55wgo8HHnG67qc2picd7AQhuMlYhozr4Ll0CqTFY1nElzgy9uWRHG/QCgiou2CGSCKgJ8bpj9+tzA60TmMNxsFfpQGgqwzQfbMyP/ZC+6juawTJ3YVUX+NoVCx36K4MYggzNkh1UoepDRjkNX/l8HhaIB1iBlJsrdtPXWltLuv4l/q23QmUwXii7f543wmFt0fpSyQ/QbRMYwdyMbVGkfbLrOYqBLpkrI+7xBCm1TXvhgm5gJa5jX4fvHkr9XN6xBNcSn2t1mBXGA77dQcYu5JQhaZPWaRcZimiWfKFDPqKxB/NjgaHri95prgeuWyk9WpqKffZGG+Mv74H/H3vq8VYVb0/brw+ND8n5uYEbBtdMp7CVmR7fDLpc74ArPCq2NwxZFQcU1s7BbNPIw130vyuMimLtfGSbOZKxzn2FTlRBN9n1SeHWKPrbzcNS1SzNZSLtmHwN2NPPQ4uuyDwc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(921020)(4143699003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFhnbjQ5VDFQQlg5eFJuYnY2MVhSLy9KdUJtekMraWdIQ011SElNWWNlWUNw?=
 =?utf-8?B?T0JydjF1em9IbFo5L3IybmlBSHY3anVLYldFUkhpTitaOWd2UUVETjgwTnVO?=
 =?utf-8?B?V255ZXBKVG8xVStZNEd5MDFXbVI3QUs3Vi9tbzJVZEJPUlVNMDRxQ0FEd3RQ?=
 =?utf-8?B?VE5GVFdPRHFBaCtHVFdGSUd1azNEaXoxYjZBQXk4NlFTVStqcm5xbWE4Nk4w?=
 =?utf-8?B?aDBJL0pGd3RHRXM3ZXhyT0c0V2dCTXZyN2MvM1RlZVhRNUpxTmJ3V1JCMDdi?=
 =?utf-8?B?RzhzNjhqWi84SndtWDBmcVhJek1wK3p0MW9FczExQnBXSVBBOTlmQ3FhMGhE?=
 =?utf-8?B?ZVlueEZZb2lXc1MvK1JmdG12Qlh6cmh4NlN5VEhyTFpLZ0NkMlB0RVd3R3J0?=
 =?utf-8?B?RmdrR1NxK0svZitDYjFMK3MwOFFwMjMxY01CUEVHQmZHN3lDSm1ydlViVUlG?=
 =?utf-8?B?dnhDYmxkeU1rZnRxL243NVVKRTNUV2ZCYWhKaGlHV3lNUEk3S0lYOTF1OFZj?=
 =?utf-8?B?cTU0dDBzREtaaHJINmhxbXZ2aGtNenN3eC9QNi9TNDZQanpILzc3V1dmVjIr?=
 =?utf-8?B?UC84MEJCcERPRC9CdGVBK1pwMnBkcHVqR1VMbERwc1RKbUd5bTlvQkZLWklz?=
 =?utf-8?B?Qld1TEV4VFBhY3RheTRtV0ozcnFGcUE2TSt1ZWVPQVNjZnJtWWNocXVKZk5m?=
 =?utf-8?B?ZUZyVkllOUR4QjQzTTRFaWxPUnBNbExFZ2w4elRONUVwQnZTdk0yQmpRZTkx?=
 =?utf-8?B?b1NNMWpmdEgxdmNYQVFnZU5UcWpZYmNqdUoxT3lsODg5cG0ybERpT1N3SEh4?=
 =?utf-8?B?cCtqdktCKzhzSXVtdzdTeDNBQVpNWVlXZXpvWU5JSUQ1V1VtM2hqMldvSlpt?=
 =?utf-8?B?bEh0YUFqa2RVMDBTYzE2Y29rNWEzR3laV2JmVGFIUmY4ckdHVG9XaDNvdFNz?=
 =?utf-8?B?YVdtaVAyR1pUTU9RalJjU2pvN0oxRTdoZThxczJic0l0ZnFBVi9FU3ZwcGRY?=
 =?utf-8?B?QmV0NEpSSzNFMERxTFFxVTc0endmZFZqYUN6SC96V2h3UHUwbXFxT2gyMTJl?=
 =?utf-8?B?SFRZZmJiSzJ2R1h3OFdBSE5hQ0VWRWQxcXdYcnloVXFiUThwRWlIWFhwRlZR?=
 =?utf-8?B?Sm1MNk5saXQ5N1NZZGpNWkIzcXYxVnhSUUVDV0tLblVwcWUzYTNEd2d1SHZr?=
 =?utf-8?B?WHZKUjA0b01Ed0hrbzZWSWUvUHZ0bHJzVVNkNXlvK3Y0WHFIaXVHYkR3ZjB4?=
 =?utf-8?B?VkdyT0pwMGZRellmcXBYdml1NVFENGhaN2ZCcU9iOEhHSGdwOUhHS2NJYzI5?=
 =?utf-8?B?MXBSQmRabkQxbENhUkFLWmlPOXV0YXdqUVM0SU1nRk9rSDc5ODFyTDdWTEFu?=
 =?utf-8?B?Um1ZQjVJUU5hQ283eHdiRXpjRFhjTS9TWUJrbGZiTTZkVFdKZUxMTzVtNW42?=
 =?utf-8?B?MEZJMFRRWDF0SWNYSFFGUTQ0Tlp5VG43K0ZNalpOaXFpSU5RQmlTWTdqL2NJ?=
 =?utf-8?B?M1NQUmI1Z0ZvaFcydW5WNGZVK0VwZTJQTkJ2TXV4YTE0M2dnQTkrWW9KbjZE?=
 =?utf-8?B?KzU3QUhpZ21WQ01PMmwwUUMzdmpLRnN1ZXY2b3c2RlFMbWhoT2k2YUVnNHM4?=
 =?utf-8?B?WHYwSEZTb2c3YzZjR3p5Y2ZxODhzazZUZXoyQ0w2dkM5bFFyRE43d2pKTUM0?=
 =?utf-8?B?SGdFVFR5ZWtNN2MrRXRmMW5rejVJUnRsV0V2ZXB1RHdrbTk1cmFRL0huZUM4?=
 =?utf-8?B?bHU4UHY0bVRob0h4dW4xa08vUmR1dTNKNUhJdUxGK2JnNnNlQUVNaHpXeEU2?=
 =?utf-8?B?SjF3MitteHBkVVBSUEV3cmFZTHVkZ0x2SWJmQWEzVW1PRlcxUWFRenlSQVFT?=
 =?utf-8?B?b1RyMFJhN0t5bVg4cjFZeDZMaHN2MHlBUnZvclQ2b1NLaklRZGFSY0RBNzdq?=
 =?utf-8?B?aTBOWVRXNGF0cW1Wa2pab0s2WVNiYTh1Y0ZkYVdFTFBsWElHWk5FOHVMT3h1?=
 =?utf-8?B?T29hWTEyRDkrNExaVHNPSENMR1kwalJCSlRGd0Joc3hJTml5SlZvSzlWK01V?=
 =?utf-8?B?YS8wbjB6cnA2dmhmeE1TLzN0dXg4SHBkUkREcVFxUzMzSzlhMEc1TkhPZmhn?=
 =?utf-8?B?V1duWUdMUGh4M1BtWnBXNlhWejkyVG1CRVljOWpGRjdsa0YyelN4WTRrSTgv?=
 =?utf-8?B?bmF3V0s2TnRGc2daSzFEaVd3aVo2Tm9oK2diOHJkSUxqbzVwQVhTMlBlSzV4?=
 =?utf-8?B?bzNCWUFneW5ZYmNubE1TVytoRkMwK2wrUDdrTXQ5ZzVYTVpyT05XbjBQNUtl?=
 =?utf-8?B?Q28vK1BDUTYxdkRDdjBSNVNYenZ1eWp6Y3RLMVpmdWNqUUhPV3FTUT09?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b97059ab-ba51-4664-b8cd-08df15787071
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 11:31:53.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbR2w9HuI8QQx6RsULx0HLHrEBYbvPLx8O8/++uX5GMBtkEWUtmkN2M63lExeb9hN1GJb2nogYkkrnwrWmSLcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1978



On 9/18/26 12:17 PM, Markus Schneider-Pargmann (TI) wrote:
> The wkup_r5fss0_core0_memory_region was reserved with only
> 0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62A defines the DM code/data DDR footprint differently:
> 
>     /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
>     DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000
> 
> which results in an end at 0x9e600000. For this memory region which
> starts at 0x9c900000 this means a length of:
> 
>     0x9e600000 - 0x9c900000 = 0x1d00000
> 
> AM62A additionally has a second DM firmware for edgeai whose highest
> section end address reaches 0x9e700000, so the region should end there:
> 
>     0x9e700000 - 0x9c900000 = 0x1e00000
> 
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
> Fixes: 8dd0ac27fcd1 ("arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors")
> Acked-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Bryan Brattlof <bb@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

Reviewed-by: Wadim Egorov <w.egorov@phytec.de>

> ---
>  arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index de4048a3564b..53c096da68b5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>  
>  		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>  			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9c900000 0x00 0xf00000>;
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;
>  			no-map;
>  		};
>  
> 

