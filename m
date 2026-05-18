Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E6C3845CB
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 19:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131280; cv=none; b=ouLt5OycelZBD+KIwHv/o+wO0ynFiOyX6ppLccbSk3VfxtsyYKANurbPfJxMpogotMe4kKWw0LYERJ4yWNhdq+66TK8pn9Vl1G7sf8bgOzgfvh/kWY0g7o0qC+I91TBwPB2aB1l+lpi23ap3yvBS1eMWazh+nFgXzp1123i5hJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131280; c=relaxed/simple;
	bh=zLCxhUjlEO7hiU0cgdkQo1iKLCAt05wiEMeDar1hHSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sq2V0ahzlf6rATjFdODX5lx0+tVG7XlqPYcZsqWVC76YFqbX6pK+SZ2a8tx13Jk2kwi+e7g2NhhRXSLmFA19+lmvxDGGvs65Vi/SlNSTk1V1nAN4IAPASqOG1mh/Nt6su6H8/rvCt48TAqi6Uas3gGVhfPlqM9q312HQ+dHfifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc8Ej0nU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCW0xsCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc8Ej0nU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCW0xsCx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEnUdE2975727
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sNlcHMTJjZebXoe4HRzps1kie9SV5KzjtW3
	FlVVL4zY=; b=Rc8Ej0nU+1edGn4q0FrMUcdkGptepRDg+/QVr6i1cgSr8o8rIzw
	YxLcvk2rBzNe89guNxTg4pMjdHAMkTP/Wchq22HwLm0rScGEDzjmCVD3C9TTAxhp
	hLcTJNY2l5WioWq0FQwb5+9ogKwjQn1tJKYKonX2d4FI2pUryM96r9mAG4BC1sQe
	vPbhQzHmYpJ/tSMvPN1M81SiKHua2qA8VATq8uoXJP0bdmEyGO4W7/iCA6NzNUID
	fu/x7msTCcH0Rtugts1HQjgKz3cYrBvkaa2U4OwlPZeJW3LM7MkCQvQwCPQ6cuhT
	O+lZTzcRHEtyqWjijatDlZkJAUg15IFoyww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v48ygb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 19:07:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7748d0aso25696725ad.1
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 12:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131277; x=1779736077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNlcHMTJjZebXoe4HRzps1kie9SV5KzjtW3FlVVL4zY=;
        b=SCW0xsCxeqBP46d/gjgjZ59XDlFhYygBsiYgZSWM70LSENLUZulU4pc2UfeJxOz8kK
         X5hgxXCdopGQKLb/hQB0FZBUfYbm0tAdWWcJ0bsesG9kbGtyD5hghBXzuTp4aEV8P06g
         Q0x3U8yNox8d/0ZoF9tKqKfsLuJ5c0yBOl6MChBQXt+G4PYDEWHdcqQPUq8c9TenwXG8
         SoAQZVQc2su3zK2P6wA46tOObHlfV04XqZ0f3ZTNkh0FlLgV4fscGb/BY8Pw7FlOEFcu
         hVJYavMn7zJd91FUZ9emJL4JzgOvC6K13KrVX0oEnsDUl3fDI53PnHGOVfww6mO+61+W
         G9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131277; x=1779736077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNlcHMTJjZebXoe4HRzps1kie9SV5KzjtW3FlVVL4zY=;
        b=SeHV05SrS+UdJZJN/suZmiIxrcMMixav0BjiIPcpHFlUBb1WV+ha+s47aa47kG3oYq
         stCZZsCFKOh3Ur8WjvVp1IrREnvHt0RToM86beZ8SwihRrp9I94Kiurs5XXkLfwkXKln
         UXdrwpq0UAqKZJ7VHtd2aAnaKWsNOhwlSts9Fj1bik3qrOypc8M3Up3wRCeYBR+YI7Ik
         hp4RnYL5eyVr1WkoYDhrf2Z3/eHxDdAjwRaQeMkUUK0yTvYGYcnsF9v3ZiC4JmSfhOzt
         lvYWKM3HZlkWnF4aYtHp00wZaQwTEWgZRkzbZYfENKc1Qnt1jBTmeh9ZBlg85ldvOvK6
         OJSg==
