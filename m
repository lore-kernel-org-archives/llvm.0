Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC46402BB7
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807236; cv=none; b=KUTGBgqknbyhZG8R1GZp0sOZuYLPlxabs/P79OnMj2YboR2htpf+NelauY+Y5eBTaEJ1k+jFh62eg4oFcYZazIiWiu6K7ecV8/m8/bBRgzJzhY70P0jVOjTcArdChCr5Re02yZS+gaaHEhq0w51YPOvTQ9VCVejem9UErrh3H2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807236; c=relaxed/simple;
	bh=rkBYJLAtUSX+jsoyzEae2Xb+U3O48Hqd5qakdxSDcIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=chJ0uKFnwLit3b0XkbSkBMTCsYDc+mqWliWHAyvMLdwF+FLsrqtiAkPxi0tMOv4H91kBb/aNOoKZ02hKwV+TWt9M3ulNIJqphUxNavhGO0KLaQ5wrdRySn+MwqMJA7oFsXVhEd51fMZCPEAFBSk9QwD5IAqo2iXvyDnFar2KcMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEwh4jRO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KX/7Srmz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEwh4jRO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KX/7Srmz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QEYDlK4030433
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 14:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cwRQp5DMbK857hmccvlsN6Xv6Zd9SmSWZCT
	NBea45cE=; b=lEwh4jROiy7b5bOqBdx5Dj7n+fUnyiimN8+wZZ/kSOh8n29q510
	OyBYZlx/6v/jkOWWpSAApUqShNC6CX7CH1E6qo4S/pWFMU7vT/LWBvlmMjrAXhJr
	s1Qjqj5tBwzIfPOLpkd7H4cybHv7V/STNmLvGpS9iraKxc1n9MuO1xt/AKWCIlUq
	zq3PnwRVC2l/+pZqqpgNCChe96x7XCje8ZZ6Y72rx3cdiCjvGPhBU4nAZQ5CIoO5
	jogMNNjuRczOuMONQ0VlUhO/WzwAeSlfq22ofYiyAR1gjulNKz2TgH3mQcRAHb4c
	ROTX+9OTiLboSLPnHoXFcYPkD0FzUNktYiw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddd7r392-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Tue, 26 May 2026 14:53:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365faf6006dso10381281a91.1
        for <llvm@lists.linux.dev>; Tue, 26 May 2026 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807233; x=1780412033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwRQp5DMbK857hmccvlsN6Xv6Zd9SmSWZCTNBea45cE=;
        b=KX/7Srmzhtawtnk39X9G9qYq987t/4faHsIshvalAUDqyRm83N5mDp2zCRahFLMPLP
         AWTOPYsvcEQhbXpu0v5lN21WbeOy5troiAAgAtYryXI20PlR5UWlj8euptLleGMoaUe2
         A5nEnaWxw2KMLpnWhMeeDZuOUIyTca8KHxCGoMauzZ+TAUSl9D8VmJn+CfN3pykDE/t5
         s7NHJDe5FrrrH6XxxGmc+TQXN0iyLq/yzT6CC4WjmQfUkbN6PILUQAB4TNwGV+Co6BJn
         rBiIHYDB4wHRJjqcJT1zN/SZCzMPQ8IOF0JBYTgyo+byueOBlKe3tPX6n3eoBUIMGRRb
         P3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807233; x=1780412033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwRQp5DMbK857hmccvlsN6Xv6Zd9SmSWZCTNBea45cE=;
        b=D+L2A2rkbrmJXhtyLrOi0FnCHp7tdQUUXYr95VTGKioZVoZZHTUFyCaiGPpSJQ4pOK
         1fuVxifO8H01NTBd4U+c/Ffk/MJV12lEoTc0Fk4+Fzat+q8xUatk2P0uc/qXab7rOXBM
         7ZCqzvCuwYJFgYMNaB37hE9vnRnO44qmVd/0YqWe6C53X7zzVYIcUj7Bwqw1v9uOJAG8
         7iJJorWU0ln7vIPiCBaHdx1R2z3o47wWc19LLetQsLlJWI15eKcKOK2h8F+SLeRK0GPu
         soQHet1Rt0SmpcpoGX7tnU+IoLfhnmMG/sammCHMXOHNP1LEow3Vq9j6+igPp7Ui38u7
         +p0g==
