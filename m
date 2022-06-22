Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1B010E8
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 02:14:14 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M0ImjX017645;
	Wed, 22 Jun 2022 02:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=EJRWfOR5cvodS7qDCWqcnbcqEgWPa0CYB0pkOKbZbHQ=;
 b=qaCjUH1tazNELQKKXXHH925ekDnoR3+b+n5ogh42kh40vnz86RLJHqxJk76xot/zhlM7
 qozvinz11RZsCzY7v32iK6kkaml8s5cTmT8yOC3X3/mjltObr0eQzXdrbLC29Zd/+m/N
 7fR6aLbJ78+wxITjnmq2X/oHPjDfC0VlWtKDkUQPBQLkU9V0IrENFEkhivhp0694F5F1
 0zhjn3eEv1kroPNDbxeCLHP+7dTo5734AZdUAyLH/vNjY5KAYFufcYLvPL7GmqrvODQ3
 jBA5fiIZdwD3GFdwnZN0aJ/DVu845o3IGkWnyITGi+H7i3nneTrof0eISplRg7ZAYzWs Ww== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs78ty619-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jun 2022 02:14:11 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25M26kDc040462;
	Wed, 22 Jun 2022 02:14:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gtf5d2s9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jun 2022 02:14:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYedYIPS0NtPH1uAHxgmKfYDl2glshRf/yIXDR2VAFpzd39SwX75FsaPnFw+Q0jlSah1mhNQ4frI1CHwenjwrE2/YZ/k7KtLDNUBftcTQlfcIP0IGKk85uj+LcT+gpIFkkZqefoqUHLBNPsy0zDH96F437WIJLFIhnygGJ6ILvnlsCqEEQOeuXxCOSvpx97UWUvjddWJmGtLTEuRWWrabsYnhI1FPXkMth3Kc1Cfp488sMOPmXY/NriZDGSICNnPh6H1ayia7UiDMAg2VjMJB82VBkvsFhHIL2agl8gXE542jR0zYkGdFTHii6Hjpps08j1/hJfCrFKLRR9oLe1EtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJRWfOR5cvodS7qDCWqcnbcqEgWPa0CYB0pkOKbZbHQ=;
 b=eYluL5W/YYnCwWQt9FmB1uFMNv4FgEaxReEMipiF7LC+HGzw6Jp2BZoFdCDTVJJbGwevjRM4iBGg6M/y8HxtFLlAo+UWWauSbq1h5kxEsM3tOOJndpBrb2XKMCakVo0NKvxlyoiY/m315/1I3rwqOP2zcGdiuYLOZJLx33bD7NLFvCjlPvcaC79vFDnCERKfInJityCSL04fjEm58I3VN/yX83QxdWhBt9N6fU4EP5+LvDwsh/9fz9SGynfO0/kmCcc01/AvDKe4VmMC3EiTVTvmyjrUXmXfpGuwyOkRgiEN6CR+ic+QWgKkZC75zaemxAjpvZatVIqevrDus0fU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJRWfOR5cvodS7qDCWqcnbcqEgWPa0CYB0pkOKbZbHQ=;
 b=DFdJHLiF9HBlbNOReoHyXZRdYWR+uAR40emfpyKNU4Hpy0Xh8XMc3jyywqwm7ogqWLgWDsj0U4fODEDmcLU4KD6Fkech8zSnG/e/pZTcH3D1AbxY8KrPTWzcLpXyjI/Rvf09H0W3oyGJVEHhBucWPK+naNzfhiBKERZPhNeE/N8=
