Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41272AE68;
	Sun, 13 Apr 2025 02:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744512448; cv=fail; b=Yihv+6xJJl8lSFEjVVza5+XW1UQ0g3iS6PsrFFZuUMf+jSCTC4C7ocYaxDAc0P6t7tKIl5DaLHEkZup4LNDk5AYgXkmzyZkPK4hkqraX6qFdVr0cBNfkqe51vrBxS/+L6aesK0vN/7BWRRn50jN0nBcbXXSO+3JsEkXI0HMWuAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744512448; c=relaxed/simple;
	bh=VtAfiPAQutsXk/p6HvBuelnwzXbPvUv8led8Ql9aRpo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qWWZ51Jt0FQ+kvk65TX0Yi7FkhKcsguTjlV2tKnFXmynBS+5s1iBjpekbk3PE0AJk4RokEP9iENrzJNrHYqHngQ0jEv3A292YsuC2VFpMrjvKFhZ+CVyy/SbuDiZI6+xmDDEPh1IHpexZDo1NVbUszHVCCjRUqspLHol+lvBLvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAjHg9fV; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAjHg9fV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744512446; x=1776048446;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VtAfiPAQutsXk/p6HvBuelnwzXbPvUv8led8Ql9aRpo=;
  b=XAjHg9fVbRrkw6YXn3CIN0Sv9AIjTbxZAolM7kURK6ZC03mN2phATPEP
   AxhL34YQGnPnWFbjJz1dGIeeeG0aXvB2yvv/LlENmSykmU8xhcLw/pt3H
   wrdB51b/cRtPtaxki4jISmY7U3g8XQAW4Pjb3PWOffz3CsfO73Qk5Hwnn
   7hnEb5FFJtxxj3BnCH6wL+geOC8ndA9ljCWS/QJB8oTnveMxflP4mN6fX
   URhvrz0KfvJSMNsq5ffhMpDM3Z10IPE5XJN7hVmMIIbb+odwNsLSyYgo3
   9ny6osAl9ALyazNG9tVu2Y8KyAZH+11HPn9ZXD4h0ydyy+61e/I0vQ+dq
   w==;
