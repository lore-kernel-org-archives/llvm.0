Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71543126C6;
	Wed,  7 Jan 2026 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786380; cv=none; b=FTZ74qhAj/6mGMBIEgMbsDUad8TkdRFcvCo6QBUZboAl0XHeRegPwXcSKazsrOz/9OjAk0ctVQFLcBqcCLPF2J7XvYFE2khZ7nzlA97wonOj6iu119jlo9WOklj2fNMjX4RH2kibhBeIgLeAvY3P9ONFN/vsk44D8nGUDwxwuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786380; c=relaxed/simple;
	bh=0FDl3N90vVT+GMCNTjM0mgcs0kHntDjPJwpISdAwIyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRxAdubCOPmUqewhl83p2Ga+RYIf5H9GqpUlRRySpaX0nkiZTlnNEtxiwKufMn7Wog9BJrbsoGz5G9mYuP+k1bkzILouaKRfaCwesh9qgPR2DQ9Bwxg/BwidCOiW4pn7RJ2eyf53Ga9S6JBz3KxIzNqDdmu7LlR6qwu4Q0J+1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rYYWxPfn; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rYYWxPfn"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 607ARU9p019057;
	Wed, 7 Jan 2026 11:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=vP4NeFrIl/Y/2eOEx9BN4fh6Wo1vDo
	F/Yaavp2jntQ8=; b=rYYWxPfntA9ie0rIAwdzYSMapY7cpZGAgRsK2nUoaUF4ho
	mAwMTSsAmnYuioIIZMjAGe+ukYOP/PEx3wNIeQ9xhV+0yqvjZoezYy57GTo+GgN3
	QMjDCzA1uvUd8RQo/p2CUsXhVqvlYqTvXmyE/L3HlT5haLUOJM8uwDnrf9QTVAvi
	mcOBQSKNzKQ+0ByW8UeAPOHE3Xbpd//whZemWJysjVdrrZpsNRTHbNFoYA4NcbvC
	vAtOVz1TPocqg/GbxSeBq3cdompgHlVbzzd+1kYOvrNKPuEBY3Zeer4oc9dBtQ0b
	68qBSBweQE+4gNCOzgqnpVxZMrtf+iSskCMfdZmg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betsq8kjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 11:46:13 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 607BkC3b018610;
	Wed, 7 Jan 2026 11:46:12 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betsq8kjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 11:46:12 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6078wpFn012560;
	Wed, 7 Jan 2026 11:46:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bffnjgh4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 11:46:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 607BkATm39387616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 11:46:10 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1656E20040;
	Wed,  7 Jan 2026 11:46:10 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB94B20043;
	Wed,  7 Jan 2026 11:46:09 +0000 (GMT)
Received: from osiris (unknown [9.52.214.206])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  7 Jan 2026 11:46:09 +0000 (GMT)
Date: Wed, 7 Jan 2026 12:46:08 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Marco Elver <elver@google.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:locking/core 34/39] WARNING: modpost: EXPORT
 symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <20260107114608.10536C6a-hca@linux.ibm.com>
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
X-Proofpoint-GUID: 2wk_w2bMrXU0h7sjzylMIh1XEdMa8MVp
X-Authority-Analysis: v=2.4 cv=Jvf8bc4C c=1 sm=1 tr=0 ts=695e4785 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OQpX69FAkt-afPtDZqAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Q06weXAJInH_woGlMumulDpCvL1cWett
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MSBTYWx0ZWRfX6RHkQAjqMhlR
 +v8p6+kbBQed5wpguLdFNDBlINiNEdfoHrhUt2SjezcKZQHvNmpSGL60fJpbLSghZ7zhMxC4WKP
 jWgBtsCDiVCRrEBn7Wf15p2tHR+hUP7Cu4gQyevMPobqLQ03i6yqDBlix3fASnn96H847CuGbL7
 7MgJxKD+iEtHfHXmJrr9EDYeefxXGZSTPKmZjgb4oaWERbdcfN56CT2/FFFyPBC1JjlGG+RsRlv
 4ZFKkq75MDGiT/JAWnlO84buZEmZ/tV1iER0a9ibcdSKIi0GTO54iRpm3mwScLtpsJ8OCEzmP+I
 lcoPbVPhWXU1GWrA6ChP8O7Zv+y9+F1+ApoB9i54ERQH40mnspFLAlQ+Xp5QWDNDApylkpyFdHq
 aapfkZMSYyfmcCN6LT7opp2Wokza2H3CBQTRk+TtqQgYKA4+S8PRA7sHhcVSSyyVkyoVtJIVGuR
 XDhOpSV76kFUO7lIAvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601070091

On Mon, Jan 05, 2026 at 04:35:20PM +0100, Peter Zijlstra wrote:
> > commit: ee771bab5add646af678f7a40b6272c21a0964d7 [34/39] stackdepot: Enable context analysis
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

Sorry, to be more precise: I haven't seen anything like this before on s390.
All other occurences are also new and come with EXPORT_SYMBOL statements
within files where context analysis has been enabled.

When enabling CONFIG_MODVERSIONS I see this also for x86 builds.

I assume you cannot see this error pattern for s390 builds with
context analysis disabled?
