Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8501C3DB330
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700466; cv=none; b=coaIYE2vGREW5EPeahxUKw9d4cBM+QQkwkqpLmL14+g7VEIiIAl0V40GxvDRR6YZjBSrlrpKf6Vpnty2mUty7IS0oj7h+pCnyvLX72NONuF5JS+kKRpR6UrwrjoAbQL+OkDQj4/3gdzvYX8VIyHRtPBbOo0csbtbCpnY57U3A2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700466; c=relaxed/simple;
	bh=N9BsgCfXNS6LgrDy+6OUjxhiGTmVw8ZoB8nAhYxzmSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrhVwFeo5v/m76c3HWsc4wIPVFrcnK2TxMUZb7YeEBA73ak7Ju5EvyEptCSZJ3bFyCAr/yc6gko+U65zAOnDInKK2C4kaLgJfueV4T05PhWQSOY0QuDwMH/bebiB6seWdMiOuiziB13I1gtpRp7yLPPfkUtfocKflCBfnX1GwsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BsoIpDHf; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BsoIpDHf"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TB5M1e4059995;
	Tue, 29 Sep 2026 16:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=VoVozP49h13sqmExeIlGReg/E2LYwmRl9ePEfAxbI
	ao=; b=BsoIpDHfrocRF3+HJiNz/MZvPxTbjYca8NJZ1UNvklq+8E0aVnMucFo0t
	y20LVX2GubuQ7zwjtoUHDoL6/gtCTPrRqXf37u5xLdJjV3b9s65MRyxEbo7hxjJz
	96d7m5hec3hE5lJMZahIGVzVu1WHeVowD6aAldS70mYoZ5MtpZqLFPkgs3uRqUHD
	lRJIxc7azuMLf2C0JRuBJIV8AQW2425cQTXfdQqU8my94akKZMTDLoVzgN/NNfO0
	5aIxSTA8aWeJ/EZBsEoo16kMiRuNclRM0QF+weew015EDAtqyL96rgI6WwhqF8FE
	fhjpS45dtF7a7LQ6shRL6NywuO5EA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5j589qb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 16:47:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68TF1t9D1617010;
	Tue, 29 Sep 2026 16:47:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxrrwapfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 16:47:30 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68TGlPoc51380610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2026 16:47:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF1032004B;
	Tue, 29 Sep 2026 16:47:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0C9820043;
	Tue, 29 Sep 2026 16:47:20 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.214.246])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Sep 2026 16:47:20 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        llvm@lists.linux.dev, nathan@kernel.org
Cc: sshegde@linux.ibm.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
        tglx@kernel.org, yury.norov@gmail.com, kprateek.nayak@amd.com,
        vschneid@redhat.com, iii@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com, elver@google.com
Subject: [PATCH] sched/core: Fix context analysis errors in non-preferred CPU push
Date: Tue, 29 Sep 2026 22:17:12 +0530
Message-ID: <20260929164712.1054883-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX3dROm87Wfw4p
 Ii+87R6zSfmt9mNjDivd6PUIlUC8XDQOS3ZmHUmRd704y3dbiBk+ngLf/7C6CHZeS4rKHE1gyfU
 j74pdR9YRARUqafyoL+xE3cGM3YDM0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX3koUZ/pNmXMb
 E3HYk1brGDS/VwQfuKSp8gUzGeK2iW8vXr2T45Aqos1erqIEV40DIA7UXjRdPvRSSeZrilhRefk
 VAdroQv5ToYwGIR1Vd62dktTAFoz9q1kPx2zD761Zi3IOYC4sI9bMPrKyGyE6TApItOTgaCDylW
 NqOVRVPZLxICN+wua+HWyKL7okIo0cQ3AAUUn5H3yMwh8BVyYgawg5lftjY1j5XrzjxmR3BGJaE
 xat+Uew3YM+owC7AnzTZ+Wz8jatFQJxceyfklvvbZCJMQfl3wQ6p39mqH+5y21MA1HpDRVuSVTc
 jTaobiI7s5aVZ1QK4/slDumVkYzzeZY9jHB5rf33ylmelv9OWz3JA3B2RON9WXRaQ0oLNhBvbpt
 sFc0ntHp8kc52Lx1O9C2ZZxmYUNe1oaakNOU+BfN2aJGUp2go1+bUxJyxhi3s1IfJcK/uHKPDm0
 KcCJOPh5egFFPHUlqBA==
X-Proofpoint-GUID: xRmHktG5Ks4uYC-49UnQekYhqAeS6FN0
X-Authority-Analysis: v=2.4 cv=RKcmjIi+ c=1 sm=1 tr=0 ts=6abbeba3 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=_XkI2SlThOc_OxJ9TIcA:9
X-Proofpoint-ORIG-GUID: QNcRT8z7AX3TpUa2h2SumYlU8z71b8f6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290066

Nathan reported build failure with clang23 when CONFIG_PREFERRED_CPU=y.

  kernel/sched/core.c:11298:3: error: releasing raw_spinlock 'rq_lockp(rq)' that was not held [-Werror,-Wthread-safety-analysis]
   11298 |                 rq_unlock(rq, &rf);
         |                 ^
  kernel/sched/core.c:11303:1: error: raw_spinlock 'rq_lockp(__this_rq())' is not held on every path through here [-Werror,-Wthread-safety-analysis]

context_unsafe_alias(rq) was placed after rq_lock(), by which point it had
already associated the lock with the original rq alias.

Move the alias barrier before rq_lock() so that the changing rq alias is
accounted for before acquiring the lock.

Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/20260929121838.GA1814129@ax162/
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
base commit: tip/sched/core
1fb28c664a19 ("virt/steal_governor: Enable the driver")

 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0bb86a43a592..23677d76f9d2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11283,10 +11283,10 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
 		 * safely bail out.
 		 */
 		cpu = select_fallback_rq(rq->cpu, p);
+		context_unsafe_alias(rq);
 		rq_lock(rq, &rf);
 		rq->npc_push_work_pending = false;
 		update_rq_clock(rq);
-		context_unsafe_alias(rq);
 
 		if (task_rq(p) == rq && task_on_rq_queued(p)) {
 			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
-- 
2.52.0

