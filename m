Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081684;
	b=hHpuvot0VmtypionLU+HbHgkrs2LUle5Kra0ALsfSwvjXb4I9l2FzimaV1jeTm5rd2qS
	 o5rB6wPWbhrVcVYRj6K3xAW4hEcZI/gn0Bn3xcUcJRs2feCyh4YtBX2EIzt/6imYS2Z7C
	 aDwh2N3kf+6kWLot53fe1JftdBIAdd0kQOVD16O/NOyOWWDjsMHLH1BORYqdulOpD9ry6
	 tOlDlcmHrP5DdfBeOXrrs8PUidyT/Ikh8AJZcfZ0shsWPVS4LKmVOakkWvNpxXrVvbAV9
	 CJtSGqfDxRy1CHmjwJn3SaRYqlDl0w/MQJP+U229oydMMe5A+rlvp1eaHB/hikzAC6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5LJ+LLS11dMOrHp3ylnHLAxk9awq9BTceQxDhv4LO+E=;
	b=cSAV1LVIWmbiMIfX1hCCRUE2AVqPe8hYpi9QWTKPeQmKRd8Ik5rGQ47lxsodhr9g93C8
	 8bk87LGJZOdmZmmHCUWMvztyoHDdIkht6E/rhx+KKMgqmYPFKgZ0KhPhix1JZWZ1WQpPl
	 0iuvByuTDQzLd2ydmBO5EwMxiPRZsitgH/RbkfrREdup7ErGsbREWvRcn0QutOxRVANeN
	 OYTmgzubVl8j85kl5ZNt+i0YB6Rkfo8+o3HNVurQorrW6eqCc7A4HVC9ykgYTXM+dC60R
	 fJxI5FsbJ87Ng5IQxKFJhdU5FNc9yYuOFx9GeksES8OqZDa1QJOV69qdHwZ3q3HlGBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDBzCk8e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AqbpClRl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D04606A32F
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D04606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDBzCk8e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AqbpClRl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v6nv2030625
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:48:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5LJ+LLS11dM
	OrHp3ylnHLAxk9awq9BTceQxDhv4LO+E=; b=VDBzCk8enlx9ujtb21c+SVhuO/T
	+OptlEh4ESE1RuJCo8ne/raN5Dpk/y9qgfwLNkCbDlRKBK+BO3pYFnjl4DShmLXE
	uL/Q5m2yXWR2I79InBy2I+yN6PBjb4IJt3OrOlhdmCCk1Gy4o22EdOK/I+kXwl7U
	XQAPmh5KdeQl/ZE8xj6R5ImpJ7RHuYYYtboj9fnCAoUhFkxpU3RYgND9z/xkECq8
	CgKAn2g1ZCQZgms705q9amKAt/n0ePb8Ya4Zpvm+giroqduo+HJm3mD1xmWl0Y3d
	mm7L9Wxno+F5/YvIovqg5FJIndSuFbGSVvnLUtLper+iMEdb89+l9utP8AA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kuuhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:48:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92114c1e352so29637816d6.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 01:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081681; x=1795686481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LJ+LLS11dMOrHp3ylnHLAxk9awq9BTceQxDhv4LO+E=;
        b=AqbpClRlkVUD+n84dA1zNipjFPJr6fUTWnvSgs9PrjthewylYYhhiAxEuAsSK+nhtv
         1t+VQmeL2ZrOGx+T7akDcpXcfg/NJ6H75gt0nqH4Yk37NsISr24kW9oGO3nB7xIFH56e
         5LztixP8aROyI3xkmLoit4wnccgEqz8AlpmySOlNDcWZWfyg0oQxmVq8h79CVk/LNk5a
         8ID5Q12T6bZdfmYl0s08aBWwwcJjsadzGdHMI1t6bnJnOV2WhSBf+PJ6BbfrO5ksFD2R
         eHHreE82E3iBAJ+cnRpvJfQKteWwKT70Sj6DrCENrHko+gcF4UcjpYxxRYopphXtVfza
         nWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081681; x=1795686481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5LJ+LLS11dMOrHp3ylnHLAxk9awq9BTceQxDhv4LO+E=;
        b=PW1qseZ5Q7tniRXfp3NIjERpX6eFxSVHxZPNFcK1MhHLKB7SY0XugiGMYGwvKb86qS
         XsuAkVSKr3yVHgCIxyCKp1i/T0KWU5Wvz2cVYGolubuYqOv3pCLaj+MyrwtHjaqomB7L
         FQKZf1bAxNFM63K8byXcv5JO/73DsOqMj6EWviJN2ngIO3aJOCfSAXD5CEN1KF2t5RPJ
         /9NbdLRatwY7Nngp2Mv8auiRAr0iD5FeTFhX7qk7MfoDJo4bYokIwwd85f6k6eKJFNa1
         GhDfJKCbKsofhuClkhFndiwIxgns5yvIdzrWWDMlKqUQd+HhAO9E+8nnsTcDO0qpXaOL
         ilyQ==
X-Forwarded-Encrypted: i=1; AL+hErE7r9M9UKb1emkXx6edRmSxd798cOAsXe7X8lgFBZkwqjdRGuwv0f/9GLeCBraajGZg4yyX@lists.linux.dev
X-Gm-Message-State: APuU4Z8CZTYxYPMSLtmbcTkpC+3mFzcsOh1qi1CHbnH+qrysU8xKm/Cy
	P/yo07OzE1vovnylDz0Auru1iQF4VlTQBtx8tPyDOc1r0dYG9EUs/hWUKXObUOn93Q3BVjgHC3w
	Aq8F4YSSoXxagBBg008UQAYyTx5ktx4prkPVEB1q1RUwwOZRCiXfEOD6T