Received: from MWHPR10MB1407.namprd10.prod.outlook.com (2603:10b6:300:23::20)
 by DS7PR10MB4927.namprd10.prod.outlook.com (2603:10b6:5:3a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 02:14:09 +0000
Received: from MWHPR10MB1407.namprd10.prod.outlook.com
 ([fe80::5d6c:93b5:dfd8:c058]) by MWHPR10MB1407.namprd10.prod.outlook.com
 ([fe80::5d6c:93b5:dfd8:c058%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 02:14:08 +0000
From: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
        Matthias =?ISO-8859-1?Q?M=E4nnich?= <maennich@google.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Cc: Giuliano Procida <gprocida@google.com>,
        Dodji Seketeli <dodji@seketeli.org>,
        clang-built-linux <llvm@lists.linux.dev>
Subject: Re: Kernel ABI Monitoring and toolchain support
Date: Tue, 21 Jun 2022 21:14:05 -0500
Message-ID: <4404532.iIbC2pHGDl@sali>
Organization: Oracle Corp
In-Reply-To: <639f7737-fbbb-f0de-d465-d9770c794afb@oracle.com>
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com> <CAKwvOdmUXcapfojgcRK1OAZuCDCeQmD_cx9=y_iz6-L_uv0eHA@mail.gmail.com> <639f7737-fbbb-f0de-d465-d9770c794afb@oracle.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: DM3PR14CA0131.namprd14.prod.outlook.com
 (2603:10b6:0:53::15) To MWHPR10MB1407.namprd10.prod.outlook.com
 (2603:10b6:300:23::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f151f170-5dc2-4f34-98f8-08da53f4e356
X-MS-TrafficTypeDiagnostic: DS7PR10MB4927:EE_
X-Microsoft-Antispam-PRVS: 
	<DS7PR10MB492773C8E6B3B88FD7302C80BAB29@DS7PR10MB4927.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W1pvPp6FtJySoKPefosli2fFc32uE7lNBVXxO77qoVmuCZ5yYJP/UAeDD2dngpg4r+gaoDBG5ZUycTGroP9FQnBxa7nyG06D6zWxrwglK2SG/LA2DIyYAj3xWwaeyVNOsrnWXDz2zWZFdcI0Fpl7ODjHbpBfcMnr4x8jecK1zS7bGzlglcQA+WU70JYpxIB8wNMRtZchJa/gQdoxzdZOiGbAIHEaC8U41M11d3dt3xzJm0Li/xToFZtVBt4poKp5IfRqHvkCSmOnlXdiZucfo5NeEgo5+GFIi54/ZnuQLQV6H7TrYorhFzfvnmC1GLVcFSaayKEVANLTiRgsotiQ/7K1EbJ8tmIzXX4paJi1lID6c5GtXzdDZnorE1C6Q7Xt7kHCJ1RaLVf9eZEL/rg/GiS59X0bYYRHCyAasN/W2DD6dpDxyWFVayP7AwyjmIQwSL+20pgIvbqZB7TH2LnGOXqU06QDosNy5NqmZNYQzHbVMMausJ80skhLf0eaD+xbF3PvesShSrB/NE3fRvTqz02m/P4m1v0xOV2zgTUwtxKqsT2BLytOwtswPUFUPBTScJ4X1OcalEdj6NDQEtzPtQzdco44ap1wISYa2woRjzc+O8xeKFe8IyRJbJ8iRhlzWKpiFzVNwD2gL+ylxt/Nwk7Os125/OWBxv4ZyHv8PTXY9VIFGe4WpgmQVMaANfefWz4iaVlZ4Ohc3cuvHeNVZpXTvl/cnBMuH8wrd8b68FjhzRtsQzok7FO/7GuAaWKIGwD+W1ZrOk84nzqxXVytRQvv4iRq/I3mPsCu6mKNGFJoG5UbcLW4+DdjTpwlXTnk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR10MB1407.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(346002)(366004)(39860400002)(376002)(396003)(66574015)(53546011)(41300700001)(9686003)(186003)(52116002)(6666004)(36916002)(83380400001)(38100700002)(6636002)(6512007)(6506007)(66946007)(66476007)(8936002)(4326008)(86362001)(33716001)(110136005)(2906002)(316002)(54906003)(5660300002)(478600001)(966005)(8676002)(6486002)(66556008)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?Sm5h7bo+O0TqMvgQnKN3WkBd805MaNvwV9O66ar0427CL0aHOLh+sreUlj?=
 =?iso-8859-1?Q?9MMYNCQl6BwdNRbbdSi/nG2LwWXAj8ZCZzBmao7kIKkyzYx9TzJBplRWBp?=
 =?iso-8859-1?Q?xkKF4Awq5AkdpdJP/8+ZOJ6sS4iVUlzzzskUyYj7zCMTPd76tDIvrnLOaG?=
 =?iso-8859-1?Q?R2NZrDy8Cz4H034b9vnlmr+DQo8jJniIUfPKv1npq6nvwmuMQ95S+YzdwA?=
 =?iso-8859-1?Q?Rx1WJDbGKFlzWKL+wdKMsIDJDgvykod6VV20knWY7U/2+WL7tnSxZgEiIy?=
 =?iso-8859-1?Q?m51kYEYM89VQo0EyaBMr0b6ee2Z3qyzC0w+UlAAK3HzvWbkvhgkFNewMkI?=
 =?iso-8859-1?Q?oQ//0rRTz2b6WQ+zadVAn5w8+6CplRMmYib/uzOmDWy6bHXPRY7ur8kqEj?=
 =?iso-8859-1?Q?tSsMwqNvCbSOLsLuG4jsuye4kk7LLs2cy6KBkZLEXqyRQAnvXt9fkCunp5?=
 =?iso-8859-1?Q?tOv26zs3kU0LKB8jrPiT8IDRXzlELjrFNG2i64f8NZ7R8ZeiyUeXMFA3cD?=
 =?iso-8859-1?Q?lB9aLBtsqCBSBCJyY55ScITZilfDnMjhKZ9g4oBBnu0dXUEhs77rZvBASP?=
 =?iso-8859-1?Q?f+wgJ0BQTgLIC3CBL2Dz8SzXIi0DxR8DJM4Y+1VlxR+S3GnIY2D381wyjQ?=
 =?iso-8859-1?Q?ljA4XIzMqBYPu+zLdcnNtNiFnVWl/jl+jAjQ675dIpOXtpQI9o/q7STfQ6?=
 =?iso-8859-1?Q?GZglhpAtJ+K0scvFvsL3PF8DYPf0s8GEYlcStlqf6jh+9yLcpf5nFjbvYj?=
 =?iso-8859-1?Q?8AjBWNf8kmierFQNyR0HYJYSqOM2UUPqk5pw+Crtz7qSFef8uuZVQCOtKm?=
 =?iso-8859-1?Q?DMBju8gBkP1jaTfCx2ejYy2MXoRsnkmrovLgotQkYLpQVoETB5e6pcWp5T?=
 =?iso-8859-1?Q?4SCNw80a/csnuVz2KV+X+L/k9YV8TAzwbp20wKQMCgTAAFnfgJSR8Izp+4?=
 =?iso-8859-1?Q?OBXI1UQqsDCwtOQWQM9izVQ8oSzNElq3bywRHu/9pjU7uOV0dfswJRaho8?=
 =?iso-8859-1?Q?a2mn/OzrbP4GMS5OKFGUwUrfwO+B1E5y3dRWGj4Dh6x/p83XBzCa7aYq5V?=
 =?iso-8859-1?Q?r+RWONy+CGgpFRQ6pTyvW6Cwei5DYNAxck/HjU0Swrjursw7XcY80YxurN?=
 =?iso-8859-1?Q?TsSLO3Vtwe7Qv34//9YZ0lLNvbBceNIDh6fT6c9Tlw2Wn/ANtp5tarafa1?=
 =?iso-8859-1?Q?UGvCn4JQHk76Xh+QZ13rpB/MMkUzdE4b5mF5pmX4VXy9P1HKNUkwZTswT/?=
 =?iso-8859-1?Q?YAURkXQsiv8NAjZDWJwTyraoAwJvQj1PVHb3vavdX5X4PD+849wkY+7C7g?=
 =?iso-8859-1?Q?h1oJBU5+1CP4HbsFm6AwpdSc5uIrlucff5HQgwgYmtbfo5cpH+1f3r7Eg4?=
 =?iso-8859-1?Q?CDvaMYB9mBF2rTyOCHK5ptr9lTGbuligRLB1rz4mTgxiCp3dAFsRivjEvU?=
 =?iso-8859-1?Q?vR6Th+eLPpo6ohFP1Tjp+TizYrXJcdciWozJASLV6N1h1772otx8KJAzQN?=
 =?iso-8859-1?Q?266jlvoMdgCnJEhNnP7U9b0gEd1s2OtCE+idnL1gBTeFpXtuna28keCjpD?=
 =?iso-8859-1?Q?5eiKMr/hPoWg3udj4FigU11x660y0uUUiJDXZUZeyeSdzCOxDHxC0XeGGO?=
 =?iso-8859-1?Q?yU+lDEOZ+vsW5kgicgQWIBMYOgRQxJXnAhzhLk4PAeloB9KikWqV05ZAjL?=
 =?iso-8859-1?Q?5cquGrmnpJoVNpa27lNcWZt5MlXyW/RjzNDgSbnCjpoTlrLWKSl5rAzUuQ?=
 =?iso-8859-1?Q?orj/p3fQHrZT5VLz7QyB9AhVNbTFDX0uK6LwXZIhur6YxSts20Ao2xAiNw?=
 =?iso-8859-1?Q?urJR3dbQJUotEcIETar/XfAzRbaRbwAUfor7B64r27CIjDybJfghIWLr0+?=
 =?iso-8859-1?Q?C3?=
X-MS-Exchange-AntiSpam-MessageData-1: sEoDHXRpxF2Tgw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f151f170-5dc2-4f34-98f8-08da53f4e356
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1407.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 02:14:08.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfkYZaqmNuAB/5l9YoPr/PTiV+dminBHDekJmE4mzXVIl3aVw7dmO6Au1dTSk0b+ziWhjZ63vR18fwPyxOkLnqgGruqgAP01R1w3IWv5EiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4927
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_11:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220009
X-Proofpoint-GUID: E5yxhHqPP07za91GtFsBVIWV3dOfrBaf
X-Proofpoint-ORIG-GUID: E5yxhHqPP07za91GtFsBVIWV3dOfrBaf

On Tuesday, June 21, 2022 4:27:18 PM CDT Elena Zannoni wrote:

Hello guys,=20

The paragraphs bellow summarize the proposal  for Kernel ABI analysis
talk in LPC, these ideas comes from the thread mail bellow.

Please let me know your comments to submit it
to https://lpc.events/event/16/abstracts/

guillermo

---
Kernel ABI Monitoring and toolchain support

The new CTF(Compact C Type Format) supported  in  libabigail  is  able
to extract a  corpus  representation  for  the  debug  information  in
Kernel binary and its modules, i.e, entire Kernel  release  (kernel  +
modules).  Using CTF reader improvements the time to extract and build
the corpus compared with DWARF reader,  for  example,  extracting  ABI
information  from  the  Linux  kernel  takes  up  to  ~4.5times   less
time, this was done using a Kernel  compiled  by  GCC,  nowadays  LLVM
doesn't support binaries generation with CTF debug info, would be nice
to have this.

But what about of the modules inserted  (loaded)  at  runtime  in  the
Kernel image?.  To make the comparison it uses kABI  scripts  this  is
useful among other things to load modules with compatible  kABI,  this
mechanism allows modules to be used with a  different  kernel  version
that of the kernel for which it was built.  So what of using a  single
notion  of   ABI   (libabigail)   also   for   the   modules   loader?

Since we add support for  CTF  in  libabigail,  is  needed  the  patch
for building the Kernel  with  CTF  enabled  in  the  Kernel  upstream
configuration.  Also some GCC  attributes  that  affect  the  ABI  and
are used by kernel hackers like noreturn,  interrupt,  etc.   are  not
represented in DWARF/CTF debug  format  and  therefore  they  are  not
present in the corpus.

A stricter conformance to DWARF standards would be nice, full DWARF  5
support, getting things like ARM64 ABI extensions (e.g.,  for  HWASAN)
into things like  elfutils  at  the  same  time  as  the  compile-link
toolchain, more consistency between Clang and GCC debug info  for  the
same sources, the same for Clang and Clang  with  full  LTO.   And  an
extending ABI monitoring coverage beyond  just  architecture,  symbols
and  types  /  dealing  with  header  constants,   macros   and   more

The  interest  in  discussing  ways  to  standardize  ABI   and   type
information in a way that it can be embedded into binaries in  a  less
ambiguous way.  In other words, what can we do to not rely entirely on
intermediate formats like CTF or DWARF to make sense of an ABI?  Maybe
CTF is already a good starting point, yet some  additions  are  needed
(e.g. other language features like for C++)?

> On 6/21/22 15:19, Nick Desaulniers wrote:
> > On Mon, Jun 20, 2022 at 6:42 AM Matthias M=E4nnich <maennich@google.com=
> wrote:
> >> Hi!
> >>
> >> That is a very late response, sorry about that.
> >>
> >> In the Android MC we will have a talk about the latest news monitoring
> >> Android Kernel ABIs already, but I definitely see value in a more
> >> generic session in the Kernel+Toolchain MC. Is that schedule already
> >> finalized or is there still a slot available and interest from your
> >> side?
> > We haven't finalized the schedule yet.  Matthias, Guillermo, Giuliano
> > can one of you perhaps fill out a proposal then for the ideas
> > discussed in this thread on https://lpc.events/event/16/abstracts/
> > with the "Track" set to "Toolchains Track?"
> >
>=20
> Hi,
>=20
> actually Guillermo was already working on that, will send something by th=
e end of the day
>=20
> elena
>=20
> >> In particular, I would be interested in discussing ways to standardize
> >> ABI and type information in a way that it can be embedded into
> >> binaries in a less ambiguous way. In other words, what can we do to
> >> not rely entirely on intermediate formats like CTF or DWARF to make
> >> sense of an ABI? Maybe CTF is already a good starting point, yet some
> >> additions are needed (e.g. other language features like for C++)?
> >>
> >> Cheers,
> >> Matthias
> >>
> >>
> >> On Sat, May 7, 2022 at 3:15 AM Guillermo E. Martinez
> >> <guillermo.e.martinez@oracle.com> wrote:
> >>> Hello guys,
> >>>
> >>> On our side we are working on:
> >>>
> >>>   * Gives the support  to extract the ABI for Linux kernel image
> >>>   and Linux  kernel modules using the CFT backed in with
> >>>   libabigail tools.
> >>>   * Add support to compare packages with CTF debug format by using
> >>>   abipkgdiff and other related libabigail tools.
> >>>
> >>>    * https://sourceware.org/pipermail/libabigail/2022q2/004340.html
> >>>    * https://sourceware.org/pipermail/libabigail/2022q2/004345.html
> >>>
> >>> If you think that it could be a point to talk as part of your MC,  I =
can for sure
> >>> provides more details about it.
> >>>
> >>> Thanks for your comments,
> >>> Guillermo
> >>>
> >>> On Wednesday, April 20, 2022 12:34:59 PM CDT Giuliano Procida wrote:
> >>>> Sorry for the late reply, I've been on leave and Mattias is still on=
 leave.
> >>>>
> >>>> That sounds quite interesting.
> >>>>
> >>>> Matthias and I could certainly talk about what we've been busy with =
and
> >>>> what are the main pain points for Android (not just the kernel).
> >>>>
> >>>> On what more would we like from the toolchain... it falls into at le=
ast two
> >>>> buckets:
> >>>>
> >>>> 1. make the possible easier - stricter conformance to DWARF standard=
s, full
> >>>> DWARF 5 support, getting things like ARM64 ABI extensions (e.g., for
> >>>> HWASAN) into things like elfutils at the same time as the compile-li=
nk
> >>>> toolchain, more consistency between Clang and GCC debug info for the=
 same
> >>>> sources, the same for Clang and Clang with full LTO
> >>>> 2. make the impossible possible - extending ABI monitoring coverage =
beyond
> >>>> just architecture, symbols and types / dealing with header constants=
,
> >>>> macros and more
> >>>>
> >>>> Giuliano.
> >>>>
> >>>>
> >>>> On Wed, 20 Apr 2022 at 17:02, Jose E. Marchesi <jose.marchesi@oracle=
.com>
> >>>> wrote:
> >>>>
> >>>>> [Adding Dodji Seketeli, libabigail maintainer,
> >>>>>  and Guillermo Martinez, who works in the CTF support for libabigai=
l
> >>>>>  including kernel support.]
> >>>>>
> >>>>>> Hi Matthias and Giuliano,
> >>>>>> Jose and I are currently in the planning process to put together a
> >>>>>> Kernel+Toolchain microconference track at Linux Plumbers Conferenc=
e
> >>>>>> this year (Sept 12-14) in Dublin, Ireland.
> >>>>>>
> >>>>>> Would you all be interested in a leading session on Kernel ABI
> >>>>>> Monitoring and perhaps what toolchain vendors can do to help, as p=
art
> >>>>>> of our MC (which itself is currently still in planning phase).
> >>>
> >>>
> >>>
> >
> >
>=20
>=20




