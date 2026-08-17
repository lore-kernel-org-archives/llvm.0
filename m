Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC2F3090C1
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942088; cv=none; b=QxBrGOvbtY6qpklbkaCdAnkmi/DZj3uNR42DBW6ED/w9V2xlpxORYSzTBV+/l6oYb/uL1A6PlbK36A/TRDhfIkoJVO+7g+QhJz5AHzymJ2Fnc5U38kcNE8b3n1tujphthvWpqiSxZcj5O/4Ht1XI5lw8vZhkB/W3C0Ko67NS74g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942088; c=relaxed/simple;
	bh=s4qS4qk0iKOII4Too+x8DDYPaoroX9lvNznQX8dMsdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWkbrmHDk28uGlSJk8y3sFMgHuRy7yICxwUP/XrgD7IkFHVGUnDT30yZcUzwFazCatcI6ZiPMRnsubhnbOtWjH+4uJtsCy34eQyzCVApnU0NBymh4PL8c98U/yv/seAqFCEF82XZYFgtk4kQcLYOQTrZzg7+oJ2Jf7ROe61Qsv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XboIU2tH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ox/PRmOJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XboIU2tH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ox/PRmOJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCcWb3657048
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuQ+dyZpJqr1RpG9/VFSg2QnHWbegqtlPq2np7ofsvM=; b=XboIU2tHR0ICaw8l
	gatRswRN19A5oaw9PNm808p+8aEYvP5B2DDeTcVzmbJupoKN3hLFi66mbEfK/wkP
	WRJbPve5eLLcFMXLv1OqW05sGxbNvqOXqJ6EdomGEi2TRJynCVUVhtPA/t/pvD45
	ek0bAOvIWpf5AvlJEVU8l8NRoi0sVmrHrSd5jk+DP5jxKpi8fvjwJsBR/upLaQma
	Ig6Amq65knkDuPcNAnc+m3I4kyH7NhY8GZkK/1YMubqFsy5phFvv90zkxPI4I5GW
	vBq2qOnn9z2Gf8I2c8c3tGoOV3XVwp3A2DrYclQ9a12TW8wgCNPBI1XeX/XbwlYL
	U3IKTw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2h9gn3mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 04:48:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f7002f9afso2492332b3a.3
        for <llvm@lists.linux.dev>; Sun, 16 Aug 2026 21:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942085; x=1787546885; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuQ+dyZpJqr1RpG9/VFSg2QnHWbegqtlPq2np7ofsvM=;
        b=Ox/PRmOJcb85SJUyX/c61SGtzwu157Q5oUmaX3H/cyDD6v90FKD2J3IhuvfShXEHwr
         OI7b/5inYTe9ZzYBTXPNR2jVsQ8L8LdpZIHtAKTp1zcc9M0E6L3XPTZhceYrnM2Ev/tG
         BAyXdQQkCmiJLGF0q2Di4a5+fVAMUgXZKNVUI6Yu1c1J/EUAoUQK5w+hU4U9Wa2ItF8Q
         Yv3qqQeCyGKIMEfqRcGK+l/wYB19fnHDcHW9GV3oyENhec+Fcw2qSsBjls6I+Qw9xuMF
         Rv6OtqpETpwPXN555J2c5ABgLE66n5HuDl6+R5DHjmZZJaPuFM9Cz2pskUUr6upopC05
         qOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942085; x=1787546885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuQ+dyZpJqr1RpG9/VFSg2QnHWbegqtlPq2np7ofsvM=;
        b=C7licyl1ZYLdiupKnyR245oFy3Zm3UxN6O5xwGWrGfVuZW9x4d7WAptId1iyZz8jJN
         I+kuGYFv/Fa16x9wlHvBK8CfY9VScEGF0RXA6w+U4F8eEsDV6dV+bgHkVD9HXCgvMKro
         TvdXKSloxu2YgDxBWIU+kzs+nnLm3GMXFLNMcr9jG+jFTnHIr43A+1RfxDXJnZS5wJL5
         MkaNvuyqN4YHdJob/4Ek7LijgFvXIUtJ67vfpSX4GFUfaZkJ+1sp6UBXFOC8Fq6qffJ1
         dUx37703Dm4LzQ+7DleiBBEF1rL0AiIrxAuUs1xcnH6q/G04RpIYTMvV/Y8zUWpAGQJ6
         W3dA==
