Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D711EEAD2;
	Sun, 25 Aug 2024 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724585720; cv=fail; b=IqVTxgqJCEcpvUwJog7DAlu7+HPWA23hy+yNkP3/WvuUbuzZCzxrbp3QUqXXnuIKdMViysws9k+SW43zIKyrr+tX1dy4rDjvgv8UaPfa5/dppzf5WO3H/7kVgkooU/Ev2QG5G4DG0k6E/9G1kbSUxBgXzJeuEqP404f9ELHqnLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724585720; c=relaxed/simple;
	bh=Vo4kVPaf92vp+LsYxsAeS0PttklEiAPaqfbGKrxMq1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SdmlFOItye+9m1Fa6P+ya97ewD6Zlo2pRP2SfVv5/IbWiRFU/W5KnM9iD7ZVIK94jarJ4lFUrndiA8txQ7zTPJBBabRqyutKk1kER2ymIRko6WO/HDSQ9l9QmtrXrP+pfvCj5DctHBTxOheZcM6K7F046d0JRtB0FxPJ9XFAA3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bDMVYLBW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T80s7r2V; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bDMVYLBW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T80s7r2V"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47P6rkGo014865;
	Sun, 25 Aug 2024 11:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=29Qg6GNOFaT9fRK
	xoUB/NaRzy1Ptao3lMkXcpm+UD9Y=; b=bDMVYLBWtJsBek4GrOppPPmBEIVeaaO
	UMWyP2rhEp6Hj0yZVA6uED8FQpz28Ae9Oz2vf9i1DDJJL7+O887SsHqUDJmp8Xmm
	D42GrSUOlNE9dwbYyPxAtTVCGTDKLEGruFh+mSnxMrCDjB0b1ljO4zcK12gezPHi
	Ww0QgcE9HoalNhWLRkebwehpaPhnTMSbS6mbRcV0Zaq4ebp7NO3e7RAqLD41BTR4
	PYV2DTZIZbmJ73eQ0JLFSZT9TkIQB6sJGhbCSGObgdfbw450fG2nO0EN9fuiD9Tm
	UyzpTtD1vNyVYzwvh1jzU89BJHnX/ty3so7etqOV8+cWYg0bTIH26EQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177kssbau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 25 Aug 2024 11:35:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47P9W0pC030072;
	Sun, 25 Aug 2024 11:35:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41822j9y24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 25 Aug 2024 11:35:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pioFr1n4zTIOTkhZTtm57u4oz9Cj3SW/mnuhYmeHPzXHfHU7w6CL/BP0P8R8FA0ZQQD4HQY6TmFHWgyiiE22O7j9MHbuGizqeI1mWa2RXslm1xBde0Qc2c6E7KCCRH4BGJvd86csyi8bCtxtjrUorqlPVM6qpi6RSW/BAGgd0y3iSHiriX4P1hjJgYi+gTVeWBuoQfh5EQrmqK0dsylObrjVgMOSwPsfXGluxszwb9gPAuwNKZRRN8RhzeGHD/b7pB+HQXR6U6UeMk3C/xe7p80oCg9850GsQbu6ihwVX4J44cOyPbU066ecSy3z93YdQ7PiBNp7d+1+EAGJS9Vrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29Qg6GNOFaT9fRKxoUB/NaRzy1Ptao3lMkXcpm+UD9Y=;
 b=SL37rtLDvXfDv33Su5RO+zt2vbPTVU3GOZ0kFSV1H0VADv+mz9a/NwhxrsayEugAoHvvO2AeuM79JnCNBIMD0IjU6h+pTeVERKcpvqxEsQ+EftBq640pG01/MTrZ38NHPpZR69BV3O45PZriYOvc0eUWFC9aqlsZahLhtP4MsdTkfnYxTGaXKveEkPv0YYcNEMugsVOSB/MXVqRZBkF3A/TVPKg44CHDozrlonaK8P9DFeqQ6FCJkhvT+vpHrVz1L6V7Tw0DWwi8/UORWaDJ/Du8rcD85i6rA6RiQTewsgggrzMdBAcLNHiAquIYx0YSSbedOhbh35b4jR3BOBIbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29Qg6GNOFaT9fRKxoUB/NaRzy1Ptao3lMkXcpm+UD9Y=;
 b=T80s7r2ViDMZB9usxda1CT4bagb1tuTEprx3Iw+MIYQzo4XjdZzMNUzvztETM0/kqB7744/3aU7llt66+VlZeVxWMXHgklb0x0Ng32kh46A2GHPRJNJX93XWmbCuztWb99e1SNXSFdPc8ZtADpNF2LbmrZyo/xE+IPXA0Z6oolI=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DM6PR10MB4251.namprd10.prod.outlook.com (2603:10b6:5:21d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.12; Sun, 25 Aug
 2024 11:35:01 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7918.012; Sun, 25 Aug 2024
 11:35:01 +0000
Date: Sun, 25 Aug 2024 12:34:57 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 357/379] mm/vma.h:114:19: error: use of
 undeclared identifier 'USER_PGTABLES_CEILING'
