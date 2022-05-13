Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F00B7A
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 18:50:39 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DFd9MD001979;
	Fri, 13 May 2022 18:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=7HJF8nZ9M61ggdJ37+6jDU4em1h5MQDwEu7xlpkxFa8=;
 b=Un9A+lZM1xBclxetjF1tyrLw4W4ehah3HLCgdIJRzxArajZ5G06aT9YJpSvhwtzLjjsp
 kcsWVA+1mHBy4LquCeo2w0fSEpULoMVdDRhZCBKvhtIXuqDWmaWIBkcuTJqzGu9kNjgS
 xqg4MLy2kEEj92Qycl3BGioR1ch/AN5HRA2WaLScC9ULWnTYLQX92Jl/Vw3WUhr69tRb
 E++PH+EtpwDSkZrjhtdiK10jOhhMIF0lZf+eljiENERzaEZs/fokHhDSwqz7eUO4NMi8
 kN9eAXl+SZmLCVyanFYiE8NZ5Iv04cj4sM7TaTbWMIbOPCHpIru4NLk7eznOH9wQu5B6 FQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwf6cft93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 May 2022 18:50:27 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24DIjiI2017182;
	Fri, 13 May 2022 18:50:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fx5c2mjuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 May 2022 18:50:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9tgIs/vzeZ5+VeiZHpnyJsLMhRj0bNKUFlR7L1E/w+DcvKBy141JmMCdMrK2RxEa9F+h/SCr4R/kCiDrtgpEgmkTSlq5kwwIywpO/shWGvNNSTT2qMvKIKjof6MWXEpmJrBGMdgemQ4tVDNvbJgisRLMlayMunAZ1+V4/CY9i3Yw0/3Q/DVDaLPTVhYoChOVCupKe8BQF1fPFLy8a+V8qIfLBwcabg3D8XyU8q+6qHQMcGfIvuenxbLeI+JBQ5jwpDK9Fea/UUn3H7tJKbAMtycXHlTjQFhnjsrJsstKyVfv7TZ88nnzqrCa/fjHoS0PUAEXQ3lrHs1l0urqoGYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HJF8nZ9M61ggdJ37+6jDU4em1h5MQDwEu7xlpkxFa8=;
 b=Xb3UlICvUhf+LueLjZXL0e9lQGfoAOdnS2m4kflI2Zbz8eRDpwDCouO3w487+wWaR+LcaOzn3vSfLx3g81/Db+dRUCUno/F5+OICM/Oe39t13nKntGqI2o/tUkGQrz2lFh7sD5O5M6HPUUZkZSzAHXHBdCsypdvPXJrzxxzEKs2LJksEgD+rMpnXO0BW2JrZ0b0Iq+7H0z3RzATVGOzDhlfX7lKUM7fqQFSGeQm1bTGApyNkoW7f+eR4+dD4AHCW644wF2GQj/G/oX0cxFILg/7lGEHXF+6rmyRtAZbnU2Qjn6/HJJUz7/jOcioCcbkWe5XF9M8Cc31Zxvw5JngVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HJF8nZ9M61ggdJ37+6jDU4em1h5MQDwEu7xlpkxFa8=;
 b=BHJf9BaVJoz6rEqt8xjGf6UhN2EoJZNMKvEkse/WtUz9GTLYpICQ9CcIFrov24KhhULMEpjkaDx5CS6y1GT5wmPAB1nx5fDCBaa9CkBmqCsCeo7Hm8utcbgrAaQPt2AgIhcwDE/A4RhKlgVmiQQ/n63V9kZwCVafEWzEKZCeKF0=
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
 by DM6PR10MB3324.namprd10.prod.outlook.com (2603:10b6:5:1ad::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 18:50:24 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::1cac:db16:e2f0:9c16]) by SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::1cac:db16:e2f0:9c16%7]) with mapi id 15.20.5250.017; Fri, 13 May 2022
 18:50:24 +0000
From: Jane Chu <jane.chu@oracle.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "linux-nvdimm@lists.01.org"
	<linux-nvdimm@lists.01.org>,
        Christoph Hellwig <hch@lst.de>, Jane Chu
	<jane.chu@oracle.com>
