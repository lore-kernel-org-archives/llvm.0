Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3181155345;
	Mon, 14 Oct 2024 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895501; cv=none; b=YCLdZlJ+8QF+820TbiZeuHJOT/mcPAwn/UWO+k1Pdtuy3Zv5jBHZWTdmKHEJheghSlzykcDTWsk0tOVDhJY0BqiTiULV9HPiJMoyF16iDM1lrnreqHp2n/mXJrGBNciwXWfj2xtfrxWx5t5XG340c/GkUN/gNYnziWv75FrSNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895501; c=relaxed/simple;
	bh=zA12MJr2jFYiswuI4OJkqPiMOcrIrzct7t45Q8a7bLY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KWil9m7/4MS610MOkpKtd08mHlS2arWnRbPATxpGT995VkRrva3MDQR3nxXInEGCVYEz+BEPJNyAflDRZZaNZ2WgeL+ONZu8qc+RQaYodOObrgHmEc5zZ0ND2Vvz+ssOxWJXRqumnX/6dlNRnuGIsEeM+uVpUEDrdAIeKxHVB4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=l6OhqDw0; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="l6OhqDw0"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E7od5h006061;
	Mon, 14 Oct 2024 08:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	NQaefaOaSscJPLZaHnJ5cyXFTzebAJmDItm/iKofpkA=; b=l6OhqDw0j8+43c+3
	ppakm2DhLZQSwBY/RqQF4cqz9B8YYqXPm7fz5Y0bncGDx1R9RIzExwzJhzMc+xFE
	EMTXonsTFmisiVu48SWB6Wg9huTFvkBQ5OBsuGoKqDTKLwd4jMhF8xWY5bRjh4cZ
	4bU9cerwwy//pI7D8BMazQpjDSeokjz9N3qV3SB7SHYqkrWDuSS7Bk36LOuHgIG5
	rautMnzy/sFZM5/ci5+Lu8uvh+GCo+4/pDJwT/c8oxWXUG3j/Kwb7WZsI9LrexfP
	xaYZ+qjTvF8dYe2H5EklFJ/7VImZ3kbOSOBPm031JX+tiHFVHptaasfjoLqWxt6Q
	cpjyfA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428y8w06jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 08:44:55 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49E70kno006678;
	Mon, 14 Oct 2024 08:44:54 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4283ernp8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 08:44:54 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49E8isLg44106102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 08:44:54 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FB2258055;
	Mon, 14 Oct 2024 08:44:54 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D3D35804B;
	Mon, 14 Oct 2024 08:44:53 +0000 (GMT)
Received: from oc-fedora.boeblingen.de.ibm.com (unknown [9.152.212.119])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Oct 2024 08:44:53 +0000 (GMT)
Message-ID: <05f57955648080267d8b6ebda80edc0d36069e22.camel@linux.ibm.com>
Subject: Re: [PATCH v8 5/5] asm-generic/io.h: Remove I/O port accessors for
 HAS_IOPORT=n
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Date: Mon, 14 Oct 2024 10:44:52 +0200
In-Reply-To: <202410120803.PveI3ZXV-lkp@intel.com>
References: <20241008-b4-has_ioport-v8-5-793e68aeadda@linux.ibm.com>
	 <202410120803.PveI3ZXV-lkp@intel.com>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KRR5HSWNZSMalAZ1yEJtQrdkkPsMC8o7
X-Proofpoint-GUID: KRR5HSWNZSMalAZ1yEJtQrdkkPsMC8o7
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_07,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140064

On Sat, 2024-10-12 at 09:11 +0800, kernel test robot wrote:
> Hi Niklas,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Schnelle/he=
xagon-Don-t-select-GENERIC_IOMAP-without-HAS_IOPORT-support/20241008-204236
> base:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
> patch link:    https://lore.kernel.org/r/20241008-b4-has_ioport-v8-5-793e=
68aeadda%40linux.ibm.com
> patch subject: [PATCH v8 5/5] asm-generic/io.h: Remove I/O port accessors=
 for HAS_IOPORT=3Dn
