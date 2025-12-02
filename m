Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361663FF1;
	Tue,  2 Dec 2025 08:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664489; cv=fail; b=VdgfLtxCEBeyJgJdpCZj/z7fyU++Br9xUVKoq4Nz7B3P6wdMEsI5mi6dunI3Ah9Xgw52DLoGWcNrlRG8ctLaVrhvTuf1YebfNLXEuQq+IrTe3M4mCq0Rw3/mzmsTe7X9b6U+MZfzMtdERrrFleLEIu+N8twScLH0N85QS4Bcryk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664489; c=relaxed/simple;
	bh=Xl+MW30giuInmxRXWvIe/FDkRgIxGxDn9MFGUySm8XE=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PC2u+VcZ46JMt8fGmuHwlVa6IDLaCjg2LP77nyKgLvWCWNb1ASxKX+3v5zqCqM1pju9Xl0JcrVvXjpWC/wThwZy5VFkKapJtxcwhlS2xB2tRZd0aQ7sROWfMwqhNCaUMPgMzrcg//CMabdLmDNgCxXb1EHsy3rawhvmKw5moct8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EFPD/zl4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kkQ3n5eL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EFPD/zl4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kkQ3n5eL"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B21NNVe3288411;
	Tue, 2 Dec 2025 08:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=my9VgQVuiCjfCFl/gtGG1DOdZZBW8Wa4O+ZiMMBzpVg=; b=
	EFPD/zl4mkMkMNx9ddQa+6JOg3o11Uf+dXFKmXVtauRwg/IQqvDEhpmWiqgryjhf
	cM4RINcWOui3KRuIbJ67Tw3nu4h4va9yaGy61o3Paad59zwckUsXq+phpCR+lcML
	v1tTUpU6/xlOwGiQm6ydNvSj/gp4swFX6pNf9jh8X+if/oMjKwKx30I8+VcMUOTl
	G0jqg/Aa9dXYpaoNwv/46JbMepFyxGLZhoj+1KuJFDe5uN6hfO26KUYWLCniF7wt
	czcI0R5dubxBV4Sp77IgRXmtc+DOiR74S5waZ5yYYm/2im66YGCfA1t3QvDskDoy
	MfriPW9/d2PcpQc7vHx6Jw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4as7f22f63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 Dec 2025 08:34:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B28R6eR016427;
	Tue, 2 Dec 2025 08:34:34 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq98ug3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 Dec 2025 08:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buSH/opq30jJ2RzWb0nWw/dqcT3X4eQaZUO2eBDfIjYlcZ0otL9spw7/Z1O5ZPMmtUfJq9wkVkjcIEAgoGNF3oUwc95OVgqcrPW0b47JHpFsxEgmVT/0i2ADlco2uMQj+LhBG4Mo7rTbu3A0j/LFuNSicGdQav9iSYnfIsZDp9+PWP7U8sdXzuuSatx6rpAqu+Uf65jTJPBtPOTnuzrM0Joy3Qov21EUfpTzi5RgHbc+R9sB3zyWPAUiKjtMz5MQjW3etAfD3OR6Z2z7v9Jlho2BpiZw1WxFAoP7cjQGYRagjw0n79Zi/NGcvREqNjsLl/ggUxlDVv35ibCIAxxa7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my9VgQVuiCjfCFl/gtGG1DOdZZBW8Wa4O+ZiMMBzpVg=;
 b=QZetrfpuHQ+YJSMqXYWcM5C35LJqhy/IkKSeDn/gmqjA7TZQ9Ljfc4qZrxH6gd5e8CtmvC9a+lQxeGgUuiychWsM8N0A0pLlmgCGR1URdnfve5wsGP0eBHp9qyX6LCPa6R/FUw9/dd2LYyxeiJRHzQWSEWacxThQKk1VT/70mOIsHaUOxu8NC/3qBywvcUZfW+DDXQBWDv8cuP6W4FEODQVoBV5E4GXFfz6I0absplSz7+uJ/Pmad+5Yl7czgVxAd2ps+F0G/TvScWONlcN+P2eKv7wbwaBLGg3GYYsdTHymdfIUaVJw9QaVfpmUyHzXMXF1q2ZtmYV81VinSSmn9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my9VgQVuiCjfCFl/gtGG1DOdZZBW8Wa4O+ZiMMBzpVg=;
 b=kkQ3n5eLJd4w66xbolKnlHAmgsBb+QLu0zm8jDWW/Eei5VWXQecWoO25o4wVTLPY6wL8OiSY9uxudJuAYsg/F04EpXacUQRUk1Sg/f/1hijR4GnKOK52PRyb7ZPk3omvMHeP3BQ3iayg/IBotdcX5RqyRAjdLmej/Hv9bKAgWM0=