Subject: Re: [nvdimm:libnvdimm-for-next 8/11] fs/fuse/virtio_fs.c:784:19:
 error: incompatible function pointer types initializing 'long (*)(struct
 dax_device *, unsigned long, long, enum dax_access_mode, void **, pfn_t *)'
 with an expression of type 'long (stru...
Thread-Topic: [nvdimm:libnvdimm-for-next 8/11] fs/fuse/virtio_fs.c:784:19:
 error: incompatible function pointer types initializing 'long (*)(struct
 dax_device *, unsigned long, long, enum dax_access_mode, void **, pfn_t *)'
 with an expression of type 'long (stru...
Thread-Index: AQHYZvpNzzeQvUczOEqF1mUdsmStEQ==
Date: Fri, 13 May 2022 18:50:24 +0000
Message-ID: <4960152c-4bff-4749-1dfa-61f2b2b1fd3f@oracle.com>
References: <202205132308.wrD99x33-lkp@intel.com>
In-Reply-To: <202205132308.wrD99x33-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bdf074d-f7de-4309-0d10-08da35117063
x-ms-traffictypediagnostic: DM6PR10MB3324:EE_
x-microsoft-antispam-prvs: 
 <DM6PR10MB3324CDF26E91F8BC06271F70F3CA9@DM6PR10MB3324.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jI2I258Rlf/3EpCTAedjqwVlVcyFdVlz4CnPR+M9she7HCSHQla7miTIil9yYO2DWVfKxmFJV5Meqq12Z5je4wZCYQ+cbQ7m9Y7N7kz5qSNeUTj+foC8TsS4yPKBubZtfm2bPOHlt2VoZxR/0wjH1hlZ7iVP08VcI8+8p6QSuQ2PPuayBhaC0jLX3JSkyKLzTfmef3G+julGyYmG/a9avki5It5I36QHm6RBJSi9xI6SdnywYrHtpTPMwLMPB6/upOFvKLZfM+TZdAtNkcCb2ryCAQo+iVoF01NlO3XjZq7uA9aWbSksDyHvk5yZReqphvbd20vGTndb+nd0x3e6Aw3EeQWbeLIZlAdEtq5YNDzHz0dzKbV2MXHI28Iv0uoJM7oO3Zh+czkjlsJpo7k24ihwqcaYCk9dJbWiwdgL+upzkYFKhp/UIHDBorD6uI6sYf5QyBcVGBiO0zpNhxbGSInW4ywW3x242YBTz58FMUYt8n/KQo7u71a88iATY4JB5YQ+qJbYof+lJTst+4ue2UqocyK3fHSWDRziPVtWU9H0AfuYcpsI2MAHXeaCiOIBRaRwakx3u0toMshM1rsPB1ibq+bJq3pF6grzWcLd8crpGqt4hwAwhh8BIlB+2qrNejE0OFhGnXdt8ZbBxRIlp2WsMqrolNruYVA80zQw6oA9lIrIh5TYr5phn+ROppk08cc5TmsFZnj3/q1SsXGFmQoINjLYshbhAA7w+5eTjRAqL7eZjF1axpAFPXi9r0CXJfI00M3du8hZAlWZb2Lnk5I6oIFz4euonpTmqt3QjgrHXqG5cGc+wvmbJB+hcw2FE4JCIjroVZSPijMw0qMKdQ9prx3Nrip5wnrJx/ps/WZZuDd+FadB+rfecLZtO3uXW0JgmmJrneCuf+Auy8nUIk35rS17ymmjOVm7Mhh6+6VKgoBsxfhUnlB1b2E6zqaw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB4429.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(966005)(107886003)(71200400001)(38070700005)(38100700002)(2616005)(186003)(6512007)(2906002)(53546011)(83380400001)(6486002)(6506007)(5660300002)(8936002)(44832011)(508600001)(26005)(31686004)(316002)(36756003)(66476007)(86362001)(66946007)(66446008)(76116006)(4326008)(66556008)(64756008)(8676002)(54906003)(6916009)(122000001)(31696002)(223183001)(219693005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bko5QUVQSU5kVzFEbFpoQ2o4c0N6aTdsWGR5WVpycS9DcDhyQW54WHByR3gw?=
 =?utf-8?B?Rk5XQ2IxZDJEbGdrblR1YmJWcjBCcVdpa3dydTZMVkVFR2JxUXE1ZEkvdi9B?=
 =?utf-8?B?bVNOUEVjS2N6V2pDdi9lYzZkMnEyZTRFenp6SVJEVDhPOVJzSVc4RU1IOVBH?=
 =?utf-8?B?MUJ6VStVb3RQVy95alZNZlh2elpyODhjVStBNlpoeXN2MUV0bmxRZFJlOHN1?=
 =?utf-8?B?c2I5dEQxZ2tDUExiUUJndzlaZm03YVB4bnY5RlJLVCtVcjV0QjVLOWZWRjFz?=
 =?utf-8?B?alJVWEw5WXRZbEpJeERCMnl3THUyb1JuZnBBc1I2bGZKNnF5dUJWNklJaDFG?=
 =?utf-8?B?NWNBWVFJTE1XVkNMMGxFWGlLV2hBRkdJOEVLR1YvRW1mZTJxRnNBV1R4YVhr?=
 =?utf-8?B?b2tyRW9OdjdiTVd4aXZuM3d2ckQ5cDRURkxmMS9DT1Vib2RreU8zeXZRb2V0?=
 =?utf-8?B?UG5Bd1A5QmM0YzR6YVUrMkZDQnF5MldvQ1ZNTk9hdGt5bmplMHB2OFErTjhh?=
 =?utf-8?B?SWhTbkxNT255dVlIdE5hZmoyYnRTL3RPSkdvbHZvR2dRTGwzckN4M2tvN01r?=
 =?utf-8?B?MEhyTlJZVkpHR2VvSzg2VEQ1anVNK3IySHl3QTY2ZVRmN2IrMU83Q24vMmNX?=
 =?utf-8?B?VTl6T1pTaTBQYjA4ejlWcDlha2xpQWxoMk13UUQ2OGVLWUQ1eVZoc2tvaTlG?=
 =?utf-8?B?Tk04a2NGTjEvUDErWk1rNDYwQWhYMTlqTGpSclB2ekhQWU9wZEFJMlpMZDNv?=
 =?utf-8?B?Kzgxc0diZWkrc1l3M1NPWFdaTFBEckZhczVzMjhzTFR4M0FqYStIQzk4UnJY?=
 =?utf-8?B?Yk1ESWUwK2FodDd6ckFyanN3YzJhRG16bm5lYVhqUmM4OGhSWCs1UnQ0ZHVk?=
 =?utf-8?B?Tk5TQk94WEt0ejRIYXVMYnhRZDA2cDZNMDJrOWE1TGI3OCtLdXlIekQ1ak1D?=
 =?utf-8?B?R2RKZjFKQkNiVUQ3MnlTQ1dXaUN1K0I3eGc5eHRDYXhZclF0bnpMcDJ1VmRz?=
 =?utf-8?B?ellmTExHMTNoMVpCTGx0ZlAwUEo5S3dzcmpnQ0w0TlRmZ1ZxaU80OERDd0lt?=
 =?utf-8?B?ZnpLRDdteFhvVEpEdkQxMGt3cit5YjNaQTE5SzIyTFNrUFFESlZPaFc5cncz?=
 =?utf-8?B?c2NlVGlDSlB2bHJTdzRjSVk4enBvaEwweUxrd1VOeFRWZVVRZHdZbmx3N2ZH?=
 =?utf-8?B?VklZZ1RORmE0U25aM2tLZEM4YjQwdFlYOFpZVUl6MHRwQnlwbExydUYwTmNC?=
 =?utf-8?B?UTQvVWwzVnZYS01FQUVpQTZFaFgwaEp2enk3ZS9aSzhUZVFxeDZHK1M2YmZt?=
 =?utf-8?B?ZlZtT2QxdDZ6KzRVV2J1NWV0NkNsMzVkRThBSDVnT1FVbGNVdDhybUNOMFhL?=
 =?utf-8?B?Q2U0U090c3JibG4yWDgwME5XbG0vNnh4N0VDTFRFR1hIR2k5M3hHYU9qdE9P?=
 =?utf-8?B?SUlrYjVKemJNMUJMS2ZVRmxMYkJsTHcvTlhraUhJcjdwNkxSdlh1MU00bUND?=
 =?utf-8?B?azBmRXRtOXpjT3BxNmw3NFlPM3I2bUxmSUt1YzFEaWF3YldPKzlKMFN6b0lp?=
 =?utf-8?B?RmRndHZ0MkhDK0JIVTFxRVNjSGpaNDg1QnBiRW9DcmtSMW0yWFlLUERkTlRO?=
 =?utf-8?B?TktzRTdtWWlIZk1UQUpXMS80TlA1a1krNnBSVFJOYmRlZGlwcDBxVW92M2FY?=
 =?utf-8?B?WGZ1bllybWpKeWo3U3dTMllGTStLb1hkaEE0UkFVZGw1aDVhaG1sYlRmakw3?=
 =?utf-8?B?bmIwWkRsaFZudS8vbXFOd3RqQkVyeUR1cWlXeHdET2RkY2FuTXRCYzhkaHZj?=
 =?utf-8?B?TWFrekd5VWlyVzByMGg3UmgyOHVvaFNubkV5d3lvM0tyRzRGend3WE14WjlR?=
 =?utf-8?B?dnBsTGtjVUJ6WWVBY0VuSHkzcms3d1Y1Sm45Z1A1UlhEdjM1R29RTHJJZXdM?=
 =?utf-8?B?R3JNN2VJRFNYZjNRUGJveEtzSmsweTE0anBxbHFmUWpJZlkvL3dJUW1xUG42?=
 =?utf-8?B?MzA5NCtFYVNaMDg1cisySW5ySXZmOFh3alRmR0p5NFNHRUJOWVdJc04ycVBL?=
 =?utf-8?B?Q0NrVlRITmhqUkQyUGtDblFGMEZqRjlXd2FQU0t2RWMvdHpZOVE1RGEzMity?=
 =?utf-8?B?RzZkZ3l0amtlOXJNS1E2N0hSblZvT0ZFQUl0K3FoLzdVdkY1alArcG55MDRL?=
 =?utf-8?B?REJqczBMRjNGc2pMSDFHQm9kZ01CMkwvSnVGK0Z4ajFuVUFtUlVvWHlkcVhC?=
 =?utf-8?B?RVVyRG44MXgzVHBwcGNVL3Fvemo3Vk91NFhkcmhkUC9yQnRCL05rQy9xYjlV?=
 =?utf-8?B?YS9FeHlxY0gyM3lsZkZBWTJJNjUveHV4QmZpQnkwUWQxbDdFMFhoZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18D8FF3C80D3C744A9CD22037C4209D6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdf074d-f7de-4309-0d10-08da35117063
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 18:50:24.2289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oh0dXBa9vr6qtThRXH99enm0xd0N7/DPVfXOrifGs51dIPtOcpgrc9K3zdpjvj7truvi64HPKVAKkZrng75EkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3324
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-13_08:2022-05-13,2022-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205130077
X-Proofpoint-ORIG-GUID: ceS9R0AMUdupMekM431ZYG02WfVsZhNJ
X-Proofpoint-GUID: ceS9R0AMUdupMekM431ZYG02WfVsZhNJ

U29ycnkgYWdhaW4sIGFuZCBJJ20gc2NyYXRjaGluZyBteSBoZWFkIGhvdyBjb3VsZCBteSBidWls
ZCBub3QgY29tcGxhaW4gDQp3aGVuIEkgbWlzc2VkIHRoaXMgY2hhbmdlPw0KDQpkaWZmIC0tZ2l0
IGEvZnMvZnVzZS92aXJ0aW9fZnMuYyBiL2ZzL2Z1c2UvdmlydGlvX2ZzLmMNCmluZGV4IDg2Yjdk
YmI2YTBkNC4uYzlmYWE1ZjI1ODdjIDEwMDY0NA0KLS0tIGEvZnMvZnVzZS92aXJ0aW9fZnMuYw0K
KysrIGIvZnMvZnVzZS92aXJ0aW9fZnMuYw0KQEAgLTc3Myw2ICs3NzMsOCBAQCBzdGF0aWMgaW50
IHZpcnRpb19mc196ZXJvX3BhZ2VfcmFuZ2Uoc3RydWN0IA0KZGF4X2RldmljZSAqZGF4X2RldiwN
CiAgICAgICAgIHZvaWQgKmthZGRyOw0KDQogICAgICAgICByYyA9IGRheF9kaXJlY3RfYWNjZXNz
KGRheF9kZXYsIHBnb2ZmLCBucl9wYWdlcywgJmthZGRyLCBOVUxMKTsNCisgICAgICAgcmMgPSBk
YXhfZGlyZWN0X2FjY2VzcyhkYXhfZGV2LCBwZ29mZiwgbnJfcGFnZXMsIERBWF9BQ0NFU1MsDQor
ICAgICAgICAgICAgICAgICAgICAgICAma2FkZHIsIE5VTEwpOw0KICAgICAgICAgaWYgKHJjIDwg
MCkNCiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOw0KICAgICAgICAgbWVtc2V0KGthZGRyLCAw
LCBucl9wYWdlcyA8PCBQQUdFX1NISUZUKTsNCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSBw
cmVmZXIgYSBwYXRjaCBzZW50IHlvdXIgd2F5Lg0KDQp0aGFua3MhDQotamFuZQ0KDQoNCk9uIDUv
MTMvMjAyMiA4OjMzIEFNLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZToNCj4gdHJlZTogICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9udmRpbW0vbnZkaW1t
LmdpdCBsaWJudmRpbW0tZm9yLW5leHQNCj4gaGVhZDogICA4NjZmODQxZDMxMmI5NWEzYTBiMmRl
MTA0ZThkOWMwMjAwNmU3OTUzDQo+IGNvbW1pdDogNDY3NjMzOWE3MDc0NjQzNGUxYWNiNjc4ZmZh
ZWExNjRkMjRkZmM5YyBbOC8xMV0gZGF4OiBpbnRyb2R1Y2UgREFYX1JFQ09WRVJZX1dSSVRFIGRh
eCBhY2Nlc3MgbW9kZQ0KPiBjb25maWc6IHg4Nl82NC1yYW5kY29uZmlnLWEwMTIgKGh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIyMDUxMy8yMDIyMDUxMzIzMDgud3JE
OTl4MzMtbGtwQGludGVsLmNvbS9jb25maWcpDQo+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9uIDE1
LjAuMCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0IDM4MTg5NDM4YjY5Y2Ey
N2I0YzZjZTcwN2M1MmRiZDIxNzU4M2QwNDYpDQo+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBi
dWlsZCk6DQo+ICAgICAgICAgIHdnZXQgaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29t
L2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNyb3NzIC1PIH4vYmluL21ha2UuY3Jv
c3MNCj4gICAgICAgICAgY2htb2QgK3ggfi9iaW4vbWFrZS5jcm9zcw0KPiAgICAgICAgICAjIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L252ZGltbS9udmRp
bW0uZ2l0L2NvbW1pdC8/aWQ9NDY3NjMzOWE3MDc0NjQzNGUxYWNiNjc4ZmZhZWExNjRkMjRkZmM5
Yw0KPiAgICAgICAgICBnaXQgcmVtb3RlIGFkZCBudmRpbW0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbnZkaW1tL252ZGltbS5naXQNCj4gICAgICAgICAg
Z2l0IGZldGNoIC0tbm8tdGFncyBudmRpbW0gbGlibnZkaW1tLWZvci1uZXh0DQo+ICAgICAgICAg
IGdpdCBjaGVja291dCA0Njc2MzM5YTcwNzQ2NDM0ZTFhY2I2NzhmZmFlYTE2NGQyNGRmYzljDQo+
ICAgICAgICAgICMgc2F2ZSB0aGUgY29uZmlnIGZpbGUNCj4gICAgICAgICAgbWtkaXIgYnVpbGRf
ZGlyICYmIGNwIGNvbmZpZyBidWlsZF9kaXIvLmNvbmZpZw0KPiAgICAgICAgICBDT01QSUxFUl9J
TlNUQUxMX1BBVEg9JEhPTUUvMGRheSBDT01QSUxFUj1jbGFuZyBtYWtlLmNyb3NzIFc9MSBPPWJ1
aWxkX2RpciBBUkNIPXg4Nl82NCBTSEVMTD0vYmluL2Jhc2ggZnMvDQo+IA0KPiBJZiB5b3UgZml4
IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnIGFzIGFwcHJvcHJpYXRlDQo+IFJl
cG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gDQo+IEFsbCBl
cnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4gDQo+Pj4gZnMvZnVzZS92aXJ0aW9f
ZnMuYzo3NzU6NjM6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5jdGlvbiBjYWxsLCBl
eHBlY3RlZCA2LCBoYXZlIDUNCj4gICAgICAgICAgICAgcmMgPSBkYXhfZGlyZWN0X2FjY2Vzcyhk
YXhfZGV2LCBwZ29mZiwgbnJfcGFnZXMsICZrYWRkciwgTlVMTCk7DQo+ICAgICAgICAgICAgICAg
ICAgfn5+fn5+fn5+fn5+fn5+fn4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeDQo+ICAgICBpbmNsdWRlL2xpbnV4L2RheC5oOjE4NTo2OiBub3RlOiAnZGF4X2RpcmVjdF9h
Y2Nlc3MnIGRlY2xhcmVkIGhlcmUNCj4gICAgIGxvbmcgZGF4X2RpcmVjdF9hY2Nlc3Moc3RydWN0
IGRheF9kZXZpY2UgKmRheF9kZXYsIHBnb2ZmX3QgcGdvZmYsIGxvbmcgbnJfcGFnZXMsDQo+ICAg
ICAgICAgIF4NCj4+PiBmcy9mdXNlL3ZpcnRpb19mcy5jOjc4NDoxOTogZXJyb3I6IGluY29tcGF0
aWJsZSBmdW5jdGlvbiBwb2ludGVyIHR5cGVzIGluaXRpYWxpemluZyAnbG9uZyAoKikoc3RydWN0
IGRheF9kZXZpY2UgKiwgdW5zaWduZWQgbG9uZywgbG9uZywgZW51bSBkYXhfYWNjZXNzX21vZGUs
IHZvaWQgKiosIHBmbl90ICopJyB3aXRoIGFuIGV4cHJlc3Npb24gb2YgdHlwZSAnbG9uZyAoc3Ry
dWN0IGRheF9kZXZpY2UgKiwgdW5zaWduZWQgbG9uZywgbG9uZywgdm9pZCAqKiwgcGZuX3QgKikn
IFstV2Vycm9yLC1XaW5jb21wYXRpYmxlLWZ1bmN0aW9uLXBvaW50ZXItdHlwZXNdDQo+ICAgICAg
ICAgICAgIC5kaXJlY3RfYWNjZXNzID0gdmlydGlvX2ZzX2RpcmVjdF9hY2Nlc3MsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gICAgIDIg
ZXJyb3JzIGdlbmVyYXRlZC4NCj4gDQo+IA0KPiB2aW0gKzc4NCBmcy9mdXNlL3ZpcnRpb19mcy5j
DQo+IA0KPiAyMmYzNzg3ZTlkOTVlNyBTdGVmYW4gSGFqbm9jemkgMjAyMC0wOC0xOSAgNzY4DQo+
IDIyZjM3ODdlOWQ5NWU3IFN0ZWZhbiBIYWpub2N6aSAyMDIwLTA4LTE5ICA3NjkgIHN0YXRpYyBp
bnQgdmlydGlvX2ZzX3plcm9fcGFnZV9yYW5nZShzdHJ1Y3QgZGF4X2RldmljZSAqZGF4X2RldiwN
Cj4gMjJmMzc4N2U5ZDk1ZTcgU3RlZmFuIEhham5vY3ppIDIwMjAtMDgtMTkgIDc3MCAgCQkJCSAg
ICAgcGdvZmZfdCBwZ29mZiwgc2l6ZV90IG5yX3BhZ2VzKQ0KPiAyMmYzNzg3ZTlkOTVlNyBTdGVm
YW4gSGFqbm9jemkgMjAyMC0wOC0xOSAgNzcxICB7DQo+IDIyZjM3ODdlOWQ5NWU3IFN0ZWZhbiBI
YWpub2N6aSAyMDIwLTA4LTE5ICA3NzIgIAlsb25nIHJjOw0KPiAyMmYzNzg3ZTlkOTVlNyBTdGVm
YW4gSGFqbm9jemkgMjAyMC0wOC0xOSAgNzczICAJdm9pZCAqa2FkZHI7DQo+IDIyZjM3ODdlOWQ5
NWU3IFN0ZWZhbiBIYWpub2N6aSAyMDIwLTA4LTE5ICA3NzQNCj4gMjJmMzc4N2U5ZDk1ZTcgU3Rl
ZmFuIEhham5vY3ppIDIwMjAtMDgtMTkgQDc3NSAgCXJjID0gZGF4X2RpcmVjdF9hY2Nlc3MoZGF4
X2RldiwgcGdvZmYsIG5yX3BhZ2VzLCAma2FkZHIsIE5VTEwpOw0KPiAyMmYzNzg3ZTlkOTVlNyBT
dGVmYW4gSGFqbm9jemkgMjAyMC0wOC0xOSAgNzc2ICAJaWYgKHJjIDwgMCkNCj4gMjJmMzc4N2U5
ZDk1ZTcgU3RlZmFuIEhham5vY3ppIDIwMjAtMDgtMTkgIDc3NyAgCQlyZXR1cm4gcmM7DQo+IDIy
ZjM3ODdlOWQ5NWU3IFN0ZWZhbiBIYWpub2N6aSAyMDIwLTA4LTE5ICA3NzggIAltZW1zZXQoa2Fk
ZHIsIDAsIG5yX3BhZ2VzIDw8IFBBR0VfU0hJRlQpOw0KPiAyMmYzNzg3ZTlkOTVlNyBTdGVmYW4g
SGFqbm9jemkgMjAyMC0wOC0xOSAgNzc5ICAJZGF4X2ZsdXNoKGRheF9kZXYsIGthZGRyLCBucl9w
YWdlcyA8PCBQQUdFX1NISUZUKTsNCj4gMjJmMzc4N2U5ZDk1ZTcgU3RlZmFuIEhham5vY3ppIDIw
MjAtMDgtMTkgIDc4MCAgCXJldHVybiAwOw0KPiAyMmYzNzg3ZTlkOTVlNyBTdGVmYW4gSGFqbm9j
emkgMjAyMC0wOC0xOSAgNzgxICB9DQo+IDIyZjM3ODdlOWQ5NWU3IFN0ZWZhbiBIYWpub2N6aSAy
MDIwLTA4LTE5ICA3ODINCj4gMjJmMzc4N2U5ZDk1ZTcgU3RlZmFuIEhham5vY3ppIDIwMjAtMDgt
MTkgIDc4MyAgc3RhdGljIGNvbnN0IHN0cnVjdCBkYXhfb3BlcmF0aW9ucyB2aXJ0aW9fZnNfZGF4
X29wcyA9IHsNCj4gMjJmMzc4N2U5ZDk1ZTcgU3RlZmFuIEhham5vY3ppIDIwMjAtMDgtMTkgQDc4
NCAgCS5kaXJlY3RfYWNjZXNzID0gdmlydGlvX2ZzX2RpcmVjdF9hY2Nlc3MsDQo+IDIyZjM3ODdl
OWQ5NWU3IFN0ZWZhbiBIYWpub2N6aSAyMDIwLTA4LTE5ICA3ODUgIAkuemVyb19wYWdlX3Jhbmdl
ID0gdmlydGlvX2ZzX3plcm9fcGFnZV9yYW5nZSwNCj4gMjJmMzc4N2U5ZDk1ZTcgU3RlZmFuIEhh
am5vY3ppIDIwMjAtMDgtMTkgIDc4NiAgfTsNCj4gMjJmMzc4N2U5ZDk1ZTcgU3RlZmFuIEhham5v
Y3ppIDIwMjAtMDgtMTkgIDc4Nw0KPiANCj4gOjo6Ojo6IFRoZSBjb2RlIGF0IGxpbmUgNzg0IHdh
cyBmaXJzdCBpbnRyb2R1Y2VkIGJ5IGNvbW1pdA0KPiA6Ojo6OjogMjJmMzc4N2U5ZDk1ZTcyZDFm
MDk3OTVmMjk0ZmIwMTBlMjk5OGY0MyB2aXJ0aW9mczogc2V0IHVwIHZpcnRpb19mcyBkYXhfZGV2
aWNlDQo+IA0KPiA6Ojo6OjogVE86IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4NCj4gOjo6Ojo6IENDOiBNaWtsb3MgU3plcmVkaSA8bXN6ZXJlZGlAcmVkaGF0LmNvbT4NCj4g
DQoNCg==
