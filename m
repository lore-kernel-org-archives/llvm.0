Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793649973;
	b=SxqDrWG4Pvm6hPsZZ3cv9YhRyMf0EFS9Wi50CgWiqzeLINF4qME6JxhMWvP8Hf8bX7LW
	 f7O6fXN45/XLr3SrvezTJVclU2VGpAHNqV7fFFXS243pKVHOwGruIJx6THaFDwtr/sOLV
	 PXaDhl0alAGHQmnQQqXRwaAwx4/KmRPUpq95KT84de+7PiaEA/tzMg/dzxCuTlX95S+uW
	 UFxIpc/NXRkabq3aBBOyKP9yAKqYUhUDO/ueuiKuxZmUFl3Yb5Cv+N61jcJeiqKeimCiT
	 GrGs4iVGZ3OtNbUOspWODckpQ7zTqxcsB1UuzQ6q0Bjlb4CQVsX5g5jF128LXlnM9lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649973;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:To:Cc:References:Subject:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YnepNDLCyaaJ8MbOETiX81vhFZHRWE19wPdxm/bUwog=;
	b=HMRBWCi3xujQEHLl6DtjuYfCPfwPC9d060q+bpcWBRZhzZ5+ZyekTJOxSdvqV3nZa3oZ
	 Vo0pj54A8KEZckZxP/74ipOrG0ZV0wHalzG+08c4s+DPWdhH4YdS/59sQvjrPKCxSVsRs
	 l58TCEBaQzb5IZ19Xoas9aii7C87NKHZdjNxUsF9XkPXeK8QzAQhVCfe9zeoLm7drNmYB
	 89vl5mOqVWOovPeRAWs/sL5pJBiVcvMbx0qRKUfKhc00dRGI4WBSz8a/sgF9mUeFxtR5O
	 gD8h1EDp8MOaadzjY9/JFq5+7jZTY+HFM6Vyix0pXLF12XRcK23fcBhPWe1+A2V0Zzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=citrix.com;
	spf=pass smtp.mailfrom=citrix.com;
	dkim=pass header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=WSv19YEI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.53
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013053.outbound.protection.outlook.com [40.107.201.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A10D606A32D
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 20:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A10D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=WSv19YEI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLb6P+oJ4Xq1sduAAUg9EOAF+QrKlWtg3xge4tzht8t7N2QESvaU4Y7HdQ+qS1ESEeyFQvPxgg+VK0qOKYRvBtNWeJXobegUD9xFO36o+rOEJYjPJX6ByAbTCMvBZPbQ4sQxD9rz0EnfOjTL3i/K0I0bxwl7RHRpijogQTLS4TMsvcPLdqcw07VERBRmt2K6OeBm6eyixprGKEccLimDR5rE3PogdASZ9azQyGixTUqsHe7h3AOd8HwmLSss/XkWVw/fid2YPuJITmZ9ASg99ZwCFlE/ldpa8keFJcQ2I+746qZT6uVDO4UkN8EY+p+yPYyps5t4XPjc6epHwvbLBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnepNDLCyaaJ8MbOETiX81vhFZHRWE19wPdxm/bUwog=;
 b=BU6hOQE/d7jvNhdQFNp2Kp/cQnABUQVVNK1/Zw+ITD/1ElnY7+MLUtbR58SOhrAuxz2vEGp1CWr53I4zwrfAuzVLvStJFAy33K3IOGF2MQ5a1/yxdfSVvWYwecInLhCPYLptkfB10XnoA+xtUGc0e3IxnSHxbGHBiTbtfQDy42dNMrAGFHj/xi80f7q1e3FRHorEr1kPB/2Pt+Vi908JR6NZUqvV4R7fEebsdS+Re3+H21MEjtxqDR+hVKmMqdPNpQavi7c4fdquvekI3utXqHJc4ig76x+wOIHGVhlbSYRXPhBcJZ+756LhSoXKQ7CL76H9Fipmh3CgkJ8UMCd07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnepNDLCyaaJ8MbOETiX81vhFZHRWE19wPdxm/bUwog=;
 b=WSv19YEIxGg6iOZ71P13yhH+RxFnXReJU5vxRM4/cvlk4tel+nfloURMg9i+n+z8FO2I7Xy+k0uRbeVNeEussBJtJKmMnU6spuWxzYSo0/jPYYFCmCXhEESBzaQOMphjXiiClWVHIKpuLfzTaeS31cpiFqY3+9MbK5O+gspVfyM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH1PR03MB8168.namprd03.prod.outlook.com (2603:10b6:610:2b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 20:06:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 20:06:07 +0000
Message-ID: <86f2f603-c1a7-4715-ad43-ac9c90f6a837@citrix.com>
Date: Mon, 2 Nov 2026 20:06:02 +0000
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, jpoimboe@kernel.org,
 justinstitt@google.com, kernel-team@meta.com, leitao@debian.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, luto@kernel.org,
 mingo@redhat.com, morbo@google.com, nathan@kernel.org,
 ndesaulniers@google.com, pawan.kumar.gupta@linux.intel.com,
 peterz@infradead.org, tglx@kernel.org, x86@kernel.org
References: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when Spectre
 v2 and BHI are off
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0368.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH1PR03MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 68827ac9-488a-49f2-a3ce-08df391cbb51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|18002099003|22082099003|261102123227099003|56012099006|11063799006|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	ctH9vRyYR/iYJL3o//xv6ZRgELCOVtsbBc/6iG8dKlvOi+H14NI5bf3XuRPDa7rpMpNcxlNuBVQPBn4SjtPJ7JQ9cXkrzCgzUpSq6J4y0i6FA8gkEsnPr8JGrPzyNUpy5rL7gOZwJIkG5y1Na2bFRA2gTHPwcFNITef57Au0+QNmWrnV7J7ykr0f6hrFjTX7xhIFaIHnXECIpgrech9NLKJFmWYt16vMOEE48CCOwOR6xDvZ8QKD6tFTnDN394sTGxNIJsIHZOr9yPbt9AhjV2sg0E5WIQvo3xpK9pjsfChJiwJngJET8f78oPY7AcWrgpUaarHjXlnXKVoC6msqypaQ5euv4T1CXZc1plO0AeN0SezNbd9l9nVb2baJAePEMWqTllB3UNYPfXLf/muxafppsmX3PnkyYpNmGHvwkFhE5G1pAREP/EKVNqWpYehx1e8NIjO3VHnimGKdhHXhEsH+lww/AnvazMhUHhj8EMyf3Ysmbnt4OCHTKYyY5++TtFxIrnpgzTAHjM1aS/06FlPolcPpEWvAL9Wfn7cmpN1vDGESHriR47aqb4EaGCX358CjlNVuZ9xenD0XVbBmFWz+SXXv5aNGoeI5O5x0Ektpu8JlZKTXXy0G7IjkrcsK+x+yQIsmWvcwTOXwSQzN3d3AIOTcvUtg6Iq7m032Ujo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(261102123227099003)(56012099006)(11063799006)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1c2a2g2c3pTM0VFRzVlM0FYVDZqM2NNRTVrVG53blVNUnY5OWQzRWlpb1h4?=
 =?utf-8?B?UUovVjA2Q2FTVWNScmVHWGZ2ZHY3SCtUeWRQRmd4VmVNYzhIQm05dW9SN25J?=
 =?utf-8?B?OE1ya3NPc1FtWkJXR1pualNLazJodGIyNFp6OWJEOVZYbENQcDBLRGFXWEZE?=
 =?utf-8?B?Wi9zUlYwYzU2bVJBejNSRDlkUEFHQTByQTdyRVV5Wkk0bjJ5d3JXRXdqUkVt?=
 =?utf-8?B?NFRYVmdkeXVacDJRWU82V2NJVm5xYWFjWStTWHNoZWQ5enpNSTZ4aFF2N1BE?=
 =?utf-8?B?MlRGbm8yWGh4M3Z1NlVRaWRyYXMzaHRxSEFwbkhyOVlmcmJoZXhYbjQ5Z3di?=
 =?utf-8?B?WTllOXVPRkF0VjFRMDhZVHpSSCtyaDhtaThsSC9qenZBei85UC9HVkNNVjFW?=
 =?utf-8?B?WnlEeXZXSVpaZVpTM3hpRHFhMkpOYkM1ZWx2STV4V1Fhc3JSQjUvcGdONVZr?=
 =?utf-8?B?emVFYVhsRWpjRzFhYTRyRXFQSmkyVkljK1VxcTFQSk1ZMTYvd2l3cGdqTFRp?=
 =?utf-8?B?QUVZendpbEJtcTB5Zm1OeVZZS2pWL1hPR2RwTCs1UzFoUTFGaVNjN3NZWWpq?=
 =?utf-8?B?cnFOUzNYbXdwbFlNSDRBVXRsUkVrU3M5SHB0eGR5Qm1Qa0FNeEFsQm1wUU13?=
 =?utf-8?B?QkRLbG05L0I2Y3JnWHJwQmZtNy9McTF0M0ExbnFxYlJ1aUFsd3d4cXA1a3Zu?=
 =?utf-8?B?WUhIK1RzdjdZVEhPeWMyanNJaTNla2c1QWhMajR2eGFZbHc3bVk2MUVmeTlw?=
 =?utf-8?B?a3Q0Y1VnMGZaNHF5U1AwRmdtc3YwaDNEY0FVajVSUHZPNEc5M0w4Z2ZkT2I1?=
 =?utf-8?B?OHk3R1VpbTZ5aGNTY0dRdjZZaE5YNlhWaU5qRXR4VkJ4SlBPZXVFdDVXZ0pk?=
 =?utf-8?B?a2Jrbkl3blRJOUpDOWxNaWVJL1d1cmMyVnlVTHhGRWJjZUpsUWVPODBDRzNL?=
 =?utf-8?B?TmZQRHZMQ2QveTZha01zMUdMTUkxVGFsZzAySWhsOEZuUU5jVXpOTGtBdURk?=
 =?utf-8?B?bXJVZkZVaTNXS2hEdE15NTFkY2R5alhkaE5GRDNUQURBRjlvWDN3eG45eFBm?=
 =?utf-8?B?TDVUL2lTRTBFdHFsMXAzZkdGWCtrUWlvc0ZoMzJ1Z3hreGxpS20veFhSaFFN?=
 =?utf-8?B?c3U1dlV6dmFNbHVNY0RzWHdNWXVsMllXN3hkYnFYV2l1cThHZk9PcmVlcHZS?=
 =?utf-8?B?ZDVTcW5NVlIvelMrTmFGdENDUlFRT0Vtb1NmaVVERGNFSUJLcjk1VlVSRita?=
 =?utf-8?B?aEJrVExJc1E2dDBna2JaUEV5RFF3cngrK1U1czFNVVpQY09nUm1CYndXYVU0?=
 =?utf-8?B?dXFnSVg4QzJ6S1JpbktvaXJ3ci9XVi8xUUdtZVB2YzVPT3Vqam1sN2d1MGR0?=
 =?utf-8?B?QkZXU3lKeDdUVkFia3FwMW9PT1kybHZPZGN6cTR5OU5vbU5OTU1LeUpLMWJ5?=
 =?utf-8?B?TDNiRjFsMHM2QUE4RDk2MG5OSmhMSUV1ajRqbjFkYkcvMkE2MzhURTFGdWZJ?=
 =?utf-8?B?QTErTE9JRFUrdEFycG1MWHpNcTlHaitsdngwbmhCbEV0ZzJCaUhaNTgyZWN0?=
 =?utf-8?B?enBVL0ZKUGlWUm1sblBZem9pTCtvWFpqeXBNOStuOFBudVNicEI4WTZDSTU2?=
 =?utf-8?B?Wnl1OGpTZmxJZ3hBTVVjREIwcFZJd3FnNzNPaFFkMW50d0s5a1NHKzVlTW9z?=
 =?utf-8?B?Vk93YmdkckhzYW1uVnFVcFdwa2p3R2NDMkNmUVBsZlBrKytFQzlJUUU1UU9k?=
 =?utf-8?B?OXppTENMcHN5b2Q2aWI4ZCsvVkViaUhuZzlvZ3VLc1FzaVdaMjJaWExzMWFT?=
 =?utf-8?B?Q0kwYVNBdmVUeWFYUkx5SWFsOVUvbDJ6L0dNSkQzWUM2WkhDaXR0RVFUcFdN?=
 =?utf-8?B?b2NSeVJZZ3EvdzhFUHZmNjJjek9ncFhjWDJ6NHdOcGlDK2c2WU9EWDNXTjZY?=
 =?utf-8?B?NXRzWHJ5VCs0SG4zY0xaQXZKaVUvaThnL2R0U2JJYU90ZTZ0TGhPcHJQaFlG?=
 =?utf-8?B?N3RkMkxHeHgxWFRqZjVUSDhGeHV2bmFjS2xzRm9zMFhFMjRKUktkemo2cnAv?=
 =?utf-8?B?cmV2M0U1SytDY3dnMW03Wjc3QnZnb2dTdENzQ2dCRTdFakI4QWpuVFZEeEUx?=
 =?utf-8?B?Z2h5cGg4NE9GK0RPWnZTZG9iRUlRbWRSbUdISDBqMGp3SGNIWGU2TVl1T1Rn?=
 =?utf-8?B?VDI0OGxLYng1V1BkbVEzWjcySm9wM2w0dU9DT3d4dTAyVWN4R1p5QmJHNys0?=
 =?utf-8?B?YVhjRmtJUEZ5WS83ZFlURG5XbHVyb0VLMkRtSVRQWFlZaE5yNHJZWit2cVZk?=
 =?utf-8?B?VFZZZFdLVHR2bHAzZ1pnczB6WW1GTWd5M1d4cFh3amZIVXNyZVczQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68827ac9-488a-49f2-a3ce-08df391cbb51
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 20:06:07.6142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOnaL/lh3z8qWv5vSb2vWgWKYlNtg9S+2CTTfvjCIAVcKhinuc+a6VbeogjFHm9fbPn3r3m7XaUZ4UqaII0Niq9XsugdI6BSVv2LkGuGfqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8168

> I do wonder if we could do computed jumps. It would be lovely if we
> could basically do something like
>
>       # syscall number in %rax
>       leaq table(%rax,%rax,4),%rax
>       jmp *%rax
> table:
>      jmp syscall0
>      jmp syscall1
>      jmp syscall2
>     ....
>
> and avoid any indirect memory lookup or indirect branches (outside of
> the one computed one). And no extra call/ret frame.

You would need ENDBR64's too, when building for CET-IBT.

> It's possible that the branch prediction hardware hates those kinds of
> very dense jmp patterns, though. I don't know.

This doesn't buy you anything, except a larger code footprint and more
branch predictor pressure.

The moment you've got any indirect branch reasonable from the syscall
entrypoint, you're open to all the Spectre v2 attacks.

That's fine if the user wants to go fast, but then just use a real jump
table pointing to the real system calls.  This is a Not-Inveted-Here
halfway house which is just extra bytes to decode and an extra jump to
perform.

~Andrew
