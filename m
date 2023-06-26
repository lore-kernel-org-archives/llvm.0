Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831706FD6;
	Mon, 26 Jun 2023 11:15:24 +0000 (UTC)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35Q8W66I007556;
	Mon, 26 Jun 2023 05:54:56 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3rdt8ajex7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jun 2023 05:54:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6YIyfYrqpYMm+uHwZ/cBxgrKoH8AuWwW4xPulqUQETowC9TesrQML23bwugG+jl3g1Gub8oheWb0Q1NMS7HpzscQZfDL1pxsaFF50j/ZCDcpvM87knqyueaeOyKI65gErVNBLiGOCTpg2c2JhRnVcTGt5QGtYcd83gSn17UVk4G2VmNgPRyxcy8TJXHE3ophjoUtafb0PRCHl8DTJLt1/lZ8pKp1r3O8iroTOiGavcuMehfwH5fnC4kckmgPwZ89C5OarT27fWjwf/gVHF7YKb2EeaZWGB8d2YqTg6zpN3nSNpRYyfffbhnXDxLNG5oSRQuCwqsxv7p60xG8QIUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqI7InPFgdOWHWph7e9a0uCSz3A6FlVmBvvjB3msS4c=;
 b=IAm9t2uO13I28hwSX2mtqANrl57qZkSr3PMf6NWRjevAD3WNF67ubtFSbJzEJZ8RfgnWowatT35RZtKCdEy7LwJLYWY3nf5Ojn1dAjMAZlnbblkfkxERboK2xZ1oPLmOcEQglcf5PHJFprNn9kaAZRbFAxW4rH7F1jI10QGbdCREVNUUVqtmxPgUqvMGsAGaCZvK3MIJ6lwtoyCeLOXKX66agmKctbbAKWlW0vEpaIjU2Ly7J7kr3OrJo+7ES0gtE6X/EBnquQoxvFdqR3oH/fCE0W30DyO7HNcrHuHwu2O43FVfnQAfs7Z0ltsr91rbUeul/R5oRAFxJnBOo239Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqI7InPFgdOWHWph7e9a0uCSz3A6FlVmBvvjB3msS4c=;
 b=HXZHfB3z8+aR4hyNwqSCVkeCxNfSspMTIWCmRweJ+V6ETjSQXGqed4uHTkCXbPJDNw0p/YleUEehbucOFB+SkiQK7Cqk89awNlrzjgPHqKtOq+z0oN1xuFFImC2KKw/D2ly1yQ4M4azdJjmA2eatXcKXexKsRelmzho1BGBCSl4=