Message-ID: <7d0ea994-f750-49c5-b392-ae7117369cf3@lucifer.local>
References: <da1a6b2c-f792-432f-b99f-51717dcc8d83@lucifer.local>
 <20240825000510.136384-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825000510.136384-1-sj@kernel.org>
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DM6PR10MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: e25afed3-ca1b-4892-350c-08dcc4f9f495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wuuU4KsL7VykWmSADy5P/nrkcXeN+HD7sozjdOPT2aq0sk0d8hjpFY6G1Avr?=
 =?us-ascii?Q?UxrESt7s4MmOUKXl/Ihf5haQAv+fa+v9UlsTZgHhkQPdFXkU8dJacFlBzL1z?=
 =?us-ascii?Q?dPglh4RtpBe0d5Ez1gHJ9KfzeA+SB9KoG6nJD+OA/zkqpEpmZbNlBWLXVojp?=
 =?us-ascii?Q?L2BP7yR61uvByH1s8nCq982TPLqTfnnTUNDwFFNNylcVtMuP08VcIXn/KRKN?=
 =?us-ascii?Q?sbVTsgbQFia7rH8GbOHc/6+9xCiP3FBKdQZkIeeOCzluMXDmCYUFPHuj9LR5?=
 =?us-ascii?Q?OW0Kgd7sJzBXyE1OKJvB4Cvb5cydwUv3ESqTnZMW9Rp4pNHvBlRzeNpksU3d?=
 =?us-ascii?Q?SxLIzpONtbCcP7eS/3w9j0D3KqtRrp3W2zJFPts3mt6/XeBsGP6QxLNafu/P?=
 =?us-ascii?Q?g17bJnw1+QRZUMBTDpHNi2g/zkherTLjSCvlqGz998baACE4kecgcnT6MUNs?=
 =?us-ascii?Q?zBCZHn5P0EBggB7IiQFB8uhQaNbxF7x3rHjtyHlh3dm7Bs6ib6iosqSG5J5e?=
 =?us-ascii?Q?Ka4GrAYvP00H5MSoyrFFgvZ/S0mmWeqQsFgSobCMSKlmLfivZ5C2CZdwaBE4?=
 =?us-ascii?Q?fP3px4d/e7jOhdr8HEQJq0PcnP173y+hraqqJ9PDUEiKAxbg8yfu6fOe6NwM?=
 =?us-ascii?Q?4ZdNSiEs6Ht1crvSRLu1iufoVdFhTvB21pNyeZAPPqmkfpcPh858ic6i+YDP?=
 =?us-ascii?Q?eLTv0X29xLcVxBJ9JuI0gnlCJB4FWG9043jLQ7M844svX7PVjFqygWaEignG?=
 =?us-ascii?Q?0SvImpCCd7EyD4N2vTukdABAiQFIXDOjvE1U0yoDO4xH4CmEFMCxD4mdZWNo?=
 =?us-ascii?Q?iZnTN7WAQG5fB1hhTc48HReoCia3jqZF007yNRY+WFafba+TqcMDmE+USfkd?=
 =?us-ascii?Q?yJbuY61wfnlS+APZMg4wv+5K9DmIGOYFPage+bjtuHSI28kLKxxxhRc6/nBR?=
 =?us-ascii?Q?gtX0XuHDQkjeo/TMpntSQRwZKbn5hfVeXXoJGnWPuGF/5Q9fWO4jfz/T9dOU?=
 =?us-ascii?Q?sL/CNQJEdb0VfyDdp5ykI2LInvmKkDLzwQFWL7GK4lCR8GHQGHxTl0o8DV6l?=
 =?us-ascii?Q?f+cTBkKJV3GEQCPH4YDfs3MNx8eErEInpYMj4JdeJMYl2QjrQMG9PiLqKqnw?=
 =?us-ascii?Q?7Py892xlxW0t1DYM8Nw+hkL4uqLkkLq8+NbCiuL+lcv2cousERh26d8ZuGQC?=
 =?us-ascii?Q?4r0M6IMEvQ/fDpU/HmLkiytk/SpbUNYsmLsKkqNUJhJmJgOjMMVapGNUSRTz?=
 =?us-ascii?Q?n1mp+nx0/cO9t2Z1TEH11t9ReSrY6gKGg1aFkKgQ6P58KSPHhgUgj9AkezP+?=
 =?us-ascii?Q?EH0ls1vf2Gz1WagTvRoomd+M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Xa2vxDIh47J3na3xaMAYakkB7U5OrUwoYzVjCNvIEnWCSqabkm7ljOXfYDJ?=
 =?us-ascii?Q?9tWb4ttzNJ9RVjErE4EX3yq1CslxmhR3QsJcj5kfxgRlPOAEbLvBlXqiEPy5?=
 =?us-ascii?Q?jNiwyOFqKo3GBVetWyusYkWUwO0T06dzXTLlyFI58ytabY/vCbFA9Am4ojSB?=
 =?us-ascii?Q?JoXVk/rjxvfWdQeEKu+4BMMNOCRZybfmsZAOztQzlytJ7D1bYAsFkp0vY/p7?=
 =?us-ascii?Q?YTx070CH2wZrJ+IK5EQQLZEm9tJFzKo5YW47mvOOWN/8Tvi3mzegXBTiF1bE?=
 =?us-ascii?Q?0AWO/9K0rduPmSZSlEKpNfVPdf/BcZoEWfmuTECTqzJwxTz72+FEZi4OZWPJ?=
 =?us-ascii?Q?EszYvJcuf+HUcGHhVcvjvOJefWqNQe5OitojHn09YBfEt3Gqg4NIxkd3OKre?=
 =?us-ascii?Q?5TaIaLH6uZNA3ekoDDY4NH0Cfia6WCLNzFuFBMw3UVWOvYuNy8mqFbSjBu78?=
 =?us-ascii?Q?rESdREcnipriM5HwE07j8PFUrj9t5+l6uYg9gF0iiXkS/r0P7mVHknyFDxhG?=
 =?us-ascii?Q?MHUs4lOlOKUehrnvWeAm6ffYdZCodgXAcLBUghO5u972czAOlpCJtZi2eELa?=
 =?us-ascii?Q?GyG+K7w5yi9ZKEqaHukXigVAFC3wbPfc7eGbKsPlM6wo9yU7eYcFTHqvrhGd?=
 =?us-ascii?Q?sLT3I+aKNpELffNlWdkWHALZ5Flyir2uKY7z1Mn+wjStRSWfa44OVyRB/HCa?=
 =?us-ascii?Q?N7K5Bl08owQCI5oKajZ2PYzgwiwgvl1w5gF729cW1HxRGd9jl1eGNEiRpdB7?=
 =?us-ascii?Q?bbuev1+8amAnpzWYMpiTU7jzJk7X+CONuREnM84vdyRf3AII2pN1DI167rC8?=
 =?us-ascii?Q?wjH+RMRrg9vPxTzck8J+YTclYBLzX3TERmDOFhxguYOCKoGRp+wPT4PbOQ9I?=
 =?us-ascii?Q?zBmkkXNbL3W6DXTrSKjZryaLIkcfo5lIRcpqKpt2N8N6SGDv617JV2AxScV0?=
 =?us-ascii?Q?c59cz1zYLPxQEXorkJj2GasJQij1XS1OIcUJKn7yfZFS75G2eHkPIddNsHnB?=
 =?us-ascii?Q?umXJt3s0b8LHV4biq7lYgqZ5k25+WMe1CxcJj1HCNJicAp5VFB8hqBPgyujz?=
 =?us-ascii?Q?cDj32rAmBcLQllY/4jmXznAApQvlTYyE5HR4QhSqIo2j9blvsx0jIhvmhXm2?=
 =?us-ascii?Q?w0te6m8y/EcHvcI+ZmLUKUbPs7SZjC1wkH1u/Bun0IpE9jJbLARGAOGKAITx?=
 =?us-ascii?Q?MGlwPXNZIRHn7E7aGOuTMWFQZySsMtl3xLSMg54Z+UjNBe6aGDfk/YTHaQ17?=
 =?us-ascii?Q?dqTqq+DMo/YcDtS83S8Q99+euQshbw7dW2sIEg7mFlOGvkgbz4JA82aap4ju?=
 =?us-ascii?Q?20bdDuFihsvXmTw07Q2QMcMEFEufgXGFO1g3AMh4M89esDONnRtv1QXg/SRk?=
 =?us-ascii?Q?mb+qakZJr9ghwRiLhqGZAfmaLCM+VG//S77O7Z+tAnvuZaItc+OLlXIM6KuV?=
 =?us-ascii?Q?c13IMxQ2KDGY/tJaoKCtVtTdr5sirDc06H2XQs33XuJ8HOcAgEbJtn63TmiC?=
 =?us-ascii?Q?1klRmJILDvOvuXESjdbEPTV/fo40y0R80ch1yKdKvV/mQm/xHEtK4ifNcEJ9?=
 =?us-ascii?Q?RCliqjIMewnOsTWSYFSi0HlmFoNFtk0QGEVPxNIBtNVKIZ2xlg5h/OKSugqr?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vcCg2qAd5r1cievz92ZNL4p75HUBO8QpBVIV7P2gzncc1ouAv+MY225OG+0YbpjRkTn+ljZ4Yha9oyZa9JCULoCe7iWyH5a2xXLDi5MCH4FoTZaPYuj4N3i+qQLNpt0CydiOfRnE4E2osp60p9wsASVAATj1RIJ5x/2juXLdRzpnCmrLHPHdeUlb/O50m/Bo4u2xfjqUinvvtOkcSjj2QPC8y13xDtXDUm9F98OupJ3p6dVBSnP99AVnoN5XCtpvIkovNgDFI307jyUMb8MXyhEomZFPc30Z7+8/PxRlef2QkIlRmHgNKGkXD9QTePlpwIv3U4oWCwo5tWoy59sszkWTyFh7/be+iYNtBaEDvlAIxG3ZndHuZ2VqoH+jvaNnQmlFLu6qEx2Na102Bl49fSwj/ueL23WZ1btAxbevx0cRqtmwn9OKzmuA8pSXR7xOHggQ+HfKLNTOiW7FvBAmdNXO+TZSE73Cok6VRINbakiADX2CyJ12vOujd0aRH7ZHLR8UUz27K/Ng5dD7zusHhzfaEDJ9OAPmnRJ0zhw7ab3Ti5EG6KTCRPBORj7ijtNJ6slnZM+1P0QxtySDcI+G7Hytt5XYxFAqTLe3r/xjT0g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25afed3-ca1b-4892-350c-08dcc4f9f495
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2024 11:35:01.0457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqXgfYC2axhZOtAZEi9OL2ihOM17QPpa5pTG4A4av87V77JB3qvOy84GQVq2pARNONl/yQAVru8psfJ2E790tWGExpG9MihyU/KExRwDvAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4251
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_09,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408250092
X-Proofpoint-ORIG-GUID: dS4mOqAX44ln81JkCt9COuF2ka_CJmRL
X-Proofpoint-GUID: dS4mOqAX44ln81JkCt9COuF2ka_CJmRL

