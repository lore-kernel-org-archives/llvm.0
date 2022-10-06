Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10F8636
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 03:24:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29630K6A020664;
	Thu, 6 Oct 2022 03:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=vAm2oAQPdXUx9zMvADfNgo/fT2s6Ag1oX4SkjByr0Oc=;
 b=XppiUXhtjwfQucRoTbVNkHq61atS+fzdkBo8cvl2dbnjY8MoIZkIA3F2MNP02Xuwsazv
 5HbZDptq1fIsNydUAF4UvaCe6uzvK1CLQeb2To2JlISuIu5j6xhKDEWLMib1xlQmXfGG
 3VdCarCRav2Uyc3BrK5VnGMlMAQ/EOf30a9QbO2FGiRE48FFRYoWjgnbZwWb6fxmow/F
 NwwiOTirQ5Tu5qYjA5qhhP4Tjd9J1iIBKNfRtJrbYQ2AG7l4QboBMV+oTgYXfWniz0aH
 CRj6gFnP1HwrvfqNkcy7poHnaEn1DCZ9/JWylTAwAXzWiMj7gntacom8zVV+RP8KPZdR Xg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0m88mckx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 03:24:11 +0000
Received: from pps.filterd (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2963OBkX001690;
	Thu, 6 Oct 2022 03:24:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTPS id 3k0q8tgxjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 03:24:11 +0000
Received: from NASANPPMTA04.qualcomm.com (NASANPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2963OB3q001682;
	Thu, 6 Oct 2022 03:24:11 GMT
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTPS id 2963OBGp001681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 03:24:11 +0000
Received: from hu-gurus-sd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 5 Oct 2022 20:24:10 -0700
From: Guru Das Srinagesh <quic_gurus@quicinc.com>
To: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers
	<ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
CC: Elliot Berman <quic_eberman@quicinc.com>, <llvm@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>
Subject: [PATCH 1/2] scripts/clang-tools: Create array of checks to exclude
Date: Wed, 5 Oct 2022 20:23:59 -0700
Message-ID: <5a10dda2a06b92f040ec7a18876db4c8107b4989.1665026261.git.quic_gurus@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aWELv3Vw76mR_v5ff7E99knZFuwv6BPI
X-Proofpoint-ORIG-GUID: aWELv3Vw76mR_v5ff7E99knZFuwv6BPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=680
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060019

Create array of clang-analyzer checks to exclude for ease of adding
more. This is per the suggestion in an earlier discussion [1].

[1] https://lore.kernel.org/lkml/CAKwvOdnbMs-pLRfo4O-MHOF=9=kAvDuktkeeeX7bkmnLi8LWnw@mail.gmail.com/

Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
---
 scripts/clang-tools/run-clang-tools.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index bb78c9b..a72c4c7 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -50,7 +50,12 @@ def run_analysis(entry):
         checks += "linuxkernel-*"
     else:
         checks += "clang-analyzer-*"
-        checks += ",-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling"
+
+        # List of checks to be excluded
+        exclude = []
+        exclude.append("-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling")
+
+        checks += ''.join(["," + e for e in exclude])
     p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT,
-- 
2.7.4

