Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EAC16E89B
	for <llvm@lists.linux.dev>; Mon, 22 Jul 2024 16:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721666398; cv=fail; b=CVh/WQIpP/Nm/EA20xvezRwsDefbAE0AJA3eWN3vF3bmL4YVITN5UJo9yci9bTD4RtlRUhQy8R0ETIUyDGIuBkSE68RKeE80MwJ12ZaGsPI2fWdFIqYlh5U0/3FvTImsR0IL2Uagb+CoFpsNRZTQ8GkgTIadp9W95uGhjpmSThE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721666398; c=relaxed/simple;
	bh=7LJFriwTo7USoF9joBWVUnM3yz9qM82pFp5zySmqgmA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EhOXGDf2NjLZCiw0FRGGeKc/dTRQCmml18Mh2O0ZWR/I0McDwLOPCzdMlapkzJiIzkAym7dzq6+axR7zKDmrdSKRtrrKmO1jaw0zIWfbP7DlWUgD0gCIdsv4/Z51L+afNWh8NA0Wbf0Uc5y34Rpp6DsCLtj5/qYMMGza9N3itXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QS2xLfI6; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QS2xLfI6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721666396; x=1753202396;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7LJFriwTo7USoF9joBWVUnM3yz9qM82pFp5zySmqgmA=;
  b=QS2xLfI6hJXZZrgris2ciQ/jIlZjyPE7eiVY9vD06zVx9qxVnZMI3fHE
   pcV+JrY+yyNEc0JyCkpGq6Jogxza2P/TEp46HFSt0K+yMcQokxdXsP1iQ
   rRsnsHPLn0aqcdWf1ztYFORU+vb3tv755hCUlZIHky4IAJ2ovkjKrCl6A
   NkCTbEy0TCwRv/TAY/MrTQLj5MnPaV6HbYKXtWEEv45oXJ1PkuimGEmud
   /JzWKu81d4/Xo+lPWTZjTB+x/wS2SMACgnvL7fpLOuH8V3h4ePudKxEcB
   oDoxchGvcbZMahUiMAESwFs2GYfzaGxiqZ8RbPYSMo2+nf/bf2rZ8wkYC
   Q==;
