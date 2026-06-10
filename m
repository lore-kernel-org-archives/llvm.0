Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD30285060
	for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077184; cv=fail; b=HtXTet7B1UDBJvcOrO30oDJHv5U49ADp7zjHQRn+DudFce9MZRTkDzneSW5tUU0oL1sva1rNhljpv6s+FvFcdFExkcLWJSrOcRMd1WCXNr+2rC2yivW6IDLMjAIwzpmyyr8BUDgTc3ZYkvd0e5E2CrbclaKOpJdIFRLY/OHqB9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077184; c=relaxed/simple;
	bh=f44IFxkybAB8mlqVjpf7nR3IKG/aZkCLDGNIWOkzbt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MJbwzrt/WYrnL7cJsZ1unaoSlyUK7gQNBirM+GnHBMw/wxgEFyXYRcMueS/al+KJCVYrs3lqb8wScPFsu1Nu2WfsebZC50t48ADt25RArF3I2Q+bTjmpzDMZZ3t90sCH/508krvfYPIo2mEWks2CzOGYAyyNIMdsz3Ol60eobeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Dh7dXDab; arc=fail smtp.client-ip=52.101.53.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Dh7dXDab"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnyApUMktiH6TY/SU9Syh1SmUBPmRnq/pFrvxly46+KOJHpZQdEQy1O9E2XJvB/QH7oBWzYLT9qkXCBGsVyLN0VwXTH/khTnT0Z7F+BD2rEo71Wk/UXpUc/QkH7JxLpdRTQMLTbAVl/PkOIpmYP+ZMqR2fAZaYQg3nkHb1xZnZIPWylFAb8JYECYThSdZUXvRBJdS8Ho4i7ZVT6l3cfOGoUAIqxtlLipTikgLsYNbGpqnyq90lgE8aPUGwWt9ZFcsQ6Vj4mt5+8o0v215n+SmpaG4jmyaK80tH8Ur/VQVMWYMJdkil9uQWADvoEiXSOieIIWdoaA7ChWuwmXWBzPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY+bMTsJPvRdeLNZlPUw8yrZkHGH9AZG9Z/j/zVCCFI=;
 b=xYT2AiMxx59sBArB84vuaAz7HkqresDNpmec2nSeRhBRE5+4HBpPACT5zS5lfP4RRRH9J7m1pkQ/mtf6ln8z6uflAMAccd4uLurQ3tHbR5LBnsZH/GVcWDr/fNkauaz8IFmy2MAjeq9sgsAKe+6WXFSeaGmCC38/KJReiMasugzyXnQu2HMbEUsa7uFamrdzgmWXWhT2xF+9bnRDXQKfips/mhjn7WgXCRce1LZpmJpnpvZmsOiDVsKdRBXyOHMZsn1c1JWGA+74xCN3j44KRn4xdim+WnuZVOa4/XrhFSZ9vXtbLofPJi4RcBDlmfmeiabS+fZxt5+c1LSkvB5Ttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DY+bMTsJPvRdeLNZlPUw8yrZkHGH9AZG9Z/j/zVCCFI=;
 b=Dh7dXDab1ZivSlSGzdeHus3LpRi9HbG463aZENAxCoffK4o+jJ0LcEWHDjIh7sZTmPXJmp1lv6yXgcaZLaDbzo5dA8VOvJbhwnkP/ByVDgSql/4dTQUGi8sbjbRWMbhvmtBdKHM/usp80XUKYNBcgqARRWo10O6HW6LoBhhg6Fw=