On Sat, Aug 24, 2024 at 05:05:10PM GMT, SeongJae Park wrote:
> Hello,
>
> On Sat, 24 Aug 2024 20:43:25 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

[snip]

> > From 565ad376b0a3aa5822ef479faadff271e90ba51c Mon Sep 17 00:00:00 2001
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date: Sat, 24 Aug 2024 20:20:17 +0100
> > Subject: [PATCH] mm: include linux/pgtable.h in vma_internal.h
> >
> > For some arches this is required in order to have access to
> > USER_PGTABLES_CEILING and FIRST_USER_ADDRESS.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202408242348.uGvgH9tt-lkp@intel.com/
> > Closes: https://lore.kernel.org/oe-kbuild-all/202408242304.1A1fXTgE-lkp@intel.com/
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  mm/vma_internal.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/mm/vma_internal.h b/mm/vma_internal.h
> > index b930ab12a587..971b13e880c9 100644
> > --- a/mm/vma_internal.h
> > +++ b/mm/vma_internal.h
> > @@ -33,6 +33,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/pagemap.h>
> >  #include <linux/pfn.h>
> > +#include <linux/pgtable.h>
> >  #include <linux/rcupdate.h>
> >  #include <linux/rmap.h>
> >  #include <linux/rwsem.h>
> > --
> > 2.46.0
>
> Even after applying the above patch, I get similar errors when CONFIG_MMU is
> unset[1], as below.  Maybe the case should also be handled?
>
>     In file included from /lib/../mm/internal.h:22:0,
>                      from /lib/vsprintf.c:50:
>     /lib/../mm/vma.h: In function 'init_vma_munmap':
>     /lib/../mm/vma.h:113:21: error: 'FIRST_USER_ADDRESS' undeclared (first use in this function); did you mean 'IFLA_PERM_ADDRESS'?
>       vms->unmap_start = FIRST_USER_ADDRESS;
>                          ^~~~~~~~~~~~~~~~~~
>                          IFLA_PERM_ADDRESS
>     /lib/../mm/vma.h:113:21: note: each undeclared identifier is reported only once for each function it appears in
>     /lib/../mm/vma.h:114:19: error: 'USER_PGTABLES_CEILING' undeclared (first use in this function)
>       vms->unmap_end = USER_PGTABLES_CEILING;
>                        ^~~~~~~~~~~~~~~~~~~~~
>
>
> [1] https://github.com/damonitor/damon-tests/blob/master/corr/tests/build_m68k.sh
>
>
> Thanks,
> SJ