X-CSE-ConnectionGUID: PYM78GunRLmYUcklZrvRzg==
X-CSE-MsgGUID: 59AtOmZYRFWAs2yJxRZQRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71402527"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="71402527"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 19:47:25 -0700
X-CSE-ConnectionGUID: INUjnhBVTgO8zAdZFbDjjQ==
X-CSE-MsgGUID: zBmf4OMfQyidijZtXLd+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="160499882"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 19:47:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 12 Apr 2025 19:47:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 12 Apr 2025 19:47:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 12 Apr 2025 19:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdy3cIp+EGI8uIinfJPiKvOOiDszgad64VrB744IOSyEnO6Y/1rhgpKLgB1oLG56e1zVFl8FZwHA2McX8Pdh/9n7MNvyjYEcyGLp05L7LJlB8g1SKWPPCgJtKTtlC4qWmkuaAHjBFBMtgGDNLRC0sLCwbvRh0RzzdfcaWSPDcWH+4ejsG1TKkA31LrhUCCV2T2UQf42NZXhaQwnOk+oHfYWidxlrmgeYWIyN2h0NEbI9sExv6WQbhI+T59XpLEimO6giaxKdMe/6YqXO7vlDV+vF+52wErVzJgSH4uUx8bCbyeeXsNrmuOE0qTSsX4cNyiP1/yOey+Riv6G1+fkljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtAfiPAQutsXk/p6HvBuelnwzXbPvUv8led8Ql9aRpo=;
 b=K5uHU0QcY5ILdYOfeGj/hWfRo9JrE8vEtTNjcA3zStXujBtNstjCUbq6kb5pqHDuRyFXyg7kQU4xztBz+k5RrhbG/kgvo2ydF7zVYVdT51Ra246duHI2xQzTU423jZXp+6AzlbKlp1QRJIq3UJ8/+gdNquSwjD7QolF8WCPsBuYVzoQ5kBUzGOVymcZctIYE+dxcXZTxFlHOTq70NUb/fCAd6Gz7ZwwQszDg0VUbnvQyZ9GgKuL0jVRPAZ3dbcfSCkrHzbrLUiUKClDjPpV7GWwLZGOfM8RzxRmBq0DFcKa99JhFq1VtXkPhc7BAXrOYptC2wdqZMnUbF9K072py1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SN7PR11MB7995.namprd11.prod.outlook.com (2603:10b6:806:2e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 13 Apr
 2025 02:47:17 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8632.030; Sun, 13 Apr 2025
 02:47:16 +0000
From: "Li, Philip" <philip.li@intel.com>
To: Baoquan He <bhe@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Kemeng Shi
	<shikemeng@huaweicloud.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Tim Chen
	<tim.c.chen@linux.intel.com>, SeongJae Park <sj@kernel.org>, lkp
	<lkp@intel.com>
Subject: RE: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
Thread-Topic: [linux-next:master 1753/1936] mm/swapfile.c:1517:20: warning:
 function 'swap_is_last_ref' is not needed and will not be emitted
Thread-Index: AQHbqXAcX8kwh2/1skeGA/7XeYRN2rOb72KAgAT5PeA=
Date: Sun, 13 Apr 2025 02:47:16 +0000
Message-ID: <PH0PR11MB56741DB70CBA0DF043B9DFCBE0B02@PH0PR11MB5674.namprd11.prod.outlook.com>
References: <20250408173959.f501f65ec5d5e52cefe6b129@linux-foundation.org>
 <20250409165452.305371-1-sj@kernel.org> <Z/b4mdaNvhdg7FJD@MiWiFi-R3L-srv>
In-Reply-To: <Z/b4mdaNvhdg7FJD@MiWiFi-R3L-srv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5674:EE_|SN7PR11MB7995:EE_
x-ms-office365-filtering-correlation-id: 352db183-e945-421c-eeb8-08dd7a3580c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VzhINXJOdnAxRmpyY2hGcnJScGhKM29NanFDUVhkWGE4MVdrZlR5WWRSbnlv?=
 =?utf-8?B?SDNjKzQ0cHdaVE93ZERnQWhUNkQ0WjUwcEZOV2NUeVMvVnFaQnZqcnA3VDNo?=
 =?utf-8?B?QnRlbGYvTGIyRHI3elZXSDB2b2ZhUC94bVpwZ0hyeEJCTHhMQS9HS1lEY3kz?=
 =?utf-8?B?WXZZRThnbFF3bm1RWmFZZks1NGEySGFlVnAzT3VBb3NwWXhXSGc0RWZwb1BQ?=
 =?utf-8?B?bkF6YjcwRU1qVDRzM01LaUswMTU4Y3I3YWhFQ3lOZkFaVTlxV0I0UCtoVXpR?=
 =?utf-8?B?UGxPcWJSek9MeGxPcUZZNFovaVBuSFV5bmZydFNpTU1HQ1NERk10YklpVVZG?=
 =?utf-8?B?VHc1QnBBa2pKengwa25jWTRNS0R1eFNKRG9WMlUvZm5TWDlvK05IcFFZdVZ1?=
 =?utf-8?B?SGN2cTZzdTZSUy9YNUZYaHhkS0xDNko0RHhTTU1nVWoyaHVPcXVxVmQvd0JW?=
 =?utf-8?B?TEN2YUVEbXFRNVRMdXRnRUpMbVNoZjFDK2ZIcmd4dlBvTG1RalR4Tm9xekhp?=
 =?utf-8?B?dGRQb3p6YkZkMzlOVmpMS2QybG5BRzB2emlEc0pXOW8xN2J1VFhlTmRaam93?=
 =?utf-8?B?NEEveWMwd0c1bXJDRGZqaWFKVGNuendabnlPeU9LZ0szQzZYWGZETXB4TmJz?=
 =?utf-8?B?N2I2aVZoVmtGMGU5ZWZBblhhQ1hKM3NteFJ1dnJDUTYyMnRmZHJITS83MHRX?=
 =?utf-8?B?czFpVC96Q05NSGlKcmVzcXJ5a0EwSnUzRGtNMmN1Qkg0MWVMWFEvV2VlNE1z?=
 =?utf-8?B?Tzl6K3BQOHpGTnpMaW1PUktqQnk0Q1YycTkyWWNHbGFJMnVhZ09LS2hXM1Az?=
 =?utf-8?B?WDFVSThFZFhxdkh6MUVEVjV6UFFqRDZYSThNMTlsWXRmdXRQVFVHd1JkRjRE?=
 =?utf-8?B?ekU4TUJacm8xOXhDUkVDaDRlaW9KemtncGZzbGU0SCtJcVZKUmE4SWxjTjM0?=
 =?utf-8?B?TTI2ejVXQ0dxanFoY2tlWlpYL1U3aGdaTDU3RUU1WUJSeG1WT04yeXViY3lB?=
 =?utf-8?B?Q0VHQllwbVppQ2lDTEtFVVY2VzZndFNwTnNsd1lPUVVLb01GYWI4bThxcDFo?=
 =?utf-8?B?cVpNeTRhZ29zMjA0cnZ4SHVVYlZYbXRBVlNNZWo0bVpYS2F3NlFtZlZXVG9J?=
 =?utf-8?B?TExTVWFRdm1Xb0Q0d0YwcGZBMnE4bGcxNXFKa2xyRlR1RE9lUnN5UUU4RGJq?=
 =?utf-8?B?Vlk0MmR4ZVlJM3R5ZFlrNVlUTkxuTGw0Q2pLOEUxZ29YNFp1amRlUXQwUU1y?=
 =?utf-8?B?bGtiSmpDOXFaSDRHeFcxdkNOMTNFV0d4R29OM0NVZmtSUm1CMzR0QVo5bFFJ?=
 =?utf-8?B?T1JXQTkvWDJlT0lpK2ZwbU5NNFgyU2pmSXd5UlZ1elhTK1dmbDZYY3BpWC90?=
 =?utf-8?B?d2pjR0lpNHpPODkvZllFMDV6L2k1b1FOTlc2YWhqeFFTcnE1VXNGRzIyQVdS?=
 =?utf-8?B?Y3BGdFRnWGgzZExuZ09WNE8xbVZTY3hSNXdRNHF5UlJZZ3JsOXBoU3p1blVk?=
 =?utf-8?B?SGdFUUtKOC9RM3JTdWFKK0Z1Nm5Hd0lLZ2d3NjFwVzFVbm10ZDIvclV4d1NX?=
 =?utf-8?B?amhWVEVTQVlVcEFpRFNDRlNSWEM1Q0Q1UC9Zd1ZJTWdNQXlvUmVkUzNuMVJr?=
 =?utf-8?B?ZDgyNEJpN2o5UTVXRXRDTXY5U0J0QVJFMmNBb0hIbVg5aWVRM0xhc1JQNUt0?=
 =?utf-8?B?WDlTMGhMODRFaytLcURWQ1ZIUGhBY1dKNVp0dUwweWEya1NMOHZLSHJGcFMy?=
 =?utf-8?B?UFROaEgzUHlIdWUrQlN4TE5Da0NTWlFJMnlleGlkckJScExpYzNiS2pYK2Rn?=
 =?utf-8?B?ek5QYU13YXFIS2tsU09QZ1lqSGxBUmc4MEE5RXp3RXhQYnRGTUUzZGxGdE15?=
 =?utf-8?B?MzJUMXNUUXJPZ25XdUQ4NFNncmc0VEZRWTZvNHVNMGtFQXlnTE5rVWpGTk9K?=
 =?utf-8?Q?09ls3ovc/4Ml4WhplqXJkgbl3zHSp7tO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHQyUlhCdWVHYktBVUUrREZOZHU1WWF2NEZmWGhMTXV0aGlXeVp4ZjFPYjNC?=
 =?utf-8?B?R1cyVGpMOHdvQ1JtSnZQWDRCZ3c2NUhUbVVNbGhQeFRNQ2J2ZGJqNFVFZk1y?=
 =?utf-8?B?bGw4VEpKWExHUjdZT3d0YmFOaGRSQmREZS9RQ3ZtUnNHNDA1OGlDSVdBQkJs?=
 =?utf-8?B?RVdPWERXSzJONWR4dGhYaGN6ZFJGMDZ2bjZaVmZCQkNMSlY2V2tqcnNVUUNx?=
 =?utf-8?B?cjFFNUVQOVZTV3J1cHRlNFVkQWdycFVnbWlKanZ5cFdHQ01PRWJpYllKZGtr?=
 =?utf-8?B?RGI2b1ZsenlGbG5NTEV2MjBTMjVPaXVxVmQwNHBJdU1kQi9JQXB5QWJ1U3F0?=
 =?utf-8?B?dmFMckl5ek9DWDlXTUt3KzY3ZGozUHRNZm1tVVRXUDc1Q0xBTmlYVm1mTlVu?=
 =?utf-8?B?U1dsSWpqaTBpNkRsdFdmNEhmZU85MmlsWHVlMDN3a0RwNDhvSnN3eGM0MUhv?=
 =?utf-8?B?TnpGdWFOZTNabGUzdTU4aEMrODlMNFR4S2d6YzAwSE5INWNMZENUNVJVejVw?=
 =?utf-8?B?b2ZtTjhiSW51cVZhd1ZmdEg0NVBxUkRXZ0ExV0VDVmt1Wi83QnZLYzhnb0Fm?=
 =?utf-8?B?SzdoRWRFamc5cmN3UjdhcGYvOHVNMVAreFdUTC83a1V1QjlyQVQ4bXNuRUdH?=
 =?utf-8?B?bUhIcGRIMmc0UkNoZm1GWVMyRHhVNStXTVFJMS9oQ3p0Q3BwRlNwZXBMU0w4?=
 =?utf-8?B?OUNBVXBuMGN3R3Z1L0oxVEhILyt4Mk5ydnBqY1JMOUtWbEc3SU93TWU3cmFB?=
 =?utf-8?B?cWJtUlpEMXd0OFNGL0U2cjhEdk5iQityVXdWbkw2VzFTNUlMNTRqKzRMT3BS?=
 =?utf-8?B?M2R5djBZQlBqWktmMnVYOGJKK1hmYTlCb2E0bmk5Yi9vUFcvOUs5aVFTc3V0?=
 =?utf-8?B?emJmclNaMjBVRDdHOEpFY3BkN3JCMk90VTJZaDFwVkxLdWYwSXZjTGJmSTcr?=
 =?utf-8?B?TzRwV001Sm94VG1IQXlFZTBLK2MvMENhd2ExUGZKcUJMd25NRjB3SzZ3UGRH?=
 =?utf-8?B?SjVXb1VMNkdzQzA1OUpsRGtid1N4ajdUOHpUem1WUlR4RlNycnNiVWVhM1kv?=
 =?utf-8?B?UFRlZFY4UzFOdW95d1hDZ3d2cTQzQXlDWVlHTDc0QzVlbnhZQU11eTFhRWNX?=
 =?utf-8?B?cUpDQU9GUVdIY2dCcWE5LzdzSkF0Nmh5ZWR1SWxCakdBcEdlWFRSVHo2ZEJJ?=
 =?utf-8?B?RlNIM0U4TVdCbjBVTE1nV01uTlZzcHp5U0lJbnl3a0d4VnptNW1GS1dDUHVO?=
 =?utf-8?B?ajBlaUEwRXl1RmlhUVlHTllTTFd2YkwwbGJJSVJ1elFRczlSSkM5NXRxWWpD?=
 =?utf-8?B?cW55OGJMNGllWm9lSE54SVN6QVZLeVRRVzJqQXRxVFBIRUlBMVVEZ0FpeW5r?=
 =?utf-8?B?cWc3VHF1aWhBdkZKVWYyczFvQldxVlkxN05JQjVyUDBnMSt6WFhHNUFHcGRS?=
 =?utf-8?B?Rm5lb2xac3BmdTczN25lTG5nQS9KNjRaY3ordkJ6MGxZUXJkVlg2OUZaa1ZS?=
 =?utf-8?B?U05FMUFoWTRsQUNXWEcyVWJiTlZ5SUtpc0ZiN09RQnFJb29xL2pSTVpZbXRC?=
 =?utf-8?B?aVp3a21rOHZjNHBra3ZzTVBVc2Mzd0hZbHhNMVhtZ3dBSC9LTitVZ25HMDdq?=
 =?utf-8?B?eEdDeGZ3eXFoRVNhbkQrQ1JwL3dZWkxLc0JZTUtMWWhaN0szbWRCOFV1bCtC?=
 =?utf-8?B?ZlVrQVpLSG1lL2hWVWlGZzNjTmt4MU95VXd2MjJ2YlRzRUFnK1hyd09rcU5L?=
 =?utf-8?B?cVZLWFNhbG44NEZXdWZJVjdIS3ZEU05mdlBBNFNkOGViN2VYUFVjazdxaExV?=
 =?utf-8?B?M0ZpS0daSGk2TE5lTTI4QlFvcFFpdHFSR2pDMHArUk9rTnFxYzNDZ2dZUUZ5?=
 =?utf-8?B?MUh3U0tqa1lFc0p0OHZDN2R6OG5GMi9FRFVlem5naVdCaGc5OTJHSmkyajU2?=
 =?utf-8?B?OWkzaGRyWjR5WnNsbEN5UERWakl5TVhCSzd0WEl2NGxmRGk4SStHaXhmZ3FB?=
 =?utf-8?B?enhPdE1JWFVxeEJWbmtCTTZDZDBKTytKSEx3cDZyK2g5bWs1RFg1NC91WWQy?=
 =?utf-8?B?QmNWRjhKenlyUmxsSmJaTnpraEZLdXFsQ0cxY2Mzb3daNCtodWl3Y2tDaXdR?=
 =?utf-8?Q?WMjlTFuYPFSp1ImsVCrdZh9MN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352db183-e945-421c-eeb8-08dd7a3580c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2025 02:47:16.8272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6lvKXYLXKz5b3hHpi0bUG+WtznxO+9TnU9t8C4u+BQTnnH/oIVeMmL5V2coiDaEwm2ZD1lDpTlKf+Z/Gjp3v3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7995
X-OriginatorOrg: intel.com

DQo+IFN1YmplY3Q6IFJlOiBbbGludXgtbmV4dDptYXN0ZXIgMTc1My8xOTM2XSBtbS9zd2FwZmls
ZS5jOjE1MTc6MjA6IHdhcm5pbmc6IGZ1bmN0aW9uICdzd2FwX2lzX2xhc3RfcmVmJyBpcyBub3QN
Cj4gbmVlZGVkIGFuZCB3aWxsIG5vdCBiZSBlbWl0dGVkDQo+IA0KPiBPbiAwNC8wOS8yNSBhdCAw
OTo1NGFtLCBTZW9uZ0phZSBQYXJrIHdyb3RlOg0KPiA+IEhlbGxvLA0KPiA+DQo+ID4gT24gVHVl
LCA4IEFwciAyMDI1IDE3OjM5OjU5IC0wNzAwIEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gPiBPbiBUdWUsIDggQXByIDIwMjUgMTg6MDY6
MTEgKzA4MDAga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4N
Cj4gPiA+ID4gdHJlZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0IG1hc3Rlcg0KPiA+ID4gPiBoZWFkOiAgIDc3MDJk
MDEzMGRjMDAyYmFiMmMzNTcxZGRiNmZmNjhmODJkOTlhZWENCj4gPiA+ID4gY29tbWl0OiA2YmIw
MDFiNmI2NGVjMjBkOTAwZDBkODEyOTRhMGYwMzFhZjU5YzNlIFsxNzUzLzE5MzZdIG1tOiBzd2Fw
OiBlbmFibGUgc3dhcF9lbnRyeV9yYW5nZV9mcmVlKCkgdG8NCj4gZHJvcCBhbnkga2luZCBvZiBs
YXN0IHJlZg0KPiA+ID4gPiBjb25maWc6IGhleGFnb24tcmFuZGNvbmZpZy0wMDEtMjAyNTA0MDgg
KGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktDQo+IGNpL2FyY2hpdmUvMjAyNTA0MDgvMjAy
NTA0MDgxODQxLmpiTDd5TDByLWxrcEBpbnRlbC5jb20vY29uZmlnKQ0KPiA+ID4gPiBjb21waWxl
cjogY2xhbmcgdmVyc2lvbiAyMS4wLjBnaXQgKGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0t
cHJvamVjdA0KPiA5MmM5M2Y1Mjg2YjlmZjMzZjI3ZmY2OTRkMmRjMzNkYTFjMDdhZmRkKQ0KPiA+
ID4gPiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4w
MS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUwNDA4LzIwMjUwNDA4MTg0MS5qYkw3eUwwci0NCj4g
bGtwQGludGVsLmNvbS9yZXByb2R1Y2UpDQo+ID4gPiA+DQo+IA0KPiBIaSBsa3AgdGVhbSwNCg0K
SGkgQmFvcXVhbiwgc29ycnkgZm9yIGxhdGUgcmVwbHkuIFRoaXMgaXMgYW4gaXNzdWUgaW4gdGhl
IGJvdCB0aGF0IHdoZW4gY2xhbmctMjEgaXMgbm90IHlldCByZWxlYXNlZC4gRWFybHkNCm9uIHdl
IHRyaWVkIHRvIGFkZCBhIHJlbWluZGVyIGxpa2UgYmVsb3cgKHN1Z2dlc3RlZCBieSBhbm90aGVy
IHNpbWlsYXIgY2FzZSkuDQoNCgkjIGNsYW5nLTIxIG1pZ2h0IG5vdCBiZSBvZmZpY2lhbGx5IHJl
bGVhc2VkLiBUcnkgYSBsb3dlciB2ZXJzaW9uIGlmIGluc3RhbGxhdGlvbiBmYWlscy4NCg0KV2Ug
d2lsbCBhZGQgdGhpcyByZW1pbmRlciBhc2FwLiBUaHVzIHdoZW4gY2xhbmctMjEgZmFpbHMgdG8g
aW5zdGFsbCwgY2xhbmctMjAgY291bGQgYmUgYW4gYWx0ZXJuYXRpdmUNCnRvIHJlcHJvZHVjZS4N
Cg0KU29ycnkgZm9yIGluY29udmVuaWVuY2UuDQoNClRoYW5rcw0KDQo+IA0KPiBXaGVuIEkgdHJp
ZWQgdG8gcmVwcm9kdWNlLCBJIGdvdCBiZWxvdyBmYWlsdXJlLiBQbGVhc2UgaGVscCBjaGVjayB3
aGF0J3MNCj4gd3Jvbmcgd2l0aCBpdC4gVGhhbmtzIGluIGFkdmFuY2UuDQo+IA0KPiBbfl0jIENP
TVBJTEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWNsYW5nLTIxIH4vbGtwLXRl
c3RzL2tidWlsZC9tYWtlLmNyb3NzIFc9MSBPPWJ1aWxkX2Rpcg0KPiBBUkNIPWhleGFnb24gb2xk
ZGVmY29uZmlnDQo+IENvbXBpbGVyIHdpbGwgYmUgaW5zdGFsbGVkIGluIC9yb290LzBkYXkNCj4g
Q2Fubm90IGZpbmQgY2xhbmctMjEgdW5kZXIgaHR0cHM6Ly9jZG4ua2VybmVsLm9yZy9wdWIvdG9v
bHMvbGx2bS9maWxlcw0KPiBQbGVhc2Ugc2V0IG5ldyBVUkwgZW52IHZhcmlhYmxlIGFuZCByZXJ1
bg0KPiAgICogY3Jvc3N0b29sIHByb3ZpZGVkIGJ5IGtlcm5lbCBvcmc6DQo+ICAgICBleHBvcnQg
VVJMPWh0dHBzOi8vY2RuLmtlcm5lbC5vcmcvcHViL3Rvb2xzL2xsdm0vZmlsZXMNCj4gICAqIGNy
b3NzdG9vbCBwcm92aWRlZCBieSAwLURheSBDSToNCj4gICAgIGV4cG9ydCBVUkw9aHR0cHM6Ly9k
b3dubG9hZC4wMS5vcmcvMGRheS1jaS9jcm9zcy1wYWNrYWdlDQo+IGNsYW5nIGNyb3NzdG9vbCBp
bnN0YWxsIGZhaWxlZA0KPiBJbnN0YWxsIGNsYW5nIGNvbXBpbGVyIGZhaWxlZA0KPiBzZXR1cF9j
cm9zc3Rvb2wgZmFpbGVkDQo+IA0KPiA+ID4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNl
cGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+ID4g
PiA+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4g
PiA+ID4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+
ID4gPiA+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIw
MjUwNDA4MTg0MS5qYkw3eUwwci1sa3BAaW50ZWwuY29tLw0KPiA+ID4gPg0KPiA+ID4gPiBBbGwg
d2FybmluZ3MgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4gPiA+ID4NCj4gPiA+ID4gPj4g
bW0vc3dhcGZpbGUuYzoxNTE3OjIwOiB3YXJuaW5nOiBmdW5jdGlvbiAnc3dhcF9pc19sYXN0X3Jl
ZicgaXMgbm90IG5lZWRlZCBhbmQgd2lsbCBub3QgYmUgZW1pdHRlZCBbLQ0KPiBXdW5uZWVkZWQt
aW50ZXJuYWwtZGVjbGFyYXRpb25dDQo+ID4gPg0KPiA+ID4gSXQncyBhbm5veWluZyB0aGF0IGdj
YyB3YXJucyBhYm91dCB0aGlzLg0KPiA+ID4NCj4gPiA+ID4gICAgIDE1MTcgfCBzdGF0aWMgaW5s
aW5lIGJvb2wgc3dhcF9pc19sYXN0X3JlZih1bnNpZ25lZCBjaGFyIGNvdW50KQ0KPiA+ID4gPiAg
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+DQo+ID4gPiA+ICAg
IDEgd2FybmluZyBnZW5lcmF0ZWQuDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IHZpbSArL3N3
YXBfaXNfbGFzdF9yZWYgKzE1MTcgbW0vc3dhcGZpbGUuYw0KPiA+ID4gPg0KPiA+ID4gPiAgIDE1
MTINCj4gPiA+ID4gICAxNTEzCS8qDQo+ID4gPiA+ICAgMTUxNAkgKiBEcm9wIHRoZSBsYXN0IHJl
ZigxLCBTV0FQX0hBU19DQUNIRSBvciBTV0FQX01BUF9TSE1FTSkgb2Ygc3dhcCBlbnRyaWVzLA0K
PiA+ID4gPiAgIDE1MTUJICogY2FsbGVyIGhhdmUgdG8gZW5zdXJlIGFsbCBlbnRyaWVzIGJlbG9u
ZyB0byB0aGUgc2FtZSBjZ3JvdXAgYW5kIGNsdXN0ZXIuDQo+ID4gPiA+ICAgMTUxNgkgKi8NCj4g
PiA+ID4gPiAxNTE3CXN0YXRpYyBpbmxpbmUgYm9vbCBzd2FwX2lzX2xhc3RfcmVmKHVuc2lnbmVk
IGNoYXIgY291bnQpDQo+ID4gPiA+ICAgMTUxOAl7DQo+ID4gPiA+ICAgMTUxOQkJcmV0dXJuIChj
b3VudCA9PSBTV0FQX0hBU19DQUNIRSkgfHwgKGNvdW50ID09IDEpIHx8DQo+ID4gPiA+ICAgMTUy
MAkJICAgICAgIChjb3VudCA9PSBTV0FQX01BUF9TSE1FTSk7DQo+ID4gPiA+ICAgMTUyMQl9DQo+
ID4gPiA+ICAgMTUyMg0KPiA+ID4NCj4gPiA+IDogc3RhdGljIGlubGluZSBib29sIHN3YXBfaXNf
bGFzdF9yZWYodW5zaWduZWQgY2hhciBjb3VudCkNCj4gPiA+IDogew0KPiA+ID4gOiAJcmV0dXJu
IChjb3VudCA9PSBTV0FQX0hBU19DQUNIRSkgfHwgKGNvdW50ID09IDEpIHx8DQo+ID4gPiA6IAkg
ICAgICAgKGNvdW50ID09IFNXQVBfTUFQX1NITUVNKTsNCj4gPiA+IDogfQ0KPiA+ID4gOg0KPiA+
ID4gOiBzdGF0aWMgdm9pZCBzd2FwX2VudHJpZXNfZnJlZShzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVj
dCAqc2ksDQo+ID4gPiA6IAkJCSAgICAgIHN0cnVjdCBzd2FwX2NsdXN0ZXJfaW5mbyAqY2ksDQo+
ID4gPiA6IAkJCSAgICAgIHN3cF9lbnRyeV90IGVudHJ5LCB1bnNpZ25lZCBpbnQgbnJfcGFnZXMp
DQo+ID4gPiA6IHsNCj4gPiA+IDogCXVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gc3dwX29mZnNldChl
bnRyeSk7DQo+ID4gPiA6IAl1bnNpZ25lZCBjaGFyICptYXAgPSBzaS0+c3dhcF9tYXAgKyBvZmZz
ZXQ7DQo+ID4gPiA6IAl1bnNpZ25lZCBjaGFyICptYXBfZW5kID0gbWFwICsgbnJfcGFnZXM7DQo+
ID4gPiA6DQo+ID4gPiA6IAkvKiBJdCBzaG91bGQgbmV2ZXIgZnJlZSBlbnRyaWVzIGFjcm9zcyBk
aWZmZXJlbnQgY2x1c3RlcnMgKi8NCj4gPiA+IDogCVZNX0JVR19PTihjaSAhPSBvZmZzZXRfdG9f
Y2x1c3RlcihzaSwgb2Zmc2V0ICsgbnJfcGFnZXMgLSAxKSk7DQo+ID4gPiA6IAlWTV9CVUdfT04o
Y2x1c3Rlcl9pc19lbXB0eShjaSkpOw0KPiA+ID4gOiAJVk1fQlVHX09OKGNpLT5jb3VudCA8IG5y
X3BhZ2VzKTsNCj4gPiA+IDoNCj4gPiA+IDogCWNpLT5jb3VudCAtPSBucl9wYWdlczsNCj4gPiA+
IDogCWRvIHsNCj4gPiA+IDogCQlWTV9CVUdfT04oIXN3YXBfaXNfbGFzdF9yZWYoKm1hcCkpOw0K
PiA+ID4NCj4gPiA+DQo+ID4gPiBBbmQgaXQncyBhbm5veWluZyB0aGF0IFZNX0JVR19PTigpIGRv
ZXNuJ3QgcmVmZXJlbmNlIGl0cyBhcmcgd2hlbg0KPiA+ID4gQ09ORklHX0RFQlVHX1ZNPW4uDQo+
ID4gPg0KPiA+ID4gSSdsbCBhZGQgdGhpczoNCj4gPiA+DQo+ID4gPiAtLS0gYS9tbS9zd2FwZmls
ZS5jfm1tLXN3YXAtZW5hYmxlLXN3YXBfZW50cnlfcmFuZ2VfZnJlZS10by1kcm9wLWFueS1raW5k
LW9mLWxhc3QtcmVmLWZpeA0KPiA+ID4gKysrIGEvbW0vc3dhcGZpbGUuYw0KPiA+ID4gQEAgLTE1
MTQsMTEgKzE1MTQsMTMgQEAgZmFsbGJhY2s6DQo+ID4gPiAgICogRHJvcCB0aGUgbGFzdCByZWYo
MSwgU1dBUF9IQVNfQ0FDSEUgb3IgU1dBUF9NQVBfU0hNRU0pIG9mIHN3YXAgZW50cmllcywNCj4g
PiA+ICAgKiBjYWxsZXIgaGF2ZSB0byBlbnN1cmUgYWxsIGVudHJpZXMgYmVsb25nIHRvIHRoZSBz
YW1lIGNncm91cCBhbmQgY2x1c3Rlci4NCj4gPiA+ICAgKi8NCj4gPiA+ICsjaWZkZWYgQ09ORklH
X0RFQlVHX1ZNDQo+ID4gPiAgc3RhdGljIGlubGluZSBib29sIHN3YXBfaXNfbGFzdF9yZWYodW5z
aWduZWQgY2hhciBjb3VudCkNCj4gPiA+ICB7DQo+ID4gPiAgCXJldHVybiAoY291bnQgPT0gU1dB
UF9IQVNfQ0FDSEUpIHx8IChjb3VudCA9PSAxKSB8fA0KPiA+ID4gIAkgICAgICAgKGNvdW50ID09
IFNXQVBfTUFQX1NITUVNKTsNCj4gPiA+ICB9DQo+ID4gPiArI2VuZGlmDQo+ID4gPg0KPiA+ID4g
IHN0YXRpYyB2b2lkIHN3YXBfZW50cmllc19mcmVlKHN0cnVjdCBzd2FwX2luZm9fc3RydWN0ICpz
aSwNCj4gPiA+ICAJCQkgICAgICBzdHJ1Y3Qgc3dhcF9jbHVzdGVyX2luZm8gKmNpLA0KPiA+ID4g
Xw0KPiA+DQo+ID4gVGhpcyBtYWtlcyBteSBidWlsZCBmYWlscyB3aGVuIENPTkZJR19ERUJVR19W
TSBpcyB1bnNldCBhcyBiZWxvdy4NCj4gPg0KPiA+ICAgICBsaW51eC9tbS9zd2FwZmlsZS5jOiBJ
biBmdW5jdGlvbiDigJhzd2FwX2VudHJpZXNfZnJlZeKAmToNCj4gPiAgICAgbGludXgvbW0vc3dh
cGZpbGUuYzoxNTY1OjI4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g
4oCYc3dhcF9pc19sYXN0X3JlZuKAmTsgZGlkIHlvdSBtZWFuDQo+IOKAmHN3YXBfaXNfbGFzdF9t
YXDigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiA+ICAgICAg
MTU2NSB8ICAgICAgICAgICAgICAgICBWTV9CVUdfT04oIXN3YXBfaXNfbGFzdF9yZWYoKm1hcCkp
Ow0KPiA+ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn4NCj4gPiAgICAgbGludXgvaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozMDo2Mzogbm90
ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhCVUlMRF9CVUdfT05fSU5WQUxJROKAmQ0KPiA+
ICAgICAgICAzMCB8ICNkZWZpbmUgQlVJTERfQlVHX09OX0lOVkFMSUQoZSkgKCh2b2lkKShzaXpl
b2YoKF9fZm9yY2UgbG9uZykoZSkpKSkNCj4gPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gPiAgICAg
bGludXgvbW0vc3dhcGZpbGUuYzoxNTY1OjE3OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g
4oCYVk1fQlVHX09O4oCZDQo+ID4gICAgICAxNTY1IHwgICAgICAgICAgICAgICAgIFZNX0JVR19P
Tighc3dhcF9pc19sYXN0X3JlZigqbWFwKSk7DQo+ID4gICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fg0KPiA+ICAgICBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBh
cyBlcnJvcnMNCj4gPg0KPiA+IE1heWJlIHdlIGNhbiBvcGVuLWNvZGUgdGhlIGNvbmRpdGlvbiwg
b3IgYWRkIGEgbWFjcm8gaW1wbGVtZW50YXRpb24gb2YNCj4gPiBzd2FwX2lzX2xhc3RfcmVmKCkg
Zm9yICFDT05GSUdfREVCVUdfVk0gY2FzZT8NCj4gDQo+IEkgdGhpbmsgd2Ugc2hvbGQgZG8gdGhl
IHNpbWlsYXIgdGhpbmcgYXMgdGhpcyBjb21taXQgZG9lczoNCj4gNmU4ZTA0MjkxZDgxIG1tL3pz
bWFsbG9jOiBhZGQgX19tYXliZV91bnVzZWQgYXR0cmlidXRlIGZvciBpc19maXJzdF96cGRlc2Mo
KQ0KPiANCj4gSnVzdCBhZGQgYSBfX21heWJlX3VudXNlZCBhdHRyaWJ1dGUgdG8gbXV0ZSB0aGUg
d2FybmluZy4gSSBoYXZlbid0DQo+IHRlc3RlZCBpdCBiZWNhdXNlIHRoZSByZXByb2R1Y2VyIGZh
aWxlZCBpbiBteSBzaWRlLg0KPiANCj4gZGlmZiAtLWdpdCBhL21tL3N3YXBmaWxlLmMgYi9tbS9z
d2FwZmlsZS5jDQo+IGluZGV4IDI4ODdlZDVkMzRjYy4uMDhiNTIzNDZjYzM5IDEwMDY0NA0KPiAt
LS0gYS9tbS9zd2FwZmlsZS5jDQo+ICsrKyBiL21tL3N3YXBmaWxlLmMNCj4gQEAgLTE1MzksNyAr
MTUzOSw3IEBAIHN0YXRpYyBib29sIHN3YXBfZW50cmllc19wdXRfbWFwX25yKHN0cnVjdCBzd2Fw
X2luZm9fc3RydWN0ICpzaSwNCj4gICAqIERyb3AgdGhlIGxhc3QgcmVmKDEsIFNXQVBfSEFTX0NB
Q0hFIG9yIFNXQVBfTUFQX1NITUVNKSBvZiBzd2FwIGVudHJpZXMsDQo+ICAgKiBjYWxsZXIgaGF2
ZSB0byBlbnN1cmUgYWxsIGVudHJpZXMgYmVsb25nIHRvIHRoZSBzYW1lIGNncm91cCBhbmQgY2x1
c3Rlci4NCj4gICAqLw0KPiAtc3RhdGljIGlubGluZSBib29sIHN3YXBfaXNfbGFzdF9yZWYodW5z
aWduZWQgY2hhciBjb3VudCkNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBfX21heWJlX3VudXNlZCBz
d2FwX2lzX2xhc3RfcmVmKHVuc2lnbmVkIGNoYXIgY291bnQpDQo+ICB7DQo+ICAJcmV0dXJuIChj
b3VudCA9PSBTV0FQX0hBU19DQUNIRSkgfHwgKGNvdW50ID09IDEpIHx8DQo+ICAJICAgICAgIChj
b3VudCA9PSBTV0FQX01BUF9TSE1FTSk7DQo+IA0KDQo=
