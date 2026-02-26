Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A0C36655A
	for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 11:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104688; cv=none; b=py63av3TmrIvma3B7SP4WMij4Qp3Jpv9f2197u6Lb166omJ7FuuAXrdPYI3oxvdMcy+NAH0+ox8j61S5iJHT3i5MArTH30fUnj6bxoIVkeMD+g76gX7GI5ozSanILP4Uv/5cS9T7tmsc8cfouiC0h1ELM52b65AvNRq5Pp9dGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104688; c=relaxed/simple;
	bh=Tda3X1h6hjXboAEqtey5KSiQRBdK9Kh2CQJXrLYM4X0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmG9prcIZ0bPveivE/juqMCeRS+PZIWISkwd3cKrn7COZe1vvlkYgAV9Ut8ZdoIbuEmdfMh4I/uBBDkOV5E40Xa9Knqg6a+l9b0SMbbAh/ZCbwhpEHHtt/pFwINXH4R3wEeP8K0ivIkWX33ztEpOoDQEg2kjOEJNpliJ0czjobQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEL7XcKC; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEL7XcKC"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-827270d50d4so807399b3a.3
        for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772104683; x=1772709483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jV7kecYCTzcrsCFjFw3qK5G5qwWc4nsIa+UHPnJX5do=;
        b=JEL7XcKCSUKb7RxxmofFcyz2E7ZvI555N0+pBDDygv+YoxrGLmtQ1p2eYULhikMXWi
         rPoigK1hJyqVWo1lrimTQlkAyZIPZi8GoeKSSlIki6afZUr+7k/fq5P069nqLLZeN8nZ
         5nvcbRTLDSuxfXdgweuwAIJbCHfiSMVNNwe9WSDZMpXNgsNtoXatoqVX7YZWNkXazSq4
         a1LXmxXyo/U9LbD5ckTW2wS2pBV0fRg5In/ANd7KEhdj/mhFZF09kza+4LuBeLN6UG+R
         In/rGkOvAt2gzfx1gOBAUcoAr79mYG7bPG/WN1YzqtYRVptuhWxQoim1bKP7DcpcCYib
         IYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772104683; x=1772709483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jV7kecYCTzcrsCFjFw3qK5G5qwWc4nsIa+UHPnJX5do=;
        b=t3yfHLAVD1qM2hx/IX/QgIFK4v0CC+/RjotTGJ5u4W3+MmaPW1ti1cDywdTprDIYB3
         5FC6Rq+qa0FlVHjLRMbcja1yagPnHCuzyTB9uxpqBAk2uJdcRtOOsVGWqFzW3TBsZRt3
         wC1NrEsFjhb40CXVLh0g/XkZqg1kqKIGl23GetojuxD20M/MiOknc3cR0cyKRim9feAr
         zsRwy1X3Rp6RYh9fii4yKFihyvN/h7mGZGH4xGyKH7OOhkP4QKbDbEyyIbEbSN9k947U
         QdSTDl7cD7f+xTpa8J4rme+0a2kDG5xwJTJoPoQF9In0imaaw9o8spott3jvyL4cpXmZ
         WKgg==
X-Forwarded-Encrypted: i=1; AJvYcCWknQC5YI5ZugLAbZhsNun928QzlJlBUSHHT/4eMzn/h50ycuJWXU3LL4SsGsKTupMtlkSD@lists.linux.dev
X-Gm-Message-State: AOJu0YzwAjQzQnT0XSw4q5m23apVqQFPeueT1bAhbvfpeQxOlvSNBlVF
	cMcn5F0QJazUgFpzxphKGZpCpcVVUyZ6HXm+parQ/5/4MF8WZPQmab4+