X-CSE-ConnectionGUID: VwYTvNg/TciRfubZYCgfmA==
X-CSE-MsgGUID: 1ybLl/FvRre4f9g7NaWeTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19373331"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="19373331"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 09:39:56 -0700
X-CSE-ConnectionGUID: lYN8uc9BRBqJ2PjgymyqjA==
X-CSE-MsgGUID: dWHSXkBARfip6i3NhxKVjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="51869672"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jul 2024 09:39:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 09:39:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 09:39:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 09:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTECjEZw0KNfw9DNTVwVhp9QS2FQ3yX0NGrMxgNB2+69Rf05Qv+XOYTsA6D1IvToAZ7ZdL/YLWj/NQyIwv/RypEqI0Gn05J5CzSX4/EF92woiHjlaFl/K9jtHjdBYq8wG0DwWeUr1iLx6uJrRI9/h/MZNqQOY14EKRjpP5hQ53gcF+pib2vWoYfbRRam9KpNJY1u5OPg3e1DAd1feKgIlLbldMpsbch0akDiXCwOYSgApnnmInHW0X5Gf59I+/6zfVF9eg+ZbqgVM4jHkRCTdhsBpJOuYhXGN9aD/RUpJF20OZvLdbngPaNAFkeJ9404vvRYXJCo+y4usV17tN1wEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU44uS469AnaHDnpOMpPYp6exf5hVFPoXuo0ib+p4tk=;
 b=PARKRB/WHvNsHmayAPpOl1qhhsNJaA4Zvlr/SKlucAUIQEao7Peqzj2l0BSLjwbOvRowQC1pS2lqScO4k6Vu6OKf1TNQJSO4CQV2RvK9eHnqtgXIMdl4Bd8vmMsQBOU8dFH9CtPHOtV0UiQrvmkZ5TfRtNgihjj5lD0Jw5IrKHh5VGnQCT6B6sKS7AA3Gb9m0SY9vm99LLQQo6aS/FVeGALSv4yqG3F12oWF8KBX/aC+agxvXSE7FfC13cZgcbOCAZIHCg9CLN6L8j88rHdGyTxkdW3gGpVnxDAhlrP+FzJVBfrtFNM2fz86tuZs4lH3RDayzwI3bkqGLhSd8x4Ymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8542.namprd11.prod.outlook.com (2603:10b6:806:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 22 Jul
 2024 16:39:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 16:39:46 +0000
Date: Mon, 22 Jul 2024 11:39:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
	<michal.wajdeczko@intel.com>, <llvm@lists.linux.dev>
Subject: Re: [PATCH] drm/xe: Fix warning on unreachable statement
Message-ID: <poozm74q7grtgdft7trv4q5wjuixqfwrs2a7ris3xfxyzzowxf@srkoqd2nm7gw>
References: <20240719191534.3845469-1-lucas.demarchi@intel.com>
 <20240721192534.GA3459346@thelio-3990X>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240721192534.GA3459346@thelio-3990X>
X-ClientProxiedBy: MW4PR04CA0258.namprd04.prod.outlook.com
 (2603:10b6:303:88::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4b78c2-ec90-4850-e261-08dcaa6ce556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y3BW/08ZskqGI66vAb7PaVeqqMHJafEgcKgw/c20HwlhO7N2pMYjnJvuef/x?=
 =?us-ascii?Q?Ig2shbE+93GC1cpz9Wx2oGbIwLUdldyzkcu6dMEGU1UyyeQIdenlk6kMtZnP?=
 =?us-ascii?Q?IJP2nWvpCCJ9EqqAimFihKXmcoMKbaWklMpYq0qr76uPdAjtV5fTDsm8KFN9?=
 =?us-ascii?Q?u2UI2OJhpHEvydCyJGoFgq25PjMle9uQU/AoFtCo/zS1DAMXFA8VVB9fYugA?=
 =?us-ascii?Q?3MkbrlM4HreAFI3bJu7cicfuAR1LmawS/eh1uBimsQh6LyGMzLs1/qDiHV1S?=
 =?us-ascii?Q?CnxQVOl9GJLfDjdKTgngXDJGUiFwfMNUHZo4c5hqr6fJP+NR3jK8ZrzDaWwd?=
 =?us-ascii?Q?vnbcvvkZiM9dbMkoLblOuTPGZ6JW/59CA1468ZGQzGA61cUe+RhVUPgVmu3G?=
 =?us-ascii?Q?eyypPy2LmY40rewy7hepEMeKtvgE4grn8wh9WGbURw0paVRMPSDTV2CseSCE?=
 =?us-ascii?Q?010Vnw/DEitsydAqFJD8cix53qz5Sb7ZXC3umWBhJyJm4DDc+AIHfNGBV0cP?=
 =?us-ascii?Q?oSwcmR8SK3XsgqtQOKqT+IymlrUbuLcZ6QHE+wymJMvm3Q96liF6uX7pIabk?=
 =?us-ascii?Q?2Wxke2ZtMJmR7LHCMVbEX6LmXxsX6d/HSnqDTk93dRcwsSXo+bWEMCLRqrp4?=
 =?us-ascii?Q?qruxcRoBxKxymzCod2xLLCoZ++4+9x70o8n726sA+AHUS5Pu/B2JopWu5iGa?=
 =?us-ascii?Q?bPEqSnOkZ79SZWJmEarppbqVHrx84k9o24lVdd4EFkNhuAaOoNtUb2v35vWc?=
 =?us-ascii?Q?RtQEap1Rc1m55+PKykGoaE/tjn6Tw03Y8xNTjZJ0xoOztTgRDL9SdU0D1wYn?=
 =?us-ascii?Q?M+Ydd4BELy8fpzVY7FbqFsIHHmsFNbnnOLa3W3yiRMCESRNv88x6JbieQIuj?=
 =?us-ascii?Q?ok2oZE1TL6QeCv9L2d6qLVxp/B1FEcXUOmcKcIrcjyoTjP+FXozmkRFIQ0d8?=
 =?us-ascii?Q?omVmrDZ86FzZ0tULZTLNMULJ82Uo4FWBi+D80JRtnv5ghw6YKg5mkUit5bgQ?=
 =?us-ascii?Q?0onWYoFo3NHjrNYOHk+c7dqxx/Ltqb9c7jsTWUhCvMEdc+gAy7vuB+qoEpOF?=
 =?us-ascii?Q?nCYt9YISXqLzQ64HCUd88CB3IiXMGaVHBE1OlWF/gRrkOGu2KNqhELyXLGnf?=
 =?us-ascii?Q?dltv/fCLZrS7iBkr7avd1U8FXcdvcNHgQFXQezPI9BB0MlUXXJy1OL87vDbM?=
 =?us-ascii?Q?QEb+ps1le4mJl7UzAfJcpl96VE0QPl26TxAaKvz/t3BNQdaxb/TAisGiBRZa?=
 =?us-ascii?Q?TSqU/glU/hFmSWobBvQ1ZVxDV6f/bG5hWTXWDk+oJpM4SIiQ5FoYP8Yr23BD?=
 =?us-ascii?Q?TAZlWfvZsYafTY2W0EsoIYSmWo6Brzv6au/47GAPbN3cDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zemjrWQSGvgPWcqGXQzbI5Qee2uY6Rzu34t8xj24QRjwunUhBwCRrEfxRwk/?=
 =?us-ascii?Q?FNDBdNX5feGmvyJnMUFahRTCy6nNU2irDDFtVSd9rNI5GrbVxzxBOBXw2UOx?=
 =?us-ascii?Q?F/qRE3A+0af1a758pn+CEqX3/ySAFQ0DgtZH2ORSJhIM08Wj9WOk6Dl++0RP?=
 =?us-ascii?Q?gcElA4fEn8rhMXTRCvmwJrXD8XDuRQTYTe7vlMTj76eE/PhLIgr1nP0rEp+W?=
 =?us-ascii?Q?v2kZ4sCjcXZsPkoN3Xwe/gyPmXN5Fx3cPTggDJGfHwyNP9MWuf7V4A1yjYVo?=
 =?us-ascii?Q?gaNLgQDWwZqQxEISZOiGV7gU4WaEwFwRqRut8EUhSbGMdOe1mqN0cYf07mFb?=
 =?us-ascii?Q?ZHFe2ccd0XNLejvPSVKTQ/eW5eSiUKhQs41g0zujmAVAxzDc8GIOcqKB3EUo?=
 =?us-ascii?Q?W8vZvv62SZF8w9PNgvyqLLmxyUS8HjyyJfsnWEBXNx/B8adEonhUtxCDeTbl?=
 =?us-ascii?Q?363AGicI2nudH5ui6bC12BvMeju8aVusDXHXwloGJ3Xv+d7AI98TkJwL8Kzl?=
 =?us-ascii?Q?TjCSZuNkwfDUiL80piypeBTon/MIEx2nzXVusp7nQi/9teATgZFUrLlpycXz?=
 =?us-ascii?Q?M53kxqcN2cdQSzyns3+Ik7DHvI2rwLZc1Oeq/07bDzIWk3JH2QdB/KvGOztZ?=
 =?us-ascii?Q?DiwRXC7ljm2FtoD6KIqufPmsf6yn2rhJinjzQ9kC3Fc0XV5NrmWOlDvDGPV4?=
 =?us-ascii?Q?CBuSLkpJLHn2z3tRCpX51gxe+fMv2DH4NGb1CAKMPmUfY6axQ3OCTSxe75+q?=
 =?us-ascii?Q?nEcYQno3K9E2zquKBXMNN6phy81iaPnSi3kbMnWbz3KpiUAubAJEQWiMMp6G?=
 =?us-ascii?Q?n/j7bsSPhRi2hcaOCrGn5q0irQxSGzeCZHBlFdX3OtIZdYbkAeffNZcqszpu?=
 =?us-ascii?Q?sy3ofqJBBiwNw9BDD3vOjylKLansrCHYgX3baM+6rJsWZ6Ev8+cs+Ms+5Clj?=
 =?us-ascii?Q?6yVpTcNTDrHRTz7VgkcMt+xJyl86aPZRp7IxlcNPf3kDLIaem1EzRb+akKHg?=
 =?us-ascii?Q?7C0jJeyP6/maCf18W/GjkJBCEKMFNmr8Ya8PDk0rwrYbwzLoz0V19XTYGki9?=
 =?us-ascii?Q?rGr9R7ZTwSnTDrSjSnxTKWrbEL830t6jLkRbAfneTZ0+wlaZ/YW8QqGOGwyN?=
 =?us-ascii?Q?5CXB9Hm3osUm9tVnTS6LkHl4nX2iIsJqMv6RupWKRxz5nCg/b8ttYdclYqOh?=
 =?us-ascii?Q?f1Zk2irXClOsnC7Wm6FdeKHR/XH7bCVULIvZua8NB6hXgOSeyRtGuSlW3bs4?=
 =?us-ascii?Q?f1khzymp5s9rk2tWKQGN1CGL0PycSE21Oqv1Opvy6e/QBT/QqohFzieHs4uW?=
 =?us-ascii?Q?3p3DtMuCYdaJ2G+B9wa2qsuDDAhY0obs3eHK8E0VrL5FGKJUmDeCNuw5AJHi?=
 =?us-ascii?Q?VHJgZIm+OcSMnaOQnkJ5JS0B98cUdmkdHU0Sdr0zrUnM2hHhUTzj9c5d1TAo?=
 =?us-ascii?Q?EgDsVbkYcRQiyL4OlAyjEaGPbeKD7Hp0iL6Sh4nI8cGbbL3W0xxCHDaEYks+?=
 =?us-ascii?Q?UTH8kaHH86MqIC7bZ7Fc5KI9RkTlRXlzyXXLg4xmNAWTzl4pUxmOXS+xoFjQ?=
 =?us-ascii?Q?Zozsy32mv23h6k1gfhgESEnfJpZ+LHXM5aibahhwguBlxbY39ave0DTWw45L?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4b78c2-ec90-4850-e261-08dcaa6ce556
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 16:39:46.2176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/JeF+6vT9SId4q1iZcxmqI4+IWZKxXp/4e3tJaZQWZ+9PkFL3BxCn6BhU7L0GhVtDCYWz+O9wA2JmtuW5swz0pRLIRn8hl4KhMMGOi1BOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8542
X-OriginatorOrg: intel.com

On Sun, Jul 21, 2024 at 12:25:34PM GMT, Nathan Chancellor wrote:
>Hi Lucas,
>
>On Fri, Jul 19, 2024 at 12:15:34PM -0700, Lucas De Marchi wrote:
>> eu_type_to_str() relies on -Wswitch to warn (and -Werror) to make sure
>> it handles all enum values. However it's perfectly legal to pass an int
>> to that function so in the end that function may happen to return
>> nothing. A smart compiler could notice eu_type is never assigned to
>> anything other than those values.
>
>Well that assignment happens in load_eu_mask(), which is obviously
>called before xe_gt_topology_dump() in xe_gt_topology_init(), but I
>don't see how the compiler could assume that eu_type is always one of
>those two values when xe_gt_topology_dump() is not static and could be
>called from anywhere (i.e., when eu_type is potentially some other
>value)? I might be missing something though.

True, it's not an easy check by the compiler/linker as I originally thought
as it depends on some additional knowledge:

	- eu_type is only ever assigned in one place
	- it's never allocated from the stack
	- it's only ever used in a zero-initialized object and 0 is a
	  valid value.


>
>> Trying to reproduce this issue, none of gcc-9, gcc-10 and gcc-13
>> triggered for me, but this was reported in a different system with
>> gcc-10:
>>
>> 	drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_gt_topology_init()
>
>I have been seeing similar warnings with clang as well, such as:
>
>  drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump+0x77: sibling call from callable instruction with modified stack frame
>
>  drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_dss_mask_group_ffs()
>
>  drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump+0x77: can't find jump dest instruction at .text.xe_gt_topology_dump+0xc0
>
>The final warning happens when LTO and CFI are enabled and I see a CFI
>failure that appears to be a result of that.
>
>[  +0.008116] Missing ENDBR: __cfi_init_module+0x0/0x10 [xe]
>[  +0.000226] ------------[ cut here ]------------
>[  +0.000001] kernel BUG at arch/x86/kernel/cet.c:102!
>[  +0.000014] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>[  +0.000004] CPU: 3 PID: 335 Comm: (udev-worker) Not tainted 6.10.0-rc3-debug-01858-g7108b4a589cd #1 6163aa9290b9c012af9bc3cd405d04758721ac11
>[  +0.000005] Hardware name: AZW MINI S/MINI S, BIOS ADLNV105 12/12/2023
>...
>[  +0.000002]  ? __cfi_init_module+0x10/0x10 [xe 257ff34a29c86b7d55c1c838833ff13eec5c3393]
>[  +0.000167]  ? xe_hw_fence_module_init+0x40/0x40 [xe 257ff34a29c86b7d55c1c838833ff13eec5c3393]
>[  +0.000171]  ? __cfi_init_module+0x10/0x10 [xe 257ff34a29c86b7d55c1c838833ff13eec5c3393]
>[  +0.000174]  ? do_one_initcall+0x147/0x350
>
>> Since that is not really possible, just take the simple approach and
>> return NULL.
>
>Indeed, bare unreachable() is generally considered harmful and can introduce
>undefined behavior. Commits
>
>  d652d5f1eeeb ("drm/edid: fix objtool warning in drm_cvt_modes()")
>
>and
>
>  3764647b255a ("bcachefs: Remove undefined behavior in bch2_dev_buckets_reserved()")
>
>come to mind as instances like this.
>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>This change resolves all the issues I have noted above, so thank you!
>
>Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>Tested-by: Nathan Chancellor <nathan@kernel.org>

thanks. I will amend the commit message with additional note on clang
and push to drm-xe-next.

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index 5a1559edf3e9..0662f71c6ede 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -233,7 +233,7 @@ static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
>>  		return "simd8";
>>  	}
>>
>> -	unreachable();
>> +	return NULL;
>>  }
>>
>>  void
>> --
>> 2.43.0
>>
