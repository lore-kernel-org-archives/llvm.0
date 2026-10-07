Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430173B0583
	for <llvm@lists.linux.dev>; Wed,  7 Oct 2026 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390523; cv=none; b=fzrovzMzz5evbmZuwytDWrmMk2Qk2PRV2l2Ec++sns7Bz8FoPhe31wvzA5dsopkCt/G1/2ana3WoH7MGfHZsy+B3yXMxdWeOFaYBIx5sbvpFgVnGMz09/QVRJZgkc5brCwuFIDifZ2Yt4hL7vXU+giM4/S/+UhHpEjW6WpWBdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390523; c=relaxed/simple;
	bh=259dEDaWlzVpxlGUwhq/AX7U3geSOV8jkOQL+05Kdks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G54hBbufg5SJA5a0GQSjXVWkywaferPEuiFcFkYUuJm675stRFH9earEdpk+FVWOJEy6jkwLfgxF8s4E5BNOILq1T0qzAwP3aF/qk4qcYd5X3vPXNYVVwLaNKYsjtMRjdX3dg+/qlGiqT7Dw4/1/p4K0YZgrjedJGUSzX+6GJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkMdRjwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLTSBePr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkMdRjwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLTSBePr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtQOI041052
	for <llvm@lists.linux.dev>; Wed, 7 Oct 2026 16:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hCX9hHQJ6nF+kufyd4tevz
	lH5RbSugP5//mR07T9oPY=; b=fkMdRjwfpC3UYuSLGOPnswa/VTjmHuVP2RP3tk
	Qaq365z8MwvdZjjouLDxNtU2IVBZjuSmUxvauu1a3eDeWwm8s1c2DU0gIGZ5blfg
	5/evQSKWZrc+Zh2ufid8Fi1bm4uwQtKcfNBmh0wr+sN9IrEAFBFMS2YVZsTiGQ32
	bt/IFnF9DxzlagvhMj1KxggOHj0A13/B0om79VVIkL3enykO7Gu1P8LZzp0Pe0+Z
	SVw2b/OQMw+cpcQg7i/kQ4m9Mnnv/JDeDgkFv66kWqVIuf6MUWu1ANe9mMTsr4I0
	M4mLaP+rj5VtIapW2ENHNd+uNs1aQM5dFZuLpz+KC+PMlaqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdct3nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 16:28:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5ab5c136so702027585a.3
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791390520; x=1791995320; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hCX9hHQJ6nF+kufyd4tevzlH5RbSugP5//mR07T9oPY=;
        b=FLTSBePr9IMQjX3mRPwKInsbp82SUD5JlIzrfoWAprM49ZkUzs+sA8LF68T3WPupJZ
         fIFhKY5WSgp3nM6qfPbidz02H4t1mc30b0MhrNPnHh2RXuj/iouvC0uAvQqEKdI+0Xzm
         dIe/J4v/i1ddb0XtHn4Xk9u1nIARqJ+TERhnyB6l5mdTOirHy8+aM93/lKYF0KW8W20P
         x+OVEmlWJZ1e84ZU7M2wr7ONBNpCrGnarmbTvnROJUe4mFoZ/wx7DBxxPqwDCESlahTQ
         ySKOECjHDvUdyizyPwgx4hcv1qWLvrzI4EaEnDjN9rjFXwqiJXNREM9X1XyF6NuxliZJ
         NjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791390520; x=1791995320;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hCX9hHQJ6nF+kufyd4tevzlH5RbSugP5//mR07T9oPY=;
        b=gOanOWCqSVZlqV8UKHZCfBBPK5W8L6CWQdan9v8tWuixhN6U+PELZJHe1SFBz5wCNA
         veAhto7rDYYUIdWanRQ1fFBdlDW4snvJa0jD6j9BrQ5R7MGyTMgZywM3hGbSfIzjsP1x
         HOO5/3gAJ8eLEShCBVHoPltNEIWthLRAZGS2i4FZLAVZzTitzMxb/9KpVM2vkYR7Kcc6
         BYOGVdfwTmh5X6TUmVf/F4yEbP4ExZfvnRlZRdA2k4xeTCvRHfb0vmn7K1PTcptrfLQX
         ZTxQ0raCzW8zd5I41vDejCFIwtCiDpiKiN0WE4aHjGLFtc653bANFXLxINEc62KFC3XR
         akig==
X-Forwarded-Encrypted: i=1; AKwUvByMQEeuPGgdhLYbJ7oMHdEDYHxEdHzeySCRyshIt5kpMalsxqr5CfUEWDpQmCfHSXBnYNkB@lists.linux.dev
X-Gm-Message-State: AFuF++k+70m5G1brHLyNVyRwZI7aWuyI6fMPsOMNoC3hq041oscCEVxw
	Ay/Yi1s+2aAVc0GO8prQ2hmXajTvvWVgQosSSzw+glWdXp1AReAE25ryLen1Wn+ih7Ps0mn5qwk
	7u1VAV/6UfjiPpk/IXw7FxXTg1RQ7zb748cbKrtVnfxyC0cbtidwBbU4k
