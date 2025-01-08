Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A61717555;
	Wed,  8 Jan 2025 00:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736297834; cv=fail; b=uG1gUBBC0lwfiHeVf8KpX3jTajpomK8aDpao7IIja/F1h3ifnqkW6EhnaPpqdm9aEGCKnSxyAvvw4lINCMUithWCJdTcqWGxvZeg6jw+Epbd3rZ6xaFKV1JJDnLpca0l7pYoQE6Lec3SdOBRoHIavVRMigryvyBjaWGUqh8EEWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736297834; c=relaxed/simple;
	bh=Sg5WfhpIWoq7rXxkPMmhwol74KWeE7j3fm+k+GKE1UU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CcLJHBDpmDlxFlU6fWO4mHW7nGto4adFAqpb3l0fvIPA2LJyNyb38vpf3m/idU+1VJwoyIEEykQiZ+4pfA5JC/4i2zhP//waBjc2fXUFXHJ9SGxR5OViBICQw+T4/7VVGlzmd240MYJZbwiFd6xbeYFc5SysN9Pe1weoujmj0no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5EvWfcO; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5EvWfcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736297825; x=1767833825;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Sg5WfhpIWoq7rXxkPMmhwol74KWeE7j3fm+k+GKE1UU=;
  b=W5EvWfcOQgOdJ+4dAmzlVumNC4UPhaASUQmpOM7GiSJEXew1YFu9oH+/
   rbQi24398RcXnfULPKYgat0GiroWNUP2QxCCN+mO0yLEvnEzDw9AHGEVz
   vwvhCG/I1Z+RPQ2+hTRxNtARnIp0ji9+cCFc5pvKoAPjxnmmfZh4LPpPO
   dNHbtVvk3JSEVGgQHnrAR+sxM4OUgklH3W1zfRPcu9XaqXBePATmvaHce
   YlRX68EfKOklc54syO9IM7tK5yRt768N+gUiPhHHnelAGHDemcgdI6Q7n
   mNiJ2YfA+Z0VXS3C9sEXwSgIpMDxF36R1Yv07vbSzj4yui4cEXX6rUjcD
   w==;
X-CSE-ConnectionGUID: IDgtukCBTnS7EjnArjlw2w==
X-CSE-MsgGUID: vOzhPCE8SkeknYtFH35B+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36387464"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36387464"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 16:57:03 -0800
X-CSE-ConnectionGUID: xC0y/GvdSi2igOOcLcnJnQ==
X-CSE-MsgGUID: MfSVGAV3SWiJqh0XteL4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="107802273"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2025 16:57:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 16:57:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 16:57:00 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 16:57:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/9LUbEizRM+Gl0T4JC7fXNs2vn+Xc/pz2++/v+8ufc0VcdWRwEAgoPOzN1uh0MGefTTzVAoM8ob5CrALjgBkyCR8/r5f5yxeliQZ9tyTVe6A6hdx8KyAYmiRRSM4OcrJnSoP500QQ3SG6zF2e7yH9/lw4oZsXIBZwBiD2O75+qbUg+knKUqGO6TRN4ceAGO9hzpeGLp/rYuElPE/TG7RV757ADJ4zSwIwP/v8pCccLYlbt0/cl//f3yz4SF8n1m4y0w5l8udd3dZvqZQzEEozIIFcrtrx/I4jMsuKh/tE4P/ipYYl90jpxFmby+vtPJIl82DmPv9Aprev2lXtk6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZtxeqUV69gSLZwNrkMb7mO6njA+j9ZvJmaSRULJjFs=;
 b=o+EhVo1KH/4wOu4TtKf7TMalcTuCwBSNNdiG27pnomKEzLIwcROIDVjv1ZwyjZJ5grrWWnUhwqKpAJihEcLnhSafhK+vSM4KXZ9iniomz/SfWtpr+7LLOOcMjopMaXa7i3JK9jE70DcmnQQXXo0R6FPEXgApf+12+4f8LrFTUI2BdgVA4qBT0kqm4uggq0QvBxu/kgn5D+91+KBGLlxA4VgZUEqzQSWVb0zkFsItVgqeWfwDZrzHNyBt5QqXQn25e0mGJQB7ySdVmAT9XE6Ojb6XFl8BEn251f7cj3I6lmLBtkRd5mro+V0XEXXhgz5CrGgTdi8UJ3T5JyTHZT+mtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 00:56:58 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 00:56:57 +0000
Date: Wed, 8 Jan 2025 08:56:48 +0800
From: Philip Li <philip.li@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Steven
 Rostedt (Google)" <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: error[E0425]: cannot find value
 `__tracepoint_rust_sample_loaded` in crate `$crate::bindings`
