Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442832862D;
	Wed,  7 Jan 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785988; cv=none; b=Sm72D9exiCFeJqCrn0JcpX103GA8dh+eGv622uGTW7E0cswY3XILazn7WClb5v5Zarz9MdWn/UWjnTecyU6oIST0BynzEhbBoDAYrha9Lv/yxYBWKi+zioVjXvAitXvTg2sL9lbRIaSo1uNFC4GwcJ+oBl0KlDWaCOtPKE2Cok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785988; c=relaxed/simple;
	bh=ARUq1lvrC6DBE3/jy7WrQJmfaphzfw0RnjvXQ58ywPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgNixV/hNUUCnoUrncx/ARpIEVZ4RYuqRGxvO7JaNUZbUqUtBz1QQKPEkreWdxZOUDo8Mxvw7pPlOsUOc74pzrG/R4ZORZUEtBkxtjKjNHZj2Vx3S15TE1qh2416mqiUoNJOF60htKIQA1uyhGVhFpjKCQS8h2lfp61iyVaOBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oQIGaUTy; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oQIGaUTy"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60750IUG025190;
	Wed, 7 Jan 2026 11:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=sofQiGMK4AfE3c8BSwgDozd5fowrKg
	7qv2lJ+FoiYdE=; b=oQIGaUTyBd03qAdeClsSl0nNoiJjxWpbAeESSaSoMfN1OJ
	D77Fw97KQOIT1gglEtPa5mPLMoq9MfjSHUQAmWEnzRB4CMgeXA/emJMz+H0ULi9M
	mRB7KAkgU1YNYn+NrI0/EqiYt0mBGW3v+vIx7JDI/cCEnCm6prgxnllyyFAvaEn+
	ausbXN3hQXrmGI8Sc3fWgs3YF8GGN/nXcxrxUdqtVoPE6W6XQE6q0IcnkHoUgvsP
	U6NtyIIet7tm+vYUbQV2t3VWEUihIroWsd/+imkpLVIVV29+FltfVr9bFFp6wKRe
	2kv1cy8vY79NxcqSdp5ymD/G/8uct8xoo1QkuEkg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betm78kuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 11:39:37 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 607BbcoZ004050;
	Wed, 7 Jan 2026 11:39:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betm78ku9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 11:39:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60784Y13014528;
	Wed, 7 Jan 2026 11:39:36 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfeen0ppp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 11:39:36 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 607BdYrd51577268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 11:39:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DDCF20043;
	Wed,  7 Jan 2026 11:39:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2A0620040;
	Wed,  7 Jan 2026 11:39:33 +0000 (GMT)
Received: from osiris (unknown [9.52.214.206])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  7 Jan 2026 11:39:33 +0000 (GMT)
Date: Wed, 7 Jan 2026 12:39:32 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Marco Elver <elver@google.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 34/39] WARNING: modpost: EXPORT
 symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <20260107113932.10536B33-hca@linux.ibm.com>
References: <202512222219.F6EkVNmQ-lkp@intel.com>
 <20260105153520.GV3707891@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105153520.GV3707891@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=OdmVzxTY c=1 sm=1 tr=0 ts=695e45f9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=1J_Zm-GIPAaO5Mmawd0A:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: doyDXR75uRLu0cZ6zQ4qWpyUKMS-8IBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MSBTYWx0ZWRfX5+ZyV5nodAgt
 ppimYOzxzPMv7RRnTBUB0MbX2wZXH7kodHHy7iFaiHrmzA1DfdhRgCPYhnr0tL43dKifL2kfYrk
 uUzjxrf8q1tYKYpWS9tzXuvYkWO9Zkt8DEdav0cWgBLYf2HJGr0E+9mtib2Nn2dZ/0jD5gbMICd
 Dnl8FYmkUgC16eD6M9NxQF1TBagdOwfNkMpFrgMO36ofq3DYwHv/BclcTsLixjk+GlGk+jpvzGS
 gUdrjwt4fUxeyYXAPUF5eZucb65wo3FHHJPUbRhHox54MrDcLCuONCOrbxGMZHchJi+mMcnUmSl
 huKhb3WSeM6HkMOXumM+SDGaS4F4zrgkXyYsbSCxGArGWotX91/ECmYNbvgPE90vSVWn2wqVseh
 FBbWQTZWy1orVOBZ57EjHyfjmU6NwAlWDrD7hCWP8kUsYQ1VB/RQ9gUpr9JstMvGeflrkQCiw1k
 DfKCzIEZgBj7P7eZCKw==
X-Proofpoint-ORIG-GUID: ZV7848MeDcxjERwssMjF3Cps7B03Q_y3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601070091

On Mon, Jan 05, 2026 at 04:35:20PM +0100, Peter Zijlstra wrote:
> On Mon, Dec 22, 2025 at 10:11:10PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> > head:   77b4ebc9e43b02f3c50dab48963d969964ea83ef
> > commit: ee771bab5add646af678f7a40b6272c21a0964d7 [34/39] stackdepot: Enable context analysis
> > config: s390-defconfig (https://download.01.org/0day-ci/archive/20251222/202512222219.F6EkVNmQ-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222219.F6EkVNmQ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512222219.F6EkVNmQ-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > >> WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
> > Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
> > >> WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
> > Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
> 
> Heiko, I'm seeing these warnings, and I can reproduce in a local build.
> But I have to note that its just one more of an already existing string
> of similar failures.
> 
> I don't see anything like this on x86, not have I had robot reports for
> other architectures. As such, I'm considering this a pre-existing s390
> issue.
> 
> Please let me know if this is something you want me to look at
> nevertheless.

This seems to be an architecture independent problem.
When I enable CONFIG_MODVERSIONS I see this on x86 too.
