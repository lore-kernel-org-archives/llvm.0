Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CABE806
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 02:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GQMAZcsm"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39U1RMe5023458
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 02:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 cc : from : subject : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=nWTaFq/DaVh+5rMqAIzegYHyaP1rawAC/pDehTtUjAY=;
 b=GQMAZcsmLhNXlRy9TxnjnJMHIxf3fMBhg5UDqTomrfj/SjxzyySabYRJLGHQhN+7Sdi1
 aWCFgvYNVWLHmL4l8mhb1tiC43LuTVQkn3mLgzjDtjJPufwOUKytrK6EjChjt62MJXF1
 OQOkziI4sKu1RAKNUjHoznzTNV4KGraHimFj55GY8dlZqG/oE3dP7uiVbcoLZ3+6ntk0
 dpBUnpdsWSQz4sq4T+W51csNqEzQNXt5T7FccIsZwXlQfr6txx76XSA9WjSq43CiatUS
 6kyooHmD8cjFkQ3TWDYGGQXXuLZm7i1xOqpijAlov9FnUY3s8rELKMVFurI+5fhB0mlS hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u22u9gm74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 02:10:56 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39U1tvsQ018542
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 02:10:55 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u22u9gm6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 02:10:55 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39U1PcfJ000598;
	Mon, 30 Oct 2023 02:10:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u1cmspc7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 02:10:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39U2Arkh45154666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 02:10:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E5232004B;
	Mon, 30 Oct 2023 02:10:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D178920043;
	Mon, 30 Oct 2023 02:10:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Oct 2023 02:10:52 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 74710600E0;
	Mon, 30 Oct 2023 13:10:49 +1100 (AEDT)
Message-ID: <1c90b45a-f35b-48ea-972d-019b0004a91c@linux.ibm.com>
Date: Mon, 30 Oct 2023 13:10:48 +1100
User-Agent: Mozilla Thunderbird
X-Mozilla-News-Host: news://nntp.lore.kernel.org:119
Content-Language: en-US, en-AU
To: llvm@lists.linux.dev
Cc: Nick Desaulniers <ndesaulniers@google.com>
From: Benjamin Gray <bgray@linux.ibm.com>
Subject: Prototype Assembly support for Clangd
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Yfpd7TcQS-fACk2y_MCt6JHMV-bxZLY7
X-Proofpoint-ORIG-GUID: BjYG6C1lavDDJwAtT7nz_ZJbJTtboGSz
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_01,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1011 spamscore=0
 suspectscore=0 mlxlogscore=609 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300015

A while ago I mentioned working on adding Assembly support to Clangd. I 
finally got some time to iron out the obvious bugs, and have announced 
it here as a discussion.

https://github.com/clangd/clangd/discussions/1805

(direct repo link https://github.com/BenjaminGrayNp1/llvm-project)

It's of particular interest to kernel developers I imagine, given the 
large amount of Assembly using preprocessor macros.

I probably won't add any more features for now, unless there's interest 
in adapting it up for upstream. I will try to keep this fork 
synchronized with upstream though, so I'll fix merge issues as much as 
possible.