Message-ID: <Z33NUGpt7FM6FKuJ@rli9-mobl>
References: <202412311507.14xdiaIX-lkp@intel.com>
 <Z3OyANq7fAkCs+Qi@rli9-mobl>
 <CAH5fLghNqbu2LO6SMr2Nsciji5k01tagaAEMZQ-WKJ8b9E56hg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLghNqbu2LO6SMr2Nsciji5k01tagaAEMZQ-WKJ8b9E56hg@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c7fb34-6943-41a7-596c-08dd2f7f59e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2lPNnBsc25jK3dqMkt4V3VLVWYxQ0tnRlBEb2NjSUpSY2xoaW5LSkR3bTBE?=
 =?utf-8?B?SFVSZzFwbkNDU1VXYTl4RTlnd1czZExTWmJtVDFnZnJXS3FxdG9zNlgrVlg4?=
 =?utf-8?B?UHJPOU9pOVMwS1ZoNVpiS0ZMVXRjc1lXYkJNM2ZXTUtqdnlwdHRmUzJMdlUy?=
 =?utf-8?B?bFB1dVlzOStUUXVFcDhTYmhtL09YNGpxZG1xTVg0THN1TUpGTi9sYXZ3c0VT?=
 =?utf-8?B?T1NpRVVZMjZWVWFIZ1lVM2V2a3JqRUg5MGZlWHB0WVpaaDFmRHA2bkZhYy9Z?=
 =?utf-8?B?TDU1ekhmem5GYXcwV255Z2tUTTV6eGREMG9kK0JSZjdTa2lXeWR0bXVnblND?=
 =?utf-8?B?Y0hwT0NpZ3dmeHBJdnEyb0lQbTIwWGt4QVdaSHpDZ0tlOWdrL3dYMmhIOTFv?=
 =?utf-8?B?TVliWm9yT3NwNDA4NnRkNjBDaElQdWhQaVUwZTY4WHV2a01sVk05QmtKMVRV?=
 =?utf-8?B?amptQ1NRRlFERlVYa0g5WVVnYjJITkxVR2RRWWFORzFwSzVRR01hUTBDT3ph?=
 =?utf-8?B?UWNTUytYTGV4UkFjUlJ0N2JEbE5NU2Q5cll5SHZaOEpvNTBYZVFVekFTUUFZ?=
 =?utf-8?B?dmNiU0pCVncvbFBMSGhWUW5UaThoT3JoTmNoaEpXRkZjRmMyeVhjZW01SlF1?=
 =?utf-8?B?RXkxQW9RR2E4ZGlYTW9uUnVlK1FNeGp0NWtwcnlkaC8wMWRpRnBPNktjZ0NC?=
 =?utf-8?B?QTArMXBsRzhYSjdzUktIejRjM2ZsRXd2ejM5OXBJeE84akNCdTBTc1FrdG5l?=
 =?utf-8?B?NDVlVHhMU0htNWEvNkpqd29Hc0s0OW9Fa25zbkVWdjJybnU5OWd2YmhWYzJ6?=
 =?utf-8?B?QVdpM1k5VDJNUmFHcndUZDdjVmx1TjUwWTRibmFVL1BGQWxYNERmRHJwUDlG?=
 =?utf-8?B?L3A1TWg5TEhqVjlwcnphdEtCZUhpUitSY0dCMXIvMUpVTlI5T1hBaUtKcUR1?=
 =?utf-8?B?b05qZ21YaXBlS3FpNlBULzVnRTgzMTgxY1NRbktWVEdPYTF5bkRkbzJvWkYx?=
 =?utf-8?B?VU1tNnZFaWw3YVlyczRxNWhUTk1UaG9rMlQ4bEJnVEwybzV6MC85VU9NanRa?=
 =?utf-8?B?UW42YzRMQUpCQldXWWVmMDJiTzRud0VnYysxMHFKZDVjY1gzUUJUa2J5NFBI?=
 =?utf-8?B?TWlhRzl5cUc3MWtVbXE1cGxXMkFxM1M5eFJpL0NGeEhsU2IyV1JxdE85MTZy?=
 =?utf-8?B?cy85RjZEUXdDdG9ERUpoblAyVGZqWUo3UDRJM0F0UVZUTklqV2ViOHlCWW9p?=
 =?utf-8?B?S2l4ZWg2VUx2NHdrZHFnNVZZS0RxWmtsMnpIdFE0dmpaQmhTa3VsUDlZTnlU?=
 =?utf-8?B?UjA3UHh3dXUrdVlzMXh2MUtNVU9RVk1pYkFSVnBFR0dSazI3N0pBZC9OV3pB?=
 =?utf-8?B?TXB6SXpMUCtFZWErMkpnSkM5NTBma1VyLzJ4alBqTUhvK0dQdDJEekxIR3lh?=
 =?utf-8?B?TlpzQkRRMCsxL3pydjlIV29QRmhLdGlSbU55NVZYUjRUM2RPMC84YmswUldT?=
 =?utf-8?B?aTdDMzZ0bmV4bTNiZzJvU0FBNjg2b0ZXSGQvZVV2RDJGSUxDL1ZiNS93Tno1?=
 =?utf-8?B?dlkwQlUvczJlV1hlS2hOdXlsaUR2ekh1bkVrUnkvQjI3RWdocEZhY1hPQXJT?=
 =?utf-8?B?M01hTCs2dTZtdnNwUEtBR3pONGpQWFJScExzeUhQbDlqSEloZlhVZ1hVd1Nj?=
 =?utf-8?B?a0FiS2VXRXVzL3lnZmZnaGpaRHdFODhIc1NiZ3JGclNHMVdnRFlxanNjeWdt?=
 =?utf-8?B?U3FWK3JwUy9hbFNhcWVyT3BvNGZJZjBTSUFEcTFRRE96WGdqekdWbkNTSlRZ?=
 =?utf-8?B?cGV6dUZCR1U3c1ZYU0NXeEhpYVFVYUJsakZ6MVFJTjlpZmxya01pbVRGSFBK?=
 =?utf-8?B?WXZjd28wdUUvTldseDNEUWtPMGJsSk5hdWc5bkNXR1ZuVkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUkvSGRRTzUyZHc0NGdIMHhQdlVnZ05QN2FvWFBLQjl6ckZGVXdRVzB5TlMx?=
 =?utf-8?B?ZXU3SEptNnFPU1FRdHNRUVF1Mjg5aUpvQ3pXSXhrNlozVWxtQ2xPeDZ2TEUz?=
 =?utf-8?B?Nmg3OS9aN25ZODZTQVJ1bStoWVRDSUE0T2lDVU43M2NkdWJmMWtQQ05OdXIr?=
 =?utf-8?B?eVpFRzkzN3p3dGZoY0gvcEFPL3hZSDJHcWY4RjBYOTFEMmZvRUJKeUZmNjE1?=
 =?utf-8?B?V29VODdua1dzWmpINkVpT2V1bVRMdU9rYk5WckFWV3VjQzZ5WGp2bThqRHNL?=
 =?utf-8?B?MXJsdm5uUWVVZ1U3SkR6bTY3c1I2eGtFd0o3eDhtVS9MTm95YjFRVFZrT1U0?=
 =?utf-8?B?L2JPNEdkckN5ZkNSN016WVRDTkN4L3NrUFJXekJHaTJTZS9LK2JhdGZMSC9i?=
 =?utf-8?B?SDNCMGFjSG9ENVpleWZUN1Y5L3dCWFE5SkZJd2VCWlJCRmtTTXg5NFJmVjd2?=
 =?utf-8?B?WCtLck1RNE45czQxcTY0N0ZBU1ZlVlZ3NFcxOG15ZFZYS0lzdVV4RGNHdWY0?=
 =?utf-8?B?MWlHckVoVWRIdUpBYWx1V3loSG5yelU3b2xwQmNrSjNucjYraDRmN0s3VFYw?=
 =?utf-8?B?dlR0YjRKR1Zka3FscVZ5S2FoOC9tTFJ2ZWxPTkt5OWFlUFBGSmFFejFQQVRI?=
 =?utf-8?B?T0pDVjFkai9TdFpXTVkxc0x3VzBSNkRZREViZDFIeHBpNENEdEJQSmxxd1Jw?=
 =?utf-8?B?ZDFIQ0grUVhDUjhkTi9pWnhFMWlvOXhwSzFDY3R0WXpxTlh3Z1hENVhEVllE?=
 =?utf-8?B?c2F6VExwQVdvMzFNWC9HNTQxRGNwdmpSZU16czJ1T3YzbEJSOWYyNmFYcEs5?=
 =?utf-8?B?QkhTejdZNDVRTUZ3eWxwajlKcWVWdzlVLzdFOEtPc3VRQVJnWTVLUGxjNVFS?=
 =?utf-8?B?ME9jOHZMTkEzSC9lVHR6K2REK21tQ0cyNUlaTXRxYmtTZmFlOVh6Tzl5US9a?=
 =?utf-8?B?RHYrVjU4TXJRV0pla0ZDNWZkREZLNWY4aTB5NW44TFltV2h5cHgzQ2FLNUcy?=
 =?utf-8?B?R2lqMUFaeWMwd243U3ZkS3l4Rm9hYWRMTWFJN0FHYWVPOUxvTExUY00vK1lr?=
 =?utf-8?B?WmlOS1hzN0o3UE9DL2Vjd2d3OUN5THpMem1KVHJ2bkFDekpEcGJFT2VzNVQ0?=
 =?utf-8?B?UTFUVFdNV1J4MHdGNEtWTUxSTFAwRjRsUzN5R3N5MGVXRG1pMzVHUlM5ZCtp?=
 =?utf-8?B?SThZdGNzOTBIaUsyenpOQmhGMllYWHc0L3NKYVN4RVNmKzNIV1JVY1M5WmUy?=
 =?utf-8?B?cTg1dXdmLy9VN2pZNlJGSERWdmtrT1diOTlEYlgrL0VJOUF2UjF0RjRhTDYy?=
 =?utf-8?B?YUVXdHAvSkFjS0ZueDJzbURLYmxqR1F1MkJUcnZHNUIzbFZVcnc2UGc2TlhI?=
 =?utf-8?B?NzUycVRXVDNCWlpLb1VvcUoyQ3c2UFI3OExNWHY3ZDFndCtsVDlMMWpTNXd0?=
 =?utf-8?B?QjFsZjg2QjNKclo4MUkwSi9yeEpEWndlNDMzVmFxYllsVXhKNEltZHVkcFdq?=
 =?utf-8?B?MVB3UHFWYm5IMVlveWJCczk4QXh2WGtIekFUdWNNcUVRV2dad09uR1ZMcUxz?=
 =?utf-8?B?THRuWjNkVUdibEpJSVpIbnI1SzFVYkZIeVZOYW1GcTNqa2RBenJvKy9zR3Ir?=
 =?utf-8?B?RnVsU0loUWtmaE9CNHpRLzlXT3FNMzJZSUZ3U0hxekM4VVhXU2hZSlFkbDlw?=
 =?utf-8?B?Y2s1VEJlWGgvcnVYYnhKa05IVzRCa21LVFBDMTFlVlNSbHpFMHBtblpjT0Q2?=
 =?utf-8?B?WTlSNjRsd24rUmxhMU1tY2JpR2Z4a0VUWUVMdmNxc1dnOVRLM3F3bkh3NSsz?=
 =?utf-8?B?cEM1eHk4ckQxcmNjNmpxMFE0b1ErWUlJSzdodUx6K25ra1Z3S3VLc3pTempn?=
 =?utf-8?B?RWJJSDB6czY3R0ZHMklBSURjOEh4RS9RWElSWlNhQVRtNVZRVW51V1gyWFpR?=
 =?utf-8?B?dWVUeXM4VVpzb1c5Q1FBaDluNHdVSUR4cXZ1UjZQSk1vMFRpQzRSMFBEZi9E?=
 =?utf-8?B?Q0xLSHhnNVhpcmtwM1ZxTTNmNmdBdE1BOU4zdHRUeE50U1NJYkcrWlgwNGhr?=
 =?utf-8?B?VW0ydVNkbk9Fa3hGNGxiKzBpOHhRa3FCK1pzNXI0WTdYZHRIWEtjWDNhYU92?=
 =?utf-8?Q?qVNexsjX7kRmCo9zdOVR3INQt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c7fb34-6943-41a7-596c-08dd2f7f59e5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 00:56:57.3093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeGS0yFCr9L9PUH8aenUt3D1nSCmkDbfwtuI2znVTzHPF1wy6OGtLZtfYkfOX5oBRLsKbpR4cNQS+YbravnFLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
X-OriginatorOrg: intel.com

On Mon, Jan 06, 2025 at 12:49:43PM +0100, Alice Ryhl wrote:
> On Tue, Dec 31, 2024 at 9:58 AM Philip Li <philip.li@intel.com> wrote:
> >
> > On Tue, Dec 31, 2024 at 03:15:47PM +0800, kernel test robot wrote:
> > > Hi Alice,
> > >
> > > FYI, the error/warning still remains.
> >
> > Kindly ignore this report, which had already been discussed in [1]
> >
> > [1] https://lore.kernel.org/oe-kbuild-all/CAH5fLggEzmerC6Qg1fjuc_wiy21BJQGGYdZSZA+KV=oP6q9iJg@mail.gmail.com/
> 
> Would it be possible to upgrade bindgen used by this robot? Please see:
> https://lore.kernel.org/all/CAH5fLgjmtuZ7Sxp49GoGC079sXqS4wmsEmZKM-T4Mh9FycDYGQ@mail.gmail.com/

Sorry, i missed this suggestion. Sure, the bot side will follow up to
upgrade bindgen, so far, it follows scripts/min-tool-version.sh to choose
which version to use.

> 
> Alice
