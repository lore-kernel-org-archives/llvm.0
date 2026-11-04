Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799170;
	b=i5IK8TnR/xc50sEvDjjf+034e5UdUMyiQDHQ6HvlBXh7rbv7kBLvKyPUmtWScjUcgxtv
	 XgtsdyoeJgDzleUD9uWvaBee3vn4fzcyNPKL2UIlkUEiZbsNuoUFPKRAkBoPaqqQV3bZR
	 OXyxUJwg3Bnqsos0Mltl30DM5bGTMhiH26MrYWVQuZ9/f+WNnFrgvr2v0sQNKx1ConYu8
	 GMCBik664s0yA4Vba97KrEnzwz+ksKZaZkTimFmR7Vipin8mfPa4hNzFCWDrfER8KfCOa
	 HFWoU1GXWP5SGsq+q/zcB2lYtqCJMLNnFO3UTOtoDS9d6O73xeJTZHWpTZwx9dSdOzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NHrXeDMm3qDspSdmiyISYSVqXsqYRkHWDw+hommVmRE=;
	b=Q+ovd1NmjJAU7zOlcAz5mVcugL44gBeMactyuykAV6xLgYZ2fyz/C+8ovYPzkWBY70Jr
	 maJAuwtrchJDhVK7jcTHapIjWuDBWQMFexoznVFj2VEjJez+oAKQ/mA+WpqVntEEw9/mN
	 LlYgBuy8xcHEhMUAnLoQh+hwZPZwBATeEiFk7FNJYlvuFWq0veGGrxxRBzS7q3UDEgToW
	 SiAutO1vDklKAvKKHQ5tgyMMMZC4zknRfN2KEE9/+TUEETi1fxP67i4xphoyb7IWwTBHc
	 eqcIA4Sv6qIpA7dpkgHvPOKRWX/SfreQbM37qDs8kEpqLXTa0h+KzwOLia3t/Wp5oYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnOTWPHV;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1773606A330
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 13:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1773606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jnOTWPHV
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070755c8cso432276b3a.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 05:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799169; x=1794403969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHrXeDMm3qDspSdmiyISYSVqXsqYRkHWDw+hommVmRE=;
        b=jnOTWPHVIFq+8agJ00uRIXPBoK9O3Ez+dj6yzdOaHFKT1cVU/1Ab98MGLMbQ9bNFfa
         7zVbLFG1GnRQjG+mYo5uSREgN1Zwo+rFeZWDbcjPvboPkZEqw46bnUM9xzOQC1GDbDJE
         edJwSyFEFVrNG7TMR5cmTUYSuYWWUraakNcvy8LoXu7RB+50bXb4W0TQFFVDmSz3S6pS
         O6hXfV0xEY35STHX/n8ExfVEbb+BBlp+80SDLLDtLe0jZtcOHUrcD+8W3KDfsgBfBvEH
         9JTkAjxC24Jt2BKCgJHGejxTjlWKUXJppTW4huymIxWjlWtfc6V7CU1lknaAW/cpIJf5
         4CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799169; x=1794403969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHrXeDMm3qDspSdmiyISYSVqXsqYRkHWDw+hommVmRE=;
        b=kH5uY25yuOp1JKUloUbJyhkwBjyB/EXWXwtCn24GGsUFk1htve4lEHfm25QbFEXw0O
         qUOIfrnLDIGV2JfoBV4afK2rheHbJTdKx51dSXATaXfHBf2wZN6dV8nsIpDFSQNuYj04
         GfldNiVNunxVYaqo65sMp27y0e4Tz1+GCxmYM4FAbENMr2vnfhaRROV/OkWR4Vd9eun7
         2UssPOZFP0vyvdaqfkFv+gdXMvxXdZ/CxpuA2vBEkG3xU/1z/eXHG1T1KaUPiLlbN+jT
         a4JAnSBsVf4tKg2h/itZV9QO5+V0yRLJaOtjSHUQ+V4QPuV5Pr50eAQAhFoBpwJdM0ov
         WzOA==
