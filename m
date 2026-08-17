Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013024.outbound.protection.outlook.com [40.107.159.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C53B4417
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975231; cv=fail; b=ZsEXaWwrHT/gIpIDfLXc1Pt7DxfTa/J1Ztf5vVENl30kU9dmldeA2mJc/9mXjWrTQ5mxWIgREmPwBvzM704XATdoq9UTSNf2lu9rvhok+cfWUXzqmgPrQnwOye2Mx+xG5ortVFAxwhPw3BbtI8pZBXzr0s7cRgtkYdizEPKzx8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975231; c=relaxed/simple;
	bh=ykJljXBvBqOKpi3DuXNt0JWI0D9UuTsM0R/45FyxHYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dNAljL4u37oH3zcfbccHzVmzCC+gduYgKvez/JAvS/QpdyAFzYdPBza1KJzYDsAz1ne3JW/HMP/vTMAD5Yabsb9G0nX35k1UXkQ4Ly2+6LvWLISwD6SQBAKj1e96vGjHuyHW6YsnexAEtujIqnmv7KFZ7NesTgeRQmyvalsjKwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xq43dg2D; arc=fail smtp.client-ip=40.107.159.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xq43dg2D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYPW0yXXYVr66rLGT1ZcjtQWNsP7I5MwLUJysgEX5C4DeQqRvyri+wSM2PhfpJYlrqffJLWVRUG6hxV5Jybb/66Nhm7w6Zdgm/xwkyYno0iNcIMqJsiesZdgjJt7o2TVtscikV1TyKNgFxvHY+7s5gSQihD40jk9hINyYW6Z+CTrK0K+e0/TybjsIWimDTNr+SjOl3quKm5TFhYjaZR3IRolxPXqexomCEC+KpKqWfyvvhvTZWnSPHJWAlmGL85JwU2X2bgRjf5bp0DvpDevB4Ynndv/V2Sw32GsD0WcWlEsCw2MbSrwOIOiWTt4lBtJyEJlSfjpKF86ok3p2S/qKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwVltFP2QJsbFdzOVC56rg4VYBAHH5eyADLmXvu9HsQ=;
 b=ABJwPboN4WC02IYgMUsqQ/pdTHsyqbZIV8qS9rPp0Dfl+IYeYDO0y9VV9+JkJhXnRPTDuTTlOwm67Sob/pi/doTJjZ4tit7aFuHR4x2nyXSyUSEOxUXDEZOtzFAPz1tLuJGKN/+WILziEI/JawYb//izpeA00opcHpqXko29Jv7dUC8Z8WVYkgZZXE7wirFJa1PdHWmqCUdyDUfgGrqMTZDBoJ0wai/OieTdiwXZftrzgv9rjMIPvV42t8EfLUUm7KryMDSofs7NcdxHRi4aRpF5ZZIUVXOjRcT80eE6X5HoIHOIcsdes2CGCiF8syJDptCcl+8aEuMjNsWI3HBI+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwVltFP2QJsbFdzOVC56rg4VYBAHH5eyADLmXvu9HsQ=;
 b=Xq43dg2Dqa/G3HdM66Xxc8U8rqkwF5gm1v3vtnFl0jvurnhI9r8F+P71eo0lkJQf5B+Sd4ejizTUCvMCzJkvfwZ2zpYUpkRmIpC4epPneaiRwQqhpXXe9ddwLgIg2Wkdb3P1WTPzrEhtBu7EDO7lOjCVIjL5sjUvVPkd3F5+Z44//Gq/cpuqFGCq2cUihUiC1YMz6rWNpEW4IJ985Atzr5qdjXJnZMv03E3zPlmLqo/a7J9MDSyP4LNJfN75nB22pA9ccatxZ8QJ5MQfJciFwODNiShQTZcr8xovyVWLQZbCXfvDa5acnN5hG92aQtqzY6dTXZnPlxyf0dbDruoKtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8685.eurprd04.prod.outlook.com (2603:10a6:102:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:00:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:00:23 +0000
Date: Mon, 17 Aug 2026 09:00:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] dmaengine: bestcomm: ata: drop unused inc local
Message-ID: <aoMT7QS8W6XSafUg@SMW015318>
References: <20260817015747.136689-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817015747.136689-1-rosenp@gmail.com>
X-ClientProxiedBy: SA0PR11CA0191.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8685:EE_
X-MS-Office365-Filtering-Correlation-Id: 216824c2-fcb7-43bf-5fb1-08defc67e1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	M3ToobKUX6bQehTbhBAKTE9Fih5sJUfFvCnHoEculqDJy+LQIzR23BiqGYnkHRtAQ1UaWTCl38hr0/dZm0ulugC1c7x9jEvInnzVXx0pplP5arJNIHPye/SLSuTEfcUOUYPKpV7z6pGqoJgnvGMudzzX2wz7u97F//HQVmF+9fwVZezRkDNfJSM79mkhi03VcuotBAuHefZ7L5QU6j0yW9pFnviRwmrnh87Qksde5TJY1ChGgjPbSy4hxDFrCCbA91szobRv/lVfAQmacNn+ieFdx2dQsHjkoeX2wtA80vr4xzjRTzPOvKe75RSU1DhEwixCZJgeWucTXhWUCZoHbJ4igxy1SAxsxYRTg0VgINPO0W3r8EkfA4sESsUJnC2rX6bpM9S9tjk6pIKwZpVdY4Jmin3weO7kuQ5z2asMR5Ywp0jpffiaRGJMBUeo+hm0int+dDG/q6E86cGaStit5qUkO01eZw46WPx339KAUePioMuCxwX9OJZ9QqCKqxAFXzjFsHfqqirLvdDa5VrFxS5ZMyQEWeHJzxEbLT1sz3i92oGCqiocL30TaF1omL0CKwhQpKvOPRwrY6s5xkaRXPYGBF4eyAhDfirnByxBt0bDBHN4D6R39yfV8454Bvn7PXhuVdPoXNXFNDXYuSBKhBrn3NiNUlvFFE/Z1Qh+To8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mWo/+lT099GD2UmKrbdehZLxzbo7gT7w/GgMh8cryfjUnx5m/ZWl4kVKH+Ys?=
 =?us-ascii?Q?LnqIj3Wg9xBu5PKwTnvNi+hyUVKdqdrZ6C+xhFaKyKWmQstKBA0FnLu6eqvS?=
 =?us-ascii?Q?Hc9IPgTHglQSwTL/uOKLPdDhzxoFQGeFPKZ1QR9tJQOrZnxtAR0OjT19ep1s?=
 =?us-ascii?Q?mYDOiQG+C/kq569peLG74nZ81urCncTrS0lHLl02yR+UgjLMcACtlGXa7WJ8?=
 =?us-ascii?Q?E/CHCZ2paqvQEiL656uKTjwwGyjVT27TdsToiZmHmkCG22Q9vOtmxwpAjr4S?=
 =?us-ascii?Q?p+uy7sWV4warTp1Jldz4Dm1iEFdK5eHmqn756WD3tVD5qzwSBiouZAd7tobu?=
 =?us-ascii?Q?aHF8AofhGN1jVcT9gkfd9WKDB6UgKeDGxSOIKNPr9hsy7qOtzn+u/zJ585Pq?=
 =?us-ascii?Q?1Ljnyz4onJxWM9pUN4c1upXt/jvuXS0rW0VCgamZF3nO3BdcHlS1Wup3kzqR?=
 =?us-ascii?Q?H80mYzCqSGh5KgvhA8oEtKYCaQ9TTVEovFWdSPKyY1HDGbXFfiG2DtS5p6w8?=
 =?us-ascii?Q?aG0PiXoa8IriU9sEPUhrdIuw8AI0pMoZ8em03Tl3UgOtQCLWztKkO9Ob2G2k?=
 =?us-ascii?Q?ugNJPcyrKnQeeKQvz0niExXk9iPDYdQOaF+Yy6RTWL01fEQxeAa1DyFEHtb/?=
 =?us-ascii?Q?5jMR4QL+yBE0laLxaEp8UvQifEJaGLKYkITen5Xog+9XfoH31xlyqxEmddGY?=
 =?us-ascii?Q?2xLHIpztNDgTvx9O6izmEgbXtI8k/kN/CEBhfWV6iG6nL8hp4XJ77JX2/icp?=
 =?us-ascii?Q?2lIPgCSHwIC33EVVVWuVKZtMs7PGemqeXarwRxwxhdG1DLb8I+GqYshilmy/?=
 =?us-ascii?Q?tA03DebRs0IHpr0T7/Cbc+tf61wz8+m+VfpjCDW5XlDuZX4iMyhdG3L4wCKg?=
 =?us-ascii?Q?KLMr4i9QtRILEv6BYevWc9vZJpKoqWNFklnJUbfScGXlbpD8oTM3G4cyU+nC?=
 =?us-ascii?Q?W8K+8z1nHbI0z4RL7Pum3O8fO9dRc+eObdOHybDQqjdqX/h2Kr0zOZ2w2jTl?=
 =?us-ascii?Q?2zxS44AgVIMbZlrRqVZqxrLC+hM4Vd4y1j6p83xhPH1SvQuHoi1lhMb9DtuB?=
 =?us-ascii?Q?yOAOBIfGryeuUu4+ODTyspVuf6/ZqGduuba8F1M5ZnrSJ7D/yo/gk0O/TXPE?=
 =?us-ascii?Q?jIqMq6BajYZGIgu8XT2xJ5KhOKImAkuSQq8b4Tekuj03afOqcZnJI23ZeffG?=
 =?us-ascii?Q?OQOQ3cZJ354QFca8VEhboiMnEyrjPLLngT137V92ZGjVi1hoJGnYRIX4ga6I?=
 =?us-ascii?Q?hwD47w9ra7SheVVNwAquBFO5WIIXhp/vzw2n9JMHe44DRZV44lXuUOd1Or8P?=
 =?us-ascii?Q?C98WEIBfR/sKEhT4qx+A2HlXNqgd8mi5aC54E/aB/uv1skELE458kg+7hI6G?=
 =?us-ascii?Q?myQExKGPPT4zW5aUameUroXAkgE+msZHksLNtPuOEQH3AqVGQf1ip7dsauW0?=
 =?us-ascii?Q?b5T2RAS1/RovK6AO4CIM2TblH/uZJ5GsQSz5Z4zCx3lEQ/OM+n+91+zIxiBb?=
 =?us-ascii?Q?mvgZoHmUYTUIzGuY2UPD7PtZObo/9xqhD1ckAldc6dTVc2PW1aEl0NQdSoiB?=
 =?us-ascii?Q?yZSTGPSt7IEQZw3awlq2aRFcobFTH8ofGR1Fr1V+OmNDbXVmLkUpUpaXRePW?=
 =?us-ascii?Q?wpTBPdoc9OmX9TVgvjL5N6R8NPx7g21r47xDTIk9oepBlwT4y8km2e1QVCVF?=
 =?us-ascii?Q?ovDPAhGPyT3nOsfyvWHzo1wPCLXK/rNB1Fb1O4rfRwAyd3dd5KnASFiAqjD/?=
 =?us-ascii?Q?oz/K3js31uXERnO36JQTVy9hgjncqYtKT6C1Rl+VmiC4jqqcy0q6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216824c2-fcb7-43bf-5fb1-08defc67e1c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:00:23.5405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rChJnhKwE0S2bMObGp9KW1ViuOKqzmdcwNWtaoci2vA1O5/n5NfeJMSeneuF2vjiTOzoRHMBSQcXJzm9zTGeW9lIesdDx1TMvOmpbsF8eraw8w+T3NaUQ4n3fL6Nn39
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8685