X-Gm-Gg: ATEYQzxDZwlZV/dvEkvwalHTZjfERKwyZt2Vue9FfFkQvI5r9yIu7e9flBSmVErlTL/
	mobPOCPs7mb0GY/0ZeGcuROoRqZbjG5S/GEKVgCLKtgWH+OGAthh3McL0UjTx4rSslKkfcbgMJe
	sBmDyk9Erb5ef0ThTvcT4pC2RfHcUxKcShwFeW/g8L/ZPFje5+3GaEWGuyD5Yoe/VAhYsDyETh3
	8Mh8NNuKyFrX8xWBpNAhdh+HLKJcgMDuIjc6EkpqrhVi+A3KDaHZEkyS6NyuXJin9PS289GjsRa
	6GGZ5sJkabzY7d9wwCfhK0vSMtjtEuaY5ORPxSoes/m4qTagz5zLOYS9LzNo2LEE6k5/XpGZ/pH
	DjdO20csePDqlig7ZHz62ZygysZkjFF6wYViLTjf21x4rW4mHjzyTrFKj/gYJ/caXiy8UWSy8E5
	X2WOD437/g0DOfHQ6LY8UulUaUoqVSFMm3z+ObCOU3hS14TghNbTH0fi39ky2QHIkjJng4/Lyp1
	U2aC65JShQ3mCd9qCFsoRXlfNmSU8HQ96cqwgtE6MTICLTdlsflooMxAEjWl4fhWg3lQzdtU5jg
	VDvu+tyOvQ==
X-Received: by 2002:a05:6a00:3e0b:b0:824:a81e:97b5 with SMTP id d2e1a72fcca58-8273bfa235emr2041811b3a.38.1772104683383;
        Thu, 26 Feb 2026 03:18:03 -0800 (PST)
Received: from yuu-U24E.. (2001-b400-e3d7-38de-fa71-5111-1751-cb7a.emome-ip6.hinet.net. [2001:b400:e3d7:38de:fa71:5111:1751:cb7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a088517sm2110831b3a.65.2026.02.26.03.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 03:18:02 -0800 (PST)
From: Yung Chih Su <yuuchihsu@gmail.com>
To: davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Yung Chih Su <yuuchihsu@gmail.com>
Subject: [PATCH] net: ipv6: fix ARM64 alignment fault in fib_multipath_hash_from_keys()
Date: Thu, 26 Feb 2026 19:17:21 +0800
Message-ID: <20260226111721.25454-1-yuuchihsu@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct sysctl_fib_multipath_hash_seed contains two u32 fields (user_seed
and mp_seed), making it an 8-byte structure with a 4-byte alignment requirement.

In fib_multipath_hash_from_keys(), the code evaluates the entire struct
atomically via READ_ONCE():

mp_seed = READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_seed;
While this silently works on GCC by falling back to unaligned regular loads
(e.g., LDR/LDUR) which the ARM64 kernel tolerates, it causes a fatal kernel
panic when compiled with Clang and LTO enabled.

Commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when
CONFIG_LTO=y") strengthens READ_ONCE() to use Load-Acquire instructions
(ldar / ldapr) to prevent compiler reordering bugs under Clang LTO.

Since the macro evaluates the full 8-byte struct, Clang emits a 64-bit
ldar instruction. ARM64 architecture strictly requires ldar to be
naturally aligned. Executing a 64-bit ldar on a 4-byte aligned address
(e.g., ending in 0xEC) triggers a strict Alignment Fault (FSC = 0x21).

Fix this by moving the READ_ONCE() directly to the specific u32 member:

mp_seed = READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_seed);
This instructs the compiler to emit a 32-bit load (ldar Wn or ldr Wn),
which perfectly satisfies the 4-byte alignment requirement and resolves
the crash.

Fixes: [4ee2a8cace3fb9a34aea6a56426f89d26dd514f3] ("net: ipv4: Add a sysctl to set multipath hash seed")
Signed-off-by: Yung Chih Su <yuuchihsu@gmail.com>
---
 include/net/ip_fib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/ip_fib.h b/include/net/ip_fib.h
index b4495c38e0a0..318593743b6e 100644
--- a/include/net/ip_fib.h
+++ b/include/net/ip_fib.h
@@ -559,7 +559,7 @@ static inline u32 fib_multipath_hash_from_keys(const struct net *net,
 	siphash_aligned_key_t hash_key;
 	u32 mp_seed;
 
-	mp_seed = READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_seed;
+	mp_seed = READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_seed);
 	fib_multipath_hash_construct_key(&hash_key, mp_seed);
 
 	return flow_hash_from_keys_seed(keys, &hash_key);
-- 
2.43.0

