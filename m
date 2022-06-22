Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC631843
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 15:27:55 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MCXdwS009481;
	Wed, 22 Jun 2022 15:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=6g/mhwgWzsneDtzpgvbDKtjehPZy6jXY+Ob65NKLgLE=;
 b=kFouV5Faj5g0i2VofKgf5cDP/BzsPX0miykrnfvB1SmtPXx43zpfeWFTg7De/yPw+C4x
 lRURQktoxoZQmobiHeM++cj7xyGm2lQk7Mw5aeFCbCBw2RabQs1D55CIAiECwT26Rfda
 MpqoNCALmThILF6OAhi3hvv5QeFV6TrzrGC193wS7R1Cv8Ilp6kCAXFiUdzfPypX+W6P
 2Erq2eocnDy9EKGEQoIL4X3uWQRcZz/OHYhXDz62rXYbZtUUnMHYb5g+X5qLQNh/lu2J
 TQqvyr1Uo7hfo9LrDPVEBVriB8ZnKgis1MR0doh5C4EST9WoPaQ4ZvROOpROkv0PSSLN 5w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5g20v5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jun 2022 15:27:46 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25MFAiMG003450;
	Wed, 22 Jun 2022 15:27:46 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtg5vm5fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jun 2022 15:27:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+ua9ddF5q4gwjuS1PU+ihEBy+WuytA2gH20JTZr5MiIeYPj/Po8VjjnLs8ydY6QnOBSqove8kljSW4MYN63lInEHLaLSfOwZkJmIOnK/GJQtoz64F8v7ra/f2y8Pr8ZwRwtgeBksdBf0+JCtzJBU17LtQKoRt/IHfLmlxlSi/ir0v9TglyO7l/JX2v5T8o+qHcFsH9YEUJE000RoGvnASwxVlSVRQVyNT7+3JVJPKHAQQ/ofnnWZQ2EidZRzfb44iy/a7ms8jsz0y+XctijxVrLwruwowIG1SviSF6DVxJ9eOEWNNTIumAZ7TCDuq74X0VZZfnyKxIh7T0aJJ6b2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g/mhwgWzsneDtzpgvbDKtjehPZy6jXY+Ob65NKLgLE=;
 b=jtW7rEiIXh5n3GbWODTPji2IDJKJ6XbNHD/bkSqt7F1HIXnX1bl45MbilL252u+sOWhLOxgYVQsbEinAFLiO100INp25oaZwFmLWU/lUGMJh+H/3TpgAoztOMhzMvEe/TWt98cK/QIdWZNkZAreyekOMRQxng6sC7UbiEW7x2uM1BDKniWWgcAegbwvgQA55QiM84HNUDtlXLJoJXBqrQQRhzvobdxz/3/kJf/19maKApyzzo/KZWiCK4++Cra++onHnDA4/z7rjx7o2Spv8ujF3jAXPV5/yzlk2c/3EQFPQn8yysfjUvUHEBes1Kou9KJaDwD8gAhQR2b5wfQ0A7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6g/mhwgWzsneDtzpgvbDKtjehPZy6jXY+Ob65NKLgLE=;
 b=lpxNHo33bck7q+7rrggEUqGkO2NqWS3OKc/TWZMuLoxxqSty+gWzhe6zABEXDj/qFZk3Jiy260kY6hcN6CzSNEJ9JDY2UUfsppO5pxmQ2ow95DXlG/Cjyfpuq8xgBezvZCXDlkkbqSctFzTxkGcSQoUdAlb07CC/1AeRliBLfY0=
