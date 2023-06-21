Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030AFC8D7;
	Wed, 21 Jun 2023 10:13:18 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L7KqXq022976;
	Wed, 21 Jun 2023 04:58:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3rbvr2gh2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 04:58:51 -0400
Received: from m0167088.ppops.net (m0167088.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L8r3sf018929;
	Wed, 21 Jun 2023 04:58:51 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3rbvr2gh2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 04:58:50 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 35L8wnvr002401
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 04:58:49 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 21 Jun
 2023 04:58:48 -0400
Received: from ASHBMBX8.ad.analog.com ([fe80::30b9:230c:9621:902f]) by
 ASHBMBX8.ad.analog.com ([fe80::30b9:230c:9621:902f%9]) with mapi id
 15.02.0986.014; Wed, 21 Jun 2023 04:58:48 -0400
From: "Paller, Kim Seer" <KimSeer.Paller@analog.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>,
        kernel test robot <lkp@intel.com>
Subject: RE: [jic23-iio:testing 6/10] drivers/iio/adc/max14001.c:135:13:
 warning: result of comparison of constant 18446744073709551615 with
 expression of type 'typeof (_Generic((mask), char: (unsigned char)0, unsigned
 char: (unsigned char)0, signed char: (unsi...
Thread-Topic: [jic23-iio:testing 6/10] drivers/iio/adc/max14001.c:135:13:
 warning: result of comparison of constant 18446744073709551615 with
 expression of type 'typeof (_Generic((mask), char: (unsigned char)0, unsigned
 char: (unsigned char)0, signed char: (unsi...
Thread-Index: AQHZpBoMRQgB2IdeHUCavmdJyiD/i6+U8NlA
Date: Wed, 21 Jun 2023 08:58:47 +0000
Message-ID: <010ac7c3707f4eb0aef285b5e823f8e3@analog.com>
References: <202306211545.7b6CdqsL-lkp@intel.com>
 <CAHp75VcNj-P_WCvx2Pf9sj_ir2oKf2AZ-mdTP=KHSuPY7WcjeA@mail.gmail.com>
In-Reply-To: <CAHp75VcNj-P_WCvx2Pf9sj_ir2oKf2AZ-mdTP=KHSuPY7WcjeA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYTNCaGJHeGxjakpjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTFrTTJabE5ESmtOQzB4TURFeExURXhaV1V0WVdVM1pDMW1PR05p?=
 =?utf-8?B?TmpjME9XVmhOMkpjWVcxbExYUmxjM1JjWkRObVpUUXlaRFV0TVRBeE1TMHhN?=
 =?utf-8?B?V1ZsTFdGbE4yUXRaamhqWWpZM05EbGxZVGRpWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?STJORE0ySWlCMFBTSXhNek16TVRneE1UVXlOak0xTVRneU9EY2lJR2c5SW0w?=
 =?utf-8?B?d2RVSkNNSGM0WVdORmIwRTVOMWxZV0RacFRWQnRZMWc0VlQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUWxCR2JXbFhTSEZVV2tGWE5FOTBVV0pFZWtOa1JH?=
 =?utf-8?B?Sm5OakZDYzFCTlNqQk5SRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQmRtUm9hM2huUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
x-originating-ip: [10.116.184.234]
x-adiruleop-newscl: Rule Triggered
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-GUID: aIZ9tWoWS9dHlgbzyiUwso8h7HkVjJUP
X-Proofpoint-ORIG-GUID: CHRQsKf1hZBsE4bVS6C12oAdPDertYcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_06,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210076

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjEs
IDIwMjMgNDoyNSBQTQ0KPiBUbzoga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+
IENjOiBQYWxsZXIsIEtpbSBTZWVyIDxLaW1TZWVyLlBhbGxlckBhbmFsb2cuY29tPjsgbGx2bUBs
aXN0cy5saW51eC5kZXY7IG9lLQ0KPiBrYnVpbGQtYWxsQGxpc3RzLmxpbnV4LmRldjsgSm9uYXRo
YW4gQ2FtZXJvbg0KPiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW2ppYzIzLWlpbzp0ZXN0aW5nIDYvMTBdIGRyaXZlcnMvaWlvL2FkYy9tYXgxNDAwMS5jOjEz
NToxMzoNCj4gd2FybmluZzogcmVzdWx0IG9mIGNvbXBhcmlzb24gb2YgY29uc3RhbnQgMTg0NDY3
NDQwNzM3MDk1NTE2MTUgd2l0aA0KPiBleHByZXNzaW9uIG9mIHR5cGUgJ3R5cGVvZiAoX0dlbmVy
aWMoKG1hc2spLCBjaGFyOiAodW5zaWduZWQgY2hhcikwLCB1bnNpZ25lZA0KPiBjaGFyOiAodW5z
aWduZWQgY2hhcikwLCBzaWduZWQgY2hhcjogKHVuc2kuLi4NCj4gDQo+IFtFeHRlcm5hbF0NCj4g
DQo+IE9uIFdlZCwgSnVuIDIxLCAyMDIzIGF0IDEwOjE54oCvQU0ga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gdHJlZToNCj4gaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2ppDQo+IGMyMy9paW8uZ2l0X187ISFBM05pOENTMHkyWSE0NW9fLU1NcjR4cTRlXzlQV3BL
LXNRX3FIQmJGYmJTN1EySi0NCj4gZk5tVHZTUEFRWGpZaHBMWUR0ZUdIU2VXRWJkSUF2MzY0SGlR
QlF5MnRYTWRuejNvZXNQSnZ5REVWZyQNCj4gdGVzdGluZw0KPiA+IGhlYWQ6ICAgMjVlMjAxY2M2
ZmYyNzBhYmMwNjJlMTNmZjkxMjI5MjA5N2NiMjgyNw0KPiA+IGNvbW1pdDogZDNlOTNiNjdmOTM0
YTQ3N2M1ODUxZDU3NWEyMjc4ZjA3YzYyNDJmYiBbNi8xMF0gaWlvOiBhZGM6DQo+ID4gbWF4MTQw
MDE6IE5ldyBkcml2ZXINCj4gPiBjb25maWc6IHg4Nl82NC1hbGx5ZXNjb25maWcNCj4gPiAoaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kv
YXJjaGl2ZS8yDQo+ID4gMDIzMDYyMS8yMDIzMDYyMTE1NDUuN2I2Q2Rxc0wtDQo+IGxrcEBpbnRl
bC5jb20vY29uZmlnX187ISFBM05pOENTMHkyWSE0NW8NCj4gPiBfLU1NcjR4cTRlXzlQV3BLLXNR
X3FIQmJGYmJTN1EySi0NCj4gZk5tVHZTUEFRWGpZaHBMWUR0ZUdIU2VXRWJkSUF2MzY0SGlRQg0K
PiA+IFF5MnRYTWRuejNvZXNPZ0toeDlaUSQgKQ0KPiA+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9u
IDE1LjAuNw0KPiA+IChodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIu
Y29tL2xsdm0vbGx2bS1wcm9qZWN0LmdpdF8NCj4gPiBfOyEhQTNOaThDUzB5MlkhNDVvXy1NTXI0
eHE0ZV85UFdwSy1zUV9xSEJiRmJiUzdRMkotDQo+IGZObVR2U1BBUVhqWWhwTFlEdA0KPiA+IGVH
SFNlV0ViZElBdjM2NEhpUUJReTJ0WE1kbnozb2VzT3g5N21MMFEkDQo+ID4gOGRmZGNjN2I3YmY2
NjgzNGE3NjFiZDhkZTQ0NTg0MGVmNjhlNGQxYSkNCj4gPiByZXByb2R1Y2U6DQo+ID4gKGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2Fy
Y2hpdmUvMg0KPiA+IDAyMzA2MjEvMjAyMzA2MjExNTQ1LjdiNkNkcXNMLQ0KPiBsa3BAaW50ZWwu
Y29tL3JlcHJvZHVjZV9fOyEhQTNOaThDUzB5MlkhDQo+ID4gNDVvXy1NTXI0eHE0ZV85UFdwSy1z
UV9xSEJiRmJiUzdRMkotDQo+IGZObVR2U1BBUVhqWWhwTFlEdGVHSFNlV0ViZElBdjM2NEgNCj4g
PiBpUUJReTJ0WE1kbnozb2VzT0RNaUFGcmckICkNCj4gPg0KPiA+IElmIHlvdSBmaXggdGhlIGlz
c3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3DQo+ID4g
dmVyc2lvbiBvZiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0
YWdzDQo+ID4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
DQo+ID4gfCBDbG9zZXM6DQo+ID4gfCBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMA0KPiA+IHwgMjMwNjIxMTU0NS43YjZD
ZHFzTC1sa3BAaW50ZWwuY29tL19fOyEhQTNOaThDUzB5MlkhNDVvXy0NCj4gTU1yNHhxNGVfOVBX
DQo+ID4gfCBwSy1zUV9xSEJiRmJiUzdRMkotDQo+IGZObVR2U1BBUVhqWWhwTFlEdGVHSFNlV0Vi
ZElBdjM2NEhpUUJReTJ0WE1kbnozb2UNCj4gPiB8IHNPVkdCMGhUUSQNCj4gPg0KPiA+IEFsbCB3
YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiANCj4gT2theSwgeW91IGV2ZW4g
aGF2ZW4ndCBjb21waWxlZCB5b3VyIGNvZGUgOi0oIFRoaXMgc2hvdWxkIHByb2JhYmx5IHVzZSBv
bmUgb2YNCj4gdGhlIGZ1bmN0aW9ucyBmcm9tIGJpdGZpZWxkLmguDQo+IExpa2UgdTMyX2VuY29k
ZV9iaXRzKCkuDQoNCkkgd2FzbuKAmXQgYWJsZSB0byBlbmNvdW50ZXIgYW5kIHRyaWdnZXIgdGhp
cyBraW5kIG9mIHdhcm5pbmcgaW4gbXkgYnVpbGQuIEkgYnVpbHQgDQphbmQgdGVzdGVkIHRoZSBj
b2RlIHdpdGggcnBpNCBhbmQgbGludXgga2VybmVsIHNvdXJjZSB0cmVlIGJlZm9yZSBzZW5kaW5n
IHRoZSBwYXRjaC4gDQpQZXJoYXBzIEkgbWlzc2VkIHNvbWV0aGluZy4gSSB3aWxsIGNoZWNrIGFu
ZCB0cnkgdG8gcmVzb2x2ZSB0aGlzIHdhcm5pbmcuDQoNClRoYW5rcyBhbmQgYmVzdCByZWdhcmRz
LA0KS2ltIFNlZXIgUGFsbGVyDQoNCg0KIA0K
