Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2556B3F23A2
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766849; cv=none; b=EO3mf0C6qLCpLkxT/2E7dPomjzxPriwTon86RJm1CkfHN7epQc8xZKWOBXKNWETFJMTSYIRv4Ww1L2HmYgvxbyrNm0aVvmNHzqst4gjxk0ESTR3VwygfOBjUji3Tz3lHbkEDcXchUg67VFuxyJQvFQiRgTpwG3E5ffNyrAVfbk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766849; c=relaxed/simple;
	bh=DOeFcLmbLl6/c6PNL41fdFCwCvPpUFyJ4gmuzNba82A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aIdvoLM5hqZR2jIDRjVaMp1AZyinD0TE2lUDfZ15qRj3gFW9DOn0fXlSTBjcKbbtK5H+q8L+JlnfFgt5FvF2iw4Zmdg+5XJFkvtMV4S86GfS/aWAr4NXcseVfcFHwhQAGUqfBr3E3P3u9/QGiyaiw8SCrwSBqPB7n3aPZyP/kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9pgVHti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UA2Hlb5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9pgVHti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UA2Hlb5G"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBecEN2713321
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 13:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UfNdfXL9HFmBgf8J4W1GiVknjJBwcKvLIPV
	YPC3419o=; b=I9pgVHtinYWTOfU5xSAu2koTsED3qjnLsFWnZNXdgIrmw0xEsbl
	cOaV5qe1G/vDgTAPdEUxlt1V1JwhUIaRIFcqGcDHsMN223IU8JH2Qz1C2ciqxA1o
	cVr7XXLhf/qaLNL4GWol+FPh0sz+2WluV/zKKqNHrDefH5I+ETqeP20Qajwa40wK
	0wXIH5ZhTZn3dFSXPSwJYzZIk0RPjeHmejZ6EVhkEXapwLnqOhTrWx3jEWHn9X15
	i//pwG9dgH7HcM1DumFNU1F0Ed9V64ij+1mOEBs8vOW0XwJNLE1Ec3ero0y4TL1B
	ktPfyMtNa5cYAK1ctlETyCVYlLaWadSJICA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89h6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 13:54:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba5f794825so67007825ad.0
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766845; x=1779371645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfNdfXL9HFmBgf8J4W1GiVknjJBwcKvLIPVYPC3419o=;
        b=UA2Hlb5GbZnJRaUG4aK4ZDzv8RBGBfE8wa8AUl4nKuWP5h4KGvCzz5KgZ56qt3ZsMD
         q/bE8scTGC3tH8mXkDy6yhzquM8RlB4IUPCxqlUMb+SJBuFsFjp8vrX7tygIu5I/BfyK
         /O1gEdbW7jPNjstPPfIfAw1DmhbC6tbRfGkvUJEOJufG2V4+wZ8/NZ0fiGuHGoPJCKvm
         9YMTSgtTEdupDZrPYfj5QVMXMGMVdlqkDUTmv3J71rS1ssyBY4LBAPaCGb7WDFSjOjcB
         fpyDSvMa0NFITwdbIOgXAhPetSQh03hHCj31upnnwtewKrr44lRqbhKzZaSZAaaxDHYk
         Sf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766845; x=1779371645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfNdfXL9HFmBgf8J4W1GiVknjJBwcKvLIPVYPC3419o=;
        b=KQ7DihEK+m3eciDloYzVO7ftDe0rIGC5PvA8yzJhUjeyV+60cZDiSFQJANbHw/hz8w
         Hhzc7jhFxKlfLhMWuf0+LJ3ahJKmUu4Xj1y7k5VkamtPCADnU+DP3DjVRLLRvDXugcoA
         DxmfEFStzG82rs7WBXFe9lRNmto2AFBhFZDKWSCCfcDya5AQEi69Ln3u79dIetzmlRoj
         exJlu5ymlvKrwitIUc6abNSVbb1zEo+Ov7SC+DNxcef/JI5o/pjZFSGmjRMwteoQAJFB
         AqtMWyhpAkJQP9RCvPjkTZ/0mgmOo1T+Vs9UwvBFf8WwZUXYtRhyGgLMXiYjdS7KGz6o
         3dGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8txtl2umjYFDyCC/Bv7ANWCE5OYn9qwVnRTdc1kRVm3XuW5hwgPT18X1Noam4DsuCg3u6i@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8rN3Tprew6iCJVbCo8mSiJDysA0JAuxOJj1kP59UboujEamSE
	ERBhPCzYhwwnb9MxfB63edIIk9bPMsmsc8vQOzy8pvEXmrmM0nDcLYtHU5I1qHRcs2rLbXOSmro
	um9ZTbRrQaJuWkcdoD8D3dkbp3SrLxSwaZdhRZY5UtMlgv7fbXd8KYwiY
