Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64DC3CBE71
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283534; cv=none; b=IFYbHVNEvyTqmM2ZpWMl1rFKssORqjXzWXoDQcV8tgG4C6S/m4ffviZt9RHDwOPSTPC3w4L3CNopq7hdFjNahLMjH46eQt+z3XsO5ZtMrDpcxqxLREyrEST527mLLDed/ZirOVt0TQmE++dAR7+oXxmvD+XePTRbP/qMPkUICBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283534; c=relaxed/simple;
	bh=GkRAc/iqBkssbb0Qz6r1/idE25aPKhC6RWy2LnOVTro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOV1Apef6oFVNa8BGEjWZDj6PNT9MsLNWgleymEMuNeMm6BV8AC3l/z4Yx03XzEWEmGV5YzH5HWnMV8hpi/9vWuBX5Q7RoDQFSUOCGRwuZvS2Uqb2ulvWjSVBWxX0Vy4cgrAi27fykdh3Cya9b3wtRUW6nMXD1NBfiURvfGhfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgB/Xtw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhjcDMXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgB/Xtw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhjcDMXe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oMZL1177868
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 13:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCEmLlJcOPXk8/JTmmah8TU0VEldG09aunulyVTkeGY=; b=HgB/Xtw4kvsqI8mK
	3cxTWf/xaulluPW/ZCC5DnOVYXihFtZym+LxvjJznBHhI6fBdpXFMGtYV50Da5Tt
	dQ8ehEmfXoZJOKOaFWiLgWwsIAPoA8itfShLa9li4PiUd7zX6ZhiKB3pCg5SBuUn
	DZcWEQeyUFKyFfyXl4KZMFmSjk7EdZsYzEtSiUvvmThQQFsovzOcdsBBqjRvd6lA
	quVP9hfsP3jQi0iFHbj/x4Um1eZXNglt6IE05PZ3g8TPYiT5FU8RWcxGX2+GwtFy
	5hva4FySqhWZdk9emdCksZLvrbyicGW6hh/BKVL720Y49g2m0c38SQImPmytINuJ
	8qplPA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6rrje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 13:25:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-636fce7dc8dso3112754137.2
        for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779283531; x=1779888331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCEmLlJcOPXk8/JTmmah8TU0VEldG09aunulyVTkeGY=;
        b=hhjcDMXetygshu27/svKR3+b2IbpDJEjEGPbKKomAIsmEm8Avv7uSPXomKRAuytu6i
         XgcD2c78aVQ40N5C68oMhsxBMDi6ZbIo/cnW3Gq4cYnGJJ83RN2QnJzRZ8cQH4BWjOYc
         K/BwsVizM8bjc+ryCMf4V6deNedMZoHCmZRNDrBDi3ddiSXkXpz8Skz4Gylx/TR7lDmV
         WMNfKuz0s4xpqZqbpVHZyMFr73JZDSD/JEXkqM3DpHmniKb38Bimccuye2PeRlSthiPy
         Hs4+GVz7zXUM82pii/YoPbDIcUL0S42pkb+jgIZ3o+cSOeCG2ppBKGpdgiRuNp/topr9
         hr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779283531; x=1779888331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCEmLlJcOPXk8/JTmmah8TU0VEldG09aunulyVTkeGY=;
        b=KV66gfZ5daEVkT96alva244UnrSIZ/R8DWjDUOmPHPco6UdAuW9o/2rD5DY0Vuhzhd
         h4dJCqHCXjcigF3U6P86AKvou9K00yBWF65DmZCQIJr7TnYj4YzBsP9qFNI14m5IRcY3
         5m79Bk0anjjBmKdyaC5TvXz4Yh4OtZduCyAGoS/3As0fljSMJp+Lc0/0Tu03S16iDx9q
         mF4v0fUG7C3EzDMdKBKlV1qgeVbfy+uHIKS7GOHxBNzo89eFOnj8IROtd9tstefgAwKR
         u44WBFiyluiMqPHxSyl8oksBNmsGw4N2pJ8aWESVygNzAfKMpP+6RPBE68C7U+g8+M1R
         P84w==
