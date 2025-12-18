Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92271307492
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766035389; cv=none; b=bnOKfRtf2BXqhfSkHkdo+ulZGGzkFAEh7WUHZzbQO7eSoESMFwLzW2RTURyMpkpBNey/ne/D7g2Cwkv8ZIpzJE6SiD4T+OiznV5JufJhzBlHf3hgiT0sselxyljnu0YTmu1oRBSAGrnpCgS+seZUnBh4eBLxA0oT1EjMARsvRjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766035389; c=relaxed/simple;
	bh=RQx9EjbZzA4ei3NX9t2BJHxX/pI0/xNzFou4zzkIS7c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZTqrtOvSfaap/iHOs0W5/7RqWs4uXpPOw3Fr/cxCrdzaVDAgPNUC1tEVwZMau5WZ9jsIjJN4mASueUt9fF/6YW6hq7tFRRMfEl9ade17LJ4o71/+yPnwyd+MSlXjYH2jNAnH4eKUlI1GjblXOSfQqWhH2eAtY0w4DOojdo0/Bcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+yJczoV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6V1pLKl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+yJczoV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6V1pLKl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YUID174240
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 05:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	enmCRQ5x3mh4iFRLG50m7N49AT+rZ2yyvL504EZOAY0=; b=B+yJczoVTa48n6Dq
	aTtBhDqYq+jTEvR1g0nAO5TlwI9mnxMUXbfOc2pgM2pZ0ox8qH77D4Ny/hL9jLHA
	bcxreMjfM65879tY334/iUfZFalhUbegZp0KFDqHktADR3wU3B+q0dS4fRZWPBXl
	Y1iy6xfGm450ZSWNeylJZp1anHSxrYsb6HmB8pE7BQrLIpncDG9JFv8/LjIvN5Zw
	nVB93d5+3XosyN3bW7PMN93pHx0hD1OPKkodecbCxw5W+e4E5Fkn9Fc6jLLCOkDj
	tJT00dKdpDludDHuXyyg1jPMUVRgNVIugCgzy0xPEvPpmSC+/FLAVMGIePYXTnjk
	9iWoYQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nms7r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 05:23:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab8aafd24so965652a91.0
        for <llvm@lists.linux.dev>; Wed, 17 Dec 2025 21:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766035386; x=1766640186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enmCRQ5x3mh4iFRLG50m7N49AT+rZ2yyvL504EZOAY0=;
        b=L6V1pLKll+6r2OYH8ZGsnAiHvorkhUxO7PaWcrxlJ3dEd6l5sCEWj9JG507t/z2JOk
         eYvYQqQsXm30ZcnO4WaAI0kaG9kk1eSaBdjqRwAwdFkCvs3z5cNukFh2XYgCrrDewY2l
         pKqv+Qcq8ugOpv5ZmCYX4zzcxAj2+QzpKyUyTzcH40Ayy0kD2VOQ1wLCSxgNwqEcMbD5
         sQsnKNmor0B7usCboUtAWY/AuAaHaRSZ8xfG+hAMOeL3+JZ+ds2/9faHgcl2R+SBrtcG
         /DCIxA9zMAIWex5E3btCeF3b8K/xvCREitYSiSQrYckdhUloO5kEvLCndGxGPV1kfAJJ
         quxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766035386; x=1766640186;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=enmCRQ5x3mh4iFRLG50m7N49AT+rZ2yyvL504EZOAY0=;
        b=U9YazAB/9nsWS1qOBkumpMrkHW+ZowAQ68ns8/XRllaLoTMe7qtlTmtGxu6VTEVspy
         LqNm70gl5D4Q8T54FOxEh4FZIljplvV54c5Nbwuquare/AiAKBmWfn3WVQIUiaQs1uU4
         IxtPVV099agPsEhlutIm8QBMVHWYD36OGHm84F36G2YcdYJ4Jo4WBy6p7CQ22jqdOONv
         UOJ2iByWWsLP/ILjRnj8e6CXy+cKkhhBz4PXf8g7R+vQG5/tmtpQ8/OSCefXrVjMrT6N
         QO435yW4jKd49iEGLbiYDcMHLJNoYhzNT1RgqToPVsNJZy1AZl/b/Id8/uwJTEm37Bhn
         dn5g==
X-Forwarded-Encrypted: i=1; AJvYcCU8qDx5ZMAF9FQzd3L5AD1AP3WeoXyC19PhylMUsK+0WS0TIkhDty1wbCbiCbDq1jzH35WH@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpmo7n1ibmhOxFOaP3v7DtURGwqaDRy/A6vy74PVAckEYipRlw
	RFnkXFoSgUmaCNzr/Vj1HILrDMDcyFw40Yc1GXZE87tkF9lyuDey/30fw56qypOuvV9MIT6BcfG
	AuU2rMWxlibYOesKjJVBzzzMxZ+rtz2iB2wniMeVifyRLHdkb7HG1roBm