X-Gm-Gg: AYBFou2Au5QlbixJgktsF4lVPJIWBlkO6TYxuq00huodNt5EozXLkwstIbM059YZE87
	J3rfH2ORKPWRpHDsHnMOqAbzhIYyqO7NxyXEX2Y0vY8yGGw0r+3zflVpGEYPOZ6NkiSqTwsrD4K
	ha8dOVdKSrq9pxI/vSLqk6Lw3spSINiBS4EL/ggD8Eo5NjeIqC+vusiJT41jVqsGDOHFIeNpR42
	0Ro0IP/KOXewGCqwUBy/LpnvNcxQ/H31J0ere3dvcGizEYnAnNDzueuOXb4KoWCNsIKL+z+yc7W
	LcMe2EvikH5Rt6s9zIPG7wgrtvZayA7RGWZJiK0GLT8K3REMb0w6Yax5WFnIQF0Efb4mLD1KS+y
	LR4DYyzjgzTixtE7UDAA1BKLBMHGjnMZtQHrGKeut1kv0UErMSDZxMoFW5cafLs11vCR71vq6Ev
	JX
X-Received: by 2002:a05:620a:2b9a:b0:93e:c12c:43fa with SMTP id af79cd13be357-94999605c7fmr902958885a.71.1795081680539;
        Thu, 19 Nov 2026 01:48:00 -0800 (PST)
X-Received: by 2002:a05:620a:2b9a:b0:93e:c12c:43fa with SMTP id af79cd13be357-94999605c7fmr902955485a.71.1795081679784;
        Thu, 19 Nov 2026 01:47:59 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:59 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        linux-kernel@vger.kernel.org (open list),
        llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Subject: [PATCH v1 12/12] thermal: testing: Add KUnit coverage for zone aggregation
Date: Thu, 19 Nov 2026 10:46:54 +0100
Message-ID: <20261119094706.3439040-13-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
References: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX2daYe74pPBV1
 +OwYzcdcw9vJyJE18wnRjO6EtTAod9eyFhiPxvf46DmbNDtha4fF4clPKaTEvUA0a+Vwq5n5Tcv
 H/HAB5Uml3yiQ9uSl17wp/+WevGX8ylLkmz6UljpAIrWvFFIg2b1mHNrHi2zuXqAkcAIfZAX6M1
 QhcYPapNTCk+c5XVV70hOKVKqlSIZSO5J6ARTDTmgXHZFLu8uLy7gyowbWw/i0x87FdM8jQXxnA
 nh41Y/ayNNyUkDXm3VjmtY6Ngbd+xT0z0xbqcR6KT3Bn1nYxgmyI5O7B1r0IM8NeUuDSZSl2qDD
 3qS+6bnU8KAsivXcCBu4vmEfWcMh1wp5b7hXp0rak1C00fEjoSdBfVVt35dp+X86UJOPIdgMKeH
 ApbCIeJh/eL/IJudnn0g0qWQAoNaqgROb8ToVNVZbaaAsMPXO+uIw628VUoJxl11BrAHl3Svl6S
 trtwJFYtXJ+wwgYAjHQ==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afec5d1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=GmbsGlP3dkMbaMCww00A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX67hoZn0O+lhu
 4B1P4rhWEbtVATzYfIdwkLeqEi5ZKXohI+6/p3oVVHFEPFcb79+DgatGaXU3sNb0eAdX4S1ALPe
 OCopD0kR8LFaEEBMKJdGJisCXjj/VPU=
X-Proofpoint-ORIG-GUID: vHaKFB7mbunTs-UW3de3RL_rCHBaNMVe
X-Proofpoint-GUID: vHaKFB7mbunTs-UW3de3RL_rCHBaNMVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Exercise thermal zone aggregation without platform hardware by adding
core and OF KUnit suites under drivers/thermal/testing/.

Cover default coefficient distributions and their limits, validation of
source zones and destination operations, and registration with core-owned
temperature calculation. Check signed fixed-point arithmetic, fractional
contributions, negative rounding, zero-sum combinations, source errors,
invalid readings, accumulator overflow and final temperature range checks.
Verify that failed calculations preserve the output and busy source locks
return -EAGAIN. Keep legacy source temperature and slope/offset checks.

Use a test-managed OF overlay to exercise deferred aggregate creation,
synchronous retries, duplicate source rejection, zero-cell providers,
signed coefficient conversion and malformed descriptions. Verify cleanup
after registration failure, destruction of dependent aggregates before
source removal, and recreation when a source returns. Coordinate reader
and removal threads to exercise teardown while a source callback is active.

Keep both suites independent of the debugfs testing facility. Include core
and OF suites in their implementation files under dedicated KUnit
options to access static helpers without exporting them.
Provide a UML configuration with lockdep and document execution and the
limits of synthetic coverage.

All 23 cases pass on UML with lockdep, including a run with UBSAN bounds
checking. GCC and Clang x86-64 thermal subsystem builds with W=1 also pass.
Initial late-init discovery and real hardware or module loading are not
covered by these tests.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/Kconfig                       |  23 ++
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/testing/.kunitconfig          |  11 +
 drivers/thermal/testing/README.rst            |  34 ++
 .../thermal/testing/thermal_aggregation.dtso  |  53 +++
 .../testing/thermal_aggregation_test.c        | 351 ++++++++++++++++++
 .../testing/thermal_of_aggregation_test.c     | 330 ++++++++++++++++
 drivers/thermal/thermal_aggregation.c         |   4 +
 drivers/thermal/thermal_of.c                  |   4 +
 9 files changed, 811 insertions(+)
 create mode 100644 drivers/thermal/testing/.kunitconfig
 create mode 100644 drivers/thermal/testing/README.rst
 create mode 100644 drivers/thermal/testing/thermal_aggregation.dtso
 create mode 100644 drivers/thermal/testing/thermal_aggregation_test.c
 create mode 100644 drivers/thermal/testing/thermal_of_aggregation_test.c

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index b5185084eac1..f0023fb7e693 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -57,6 +57,29 @@ config THERMAL_CORE_TESTING
 	  with trip points in order to exercise the thermal core
 	  functionality in a controlled way.
 