Lord, do I _love_ these museum-piece arches. Great spot though thanks.

I actually build an m68k kernel locally and did not hit this, so I wonder
if there's some horrible include chain going in from... lib/vsprintf.c of
all places. But anyway.

I checked and nommu does not compile vma.c (nor obviously does it compile
mmap.c) which are the two users of init_vma_munmap(), so we're safe to just
wrap this in an #ifdef CONFIG_MMU.


Andrew - could you apply this simple fix patch also please? This should
appease the horrors of nommu builds. Thanks!

----8<----
From a0b3718a0d09d1cfeaefcd94395ea6d6da2fec91 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Sun, 25 Aug 2024 12:29:47 +0100
Subject: [PATCH] mm: fixup vma.h for nommu

Some series of includes result in vma.h being imported by nommu under
certain circumstances, which references FIRST_USER_ADDRESS and
USER_PGTABLES_CEILING, neither of which are necessarily defined in a nommu
scenario.

Work around this by wrapping the inline function which references these
(init_vma_munmap()) in an #ifdef CONFIG_MMU.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/vma.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/vma.h b/mm/vma.h
index edc9034d675c..9d4f44a9942b 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -152,6 +152,7 @@ static inline int vma_iter_store_gfp(struct vma_iterator *vmi,
 	return 0;
 }

+#ifdef CONFIG_MMU
 /*
  * init_vma_munmap() - Initializer wrapper for vma_munmap_struct
  * @vms: The vma munmap struct
@@ -185,6 +186,7 @@ static inline void init_vma_munmap(struct vma_munmap_struct *vms,
 	vms->clear_ptes = false;
 	vms->closed_vm_ops = false;
 }
+#endif

 int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
 		struct ma_state *mas_detach);
--
2.46.0