X-Gm-Gg: AY/fxX7pxFo5EP+T1IhodiuY+Jqk85Of36w7rSTLqlSMVWIJGRsPPWGPshnyqBpsrl/
	kYe+vgzJ/p4+ia33clnErsR7x1bB/9x4/Ik3ko5zsgBmCfAmwKkh2xSXnTuoZ7aGe6t+8GdnCzY
	H90SQ1t+Jqj81bK/d+moXOuR6PdL9NT3qmguSQQhmm+vQ0OG3QZpMzNcCf+SR1XxivsQVLcMKQA
	Sa1/kYKyhIoVH7zjviXfpaNeq3luQD1G6NTHxEQyORlff9kHlePLGqFGqw+yEu0ZgHb05pxzJxO
	REZ4M0rRqESa3dxshK2IK1cuOb7hoLN3wekUgw5TBugURidhUXazepjaZyLJxu5v7rXO1NTXVQk
	92M/ItYwmsLg=
X-Received: by 2002:a17:90b:5188:b0:34c:2e8a:ea42 with SMTP id 98e67ed59e1d1-34e71dbcfc4mr1900818a91.7.1766035386082;
        Wed, 17 Dec 2025 21:23:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1uif5/k+kGaUzokc/1cPGTxk/yEbsq8GumAvceKN56qoZljhicE+tTvI4yGX72oVtqPiFZA==
X-Received: by 2002:a17:90b:5188:b0:34c:2e8a:ea42 with SMTP id 98e67ed59e1d1-34e71dbcfc4mr1900791a91.7.1766035385621;
        Wed, 17 Dec 2025 21:23:05 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dccd14sm1175108a91.16.2025.12.17.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 21:23:04 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
In-Reply-To: <20251014-rcar_pcie_probe-avoid-nocfi-objtool-warning-v2-1-6e0204b002c6@kernel.org>
References: <20251014-rcar_pcie_probe-avoid-nocfi-objtool-warning-v2-1-6e0204b002c6@kernel.org>
Subject: Re: [PATCH v2] PCI: rcar-host: Add OF Kconfig dependency to avoid
 objtool no-cfi warning
Message-Id: <176603538085.6580.3625113457403612097.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 10:53:00 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 5QDqnR9o9kOOAZBohgpgnUrwXPWZs03p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA0MSBTYWx0ZWRfX8Z8DcjokgPJ+
 +wK/O9szU1hwICk0QpHbN+flGapgC6K2dLdqZy+ZgOFY4Em9XQHDNk4RhuX6DjFXqtdqLqroY12
 vIlNcmk50NZ7AxWyTdTcNXmBvbRK7lT64cy30LXRRyB0ltZebm2u8+BSUKXf6DdkQTRcU1OUdvD
 jiD41W9UGQn9QeBVdzV5VHR+MCYnwjxGJBpuDx8Av3j3fvd0fsxCAyQn5m8L5eUSBmloFBDrUse
 V4oYCpZntsUEmLtoLEVrmxPEHfbqRQclSFN9oLmEOkLhYcZ34HMRI3wz2e+zbhh5KEXXEEZFLLD
 LXr7i/i2lWwbymo45zYLvZNKzs+c4TTsaWykm3y1/BmBQlg1T7kufquIuSy1D+Y4dSokP8L50Cq
 qzBAM2Zj0IxHzXtcjcXaieNoG7kSYA==
X-Proofpoint-ORIG-GUID: 5QDqnR9o9kOOAZBohgpgnUrwXPWZs03p
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=69438fba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=ehsjDiE4JrN5eREjfRcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180041


On Tue, 14 Oct 2025 11:20:27 -0700, Nathan Chancellor wrote:
> After commit 894af4a1cde6 ("objtool: Validate kCFI calls"), compile
> testing pcie-rcar-host.c with CONFIG_FINEIBT=y and CONFIG_OF=n results
> in a no-cfi objtool warning in rcar_pcie_probe():
> 
>   $ cat allno.config
>   CONFIG_CFI=y
>   CONFIG_COMPILE_TEST=y
>   CONFIG_CPU_MITIGATIONS=y
>   CONFIG_GENERIC_PHY=y
>   CONFIG_MITIGATION_RETPOLINE=y
>   CONFIG_MODULES=y
>   CONFIG_PCI=y
>   CONFIG_PCI_MSI=y
>   CONFIG_PCIE_RCAR_HOST=y
>   CONFIG_X86_KERNEL_IBT=y
> 
> [...]

Applied, thanks!

[1/1] PCI: rcar-host: Add OF Kconfig dependency to avoid objtool no-cfi warning
      commit: 57833f84f6f5967134c9c1119289f7acdd1c93e9

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

