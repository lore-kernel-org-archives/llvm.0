Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA3B2C0274
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043510; cv=none; b=DoDIwMgG6lxhtuTe8OmpLluN5cMqmev3+j3q3/sciOJ2v2QiHBdQvRgiYBBzFBU69ugsOFGP7OKYE6NfNY1yohMbxuDfUymExXVbpWEgVbhYAhiW/nIh6evQ9ZS4KOc9IVyJsRwkR+NVfYk4Il5F/VkBjuhxJV+DhDeiPTq3f8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043510; c=relaxed/simple;
	bh=pwN15j13SgeQDD83DFsDYUczR4ayt8mgnLWv120ds6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzAUM9Ty6zqFTO67wsqjWKQVSntFFkWC4/JD7euKMM1Zqe35cKzgOlTYCQCyU+jxuVLdLStjc5IgTntbgWHb/YjtOEaL1PXiFuKz00o2WtKTtU/csig4KikpN6WXQl16nM0fUsOKtLq91O4/zB7EFVjofJE1AhIez1BWxUTdcSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pvb9NuDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOjWlwPT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pvb9NuDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOjWlwPT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9AN1b1533272
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 15:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TQKV5i7FQV7McTrmvPRkI8jVP94ZVtnhau3
	TwLw+RTI=; b=Pvb9NuDAjz3q4XgF6OPkb5+GfqXrFSlPilaYDxNlkSs7cgQ9UYB
	MmR1rj/dE4QOurE0Qfqh2C7npncirw285BHSHwU/35/lw1/Wf+OhFkSoyS7YvJLq
	Yr4fl89P6J5sXdC+fpNL7KmJI5rM0ep3g/ROYPGOBbLLlY5fKQPHMmfVKxXmKIkJ
	rqVLd8h0YO+coX8d+lr/fsWsoPJh43KHJ1un+7md4mJIQ7nfRLT9FS3B2ewd0MsV
	bxnU69jzy+RF/8oMm9QL0IZEDMOlaI+qZl35dpsFVVrfOLrZ/8e26K7ovWoa9SlI
	yahIpcGdNjs1f3oiFdhSPHZ1rHOJoeiDJdw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26mpby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 15:11:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f504f6b75so4463710b3a.1
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 08:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043507; x=1777648307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQKV5i7FQV7McTrmvPRkI8jVP94ZVtnhau3TwLw+RTI=;
        b=KOjWlwPTd4+GK0yENhjJ3in76jSXXg40Uz8FOtXoclmFZ3YSQVs4goSblSOkmjZ9NF
         P6WaBkqtgyt6olG6p0VqdCMQ4+P4EMexNCet8P4fcnz46Tvn220oZ03wR/kUgV3iyj5N
         6lPeUU25g0Od+8RJEZoNKjk72C/cOp7S+vMs0ca55/GQ8sCfOtp2uzmAG6QiLuGBXlq+
         inNGifiJzt3i41cwU0Nd6V5lwqGXY0pe1N/887/BiBOwQNLXFwAfdYmh5VUUMBhdAR1B
         iKGB0b5L6/kAEDfukhG2UJd5ALssDv3ESkXmPNCoBlifkF1YwvbzTjiIc3cHSXt6ogfz
         BDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043507; x=1777648307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQKV5i7FQV7McTrmvPRkI8jVP94ZVtnhau3TwLw+RTI=;
        b=rUw7g4yhSlI0ErK4y92adSVz3KUcK3b9T9GiuYXgaZCPrIronZj4huC8GlS62NMtBx
         rrPaHaJy/uZQkcNlrnUqC+2whHuLTMX1mKr92ERepd8O0KjOdqVE45UIBrH4/ygnjWwL
         gpaet395bA2Xp3+keAE8AjBkQRVF6ZL1cf15mUSTaF/Ken4wz/hTk+51mQ8eA8ybtEUn
         1vTKhUup/U5yzgaqGYu9CKkGBnvXM3oaNpZgZO7ns+T5ciC3d+RhpvXTjglCuuigvQu8
         k9Z57WLJC/y39r4mllTMG6oNaGb+vEyNum/rWY9bouCrhZ0VFjYGBnhpLG9Q86KCP42c
         lRTg==