X-Gm-Gg: AYBFou143zRf/xetZboX0n8n0ca+PdRYPyQOeMC0eZADAqUYhwMd3DIlLxGiRXtLhKB
	K/lnTMAfqVg30tMpMXrA2eBozSpFRbJcD9QFjetmj37fqTOe5YX+QOenz+L+PmZomzm3GbQ5PgR
	rp3q9paibURyv4miEmKUv2QcXjfXDVb/K+mWI1sL9GSCG+f2xSgo77UZpa29Xhaqvqv7GRN5ICh
	+TF6mUfmgBX3ewX3NHqSBcnUnN7VdLSlvM6W+qEK3ajyBATPe76p9Em9h5OH4GEV6h2fvhDJ/g4
	reorlKUtHYcax6/Ldpg2e7p1mdnnP5Kq75YUOAXe/G1CqKy1f57n/NpdznclNzdls0LdpZ2rMsq
	Vi6ZQomY6
X-Received: by 2002:a05:620a:40d0:b0:93e:9808:8d6c with SMTP id af79cd13be357-93e9b84ae41mr560208885a.70.1791390520064;
        Wed, 07 Oct 2026 09:28:40 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:93e:9808:8d6c with SMTP id af79cd13be357-93e9b84ae41mr560199185a.70.1791390519216;
        Wed, 07 Oct 2026 09:28:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1808d7b52sm31287335e9.2.2026.10.07.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:28:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 19:28:30 +0300
Subject: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC1zxmoC/yXNQQ6CMBCF4auQWTtJCwjGqxgXZTrVUZySFo2Ec
 HerLr/k5X8rZE7CGY7VColfkiVqgd1VQFenF0bxxVCburPG9Di0ODr1Y6Q7Bnmjjw8niiGmWcK
 Ck1Mh3FvTdH04UOAGSmpKXLa/m9P57/wcbkzztw3b9gGgTO8BiAAAAA==
X-Change-ID: 20261007-b4-landlock-fix-domain-fortify-panic-510367f8cfe3
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
        Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, Tingmao Wang <m@maowtm.org>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4354;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=259dEDaWlzVpxlGUwhq/AX7U3geSOV8jkOQL+05Kdks=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqxnM0C+OtPHm6Hpq+j4X601QkIY0ort0v/b2SZ
 Yk7SSXStK+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCasZzNAAKCRAbX0TJAJUV
 Vv/DD/9jLnB7edsEAPmktBD3LG4PNnZej8sYtwv9KDIUwpja4mHRfdJ44CR/UW6KisAoajD0oWF
 G4UQPgNtZ2Y/V7+vkLu2OtUHT+8W7b1TByK4Ov2meje8FiSVZlky1HH42RWuWVjeWLpWHhbcp2O
 Qj/lcrzYIRg+W5b42GW5sPG9N3L5SnONDebop99Sh4LsatctVmUcHFl33cwRwoggPgeELJwzfjD
 8LDjR+d5uetFCAyJAh0HjzFBebmuc+AiRzKSzfHOHTm91y5e0PuVsM4VneWlbNUJu0L3ARriJWl
 nR8Bdc7LA+SzYMBeEI4V9Bt1SnSv05tzuV6R64/+alZ1YS6NKab56og/9YTh8hCV8jo4Gs6kPMf
 M0mrUAb5xJUU0dqOXIN0vDGqAopZrTfdidPWBRJcfDAIqC6BDapVJaL1wd7ATZE1LxT3pYtFtot
 w1gNOZHSaoC+SXqI7wClx92Lr9KbxE7o3wj4zWrlAjCJFdSM7RdfB2ss+rR2N4qrHyWR6V3ZmJ2
 yRu56xlPaRC6fOsuBSnwkq3GMrw+QEqAVgffDepl9qS7OVJRBpk+f8NyT1FFF2WdocnwMRE9gQP
 yn9IGqjMM2wFPJHfN/zyT5EHIyi4HqVcqRm+FrMtWP8zdZdg5jXyqD4LiHxHeuRLLOojE1AnuYS
 rzb3ttm71tlqJPA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: HU9Se9w1gbfSAwZ0czdM_rx0Q64sNwMr
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac67339 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zhcD6a0htT2TxK9RPLUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NSBTYWx0ZWRfX2Yo1GCrS2Ix+
 Gz0EoRpezhmXS+tk7WUmgOth+Ra/MqoJJcioVCvAv1iGpIcNYUtUB9Ta4SOvV7ppULbnpYPj9Jx
 XjAD9bDOYoXMUhp9+GiYBnaNFAVfqxw=
