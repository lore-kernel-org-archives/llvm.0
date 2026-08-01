Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193332D9EFB
	for <llvm@lists.linux.dev>; Sat,  1 Aug 2026 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785584963; cv=none; b=czt3Ivxv8cmrl69RshL3BmOcRUWSbxgEZB08HDNJykhXZ3m2Kv8OGR7PgDls4P8Y0GiF0PVJByGJKuRhuw7DKOrkz7HWaIOVhuheireKVgOzBSS+3pll2V3p301XiFP2LqFeVCVgpn+6FSnKm0kY0jAErUEafnCSGY4+EeZ3Rok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785584963; c=relaxed/simple;
	bh=4yyAcVknUicAHnNFBh0eMnF/hJea/MMAc1JgVYj7fY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KO1dnQOfMmt6ScMvgh34yLfictUhnpqVjzo2nJ3zSf3cjDzz53ImVD/NPJoslLzzSSJP6aXPUhn/6uAiv0kBBk2ScIFP1vquOjPtU3tUpMB1b7+n2oGcSUWWm9tPTmmTzb0sO/sSg0o1Baz0iPaY46WlGNUtOP2302BoMbSt9HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=Jr0vwBGg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="Jr0vwBGg"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caced6038eso18657965ad.0
        for <llvm@lists.linux.dev>; Sat, 01 Aug 2026 04:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1785584960; x=1786189760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/htim8H+8x9oNbHl26vDUAIesN+LBlNBvkdejEDGrc=;
        b=Jr0vwBGgAy0hXzHBkMxJqKNrGUEu741yVOi0uoxu56gL4j4ssNGsIDChQSuDhNmrlH
         Y090aSNmEhvEE5J5cDOM/v+LVv6lhYuYaUcgYREMP0qN9vz4M/9gi80ce0JN0K52D3uB
         YlIfpLhmHT2UDHo6WN2AvKSi0kTh5qbJddQe15wjSOJ/khqEEX+1wJp2NTsNCc0jzGhS
         MAOsKCI6+7trGrHEJJHvFsHwBC9ADojzWiE2n3QuHiGLwtlYa9aidmxwIQlz0YjeOiUy
         UOZ8I3tpxITlck6joU2l1ii9FieRPs9NgA9dzWt/1mB445qL1UbR2QD6Rn0OviHssnS4
         mWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785584960; x=1786189760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/htim8H+8x9oNbHl26vDUAIesN+LBlNBvkdejEDGrc=;
        b=IV3Nv1CAu4O1TloROSv8/yl6t1ws+18gA5VCG1B4Sc0IU7tmfK/istDo3dzXX++v7M
         GwX0IrFq9GB529mfz7vkSgrS1cDy738p/ufojzIEeI35fwQWbVHjijuyGA2/Jy2ftuRZ
         mO2yvl8fGG6JXRhgxWs6QJPr90QB7E0yazUb3s09kDcsi+tJuMYOQWQwxGf2L6TdYAXl
         edLz5w4SD3NdRS5TvEpC8PLZt6BGlIcF/yO+UTnDaes5vqZ3l1rfXA/D+QUIvrRD46b4
         BYcC4iNmuZ/IvHrsTGvLHyICU2hY3VqQNuXStwF54LnmeFLETVGI+KGaUnjuivtc/5Wf
         /npQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1MhLIH0Bhq0zWPvttnJEqopZjJgXi79TZL/0H3j97mzruRWMDFNhb8CZ/DPOQ89cOuGqJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzHF4fyRjmCbBIcwaFUWfBbTEt9w69tm0f8mrHt58ajNF9WrtNk
	xPFEtddYlbHcuW2qTqVLtlROAZcwG3zuggQ/L22SKWe4YHvU4KL9E4+9AskzWUSbF84=
X-Gm-Gg: AR+sD10suG3svVNMDIDDSE1pay7nulDmn7JsTKeJAUeJsjloz+EA00KGH/eW0dDzR/Q
	jjJRBa/JpQv6aT0bLvhIqxqiHGolcqctMomcSkad37+6SsQ0eEcyeMNrPn5I+u5xkNkKl/sPV7O
	2fK3FUBg+H/EpJTkd84Kf5hS3v8HLvigRy1Mnmesok5EJMRVKpa0N0DdPEEje7RHsbded1WzrVD
	LrC9r1f4zlslaFM52nMHnpwpYfZEIh9OpUjtkflGPUugoGa4tHr+1y/6wFgN7vz5+tLmgMr/bbT
	msWCWZRQw4Dbu5QHpd2HgVHYm3QqHR/FH9Z5Gyj+6GqGRA3SpIqK/dOWu7f8TXKi2Ijqh/1MP3c
	9bD9yqUPnHceLdgRaIU6U21RERUTx+8yr8B1Q4+3Dij+vuJR83sjty8IMq/MnfBR29lf+71SBpp
	/jyG5yGZt6gxq/FmE+7/tiKfcZ6NtzGk42Opv61buxnDVyx1vfKNv/d2qrChN/TS8SIk4uN6MLj
	DVbe6jRY04rJYiZngctJcm1FD0JkTjHKDoIbxG/wwEzZAX6gclaubx3CHeQWxagXIOuzfCUfPeP
	KgwWLb8k3ROWU8M=
X-Received: by 2002:a17:903:350f:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2d047e6fe24mr51267725ad.22.1785584960370;
        Sat, 01 Aug 2026 04:49:20 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3153e06f8dbsm16967624eec.22.2026.08.01.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 04:49:19 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: jjohnson@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	baochen.qiang@oss.qualcomm.com,
	stable@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()
Date: Sat,  1 Aug 2026 17:19:09 +0530
Message-ID: <20260801114911.91483-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ath11k_dp_srng_setup(), the memory allocated for
ring->vaddr_unaligned is not freed in the error paths that follow.
Fix that by calling ath11k_dp_srng_cleanup() in those error paths.

Compile tested only. Issue found using a prototype static analysis tool
built on the LLVM compiler infrastructure.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---

v1->v2:
- Moved the information about compile testing, and how the issue was
  detected to the commit message, as suggested by Baochen Qiang.
- Add the release function in the switch default case as well, as
  pointed out by Jeff Johnson. Also add Assisted-by tag.

v1 link: https://patchwork.kernel.org/project/linux-wireless/patch/20260727105532.118164-1-nihaal@cse.iitm.ac.in/

 drivers/net/wireless/ath/ath11k/dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index f389b97acbdd..be65d73b904b 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -313,6 +313,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 	case HAL_RXDMA_DIR_BUF:
 		break;
 	default:
+		ath11k_dp_srng_cleanup(ab, ring);
 		ath11k_warn(ab, "Not a valid ring type in dp :%d\n", type);
 		return -EINVAL;
 	}
@@ -324,6 +325,7 @@ int ath11k_dp_srng_setup(struct ath11k_base *ab, struct dp_srng *ring,
 
 	ret = ath11k_hal_srng_setup(ab, type, ring_num, mac_id, &params);
 	if (ret < 0) {
+		ath11k_dp_srng_cleanup(ab, ring);
 		ath11k_warn(ab, "failed to setup srng: %d ring_id %d\n",
 			    ret, ring_num);
 		return ret;
-- 
2.43.0

