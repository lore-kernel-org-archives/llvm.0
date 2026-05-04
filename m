Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5AA3DEAD3
	for <llvm@lists.linux.dev>; Mon,  4 May 2026 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921697; cv=none; b=YorlT2l4dJGF9kDe6VK5pHi5VhSMxk3uKf0rmer+rqKtDkSpf6fYh0DjPHE8iSUBJWP/rsK2SAmaxNjYFWy2KdD09zcGL2PUwTZqChdrvJwNL2IsUGg5TiPCtRqnFGRmMJZaFe+VKetEl4WW+i8PXuEEkqxHIh+IvFX7qhbG7f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921697; c=relaxed/simple;
	bh=9XOxtD2FkxCRVp38qZa0+vWVTVVedi8ZqdizEow1hsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L1cqIACG2EujV509Fykn1sCo0BiQ9NFIdg2X9y1uaiNSpV8KO+UytdoFLE86apGBs0MquVbM3R46ybTfkA/GS/E99t1WFVEziKLVYaTbRwEuV+rqqRzz/j1o9ejQH+jOA3YHxaJLYQGbdWkAtpIyixFu8Rl2iKKGBa+CFlUh0VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nu/yXbXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoBc2Qjr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nu/yXbXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoBc2Qjr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644E2hwv1186937
	for <llvm@lists.linux.dev>; Mon, 4 May 2026 19:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QzGN39/k9vpS2EcWVM+qBeoV72MYzkEJR6Q
	UrJ9Mhpw=; b=nu/yXbXEAggVijSGVSH2hkK5whhv+yzflbOZRmeJM9IfWao+Q2c
	Xoz1ddKSClBPYDIH1YAbNMXyLjxgBWYb7iTM8XeSbEyZoabZIMS/pR6l+An/Z1O+
	nKs7DydhtrP7sL8aH7UM0TM8JSyYgtAx87oZqnTTR4/ROPSsDIQ4nCF6C9C7bkEo
	riljkVYbYs49/0CW/pINQQnC/UvgDsftCrOZrAX35nr3XOAAzBO8wpddj/8P3rpS
	EwaD5CHwx4rg2rPykIipZdkfqT4xL9GZICQTywKIb+H75na0Dacxb2dxo+tyJ3vh
	zF1wJCJzvw59gA/e9kyeFrb2C0Zu/+HATkQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvg97ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 04 May 2026 19:08:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2eba42b8dso42749745ad.0
        for <llvm@lists.linux.dev>; Mon, 04 May 2026 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921693; x=1778526493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzGN39/k9vpS2EcWVM+qBeoV72MYzkEJR6QUrJ9Mhpw=;
        b=DoBc2QjrTVeMisyqV9qsazueE2zNaI/bTaoA8F//iZzhhNE87syUcUOagGVEmdProZ
         PwwcTReNHaB2owUhrgMF+khMaymJSGPhYtwp4NqYaO5XHIYxtQdRDKUmThe4K3OGBcuj
         1IIz634tsVarsJCqt//B2lMfTbM6C20omLpEwPskaRvldkE8Kc8CywzOHLFpuOrawxHz
         bUtLyHQtVqSLQ2RkrjUtbZCgOOaugICP0ZMIbMzpH1wB00apsdNddtd2JvGbOfyte/nE
         gTjuS83/oXf9LhuJd75os+rv0jP1I6yCCM2HLocm3ZMz3HuVzpfP524AeyoTqkNeaOZW
         rSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921693; x=1778526493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzGN39/k9vpS2EcWVM+qBeoV72MYzkEJR6QUrJ9Mhpw=;
        b=S1M0+mZhaQ+PQTlowCdOmK51f15hSgeK9IAR9/JFWaI6fRI4BiOPnsE2QRuN2cO5Vc
         kQmANWEi3/9eoGAO2wtTE9G5VO39m1CmpKhkj0U+Tp90pYb9FOlS5H4zKQtUrqCqN3Qk
         EnsNWhB7VqVu8t+EKf53PiRJgMxGDCX4SwcTIAQGPYA7sCej6kGp87u4B5ybfeaoUnkF
         7F3mszul7xmK+YKVQuoxsfe8D6WkIKwuKEqesWiw1M9WPYVc9B3CVRQlqwf8bLZNCJj8
         Y0kY/dD1J5Mt47mfeTffVZK/G5SF/7BSEwc8V1JleOHM18v5w9//y5dce4u94OkPcoVt
         5myA==
X-Forwarded-Encrypted: i=1; AFNElJ/P6PPy42LOeuLzcD0yQ8i6VeekXdnCRAbPdbXUNaBM4EJss3Ew12EfUfAgTKfG3O0KK7tX@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4GuTF6OGe8pMJqmZ/x4ubQExUyJz1G3AovFI2SO3XusVkLQRq
	chYf04auNSe6Lx/ofsqBOucbTMFA4zknXnmC9k+S0jmsZLn69AejiHt7yAkjz3ABn5JNHPGZ8OY
	Hu7BdjSJXNfMq0tXvwOJtMWf3K9qUUtheR2R8mbDHLIe8yBqt0NyEvwUL
X-Gm-Gg: AeBDieuiMzrshN/4m6CoqI3/DEgK0OU6sMT98FQCIXkm+vdOCeAAjf7OOCSuHM21z4a
	AfALfC6jPnBELZBEnBVxCq+F/PGGKTauB6FV4WuERn0zkR032Nn9XZBoAHZyp9W7aYsF6ijO/eB
	PpTkRVqsqifKqAh9RGm8gnLaB/fi2kq8Xifef8ifqlcZnY0lIOcxAg2ZIm529IC0dBQUskM7h17
	wUShii3aga0lAa4fzVnrYp2MAveHCSF7nbOhBO81nfreJGj+CGitRfIo9r8ApE+mwR/7EFw/Ju4
	pEGg/JwQQJYPyUL3Ni2beP2bcdfFLNjtg0v6D/CH08GLIy0A58HPzlj/VTNFoEIH5ovpeSulDYd
	x1O98kmFnjiOQgy9iM06rdrHXHz6+tAaVAfFdRz71PwM=