Received: from SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18)
 by SJ5PPF0995E25F6.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::788) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:34:24 +0000
Received: from SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084]) by SN4PR10MB5622.namprd10.prod.outlook.com
 ([fe80::6bce:37ef:d1de:d084%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:34:23 +0000
Message-ID: <96eb8fc0-b93c-4ec1-9d04-eb7b67857b11@oracle.com>
Date: Tue, 2 Dec 2025 09:34:20 +0100
User-Agent: Mozilla Thunderbird
Cc: alexandre.chartre@oracle.com, linux-kernel@vger.kernel.org,
        mingo@kernel.org, peterz@infradead.org, david.laight.linux@gmail.com,
        llvm@lists.linux.dev
Subject: Re: [PATCH v6 11/30] objtool: Trace instruction state changes during
 function validation
To: Josh Poimboeuf <jpoimboe@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
References: <20251121095340.464045-1-alexandre.chartre@oracle.com>
 <20251121095340.464045-12-alexandre.chartre@oracle.com>
 <20251201202329.GA3225984@ax162>
 <vlam452zory73y4nvtgl63ofr3yrguguda63qsns3k6r7sgsey@2xhf3fbc5pkx>
Content-Language: en-US
From: Alexandre Chartre <alexandre.chartre@oracle.com>
Autocrypt: addr=alexandre.chartre@oracle.com; keydata=
 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
 swLliy6PdpST
In-Reply-To: <vlam452zory73y4nvtgl63ofr3yrguguda63qsns3k6r7sgsey@2xhf3fbc5pkx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0088.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::13) To SN4PR10MB5622.namprd10.prod.outlook.com
 (2603:10b6:806:209::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5622:EE_|SJ5PPF0995E25F6:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c5fb59-b798-4293-b972-08de317d98c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXREMmU5Yi9RekVINWIxL05uNjh6cThJZUNNRXVFQWt2OFRWSENFZVZnZ2cw?=
 =?utf-8?B?MlNFMWVwRy9NMXB1UGR6YnZsSFhGaDI0b1N2Zm1wSmJ6aHN2RWxjRytMdVVq?=
 =?utf-8?B?WVVzWmVlbG9xR0VVbFZQVUh5b0kvUmcySEFqV3o0UHFSSWlYVE5aekxVZEdM?=
 =?utf-8?B?Sm8xOExleFVjR1Zwek10ZExhTndObXpJYXNFSFo2Y2tiRXNiejl2bVBQTDBs?=
 =?utf-8?B?RlBHSE1TWERYbUhyZFVobzY5MEp1Ymt0bUZVMEdqa3pmcjZ5YVl2bFkrQ21Y?=
 =?utf-8?B?bXJYR1NGMkM4aGlTRmhwOVk5eHowVS9IbE1HZUhCOVdORlRPbEpRR292bkJQ?=
 =?utf-8?B?UUJJQUZkb0I0NFFSZXcxb0dyVldlQWFDQnFNSU9rRUhLa2N0UW1HZHFtZmM0?=
 =?utf-8?B?VTZEVE53M3hzVFBGSWVxbVRDT3VGMDJRdkMvTXdDZlJ2cnFBa3RIcFN3M1oz?=
 =?utf-8?B?V2FBQ3BvV0R2ZSs3eXM2RUhPZWhuK3lBeFNjblh4cmM5bEtTWWZSdjc3aUJh?=
 =?utf-8?B?Yzg1blhEdVVQdHBCamZ0b3d4WXF4VEZMQ2U5MWZmME9zZTZvWVRXR3lmS1Bs?=
 =?utf-8?B?UXRDYVpIOXZIbVcraXJkckdvYXR2ejVqMFNvMlIrNDFGUHNGbFR5c0ZHMUVE?=
 =?utf-8?B?MlJwMXNTNVlsZUpkWmdBbUtFUE9Ldy9oSmgvVlI3RXkrN0NMM3pHT21CWHNL?=
 =?utf-8?B?eURWNC9HUktzeEgyZnZsVnJiYVE4bjNOVU96eXVmWkJDcm5tVk1heWVIRjE5?=
 =?utf-8?B?Wml1aXJ5NFlkSmtya2hIQlhlMzNuc3BqN3A3d2NNUG1ZVnUxazN4emJvQitF?=
 =?utf-8?B?a2ZUdVRlVVl6VVhoTVVpVTMvTk9GV2dwblNYVFpTL0RKM1NwOFdDT0lIcUpm?=
 =?utf-8?B?eGFvWmNFL25FM0NJZnFuQ3pWR0EyMGRaWmJSVmxHR3RydnRJK01yVStoZ3Q1?=
 =?utf-8?B?cmxqbEdub1I5b0tSY3U4bUFOd1pJWnJ4eUpibGpFOVVhcTRoR2FpTi9QTHlO?=
 =?utf-8?B?ak9nN3JtTStkVzFlTUVjNkhHMGM0ckdpZytya0tLdXhua1NoWWZTMXV3WlhB?=
 =?utf-8?B?YXlSb3lzK2JaZHAySGtqSzZwREU2eElTeTRJV3R2a0ZyWUVBQTJ5RURRRmk1?=
 =?utf-8?B?L2lFaHhXM0ErUjh4MURoUDV3Y0dMWmsrK2FaMGpHT3lWVEdNQUhrNmJObUd4?=
 =?utf-8?B?czVFcEtPS0JaUmN3RG14RmdNekNuN3Y5NmRiSDRtVlBoWVhvT2VtUS9TVFc1?=
 =?utf-8?B?V3I0dVhac2ZrQXpDNUV3R1ZTMHNRTFlHR2U0UmVPV080ZmI0eENkTno1eUd0?=
 =?utf-8?B?alJMV1AwM00xSExTc0dpTTVzejZSZm5mbmhiWGdPckhIakw4MkJlVVFlZm9I?=
 =?utf-8?B?cUNTNlVDNXkxT0trbmppQ0dFUTVDZUNjL2tuQXZ1eE1XWW1Ma2VPV1VwakZG?=
 =?utf-8?B?ckg0RFVNQnMrUkE0OVRyT29hK09xR1B1WG5zWmJYaUNNbThhMGxnUGFRNVpP?=
 =?utf-8?B?U0NOY09NWFQyM1QrU1JacXRrUEhOdW81aU5OTTJUaWxsYWxLV085UW14WlNJ?=
 =?utf-8?B?MVlsZFFEUUx2ZGVyWHFQUkYzTkYrMDBqbTlxZnhIWHR4a3VNeDA1bEFxTDlU?=
 =?utf-8?B?SmZmc0VDdm0xaWhJTXl0Vkg1UGY4aUNjUTZmbzZmallzT1ZhTU9rK2FqNnFm?=
 =?utf-8?B?a3Q0S3k1dzZsczZub2k5SHpNR2IxZ0xzdmRxV3N1ZmtPL3dyTk0rSVk1OG9P?=
 =?utf-8?B?V040WDAxT1dHbjQ0dzhobzd2U3ZsTkJEWjNJQ0dXcUFuTC8vSWJvdVRXM2JL?=
 =?utf-8?B?K0RjVjdRUHhXWVBqTWt2Qmg0TUQ5dmdmVWhYdUpBWGVCSCtQVUhZayt5ejZz?=
 =?utf-8?B?bTNTaDJkWE8rL3hyWHZaVmJkbzhManQwTU1Na3ExMVB2cHNneUx5elNncnRz?=
 =?utf-8?B?NVc4TkJVMFkvTDVpbjd3NFdOZnpwWHlVSmZQNXkwQmIrV0lUdkd0R0NURVZh?=
 =?utf-8?B?NFkrMGo1N0JnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5622.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWVnenRRZ1c4Z1FhR2lRTTNac2t6WXFNWS9jNjJVc2l6VXVkMFEvVVAvZVIw?=
 =?utf-8?B?RnRTQWNoUnd6dHhVeVF1UVdmRDhQNkwzWTRUWVRvWFFuRzMrNVdaQng1b3Vm?=
 =?utf-8?B?OW1aVzRlWGNRSmVzL2VaT0p1NUx5UmFKYkR1aUpBNG9lanc3WnhjSjdTcFJK?=
 =?utf-8?B?TjBTc202cmc4L2RwTzJDanFPYjVLdDJCNXZSZGVrbjZiZ1dZa1I5RVR6T1Fw?=
 =?utf-8?B?WExxUGZJQWtmb29kRks1azRwSm01dmEra0dXQ3lFa2FUME9ab1A0cjliY3BL?=
 =?utf-8?B?cmQvMXhqRjBaMXo4aENLZ0orWElHaXFmelJ5eW1LcnErdFVWNTJRTmlsaHZ3?=
 =?utf-8?B?SVMveDM0MmhRL0pZSVZnclRWdWhwaHBVL2NqUEszOXRJTlRCSEs2S1NhWDli?=
 =?utf-8?B?Y1lWL0M1S1EvQkN1UTAvUHNzZ1gwcjJmZ0RlNnpLM1g4TFRma0kycmpXVEMw?=
 =?utf-8?B?azd4M2tnOERLVUZqeEYzWjYrYzczS3E1ZGJwbmVMRVVvNEJxdWRTUnU2cEIx?=
 =?utf-8?B?emYxSjBKT1c4bHByYjRZSHdBd1E2c2dXekIzYzZTOWVoOHNSOE1jZG9oQlha?=
 =?utf-8?B?WDZGREtGb1hCejY4T28xUlRvV2tsb3dkM0hVTzBNcm9keGdrZjI5eXN1NVdl?=
 =?utf-8?B?aTl3Y29oME41ZWFwNzhFQlNmOGl4Z1NCcm01UEl5clAwU2JuUFcwWFF5RW10?=
 =?utf-8?B?dVRkMWx0L3VleGE2UW5QbTdWUE1XQjQ4eTB3NkFmTHJvcHdWUGNKU3ZSWk5B?=
 =?utf-8?B?ZFJ1UkxQd0kycmZqZ0QxK1ppZmd4U3B0UUw2ZlI2eGRxeXl1cmdCdkVQSWNu?=
 =?utf-8?B?TXc0bUxHdlFrR3VudlpHVW40SzJxa0dPTVFzSWZnYjErUExVN1FDTW9obkRU?=
 =?utf-8?B?cnZQUE5HMnJWd3IvVUlZd0xRZzBVMGhFMWZiVlpuMDMrNysrMnZ1M1MyMVdB?=
 =?utf-8?B?VTV5bHdabWZtUWQxb2t1MmM3VFIwanVycHkyUVMwSVJrSm45aURKRVB3WEdh?=
 =?utf-8?B?eHk0MkJwZ2lXb1RqL050MStWWStZL0p6M3kyRmFDTHBuSWMrT2xReFRabXE4?=
 =?utf-8?B?ZG5DV3M5RzUwTUZzcXoyLzd4QXljR2VxaWNjb1Erem5pZ0dmUk9qTll0SFhx?=
 =?utf-8?B?Nnh0aFZvMjZQMmdvbmV1THpORHJUbVRkWUJlRlZ0cmxEZGFxR09CUW5pRjZX?=
 =?utf-8?B?UlgxZWlYNUxHV3dXM0NGSEVReG9RTkVXNkI5TklsZmF5UkF6eEpPbkIrSVNm?=
 =?utf-8?B?eVhGL1p5b05xRmlibWhhREVSbWVFZ3RKRThwV3M5RTVITlBzSjltT3IweXJn?=
 =?utf-8?B?cE1SUVFMQjhRelhWa2NZZGROMlVsUk5KYUlsdnIwZVZ0d0Z3RlR2enlLVjlu?=
 =?utf-8?B?Y3hzQVpnTUxkT21QZXlVcXFNcWR3M2xSdWNRelNnNm9QYndsT0x4V3NIS3li?=
 =?utf-8?B?dmJCZGVxSnYwazJveDU3bnhPM09YQVQ0WGVjYi9aOWdnMXhEeUFNTVEvTWNr?=
 =?utf-8?B?aU5xK0NzS1dtU0RCOUtaUHMvZHRhSzlCWldhalJTVmtjTlVCWTRPVW5DTFBY?=
 =?utf-8?B?WUV0UnBUWlhBZW1sRDh0VjdYNkF2ZE9DbVRQRm1KUmFDOUI1UTk1dEJUMjRQ?=
 =?utf-8?B?U0NERDNPWGhZdEhNM25DM0VZcFUxTFlzT1hIbVUyWU85YXMrNnVkR1RWNDZ3?=
 =?utf-8?B?TEd6S1BwaEdFSkZRTWhWK29Wd2J1cEVjUW5IbzVSZVdUVnlEQzhsbUJYVmlU?=
 =?utf-8?B?dmpnQ1AzRXRCSG5DRXUyZk11VTFmUTdmbkc1OTc4bDVtODFhUnRodjFyZHI1?=
 =?utf-8?B?dVYvWmVra210WWJLK0ZIbzcrTk9uTFZoZVB6c0x1dUxwY3hKRERIcEhZUGc5?=
 =?utf-8?B?aWxocGdtS0NjVlFDVkJpMFk0N1NQNjlKUFJUSXJTbk5GZmdrMTdBdDE0M2pi?=
 =?utf-8?B?eGhMaG9DMmIzWFN6d3dJdlY1L0ZQM05OOW90VG83RVM2OVMxQmh2UzhkNG8v?=
 =?utf-8?B?c3FrRVRkbzcxL2RTWVZwc3BEMVc1REFpSVZiUjU0c1RXckNIT3FVTnJkcDR2?=
 =?utf-8?B?bFlUSnJpRlh0dlpkb0RYQTMyUEJrMzgvc2lHR3JWbDJqRGY0U3RTVFdFWkhC?=
 =?utf-8?B?aTBDTmxuazlsODB2MjdOR1JFeXR3YjFXT1ZXRnZyckxNY0EvdUxKTFBSSEt3?=
 =?utf-8?B?OTRHQlRtdURyVUcyTURMNmY2bnVmZHhUem1vVlY3aGRMVmQyUXJ2MUtXVXZD?=
 =?utf-8?B?Nk8rMEJ5L3NoWmp0VW1XejVXZDJnPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pobe2TRuMN1XVeX3mlz1/DNVT5sqj132GWOf/+XSm7G9XuxNa3dDSI3GSd5l0l/apBAm1J+JiTTyVEZrixbRiFE7RmzifkH49S6taCUx5MsvkqVwG2V0zpSsfn5hewgnjR0wTrQ7N31MNum0C3o1vDiqgW9RQ3KQAU4EVX+SFAkCPkBv+lCmLYsKbrPAdn9Px1IiNY7WyhIjWzFQJ67cEwICyVLy24unuuqNrBme2JYiYvLXDtdYSFew1K5J5Hc9QV6IOD9pH9m1pciv/76qV8XXatdzXWS7opGcVf/KMWurK4UVZR8ZBPIQHkpIvF9XpsG29aaaZEWK51eE6EWfrQjBr57pc03zMi9arqnsY2vvYwSPy8paVh1ucnnkvHNukJy44mECIzrlq7DbvyDj7eLTDYWd1y6Ji2/739b8Y4YH3Fpns1XoEF/kJ3L+WRHMAXhx163zZ1PLkRPIZtRauJNN+Xp1k4PdR7gCkrE+UDfsH7zGqhWLMkMvMa+Z/zVLIjAVHoo0FX0hUURM5UGaLuI859ue07JB+bpV7xyg0AarKHZcL3nSLCgTmIxqxkE+tK8/jpdTN6LhJQy4mED/vNHWSUhLAHrQol6wNlvhlYY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c5fb59-b798-4293-b972-08de317d98c3
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5622.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:34:23.8702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBaNmHL+j24xea2XELHteBBFUKK+bspQ0956BSYahjpMztKvYY+kUvQ8B1nGQPK/eUfL3VBI2dVZWq+hi6S/25jQexRzxL+N387PHwFid64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0995E25F6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512020067
X-Authority-Analysis: v=2.4 cv=QMplhwLL c=1 sm=1 tr=0 ts=692ea49b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=k824ImSw1Ak098_7-IIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: NtHcoD_dRU-Fhjoibkf8OsTHWJYLSAgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA2NyBTYWx0ZWRfX5JHpf+gG/ANC
 25Jq6vaOS8rXnmgRGEknirCoOr5stvUv2NP1/e9nkhwGQDYU9uiSmHVvzUoyjRufpdNR44Np6D1
 6fNXgwkUmrf0bhplDym1245LnfVeNKmhSXefbD3r/uKECLGPTtKmnhuqjG33NdlVYfbNgZVaOKB
 hiPHJbQIpda9uBUXwpd8FRVvSrBLxqoE8cTLlQWsH+i+2LMWlS9gV7OsEqVSzNYjuVpE279B2bG
 rOUXTphPdsWQewGeTuS3b2eTWYQWo9zQhZAT+kD+wKTy/GSF1Tasb2tYcoomWegU+Ag4eB+gQB1
 FRBgVSLY4IVX0sdAfRxAXeVdshr7XNK/2VX1pVYBA0ZjEXzdeZF1dOTo7gbBGRnXWv+f9q8Ajgj
 ibziZoBonjW0ecRDFPohphy+LY26RQ==
X-Proofpoint-GUID: NtHcoD_dRU-Fhjoibkf8OsTHWJYLSAgT


On 12/2/25 02:30, Josh Poimboeuf wrote:
> On Mon, Dec 01, 2025 at 01:23:29PM -0700, Nathan Chancellor wrote:
>> Hi Alexandre,
>>
>> On Fri, Nov 21, 2025 at 10:53:21AM +0100, Alexandre Chartre wrote:
>>> During function validation, objtool maintains a per-instruction state,
>>> in particular to track call frame information. When tracing validation,
>>> print any instruction state changes.
>>>
>>> Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
>>
>> I am seeing a segfault after this change in -next as commit fcb268b47a2f
>> ("objtool: Trace instruction state changes during function validation")
>> when building allmodconfig with clang 21.1.6 [1] (I did not check
>> earlier versions).
>>
>>    $ clang --version | head -1
>>    ClangBuiltLinux clang version 21.1.6 (https://github.com/llvm/llvm-project.git a832a5222e489298337fbb5876f8dcaf072c5cca)
>>
>>    $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean allmodconfig drivers/scsi/qla2xxx/qla2xxx.o
>>    make[7]: *** [scripts/Makefile.build:503: drivers/scsi/qla2xxx/qla2xxx.o] Error 139
>>    ...
>>
>>    $ ld.lld -m elf_x86_64 --fatal-warnings -z noexecstack -r -o drivers/scsi/qla2xxx/qla2xxx.o @drivers/scsi/qla2xxx/qla2xxx.mod
>>
>>    $ tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --link --module drivers/scsi/qla2xxx/qla2xxx.o
>>    fish: Job 1, 'tools/objtool/objtool --hacks=j…' terminated by signal SIGSEGV (Address boundary error)
>>
>> If there is any other information I can provide or patches I can test, I
>> am more than happy to do so.
>>
>> [1]: https://mirrors.edge.kernel.org/pub/tools/llvm/files/llvm-21.1.6-x86_64.tar.xz
> 
> Objtool is overflowing the stack due to the large number of jumps it has
> to follow in that code, thanks to kasan.  The above mentioned patch
> 
>    fcb268b47a2f ("objtool: Trace instruction state changes during function validation")
> 
> added a 328-byte struct to the stack in validate_insn() which
> drastically increased the amount of stack size needed.
> 
> I suppose we could hack a fix by making it a static local variable, like
> below.
> 
> Or, objtool could setrlimit(RLIMIT_STACK) to 16MB?
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index a02f8db75827..206b8589d82b 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -3678,7 +3678,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
>   			 bool *dead_end)
>   {
>   	/* prev_state is not used if there is no disassembly support */
> -	struct insn_state prev_state __maybe_unused;
> +	static struct insn_state prev_state __maybe_unused;
>   	struct alternative *alt;
>   	u8 visited;
>   	int ret;

static looks good enough to me.

Reviewed-by: Alexandre Chartre <alexandre.chartre@oracle.com>

Thanks,

alex.