X-Gm-Gg: Acq92OEaRbg50eC5zhNwOTG5UralpV1r7N7uTVD64EUlnUnGEerEgIiyvVcy+mFSXDI
	BkVFIY64bFEwcKICElMgRpElQvA5fuYxX8ui6yj/t24lxMjZ0mym8RZEUFAXLrpBO4vDQTGVJ1b
	T2p2hb8hzm7QgvVPOzbHmODUbHbivbgsZlP1zfdlovLm+v93nddL9egpja3QJOGdfOxlGH8Fgar
	tSQFCbVSFzhHc1oUWKFHAk/aFMeh9q1VqhQFkj2tjb8xm9jFf2m0jTJSAwfae5ZoQb+QuY9uQhp
	h0+K65r7wsBTQApn7mthrzAtCuDdX72z2nJ9WM5oqAbmr21Ry4GKGVJgWRmlv5aRdidkK5+jm/B
	B7TRn3IqNZJvPe3WyM7bajF9zswnvt1mx
X-Received: by 2002:a17:903:8cd:b0:2bd:6727:d68d with SMTP id d9443c01a7336-2bd6727d7d0mr23343635ad.23.1778766845263;
        Thu, 14 May 2026 06:54:05 -0700 (PDT)
X-Received: by 2002:a17:903:8cd:b0:2bd:6727:d68d with SMTP id d9443c01a7336-2bd6727d7d0mr23343215ad.23.1778766844707;
        Thu, 14 May 2026 06:54:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe67sm28572595ad.3.2026.05.14.06.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:04 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
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
Subject: [PATCH v6 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Thu, 14 May 2026 06:39:48 -0700
Message-ID: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfX+LK86/wkUCDn
 b+97UNAyfdeB1nLNU9N6VXotL0RPZU+IfDBGVXIQCKYExdnfhFXz0LAaUlIo8UFisYqVCMysO6m
 a4BTDwIr9HXaWwvy73citkQzrTOdExtPJIM/62PijpWAn62tvXpv3D5vkzuYb/1J/XB0siQkC58
 ECgRJx4bMoAdtdTIQbGli48YV1n44LnAKNTtl0+6FMh9RVQMZRfXNoVUKEB83PxL7ptXeRSN5vn
 +qurLUejcQR+cYz2+9szChVWy2qTbyMaQOhRUBLtXEzQQfzjEZq0jFkwHiO5fJLbvTkRvfqMHQx
 q92VufXC+hf+9yfiJkXMHVxDwV8lKPsjO2wU2NfCKMpRpZ4PLCHZCwD+YYkaJBAQarP7vzkqpoD
 xzMyd6/Lk1nzPjeFM4Ntvl+Gq7UKPNnEpZWKLaTeX456ySd3CqpH1DWMs2fAMfH5DNuPReHzaCN
 a+U/rrpkih3aEEzao5w==
X-Proofpoint-GUID: 2miUuuIDyPSDfGEHkTnJ-a2Sjaymb1Ll
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05d3fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y2SdjSjt7DsdxN5ViJQA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 2miUuuIDyPSDfGEHkTnJ-a2Sjaymb1Ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140

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

