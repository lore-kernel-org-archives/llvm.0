Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF75101C8
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 22:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="O3ohL4A7"
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UMFgIc026073
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 22:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eyJKAMQOetAZ/01CNc36149sMLFqXtPfXhNfiZgC8S0=;
 b=O3ohL4A7bzCTWNAE/c1Z5/HLHp6PpY1Qz+sdeuDB69UDVSOct4uAOmvgtIM7fcpDGVPA
 AdxE3zrR8lHVLm4+fUyhwiLg6S2eWVcL/eHWPJa6vbCF/1yD2nNfVQBNO1mJJS2i1XKK
 M+ACZqX8HSKYr92wXbq776RMVInKWvMbL0vTGIH1InO6eJSj/uCSiF+b+0IvWD6g1y7p
 9K0vFtlP9wWok/2IiC8UmBFQtr2NtGshNWozbidd9lDEtpDh8P7aqtxCP1QPmn7VgBkR
 EuKQN+4ARtR1GVRtp/rjmTqDgxKbdoZHCA7BDaDf0hKWukXysHHSnR8iJH/HHQ2eTG6+ 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u2n4a06q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 22:26:16 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39UMIHm1001137
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 22:26:15 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u2n4a06pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 22:26:15 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39UM86eZ019895;
	Mon, 30 Oct 2023 22:26:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u1d0ycd0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 22:26:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39UMQC0J37028322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 22:26:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E470D20067;
	Mon, 30 Oct 2023 22:26:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7303820063;
	Mon, 30 Oct 2023 22:26:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Oct 2023 22:26:12 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 102B060060;
	Tue, 31 Oct 2023 09:26:09 +1100 (AEDT)
Message-ID: <9db82681-49ef-4c79-9b5e-6a269b8518e3@linux.ibm.com>
Date: Tue, 31 Oct 2023 09:26:08 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: Prototype Assembly support for Clangd
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
References: <1c90b45a-f35b-48ea-972d-019b0004a91c@linux.ibm.com>
 <CAKwvOdka7ZXn6Zj-jh_0igFH0ru=g-18t5p-NC0gXxEUdsOqOQ@mail.gmail.com>
Content-Language: en-US, en-AU
From: Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <CAKwvOdka7ZXn6Zj-jh_0igFH0ru=g-18t5p-NC0gXxEUdsOqOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z7vrPtuVez5K5rcfhmfz9PKop7nHZqr7
X-Proofpoint-ORIG-GUID: Rx3vLGPal4AK0ACw9PoJU83YskhdmZtY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300176

On 31/10/23 2:41 am, Nick Desaulniers wrote:
> On Sun, Oct 29, 2023 at 7:10 PM Benjamin Gray <bgray@linux.ibm.com> wrote:
>>
>> A while ago I mentioned working on adding Assembly support to Clangd. I
>> finally got some time to iron out the obvious bugs, and have announced
>> it here as a discussion.
>>
>> https://github.com/clangd/clangd/discussions/1805
>>
>> (direct repo link https://github.com/BenjaminGrayNp1/llvm-project)
>>
>> It's of particular interest to kernel developers I imagine, given the
>> large amount of Assembly using preprocessor macros.
>>
>> I probably won't add any more features for now, unless there's interest
>> in adapting it up for upstream. I will try to keep this fork
>> synchronized with upstream though, so I'll fix merge issues as much as
>> possible.
> 
> Neat! Yes, sorry I saw your first post and got distracted before I could reply.
> 
> I just recently started using clangd in vim via lunarvim.  So far,
> I've been somewhat happy with it.  Still need to work on
> lexing/parsing speed to make it smoother.
> 
> Can you tell us a little more about your use case?

Yeah, I work on the PowerPC architecture part of the kernel, so
sometimes that means reading/writing the Assembly files. A typical
example of such a file is arch/powerpc/kernel/head_64.S

It's got a good mix of
- #include directives
- #ifdef regions
- CPP macro invocations
- Assembly instructions that look like they could be CPP macro
   invocations but aren't actually (e.g., ld r4,PACAKMSR(r13) )
- Lots of CPP macros generating function preambles / sectioning magic

Basically, I figured there's no technical reason this file can't
be just as well supported by Clangd as C files with similar macro
usage. I listed a few 'nice to haves' on the README, but really the
macro support makes the biggest impact. As an aside, I only learnt
after enabling it that every 'rN' in PowerPC assembly is actually a
macro defined to just 'N' or '%rN' (it changes depending on which file
you're looking at).

Another use case is symbol indexing, but that's not implemented here. If
it was, then find references would work better (the Assembly files call
a lot of C functions, which currently are not recognised by Clangd's
find references/rename operations).

The documentation on hover was a personal want. When I started, I wasn't
experienced in the PowerPC Assembly instructions. The one I remember
struggling with the most was 'li'. It's an extended mnemonic, which
means it doesn't appear in the instruction index of the reference
manual. And searching a PDF for 'li' gives a lot of false positives
(Okular doesn't seem to offer whole word search). Obviously I found it 
in the end, but it would have been much easier if the editor could just
tell me what it was and where to find more.