X-Forwarded-Encrypted: i=1; AFNElJ/Y3vwtgJ287BOahmtWuhDzg9B6ZolAMdxrwJ+bpUCmgYRpvIsbCepa4jDd5UbAFyQnCddp@lists.linux.dev
X-Gm-Message-State: AOJu0YywDaF1PpLCZot0OzGX1Amk8n8Hqjwfi7N5+GT/CjTPRv3Gw/lP
	Hv25D7WxB3JeCyy80a1stUH/MdTEOuaZBtC9n9Cxb0LE5NCTkqR0gXrwbcwT94ts/wTTpLOv817
	I3Zx4lzr4txfMws9AMbT1Nij+GhfTRK1LnH12H/d/upoVt8m5vdLzrlEm
X-Gm-Gg: Acq92OEefPTGa7/jBEuuRqLn+u4yWO77k0JKWfxoX38PhId03FHdBQoKgDW9a8pZKLm
	C0ovzjgwi4spiY9CKweTL/rGUG2YL6X7v72z0kG5WO+iCOQZ33i1Rf148U0zWZhK59vMBgK8c4U
	Y8GEZPs7BQicSO90K6opOve0+t1g2jzs8lPru4FHFpM6DLrz6nbof4jScI7shBu7aLsTAoX1ngp
	RtJJqjy1XATzwNoZcZbD/+ZPNSU10XAhqmUpBWbGXrRBqZdZW0cWz8gnostaHdNpFy7MF0jgKgm
	pVXUE0kENssayvo/eM5rTMq+QzHn5fsLq7e9gT/BgQcyiQK9O1WqfFbKpLyPA18HPvBTdfW3HOf
	/Hpu5EXSIjeDzOquFQ6FwgiVAdvmML8IJ
X-Received: by 2002:a17:903:2f07:b0:2bd:a403:4ab8 with SMTP id d9443c01a7336-2bda403553emr114187655ad.25.1779131276965;
        Mon, 18 May 2026 12:07:56 -0700 (PDT)
X-Received: by 2002:a17:903:2f07:b0:2bd:a403:4ab8 with SMTP id d9443c01a7336-2bda403553emr114187345ad.25.1779131276482;
        Mon, 18 May 2026 12:07:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm162791025ad.27.2026.05.18.12.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:07:55 -0700 (PDT)
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
Subject: [PATCH v7 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Mon, 18 May 2026 12:06:27 -0700
Message-ID: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0b638d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y2SdjSjt7DsdxN5ViJQA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: UvXNDYQNjo4sFw-ZruQaGSM0qOFUgm33
X-Proofpoint-GUID: UvXNDYQNjo4sFw-ZruQaGSM0qOFUgm33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfX4Z5u+YOwLpNS
 /s2Xq1QC/Xcr6NsrsWig9bsUp8m/0eKsk9DHEhnUyQ7AWTambfr5BMEy6p59RlbSWQYObE0NAEp
 Nl5JcfDlFE/mKosehLLqaY4oT5Hr3D0IQatUi4FmzrzYFlov/JpnbVP+ZPIbGPBBUWhkOT+2r/o
 DElfIhvnqyub5nYTvoeXNkbW/zN8GFA2WiMeRpwtwBiU59bApooxkBxmrjjTVQgwdZbryYKT5l6
 GdfJu4X69BBey+WEhpumzhTltgQtaydROtF8VCVKAgw4fNOsuQG5HKJytX4i+RR1Eqbc24D4Flw
 gF1UniXhEQZajnD9liZ32zOLH6KUHal+ZXpRf7A5hNHaTRf0CvG5Q2Pxiz7J7rDL+sKHwb8NDWH
 ILNPFfjCCMPy5djy2NCLsYNiPBaulXkuOFtS3T3LIyh8SBoDG1ZQH4Tm9qAuRgtv5fZ+XK2afcU
 locJh2G7adLDUEQYb7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180188

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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  648 +++++
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
 39 files changed, 6015 insertions(+), 2212 deletions(-)
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

