Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF0A3F9FB
	for <llvm@lists.linux.dev>; Mon, 20 Apr 2026 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776724022; cv=none; b=IXr1F8ljrNK3Lr+0T1GwzrjyyK/ujX380zR8QuYphyjlL0nh8POp4mnLZ856aHBT4jx0PcqV2byahaa6w9BHUKVMUoCqmgyQuHZvsMIpVmxw5/MADc2OxADgRyheP1m5olbLs9AfwdgsvSmJ6p9waIIwdMahVvIK4wkGfK83hEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776724022; c=relaxed/simple;
	bh=NxSB2eJ6YgsZoixGZYAupeJPNn+KiJdRXm6eMhiWPKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nde7Vd65pxukryyNjX6QW/EKXz13hkST48YrfJgeGB7u95OOtNS5QxWFXIqvSAWYTvCMfCqu3JbCHceyq0BgB1nxlNnxyoNKYMvgsjAxzFHvWVC1KNjgJuWFi6oJOsDnVRcB4bzZXlyrJX5jWT9yI7Hxh2TKoHA2uLKe7ELQXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8RgU5bH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPPtyyJh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8RgU5bH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPPtyyJh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KIRLOW3212117
	for <llvm@lists.linux.dev>; Mon, 20 Apr 2026 22:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q2Dqpg4OdB+GYal1kt4hriA4lBdfXQhJrL4
	/ifmzV4A=; b=X8RgU5bHAHBYX8xmpRu/AVpa3AGhOPNttldsL0KaxFs2yZxz6gC
	3GmCNXCaJ/KVb6R7hCHZrZ2r0O88FkRXs4G+c3C6Vz8AQfdUohXqvlEKRVzH/FJP
	wuUzBllWTp0a30SoPfjxOrvKAub9ccUAvL/TfRLhz4xMve0w9zd5usg5AxhOlYGz
	wuS8ZOYdEMPKttfbAhuGJ0mNyNuSG9Fspx/NQJti7u5IE97dt/FK3Gpr4dH2eiE0
	JA6UN76AmtSg/ts42jLZnQS+F8taO3heyjXMz8rWYp+oxMf+IhSaK+RrMftpqBDg
	MsL1J+CarGiDFCyiVlWWWJCISOYz6PuZAjw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfkemn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 20 Apr 2026 22:27:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso1622564b3a.0
        for <llvm@lists.linux.dev>; Mon, 20 Apr 2026 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776724019; x=1777328819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2Dqpg4OdB+GYal1kt4hriA4lBdfXQhJrL4/ifmzV4A=;
        b=QPPtyyJhOk2mAfbDUo2pR8lo2VHfzN59KeLQlu9Z+7awfqwR2GXSE2Yqg5W8QwBXUh
         uTNRSsHrRXcVP2dInAPtUQApR1HYpBL2F0YPEB5bfLi7hcm2Wy9W8Vhfy53d/OWreGW/
         JbKI2w09uVeB8RBMSWg3F10DFfV8UJfVAe6pis8kyPd0F4wdepeFGscqCOANDI3mvrHt
         lHNqUHYTaHXVY/wfr/WTPKeKAA/MJSfSAEIa/OAsbujLMjY3wjLFKnnTLRxOm9mw1KjN
         tj+oSsETDr6rY9/VHcZkfKy1b3gcnvGVISWs0lHbsh0oQugBYaD8tpTbntYhRiL3dp59
         wUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776724019; x=1777328819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2Dqpg4OdB+GYal1kt4hriA4lBdfXQhJrL4/ifmzV4A=;
        b=AsTy35wMriumDV5PfzA/QSsWu6g1EN0rd3Cj8ZmtmiC4R5WJs8E6nXgR9+Z6EW3dwv
         RmNHbFkjYFMWbBETQhr/8YJ8S0Ij5COSwUW4nFnxxxB8l3AzqXi1k0wCuD5+V8cVRyIC
         CHru4xLm+EcQ9WG9x5Ba3O79O+P7kjku7okMxGdNbra3Nqhy2kDKBeffV249bWHipy8S
         Lsas+wFiXwAB0OdowZ/wuozGALkWgqoL5NudzJGakSFgOrK8y1wptsggN8S721Vi/LdH
         0dsVzufcIjHWAuEoNi3/TVmSr7epyPlaBktZmhXcICmjmbExrXqiVjhSvPiswjfNtQdt
         K+qw==