+config THERMAL_AGGREGATION_KUNIT_TEST
+	bool "KUnit tests for thermal zone aggregation" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y && THERMAL_AGGREGATION
+	default KUNIT_ALL_TESTS
+	help
+	  Test coefficient initialization, validation, temperature arithmetic,
+	  and registration of aggregated thermal zones with synthetic sources.
+	  No thermal hardware is required.
+	  If unsure, say N.
+
+config THERMAL_OF_AGGREGATION_KUNIT_TEST
+	bool "KUnit tests for OF thermal aggregation" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y && THERMAL_AGGREGATION
+	depends on THERMAL_OF && OF_OVERLAY && OF_EARLY_FLATTREE
+	default KUNIT_ALL_TESTS
+	help
+	  Test OF aggregation with a test-managed device tree overlay.
+	  Verify source lookup and deferred aggregate creation.
+	  Cover coefficient parsing, source removal and recreation.
+	  These tests use synthetic sources without thermal hardware.
+	  Run these tests with KUnit's OF overlay support enabled.
+	  If unsure, say N.
+
 config THERMAL_EMERGENCY_POWEROFF_DELAY_MS
 	int "Emergency poweroff delay in milli-seconds"
 	default 0
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index d059ca528908..38951f02aa3a 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -8,6 +8,7 @@ thermal_sys-y			+= thermal_core.o thermal_sysfs.o
 thermal_sys-y			+= thermal_trip.o thermal_helpers.o
 thermal_sys-y			+= thermal_thresholds.o
 thermal_sys-$(CONFIG_THERMAL_AGGREGATION) += thermal_aggregation.o
+thermal_sys-$(CONFIG_THERMAL_OF_AGGREGATION_KUNIT_TEST) += testing/thermal_aggregation.dtbo.o
 
 # netlink interface to manage the thermal framework
 thermal_sys-$(CONFIG_THERMAL_NETLINK)		+= thermal_netlink.o
