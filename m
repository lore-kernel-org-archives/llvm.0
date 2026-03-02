Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE83164D6
	for <llvm@lists.linux.dev>; Mon,  2 Mar 2026 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772431389; cv=none; b=ZxEYG/fkgu7A6FRv2JlJR8C/Rqsf7L0R2egl2Av2MGcYrXB8jqD4ww4r+aAXghimgEBgu6v1VwDih3+6mluXPsQgpcu59JdO+/LezMq5BxGDWqniTzSqtJ7gAEv9Htg7BUgzAMTvqmuy7D/+ks2m/jFAx5iQAg1XnVxGkgFzVJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772431389; c=relaxed/simple;
	bh=UMbmZ++93Ph/NbVyX9t23zZtrAjeMmfIxj4l+jZAYNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDjIPv3VezSBZFGK6fj1KfDMQPcVvwrhkxX9ABVP2aTvFPS7VJZr0t6h9XzVnVxh0X8SXnvPQgkppqWK3Mvot5WeyO6N5yv3sSBpsA1uUGXFEehujxOPt7O88tGQDEHocBnsmxxLpjK6/Jap6PiKCOGZ3wr69BWCEzIjZmGxszU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icDCHWuq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icDCHWuq"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-824a6f2d816so1714429b3a.3
        for <llvm@lists.linux.dev>; Sun, 01 Mar 2026 22:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772431381; x=1773036181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3wSCMIgFyPDN8ZsWOziBhAMpjDkgcKvVXQMlKIyyHF0=;
        b=icDCHWuqGfEUg10L+g/pAyb2SNVE9XtstjttTIp4X3MLNB/8l4FpFUPtzifnegNg+B
         qQKrUQkkegYYVXoo6q6XUVUlKiwF3CpBdLwySRQVJMOlExV17rwlE8tWa89NUNI/7d34
         Z+h0omBAC40nsg0uuZE0HiGOSYMEruwOJdrtqo984Ik3CQv7+3qf8cv1fKsBWv3p4k0J
         GQnnxiIJX848iaHbqzGmIqev1dLcUIGk0END/hHAFxx3rEhsY8lJMvNhLMnlq8Hx2tPx
         609tVJmdYZsVz+qhHkfwzX0htLNM62yXJ36Khn5XZ/EdWd1sPi4S0xzwkr348AW+mWP2
         tu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772431381; x=1773036181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wSCMIgFyPDN8ZsWOziBhAMpjDkgcKvVXQMlKIyyHF0=;
        b=tnWmiX1UHbGgSXe8Wx3YZikEtU7xy4TIcLfM/ZCgboWiR2P9undcXN4jq+tX97rO3N
         /6KdppyA4RHVBwTo0hq1zaFJD9xAoOrLvsVHRlrcoNBSsCyq6Ihttu/t0lCBjiKLQGE9
         0tdMIK5MZd5Sw6uyizJmkQYuLY5xUJtr56Ls5wxYwwtMnDF/xpxVnBL6ggrqKJn+Bofj
         leFP4m07m5G4FeYlU9sosazp/nJhsmpk5ZBSBsteu5Z7flM9kz0OfWPSluRqd2tu8YKz
         IcdUg8PKPDwpMcqhmKuGnIWuPZ0AwNFIai7+4Cm0wrl6dY2ffFIjIQ1dffvPjFvcT8K7
         5IjA==
X-Forwarded-Encrypted: i=1; AJvYcCWNNA073jwX2y+qI8OTt9zvZaPgDINmPOTuk7dwnSABfCRDpb53ulM7GvDkKxGI1CcKaqCi@lists.linux.dev
X-Gm-Message-State: AOJu0YxOdkbUCfPgxVOPgW4LJ/imzwVQqYOVHy5EXivHgBCmhSuw6X8P
	6M43810inMHmlfa3pfAXZuds+QE7FBINJGqYsptz3fNlMSDsKtO2+SY+
X-Gm-Gg: ATEYQzyh4amJfhC+BQt93GR8xbcBnsm8SQdprMuySO6pmgqSA3LFRGVVeBxd+UtlU+8
	XouuuqpKbq7z7OsPW0VZZTjx7manWRiSGoLR9rJGZJLSD+BSmJKbdbr8pW7cUZhMHTlILsA1rJa
	uunzAKFNJD5Jtj7MiLU/Hhc8cwRC0YfXNtbN1+//4pncr/W6PodrVM6psYdwQBsPrTG+xpddfdt
	rbvI0VHWTPR0/Th7UMqsUb390jajQ3dyM99bCYMFOIEuyucdKJ8NkIt1du2i2GPYy3Xh0LLgamj
	1Z5/pV9csPbvMeQYrXj2Vs/lN99QCcxNuQpDXk2OTYSRKH8YI/E4E33W6C2Ju/hPaJzHcdhnDya
	uRojzIt+Z3VnefjQcG7H0wuDLeYSP8AGs20njwNnCulJRBwu97N7Jb6zfMJZ555c6ZNWB1UO3eo
	aDg3eN0pea/Iy6eFzVoz0DGp8qCzwJAFKhSc6WL8K5L3jaLeTrXwuVsvrqyXbQ9vJ1denm8mGZ4
	xjJAMtLuJWpWcW66T3KTPKzoqQKuAAqbYfBNkXGcYbVl09lLK9I9NDU1+vA274a7+svJjhtYtA8
	m7mTKDqhew==