X-Forwarded-Encrypted: i=1; AFNElJ/o/D8HBHB0QD8s8kotNtTXWt5WWOQPG2X1+QNFesQfKw+aYdO1QCQ8Dqxm4FYpEOJi75Ae@lists.linux.dev
X-Gm-Message-State: AOJu0YwYETl1AI0MjIAHktJSXNuCL63IPHlZj10dqyCzbXD6itlcV6Bt
	8vcCNjfNU+ZWl+YXK2q3OTBCmQ3NpudWfI2i9sLXBCJzYBz7XEdlL3mBQCjG6s+8cs4phhbPuMJ
	uq0S0iji5F2HZSruAur85oPE3dC4T5jkgKTR8vOlAuolR3okwHf2ljLzUxPMEBrAI
X-Gm-Gg: AeBDietQG7DzZg9yiD9GypB7kH3+N48IO+N5Jv/mbyfcFZlxbqSAAntIy8rHAw7tEP/
	lI8HEtVLQU4PLohGlfy3ho3SI+Po6ykGzBqMBC1ilEFVMZqfahuTVzEdzE+MnnP5gQilBqw6D+g
	XnBuC1fdn2j5v8uQ8L0vYWz2E5AJsgWJ4MPCrc+lWwAPXX6wM5N3eDXFhLMzomS0IVXBIK1ofiZ
	kdnxwl0OkXt3gthh0ng9ax8sjk/qu+IQSEobFuaniOQbAwgktjprVd4FnXC4CrGUiRRmdLMiBfZ
	it8gsEOGMk2z2KiNmfaKLfVwTBq+oYVcGqx0q1yuaoLh85NqZnUn2W9M9rzv8ICU4vxgaDJlC9F
	ctnH+YgjJIgrVWa7eBPj2K285RFAXd1W96N5itfoH1PI=
X-Received: by 2002:a05:6a00:4186:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f8c89e97fmr16027061b3a.11.1776724018967;
        Mon, 20 Apr 2026 15:26:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4186:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f8c89e97fmr16027034b3a.11.1776724018495;
        Mon, 20 Apr 2026 15:26:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbf0e5sm11610522b3a.28.2026.04.20.15.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:26:58 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/13] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Mon, 20 Apr 2026 15:25:22 -0700
Message-ID: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfXzH4X4UzR073Z
 NryqFfY7ujdnQaf57BRIJrIysFK7TgjS1oKJ6m3j5uKd2LJlOELwdzxrEcdCiLsNxzYeEsBg7T4
 QmmzH82MX5Z1MOFJ8Qoo2IIe2qH05/m5YKjNhdNgWJePjnZEaAVudnggI2nGk7C9MeG3H246wdO
 qbzUoCoxUSE7OAaLTM0KS/ZstihyVQI3ZSDP0TXMr168SuO9PuulaTUaeK9zN/bracZenb9BE97
 a/kOlv0osx0aRa4O0OhYtKHDHRSJ+7rG65pGUJoaVZwBTL83rGwQhVCmRYElSPCXVJrtzJ+lImo
 Dt5hZvfRl69BcZjZgb3n0yffMUV13ryTXOlWna8HBBGHbxVzCKROWITFAO1rt0BfCuNl0Xe6cc2
 0gboWSA6qWAkn8JnqeOkmS/M2dru+76rUuEmZUCZJznHVJOos7gkPBs9pmI9T+DiruomX3M2Jtw
 uc4+SF9TT2+HkQoQLGg==