Received: from BL1PR13CA0159.namprd13.prod.outlook.com (2603:10b6:208:2bd::14)
 by IA0PR10MB6698.namprd10.prod.outlook.com (2603:10b6:208:442::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 07:39:38 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::7d) by BL1PR13CA0159.outlook.office365.com
 (2603:10b6:208:2bd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Wed,
 10 Jun 2026 07:39:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 07:39:38 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 02:39:37 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 02:39:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 02:39:37 -0500
Received: from [172.24.233.249] (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65A7dToR3389577;
	Wed, 10 Jun 2026 02:39:30 -0500
Message-ID: <3acbd99f-c58e-48b2-89a3-0e77bdbb8427@ti.com>
Date: Wed, 10 Jun 2026 13:09:29 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
To: Markus Schneider-Pargmann <msp@baylibre.com>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Judith Mendez
	<jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>, Bryan Brattlof <bb@ti.com>, "Jai
 Luthra" <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, Stefano Radaelli
	<stefano.radaelli21@gmail.com>
CC: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>,
	Akashdeep Kaur <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Hari Nagalla <hnagalla@ti.com>
References: <20260609-topic-am62a-ioddr-dt-v6-19-v6-0-16afba97fbe0@baylibre.com>
 <20260609-topic-am62a-ioddr-dt-v6-19-v6-4-16afba97fbe0@baylibre.com>
 <DJ56KCZMDJ35.3CKN0VT59QRJV@baylibre.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <DJ56KCZMDJ35.3CKN0VT59QRJV@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|IA0PR10MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 95809cf9-b8e5-4fba-8d02-08dec6c36d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|921020|56012099006|3023799007|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p9Un8w7QvPka4VIiOWO2umypIA1PY2zq9F4+p25wm7Sj6vpXtpSR2fGW/DzKrkV7eLwYqJvctKJ4pVK8mJSIXKR1osca9o4ryqHMQGmjBceUhMUu7KjWGzd3P8DtJqffNn56rDA6i3E4cip1F0zqdbsmEHQd2Bhx5JtUrd30P341fHWr2s32ur3zNMNnt32IeZ2o6UcG5hh3SKpOxTIVZbM8kyiw37S7uP8gPH8B1AisyPfwsWt3nx3CR0nIz/rZs3WeX78h63xbX6odDwgJekafA6eE8YsgKZvYjJN3Mm7tTJpDwO5T6B9c8Hg3DtFPXfJkcF+tYUdPIzPWn0dQ8tV+nAE+t5PZLIMj7X2pGfWRm2arJUkq8oisNsIBCkbt/MFWcHhYICjq0iVSlLW8EzJHsMv3W1EqInFydqsDEYFBkoaRVWNQ6nI2wqptjd2jczlqtks60eJtMVJdrCU6lOu322Tk31wlEuE7S+zDx4C3uHLxtQgCfHHYDOkWmYVufSB3lpJcGwhn49taNaOMOH4WQRktKQPCAjrbAkvC/d+tNUpt2rZy0rHM/RQueGQOpLZP8SkiF5ikDddqWHjCGPTmnN3TBdwl4gdbIjmkEZOVSDklSCqPw43gw8d6Cdrxy3FS56R3daZ2EwwzYy5tAG8AAaPBO0t0EH9TkkjX34S/qpPHig9CPi+YtJ4tzZ6GNbogCukIApHU9fEro2ShhomglN0NrmX2PHONtyDo4FZK81IQh2iIebIEcZlwT5ktZeFIdqzoldm19oUXTbxppIXJ4ah3EnPvrCMSZwGEMtM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(921020)(56012099006)(3023799007)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jcURR8DrkW/esunIrACY6PVSEpvA0Lwqq9M7oluQBkHjC/8i+8D6EDrx17KYMF0sDeozU6HrfVrnyMmvFHEgg0CZFQ8iT08bRe2QX1VZJLKrZoXT5pZEifxmG2tbqckbo2b7ix3+hOZpeINUz4AyhzQ6zRqwnPTS8bH2p/fsyzGn9buPjd2vhxc6d1qnqIN8BC9lx7cIYj48SZL1j/DK74PK2/jmDQH3PUb9qA2MxJnMxgTYH3+SgAjG1ROi3Ll1vf9t5DsOo20GI+klSg737WEdrHT55FVuCRk2P8xNRq1Nrc6Wk3AxlHU8SuEIBJeiJFptSEYAHm94KHa3kZtBlBNG/kfYS1onrMv/SeSpH0nCzayuLwDCi6uG+f/eeVuC9Df5VUuZzFXs+S0tk9YxX7JnfLji4kBPzVVOyhY3ZIO9laReDLbQr7N75K0yQ9qm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:39:38.4718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95809cf9-b8e5-4fba-8d02-08dec6c36d2d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6698

Hi Markus,

Thanks for the patch

On 10/06/26 12:41, Markus Schneider-Pargmann wrote:
> Hi,
>
> On Tue Jun 9, 2026 at 8:56 PM CEST, Markus Schneider-Pargmann (TI) wrote:
>> The wkup_r5fss0_core0_memory_region was reserved with only
>> 0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
> This and the var-som patch incorrectly mention the reserved size to be
> 0x0f00000 in the commit message while it should say 0x01e00000. I will
> fix the commit message with the next version.
>
> Best
> Markus
>
>> AM62P defines the DM code/data DDR footprint differently:
>>
>>      /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>>      DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000
>>
>> which results in an end at 0x9e608000. For this memory region which
>> starts at 0x9c900000 this means a length of:
>>
>>      0x9e608000 - 0x9c900000 = 0x1d08000
>>
>> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
>> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>


I was investigating a similar issue on AM62D and implemented a slightly 
different solution based on internal discussions (although still under 
review)
https://lore.kernel.org/all/20260609181006.460401-1-p-bhagat@ti.com/

Would be great to get your feedback on this.


Thanks
Paresh


>> ---
>>   arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> index 7ee894d59113aa727d41b7ecd6b2bc7e12760823..8a5ff5c457579c7b1be7157d235fd4b4e5c6af11 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> @@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
>>   
>>   		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>>   			compatible = "shared-dma-pool";
>> -			reg = <0x00 0x9c900000 0x00 0x01e00000>;
>> +			reg = <0x00 0x9c900000 0x00 0x01d08000>;
>>   			no-map;
>>   		};
>>   	};