X-Forwarded-Encrypted: i=1; AFNElJ8olglp4TkT2nssvJM+o8nUVtwK3BIr2OYXiADB3tLWx54lBk5gunZjSJWTCV0asMDDZRgw@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+4ajSBiaUoO2SYJvLEDkDaEPF0gWfHwFN08Qu9KYbcM9Hei2J
	C4VmEONoDs9DPO994Ll08grkonMQsqcYqHmX0j3rbSD+Xt0kTZnnpehx9JD/o/AITB+KNO2hexX
	um7bvkftYmREvRiwrmtjVBgQUdd7/hjGcgbXszcSDJxnfVfX3tPtjHSzI
X-Gm-Gg: Acq92OFdxGK/E2IEnBULi+xO77AHE0ySotisdO+Ank/1rUdj/A0EhvQnoNWHZqBVo8e
	JYPHhrCbvk/k/OOl/QR4svGXBfhCaF4V44W0a9yJT0imXzeYDYGd7S8d0ZgcPzXqjoe/eRPp9Df
	pO+tiPOvrmhJjcIYqOSfwPYECc9NJbIX9u9gTBmRLo0TbASBG+ltQ1OhnUlGWJQX6EM+9Y+cfh1
	sWtzd+eDH9FbexEIsUjoltJ7OUSsjZjwYuu6/WmjJEHOVlB13rVWqx3hSJrJOju78qpPsVAjNXf
	GVFmXvtwoGA7url/7gwvVlwKCuv8x/C+GIY/HgM6CmMKFl7aRlO31Q0G7uzpRdgu74YuMysMkvR
	VSvn59jV+wKd4M7cINcxN11qGcmec++vu9+Xc33ilwmf5FUD+Fo4g4+rAotxJ
X-Received: by 2002:a05:6102:d88:b0:631:2472:e832 with SMTP id ada2fe7eead31-63a3ce1bbb4mr11793362137.8.1779283530961;
        Wed, 20 May 2026 06:25:30 -0700 (PDT)
X-Received: by 2002:a05:6102:d88:b0:631:2472:e832 with SMTP id ada2fe7eead31-63a3ce1bbb4mr11793237137.8.1779283529973;
        Wed, 20 May 2026 06:25:29 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9ec3:885a:6d78:48d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm127925495e9.17.2026.05.20.06.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:25:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] gpio: xgene: allow COMPILE_TEST builds
Date: Wed, 20 May 2026 15:25:24 +0200
Message-ID: <177928351978.51371.6619452121180197526.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519005958.628783-1-rosenp@gmail.com>
References: <20260519005958.628783-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CgMfcc5KVr8lxk4WqBjH-d-09nOK7Khm
X-Proofpoint-ORIG-GUID: CgMfcc5KVr8lxk4WqBjH-d-09nOK7Khm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMCBTYWx0ZWRfX2PWoS4Z+wLtH
 huBhF+SfcSCxJd+JPFVw1Xm1DPq6QJINv+MhAGVCyFDpIpDvx5keZxVBDFO+MpFJWH5euzUeGwj
 AhTer/4P6BppLXE4bu1sIXfsyXBF4cIi6G1S3U+CGgGHlNAwSe6G8rYfArBInzHTbdN3Q9GBn8h
 tA40q0TU/Fn6O7n6hHXcZBvzzestdquDlJn1B+4nobQTo9FmnTmeE8+yQDpFUc5pLjrmtJZbBxC
 H4TfuxN4KwPROj/t/OurkL9YuR1wwzVCouY11oczHp7X4S+jX2UnrdKFqD4iDHmm3ZBIuMctsJx
 af1zjQJLEPgGVv4ztVHlLY4jtWE6+yMwL3wv6uYidTBvmXzcMAjupB6ZcR5MdbHlSL4noptMLNd
 68rouCdyDIo6IvdK+J8JmuYXC6aUm8mpbc+Ib/Cx1jD7fTdUynWWPcH5Dxw0k4cglJyZW3e84sm
 6zDy+DpgDl1GVqZlkzA==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0db64c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZMuc1FsqzX41soSqlgcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200130


On Mon, 18 May 2026 17:59:58 -0700, Rosen Penev wrote:
> The APM X-Gene GPIO driver uses generic platform, ACPI, MMIO, and gpiolib
> interfaces.  Allow it to build with COMPILE_TEST, matching the existing
> coverage for the X-Gene standby GPIO driver.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/gpio/gpio-xgene.o
> 
> [...]

Applied, thanks!

[1/1] gpio: xgene: allow COMPILE_TEST builds
      https://git.kernel.org/brgl/c/c7b929fe289d6e5118954f8327c143f8ad707a63

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