X-Forwarded-Encrypted: i=1; AFNElJ/6Z4UsYf1n8VmJle1QeBvX56vNqZK/j6wt0kh0X+dBv6dQD3+zRYxdZKMqwk9DvHJEbEKX@lists.linux.dev
X-Gm-Message-State: AOJu0YwCujG/nJzP3z4//+Jtce1WF3TF4iQLyu+4P3VsyZU2kw7fNm0r
	cxCb4iFWOWzZJs/aA3gZnClowH21Wz2xcLz1mYnoszb8u2gvr2LLsPXUsqo+Z90/tLtPYGma97h
	l2U55Xm7dtZHNM3IxA/5rdFkn6A98tE+I8kJ7/wvzfv/Vkfb9intxwe/x
X-Gm-Gg: AeBDieuAg9h/+okMQV+l1sQ/nbSuvIQ82Zf2DBs3jInaiOThXJKGNq4a1GLFTaC7Ex3
	a4J9z6JG4K6QW9tJKVkcmvMPkhgyG4igN3uwta2wVYZFvI0l0y9c3OcN5M9Y7/SnYRr/qCNHH3w
	O/pr7rt7YvwkvdZa+JwK+SkNDaQlyWnTVrqTas19+csaXld29wq4pyv5ifMSxYIwRllOnnX8wYL
	h2GlyJzJrlmxoOorWWrjhdASt4uDgB3fHrRq8ZWgRUNkclXAe9BINqtsuMeOqpstD4cbVpLQDAf
	nx+Cac40vFLikyPVsiK+1UTFQO0nycbkBkdwMdyGWHodg6/MlW1+7x6J7OaiZeRM+Hot1ulAsbM
	5Vves7BwA3e10YLKCkcdwR6v0V3cT39UNKIox5YCOdN4=
X-Received: by 2002:a05:6a00:6c87:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-82f8c80e36bmr31088708b3a.11.1777043506334;
        Fri, 24 Apr 2026 08:11:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c87:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-82f8c80e36bmr31088654b3a.11.1777043505645;
        Fri, 24 Apr 2026 08:11:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24084461b3a.57.2026.04.24.08.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:11:45 -0700 (PDT)
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
Subject: [PATCH v2 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Fri, 24 Apr 2026 08:10:35 -0700
Message-ID: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DZ2gTw6uxMIBor-GZD_UpZ_MfiG3Rmp4
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb8833 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j6mXroKpKqDHY7BEWhIA:9 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: DZ2gTw6uxMIBor-GZD_UpZ_MfiG3Rmp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX31iV707Wpnyj
 d8sCll8jS0yaHdH4Iw8xsB8nWHsuXw5YkxPNGTbJf8zK9a4G2T7taBcx1qM1FiVjfdtJ+/8QGFR
 HgptYeVVQTWKyqJP8EfCdF+0334wr2jIJUIPW7osJ3V5O3q5ZfCOk7sXh4vGoiPNJBR+nSJMEdL
 etSAHCNOYkC5NRd5wi9LUXNesr4psVtm8de6M7uTKNpTPs3M8qbhoYWCBPldcs7yqOPcS3CZqnr
 5/j79483QdL4fr/GJrmX6FOWoZZwwD8RPFu6RTBcZ8BJVdzvqiXVrUgMdqeqBDqD32QD5SqoqrF
 wIB1YBTnPPuJl7sKEQO3yf2egyqrP3Gt1F/MsMSyAVNaILsTWFTiDBJePCUv91loBIz8OfaGmUJ
 YLT3Vs5KAcS1xEXI3taXfyU+sSde5jopO3loQjFcE/9THWPcxGRi70yPDKgoUXaoBxNpoaHKHNT
 OXa19+rZ8xdCoEKgHgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240147

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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  205 +-
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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  620 +++++
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
 include/uapi/drm/msm_drm.h                    |   41 +
 39 files changed, 5968 insertions(+), 2212 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml
---
dependency: https://lore.kernel.org/all/20260411150312.257937-1-robin.clark@oss.qualcomm.com

-- 
2.53.0