X-Received: by 2002:a17:903:3c2e:b0:2b9:ff02:a15a with SMTP id d9443c01a7336-2b9ff02aa03mr94424975ad.9.1777921692874;
        Mon, 04 May 2026 12:08:12 -0700 (PDT)
X-Received: by 2002:a17:903:3c2e:b0:2b9:ff02:a15a with SMTP id d9443c01a7336-2b9ff02aa03mr94424425ad.9.1777921692207;
        Mon, 04 May 2026 12:08:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae1e293sm119619435ad.45.2026.05.04.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:11 -0700 (PDT)
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
Subject: [PATCH v3 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Mon,  4 May 2026 12:06:43 -0700
Message-ID: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4Ndu6JTyAcsZpMnHQYrRS0y5ZGehS986
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfX5gs/A1IcATYX
 xf7PQUSjkrt2KL+vT+tMSQYcalcXJHJ7bVa86MN6C4+gOD1CY+pz4ckiEbRsJ6gBs3RcqG7SzGO
 5MT9ezYkLVa4gzih9XI4wU5i9ae6urzIKgvti+49mYCyFTrzaGSee1zCLt3eTqfNLuV1ZkN0Ell
 9OjNCKVAC2rI98N5KWaISAIwdRbiiLxMJ6BAHOeFT4oIoSqceFWYSjoYqEPzLAI0Tx37Tfnzc0D
 QuSV+aAFS0lUNDHlpONKUJZ1H7gjlUAVFr0Z4ppNjHlMPTCL6xmLyCSx/dxdHHaeBt4ibq8E4v2
 afcP8K0SI6/osSg+6FHKPqbdEH07XUakrVMVBbtxZJpae4uZ8So8YFWRPVeLN7dpkpS36Gc/4Tr
 gpMoiszNps2yrv0BkCbHlvh0V4LYZlmC4eLYRx4gKPQCpKZH/BWHwkjzKJLgITJ1i9GJvLOsCbN
 hz9H5rKFFWjIpILKNag==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f8ee9e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j6mXroKpKqDHY7BEWhIA:9 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 4Ndu6JTyAcsZpMnHQYrRS0y5ZGehS986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040175

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

The final two patches wire up the needed support for global counter
stream collection while IFPC is active, and drops disabling of IFPC.

The mesa side of this is at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158

igt test at:
https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/perfcntrs

Changes in v3:
- Fix loop counter issue spotted by Claude review
- Add MSM_PERFCNTR_UPDATE flag to ask kernel to return the actual # of
  available counters in case of -E2BIG
- Proper barriers for modifying pwrup_reglist
- Link to v2: https://lore.kernel.org/all/20260424151140.104093-1-robin.clark@oss.qualcomm.com

Changes in v2:
- Rework makefile magic based on Dmitry's suggestion, and add a2xx/a5xx
  perfcntr tables (although only a6xx+ is supported at this point)
- Fix compile error for compilers that are picky about a struct that
  only contains a flex array
- Drop a6xx_idle() under gpu->lock in a6xx_perfcntr_configure(), replace
  with perfcntr_fence that sel_worker can check
- Add a7xx+ pwrup_reglist support for restoring SELect regs on exit from
  IFPC.  (a6xx doesn't support IFPC, and the pwrup_reglist works a bit
  differently)
- Stop disabling IFPC when global counter stream is active.
- Link to v1: https://lore.kernel.org/all/20260420222621.417276-1-robin.clark@oss.qualcomm.com/

Rob Clark (16):
  drm/msm: Remove obsolete perf infrastructure
  drm/msm: Allow CAP_PERFMON for setting SYSPROF
  drm/msm/adreno: Sync registers from mesa
  drm/msm/registers: Sync gen_header.py from mesa
  drm/msm/registers: Add perfcntr json
  drm/msm: Add a6xx+ perfcntr tables
  drm/msm: Add sysprof accessors
  drm/msm/a6xx: Add yield & flush helper
  drm/msm: Add per-context perfcntr state
  drm/msm: Add basic perfcntr infrastructure
  drm/msm/a6xx+: Add support to configure perfcntrs
  drm/msm/a8xx: Add perfcntr flush sequence
  drm/msm: Add PERFCNTR_CONFIG ioctl
  drm/msm/a6xx: Increase pwrup_reglist size
  drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
  drm/msm/a6xx: Allow IFPC with perfcntr stream

 drivers/gpu/drm/msm/Makefile                  |   27 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |    7 -
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   16 -
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |    3 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   16 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  217 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   15 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   33 +-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    7 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |    6 -
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   13 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  119 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |  104 +-
 drivers/gpu/drm/msm/msm_perf.c                |  235 --
 drivers/gpu/drm/msm/msm_perfcntr.c            |  638 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h            |  155 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h          |    2 +
 drivers/gpu/drm/msm/msm_submitqueue.c         |    3 +-
 .../msm/registers/adreno/a2xx_perfcntrs.json  |  109 +
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |    8 +-
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml |  141 +-
 .../msm/registers/adreno/a5xx_perfcntrs.json  |  128 +
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
 include/uapi/drm/msm_drm.h                    |   48 +
 39 files changed, 6005 insertions(+), 2212 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml

-- 
2.54.0