X-Received: by 2002:a05:6a00:bc83:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-8274d95b7f0mr8512139b3a.16.1772431380848;
        Sun, 01 Mar 2026 22:03:00 -0800 (PST)
Received: from yuu-U24E.. (2001-b400-e3d7-5aaf-ef7e-1255-80c7-27e1.emome-ip6.hinet.net. [2001:b400:e3d7:5aaf:ef7e:1255:80c7:27e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a060331sm11521915b3a.62.2026.03.01.22.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 22:03:00 -0800 (PST)
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
Subject: [PATCH v2] net: ipv4: fix ARM64 alignment fault in multipath hash seed
Date: Mon,  2 Mar 2026 14:02:47 +0800
Message-ID: <20260302060247.7066-1-yuuchihsu@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`struct sysctl_fib_multipath_hash_seed` contains two u32 fields
(user_seed and mp_seed), making it an 8-byte structure with a 4-byte
alignment requirement.

In `fib_multipath_hash_from_keys()`, the code evaluates the entire
struct atomically via `READ_ONCE()`:

    mp_seed = READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_seed;

While this silently works on GCC by falling back to unaligned regular
loads which the ARM64 kernel tolerates, it causes a fatal kernel panic
when compiled with Clang and LTO enabled.

Commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire
when CONFIG_LTO=y") strengthens `READ_ONCE()` to use Load-Acquire
instructions (`ldar` / `ldapr`) to prevent compiler reordering bugs
under Clang LTO. Since the macro evaluates the full 8-byte struct,
Clang emits a 64-bit `ldar` instruction. ARM64 architecture strictly
requires `ldar` to be naturally aligned, thus executing it on a 4-byte
aligned address triggers a strict Alignment Fault (FSC = 0x21).

Fix the read side by moving the `READ_ONCE()` directly to the `u32`
member, which emits a safe 32-bit `ldar Wn`.

Furthermore, Eric Dumazet pointed out that `WRITE_ONCE()` on the entire
struct in `proc_fib_multipath_hash_set_seed()` is also flawed. Analysis
shows that Clang splits this 8-byte write into two separate 32-bit
`str` instructions. While this avoids an alignment fault, it destroys
atomicity and exposes a tear-write vulnerability. Fix this by
explicitly splitting the write into two 32-bit `WRITE_ONCE()`
operations.

Finally, add the missing `READ_ONCE()` when reading `user_seed` in
`proc_fib_multipath_hash_seed()` to ensure proper pairing and
concurrency safety.

Fixes: 4ee2a8cace3f ("net: ipv4: Add a sysctl to set multipath hash seed")
Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Yung Chih Su <yuuchihsu@gmail.com>
---
v2:
  - Split WRITE_ONCE(struct) into two 32-bit WRITE_ONCE()s in 
    proc_fib_multipath_hash_set_seed() to fix a tear-write vulnerability.
  - Add missing READ_ONCE() for user_seed in proc_fib_multipath_hash_seed()
    per Eric Dumazet's suggestion.
  - Update Fixes tag to use the standard 12-char abbreviated format
    per Jakub Kicinski's suggestion.

 include/net/ip_fib.h       | 2 +-
 net/ipv4/sysctl_net_ipv4.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

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
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 643763bc2142..5654cc9c8a0b 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -486,7 +486,8 @@ static void proc_fib_multipath_hash_set_seed(struct net *net, u32 user_seed)
 			    proc_fib_multipath_hash_rand_seed),
 	};
 
-	WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed, new);
+	WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.user_seed, new.user_seed);
+	WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_seed, new.mp_seed);
 }
 
 static int proc_fib_multipath_hash_seed(const struct ctl_table *table, int write,
@@ -500,7 +501,7 @@ static int proc_fib_multipath_hash_seed(const struct ctl_table *table, int write
 	int ret;
 
 	mphs = &net->ipv4.sysctl_fib_multipath_hash_seed;
-	user_seed = mphs->user_seed;
+	user_seed = READ_ONCE(mphs->user_seed);
 
 	tmp = *table;
 	tmp.data = &user_seed;
-- 
2.43.0

