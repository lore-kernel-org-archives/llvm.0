Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8085F36A342
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294313; cv=none; b=ivhZh9Qlp9R/UmwzUxv02mc1s4E7OtbAr480r6w6icKJOn6TSNZVu458wzqs51m6fMyGn23zgYyWktTHH8a2sA6YB/jTPBjDg/NNJjzwLRv5YA1R915LM22S8cp5IzsiXaMshCu9J4ggegfIMwhblDz8Kh98SJtU8p73evPrDmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294313; c=relaxed/simple;
	bh=TWqMeTLClmzUzXxoNOQyHZZ+Gh5EnXfdNKN+RCcxoL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKAr8J9fRs7C6oZejDMsidQQemC6T5N+kh+OvXRr2JNZRxttkwzOK6kh+2SUU7CZup6zbljin7iVnrbcTFtn1Qqavhj6aqa+AW8mbsQxdAX/yJa2Jsrms1K7zF36cISloKfqfTrLqHQndlvRXb7qcvTghnbbDDiazOzNKp0FKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDU+Oz7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGFbHU4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDU+Oz7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGFbHU4x"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCe3Ve316534
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 16:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xWvFKbWyubO7b4hnhrQE5blwoWWt0CB31mv
	OpMNc7G8=; b=KDU+Oz7ZoFOt/qPmVBLUi2HhXPkfwrXDwMiRhpsvtwgoq9KIMKe
	cOLJjUeTdH4BV9KsmmL9oSLud9cy281PkG5opaopSIQb+SQKZR/MfLGDrXEJ8Wo8
	6eUIlo5D6AwsnFvKDn5hnFH+TtLnJlxnBneY7BQWzUpBpsW1BkNg9pg3JtSJ1EYE
	D871KDmZWUEaSXusedQvJSRkIiQQefdQCKx+iwGfWwvQbsBpg4+R3ntTH2/Ff7hX
	Cg2HJlgjHYSfPdCaxFpu0m2Yv0AX3BuNf98JUkQGOcghg5F7rmOMgiQAZZX7+O1H
	+hxZ+/DTAsibgwVUPAFk09d8xmEzHA66epw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qrxpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 16:25:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368ac44b26dso4234327a91.2
        for <llvm@lists.linux.dev>; Wed, 20 May 2026 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294309; x=1779899109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWvFKbWyubO7b4hnhrQE5blwoWWt0CB31mvOpMNc7G8=;
        b=dGFbHU4xL1Q7Vdnz5Y8wUGZPiA/D9kR2JaAYEyNvZyV9XmJd83VcEOzczppcSwW/eX
         OIlcBWfq80cHbV3vYb578UDldaNG5F4Icj75FNM0JPxTt9mGusdk8igT9jk8g7HINv67
         GBU567XNqL2DnUVMUqDlckxl5PixLDygwTL5zarGjosoNSft5WACDfLp+ZGAbuuUg92U
         LhrzpDAoQxtkyOYgoPQsgZPuwYpjePPGqbbp5nq1cmGj3/RL48zIs9TteYZ5iiKOrIYi
         L+yoMPrcuDn1b6pG3xVcQeiHORPHIj500d+S/GXJ2rzxxNLrtVylPLg9c3LR+HUOpSW1
         ulrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294309; x=1779899109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWvFKbWyubO7b4hnhrQE5blwoWWt0CB31mvOpMNc7G8=;
        b=GjNt2vWW3z031cThVaUrKvS+mVUuXemr5Qh0QPksJQib+bc0Z9vsgR7MgikhpPAfcG
         sVdO22kT4/uTj7yvz5+2sFbq3Qv0kapsR2EcQ3dhI7Xmeyhro6+tX19e0vqq/ScurnDA
         0A1DcWG6gy8mACTS/79MVPwTjDRVDPVoRmweG1G1OQwVHgLeJjQssV+pEZNQrb9k021E
         Ow5aFGczoozdH/Mmyq4tAUlUTwRtygmi4ZiRQKOcN0gwTV0rEnJtt2H04VtYxhkqCRlg
         eSnwaPqBXMtZlNtjkHKRrPkyOC7SL8A2VtQte6LLYdYyQ1+RBDcWjq7VCTNYbVFPcH0j
         bMhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pHs/fS4jTrBaLXSooAfrQy098xnkAc+LKpMTa53xzpi18EmrstJZDpu2FoATGHri3lOcG@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbq45jTiVJo7Ed+AbU+vcY8oTWgKMRyTTDVEgEU3/CG/lx9/Ua
	ZJmnp2z6332JBXp03nBiCWx5yF9fCwgvHlZvRNOJR+MAa03oyepJiAJiIO/u6u87qy5GSNy7VrL
	tjmqnh7mPfRRZB3kVPrGj9a88iJtz6+Lyqzn+mw1xa5hCeMup9YqmXxV8