X-Forwarded-Encrypted: i=1; AFNElJ9XTkh7M0Cik9UbNFn6/BfzsFRVYNH40gO0IuJi4HJE3BzPA6AZteRN5WnzPjUyb5M3kcVS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3BImOnoYEpE1EvBrobFp8WHGJi0aWb/VJPcO8mxPgu3nejfJG
	Cyvj2t1KMpgTh4aJYNIBpx96EL/kcvYJJmO8znano/QdTeVKK8H+y/qo4os07YjRHxJdsRuQ6nQ
	cNiEUQ+i5ltju/xiXOgm/oRgYegi51So8RNkN7IPDD54DnuOFH2vI3FSR
X-Gm-Gg: Acq92OG/CsVYlfxYnB/9WtpG8fioDsMlKLB7W2aa321Kd+4jwjrP/auOy+1TziMh6Na
	AfytQwRd0zqTPEV2egCha6aJG41WFVlBiXX5kbdp8BJUnA5CkNt3YhiiMFydS2avVrtnAAptq1U
	xiYSIQu6T/2T7h1vJdpyHts32BRp6aqWnQJroyRlBffJPUWeVO2CtTsdRGJqXcIV6vAFeIOLwgt
	5I4tfBnx8Vdhs90dgpl/E9o9w5fHF5LeZyyKIN3jueSx1ZxuWTnhzNguS24/OloCEDyTwBCnzGv
	ONzervyYtkvBi6gOtv9hA8KqAoQRaCQi8QE7qN9v0bEJyooh53AFxCufoVXMq7mm1hlyalS+/HM
	r06dJBp8bEWcqy42j3HN7QiMnPUKJKva4
X-Received: by 2002:a05:6a21:618e:b0:3b2:864a:ed74 with SMTP id adf61e73a8af0-3b3293bb68amr20294623637.43.1779807232874;
        Tue, 26 May 2026 07:53:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:618e:b0:3b2:864a:ed74 with SMTP id adf61e73a8af0-3b3293bb68amr20294576637.43.1779807232379;
        Tue, 26 May 2026 07:53:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056db34sm10757809a12.27.2026.05.26.07.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:53:51 -0700 (PDT)
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
Subject: [PATCH v10 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Tue, 26 May 2026 07:50:34 -0700
Message-ID: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfX/VPl4YlOslv9
 5BSwbYC8933YphpenSBs/c0zvswiJSNjlaaNcRgR0cYYZDpaNBwNftfL3lCIQBWXkTDxw/LCyTI
 mBst57taMuLxJIlM4S2L56ZJqwxGlqZ83tqYUf5I1QABvj0w4IH8evLLVR/PA7D0DjB8KX1bUuI
 t42FxSiCEQhxKbc0WjMqDPUjXVwGdoKwd1IuCRdy4XF6d+F0iebv8ZptRO7tSRfV+ad4Ka89NGm
 jnUvlIdhomEtWRSs5QuxK5Ymbypn1sfUPv1GPD44scqostsRTnLQBW9iFmGCJHt8wGK1lxFIKLl
 byfQLIgkVDxlQ/WVJdw3U+SxARW2uVnqqOGdBlTfyKfqjWmr9k4Tw4dKOtHA7ztefDJMIRVBENT
 1yCJAnymNtSW+tFtG2f2zTZ0KSXPRaTZHp7/oWdGTiLNlvF7g8UucuDeUU1LzSg/JSQ6N6rfLsk
 TjRiZndbNUjZ6Uge7bQ==
X-Proofpoint-GUID: QBmIHZkyxBWeM5xZFahO_UDbI66Cmacz
X-Authority-Analysis: v=2.4 cv=fKsJG5ae c=1 sm=1 tr=0 ts=6a15b401 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Y_GqGrSV0k1v4m2USCEA:9 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: QBmIHZkyxBWeM5xZFahO_UDbI66Cmacz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260127

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

Changes in v10:
- Fix some "mesa style" 3sp indenting that snuck in [Claude]
- Fix msm_perfcntrs_stream_read() to return -EAGAIN if no data available [Claude]
- Fix duplicate counter group detection when nr_countables=0 in the earlier
  group [Claude]
- Link to v9: https://lore.kernel.org/all/20260522173349.55491-1-robin.clark@oss.qualcomm.com

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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  670 ++++++
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
 39 files changed, 6047 insertions(+), 2212 deletions(-)
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

