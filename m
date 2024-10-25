Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6819E217F58
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729891915; cv=none; b=K2wu+vbwdG0RqUlBb8IR5qqy0id7kvzI4btLAexQvZK5l/uvGT6fb4TAUCDPbpriLRPqbG0cs5JWsHMQOrWOzz+stTfi0OTWpAqa6BtlqIujlLRn4HZnodUE2kF9143akBWAREOsIiuqydgO6bLiYpGh/W/2Uo0KvQWOCYKajgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729891915; c=relaxed/simple;
	bh=Ipx/nAL3FQfLI61+6fhob35Xkzm3X2p5jqZLrI10mY4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:CC:Content-Type; b=Keia5Onin9iU/DQ4Zoergppn0rw1Ahro5PHZhwTVmVlCWH2VKtGQbxbolM7+zGZPF7UPU5RdBdPlq2azA+TH73xLZKLiWMm1hnerHjaqfomZ7CqmEXFYpi05D3WWHIy9vsBfRHYu/2feK+lWGfmOpYYdApNZad578e/6N/2rUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VdQMByPf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VdQMByPf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB21dc000954;
	Fri, 25 Oct 2024 21:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9tq6RlFepNQqxLFLRahWmC
	fWMTQIDwAXH+ngPd/dmKs=; b=VdQMByPf8d+tXpdH1ReGygRDUJgUOSSICT3dB8
	oEP+I989gqKLQJIm3ljAoOnKaY/vpE58BRnAzur6qexPj1ZHocimJ2zR83iskKgh
	BSBQFJUECp6K0szxk1SxG/UBLJJzMw2ZHYEjwV60usWLrYuMefKsQoYXr6rE1epa
	f053ZYD+pduDevJAf5D3ahpIVdFJQR8ml4a+sM8X0U5t6ongMwiuSVGntL874a2F
	hyEDjCTJgDU3QtTDaOmG81VbfRNqMyo+rpqF1U6kSIkMqbpsegqlR6Xik9PI3u8/
	tyN+BWIt92qwupk+eZr003pkeU3L6CXMr8zEUaCKZcRSTYxw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s1mpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 21:31:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PLVnZs007355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 21:31:49 GMT
Received: from [10.48.242.80] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 14:31:48 -0700
Message-ID: <bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com>
Date: Fri, 25 Oct 2024 14:31:47 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <llvm@lists.linux.dev>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Which LLVM options impact function stack size?
CC: Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qh1ECTnvuLSChQAOBWoCTU8SL7BtTlt5
X-Proofpoint-GUID: qh1ECTnvuLSChQAOBWoCTU8SL7BtTlt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250166

While doing Linux kernel builds with both GCC and LLVM I'm encountering some
very large function stack size usage using LLVM that I'm not seeing with GCC.
I suspect some nuances in debug or compiler options may be at play. Curious if
there are known options which can have a significant stack impact.

I'm building tag: ath12k-mlo-qcn9274-202410231811
from git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git 

Here is a diffconfig between the two configurations
-AS_IS_GNU y
-CC_HAS_MIN_FUNCTION_ALIGNMENT y
-CC_HAS_NAMED_AS y
-CC_HAS_NAMED_AS_FIXED_SANITIZERS y
-CC_HAS_UBSAN_BOUNDS_STRICT y
-CC_IS_GCC y
-CC_NO_ARRAY_BOUNDS y
-CC_NO_STRINGOP_OVERFLOW y
-DEBUG_SECTION_MISMATCH n
-FTRACE_MCOUNT_USE_CC y
-LD_IS_BFD y
-READABLE_ASM n
-REGULATOR_DA903X n
-UBSAN_BOUNDS_STRICT y
-UBSAN_DIV_ZERO n
-USE_X86_SEG_SUPPORT y
-X86_X32_ABI n
 AS_VERSION 24200 -> 180107
 CC_IMPLICIT_FALLTHROUGH "-Wimplicit-fallthrough=5" -> "-Wimplicit-fallthrough"
 CC_VERSION_TEXT "x86_64-linux-gcc (GCC) 14.2.0" -> "ClangBuiltLinux clang version 18.1.7 (https://github.com/llvm/llvm-project.git 768118d1ad38bf13c545828f67bd6b474d61fc55)"
 CLANG_VERSION 0 -> 180107
 GCC_VERSION 140200 -> 0
 LD_VERSION 24200 -> 0
 LLD_VERSION 0 -> 180107
+AS_IS_LLVM y
+CC_CAN_LINK y
+CC_CAN_LINK_STATIC y
+CC_HAS_RANDSTRUCT y
+CC_HAS_UBSAN_ARRAY_BOUNDS y
+CC_IS_CLANG y
+CFI_CLANG n
+FTRACE_MCOUNT_USE_OBJTOOL y
+HAS_LTO_CLANG y
+HAVE_KMSAN_COMPILER y
+LD_IS_LLD y
+LTO_CLANG_FULL n
+LTO_CLANG_THIN n
+RANDSTRUCT_FULL n
+SAMPLE_AUXDISPLAY n
+SAMPLE_WATCHDOG n
+UBSAN_ARRAY_BOUNDS y

With GCC 14.2.0 I see a single stack size warning in the ath12k driver:
drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_bss_assoc':
drivers/net/wireless/ath/ath12k/mac.c:3253:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]

With LLVM 18.1.7 I see:
drivers/net/wireless/ath/ath12k/qmi.c:3546:13: warning: stack frame size (2456) exceeds limit (1024) in 'ath12k_qmi_driver_event_work' [-Wframe-larger-than]
drivers/net/wireless/ath/ath12k/mac.c:5601:12: warning: stack frame size (1176) exceeds limit (1024) in 'ath12k_mac_op_sta_state' [-Wframe-larger-than]
drivers/net/wireless/ath/ath12k/mac.c:10024:12: warning: stack frame size (1080) exceeds limit (1024) in 'ath12k_mac_op_remain_on_channel' [-Wframe-larger-than]
drivers/net/wireless/ath/ath12k/mac.c:3132:13: warning: stack frame size (1112) exceeds limit (1024) in 'ath12k_bss_assoc' [-Wframe-larger-than]
drivers/net/wireless/ath/ath12k/mac.c:4940:13: warning: stack frame size (1112) exceeds limit (1024) in 'ath12k_sta_rc_update_wk' [-Wframe-larger-than]

Especially concerning is that first LLVM one is which why I'm trying to
determine why there is a large stack size with LLVM when there isn't with GCC.

Thanks for any insights.

/jeff