diff --git a/drivers/thermal/testing/.kunitconfig b/drivers/thermal/testing/.kunitconfig
new file mode 100644
index 000000000000..d61242498bff
--- /dev/null
+++ b/drivers/thermal/testing/.kunitconfig
@@ -0,0 +1,11 @@
+CONFIG_KUNIT=y
+CONFIG_THERMAL=y
+CONFIG_THERMAL_AGGREGATION=y
+CONFIG_THERMAL_AGGREGATION_KUNIT_TEST=y
+CONFIG_OF=y
+CONFIG_OF_OVERLAY=y
+CONFIG_OF_EARLY_FLATTREE=y
+CONFIG_THERMAL_OF=y
+CONFIG_THERMAL_OF_AGGREGATION_KUNIT_TEST=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_PROVE_LOCKING=y
diff --git a/drivers/thermal/testing/README.rst b/drivers/thermal/testing/README.rst
new file mode 100644
index 000000000000..039809822c78
--- /dev/null
+++ b/drivers/thermal/testing/README.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Thermal aggregation KUnit tests
+==============================
+
+Run the core and OF suites on UML from the kernel source directory::
+
+  ./tools/testing/kunit/kunit.py run \
+      --kunitconfig=drivers/thermal/testing/.kunitconfig
+
+The configuration enables lockdep. Neither suite requires thermal hardware
+or the debugfs-based CONFIG_THERMAL_CORE_TESTING facility.
+Both suites require CONFIG_THERMAL_AGGREGATION.
+
+The core suite covers default coefficients, validation, fixed-point arithmetic,
+registration and source lock contention. Arithmetic cases include signed and
+zero-sum coefficients, negative temperatures, rounding, read failures, overflow
+and output preservation on failure. Zero coefficients are tested in the read
+path only: before initialization they denote unspecified coefficients.
+
+The OF suite applies a test-managed overlay in /thermal-kunit, outside the
+platform's /thermal-zones. It exercises deferred creation, provider lookup,
+zero-cell providers, coefficient conversion, registration failure cleanup,
+source removal and recreation, and a temperature read racing with source
+removal. Source and consumer zones are destroyed before removing the overlay.
+The suite temporarily enables retries because UML's empty root has no
+/thermal-zones node for the production late-init scan.
+
+Core tests are included by thermal_aggregation.c and OF tests by thermal_of.c
+to access static helpers without exporting them. Suites and overlay data are
+enabled only by their KUnit
+configuration options. These tests do not exercise platform-specific hardware,
+the initial late-init discovery scan, or real module loading. Reload is modeled
+by unregistering and recreating a source zone with the same provider and ID.
diff --git a/drivers/thermal/testing/thermal_aggregation.dtso b/drivers/thermal/testing/thermal_aggregation.dtso
new file mode 100644
index 000000000000..b8ce37602036
--- /dev/null
+++ b/drivers/thermal/testing/thermal_aggregation.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	thermal-kunit {
+		provider: sensor {
+			#thermal-sensor-cells = <1>;
+		};
+		provider_zero: sensor-zero {
+			#thermal-sensor-cells = <0>;
+		};
+		zero-cells {
+			thermal-sensors = <&provider_zero>, <&provider 1>;
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+		};
+
+		average {
+			thermal-sensors = <&provider 0>, <&provider 1>;
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+		};
+
+		explicit {
+			thermal-sensors = <&provider 0>, <&provider 1>;
+			coefficients = <2 (-1) (-1000)>;
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+		};
+
+		partial {
+			thermal-sensors = <&provider 0>, <&provider 1>;
+			coefficients = <1>;
+		};
+
+		zero {
+			thermal-sensors = <&provider 0>, <&provider 1>;
+			coefficients = <1 0>;
+		};
+
+		overflow {
+			thermal-sensors = <&provider 0>, <&provider 1>;
+			coefficients = <2147483647 1>;
+		};
+
+		bad-delay {
+			thermal-sensors = <&provider 0>, <&provider 1>;
+			polling-delay = <100>;
+			polling-delay-passive = <200>;
+		};
+	};
+};
diff --git a/drivers/thermal/testing/thermal_aggregation_test.c b/drivers/thermal/testing/thermal_aggregation_test.c
new file mode 100644
index 000000000000..6a5f3fe41db6
--- /dev/null
+++ b/drivers/thermal/testing/thermal_aggregation_test.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <kunit/test.h>
+#include <linux/kthread.h>
+
+#include "../thermal_core.h"
+
+struct aggregation_source {
+	int temperature;
+	int error;
+	unsigned int reads;
+};
+
+struct aggregation_fixture {
+	struct thermal_zone_device *sources[3];
+	struct aggregation_source data[3];
+	struct thermal_zone_device *destination;
+	struct thermal_zone_aggregate_entry entries[3];
+	struct thermal_zone_aggregate aggregate;
+	struct thermal_zone_params params;
+};
+
+static int aggregation_source_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct aggregation_source *source = thermal_zone_device_priv(tz);
+
+	lockdep_assert_held(&tz->lock);
+	source->reads++;
+	if (source->error)
+		return source->error;
+	*temp = source->temperature;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops aggregation_source_ops = {
+	.get_temp = aggregation_source_temp,
+};
+
+static const struct thermal_zone_device_ops aggregation_destination_ops;
+
+static void aggregation_cleanup(void *data)
+{
+	struct aggregation_fixture *fixture = data;
+	unsigned int i;
+
+	if (fixture->destination)
+		thermal_zone_device_unregister(fixture->destination);
+	for (i = 0; i < ARRAY_SIZE(fixture->sources); i++)
+		if (fixture->sources[i])
+			thermal_zone_device_unregister(fixture->sources[i]);
+}
+
+static int aggregation_init(struct kunit *test)
+{
+	const struct thermal_zone_params params = { .no_hwmon = true };
+	struct aggregation_fixture *fixture;
+	unsigned int i;
+
+	fixture = kunit_kzalloc(test, sizeof(*fixture), GFP_KERNEL);
+	if (!fixture)
+		return -ENOMEM;
+	test->priv = fixture;
+	if (kunit_add_action_or_reset(test, aggregation_cleanup, fixture))
+		return -ENOMEM;
+	for (i = 0; i < ARRAY_SIZE(fixture->sources); i++) {
+		struct thermal_zone_device *tz;
+
+		fixture->data[i].temperature = 20000 + i * 10000;
+		tz = thermal_zone_device_register_with_trips("kunit-source", NULL, 0,
+							     &fixture->data[i],
+							     &aggregation_source_ops,
+							     &params, 0, 0);
+		if (IS_ERR(tz))
+			return PTR_ERR(tz);
+		fixture->sources[i] = tz;
+		fixture->entries[i].tz = tz;
+	}
+	fixture->aggregate.entries = fixture->entries;
+	fixture->aggregate.num_entries = 3;
+	fixture->params.no_hwmon = true;
+	fixture->params.aggregate = &fixture->aggregate;
+	return 0;
+}
+
+static void aggregation_defaults_test(struct kunit *test)
+{
+	static const unsigned int counts[] = { 1, 2, 3, 4, 5, 6, 1000 };
+	static const s32 six[] = { 167, 167, 167, 167, 166, 166 };
+	struct thermal_zone_aggregate aggregate = {};
+	unsigned int c, i;
+
+	aggregate.entries = kunit_kcalloc(test, 1001, sizeof(*aggregate.entries), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, aggregate.entries);
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_init_coefficients(NULL), -EINVAL);
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_init_coefficients(&aggregate), -EINVAL);
+	for (c = 0; c < ARRAY_SIZE(counts); c++) {
+		s32 sum = 0;
+
+		memset(aggregate.entries, 0, 1001 * sizeof(*aggregate.entries));
+		aggregate.num_entries = counts[c];
+		KUNIT_ASSERT_EQ(test, thermal_zone_aggregate_init_coefficients(&aggregate), 0);
+		for (i = 0; i < aggregate.num_entries; i++) {
+			s32 value = aggregate.entries[i].coefficient;
+
+			sum += value;
+			KUNIT_EXPECT_GT(test, value, 0);
+			if (i)
+				KUNIT_EXPECT_LE(test,
+						aggregate.entries[i - 1].coefficient - value, 1);
+			if (counts[c] == 3)
+				KUNIT_EXPECT_EQ(test, value, i ? 333 : 334);
+			if (counts[c] == 6)
+				KUNIT_EXPECT_EQ(test, value, six[i]);
+		}
+		KUNIT_EXPECT_EQ(test, sum, 1000);
+	}
+	memset(aggregate.entries, 0, 1001 * sizeof(*aggregate.entries));
+	aggregate.num_entries = 1001;
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_init_coefficients(&aggregate), -EINVAL);
+	KUNIT_EXPECT_EQ(test, aggregate.entries[0].coefficient, 0);
+}
+
+static int aggregation_set_trips(struct thermal_zone_device *tz, int low, int high)
+{
+	return 0;
+}
+
+static void aggregation_validation_test(struct kunit *test)
+{
+	struct aggregation_fixture *fixture = test->priv;
+	struct thermal_zone_device_ops ops = {};
+	struct thermal_zone_params nested = { .aggregate = &fixture->aggregate };
+	struct thermal_zone_device *source = fixture->sources[0];
+	struct thermal_zone_params *saved_params = source->tzp;
+
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(NULL, &ops), -EINVAL);
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(&fixture->aggregate, NULL), -EINVAL);
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(&fixture->aggregate, &ops), 0);
+	fixture->entries[0].coefficient = 500;
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(&fixture->aggregate, &ops), -EINVAL);
+	fixture->entries[1].coefficient = -500;
+	fixture->entries[2].coefficient = 2000;
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(&fixture->aggregate, &ops), 0);
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_init_coefficients(&fixture->aggregate), 0);
+	KUNIT_EXPECT_EQ(test, fixture->entries[0].coefficient, 500);
+	KUNIT_EXPECT_EQ(test, fixture->entries[1].coefficient, -500);
+	ops.set_trips = aggregation_set_trips;
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(&fixture->aggregate, &ops), -EINVAL);
+	ops.set_trips = NULL;
+	fixture->entries[0].tz = NULL;
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(&fixture->aggregate, &ops), -ENODEV);
+	fixture->entries[0].tz = source;
+	source->tzp = &nested;
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(&fixture->aggregate, &ops), -EINVAL);
+	source->tzp = saved_params;
+	source->state |= TZ_STATE_FLAG_EXIT;
+	KUNIT_EXPECT_EQ(test, thermal_zone_aggregate_validate(&fixture->aggregate, &ops), -ENODEV);
+	source->state &= ~TZ_STATE_FLAG_EXIT;
+}
+
+struct aggregation_case {
+	const char *name;
+	unsigned int count;
+	s32 coefficients[3];
+	int temperatures[3];
+	int offset;
+	int error;
+	int expected;
+	int result;
+};
+
+static const struct aggregation_case aggregation_cases[] = {
+	{ "single", 1, { 1000 }, { 42000 }, 0, 0, 42000, 0 },
+	{ "affine", 2, { 700, 500 }, { 20000, 30000 }, -2000, 0, 27000, 0 },
+	{ "fractional", 2, { 250, 750 }, { 10000, 20000 }, 0, 0, 17500, 0 },
+	{ "divide once", 2, { 500, 500 }, { 1, 1 }, 0, 0, 1, 0 },
+	{ "negative rounding", 1, { -500 }, { 3 }, -2, 0, -3, 0 },
+	{ "negative source", 1, { 1500 }, { -10000 }, 0, 0, -15000, 0 },
+	{ "zero sum", 2, { 500, -500 }, { 20000, 10000 }, 0, 0, 5000, 0 },
+	{ "zero multiplier at read time", 2, { 0, 1000 }, { 20000, 30000 }, 0, 0, 30000, 0 },
+	{ "read error", 2, { 1000, 1000 }, { 20000, 30000 }, 0, -EIO, 0, -EIO },
+	{ "invalid reading", 1, { 1000 }, { THERMAL_TEMP_INVALID }, 0, 0, 0, -ENODATA },
+	{ "positive overflow", 3, { S32_MAX, S32_MAX, S32_MAX },
+	  { INT_MAX, INT_MAX, INT_MAX }, 0, 0, 0, -ERANGE },
+	{ "negative overflow", 3, { S32_MIN, S32_MIN, S32_MIN },
+	  { INT_MAX, INT_MAX, INT_MAX }, 0, 0, 0, -ERANGE },
+	{ "upper range", 1, { 1000 }, { INT_MAX }, 1, 0, 0, -ERANGE },
+	{ "lower range", 1, { -2000 }, { INT_MAX }, 0, 0, 0, -ERANGE },
+};
+
+static void aggregation_case_desc(const struct aggregation_case *param, char *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(aggregation, aggregation_cases, aggregation_case_desc);
+
+static void aggregation_calculation_test(struct kunit *test)
+{
+	const struct aggregation_case *param = test->param_value;
+	struct aggregation_fixture *fixture = test->priv;
+	struct thermal_zone_device *tz;
+	unsigned int i;
+	int temp = 12345;
+	int ret;
+
+	/* A private destination allows testing post-initialization zero values. */
+	tz = kunit_kzalloc(test, sizeof(*tz), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tz);
+	mutex_init(&tz->lock);
+	tz->tzp = &fixture->params;
+	fixture->aggregate.num_entries = param->count;
+	fixture->params.offset = param->offset;
+	for (i = 0; i < param->count; i++) {
+		fixture->entries[i].coefficient = param->coefficients[i];
+		fixture->data[i].temperature = param->temperatures[i];
+	}
+	fixture->data[0].error = param->error;
+	mutex_lock(&tz->lock);
+	ret = thermal_zone_get_temp_aggregate(tz, &temp);
+	mutex_unlock(&tz->lock);
+	KUNIT_EXPECT_EQ(test, ret, param->result);
+	KUNIT_EXPECT_EQ(test, temp, ret ? 12345 : param->expected);
+	if (param->error)
+		KUNIT_EXPECT_EQ(test, fixture->data[1].reads, 0);
+	mutex_destroy(&tz->lock);
+}
+
+static void aggregation_registration_test(struct kunit *test)
+{
+	struct aggregation_fixture *fixture = test->priv;
+	struct thermal_zone_device *tz;
+	int temp;
+
+	tz = thermal_zone_device_register_with_trips("kunit-aggregate", NULL, 0, NULL,
+						     &aggregation_destination_ops,
+						     &fixture->params, 0, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tz);
+	fixture->destination = tz;
+	KUNIT_EXPECT_EQ(test, fixture->entries[0].coefficient, 334);
+	KUNIT_ASSERT_EQ(test, thermal_zone_get_temp(tz, &temp), 0);
+	KUNIT_EXPECT_EQ(test, temp, 29990);
+	KUNIT_ASSERT_EQ(test, thermal_zone_device_enable(tz), 0);
+	KUNIT_EXPECT_EQ(test, tz->temperature, 29990);
+	KUNIT_ASSERT_EQ(test, thermal_zone_get_temp(fixture->sources[0], &temp), 0);
+	KUNIT_EXPECT_EQ(test, temp, 20000);
+	KUNIT_EXPECT_EQ(test, thermal_zone_get_slope(fixture->sources[0]), 0);
+	fixture->sources[0]->tzp->slope = 348;
+	fixture->sources[0]->tzp->offset = -9301;
+	KUNIT_EXPECT_EQ(test, thermal_zone_get_slope(fixture->sources[0]), 348);
+	KUNIT_EXPECT_EQ(test, thermal_zone_get_offset(fixture->sources[0]), -9301);
+	KUNIT_ASSERT_EQ(test, thermal_zone_get_temp(fixture->sources[0], &temp), 0);
+	KUNIT_EXPECT_EQ(test, temp, 20000);
+
+	fixture->sources[0]->state |= TZ_STATE_FLAG_EXIT;
+	KUNIT_EXPECT_EQ(test, thermal_zone_get_temp(tz, &temp), -ENODEV);
+	fixture->sources[0]->state &= ~TZ_STATE_FLAG_EXIT;
+}
+
+static void aggregation_registration_failure_test(struct kunit *test)
+{
+	struct aggregation_fixture *fixture = test->priv;
+	struct thermal_zone_device_ops ops = { .set_trips = aggregation_set_trips };
+	struct thermal_zone_device *tz;
+
+	tz = thermal_zone_device_register_with_trips("kunit-rejected", NULL, 0, NULL,
+						     &ops, &fixture->params, 0, 0);
+	KUNIT_EXPECT_EQ(test, PTR_ERR(tz), -EINVAL);
+	fixture->entries[0].coefficient = 1000;
+	tz = thermal_zone_device_register_with_trips("kunit-partial", NULL, 0, NULL,
+						     &aggregation_destination_ops,
+						     &fixture->params, 0, 0);
+	KUNIT_EXPECT_EQ(test, PTR_ERR(tz), -EINVAL);
+	KUNIT_EXPECT_EQ(test, fixture->entries[1].coefficient, 0);
+}
+
+struct aggregation_busy_context {
+	struct thermal_zone_device *tz;
+	struct completion locked;
+	struct completion release;
+};
+
+static int aggregation_hold_source(void *data)
+{
+	struct aggregation_busy_context *ctx = data;
+
+	mutex_lock(&ctx->tz->lock);
+	complete(&ctx->locked);
+	wait_for_completion(&ctx->release);
+	mutex_unlock(&ctx->tz->lock);
+	while (!kthread_should_stop()) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (!kthread_should_stop())
+			schedule();
+	}
+	__set_current_state(TASK_RUNNING);
+	return 0;
+}
+
+static void aggregation_busy_source_test(struct kunit *test)
+{
+	struct aggregation_fixture *fixture = test->priv;
+	struct aggregation_busy_context ctx = { .tz = fixture->sources[0] };
+	struct task_struct *task;
+	struct thermal_zone_device *tz;
+	int temp = 12345;
+
+	tz = thermal_zone_device_register_with_trips("kunit-busy", NULL, 0, NULL,
+						     &aggregation_destination_ops,
+						     &fixture->params, 0, 0);
+	if (IS_ERR(tz)) {
+		KUNIT_FAIL(test, "cannot register destination");
+		return;
+	}
+	fixture->destination = tz;
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fixture->destination);
+	init_completion(&ctx.locked);
+	init_completion(&ctx.release);
+	task = kthread_run(aggregation_hold_source, &ctx, "thermal-kunit-lock");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(task));
+	if (!wait_for_completion_timeout(&ctx.locked, HZ)) {
+		complete(&ctx.release);
+		kthread_stop(task);
+		KUNIT_FAIL(test, "source lock was not acquired");
+		return;
+	}
+	KUNIT_EXPECT_EQ(test, thermal_zone_get_temp(fixture->destination, &temp), -EAGAIN);
+	KUNIT_EXPECT_EQ(test, temp, 12345);
+	complete(&ctx.release);
+	kthread_stop(task);
+}
+
+static struct kunit_case thermal_aggregation_cases[] = {
+	KUNIT_CASE(aggregation_defaults_test),
+	KUNIT_CASE(aggregation_validation_test),
+	KUNIT_CASE_PARAM(aggregation_calculation_test, aggregation_gen_params),
+	KUNIT_CASE(aggregation_registration_test),
+	KUNIT_CASE(aggregation_registration_failure_test),
+	KUNIT_CASE(aggregation_busy_source_test),
+	{}
+};
+
+static struct kunit_suite thermal_aggregation_suite = {
+	.name = "thermal-aggregation",
+	.init = aggregation_init,
+	.test_cases = thermal_aggregation_cases,
+};
+
+kunit_test_suite(thermal_aggregation_suite);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/thermal/testing/thermal_of_aggregation_test.c b/drivers/thermal/testing/thermal_of_aggregation_test.c
new file mode 100644
index 000000000000..82a0c9e9c5c9
--- /dev/null
+++ b/drivers/thermal/testing/thermal_of_aggregation_test.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Included by thermal_of.c to exercise private OF lifecycle operations. */
+
+#include <kunit/of.h>
+#include <kunit/test.h>
+#include <linux/kthread.h>
+
+struct thermal_of_test_reading {
+	int temperature;
+	struct completion *entered;
+	struct completion *release;
+};
+
+struct thermal_of_test_context {
+	struct device_node *provider;
+	struct device_node *root;
+	struct device_node *provider_zero;
+	struct thermal_zone_device *sources[2];
+	struct thermal_of_test_reading readings[2];
+	struct thermal_of_aggregate aggregate;
+	bool listed;
+	bool was_ready;
+};
+
+static int thermal_of_test_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct thermal_of_test_reading *reading = thermal_zone_device_priv(tz);
+
+	lockdep_assert_held(&tz->lock);
+	if (reading->entered) {
+		complete(reading->entered);
+		wait_for_completion(reading->release);
+	}
+	*temp = reading->temperature;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops thermal_of_test_ops = {
+	.get_temp = thermal_of_test_temp,
+};
+
+static void thermal_of_test_cleanup(void *data)
+{
+	struct thermal_of_test_context *ctx = data;
+	unsigned int i;
+
+	{
+		guard(mutex)(&thermal_of_lock);
+		if (ctx->listed)
+			list_del(&ctx->aggregate.node);
+		thermal_of_aggregate_release(&ctx->aggregate);
+		thermal_of_aggregates_ready = ctx->was_ready;
+	}
+	for (i = 0; i < ARRAY_SIZE(ctx->sources); i++)
+		if (ctx->sources[i])
+			thermal_of_zone_unregister(ctx->sources[i]);
+	of_node_put(ctx->aggregate.np);
+	of_node_put(ctx->provider);
+	of_node_put(ctx->provider_zero);
+	of_node_put(ctx->root);
+}
+
+static int thermal_of_test_init(struct kunit *test)
+{
+	const struct thermal_zone_params params = { .no_hwmon = true };
+	struct thermal_of_test_context *ctx;
+	unsigned int i;
+	int ret;
+
+	ret = of_overlay_apply_kunit(test, thermal_aggregation);
+	if (ret)
+		return ret;
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+	{
+		guard(mutex)(&thermal_of_lock);
+		ctx->was_ready = thermal_of_aggregates_ready;
+		/* The empty UML tree has no /thermal-zones for the late init scan. */
+		thermal_of_aggregates_ready = true;
+	}
+	ret = kunit_add_action_or_reset(test, thermal_of_test_cleanup, ctx);
+	if (ret)
+		return ret;
+	ctx->root = of_find_node_by_path("/thermal-kunit");
+	if (!ctx->root)
+		return -ENODEV;
+	ctx->provider = of_get_child_by_name(ctx->root, "sensor");
+	if (!ctx->provider)
+		return -ENODEV;
+	ctx->provider_zero = of_get_child_by_name(ctx->root, "sensor-zero");
+	if (!ctx->provider_zero)
+		return -ENODEV;
+	for (i = 0; i < ARRAY_SIZE(ctx->sources); i++) {
+		struct thermal_zone_device *tz;
+
+		ctx->readings[i].temperature = 20000 + i * 10000;
+		tz = thermal_zone_device_register_with_trips("of-kunit-source", NULL, 0,
+							     &ctx->readings[i],
+							     &thermal_of_test_ops, &params, 0, 0);
+		if (IS_ERR(tz))
+			return PTR_ERR(tz);
+		ctx->sources[i] = tz;
+	}
+	return 0;
+}
+
+static void thermal_of_deferred_lifecycle_test(struct kunit *test)
+{
+	struct thermal_of_test_context *ctx = test->priv;
+	struct thermal_zone_device *old_source;
+	const struct thermal_zone_params params = { .no_hwmon = true };
+	int temp;
+
+	ctx->aggregate.np = of_get_child_by_name(ctx->root, "average");
+	KUNIT_ASSERT_NOT_NULL(test, ctx->aggregate.np);
+	{
+		guard(mutex)(&thermal_of_lock);
+		list_add(&ctx->aggregate.node, &thermal_of_aggregates);
+		ctx->listed = true;
+		KUNIT_EXPECT_EQ(test, thermal_of_aggregate_create(&ctx->aggregate), -EPROBE_DEFER);
+		KUNIT_EXPECT_PTR_EQ(test, ctx->aggregate.aggregate.entries, NULL);
+	}
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider, 0, ctx->sources[0]), 0);
+	KUNIT_EXPECT_PTR_EQ(test, ctx->aggregate.tz, NULL);
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider, 1, ctx->sources[1]), 0);
+	KUNIT_ASSERT_NOT_NULL(test, ctx->aggregate.tz);
+	KUNIT_ASSERT_EQ(test, thermal_zone_get_temp(ctx->aggregate.tz, &temp), 0);
+	KUNIT_EXPECT_EQ(test, temp, 25000);
+	KUNIT_EXPECT_EQ(test, ctx->aggregate.aggregate.entries[0].coefficient, 500);
+	KUNIT_EXPECT_EQ(test, thermal_of_source_add(ctx->provider, 0, ctx->sources[0]), -EEXIST);
+	{
+		struct thermal_zone_device *tz = ctx->aggregate.tz;
+
+		guard(mutex)(&thermal_of_lock);
+		thermal_of_aggregate_retry();
+		KUNIT_EXPECT_PTR_EQ(test, ctx->aggregate.tz, tz);
+	}
+
+	/* Removal must destroy the consumer and release references before returning. */
+	old_source = ctx->sources[0];
+	ctx->sources[0] = NULL;
+	thermal_of_zone_unregister(old_source);
+	KUNIT_EXPECT_PTR_EQ(test, ctx->aggregate.tz, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, ctx->aggregate.aggregate.entries, NULL);
+	KUNIT_EXPECT_FALSE(test, ctx->aggregate.failed);
+	old_source = thermal_zone_device_register_with_trips("of-kunit-reloaded", NULL, 0,
+							     &ctx->readings[0],
+							     &thermal_of_test_ops,
+							     &params, 0, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_source);
+	ctx->sources[0] = old_source;
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider, 0, ctx->sources[0]), 0);
+	KUNIT_ASSERT_NOT_NULL(test, ctx->aggregate.tz);
+	KUNIT_EXPECT_EQ(test, thermal_zone_get_temp(ctx->aggregate.tz, &temp), 0);
+	KUNIT_EXPECT_EQ(test, temp, 25000);
+}
+
+static void thermal_of_coefficients_test(struct kunit *test)
+{
+	static const struct {
+		const char *name;
+		int result;
+	} cases[] = {
+		{ "explicit", 0 },
+		{ "partial", -EINVAL },
+		{ "zero", -EINVAL },
+		{ "overflow", -ERANGE },
+		{ "bad-delay", -EINVAL },
+	};
+	struct thermal_of_test_context *ctx = test->priv;
+	unsigned int i;
+	int temp;
+
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider, 0, ctx->sources[0]), 0);
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider, 1, ctx->sources[1]), 0);
+	for (i = 0; i < ARRAY_SIZE(cases); i++) {
+		struct thermal_of_aggregate aggregate = {};
+		int ret;
+
+		aggregate.np = of_get_child_by_name(ctx->root, cases[i].name);
+		KUNIT_ASSERT_NOT_NULL(test, aggregate.np);
+		{
+			guard(mutex)(&thermal_of_lock);
+			ret = thermal_of_aggregate_create(&aggregate);
+		}
+		KUNIT_EXPECT_EQ_MSG(test, ret, cases[i].result, "%s", cases[i].name);
+		if (!ret) {
+			KUNIT_EXPECT_EQ(test, aggregate.aggregate.entries[0].coefficient, 2000);
+			KUNIT_EXPECT_EQ(test, aggregate.aggregate.entries[1].coefficient, -1000);
+			KUNIT_EXPECT_EQ(test, thermal_zone_get_temp(aggregate.tz, &temp), 0);
+			KUNIT_EXPECT_EQ(test, temp, 9000);
+		} else {
+			KUNIT_EXPECT_PTR_EQ(test, aggregate.aggregate.entries, NULL);
+			KUNIT_EXPECT_EQ(test, aggregate.aggregate.num_entries, 0);
+		}
+		{
+			guard(mutex)(&thermal_of_lock);
+			thermal_of_aggregate_release(&aggregate);
+		}
+		of_node_put(aggregate.np);
+	}
+}
+
+static void thermal_of_zero_cells_test(struct kunit *test)
+{
+	struct thermal_of_test_context *ctx = test->priv;
+	int temp;
+
+	ctx->aggregate.np = of_get_child_by_name(ctx->root, "zero-cells");
+	KUNIT_ASSERT_NOT_NULL(test, ctx->aggregate.np);
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider_zero, 0, ctx->sources[0]), 0);
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider, 1, ctx->sources[1]), 0);
+	{
+		guard(mutex)(&thermal_of_lock);
+		KUNIT_EXPECT_EQ(test, thermal_of_aggregate_create(&ctx->aggregate), 0);
+	}
+	KUNIT_ASSERT_NOT_NULL(test, ctx->aggregate.tz);
+	KUNIT_EXPECT_EQ(test, thermal_zone_get_temp(ctx->aggregate.tz, &temp), 0);
+	KUNIT_EXPECT_EQ(test, temp, 25000);
+}
+
+struct thermal_of_test_thread {
+	struct thermal_zone_device *tz;
+	struct completion started;
+	struct completion done;
+	bool remove;
+	int result;
+	int temperature;
+};
+
+static int thermal_of_test_thread_fn(void *data)
+{
+	struct thermal_of_test_thread *thread = data;
+
+	complete(&thread->started);
+	if (thread->remove)
+		thermal_of_zone_unregister(thread->tz);
+	else
+		thread->result = thermal_zone_get_temp(thread->tz, &thread->temperature);
+	complete(&thread->done);
+	/* Keep task storage valid until the test joins with kthread_stop(). */
+	while (!kthread_should_stop()) {
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (!kthread_should_stop())
+			schedule();
+	}
+	__set_current_state(TASK_RUNNING);
+	return 0;
+}
+
+static void thermal_of_concurrent_removal_test(struct kunit *test)
+{
+	struct thermal_of_test_context *ctx = test->priv;
+	struct thermal_of_test_thread reader = {}, remover = { .remove = true };
+	struct task_struct *read_task, *remove_task;
+	struct completion entered, release;
+	unsigned long done;
+
+	ctx->aggregate.np = of_get_child_by_name(ctx->root, "average");
+	KUNIT_ASSERT_NOT_NULL(test, ctx->aggregate.np);
+	{
+		guard(mutex)(&thermal_of_lock);
+		list_add(&ctx->aggregate.node, &thermal_of_aggregates);
+		ctx->listed = true;
+	}
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider, 0, ctx->sources[0]), 0);
+	KUNIT_ASSERT_EQ(test, thermal_of_source_add(ctx->provider, 1, ctx->sources[1]), 0);
+	KUNIT_ASSERT_NOT_NULL(test, ctx->aggregate.tz);
+	init_completion(&entered);
+	init_completion(&release);
+	init_completion(&reader.started);
+	init_completion(&reader.done);
+	init_completion(&remover.started);
+	init_completion(&remover.done);
+	ctx->readings[0].entered = &entered;
+	ctx->readings[0].release = &release;
+	reader.tz = ctx->aggregate.tz;
+	remover.tz = ctx->sources[0];
+	read_task = kthread_run(thermal_of_test_thread_fn, &reader, "thermal-of-read");
+	KUNIT_ASSERT_FALSE(test, IS_ERR(read_task));
+	if (!wait_for_completion_timeout(&entered, HZ)) {
+		complete(&release);
+		kthread_stop(read_task);
+		ctx->readings[0].entered = NULL;
+		KUNIT_FAIL(test, "read did not reach source callback");
+		return;
+	}
+	remove_task = kthread_run(thermal_of_test_thread_fn, &remover, "thermal-of-remove");
+	if (IS_ERR(remove_task)) {
+		complete(&release);
+		kthread_stop(read_task);
+		ctx->readings[0].entered = NULL;
+		KUNIT_FAIL(test, "cannot start removal thread");
+		return;
+	}
+	wait_for_completion_timeout(&remover.started, HZ);
+	done = wait_for_completion_timeout(&remover.done, msecs_to_jiffies(20));
+	KUNIT_EXPECT_EQ(test, done, 0);
+	complete(&release);
+	done = wait_for_completion_timeout(&reader.done, HZ);
+	KUNIT_EXPECT_NE(test, done, 0);
+	done = wait_for_completion_timeout(&remover.done, HZ);
+	KUNIT_EXPECT_NE(test, done, 0);
+	kthread_stop(read_task);
+	kthread_stop(remove_task);
+	ctx->sources[0] = NULL;
+	ctx->readings[0].entered = NULL;
+	KUNIT_EXPECT_EQ(test, reader.result, 0);
+	KUNIT_EXPECT_EQ(test, reader.temperature, 25000);
+	KUNIT_EXPECT_PTR_EQ(test, ctx->aggregate.tz, NULL);
+	KUNIT_EXPECT_PTR_EQ(test, ctx->aggregate.aggregate.entries, NULL);
+}
+
+static struct kunit_case thermal_of_aggregation_cases[] = {
+	KUNIT_CASE(thermal_of_deferred_lifecycle_test),
+	KUNIT_CASE(thermal_of_coefficients_test),
+	KUNIT_CASE(thermal_of_zero_cells_test),
+	KUNIT_CASE(thermal_of_concurrent_removal_test),
+	{}
+};
+
+static struct kunit_suite thermal_of_aggregation_suite = {
+	.name = "thermal-of-aggregation",
+	.init = thermal_of_test_init,
+	.test_cases = thermal_of_aggregation_cases,
+};
+
+kunit_test_suite(thermal_of_aggregation_suite);
diff --git a/drivers/thermal/thermal_aggregation.c b/drivers/thermal/thermal_aggregation.c
index 1a7e17757025..004de0e24f9e 100644
--- a/drivers/thermal/thermal_aggregation.c
+++ b/drivers/thermal/thermal_aggregation.c
@@ -246,3 +246,7 @@ int thermal_zone_get_temp_aggregate(struct thermal_zone_device *tz, int *temp)
 	*temp = sum;
 	return 0;
 }
+
+#if IS_ENABLED(CONFIG_THERMAL_AGGREGATION_KUNIT_TEST)
+#include "testing/thermal_aggregation_test.c"
+#endif
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 64ae7769edcb..b90e0b500494 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -741,6 +741,10 @@ static int __init thermal_of_aggregate_init(void)
 	return 0;
 }
 late_initcall(thermal_of_aggregate_init);
+
+#if IS_ENABLED(CONFIG_THERMAL_OF_AGGREGATION_KUNIT_TEST)
+#include "testing/thermal_of_aggregation_test.c"
+#endif
 #endif /* CONFIG_THERMAL_AGGREGATION */
 
 static void devm_thermal_of_zone_release(struct device *dev, void *res)
-- 
2.43.0

