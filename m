Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021123.outbound.protection.outlook.com [52.101.95.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8A433556D;
	Mon, 26 Jan 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430311; cv=fail; b=IoTDEym7uiLNB8ePCCy60AHWdfHeN5Y0dQBY1q4YXXPhtI0ZKcVUX5ZbQvBfUPOWYbf1GV6qPAZlHRe8bx3tBlP2KIg25lAyZjZuW9F4iH7GJ4kEjPQq2NCKecLi0w1byR5U5879xUYNgtl3dMu5HtscDozvJuJ5/xTo4I1oUS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430311; c=relaxed/simple;
	bh=P8gxOD8RKmGgRxdyOamMFL9Tif7fN1j7OrxlTLXu5Ms=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lFYkRnwsofvgzlfZIXVFvx+/8GBiGnxCFFTkStd2ALjYRNXoehn4iU2QTWwKMlFm+dF/gYo6iu6plqqNUyXZHvadryZO5GfyhO9DfKtCaoshCFMi87CVg46b/MqcpxjBXmjQzPkKWyHDkdK/BhYdU/twejSADVcaqQ77Xc0ejX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LHmvBGcA; arc=fail smtp.client-ip=52.101.95.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LHmvBGcA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+tW1YPALltPgbm2aZNU69ekAf/UpFpd1tXk77MPoiZr06azW5FmJmAFVv1ueXB4d54/eQ5ZhmpZwwOXMMQ6M3Bk/TXu4LDNXofdW4bJ/YeW8VRL8PsxvSMIUkOY5cdX3XTE7yfX4ldn6g2/QJaDtyhHT7x3MCON+BT/S9up3KfEoybfq7MHXqtdvOaSVQRZ713xKCfbkYWJSs+Ph+aitxjI3GzBouXXVPKYQkEyCs1I0jUDUmHEsmRqnBhryyLhmZ6zryJUETBYqq4IjJIY2KkHJfOxaddVNJkHvlG6J2ozHYAb2nAFSQntuqtS3cLdnnHxVKbBv/vA1pdUYaBwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehQKx7YdooiDe3ynkF6Wa7T3MHT5wHE398oxNxP9Lr4=;
 b=HxRWK1xOrVv4Y05t+Se9tOd8Ah1W6UTovWV9NTJLGDKclzBAlF2BG9IAFnbN2A24S1Peku4L/ikgq65mKh8XM1Sn+Ax51oLHlvzE7IBn9kOJwaZ2CPsv5rQu9WdoBxK9gl7he71qoi+WM3oBo4RqV73bIfu1Vg15Q0wiun76oDfikE617A4CYGcbEgcocQ2sMDrYpU+4Czc1hRzRIrsWquMuVvY8o8HeJ5fDLd+ZJyNHULVIitLR8jQjqBXGFnWbqHlkN2HqCTuiHcTdgNTBeNKP6L3lKlv8CYGbyEAC/z2ax+MGQnFtd6ZwboaAhoiiTQtPH56SdHY1jpf7/wjoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehQKx7YdooiDe3ynkF6Wa7T3MHT5wHE398oxNxP9Lr4=;
 b=LHmvBGcAoglP1f4Hbrp9kr2IeSyWB2EeYSFMSjtpQU9upOIGUMjN67jj9jOWjD6bvarjP17SMtqjT7//RPU3cVsgWy7XRnNs5gdbJztOAA5GMjAGHXwtph669xJlZmedsX5qxDGgx8HHbmAzeI2kowotLmK//biCdMEPh68ao24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6816.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 12:25:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 12:25:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:25:03 +0000
Message-Id: <DFYIOZVRU5FI.K45LLC9U4U0W@garyguo.net>
Cc: "kernel test robot" <lkp@intel.com>, "Gary Guo" <gary@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Panagiotis Foliadis"
 <pfoliadis@posteo.net>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <llvm@lists.linux.dev>,
 <oe-kbuild-all@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of
 `as_ptr().cast()`
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Tamir Duberstein"
 <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260122144444.265412-1-gary@kernel.org>
 <202601250701.wXxtGd9z-lkp@intel.com>
 <CAJ-ks9=N6GViTH-7Ki1qpSfRdByBFxb9132et7J0OXTTcosLwg@mail.gmail.com>
 <aXcyWhM-KSg52t0I@google.com>
In-Reply-To: <aXcyWhM-KSg52t0I@google.com>
X-ClientProxiedBy: LO4P123CA0586.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b8d2ac-5283-4ff5-71e4-08de5cd5ef22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVQyQVpRU1V4QnJNU1FONE1xZ3RDVGlxT2loOUEvUCt6VGtGd0lmQmU3K2l3?=
 =?utf-8?B?andacUE0TFUzYW5EakpWcGhHMXZkR3dPbmlmQWF4T0xIWXV4cnVnTVd2N2NI?=
 =?utf-8?B?cTZ6V0VmY0V0SkRMSk1UMXJBaklXSEJIcFk3N0pIakZkZlk4OHROdHJKUllo?=
 =?utf-8?B?dEYvNzRuOXMwWVZPb04xUm9lQkxZOXhFUm5kaTB4MThPbXE2elZVTldBdm1m?=
 =?utf-8?B?V2piWElvVVUxaG9renBXZ0xJVkg5c0F5bGgyamdSM0ZRMGhLRHR6aThjT044?=
 =?utf-8?B?dU5tMldFaTBVYUhBWmVTSFRqd0dyNFhpblFINTA1dC8wQkxEN0thZko5WG95?=
 =?utf-8?B?a1lEeEZBL2ZhRE5pN2MzOXVpM0pETVI3YW4yN2dDa2xFSFc4RVNmR3RpS2VZ?=
 =?utf-8?B?bDU3RU8yYmN0MlNmQXJKNmNkTXpTU2N0akYyWDlrWjFVRjZ3Rk51d3VrM0JV?=
 =?utf-8?B?eHowMnpEeUxScDh0dGxzQjZKUmttTUxtbEVVclBQM2IrWFZmUTlNMzliTTMz?=
 =?utf-8?B?d0didWVWUzVQQTQ5eHJieThFY0xOV1N5Z3EyUTlyKzBUeDJMU0srSXRDUE95?=
 =?utf-8?B?ekVLeXBCR2xYSnVpenlGVlpWeWJVZnBGMXFVdDZ4TGhRK29pV1NTREdNeXFa?=
 =?utf-8?B?MGVvRkpyczZtOVdha1ovYld5a0ZGVnhFL1JSMjROeTRCYzl2Znp4RFVnZlpM?=
 =?utf-8?B?dlhuL21IcUF3eElhY21KS3FvVUtLNFBZRFFacEtEZ0d0Uk5PL0RZVHk2aVFI?=
 =?utf-8?B?N0xtMm9zOVNRTWlZMmdxcWp4RUMzUjFHZldpaFg4UzQyT3VlQnVJUUlLcFZI?=
 =?utf-8?B?TXpleWFFdUhuRzZ2RHp4RUJtOFdOYUFIQ1k4WUROUjkxQ0NrbUExbHRmZHdV?=
 =?utf-8?B?dTJmWU1PSmdiL0VtY1N2NUFEa2orSzlESDE4QUpKOUNvMXlnZUd3UUprL2NP?=
 =?utf-8?B?c25weXhHMXJTSHU5MmRlQjVSeTBNSWZBa1UzdWdMS1ptV1VQRUpoSndkMVp3?=
 =?utf-8?B?TzM1UmNOdjZMU21qaStuWTVFbUpRVHQvYWVUN2tlU0QvWjViWitQMGhlQlVD?=
 =?utf-8?B?QmIzbjF3eGoyZWpOQXVrREgxQnpibk8wVUUxSE5wZ1hKYVM0cWZGYS9uU0JQ?=
 =?utf-8?B?YUJ3Q1lXR0tHcEVYNm42cTVmdUtyZldvS25Wa0R4VDJPM0pGc2E1SkdUVEtr?=
 =?utf-8?B?MGNNc2lhR0tJcFNPUlFMQytFeFVqa09KQUtLT1lLMEJjZGV5M3dNWUxCdmlr?=
 =?utf-8?B?TnJmcWNXa0paS1dyR3J6YmR4eEJTRXBDTVZaSTgyWWVFbDFacGxRRmNSVXVR?=
 =?utf-8?B?aDFScU43ME9QY1ZsUlIyczd5VjlJYnF4OFRYZG1ERXpsOXpWeE4zMEUvTElv?=
 =?utf-8?B?aGtUMUFmQjduSllJaUNTOUZLS01Ca255VjJ3RUxvYlRGdkVwOXdUKzRsSzVS?=
 =?utf-8?B?OGladWwvbktDY3cvb3c4N0NtRVJLV3dhcVhwbW5JMENJaUEvN3h6RW1YT0lD?=
 =?utf-8?B?VVZLaXllWXU2UEFITlhRR1Z5eVNMdFcwWUpKS2hLNGQ0NmFnME9FeUl5SXlK?=
 =?utf-8?B?R1FtZ0JybmJZbmk5WjNaRGRMNXYraWJpVG4xeXhzdlBFU3AyVTJDbC9CWUdD?=
 =?utf-8?B?d052cmpVK1VXY3dseE16ZEFMQUR0S0lDQ1dxUXNrN1JYU3FrQm5SUWdjQSt5?=
 =?utf-8?B?SVQ2eGI5bE5uNGJEbjRmRDVqeC8ySXRsU1E1SmJlTUhrSHJMZEc2SE8zbmx2?=
 =?utf-8?B?OUFKUkVlTkREK1oyanF6Mlo0NmlTS0MwWENxT2RpcEFuNzFHcCtrb0JWVE92?=
 =?utf-8?B?c3pnR2ZDSVpWczVqVldZc2lVaXdiVzhPMTNGSzJrRm9xb0xXaFF4UjZQUXlz?=
 =?utf-8?B?dlFObW9vUGVNVUx5MTFqQzY4Ukc1MHBFdmd1bG5Bdit2bi9CNFR0UEl4bHM5?=
 =?utf-8?B?RGZtZklpZVJ3T2JaUURaTit0Q09xY3Y0bWtNKzhsa2pHMU4yRGJWeHJMbFVX?=
 =?utf-8?B?Zy9VN1NCclE1ejV6TURYakxoOXVLdkJsYzZEc2owUCt1QnRzRitqc2FvUFhM?=
 =?utf-8?B?cCsvNmJWdmNLcVVMd3hyamRhSmFmN1Zoc0t6cUdaaTVmNWV5N1lPWFJFQkFD?=
 =?utf-8?Q?4Mk0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am9Gd2JPbGppdVN3WjV0UjU0MXZ0UXVBS0lHMFRtR0JvdVA4dFdXOTRlZ09h?=
 =?utf-8?B?cUFuaVZtMU9wK2RZM1psYWpKUFRNSERCb09hS3pkbHBFdjdva2xUTFJGay94?=
 =?utf-8?B?bThYVWJtTzVTS2N1U2hzM3VSNkxPbHBPbW9Ka3I3a1ZKa0FocHoxek9LYklw?=
 =?utf-8?B?TWNhV2tQc3h5d1JhcXVWakIvWnlwcVpZWnlWQ0xvRjBZWVRSTnk2ZmZaa2cw?=
 =?utf-8?B?TmVBTk12bWxMdDBOeTJtVFJtUmF0VHVaY0xMeGh2VnFKM0NXVVE4Y28yYS9W?=
 =?utf-8?B?WDhEajhId01FR25lcCtWaHVCVFJhQ0dzcG0rWGhucXZ0K1l3Q3F0cDV0bXBC?=
 =?utf-8?B?UkIvY25GWVZsUVFOT3VYbitUK1Vxci9kQTRPT1ljUkh3eUs4bHU2VytyY0tH?=
 =?utf-8?B?Z25DSC96WCswdDlXS09RUGNZN0lFTDg0VzVMdnFrVVFFV1hLR0tKeVdRbEpV?=
 =?utf-8?B?ZVAwMWVVdTlDZUo4bVJWUlVxTGExdDhrdXJrUEtiUTVXWHJsZWtnSzduTUYv?=
 =?utf-8?B?TFU5cmtWK0ZzUlhBSko3dzZSN2ZtSkN0dlhQUGt4MVJ5NzJKQlE5b2p1d2Nr?=
 =?utf-8?B?dFhPTnNBU1NJd2tDTGNvcE5JNWNlNVZoSjc0MXhxbTFsUGpEcHRhL3h2ZjQ0?=
 =?utf-8?B?MW1XZ3kzYlNSWDFtdytRNk1tVEk5eEJkT1kzQUVnWmF1b0RINFFGMHdYOTdh?=
 =?utf-8?B?UGtPZ1FCbFRyOTMwSlBOTzFZb3JoYUNnWEZqeVBxRG9Oa2lLL2lQdy9rUGgy?=
 =?utf-8?B?aGRwZ3ZLcmRoQmhJTlJpK3JMd0xuYlpYMlZpa3BqVCtMSlRUbmNucDlOS3kx?=
 =?utf-8?B?T1hQNmhZRDRGREpqeTJTWllYRTh6c2J6c3dPUWsxWTRqSUs2SUFxaDBMWHJU?=
 =?utf-8?B?eFBWZnp6ODVPTHA0d3hwRE9WYWxtQkdTeU5hVStFK0VnSFpWVFYyS2JML3pt?=
 =?utf-8?B?YzdQQjJ0M3V3eDNYQWJaM0dTMFkxS3A1d1djYnlEdTVQZmFjN05ZQ1YzdGo3?=
 =?utf-8?B?Z3QyMTdVOWcweHczdnJHV2NTQ2k4dC9mVk1lTzE4NmNXQlo1OWhGUzdMK2dr?=
 =?utf-8?B?K09xQWdyYUZuMm5GUWw5OFVZUEtJRkV0Qzl1RERVVHdkZ0xXSUxQa29tMUla?=
 =?utf-8?B?N2g4MDBDMXgxS0VUV0lJZUd4b0c2SnU4a2VXaXBHbndCVm5JTk5KZWE2Z2lv?=
 =?utf-8?B?d0w4SFRZYnMzcWpiME8zM0tCNzNJZFkxazJGTjhJTzNMT2ZIanlqRmVhdmRW?=
 =?utf-8?B?NC9vSStDYTVNWnJrN2VvUVRzS3hnK2x6S3dZWkJrazVlUFZZVXE3K28vL2Jo?=
 =?utf-8?B?WU0rOTE0elpFYkVISnJ6M3BkTjBteHl4dWp1T1ZCekp6cHE0NWlTQzJVRVlj?=
 =?utf-8?B?UnBzUFlsdTRxVWlORUhFT1RTeTFsMkwwb3ZkQm53NVZ1TG9BcFJwYzZsclA0?=
 =?utf-8?B?QVI3cGhTdkhIR3lyUDI2TFpqTEtJdG1iRDhFOW9sUWZQRmE2bXN5VDh6cHJE?=
 =?utf-8?B?Vk96YTNsaTF2Tk1VdU14NUZOMFdSSEFUaXliL1Bra0UrbmZzQnNUQzJQUTZs?=
 =?utf-8?B?NHExeGZjdno3ay82QTFWT2RZdUJRUHJUd0lHcmZsNFhoNmVYaWpPYXFjcWRK?=
 =?utf-8?B?c2VzQWE5U1RLZzRIUE4zWlpLc3BLckJkS2J6UFdvbHF0Z2RIY1hBeWtsUHBs?=
 =?utf-8?B?UmpIYmN2TmtwRHlyOVZXMVpYamplR0JWYWh1MVZpbTArTzlvU3FWRUxsRWps?=
 =?utf-8?B?cUdWRk9QdkZSNElQMU1VenhTRDdjWXJka2dSdzJ2c2lpYVJIOThQYUt0ODJo?=
 =?utf-8?B?RkZqL2ZpcWdSVnArNU5HVnFUUCsvbFZmOFhvRStGa0x2SHpRTzQwUHhFZE50?=
 =?utf-8?B?ZFh1NkxXWlk1RkFjYU9NTmpNRng0dHE0Ly9VOERQaGhMcTdKTTFHRzhQV2VX?=
 =?utf-8?B?SGwwTk05OWE2MHhHU0lQMkFkdjJrQk1KK1Z6VkRXT21laVpTc3ZCWDJsTE0y?=
 =?utf-8?B?RkRWMWJGY1oySk1IOTlZU2VjRlU2d004OEFwc3l2L2VuWnAraGE5LzhXRHR0?=
 =?utf-8?B?UUNGRnA0Y1JhNHc0U3pkak9UWWV1WkJobHJ2TmhOQndYQU5BSmpDb0o2MU8x?=
 =?utf-8?B?STBGdXIvRmlLekVlZDdzS3Qvb1pKRjF1UkJJdXlmRlR5L3ZjaWRVdnBWcHYv?=
 =?utf-8?B?WVhxU1VFL2N3ZENLN2xocXpyOTNvcHBkbE5IdTJzd1VDRUxSTUN2djlOL3Y0?=
 =?utf-8?B?VkpkMWtaN3dmdFBxMEg4b0xLeW92QmFHS1J5a0ZKWE1uRG81cEFMSm9oQ2I0?=
 =?utf-8?Q?NWiNJQ6Fuy+RrxIjsn?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b8d2ac-5283-4ff5-71e4-08de5cd5ef22
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 12:25:04.3703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqFqBi5dU6lDOdJONmivUdhICq6CSvuUc53g9tY503E0KZJUfuTftTLvWFIcDD4hiTWTKOO2n0nCgt7jiU7I9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6816

On Mon Jan 26, 2026 at 9:22 AM GMT, Alice Ryhl wrote:
> On Sun, Jan 25, 2026 at 03:19:53PM -0500, Tamir Duberstein wrote:
>> On Sat, Jan 24, 2026 at 6:34=E2=80=AFPM kernel test robot <lkp@intel.com=
> wrote:
>> >
>> > Hi Gary,
>> >
>> > kernel test robot noticed the following build warnings:
>> >
>> > [auto build test WARNING on 053966c344dbd346e71305f530e91ea77916189f]
>> >
>> > url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-d=
isallow-use-of-CStr-as_ptr/20260122-224657
>> > base:   053966c344dbd346e71305f530e91ea77916189f
>> > patch link:    https://lore.kernel.org/r/20260122144444.265412-1-gary%=
40kernel.org
>> > patch subject: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of=
 `as_ptr().cast()`
>> > config: x86_64-buildonly-randconfig-004-20260125 (https://download.01.=
org/0day-ci/archive/20260125/202601250701.wXxtGd9z-lkp@intel.com/config)
>> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20260125/202601250701.wXxtGd9z-lkp@intel.com/reproduce)
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601250701.wXxtGd9z-=
lkp@intel.com/
>> >
>> > All warnings (new ones prefixed by >>):
>> >
>> > >> warning: unused import: `str::CStrExt`
>> >    --> rust/kernel/task.rs:12:5
>> >    |
>> >    12 |     str::CStrExt,
>> >    |     ^^^^^^^^^^^^
>> >    |
>> >    =3D note: `#[warn(unused_imports)]` on by default
>>=20
>> Seems like the import needs to be conditional on
>> CONFIG_DEBUG_ATOMIC_SLEEP. Aside: it can also be `as _` since it isn't
>> named directly.
>
> Can we just import the prelude instead of having a conditional import?
>
> Alice

I'll do that in v2.

Best,
Gary