> config: um-randconfig-002-20241011 (https://download.01.org/0day-ci/archi=
ve/20241012/202410120803.PveI3ZXV-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7=
0e0a7e7e6a8541bcc46908c592eed561850e416)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241012/202410120803.PveI3ZXV-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202410120803.PveI3ZXV-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> > > drivers/watchdog/sbc8360.c:233:2: error: call to '_outb' declared wit=
h 'error' attribute: outb() requires CONFIG_HAS_IOPORT
>      233 |         outb(0, SBC8360_ENABLE);
>          |         ^
>    include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
>      655 | #define outb _outb
>          |              ^
>    include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
>      596 | #define _outb _outb
>          |               ^
>    drivers/watchdog/sbc8360.c:226:2: error: call to '_outb' declared with=
 'error' attribute: outb() requires CONFIG_HAS_IOPORT
>      226 |         outb(wd_margin, SBC8360_BASETIME);
>          |         ^
>    include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
>      655 | #define outb _outb
>          |              ^
>    include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
>      596 | #define _outb _outb
>          |               ^
>    drivers/watchdog/sbc8360.c:212:2: error: call to '_outb' declared with=
 'error' attribute: outb() requires CONFIG_HAS_IOPORT
>      212 |         outb(0x0A, SBC8360_ENABLE);
>          |         ^
>    include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
>      655 | #define outb _outb
>          |              ^
>    include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
>      596 | #define _outb _outb
>          |               ^
>    drivers/watchdog/sbc8360.c:214:2: error: call to '_outb' declared with=
 'error' attribute: outb() requires CONFIG_HAS_IOPORT
>      214 |         outb(0x0B, SBC8360_ENABLE);
>          |         ^
>    include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
>      655 | #define outb _outb
>          |              ^
>    include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
>      596 | #define _outb _outb
>          |               ^
>    drivers/watchdog/sbc8360.c:217:2: error: call to '_outb' declared with=
 'error' attribute: outb() requires CONFIG_HAS_IOPORT
>      217 |         outb(wd_multiplier, SBC8360_ENABLE);
>          |         ^
>    include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
>      655 | #define outb _outb
>          |              ^
>    include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
>      596 | #define _outb _outb
>          |               ^
>    drivers/watchdog/sbc8360.c:226:2: error: call to '_outb' declared with=
 'error' attribute: outb() requires CONFIG_HAS_IOPORT
>      226 |         outb(wd_margin, SBC8360_BASETIME);
>          |         ^
>    include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
>      655 | #define outb _outb
>          |              ^
>    include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
>      596 | #define _outb _outb
>          |               ^
> > > drivers/watchdog/sbc8360.c:233:2: error: call to '_outb' declared wit=
h 'error' attribute: outb() requires CONFIG_HAS_IOPORT
>      233 |         outb(0, SBC8360_ENABLE);
>          |         ^
>    include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
>      655 | #define outb _outb
>          |              ^
>    include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
>      596 | #define _outb _outb
>          |               ^
>    7 errors generated.
>=20
>=20
> vim +233 drivers/watchdog/sbc8360.c
>=20
> 3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan    2005-09-0=
1  228 =20
> 12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-1=
8  229  /* stop watchdog */
> 12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-1=
8  230  static void sbc8360_stop(void)
> 12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-1=
8  231  {
> 12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-1=
8  232  	/* De-activate the watchdog */
> 12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-1=
8 @233  	outb(0, SBC8360_ENABLE);
> 12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-1=
8  234  }
> 12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-1=
8  235 =20
>=20

Hi Arnd,

This one is a case of UML causing an x86_32 dependency to not be
sufficient for I/O ports. I've just created a new commit[0] adding
explicit HAS_IOPORT dependencies to both SBC8360 and replacing the !UML
dependency for SBC7240. It's tagged as fixing the watchdog HAS_IOPORT
change. Should I send this separately or a v9 of this series with that
one included?

Warm regards,
Niklas Schnelle

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/log/?h=3Db4/=
watchdog_sbc_ioport