X-Gm-Gg: Acq92OEuZfWnMgWTWVG+yiwyN3K64b0PCn5tWQhoAazS8efU47Cv7N1ZehYJwqvm+nV
	/rTvq8/71V1Qt8uNy3RF2P0qbYmDjApfAaMJ+VxgGcm15s7hd2Utw/tVsgNsxnlYVLP7aJZ7Prg
	cvkuKtHn3u3zLK2ba2d8mx8bEwLaXhaJC+p7Cv82aBiBLNHXNNNB3zOJRPg30KAUTfWXOe7mIlP
	6HgIXCYuq2SM5KNa0tBmpDAneIuBP89Mb/EJDQ8mKt0cPOWji7DM5+Y5WZhlv8gaJxSJAXaOS5j
	4jsIA13Ti6Sv0CMHenDS8F9UoZlQ8IoLzn46MHM94OXQcuyxsVBRjs9XdO2X9UBEECzQHphz2EL
	rTQ2fl51o6ecryOE6cfUK6FAHTZJW16F/
X-Received: by 2002:a17:90b:3a83:b0:35f:b3fe:18dc with SMTP id 98e67ed59e1d1-36951b782c8mr23220846a91.19.1779294309318;
        Wed, 20 May 2026 09:25:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3a83:b0:35f:b3fe:18dc with SMTP id 98e67ed59e1d1-36951b782c8mr23220809a91.19.1779294308642;
        Wed, 20 May 2026 09:25:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369e383b31bsm3781877a91.2.2026.05.20.09.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:07 -0700 (PDT)
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
Subject: [PATCH v8 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Wed, 20 May 2026 09:23:47 -0700
Message-ID: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfXzs3Lb37J+bfT
 zz0UAJ8hge+W3F3fvwSOnqWcJTjclPVg0YkEuzet15U59EHiBSIIv9W4vVmxGUL9YZf4S2eYwjl
 HIq1O0lqq2ezXqDhhpTkVHiS3MtqAXKUnGynSrt7xTr2IG3xGH7SUq7TrJLvi1fPE8SLc5qJCJF
 X9lVaROt1oPxidavwKkMpo/LRs0FpcdaMMOb5t+STnmaQtvjOudJAVeONFXneiKoA/fQw9HwP4Z
 UTePSQgf82r/LDXkeRmVaXmwJhzKh9ILtLnt0p6XT2ch4hNYD5UTsbfrDkNfmTLq5JWoYuBp4Yd
 ICO327aNPieihyZMM2vXGrW+LEw6wLLUyIP6ddyBbwGBTkZeH22kLfEM9YAUmyYphtYDce8FRWr
 RkvjRxioPiYTcHSSbuZ9nzy+noOsHlGjk+i02lK29w0JxtV7/TMjV2R/4EVGkdd1H9aNpRI6Iq1
 HjKFZycHlAUmI1ie5Ig==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0de066 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y2SdjSjt7DsdxN5ViJQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: lCqRtobzE45C_Sdf1OCoXlnKKAzcyztj
X-Proofpoint-ORIG-GUID: lCqRtobzE45C_Sdf1OCoXlnKKAzcyztj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159

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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  647 +++++
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
 39 files changed, 6021 insertions(+), 2212 deletions(-)
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