X-Proofpoint-ORIG-GUID: HU9Se9w1gbfSAwZ0czdM_rx0Q64sNwMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NSBTYWx0ZWRfX2W12/ZNKtyvx
 At061zwhnxbmkoFUGJ7zlkJCddVLnPsMYYCL+rlu9L18rFbOCBrYzQeNgOXPpWyhmMzwhqPgXvB
 tjzjBybiNYrlfcfSanZ8P/KbX+E2/hJW4BBVph8ZQ15IMByZ1lhogKxLK33SLpCaffvz5oFoddM
 vpuPvSC0UxQ7IUvMI8Ku4A6p49uqI1w5Fpz0piMCELZCUB42QWYBuwY1r2Qw+XukqQ//dvba3FR
 TYbeOQaNrW+KPfYJHGCFU8y/V2fk7I1Xsnwkfk0zVH8cb4kEl+lZFxsLlMRj0ZihiSp3gnSqP6r
 sEuBfNaYaZSNMwGkncBPo33XPjYBOxxE5JGnglLSYHADIgb4zzUDOmvf63hDHWM5IHqOVGmtU+L
 kFV3wEP6HH0dovMCePXcE7GSa48IMGQ8XEvVF+saGlLBfuDP4bWqumVrnUvEgIQIS0XSwHrUFHm
 D2agH1kPsqQri28kGBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070065

With Clang 20 and CONFIG_FORTIFY_SOURCE, stacking Landlock domains can
trigger a fortify panic in the handled_masks copy in inherit_ruleset():

  __fortify_panic
  landlock_merge_ruleset
  __arm64_sys_landlock_restrict_self

Clang miscalculates the location of the __counted_by counter in the
anonymous structure nested inside the domain's union.  In an arm64 build,
__builtin_dynamic_object_size(domain->handled_masks, 1) reads offset 40
(the first handled_masks entry) instead of offset 36 (num_layers).
Because the destination domain is zero-initialized and its masks have not
yet been populated, FORTIFY sees a zero-sized destination and rejects the
copy of the parent's layers.

Move num_layers and handled_masks to the top level of landlock_domain so
that Clang uses the correct counter.

Assisted-by: LLM
Fixes: bd3a19800dd1 ("landlock: Add counted_by in landlock_domain")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Move the domain layer counter and flexible array out of the anonymous
union to work around Clang 20 reading the wrong counter for __counted_by.
This fixes the FORTIFY panic when copying the parent domain's layer stack.

Based on next-20260930. Validated arm64 Landlock object builds with
Clang 20 and GCC 14, with CONFIG_FORTIFY_SOURCE enabled, and checked the
counter load in Clang-generated code. Not boot-tested.
---
 security/landlock/domain.h | 48 +++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index caa3d19d2c43..5e65ab004f62 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -216,37 +216,29 @@ struct landlock_domain {
 		/**
 		 * @work_free: Enables to free a domain within a lockless
 		 * section.  This is only used by landlock_put_domain_deferred()
-		 * when @usage reaches zero.  The fields @usage, @num_layers and
-		 * @handled_masks are then unused.
+		 * when @usage reaches zero.  The field @usage is then unused.
 		 */
 		struct work_struct work_free;
-		struct {
-			/**
-			 * @usage: Number of credentials referencing this
-			 * domain.
-			 */
-			refcount_t usage;
-			/**
-			 * @num_layers: Number of layers that are used in this
-			 * domain.  This enables to check that all the layers
-			 * allow an access request.
-			 */
-			u32 num_layers;
-			/**
-			 * @handled_masks: Contains the subset of filesystem and
-			 * network actions that are restricted by a domain.  A
-			 * domain saves all layers of merged rulesets in a stack
-			 * (FAM), starting from the first layer to the last one.
-			 * These layers are used when merging rulesets, for user
-			 * space backward compatibility (i.e. future-proof), and
-			 * to properly handle merged rulesets without
-			 * overlapping access rights.  These layers are set once
-			 * and never changed for the lifetime of the domain.
-			 */
-			struct access_masks
-				handled_masks[] __counted_by(num_layers);
-		};
+		/**
+		 * @usage: Number of credentials referencing this domain.
+		 */
+		refcount_t usage;
 	};
+	/**
+	 * @num_layers: Number of layers that are used in this domain.  This
+	 * enables to check that all the layers allow an access request.
+	 */
+	u32 num_layers;
+	/**
+	 * @handled_masks: Contains the subset of filesystem and network actions
+	 * that are restricted by a domain.  A domain saves all layers of merged
+	 * rulesets in a stack (FAM), starting from the first layer to the last
+	 * one.  These layers are used when merging rulesets, for user space
+	 * backward compatibility (i.e. future-proof), and to properly handle
+	 * merged rulesets without overlapping access rights.  These layers are
+	 * set once and never changed for the lifetime of the domain.
+	 */
+	struct access_masks handled_masks[] __counted_by(num_layers);
 };
 
 static inline access_mask_t

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20261007-b4-landlock-fix-domain-fortify-panic-510367f8cfe3

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

