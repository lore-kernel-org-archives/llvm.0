Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CC836309C
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471272; cv=none; b=EsoAQ3PdbNG2gI1IjDlQGOgIFI0n0oJymCnQ1k7na/okTsOZ4oBJ+PJoTjq2vFfvzugYgg3jBKtTsqnLww74g1WJiBu9N4VkVbQE4Z6HhhxiUrbSs4zfkuxQQZYjuMKEXl4zfnLaXJBijtogY8kKOk135FUEi1p6QTDjVd5UzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471272; c=relaxed/simple;
	bh=mpshK+vtNNZ0SyWcLUB0XI/FtnOs765rXWoHZg7X0I8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzU88uGAQFe/LO3eS+uY/LzY7AUGlKl6siyIlLZ2EbYp83JP4u3u2E6qEz8YvgRp2Q1k0Q3Op0I6ZXLfDR+e7W5OvUkWOctMyjj9Hgi29SzPGMz49yqK7ULvp2mbBk6raDPIf6mdvp+f06N8Ib7c3Q7UGD5AFqXrsUWGyZFDja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oU4/ioBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B5d5ca7C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oU4/ioBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B5d5ca7C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpmhh2125379
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 17:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pqGG+UjGql253bxtTVKZZbAD/GfaNDndOan
	MEIC/0d4=; b=oU4/ioBBU8q2kkfCoBDSLPqj7jwdVuc4KsFxbtKg/OhmHE6o7zL
	q3wuJcQe8Gwwh0gCjXPbXG/PAGBvcC+UCYWy3hIsNz1nsHQjUUxdO0A+BRsrBmxb
	QWg+IP5r42fbGzlv6Wp6HnnE0WIMPjJuEeaC+p1WsIejCq/7n+AztR1JXwmJI38k
	IEmhKmB0UBSmumUuy70p5kus7LlW8AnI5v/cf2cFgHrd2HggELybr25KjrEp6TmF
	x/uG0k0aaXecY0LC3ahXJhlGEnvPBYD+xUktmBTjr3HitHNH9y+T0wKvJgbdXVcB
	Sa6YnoF+MuqNP8F3kPXhH2vboozQJVMgNyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard890ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Fri, 22 May 2026 17:34:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba718173d1so130945835ad.0
        for <llvm@lists.linux.dev>; Fri, 22 May 2026 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471270; x=1780076070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqGG+UjGql253bxtTVKZZbAD/GfaNDndOanMEIC/0d4=;
        b=B5d5ca7CskzBGxbjdNlspAjYod+4rSxfcEfGKPtWrPvmPtVEb3bHMOIb0RBpGFamjq
         fUPiDbwIhjkGaxyhNmKS2teHMpPtEBSekOMvAlanbULBMYoc0ggAom+8DYqah5Xk2NeN
         Us52dhd8uDjZ7o5TwhqFrR/R2JNaFofAnn9eNbpMkF46ca8JLoilqKbcGDLZsPt8x2Fp
         79TWqqym6b1xKCLCSgsfcIcSZ81NwdWeLUxp716t0C3gtcxh+nAbETfC/UVMMHyWQSU9
         j4XllZ/LSiPD6LUFe9nCRgGyRMxdpExK5amcy8OtehLU2skLC2AmvIKjKrtnqF2jLitJ
         JBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471270; x=1780076070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqGG+UjGql253bxtTVKZZbAD/GfaNDndOanMEIC/0d4=;
        b=hNcQPbEqEbSI8HU6lYHmYfGHzB9RKwwMFgxkB7KcxupmFg711RTX7U3wFtMHfjvP6e
         V92mZERT8+kbwxaLgu7BRhWRniNNtoJnLsTeNPy//J+510RA6HEUCNsS6VoHNBfhRepj
         OHHKxJQ7/720RB9NjX7v9IC/hUphaLAI1W1/I7o9WcJ05bH+OvY2Y3kNK4v9wAEz6FNm
         wvFjgrsGsa2wW71P56Vd9eN0I0eVUvkDAUHqUWaf2QQKgIXGBk1Xnkl6AyJF1wxbAZXu
         hcD5tbJrUiEVWn1hAC315BMhyIOQA6jNbxe6QvRk0WGKi3zHgYSuwoUAswASKZoFBMBv
         sdCA==
X-Forwarded-Encrypted: i=1; AFNElJ/UvA2Unf15H1gaf0qkUHquGAehcGcn6Q48w4cY2eYBZfJvOYYe+mmkF0S54OGahRDXxZLL@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9jLZRcFFSCBvUWvLJTfPlnu8gnNK5aPIoGIgiomaVDd7YX5+1
	sD3BeQrgeF5vCQam+a4CajoalH2fMZ756+oJZ8GusXVdTrBBKYDtiu8BsUKFHE+h9dz2EO1DtIk
	5ccp2dgUSslDZvdlyAbdzQDpS4fJSjlULbpXOdKeulbtmTxR9Z5UcSSAJ
X-Gm-Gg: Acq92OEHqgOgTKp/sFAAMTI7VRtgTfCemufiRnLhjj6I4TrFXJVTaFjer6OhMw/4y/+
	+UevQJhhtpq19m0p37/ICG2pkJZNe8WAjh0pnE4XW/IB4/7OgyhcOf3Npl4C2ABRhTmRKdpvpt0
	8Bh7n8mrOWlJkyzKLa98i8aIYnhHYI2V15RVPm+4TfJb81W8FfRwYTJw2i/ohkU9YY/R3auXoCy
	OXQvuRxYh+FB18B6y5Voy//GGERMu86gEf42nw4Q6/9KmfoYJtb9fVH1id9lyavp6lEG82PKMlk
	QlNUE5Q30+d5dayrIx7+Av8+yjxkpgkvfUNqrMDPMTESoazGEI4n30aVuq3VpfNomprFAbDNL5g
	Zb5llSgXSPScPMEytGHsyDsazG+lk48Yj