X-Proofpoint-ORIG-GUID: XyTyeK1-JONmZLQQV4mC4sG6XxrLvjZv
X-Proofpoint-GUID: XyTyeK1-JONmZLQQV4mC4sG6XxrLvjZv
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e6a834 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8 a=hBlBM7czq62D-dRUyHYA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200220

Add a new PERFCNTR_CONFIG ioctl, serving two functions:

1. Global counter collection (restricted to perfmon_capable()) using the
   MSM_PERFCNTR_STREAM flag.  Global counter sampling is, global, across
   contexts.  Only a single global counter stream is allowed at a time.
2. Reserve counters for local counter collection.  Local counter
   collection is local to a cmdstream (GEM_SUBMIT), and as such is
   allowed in all processes without additional privileges.

The kernel enforces that counters assigned for global counter collection
do not conflict with counters reserved for local counter collection, and
visa versa.  Since local counter collection is scoped to a single cmd-
stream, multiple UMD processes can overlap in their reserved counters.
But cannot conflict with global counter usage.

In the case of local counter collection, the UMD is still responsible
for programming the corresponding SELect registers, and sampling the
counter values, from it's cmdstream.  But by performing the reservation
step, the UMD protects itself from the kernel trying to use the same
SEL/counter regs for global counter collection.

For global counter collection, the kernel programs SEL regs, and sets up
a timer for counter sampling.  Userspace reads out the sampled values
from the returned perfcntr stream fd.  Releasing the global perfcntr
stream is simply a matter of close()ing the fd.

Since the counter sampling is done in the kernel, this prepares us for
not having to disable IFPC while global counter sampling is active.  But
wiring this up will come in a later patch.

The mesa side of this is at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522

Rob Clark (13):
  drm/msm: Remove obsolete perf infrastructure
  drm/msm/adreno: Sync registers from mesa
  drm/msm/registers: Sync gen_header.py from mesa
  drm/msm/registers: Add perfcntr json
  drm/msm: Allow CAP_PERFMON for setting SYSPROF
  drm/msm: Add a6xx+ perfcntr tables
  drm/msm: Add sysprof accessors
  drm/msm/a6xx: Add yield & flush helper
  drm/msm: Add per-context perfcntr state
  drm/msm: Add basic perfcntr infrastructure
  drm/msm/a6xx+: Add support to configure perfcntrs
  drm/msm/a8xx: Add perfcntr flush sequence
  drm/msm: Add PERFCNTR_CONFIG ioctl

 drivers/gpu/drm/msm/Makefile                  |   19 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |    7 -
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   16 -
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |    3 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   16 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |    8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  142 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   32 +-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    7 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |    6 -
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   13 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  119 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |  105 +-
 drivers/gpu/drm/msm/msm_perf.c                |  235 --
 drivers/gpu/drm/msm/msm_perfcntr.c            |  609 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h            |  152 ++
 drivers/gpu/drm/msm/msm_submitqueue.c         |    1 +
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |    8 +-
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml |  141 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1300 ++++++-----
 .../msm/registers/adreno/a6xx_descriptors.xml |   71 +-
 .../drm/msm/registers/adreno/a6xx_enums.xml   |    3 +
 .../msm/registers/adreno/a6xx_perfcntrs.json  |  105 +
 .../msm/registers/adreno/a7xx_perfcntrs.json  |  228 ++
 .../msm/registers/adreno/a8xx_descriptors.xml |   96 +-
 .../msm/registers/adreno/a8xx_perfcntrs.json  |  240 ++
 .../msm/registers/adreno/a8xx_perfcntrs.xml   | 1929 +++++++++++++++
 .../msm/registers/adreno/adreno_common.xml    |   42 +
 .../drm/msm/registers/adreno/adreno_pm4.xml   |   50 +-
 drivers/gpu/drm/msm/registers/gen_header.py   | 2079 +++++++++--------
 include/uapi/drm/msm_drm.h                    |   41 +
 36 files changed, 5634 insertions(+), 2205 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml

-- 
2.53.0

