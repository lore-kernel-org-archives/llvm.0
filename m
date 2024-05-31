Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40F50280;
	Fri, 31 May 2024 22:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717194709; cv=fail; b=Cgyfnqhfvf6XS5M0tAb4sVwFH9o2u3w3XxfCUgnh60cat84kQRWmJJvWLOmqPncjsXjy7ba5vfWkuYM9ZMULcA6+DKLXNoBH0QIn3TwXf1ZxhC7PtEWGIy/+YTYhVfGkarCHcLHyi2KK66Ga1LWMggziyMixTeuEZs0sZlkbP2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717194709; c=relaxed/simple;
	bh=vGeD2l45++QipX9sfsAgJD0qPBXEyXdUpxnv2+GVs5E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hNqMsifUYCJxMXbQlRH3Z3H7bqiFRwBJDERUnXCzfJhnblUAVP76qZl8I+waH7fjDSvPfapUHwJoPzb4VFqVeepp5RPliPD/9mhKXGXLUdDsQ7HIWCaE230jvh/bR1KJ/N1/JPfqI2eSwPO5DSi8KgjcWicCM/J6Eb65Y2Ogtyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCOnFAwz; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCOnFAwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717194708; x=1748730708;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vGeD2l45++QipX9sfsAgJD0qPBXEyXdUpxnv2+GVs5E=;
  b=VCOnFAwzPLXzWoDWAOr/AcQ/S2Dis60gXGlPv8OAhpxnQ73STbr4YwBe
   0RwQr1jxdR9ytH8Nk1rFX/2fmmfhQcplC4abY1tIdtGRXWZFgtbsNGEC/
   EPAHT2z6Qdl6SheZjU0mLN5sNNahaLRxqLZ70BQHSPItHXbZEcN0RwEN4
   3HNesmlSKMiC1j1SI+o+5N0qB5vPBS5NhfFF/q3304CXe6Y50ALUM/SM2
   X+RdKpJOR9Z/oOMYAqywCX6xUZKVPngNv+v94vxXxWDKjlewvmiCq/MXU
   ZcAeO+6N3e0PDaxvrLEfdD4xaBt4kZdgGBZsIdJtiO0z1uPLYu0HzZY8f
   w==;
X-CSE-ConnectionGUID: OJRK7jtkQCqVhhrBnUkbIA==
X-CSE-MsgGUID: yLincD4qR/ahgg/Qq1DIxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="16710815"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="16710815"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 15:31:46 -0700
X-CSE-ConnectionGUID: 4BRKXTVJRUmx5lBBkzNkUQ==
X-CSE-MsgGUID: sUUsE/JmSWCzJSQPY6f+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36746535"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 May 2024 15:31:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 15:31:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 15:31:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 15:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffXWHw5tN1yZIuC4iwn1vta0T0qDgXt9eowURPYYnGF0IQtCfHtipPfxewfQSR6UUe4EFTCyeynAl1vhOyqTD2yD1dQpxvruHI49h30yFWpGK0T5+I6+gfSgZn5qzNQyrHYq883VEC5LbfkUOezbFEI4taFXfQJPAuKyTqmjC9to3bOfvFwvaFcOxcCKJgUg9kBXQ6g3RKHpt8veOPuyxm5NRZKGnwTGRzU/nGilZU8VzJD0OSJOTtUDkmik3LoK0VMlbdcjTH2ijMiATUS/LMdHeEKJft8ErjhV7C6C2goIq+rXX4eN6DC8M4zff2/WU1IC727cM4RdzhW82CIzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGeD2l45++QipX9sfsAgJD0qPBXEyXdUpxnv2+GVs5E=;
 b=cIWEkMroKdI+5GLtOmjEhesIlb3gkQKg8dFmJ49hebjj92lSkMxx6idRKlywlTPFY37/9d+6iJZP73Hi7+muA248fnKbWrPzIN39EGZp1d/9KGuMZ1m3wWd6VLrNRf2LBQiYgxk3sDexm5hvKfiszW/AEPLmAMItgUec1YxrBtAXAaaZ7RrwIkViU9lO8Q8idWUfzF/l4xoM+5pfMyen3P8uqWy6o9VdI4yvZIFMUMXhdAv64+QAPmm+gP6RK+dp8P4JP6mSlpy7nmJXPupgUX8nQWyftz/dBLWsG5DP2qoa1kaDUii8gjJvx/2aT6VkhxJ9dJskuK7n+lPBQ4F5BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 22:31:37 +0000