X-Forwarded-Encrypted: i=1; AHgh+RrFtHri5MAICsH93PFK8QcDN6sO8vgu6ZxTT4EVKq19T0OFtNInpY+K7BZtAMb2GQyf6eAn@lists.linux.dev
X-Gm-Message-State: AOJu0YwtV7knA3JGvuwfWxRdH/+12nWNJ/Z5JX06KSI00By9fK15LJeR
	7zHy4OEw5Lq/OeZnc/hzrS42iRngLbaeSRw/oUlEP8t6KxW1ZWbeUIOrDCoVNXLoJ/+ncn2GH3e
	zcAaqSpJu7TqbeG01z5mbWrU14EJ74V35keA6SaSNYPj4hyYH1c1NrWNa
X-Gm-Gg: AR+sD13tQz1C9HyhDuh0AvjVn/PTgrkseSzpBPjO2ERann8qdZSk06UQXj7vNVBQ7XN
	JF8Q9/FiO263HnK9EFfWF9s8NXSYZSaiGGV6zhtjNaI/LPCuhOM3Dzrmi5GeU9UsZHk6uyy4Y9J
	Trl1AEM4YQleME6erQkuqrp8hklW0P7lef+pDtzMpxg5YDObiCGylI9ioyPatpjtwVpE5cBQPCT
	dUVPplexBc2POecyep/xYQOvvpkaM85CeW1YT2iyDl+mLEDFA8GqkiU7IRaaGW48gp7LGPe58mC
	9dE8nQADDVSoHUanwoa/fZN1sCSDZ7lZiegAy3FstZablg3ydyhqxSeVxb8ibgUtDQGHtd4SOFf
	4aBFd0I4ru4hwK+EVjuORR7OrCdulu4lI
X-Received: by 2002:a05:6a00:4502:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-84fde3e5737mr22785051b3a.28.1786942084481;
        Sun, 16 Aug 2026 21:48:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:4502:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-84fde3e5737mr22784996b3a.28.1786942083985;
        Sun, 16 Aug 2026 21:48:03 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:48:03 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:37 +0530
Subject: [PATCH v2 02/15] accel/qda: Add QDA driver documentation
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-qda-v2-v2-2-69a02e9090d4@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
In-Reply-To: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=10551;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=s4qS4qk0iKOII4Too+x8DDYPaoroX9lvNznQX8dMsdc=;
 b=6AMGjvYlQK7kqcLh2D7azpHnCteWLXp3wiS0gm4FGTE0MCWVEXJCDgLh0pYXowy/5zqudsGde
 bz0Nyda7uA9Aw6/7LjqylHAlpX2hhRnGQ4huDxJsU6htzYIIEm2+f1z
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: ubniy90mHGhQDUMYMe4w8zCrPMSYAjwH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX62wJYKWXXa5/
 oXUfYvuLq7W3VC0e9jWP80uV4geeMogmTUJJIqzKVjSRV5Raomi20w1/2X5ksapQc3Cf7dxjW81
 O00p0kbLCC7B8AQIeBiiitoyAZ+gEA8=
X-Proofpoint-GUID: ubniy90mHGhQDUMYMe4w8zCrPMSYAjwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXwqcx57pxI98K
 c87nkWszEQ0Nz5CVzFfS3I3GHT0sG8iQ8g9pwhFRDSJ2+lkGHLS5Dv2x1pxpGT1ziEGdWu84muQ
 EcZ6QqvorUn174pKHnSBZm9GDM35c4XZYrKnbbqQTRG4J9iWhiNV7l5LotPvxrzc8yY5qGc1Lhb
 9iiGd+XCf0MQn0UNwxvKjxgb8y8wvesZsIl2ABNeuLpQmwElIP/A3A0vIQmx4LEDot5tsq9SqBC
 xXWsN7lxqjX0xeGDlbt+k/OGrX49ScH9v6LnKrO0wUqBF6CXxT3Zx5KbNdOSe9+jvXLkzYthGIw
 oasNIaYCmaeh7MXP+PsaaqD0sLt3L0X+MFDT0rcuIyU1lyWbJURgJoCiW1ZwmQ1imXEtYhh52jV
 vPb3EBD6SsbUYr4Z+dUIwc+dX0sHZ4zr+PUJC1QSLNQKbMZ73yLKz1W/Rg9AtcREI1fQ5XJHG26
 JgTufUPgFKSg9KoMNcg==