Received: from MWHPR10MB1407.namprd10.prod.outlook.com (2603:10b6:300:23::20)
 by BYAPR10MB2552.namprd10.prod.outlook.com (2603:10b6:a02:ad::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 15:27:43 +0000
Received: from MWHPR10MB1407.namprd10.prod.outlook.com
 ([fe80::5d6c:93b5:dfd8:c058]) by MWHPR10MB1407.namprd10.prod.outlook.com
 ([fe80::5d6c:93b5:dfd8:c058%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 15:27:43 +0000
From: "Guillermo E. Martinez" <guillermo.e.martinez@oracle.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
        Matthias =?ISO-8859-1?Q?M=E4nnich?= <maennich@google.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Cc: Giuliano Procida <gprocida@google.com>,
        Dodji Seketeli <dodji@seketeli.org>,
        clang-built-linux <llvm@lists.linux.dev>, jose.marchesi@oracle.com
Subject: Re: Kernel ABI Monitoring and toolchain support
Date: Wed, 22 Jun 2022 10:27:39 -0500
Message-ID: <2695836.VLH7GnMWUR@sali>
Organization: Oracle Corp
In-Reply-To: <4404532.iIbC2pHGDl@sali>
References: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com> <639f7737-fbbb-f0de-d465-d9770c794afb@oracle.com> <4404532.iIbC2pHGDl@sali>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-ClientProxiedBy: SA9P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::21) To MWHPR10MB1407.namprd10.prod.outlook.com
 (2603:10b6:300:23::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c321d4f-e625-4c07-4140-08da5463c056
X-MS-TrafficTypeDiagnostic: BYAPR10MB2552:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB25526DDCFAA7CC3CF5B4C22CBAB29@BYAPR10MB2552.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6epG1w/xi9PPGiRjErKUYZY0r4PB3EH21lqiVi6kdtbpbXA0JCsKw7IlDlhymTDE5wxeayCmT/cicI5WlKv/ARmcnT34s6LNHmOKJKftUrkFkDxJ1g+BG4Rd6m1fJV+J/P8sdOgE3UL7TXsSTtnO3DwvmZam7jtBU9O8xLFjR6u46upaDwmqTk7/cWox+63oxoEIGJm4lWeYbIVzeRhK8ZZw/Ds/q/GYCRAUtRJbIWS837v+Ufdpzou8sSBEf0Q8oWPKwco/lIr+sepssCJP0XTRrieyzAB8aW3NqSs9IbzyNB4ofq+fATwI3VnQzCQzzhGnfvq9DoOzZT851N2fIiuELWealdzjljNshQN3xMkluXZ2Rkfv9yETngL2yqiM7GF7BHnJPaIWQiNfbcWZqsf8DKf9eCv2ODwWazdQ30L3TEULyfWgAXj5yPGctUKEC9yOIEqv4f2yqyMg6kXO2h3Hrk6Kk8mG9TXYO+CMERc6HaOgHjDB3N9uWe3bE4XpdfAxI6JRy3wxB4w/Q5BUQQwpxx0baRbvPavlYmlaAUmwDA+8dyOJooPmSQTgEVMh0V6c3Vxcyjzhsqrjv8b5WURLVF0PPstZWyE9/zEFTrqYf5nlgilp7kr3OMKgV5OuqoM35ZjRRBiTQZk6a3D5T1aLdBvFLPjazN8qAuFaQWUpVENwh3ojqyBQByDYnYYsmvz/YmKQXHBHo+UNJHBjqpgroYr+dgojtzSxdwVNF4/yy8Zsj9jw7tVgxz8yGKkJ4sPZLkEbAXS4ZpsamZxtKb8H3Ly0YKvI3rYTNncX6KrSxFZ51cPPWQlDXBsnG3B9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR10MB1407.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(376002)(396003)(346002)(39860400002)(136003)(38100700002)(4326008)(316002)(6636002)(86362001)(66476007)(66946007)(54906003)(110136005)(8676002)(5660300002)(53546011)(2906002)(186003)(66556008)(8936002)(41300700001)(83380400001)(66574015)(966005)(478600001)(9686003)(6486002)(33716001)(52116002)(6666004)(36916002)(107886003)(6506007)(6512007)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?PgpjbgS1pBHXCblS+IsMTHVbG1U9uN+LL7TeMQ5x7bmNKwRzGpiqrH6QYb?=
 =?iso-8859-1?Q?VD1V1hRdHeIlPP1nhEoK0tibIyrYukrLG+UI32zViBy1pWwxWvv0sS5KI4?=
 =?iso-8859-1?Q?rWar33okG0c6i72EavgfkaNpk6W9taox6jBaQsiDl1lE31LKqGhC65ACUS?=
 =?iso-8859-1?Q?ULM4EmOLEC8Q5FmRaO2JEPm6OSVROJpP+4YxbBmTSlkVJKfJPxmBtl5HXC?=
 =?iso-8859-1?Q?KJVQTR3alajoUWfBkg4ig5jC2EohboC0V12SP/4VQh/GJB0Vspn2VQGYXC?=
 =?iso-8859-1?Q?CJ4q71wgQ9jZNQqLpB7Wpcxq9la9YsSWV2adI90YrWP7Lmy6YhB/V55Oz8?=
 =?iso-8859-1?Q?IX/ECDoHoUUqtxrhXOO4vGdWj6B6XU0WGasCZ+37fJ4eHMJabeHlYdTEb5?=
 =?iso-8859-1?Q?Vy7sR4oZcmx92WNLoTk3YKg5Ed5lHcsxNrX99oigVp6rHKMhpLUHxbWQ7Y?=
 =?iso-8859-1?Q?KKEmnT1RfkrL2McW1jfldI7F1lhBKUiL0YHiMfvkpZISxKZ2SsZrMJYbGo?=
 =?iso-8859-1?Q?b8FOfvkWlSL/bWqilZSyky/rb2qgsvMuE2Wl187fwcT4g0GO9l1J2zm+wZ?=
 =?iso-8859-1?Q?EJZOXImVyHc8S21dCOOFACtKAGNrxrmzGc8YLhZltoSe98zOAscnN2AipB?=
 =?iso-8859-1?Q?67nIFAvxryyyRtIrGqOOh8SpLQy1/gHIRz0WZk/RfoVcl8II3OUG55kC3q?=
 =?iso-8859-1?Q?Pz2+LHoPhYZKTi5GTsP6ixzRbKWDemaGDQ6esQ1tcoVbHS+eSzU2rsZvXv?=
 =?iso-8859-1?Q?XX95sshDJB1RncE15ywUctnvanASFivIeDbxnTZWCeLqT0RSI6UWzPrUA2?=
 =?iso-8859-1?Q?pblscZLwMmQpU5hWV1WLLBqimb64KOhKNZSc4U62TtT/CKGFItwpr7W31m?=
 =?iso-8859-1?Q?j8Zx5Jz5noP1x7SGCK99WGgKE54ua+L5csQWp3ZUXfjtcDEnectgb9epUU?=
 =?iso-8859-1?Q?UIsyso5RmeMFhs4skt2cSdB6g5cqJM9rk5/PKLtbJ8lbqu8aTOdrVzYhL0?=
 =?iso-8859-1?Q?YyJxVhQ31phzh6YV9rkJoHvkyb+rvHP/J05DCAM8q6C35qf+NQ0eAMluBx?=
 =?iso-8859-1?Q?VMZtHYq24R6ggO1+XYOaj0J3vfpe8ufoD8cz6V+MM5jmZgyPXeCo5PxFeW?=
 =?iso-8859-1?Q?ku4a591dRwJ9ZuBkj4wI3Lsp6QxgoGZpMthV8y5N+p+UaO/rM/H5YNVCDk?=
 =?iso-8859-1?Q?6n1JZp96EM1kfi9ILb+f/kgNtc7GDKOApXxEXlk5fH9I09zkIIDRQEciGv?=
 =?iso-8859-1?Q?R2LAndmNmg6P3ACjiNlb8jbRcc1d3fKpgo9oMQN8UzzN1RANxZJK9GJdRP?=
 =?iso-8859-1?Q?1MHiTcSxP0hW+e40GgqWDLypCGAmbrbyRxb4E5ofhGL81gChvp9ulokkjU?=
 =?iso-8859-1?Q?aQUsoTE735eH91VTQ7GTrJhOetb8CvyLz74YzOyzQ+ENOjAblrsTR9Lam7?=
 =?iso-8859-1?Q?IScWvjeOsznNYfyJ5eKFyVrHWG2BzP5O1dF+dwIeaPB7Flv6+QYoS4XpEL?=
 =?iso-8859-1?Q?5FWSJ77EE10Q3ncdOTc8pHugD5DRkpy/SDrtdJsXUhUAS0f7xMXlO+oH9r?=
 =?iso-8859-1?Q?Rsph2WdjQldlTT/hpMHIAsZfdrghkBhJTcNeZJjqOuIPhArjYY+2uLjD3g?=
 =?iso-8859-1?Q?2VF1+jPgbJ3DHK6/dOXmPnBiau8M6M4Q3L1u/tjjsnY6smXEM3x9omVCZM?=
 =?iso-8859-1?Q?YgLpebZyqQhWNoczKzClc/lpAZRJg27o1CTG50VWtg5jIe7QmQj1ak35+E?=
 =?iso-8859-1?Q?vrYCy4fW9P4ysLB8bBOqg7426Nq5WbcLTt6gjtfkSkv43uJ7PrwcRv8tv7?=
 =?iso-8859-1?Q?yfDTbgtUJSu3UfjH0KUKTuvEfgOZvzk6ztSzH1K9EIBJo3fYA5/2xLYBpj?=
 =?iso-8859-1?Q?c2?=
X-MS-Exchange-AntiSpam-MessageData-1: ywo/S/owyyvcHg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c321d4f-e625-4c07-4140-08da5463c056
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1407.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:27:43.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+q0kUfIjlYPTInGjrmIN7ujb54HSHmB+36cMDFRMb1wAk8bf7TRxp4RtgIJH8xJzUmjJErlIyatIYo+ctsfW8zk3lWgV6D25N2oDiUQM14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2552
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-22_04:2022-06-22,2022-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220076
X-Proofpoint-GUID: Y2e0o-nKKpx8qOe630SnSTapPX8xdkxs
X-Proofpoint-ORIG-GUID: Y2e0o-nKKpx8qOe630SnSTapPX8xdkxs

Hello,

Any comment?

Thanks,
guillermo

> Hello guys,=20
>=20
> The paragraphs bellow summarize the proposal  for Kernel ABI analysis
> talk in LPC, these ideas comes from the thread mail bellow.
>=20
> Please let me know your comments to submit it
> to https://lpc.events/event/16/abstracts/
>=20
> guillermo
>=20
> ---
> Kernel ABI Monitoring and toolchain support
>=20
> The new CTF(Compact C Type Format) supported  in  libabigail  is  able
> to extract a  corpus  representation  for  the  debug  information  in
> Kernel binary and its modules, i.e, entire Kernel  release  (kernel  +
> modules).  Using CTF reader improvements the time to extract and build
> the corpus compared with DWARF reader,  for  example,  extracting  ABI
> information  from  the  Linux  kernel  takes  up  to  ~4.5times   less
> time, this was done using a Kernel  compiled  by  GCC,  nowadays  LLVM
> doesn't support binaries generation with CTF debug info, would be nice
> to have this.
>=20
> But what about of the modules inserted  (loaded)  at  runtime  in  the
> Kernel image?.  To make the comparison it uses kABI  scripts  this  is
> useful among other things to load modules with compatible  kABI,  this
> mechanism allows modules to be used with a  different  kernel  version
> that of the kernel for which it was built.  So what of using a  single
> notion  of   ABI   (libabigail)   also   for   the   modules   loader?
>=20
> Since we add support for  CTF  in  libabigail,  is  needed  the  patch
> for building the Kernel  with  CTF  enabled  in  the  Kernel  upstream
> configuration.  Also some GCC  attributes  that  affect  the  ABI  and
> are used by kernel hackers like noreturn,  interrupt,  etc.   are  not
> represented in DWARF/CTF debug  format  and  therefore  they  are  not
> present in the corpus.
>=20
> A stricter conformance to DWARF standards would be nice, full DWARF  5
> support, getting things like ARM64 ABI extensions (e.g.,  for  HWASAN)
> into things like  elfutils  at  the  same  time  as  the  compile-link
> toolchain, more consistency between Clang and GCC debug info  for  the
> same sources, the same for Clang and Clang  with  full  LTO.   And  an
> extending ABI monitoring coverage beyond  just  architecture,  symbols
> and  types  /  dealing  with  header  constants,   macros   and   more
>=20
> The  interest  in  discussing  ways  to  standardize  ABI   and   type
> information in a way that it can be embedded into binaries in  a  less
> ambiguous way.  In other words, what can we do to not rely entirely on
> intermediate formats like CTF or DWARF to make sense of an ABI?  Maybe
> CTF is already a good starting point, yet some  additions  are  needed
> (e.g. other language features like for C++)?
>=20
> > On 6/21/22 15:19, Nick Desaulniers wrote:
> > > On Mon, Jun 20, 2022 at 6:42 AM Matthias M=E4nnich <maennich@google.c=
om> wrote:
> > >> Hi!
> > >>
> > >> That is a very late response, sorry about that.
> > >>
> > >> In the Android MC we will have a talk about the latest news monitori=
ng
> > >> Android Kernel ABIs already, but I definitely see value in a more
> > >> generic session in the Kernel+Toolchain MC. Is that schedule already
> > >> finalized or is there still a slot available and interest from your
> > >> side?
> > > We haven't finalized the schedule yet.  Matthias, Guillermo, Giuliano
> > > can one of you perhaps fill out a proposal then for the ideas
> > > discussed in this thread on https://lpc.events/event/16/abstracts/
> > > with the "Track" set to "Toolchains Track?"
> > >
> >=20
> > Hi,
> >=20
> > actually Guillermo was already working on that, will send something by =
the end of the day
> >=20
> > elena
> >=20
> > >> In particular, I would be interested in discussing ways to standardi=
ze
> > >> ABI and type information in a way that it can be embedded into
> > >> binaries in a less ambiguous way. In other words, what can we do to
> > >> not rely entirely on intermediate formats like CTF or DWARF to make
> > >> sense of an ABI? Maybe CTF is already a good starting point, yet som=
e
> > >> additions are needed (e.g. other language features like for C++)?
> > >>
> > >> Cheers,
> > >> Matthias
> > >>
> > >>
> > >> On Sat, May 7, 2022 at 3:15 AM Guillermo E. Martinez
> > >> <guillermo.e.martinez@oracle.com> wrote:
> > >>> Hello guys,
> > >>>
> > >>> On our side we are working on:
> > >>>
> > >>>   * Gives the support  to extract the ABI for Linux kernel image
> > >>>   and Linux  kernel modules using the CFT backed in with
> > >>>   libabigail tools.
> > >>>   * Add support to compare packages with CTF debug format by using
> > >>>   abipkgdiff and other related libabigail tools.
> > >>>
> > >>>    * https://sourceware.org/pipermail/libabigail/2022q2/004340.html
> > >>>    * https://sourceware.org/pipermail/libabigail/2022q2/004345.html
> > >>>
> > >>> If you think that it could be a point to talk as part of your MC,  =
I can for sure
> > >>> provides more details about it.
> > >>>
> > >>> Thanks for your comments,
> > >>> Guillermo
> > >>>
> > >>> On Wednesday, April 20, 2022 12:34:59 PM CDT Giuliano Procida wrote=
:
> > >>>> Sorry for the late reply, I've been on leave and Mattias is still =
on leave.
> > >>>>
> > >>>> That sounds quite interesting.
> > >>>>
> > >>>> Matthias and I could certainly talk about what we've been busy wit=
h and
> > >>>> what are the main pain points for Android (not just the kernel).
> > >>>>
> > >>>> On what more would we like from the toolchain... it falls into at =
least two
> > >>>> buckets:
> > >>>>
> > >>>> 1. make the possible easier - stricter conformance to DWARF standa=
rds, full
> > >>>> DWARF 5 support, getting things like ARM64 ABI extensions (e.g., f=
or
> > >>>> HWASAN) into things like elfutils at the same time as the compile-=
link
> > >>>> toolchain, more consistency between Clang and GCC debug info for t=
he same
> > >>>> sources, the same for Clang and Clang with full LTO
> > >>>> 2. make the impossible possible - extending ABI monitoring coverag=
e beyond
> > >>>> just architecture, symbols and types / dealing with header constan=
ts,
> > >>>> macros and more
> > >>>>
> > >>>> Giuliano.
> > >>>>
> > >>>>
> > >>>> On Wed, 20 Apr 2022 at 17:02, Jose E. Marchesi <jose.marchesi@orac=
le.com>
> > >>>> wrote:
> > >>>>
> > >>>>> [Adding Dodji Seketeli, libabigail maintainer,
> > >>>>>  and Guillermo Martinez, who works in the CTF support for libabig=
ail
> > >>>>>  including kernel support.]
> > >>>>>
> > >>>>>> Hi Matthias and Giuliano,
> > >>>>>> Jose and I are currently in the planning process to put together=
 a
> > >>>>>> Kernel+Toolchain microconference track at Linux Plumbers Confere=
nce
> > >>>>>> this year (Sept 12-14) in Dublin, Ireland.
> > >>>>>>
> > >>>>>> Would you all be interested in a leading session on Kernel ABI
> > >>>>>> Monitoring and perhaps what toolchain vendors can do to help, as=
 part
> > >>>>>> of our MC (which itself is currently still in planning phase).
> > >>>
> > >>>
> > >>>
> > >
> > >
> >=20
> >=20
>=20
>=20
>=20
>=20
>=20




