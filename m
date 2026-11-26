Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687990;
	b=xO4hd2ZAgUfs5teJTIdGaQ4EpiYhMglVXZ5WS9+tFgIkKH+iDDV4GiVUWhXsJmFbLWgU
	 8+5Ma18CRF18AlldjT2yYl5aIVvUHWsEtnFCo/VAKktweM/0tAgCx9N8Wi7WmwAKpbbBg
	 ZPL4Cc9z5FjMA996sglOsOmXxZIHuIseNzuOE1UrETfY99BV5wJbaLMLXeTl5GOXQIcj1
	 uv1IwC/2w73eL9mPB4VZ6SGxckoZVg5wjAAuNF5JQCyeytWOG7Qz/bSdEVnNiumvk3Ss5
	 nrSJ/enhXf977D1ib3/Ac43EfvNnG5OdJI7vSNFS93l3guxVOsBx44ehoYOUUaHrrfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hRDLFEXKJ30g1D1YJpvEImvRW5+2011T3WYnn8OR490=;
	b=LSawpH+Mo41Hs9FwF9KWbEmcJM5BzarW7pQRR7Qf0Fhe5p/iWRqXkqO5ryX1w6DrEdYA
	 hMwPwMrp/xRdKbBGrcd1MyykOh2f5UwbbA98MiD9Dxda/QsjT+bVKxetm3vw0YgY3CLpW
	 KCKNpy2Te/UYP3nQ0vLfWLZhGvVgnUi4LmUd985tjC1P22859FT/rut+/ZO2zGFDHHfd8
	 brR7/V7/OiLs6ULvVU4jALXjeEFO29JhndK66PPkadqBsHfktjYTIKgogQCRVKRy8P+Bk
	 rg9kVKIGegBu6MUoV1z7Yim4om5TZxYO34Vkiehxwp9AKTzIQwBaw/WDJ+arC+N1qxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I1pFjLxk;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6B606A31C
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 10:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I1pFjLxk
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7YfSU3658974;
	Thu, 26 Nov 2026 10:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=hRDLFEXKJ30g1D1YJpvEImvRW5+201
	1T3WYnn8OR490=; b=I1pFjLxk/i0A3imSy+b4orTo1yP6vYK7FSQnH6CTiQ/+sG
	MdRIRhThJlm7pXFDJQvf3d31NOC7ayYP/rdX4uOi3k01OlR6hDZWx8k8kfbdxkd8
	8XZgJ6Tmke76dHIwjD3m6MrAIn99F7Nv7Q8ZaXRq4lqOxROj4oiXXq9n6q0/yWok
	T2DahkHaKobUPIe6rC1wEoCSfiJIgFPUk4kAta/UAwbvNQoSfNuSmDSnBE5nDFge
	CqARwMYA/YZ8/La5CfC+BlDsRFubKDwBAHFJpZVXKTs9Bgt2kLSX0vlf+9wJQcey
	/ERekswQ3bR1/r8EgKKFNJk3URV9EIEwLtIYOdpw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gvg96d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 10:12:46 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7JHv71263837;
	Thu, 26 Nov 2026 10:12:46 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j5uxx4bge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 10:12:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AQACg7e50397654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Nov 2026 10:12:42 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 513BE20076;
	Thu, 26 Nov 2026 10:12:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE54120075;
	Thu, 26 Nov 2026 10:12:41 +0000 (GMT)
Received: from localhost (unknown [9.123.13.41])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Nov 2026 10:12:41 +0000 (GMT)
Date: Thu, 26 Nov 2026 15:42:40 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
        Jeevitha Palanisamy <jeevitha@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "David Hildenbrand (Arm)" <david@kernel.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Andreas Larsson <andreas@gaisler.com>,
        Usama Arif <usama.arif@linux.dev>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] powerpc: Add support for 128-bit cmpxchg
Message-ID: <awgFAxLnbR8Y_IFi@li-398ad3cc-28e7-11b2-a85c-e030a5b10d54.ibm.com>
References: <20261125174035.1412724-1-nysal@linux.ibm.com>
 <20261125174035.1412724-2-nysal@linux.ibm.com>
 <20261125204453.GC3625068@ax162>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125204453.GC3625068@ax162>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b08061f cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8
 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=vzgTcerKnXmpP8cyqTYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX8OCC964ZfGYO
 YZDgGr5PTcHbaCrsIXkwshDi7DPjsiPMACT9J0MtdFn8cZruBQjgdPH0f+pWXd0RtQDNZK9mpZm
 x1NZmmV7irAHsP9cLUCo9GeVC5yf8GY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX08sC/SgcU7Td
 QESLsgIYUXd6vYDVlVqq1ede7PIwder5BdddiEN+YbwlHUadGmldD2YqSrj6TNOdPWpADPPAlju
 DLlI9wYUTNdqCRt8SIr7mVBYvONHVoRTICgTiGfcCKER2ngpB0TmUWz5J5+7vKlmvPjFU/qeRA4
 +w4buJFyL6Ac0B47XPz3f0yTKEdie0tP3qBvPioz/JKMmaQlC0k89OSJdRFrDyz74dlkcdXOS4A
 m1qU7SBMeHFTVTq3T5tK91KXkOxLRbr5R8KiaXu8snWY+HtQrZFi0RBQHgVZo1TQ/3UJAdLwHiQ
 ooe5l0HBMfYcwX2hoGHLpv94FTl/I5VDGhO3OWLJgWr9CUP2y0WerM/nO0B54JGklKhomI0b+8c
 oXmk6E4SDLJezeBXn4Pmz2JCxKM5IifgYqGK/KbxQNrZW6Na/JZqxJPid59tQaNhDWAwFwHst4z
 igdZNlvLZpoI5XYARKA==
X-Proofpoint-ORIG-GUID: 5NNvVXibtYglLJHZKPuDSKa8YhIzUVBC
X-Proofpoint-GUID: d8m3aY6He0M0n59CB_8x7Ctdimt8JCmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260039

On Wed, Nov 25, 2026 at 01:44:53PM -0700, Nathan Chancellor wrote:
> On Wed, Nov 25, 2026 at 11:10:22PM +0530, Nysal Jan K.A. wrote:
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index c3b6cd655606..79cda056dfc4 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -15,6 +15,9 @@ config CC_HAS_PCREL
> >  	# do pcrel yet.
> >  	def_bool PPC64 && CC_IS_GCC && $(cc-option, -mcpu=power10 -mpcrel)
> >  
> > +config CC_HAS_PTI_MODE_VAR_ATTR
> > +	def_bool $(success,echo 'void foo(void) { unsigned __int128 u128 __attribute__((__mode__(PTI))); }' | $(CC) -x c - -c -o /dev/null)
> 
> Please use '$(CC) $(CLANG_FLAGS)' so that this works if clang adds
> support for this, which will depend on the target information in
> CLANG_FLAGS.
> 
> Also, consider following the recently added guidance to
> scripts/Kconfig.toolchain and add some information about when this check
> can go away:
> 
>   https://git.kernel.org/kbuild/c/c285fe817a92f9c747931134f468d2aefeae6bce
> 
> It would probably be something like
> 
>   # gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106895 - first fixed in 17.0.0, backported in 16.2.0, 15.4.0, and 14.5.0
>   # clang: not supported - <bug link like Nick requested>

I've opened a feature request - https://github.com/llvm/llvm-project/issues/246292
Will make both the suggested changes in v2.

Thanks
--Nysal