X-Forwarded-Encrypted: i=1; AKwUvBwzf7/RFAGPGR9rtGhgj6bzTi16wPW4VlVi1Lg4IJ1l0HQXiAXQaivr3OU+93Q7GDRja3EH@lists.linux.dev
X-Gm-Message-State: APuU4Z/CP8Z/rHny8ilibQPFfnBAJWPFFGUz3kNKVh6TEmSqODXu1/Z/
	KwLbJTDSY7nTRTFiUX+/tOtH3fIu4b/uGqW8rZO8cinSYiXng5OKI1JD
X-Gm-Gg: AYBFou1s6SGLesspmvOP3GJGGb261iS2Se9rlQnchWQfcnUvHCjeiZnryvoAXi1OED6
	aN9J7sL+kPMmwJl6KwugSVoKVWbbRU7zfC422K9pqIPO5aPF77/B7kL6h+mhN3j5tMotxzsapfU
	nz87ZsWyws7DWPfz/gFkTg6L3MnVfS+dM7bIi29ijzUEZ6xmdcbeLKEfVHPHK9UItqkKUfqBTje
	o0hOpaiSnD9poWEGvWi8Q7W7Z1UwtN5xxaizZLXXjFeluutlPZvER9xjVLkuLvqAXcYZ6wYNa5v
	iKVRsUNjZR9Ojhkl3opPksJBDCfKTlBHj20qDaSlgfNyYb5Ii0k8XzHF2ZKCZkH7+aE0IF4/H2l
	6sIHiD+oL2xkOCXHt3W7ZlLKi7ydqh2uJsjUnAXuCzslSUAxBC8iVuAQjvuL6ceENSE4/rgeFQ/
	3CCxcyglTX1e6nFCQIVG6CcHQpGBBabs61b9v+ODjCQfTanPhhUjJOKkKb71T6EAzqRWCZE0rS3
	A6XC4HJWm115SH3TVS8J/i9+kQtDcnaoz336H+3kihAdbXSJABOevOFDmoSz9h5LfWv0MStWrFF
	cBWQqgIFTO/UfRiP9HDtlrNdN6YjX4Ie/ASC1mdUvPMuaJByoktNgxT2UzTnLFXxnuOvMJA=
X-Received: by 2002:a05:6a00:2d12:b0:880:a842:bb0a with SMTP id d2e1a72fcca58-8a9be58910cmr12485773b3a.9.1793799169033;
        Wed, 04 Nov 2026 05:32:49 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:32:48 -0800 (PST)
From: Longjun Luo <luolongjuna@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org,
	puranjay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longjun Luo <luolongjuna@gmail.com>
Subject: [RFC PATCH v2 06/11] klp-build: Require CONFIG_DEBUG_INFO
Date: Wed,  4 Nov 2026 21:31:52 +0800
Message-ID: <20261104133158.3187525-7-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104133158.3187525-1-luolongjuna@gmail.com>
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
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

Require the kernel's debug information configuration for DWARF-based
symbol correlation. Use the C and assembly flags supplied by Kbuild
instead of adding separate -g flags in klp-build.

Reduced and split DWARF are supported by the reader and saved-object
handling introduced earlier in this series.

Validated the available objtool tests with GCC 16.2.1 and Clang
22.1.8. No failures.

Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>
Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 scripts/livepatch/klp-build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index 95bea5b2057e..da55e1028fe3 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -266,6 +266,9 @@ validate_config() {
 	[[ -v CONFIG_KLP_BUILD ]] ||			\
 		die "CONFIG_KLP_BUILD not enabled"
 
+	[[ -v CONFIG_DEBUG_INFO ]] ||			\
+		die "CONFIG_DEBUG_INFO not enabled"
+
 	if [[ -v CONFIG_DEBUG_INFO_SPLIT ]]; then
 		command -v "$DWP" &>/dev/null ||
 			die "split DWARF requires llvm-dwp (or set DWP)"
-- 
2.55.0

