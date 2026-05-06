Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED13F0754
	for <llvm@lists.linux.dev>; Wed,  6 May 2026 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087511; cv=none; b=m73NYqfN0CtUmaAwT8qkhKZhrPJY8MXRfNEz+9IfgqivjCn/lmIFdGm0DxAffTiyObDQIyLmnqEHfJhao9cNv+4WmmCSpG2Vf7JVtkXxioX+t1C8MKgVdG2l2r5mioyLLWTaJlt0CBiV5TPH/qGZJcScbJpHrlH9Jeu6Wx2MLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087511; c=relaxed/simple;
	bh=fK/E9TlgsHX+lBPStROOkUF/7Po7WWb6qG9opVhAUVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTI0aU0lC4KPpxhMmZ3/lr3bX/Fk5Ku8FUtloMxkVdF0O8UJ2lwW61tQ5LzyTIEPxcihi4it8iw5Z9GWTwwlV9lfEwdzpo1v1XaCfA0Pu7L1eucvJ+o3NcKQrNQ+ZZ2iGRivtU2lABGomBDZ67bNSbToVbHivaAkUO5dLcRr+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmkOwblY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUdjM+ww; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmkOwblY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUdjM+ww"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A01Gn1985707
	for <llvm@lists.linux.dev>; Wed, 6 May 2026 17:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=un3yVwWjhGsMpiYluHyNBGdsRgvIh0stQSQ
	2hPW6rbQ=; b=LmkOwblYOW9eQr4d0meXPmxgBYpmcZ5tw78+ewWA3mXPFDJUGYC
	CFSIC6c3MDylMFl4ULaXK95mA85K43T+I7dH2RRJR87CoiowcnGQpGtWh1Afzz/U
	xtZ/R0HUlrzQpQ5RnkXtGJbwh/X1D+y+xoreQosMb31g7PMyxAdwfZu8gr//zkkc
	AhhgT9x3gpMIJN2hqWdZKB63Pvm/RRXAWcDiU+FeexH08PMfe0nllmFz8zeTyOmD
	4IkY8f2UZ1lYOCxZFYMwMSOM19KXnSApDH6Are+hRa5elCARCuus8i+lGjb0u7tg
	rhiKBO6dt6jGVHAl4kdZHcRYyJgKLJ83l+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp1kfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 06 May 2026 17:11:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b99eb06178so120973885ad.2
        for <llvm@lists.linux.dev>; Wed, 06 May 2026 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087501; x=1778692301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=un3yVwWjhGsMpiYluHyNBGdsRgvIh0stQSQ2hPW6rbQ=;
        b=XUdjM+wwhouOw7HXs8sbUoRxEHcOq7tzIekhkqbFe9LrQ8pQstM3Qghr7eqdr0ihKS
         Id51GN9a48CGsrhb6IEL3DxFaLA/GORZYElAlqw2o08/UZBPLzcqLbNWh2J3WRdxlZpB
         +KlJqv4WN0DeYcct9n2tRiF1B/ihgx2saOly59fw/t6E/PD7Q64jM28uylK1SbIn3L+d
         BCtISH85nzziU+DOBQ6PeadEt+3ppb83d0GHYaUY249Lo1kaUWoM2Q4YHVtX2NutthAN
         6S7D++S59cYxFMKUFT4mAJFDOtkWCAh2NznUurhm+rF2UXaYSY6zFS4ntGfZoG00k3py
         oLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087501; x=1778692301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un3yVwWjhGsMpiYluHyNBGdsRgvIh0stQSQ2hPW6rbQ=;
        b=sulxT6uEbRrjc3QHZfLlZo9NpnPDWBgGz13mb0jy6QojTiefmJerD7UcquYcslOvo3
         FaMDRQNwZRyUc7JiFxnd+zUWcLDHfPYn3QQ2wFR1G+yL0/yhpmk84U1jxYWmzYDgo9Ui
         YmJl2uXhVqUmKgPglSft6UvGNG1Du4y1a034aJ5HN2hjrg04icXu3uo7ooguaM3qmAek
         0xpXsitklcfNhB9D3uCrYKTByTb9VUjmooTx6uBNJHaBAyKQ2u7fA6H7GpPopCxL6D6L
         WNfZ8JLkENBL5GBfpIlcAcBUPXSFUYY2GZJf51zNcNxrpeUCK4Hmos+chmqdm7Lg+Jx5
         q6Vw==