X-Authority-Analysis: v=2.4 cv=XM4AjwhE c=1 sm=1 tr=0 ts=6a829285 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=b5As1VL6SZ8mNc28oXsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
Documentation/accel/qda/. The documentation covers the driver
architecture, GEM-based buffer management, IOMMU context bank
isolation, and the RPMsg transport layer.

The user-space API section describes the DRM IOCTLs for session
management, GEM buffer allocation, and remote procedure invocation via
the FastRPC protocol, along with a typical application lifecycle
example. Sections for dynamic debug and basic testing are also
included.

Wire the new documentation into the Compute Accelerators index at
Documentation/accel/index.rst.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Explain implicit per-invocation mapping vs persistent REMOTE_MAP
  (Dmitry Baryshkov)
- Add a GPUVM section explaining why gpuvm is not used
  (Dmitry Baryshkov)
- Expand the memory management section to describe GEM usage and PRIME
  interoperability (Dmitry Baryshkov)
- Add links to the open-source user-space library and QAIC compiler, and
  document how to build them (Dmitry Baryshkov, Tomeu Vizoso)
---
 Documentation/accel/index.rst     |   1 +
 Documentation/accel/qda/index.rst |  13 +++
 Documentation/accel/qda/qda.rst   | 191 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 205 insertions(+)

diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index cbc7d4c3876a..5901ea7f784c 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -10,4 +10,5 @@ Compute Accelerators
    introduction
    amdxdna/index
    qaic/index
+   qda/index
    rocket/index
diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qda/index.rst
new file mode 100644
index 000000000000..013400cf9c25
--- /dev/null
+++ b/Documentation/accel/qda/index.rst
@@ -0,0 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+==================================
+accel/qda Qualcomm DSP Accelerator
+==================================
+
+The QDA driver provides a DRM accel based interface for Qualcomm DSP offload.
+It uses the FastRPC protocol and integrates with DRM and GEM infrastructure
+for device and buffer management.
+
+.. toctree::
+
+   qda
diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/qda.rst
new file mode 100644
index 000000000000..3a9ba4a90803
--- /dev/null
+++ b/Documentation/accel/qda/qda.rst
@@ -0,0 +1,191 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================================
+Qualcomm DSP Accelerator (QDA) Driver
+=====================================
+
+Introduction
+============
+
+The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides a
+DRM accel based interface for Qualcomm DSP offload, supporting workloads
+such as AI inference, computer vision, audio processing, and sensor offload
+on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM and
+GEM infrastructure for device and buffer management.
+
+Key Features
+============
+
+*   **DRM accel Interface**: Exposes a standard character device node
+    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
+*   **FastRPC Protocol**: Implements the FastRPC protocol for communication
+    between the application processor and the DSP.
+*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
+    allocation, lifecycle management, and DMA-BUF import/export.
+*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory isolation
+    between different DSP user sessions.
+*   **Modular Design**: Clean separation between the core DRM logic, the
+    memory manager, and the RPMsg-based transport layer.
+
+Architecture
+============
+
+The QDA driver consists of several functional blocks:
+
+1.  **Core Driver (``qda_drv``)**: Manages device registration, file operations,
+    and DRM accel integration.
+2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory management
+    layer that handles IOMMU context banks. It supports pluggable backends
+    (such as DMA-coherent) to adapt to different SoC memory architectures.
+3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer management:
+
+    * **``qda_gem``**: Core GEM object management, including allocation, mmap
+      operations, and buffer lifecycle management.
+    * **``qda_prime``**: PRIME import functionality for DMA-BUF interoperability
+      with other kernel subsystems.
+
+4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg framework
+    to handle low-level message passing with the DSP firmware.
+5.  **Compute Bus (``qda_compute_bus``)**: A virtual bus that enumerates the
+    compute context banks described in the device tree. IOMMU context banks are
+    synthetic constructs rather than real platform devices, so a dedicated bus
+    is a better fit than a platform driver, and it makes context bank lifetime
+    explicitly subordinate to the parent QDA device.
+6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic for
+    marshalling arguments and handling remote invocations.
+
+User-Space API
+==============
+
+The driver exposes a set of DRM-compliant IOCTLs:
+
+*   ``DRM_IOCTL_QDA_QUERY``: Query DSP parameters, such as the DSP name and
+    hardware capabilities, based on a user-specified ``query_type``.
+*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process context
+    on the DSP.
+*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation (the
+    primary execution unit).
+*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP usage.
+*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memory mapping.
+*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Map or unmap
+    buffers into the DSP's virtual address space. Each accepts a ``request``
+    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGACY`` /
+    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
+    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).
+
+    Note that ``DRM_IOCTL_QDA_REMOTE_INVOKE`` will automatically perform
+    dynamic, short-lived mappings for buffer arguments on the fly during a
+    single invocation. However, for performance-critical or frequently
+    used buffers, explicitly mapping them persistently via
+    ``DRM_IOCTL_QDA_REMOTE_MAP`` bypasses this dynamic pin/map/unmap overhead
+    on subsequent invocations.
+
+Usage Example
+=============
+
+A typical lifecycle for a user-space application:
+
+1.  **Discovery**: Open ``/dev/accel/accel*`` and use
+    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
+    device node.
+2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` to
+    establish a session and create a process context on the DSP.
+3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or import
+    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_TO_HANDLE``.
+4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass arguments and
+    execute functions on the DSP.
+5.  **Cleanup**: Close file descriptors to automatically release resources and
+    detach the session.
+
+Internal Implementation
+=======================
+
+Memory Management & GEM Usage
+-----------------------------
+The QDA driver uses the standard DRM GEM framework to manage memory buffers.
+Native buffers are allocated from coherent DMA memory and represented as GEM
+objects.
+
+The memory manager creates virtual "IOMMU devices" that map to hardware
+context banks, giving each user session an isolated address space. The
+DMA-coherent backend keeps data consistent between the CPU and DSP without
+manual cache maintenance.
+
+PRIME Interoperability
+~~~~~~~~~~~~~~~~~~~~~~
+By integrating with the DRM GEM PRIME interfaces, the QDA driver supports
+zero-copy sharing of memory buffers (DMA-BUFs) with other multimedia and
+compute subsystems on the SoC.
+
+GPUVM
+~~~~~
+While the DRM core provides the ``gpuvm`` helper framework to manage virtual
+address spaces, the QDA driver does not utilize it. This is because the DSP
+virtual address allocation and page table updates are managed entirely by the
+secure kernel running on the Hexagon DSP. The AP-side driver's responsibility
+is strictly limited to mapping physical pages into the SMMU context bank;
+therefore, the extra layer of AP-side VM tracking provided by GPUVM is redundant.
+
+Debugging
+=========
+Diagnostic messages are emitted through dynamic debug. Enable them for the
+whole driver with:
+
+.. code-block:: bash
+
+    echo "module qda +p" > /sys/kernel/debug/dynamic_debug/control
+
+Testing
+=======
+The QDA driver can be exercised using the ``fastrpc_test`` utility from the
+open-source FastRPC userspace library available at `qualcomm/fastrpc
+<https://github.com/qualcomm/fastrpc>`_.
+
+Building Userspace & Tests
+--------------------------
+To satisfy the DRM accel requirement for a fully open-source userspace toolchain,
+the compiler, userspace library, and test suite must be set up using standard
+open-source tools:
+
+1. **Install Compiler**: Install the latest LLVM.
+2. **QAIC Compiler**: The Qualcomm IDL Compiler (QAIC) is fully open-source and
+   available at `qualcomm/QAIC <https://github.com/qualcomm/QAIC>`_.
+3. **Build FastRPC Userspace Library**: Clone and compile the library:
+
+   .. code-block:: bash
+
+       git clone https://github.com/qualcomm/fastrpc.git
+       cd fastrpc
+       ./gitcompile --host=aarch64-linux-gnu
+       make
+       sudo make install
+
+Running the Test Application
+----------------------------
+Once installed, run the test utility on the target device:
+
+.. code-block:: bash
+
+    fastrpc_test -d 3 -U 1 -t linux -a v68
+
+**Options**
+
+``-d domain``
+    Select the DSP domain to run on:
+
+    * ``0`` — ADSP
+    * ``1`` — MDSP
+    * ``2`` — SDSP
+    * ``3`` — CDSP *(default on targets with CDSP)*
+
+``-U unsigned_PD``
+    Select signed or unsigned protection domain:
+
+    * ``0`` — signed PD
+    * ``1`` — unsigned PD *(default)*
+
+``-t target``
+    Target platform: ``android`` or ``linux`` *(default: linux)*
+
+``-a arch_version``
+    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*

-- 
2.34.1