Received: from MN2PR03MB5168.namprd03.prod.outlook.com (2603:10b6:208:1ec::19)
 by PH7PR03MB7047.namprd03.prod.outlook.com (2603:10b6:510:2b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 09:54:53 +0000
Received: from MN2PR03MB5168.namprd03.prod.outlook.com
 ([fe80::692c:1462:426b:5a9c]) by MN2PR03MB5168.namprd03.prod.outlook.com
 ([fe80::692c:1462:426b:5a9c%3]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 09:54:53 +0000
From: "Sahin, Okan" <Okan.Sahin@analog.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot
	<lkp@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        Linux Memory
 Management List <linux-mm@kvack.org>,
        Lee Jones <lee@kernel.org>
Subject: RE: [linux-next:master 11546/12162] drivers/mfd/max77541.c:176:18:
 warning: cast to smaller integer type 'enum max7754x_ids' from 'const void *'
Thread-Topic: [linux-next:master 11546/12162] drivers/mfd/max77541.c:176:18:
 warning: cast to smaller integer type 'enum max7754x_ids' from 'const void *'
Thread-Index: AQHZp6cpuyJlTmwjMU6aTJm+zS0Iga+cxsWAgAARyhA=
Date: Mon, 26 Jun 2023 09:54:52 +0000
Message-ID: 
 <MN2PR03MB51687DB73500E906779F7043E726A@MN2PR03MB5168.namprd03.prod.outlook.com>
References: <202306260401.qZlYQpV2-lkp@intel.com>
 <ZJlQ9w89k7x88ovM@smile.fi.intel.com>
In-Reply-To: <ZJlQ9w89k7x88ovM@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcb2thbi5zYWhp?=
 =?us-ascii?Q?blxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4?=
 =?us-ascii?Q?NGJhMjllMzViXG1zZ3NcbXNnLTdkNjg1YTdlLTE0MDctMTFlZS1iZWY0LTA0?=
 =?us-ascii?Q?N2JjYjVhYzA0OFxhbWUtdGVzdFw3ZDY4NWE4MC0xNDA3LTExZWUtYmVmNC0w?=
 =?us-ascii?Q?NDdiY2I1YWMwNDhib2R5LnR4dCIgc3o9IjQ5MzYiIHQ9IjEzMzMyMjQ2ODkw?=
 =?us-ascii?Q?NjM4MTU2NiIgaD0iUFZLZmZPaGZ3ckZRZzcxUnpONWN0YmlycnJVPSIgaWQ9?=
 =?us-ascii?Q?IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBRW9D?=
 =?us-ascii?Q?QUFEK01MNC9GS2paQVhKSEEvWm9lYkNvY2tjRDltaDVzS2dEQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUhBQUFBRGFBUUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQVFBQkFBQUF2ZGhreGdBQUFBQUFBQUFBQUFBQUFKNEFBQUJoQUdR?=
 =?us-ascii?Q?QWFRQmZBSE1BWlFCakFIVUFjZ0JsQUY4QWNBQnlBRzhBYWdCbEFHTUFkQUJ6?=
 =?us-ascii?Q?QUY4QVpnQmhBR3dBY3dCbEFGOEFaZ0J2QUhNQWFRQjBBR2tBZGdCbEFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHRUFaQUJwQUY4QWN3QmxBR01B?=
 =?us-ascii?Q?ZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlB?=
 =?us-ascii?Q?REVBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWVFCa0FHa0FYd0J6QUdVQVl3QjFBSElBWlFCZkFIQUFj?=
 =?us-ascii?Q?Z0J2QUdvQVpRQmpBSFFBY3dCZkFIUUFhUUJsQUhJQU1nQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUE9PSIvPjwv?=
 =?us-ascii?Q?bWV0YT4=3D?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR03MB5168:EE_|PH7PR03MB7047:EE_
x-ms-office365-filtering-correlation-id: ef95ac3c-a5ba-4834-4bbe-08db762b63aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wMNf9YZht8fSFFQ+Qfs79Tk8KcVisYX/QPq6DSz/xA+NpuK2VITs995a+jvK+qu2fZr7FIQ+EKQmv/EEJWMs54fXOT6EnzRiVOMZ+a1OiHvv+fB1+NUm7bAvGcfJRrYBWB6GAvbUsPPzT0Nku5feTY767kMKbaDPehT5axWEzUTYTZkss8eVa2llAkjzdtvC4XVRX4MTKFwPWt/xKpawmhXBIRUevTInEhFa4OrXOFLEpXbZvGa5+NZlG3MAkJkkEBPnrt+b+UHU7AW6TkWVtlxY6vz2EUNsjIXONliHrnhVceh+GTqbWrDm28C0lJcueqW9c6ATeSqoRqpi878gkOs37pvnz/fCbFytnnaxXif1TivPbWqYvlswVTiqf1rbZu9TfTj0G9yTH0huzASASnpGWax+S/KDnIRem6S6ufjc6OPV+9nnvoQyjcEZApHhTCw1ombfVxcF3ch2voyfp8PejXeYT70silSorpYqEyuGI32h8c+RsJzUvFcP/ZoAiOXrQ9Q/iH6XmR0l6ue1DUI9EV+rzeFaEtyrwnTZvlfUyV6wu+u5yf4K1yfLNIONEdjpmuVO2rS1IVvYrSyDeUpFkzdEoaqSIOMlFFW1d7mjS1fJH1sRNz6FFfePS6ZPDIElMOx2UFqlaJjUYJjXbw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB5168.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(7696005)(71200400001)(38100700002)(122000001)(83380400001)(6506007)(26005)(9686003)(186003)(966005)(55016003)(41300700001)(110136005)(54906003)(86362001)(38070700005)(478600001)(316002)(66556008)(4326008)(76116006)(66946007)(66446008)(64756008)(66476007)(33656002)(5660300002)(52536014)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ynjZGkodShHQLoVMApO0+02acX9ZIyU3SXzfNyvtwcMmBoo1vWstIXiJ/jyf?=
 =?us-ascii?Q?VWczIm+3yaquv8qampJh5hUm1seS3SGi90KtnTNS0UDQWDSTw5fnFEkVpOap?=
 =?us-ascii?Q?iOSNflDwTBYBwi7U6KeH2UaYntvzSEEJuHhk3vpyiGsUN/jXwyIcqUtuk2Ct?=
 =?us-ascii?Q?tgVvhPQ82goWEel835ZxqkXtfTV9wrkM38SfJhnYQ1hjBg8zmE2KHE9d74qC?=
 =?us-ascii?Q?RPkNHWzEpMmSf9+wYUZP9AQkKvkad02ZgwEbdMfEmu4qu1FfOdnjoOpM/XrD?=
 =?us-ascii?Q?ghRy0PFfYBemkIDmlTCm/p96jI9CNRI5NOh4W8xzm415VO517925S9vwHc5r?=
 =?us-ascii?Q?JgiU+Z0hHudBZC6/ljZ7U6/QrqCPTL8JuvUkpZ90Y3PfYcP5n/oLsy8W1NK3?=
 =?us-ascii?Q?V/mlCqjdfWl31OaBYWZK4t1ZuLaGBLkp74JTupmXwPCBxP0bEOo3E7RHpJt8?=
 =?us-ascii?Q?arbbuoVlADPvuwIgc7P1mlnTXIZqV6OFFsm2joEr7uBGR016w5Q7NDvoa9gH?=
 =?us-ascii?Q?/ZkG7/djH4909/gt8ZwW2X+laVNjdXcbdPTFOmEOzBIarmj8WGOvxm7ULFI8?=
 =?us-ascii?Q?+RtjK6AWv7GcZZWOviI7iaTC2AXhZz61ARGx0784+uSePf4MvcEZq7nmP9kb?=
 =?us-ascii?Q?+QqOfivyrmzBsLE86S1mw1gpmehBCEw4U5H3SIVHZIiHDlOV40oV/1cyoowt?=
 =?us-ascii?Q?w+Uw6F0xbhdf88kZIhJQNBvGln6liJ6rNM7ZHYDvTLgWg4IlbjmPpvYBzDwt?=
 =?us-ascii?Q?BFpW0T/x0g5K/EbT8UsPYu+8JotyRsMtunpuX4bEQMRWgYz3gUiAf9qASfxp?=
 =?us-ascii?Q?hToD5w/jerFUNhRfvcMHfz39/8HCOxl8AfQhBzTk4Wr7MemFbYDXRQjDvUhq?=
 =?us-ascii?Q?tdS60qoagKr4KKZHeWeLT/X07tOxrbOvBzfUhaiDykDqsgXhSmPO5Vbt7wkw?=
 =?us-ascii?Q?Lbd8Ahv2/guR1yM4L905RUSIeEy00lQ9lnRiDsFwI4V0H+oOpXKNd5H/w9TY?=
 =?us-ascii?Q?h3KzlQGpJ8kjSfc2zaYCoPLZgkvzZFHgD4dSGeCVQ7O0DsDvbeDD/1FSAwS7?=
 =?us-ascii?Q?V8dVLh7uCg9QxOxafGGMrugIubkgYMZwZEjU7QlpEpulYyibEI/Oh7bvK0Vw?=
 =?us-ascii?Q?7GkzzH/zdZh9QX5z5Szh4jg8laKjUTrBbRfJVxIjN8E+CNleK7uP838Cvwuj?=
 =?us-ascii?Q?HQ6B1SRiLNhPtv5dZTPW9S9Wx7Y8yW+1r9aDdb2w9PF5NgadfRK6hEHu1mhs?=
 =?us-ascii?Q?DX+RPd2Zhltjd0Qhc3YQ5v1QkUaeaK01wKLVoJvXkpsY6Upz43qnJMF7vbP2?=
 =?us-ascii?Q?6f4Cuqyus2ugq9USnwvdpXpVXiT41xdr8HJT0lWvofAqnw+uQZksyQfoeaDp?=
 =?us-ascii?Q?0PBYQTYkQLk2H/fy8EgGZKLJwDCQfiZV0pC82oLto1jxNgXNu/jsskitzjnm?=
 =?us-ascii?Q?KAbrURHSyToiYvDehlsHZZskEFzZmH4Pa7SA3mkcu1XXlHi45vB9UxVmQz+2?=
 =?us-ascii?Q?zp6gFXW+6jJLMuK0ha0Xn30WOo50f/RZhPQXSSbbxVZ40swhE14gIiwIMusK?=
 =?us-ascii?Q?qV/Z3+Ze66qBJxzPuBrCNLZ4xSYRdAr4WrDEAKRC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB5168.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef95ac3c-a5ba-4834-4bbe-08db762b63aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 09:54:53.0805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4+nDYh5+dOprADXj+o89l4IEkjUP0CGPft1t9IfOZ5VaajkI3eGvjleQdYRXHUh3yPGVA3BVkGvNOd9266ILg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7047
X-Proofpoint-GUID: _s4RM_9CpRRa64a_gjLkChkpBcsFZcGq
X-Proofpoint-ORIG-GUID: _s4RM_9CpRRa64a_gjLkChkpBcsFZcGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_06,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=924 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1011 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260089

>On Mon, Jun 26, 2023 at 04:53:43AM +0800, kernel test robot wrote:
>> tree:
>https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/gi=
t/next/lin
>ux-
>next.git__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQVkUWp
>cL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosibK3JnB$  master
>> head:   8d2be868b42c08290509c60515865f4de24ea704
>> commit: e0cbc202388af454eb771043b20db6dfe68199ec [11546/12162] mfd:
>max77541: Add ADI MAX77541/MAX77540 PMIC Support
>> config: x86_64-randconfig-r003-20230626
>(https://urldefense.com/v3/__https://download.01.org/0day-
>ci/archive/20230626/202306260401.qZlYQpV2-
>lkp@intel.com/config__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXq
>lC8DQVkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosrRvALWc$ )
>> compiler: clang version 15.0.7
>(https://urldefense.com/v3/__https://github.com/llvm/llvm-
>project.git__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQVkU
>WpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosvqDz55X$
>8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
>> reproduce: (https://urldefense.com/v3/__https://download.01.org/0day-
>ci/archive/20230626/202306260401.qZlYQpV2-
>lkp@intel.com/reproduce__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2K
>SjXqlC8DQVkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosglKrEOj$ )
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-
>all/202306260401.qZlYQpV2-
>lkp@intel.com/__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQ
>VkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosnz2lU0N$
>>
>> All warnings (new ones prefixed by >>):
>>
>> >> drivers/mfd/max77541.c:176:18: warning: cast to smaller integer type =
'enum
>max7754x_ids' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>>            max77541->id  =3D (enum max7754x_ids)device_get_match_data(de=
v);
>
>	max77541->id  =3D (enum
>max7754x_ids)(uintptr_t)device_get_match_data(dev);
>
>should fix it.
>
>--
>With Best Regards,
>Andy Shevchenko
>
Hi Andy,

As far as I understand, I should update the code then resend it again, righ=
t?

Regards,
Okan Sahin