X-Received: by 2002:a17:902:e84c:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2beb06aa272mr54403015ad.31.1779471269583;
        Fri, 22 May 2026 10:34:29 -0700 (PDT)
X-Received: by 2002:a17:902:e84c:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2beb06aa272mr54402575ad.31.1779471269000;
        Fri, 22 May 2026 10:34:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58d9fe9sm21341175ad.65.2026.05.22.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:34:28 -0700 (PDT)
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
Subject: [PATCH v9 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Fri, 22 May 2026 10:32:46 -0700
Message-ID: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a1093a6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y2SdjSjt7DsdxN5ViJQA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9QXXhA6qyVuLj19_GMsgplHeoUIAnxO2
X-Proofpoint-GUID: 9QXXhA6qyVuLj19_GMsgplHeoUIAnxO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfX1RcRof6QsVTl
 NOHZQRgAdILewgr1pM0Hr9MCBHNT4Kct+ZKuaphh6GamAald40KRro+y5eo6owZoBstuy1smJZg
 jJ87/bb9dArA1rkzNWFsD6yP/ePNmBeorVH1gorrcu6/sfcxUiu/ZRKYHAj8x9PqlhkJa9Iun2/
 7izujYSAqW//qnFy9+iQSOzf+F1vet71V0h0qxWxs1hMqIRknQqepkbtwBoJZw6Ta3OuuRKmcK7
 7pB2CXgcu6ecdI0oz+LUJgVpzo6TNGu66+Vlta/Ay7RdvlDh+oaSb4DCzuaFFtGew3avnSfKDxr
 3DnogdDZk6raByEwhnRlpQkaT8ueYtQJq8gwoHSd24v38GIyuhIdNygBfa+TU37wqr6yevujOFm
 pRvYDo3OM9M1kIqapIx2bGwgssm9P9w6im+N/wJ4FkHesHnjwuXlDqAfmvycPrF7vOOVMhRGBwK
 59q6gY6KNl9tilvYzbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220175

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

wiki page about the design:
https://gitlab.freedesktop.org/drm/msm/-/wikis/adreno:-perfcounter-UABI

Changes in v9:
- Fix msm_perfcntr_init() error path [Claude]
- Fix off-by-one WARN in msm_perfcntr_group_idx [Claude]
- Fix error path leak of allocated_counters [Claude]
- Fix copy_from_user()/copy_to_user() stack corruption/leak [Claude]
- Fix fifo_size overflow [Claude]
- Use kzalloc_objs() where possible
- Disallow duplicate groups in PERFCNTR_CONFIG ioctl
- Add WARN_ON_ONCE() for pwrup_reglist overflow [Claude]
- Link to v8: https://lore.kernel.org/all/20260520162454.18391-1-robin.clark@oss.qualcomm.com/

Changes in v8:
- json fixes [Akhil]
- Use dma_wmb() [Akhil]
- Use kzalloc_obj() where possible
- Link to v7: https://lore.kernel.org/all/20260518190735.16236-1-robin.clark@oss.qualcomm.com

Changes in v7:
- Use smp_load_acquire() for fifo_count_to_end() [Akhil]
- Defer installing stream_fd until end [Akhil]
- Link to v6: https://lore.kernel.org/all/20260514134052.361771-1-robin.clark@oss.qualcomm.com/

Changes in v6:
- Reword comment [Anna]
- Link to v5: https://lore.kernel.org/all/20260511130017.96867-1-robin.clark@oss.qualcomm.com/

Changes in v5:
- Drop unnecessary runpm in ioctl path
- Link to v4: https://lore.kernel.org/all/20260506171127.133572-1-robin.clark@oss.qualcomm.com

Changes in v4:
- Fix null ptr deref on older gens without perfcntr support [Claude]
- Add upper limit to userspace controlled FIFO size [Claude]
- Fix nr_regs calculation [Claude]
- Link to v3: https://lore.kernel.org/all/20260504190751.61052-1-robin.clark@oss.qualcomm.com/

Changes in v3:
- Fix loop counter issue spotted by Claude review
- Add MSM_PERFCNTR_UPDATE flag to ask kernel to return the actual # of
  available counters in case of -E2BIG
- Proper barriers for modifying pwrup_Link
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  219 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   16 +-
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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  667 ++++++
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
 .../msm/registers/adreno/a6xx_perfcntrs.json  |  112 +
 .../msm/registers/adreno/a7xx_perfcntrs.json  |  228 ++
 .../msm/registers/adreno/a8xx_descriptors.xml |   96 +-
 .../msm/registers/adreno/a8xx_perfcntrs.json  |  240 ++
 .../msm/registers/adreno/a8xx_perfcntrs.xml   | 1929 +++++++++++++++
 .../msm/registers/adreno/adreno_common.xml    |   42 +
 .../drm/msm/registers/adreno/adreno_pm4.xml   |   50 +-
 drivers/gpu/drm/msm/registers/gen_header.py   | 2079 +++++++++--------
 include/uapi/drm/msm_drm.h                    |   48 +
 39 files changed, 6044 insertions(+), 2212 deletions(-)
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