Received: from SA1PR11MB5921.namprd11.prod.outlook.com
 ([fe80::8e9b:65e0:d7a:e149]) by SA1PR11MB5921.namprd11.prod.outlook.com
 ([fe80::8e9b:65e0:d7a:e149%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 22:31:37 +0000
From: "Yamahata, Isaku" <isaku.yamahata@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, lkp <lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Yamahata,
 Isaku" <isaku.yamahata@intel.com>
Subject: RE: [intel-tdx:tdx_kvm_dev-2024-05-30 59/115]
 arch/x86/kvm/vmx/main.c:224:10: error: call to undeclared function
 'tdx_gmem_private_max_mapping_level'; ISO C99 and later do not support
 implicit function declarations
Thread-Topic: [intel-tdx:tdx_kvm_dev-2024-05-30 59/115]
 arch/x86/kvm/vmx/main.c:224:10: error: call to undeclared function
 'tdx_gmem_private_max_mapping_level'; ISO C99 and later do not support
 implicit function declarations
Thread-Index: AQHas4T7cTtKwkCLsEiEtLAm+28v1bGx6paAgAAC4YA=
Date: Fri, 31 May 2024 22:31:37 +0000
Message-ID: <SA1PR11MB5921BE7E4AF15FF36B0E5B3B8CFC2@SA1PR11MB5921.namprd11.prod.outlook.com>
References: <202406010133.Yu2O9Air-lkp@intel.com>
 <c51d84cab78bee2bfedcfdd1f4665c77c6e79a67.camel@intel.com>
In-Reply-To: <c51d84cab78bee2bfedcfdd1f4665c77c6e79a67.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB5921:EE_|MW4PR11MB6668:EE_
x-ms-office365-filtering-correlation-id: 0fcfdd3c-e828-4ab3-a8f5-08dc81c16f65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?R29MVkdOeG9GVC9uOUsrSGNvQUVDeXBHa253bTl6aTkzZCs0UmF1M1c0dnZm?=
 =?utf-8?B?ODR3NFdLVEl1Rk1wKzhwY2ZJdkE4d2FhYnk4cHZMSmFKQmdGcjJHa0V0ZmtV?=
 =?utf-8?B?YUxFS1diMWhiQXhvc091eDRteUFPZHhpTWhvcWlOTERIOUMrS215NnRIbXhZ?=
 =?utf-8?B?Qk93RlJOS0gyMmN4U0cxanlPSnd0OTh1UkVxVU5qZFJZdE9JV0NMdisxN0VG?=
 =?utf-8?B?dEZVRkRYUFhlMXY2SkRxTE85NjlJM08rQzVXOXI4U2NMQVlCbXR6NG1xQmVC?=
 =?utf-8?B?VFgramsvK0t0eVd4U1ZNa2ZNdUk2ZjNPT1l4VUpyOW85V2MwaHdYZHpQVzJR?=
 =?utf-8?B?UG9ZT2dPcS9hTGRSMFdzbGpMek85VjBOci9iZGdhWTVMZ2t5SFpPZjgyTVBh?=
 =?utf-8?B?dExqNzJhRUl1SlhLbys4TlFqdG9VVVJMTktYVzRvMzNDSlM3bzNiSjh6UDFh?=
 =?utf-8?B?djJuSU1CWTZGSFh6bDdTcDFRRndGRFJ5UDJMbG12ZldrQ1BzV00zMDd0KzBl?=
 =?utf-8?B?Vkk3eDFod2VBd2N2ay9GbTFlTUl1QkFGbWFwSzFVTTkwYkNwQ2ErcEM4YWZn?=
 =?utf-8?B?NlZ5cG80eXBVc0pZYWhFWlZHVExOUXBwaGM2VGsvQ2hHZ2xCNnJxd1lBbVVY?=
 =?utf-8?B?NU5KRHlzOGoxRTFZNURFcTB2Z0pXejA2SkJ0dHhGcmZic3RKTjZFREFLb2xU?=
 =?utf-8?B?dHJuMWU3S05yVWlsSXJvbHNpVW14ZHpiV2NKY1IwYld0R2FjNUVKc1g4cGF5?=
 =?utf-8?B?TUJsNUxqend2NXd1UUdiQkhzbEJjeC9tYmoxSW5DT0U0K3M4M05YdFpQbkpV?=
 =?utf-8?B?QmJmNFZxcDRXdmxOUFJFL0p6c2NTUjJQbHJBV3VVdTBUeXdWZkdpbk9aTFc5?=
 =?utf-8?B?c2dMWk55aHBBZU9UWEpkc2M4bStXQjNtWkhGVUpmdkZzd3g2SHNoMElxaFhy?=
 =?utf-8?B?WGc3SmNtVVA2bkJVdWYzUUNKS285OWwzdjhtZ1lHdWdHWW9jMFBuQVhvakZT?=
 =?utf-8?B?VmVrcUYwZitXZGZIRnI1dWZCbGwrTUtFZlpUeE9jNC9zWmhzTXBsYjg4ckVw?=
 =?utf-8?B?M2xQa2ovVnFia0VqbmlPREtZU3ZDR1J1U01VMDNqenNwT0psc2t2N1RwcWR0?=
 =?utf-8?B?aUVtRFR4bGJMQmpuT3pqNjRvcHE3TXp3NlZPc1FmZG9qUkhnb1gxcUNhM1JD?=
 =?utf-8?B?bTNOd29mby9UZGxZbUdaVUIzWVdZYXpvN2xtUTBNR1kzRFNqZWgvU2MxSkFz?=
 =?utf-8?B?a2lwdGlKd1NYSVJKVWtCM0s5YXlsRWpFNHpvTXMxeG1tYWRzWlpEZ3VQKzYr?=
 =?utf-8?B?WUN2d2VZaFpuKzIzRldES09PZzZHKzVaNmRzSllBWjN3RXYyYUpHa2pzMFk4?=
 =?utf-8?B?OEdoaVBUTUI0TXBiUnJ4TU9Yd2RBSnNKdWtGOUFZbi9ZcjdsNWlMYzdLb1Jx?=
 =?utf-8?B?cG5OY1E5VGxuTFZheEJvVFMwdkZ0VTBRaGVhcFF0c0tSN3VhUUw1SnRlWXhl?=
 =?utf-8?B?YjNWa2ZFZTRmK05TN2p0UEpBV25LbFNFWHpsRjFDVHA2b2ZxY3JyM3Vla2Qz?=
 =?utf-8?B?WGtzZ3hnZWp1SFh3TzFtdXV4OUdWSFU5bnRNSTNPcDB5cytjNzYxb2NxakNS?=
 =?utf-8?B?UWx1K1NPY0tmMkNEYVZudHVKTGNYR2NEZXBZT2RxbisxLzVEMHN1TktoWnhH?=
 =?utf-8?B?OEpiUy9qUFp0c0ZyTE9tN0hkdmRCV3d4cDE3NkdVQUZ6Q211anV5aTQzSmVu?=
 =?utf-8?B?VU9zeWVrUm5IRGdjcVNwaVloRTMrak9oSFlrT2w1aG9tME5kb2JRSXhHUDFC?=
 =?utf-8?B?YmNsamYxOG12Vm9FR25ZZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5921.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3E4cTZRRnExbXRteWl0dmtwVXRJRThDOGpBaUgvNUkycG9nd3Z1U1JlQ3BQ?=
 =?utf-8?B?M2Z0VkpraVNGMDgwYW9ZTGwyc0N2MVhodnJxVW8xd2ZKRnc4NExDTlFPL0JM?=
 =?utf-8?B?dzgzYUFkMW5VMkhNcmlSY2lGK21KOTFYT1FQbGYvcncrem9rVVZFK0VWOEJN?=
 =?utf-8?B?WklQRU9ST0FpeTBrUUtGeUFCSFVKZ1loWkhtVmVQZHJzUTAwUlNyZ0ZVVUx5?=
 =?utf-8?B?Q1luMjBodVo4cXdQcmk0VU8remErNXNiTGRqWkk3ZWt0QXZKTytkUjEvYUt6?=
 =?utf-8?B?NmNsMGVLUmR6ejN4N1hvWm1RMHNzaWEvZk9JTFRXU1NtMWlNK2xwUW9ncUky?=
 =?utf-8?B?TjFubW9LeTFEVE1DSitPY2xSSkZHNmo4RlpENFRISm5DK3B4bFJwODFVemtu?=
 =?utf-8?B?VURzTlVmTTBYalF5Ym13eFNEOGR5dXB6L093R3krL0FmajZSREdhR1ZqZm4w?=
 =?utf-8?B?MFdSUitCME9Dbi9ZYytnazQ3UVNzbkdLcnp1ZnBHYUFkWGFpRlVob1NKNDEz?=
 =?utf-8?B?Q0tCWjMzWmcwMkhBWlpITU5JTzlNTXFLb0ZqQytrZTRvVGdldmo3cXdXM1R5?=
 =?utf-8?B?eWM2N3FKRWZkU0wycWhGQmpTRnNQWm1CTEUrYXROZ3RCMVc4aUlHR2t4eElo?=
 =?utf-8?B?YWZ1QWoveHc0cnYwdkNLZXNIRUF2R3VUdlZueU9rZ0k0RzI0M0dqN05PbUtE?=
 =?utf-8?B?UDh6amJ5UUNuN2lJWTZ5bGZrWFQvaDF4dVY1UUY4M1N6eW9tOWVGRVQ5MjlJ?=
 =?utf-8?B?SUJTYXZkS2pOZ09mU2tWdDNuTXU2SFhwMFdLMFVUVm82ZmJVVjRPMWZNUW5y?=
 =?utf-8?B?RDBINmpCbDlVbjNCbmlJaU1lT01kYjZqanQvWXM0RHZiY3ZTaGJtcGRrNzI1?=
 =?utf-8?B?MTJFSGV4QU83Tm1welpLbjhKWEpwRjZua0FQZTYzWExjL08ydXQzelpBaHVv?=
 =?utf-8?B?c3Y1M2kybktRSE1nRG5pcENIbVFOcmdYYjhRb3p5L1hwbG9CdVZERk5iTWda?=
 =?utf-8?B?TjJnSjkrU0lnYjRlYVdaR3VmY0VtdmM0Wkh1MGlzK1FhMTdoRk9vWTJQZ3Y2?=
 =?utf-8?B?NUdSdVhMcSt3L0J3SzRnSGFmRndWdlBMRHRrMVJmOWcxNEVPcTZTdjZhbksx?=
 =?utf-8?B?TEdibGRncWtFZi90OGsxZ0k5TGZYV0NaenY3NE5zbkJiQnp2ckpuckdhcmhn?=
 =?utf-8?B?Z1kxS1o3VGVTZXQrK3VTdkxZNGF4a1hwdEI4aEtyVDhxOW9nTFV2ZEtoaVMz?=
 =?utf-8?B?bDhiS1k4Y3dxbkhGbVkxNTZudUtXWDZxdi8raW5DTFpwQmI4ejYyVTAvcDZL?=
 =?utf-8?B?RUl1UWNkMEpDcjY5VWgwZ2x5cHFuS0hDZGd4UXRidUlHQUtWM05jRnl6WmQy?=
 =?utf-8?B?MHQ5dzZUa082REliY1pyOEo4cG8yKzlJR2pRaExMQXlaUVNFR2VVYjcvQ28y?=
 =?utf-8?B?SCtDaHFVL1A5NVlNZ2srSkcwaVg5Vi9tL2pZOTBISGs4M0MzVWljc3RsSFNk?=
 =?utf-8?B?dGw4R3h5Mk5ILytTdzFCWjN5d1IrS0RQVVVMK3VnUGVVOUNvTjBsU0RwRG04?=
 =?utf-8?B?RjNkSHZYT3Y3ZmZIYU1LRnRMODlXMzZrZ3ROWkE1VWVKQjZkdmNWcW1jcWt4?=
 =?utf-8?B?UnFMalpnaU5YalNJOE5MMERjMnJLV3BJRmZKSzVqQldWbDRUZGdLVU1yMzZp?=
 =?utf-8?B?MzFFeXBKSkJISVk0N254MmhGN0pxU0kzSi9DM0ZmaFVMN1BoMitMUlViS0hS?=
 =?utf-8?B?c09kUHZIbFdUOTZwRnVjRDhISnVTM0hZM1Z6cXZGQThld2paN2hYMXRBOW8x?=
 =?utf-8?B?bDhHK0l2RGozZHZFU3Z4Y1p2a3NtR25qQWJSck9GWHVYcjRrSEcrVGREREh2?=
 =?utf-8?B?YzcrbjdNcU1FZHFJRTJhWVF6eHFFenpBZGNlK1BwMkRCYWFoemRCc0oyUDZH?=
 =?utf-8?B?L0VvM0hTanRpUk1wT3VzNWpHRm5RWEVTemZzTVkvTE92SS90MG41NmttclVV?=
 =?utf-8?B?YW82MDZCZnNXTTlyZThlVTdydlF1Y1RuQWJmTVRqb1dLTkdRWFBUbTdLakVC?=
 =?utf-8?B?MWgrWmQ2MkZJL0VrcHRZWlAyRUxFTzhYOXVQQmxDaTFTbUVUclhsZkd3ZEk2?=
 =?utf-8?Q?qrbKPNipR0FjxcUZNL906wqqJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5921.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcfdd3c-e828-4ab3-a8f5-08dc81c16f65
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 22:31:37.6930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2AWIuaIfT310o2G9YA+DUmbG8dCiu52Rcyyy3qTp9acnrrlUC1+4p9a7PW7S+O3j5YdXEZHvBY7HPtyPrWF+ULjgLXog+vmdRsLo9i4Kc5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
X-OriginatorOrg: intel.com

PiA+ID4gPiBhcmNoL3g4Ni9rdm0vdm14L21haW4uYzoyMjQ6MTA6IGVycm9yOiBjYWxsIHRvIHVu
ZGVjbGFyZWQgZnVuY3Rpb24NCj4gPiA+ID4gJ3RkeF9nbWVtX3ByaXZhdGVfbWF4X21hcHBpbmdf
bGV2ZWwnOyBJU08gQzk5IGFuZCBsYXRlciBkbyBub3Qgc3VwcG9ydA0KPiA+ID4gPiBpbXBsaWNp
dCBmdW5jdGlvbiBkZWNsYXJhdGlvbnMgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
DQo+ID4gwqDCoMKgwqAgMjI0IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gdGR4X2dtZW1fcHJpdmF0ZV9tYXhfbWFwcGluZ19sZXZlbChrdm0sDQo+ID4gcGZuKTsNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF4NCj4gPiDCoMKgIGFyY2gveDg2L2t2bS92bXgvbWFpbi5jOjIyNDoxMDogbm90
ZTogZGlkIHlvdSBtZWFuDQo+ID4gJ3Z0X2dtZW1fcHJpdmF0ZV9tYXhfbWFwcGluZ19sZXZlbCc/
DQo+ID4gwqDCoCBhcmNoL3g4Ni9rdm0vdm14L21haW4uYzoyMjE6MTI6IG5vdGU6ICd2dF9nbWVt
X3ByaXZhdGVfbWF4X21hcHBpbmdfbGV2ZWwnDQo+ID4gZGVjbGFyZWQgaGVyZQ0KPiA+IMKgwqDC
oMKgIDIyMSB8IHN0YXRpYyBpbnQgdnRfZ21lbV9wcml2YXRlX21heF9tYXBwaW5nX2xldmVsKHN0
cnVjdCBrdm0gKmt2bSwNCj4gPiBrdm1fcGZuX3QgcGZuKQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXg0KPiA+IMKgwqDCoMKgIDIyMiB8IHsNCj4gPiDCoMKg
wqDCoCAyMjMgfMKgwqDCoMKgwqDCoMKgwqAgaWYgKGlzX3RkKGt2bSkpDQo+ID4gwqDCoMKgwqAg
MjI0IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdGR4X2dtZW1fcHJp
dmF0ZV9tYXhfbWFwcGluZ19sZXZlbChrdm0sDQo+ID4gcGZuKTsNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZ0X2dtZW1fcHJpdmF0
ZV9tYXhfbWFwcGluZ19sZXZlbA0KPiA+IMKgwqAgMSBlcnJvciBnZW5lcmF0ZWQuDQo+IA0KPiBJ
c2FrdSwNCj4gDQo+IFdlIGFyZSBqdXN0IG1pc3NpbmcgYSBkZWZpbml0aW9uIGZvciAhQ09ORklH
X0lOVEVMX1REWF9IT1NULiBJJ2xsIGp1c3QgYWRkIG9uZQ0KPiBpbi4NCg0KT29wcy4gVGhhbmsg
eW91IGZvciBmaXhpbmcgaXQuDQo=