X-Forwarded-Encrypted: i=1; AFNElJ9qJQOfkqzwiMkcLu3L2wOVveHFOxoRDY9w0bPzasY18woq+C9okaCGzSABxtHcFdWjmWV5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+iF9XRsU+tBACqHqzGuhmuOVnmN0Cv8K6VvzmKffH93xlk9Y9
	sOnwVgSZSG88MzUiZbi7Y3ZMaH1ZJ9qzvjZmZBc6crJt0sqev9slxh9trDOQicW1pbdmlM0b7OR
	y7Pzq8D6zRq+DOqecS1lUeDQAiVbY4cj1NVge+OJgJCGxaU92lvRWCqWb
X-Gm-Gg: AeBDiesAPUB00hgKiJGGjjNnktiQ1vJG+GrUcfIwFugbg2cIcnuPSLaV0gmB79iUQBh
	lgnBCdGnB2VrFBPTNRv4YoZeB3NjB/VyJ2hF+eWVt9o/bS3wDACj6dh0sO+dc0M8aKHwOKZ/g8V
	ULBFsC7bxMPB+LO8lC8q4uwTBMeCK9VkxhH4R/o7h+1RopAWOtcq1+y7Vkf6+g5knZg/JQuyI3S
	jPJi33Eqjh3XaJkbHdYOluex0TTSjIfRGz6Pv05omQ2yKBYI6LxWtvJ763pQpRN1PjQrzkxuva8
	/S5RNe/IiH0ZdFKTBjX+up9Eq1wLkxBhIod6sJ3cylCsFuVvfMnKR8NAiUAfRK2J6Fkxn+5rKnc
	kCqAjhQamiVMjycdmvH1Mp9L1AXjyoM1VtBOXGrJhNrw=
X-Received: by 2002:a17:902:db02:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2ba79bdcd67mr42125105ad.28.1778087500622;
        Wed, 06 May 2026 10:11:40 -0700 (PDT)
X-Received: by 2002:a17:902:db02:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2ba79bdcd67mr42124695ad.28.1778087499967;
        Wed, 06 May 2026 10:11:39 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7be21fabsm30423975ad.1.2026.05.06.10.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:11:39 -0700 (PDT)
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
Date: Wed,  6 May 2026 10:10:24 -0700
Message-ID: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX/VdU0jYBytYO
 Z+WzJdlxHp85gvCkboaaCx0sV6QT3XgCI2ig12N5YvS8siCLUrGfptsm3BXcmWFuFUBf9VlhC6q
 sxz0wpUchYj9/YUNZEN60M5N0WeKomEtlHBsxS3KrxEZmWRuhyNX+m0HAfKNYVZddqcTTQXvdDk
 /0QUn38KSF6oDo+xHso1uL56CdEj5VfXbQX5cvTUGmeRxmOQ+Mj01rHkYzkksoz1npOQe2FCy1D
 IYEae+MsAc3Cjxn9DZifcDRzduPUT/26cxHUiFioHe2kE3qJK6vAoVAmyLiu+PVqOPb+sDmE7FV
 Rph23KU6LezYAc/ju054svjZb5yDDqJqFAWtK0mJqwE0ANY1UaovHwQ9zhI4X5ahQWXyZQnKr4y
 hUZkEWOJoFxhubtDYApSu0MK7bYHmQIgvs+ut7+DUQzq3gW4oAI8TH/8csL4e9qBF2JhrqBJGac
 PRNcP3lo4uazi1Z5lpg==
X-Proofpoint-ORIG-GUID: u36lRkGg3TwGz5jjNbJnkQGqCYE3-tsh
X-Proofpoint-GUID: u36lRkGg3TwGz5jjNbJnkQGqCYE3-tsh
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb764d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j6mXroKpKqDHY7BEWhIA:9 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168

The "at least Claude reviews my patches" edition.

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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  650 ++++++
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
 39 files changed, 6017 insertions(+), 2212 deletions(-)
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