Subject please use whole sentense.

dmaengine: bestcomm: ata: drop unused local variable 'inc'

Frank

On Sun, Aug 16, 2026 at 06:57:47PM -0700, Rosen Penev wrote:
> bcom_ata_init() declared and assigned a struct bcom_ata_inc *inc that
> was never read, tripping clang -Wunused-but-set-variable:
>
>   drivers/dma/bestcomm/ata.c:58:23: error: variable 'inc' set but not
>   used [-Werror,-Wunused-but-set-variable]
>      58 |         struct bcom_ata_inc *inc;
>         |                              ^
>
> Drop the declaration and the bcom_task_inc() call that fed it.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/bestcomm/ata.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/ata.c b/drivers/dma/bestcomm/ata.c
> index 502a45d76adc..40126f3f189e 100644
> --- a/drivers/dma/bestcomm/ata.c
> +++ b/drivers/dma/bestcomm/ata.c
> @@ -55,7 +55,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
>  {
>  	struct bcom_task *tsk;
>  	struct bcom_ata_var *var;
> -	struct bcom_ata_inc *inc;
>
>  	/* Prefetch breaks ATA DMA.  Turn it off for ATA DMA */
>  	bcom_disable_prefetch();
> @@ -69,7 +68,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
>  	bcom_ata_reset_bd(tsk);
>
>  	var = (struct bcom_ata_var *) bcom_task_var(tsk->tasknum);
> -	inc = (struct bcom_ata_inc *) bcom_task_inc(tsk->tasknum);
>
>  	if (bcom_load_image(tsk->tasknum, bcom_ata_task)) {
>  		bcom_task_free(tsk);
> --
> 2.55.0
>
