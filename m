Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B23859D4
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 04:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789704715; cv=none; b=AHYIo5xyN9ygDpsa534b4vZqXYmiFGWRgZKIRp7G11cXoJGK56tzpfvl1uZV56ZYXBEycRrIUF9Aj1W4tWVoJKQF2i3JXJbCzdvIgBi2YIQ9tC9PzCW76lDmVE0aN6TiUA7X3GpDVPJnG5XYjkTPtXizxRPEL2J/H3LyD/I5tMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789704715; c=relaxed/simple;
	bh=UEUGvWnLmOamu0pTBgkEFgMYD4FBYYk7egJy0kl7eaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bk9ImnHECRNLOLUz2zWFyjD1GbXqYb2zGW2tN18nVxCSwG1T2hZLK2cYJ9gIl8RUcdDCW3K7fmMJFMOywE4NENaFPcwzG6v0BOVkKSysrk0xYOpQNEftnrEls9gH3r7u+6+FxVmKafp8X7SgyTN2d1DCaYGu/Bc7ztXh7cjh65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXmhTPdm; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXmhTPdm"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so147310a91.1
        for <llvm@lists.linux.dev>; Thu, 17 Sep 2026 21:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789704714; x=1790309514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k+XdyMw/cwUfbmJ3KUmFebC21zCmtXiVZ3PCKhns0RU=;
        b=MXmhTPdmmIELIgJgIFaGuOH9R84ZbnJeA6ljJoSPz5QdxQa/5kNvSD8DCphjdX54nt
         ZPStfPblak06J7as72yCg5ZTwJj5E3CSl68KQYK7wu5UAvlrxu4iGc7dKnpliwr8ua2K
         aGgsmQkS1o1MElnWKXWYYRJoMZVKYfNoPMmjXODertIBhwHAkt3cmWdi0mIsZjzZvVjy
         mePlsJD1VBxcIKAeoJNx7mehVrkXJreYNS9Anb+VSH+linZm8z8NmAk5BXoPVXa7mc0q
         56V8Z+COC6oHLEBa5dFv+4lR9mCSJoGKsSroQJUmxzQvsdyuwqEodct1KOrqS59wkZKx
         c8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789704714; x=1790309514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+XdyMw/cwUfbmJ3KUmFebC21zCmtXiVZ3PCKhns0RU=;
        b=VMsMVZGtYFzQeE1P/dbu5JBxGhiaDtq07376XshlFhhBOGoIDiGUXQDhk+wAe6Pi/f
         X5twxa7NTWAgX6OG7iMVfLfAADHvcqGgXMA79ODWKmpKrPeL5cSbJcrT04pcTtGmOEHH
         qnAsLUsnG/pfIIED4p/y24xu/ylUvIONj2uvRMdBFAftXoRpyCmQOb2P1Abvm8Eskopr
         SWXPkU+t1txcxOr9jFJT6QIEOz5RYMmTCpMcnQvorN+aKN+FXiCwXVXd7mbIahtyCtTk
         kX4UP1uWMcX3k3x1kZrKDzLZ1EF+KhpOlcABlfPJe5HC208xmjMz6AOf9rEMm018KslH
         Bo5A==
X-Forwarded-Encrypted: i=1; AKwUvByWZLMLYKJlYfrYKv0c91TLhD3cp6EHdw8taeLWkdOL9A4EcoCR9gQqw1SKGlY+/1qCb8mB@lists.linux.dev
X-Gm-Message-State: AFuF++mHqmQ1RbQP3DssBwrmqHWlcWjoqdGtMpQgQoEiyZgerSBHx0gW
	nw9k724EsL+vnjrBbm6X72tBRp/Q/K+3lvBnNwckYtEVb5BEUVj+zin2
X-Gm-Gg: AYBFou2yq0tnLvvE6Q8+3Go0RR5+6CtuM8fINdbYPGgiP4OTqWFECyOWQL+fy5JUNRn
	LBfo2py2LXIrkNAjCOokFBtCRDiucNrM70f5QbgE4FtcpirP1gqhCE5wYyovUmee60qpL8byGIY
	ENbXg9qe3e9aP6qvpPsv4QSCRxC/HCcFb3Mh38i1qFSMEWAf7ioTATckMzRB7uJh9KsAajX8EQq
	Amel+yp1ysHn9chRYNiZ5HVgF3D+L1H3uxTMkL52VFPgumc8oYPiEELqr+ueGPhNxD/MFUl+YHV
	K6VftxV9GDlEWHDpu1t7QwjRmdhzXj/8f/iZxyo4kfP5bnn9uY9BqE1jo4IDJa3mYeZEe1HlJVD
	29Op9s7QLISQu4jTdQysxqkuHeOXmvVvnh1s/aCZjCnfZmDjWP1qT7Inz4wIh06IIbiuRZqpEUV
	z3mYsjo5bp4i1xi0+jfaT6Pm3lSoc3GuRX1NRYY5b3rz6mU7yOFbeCdT06+vq9mMmzRknJWsFRU
	rTJyZFX8fJBAUgVAbmGmBgastJ0tywkg6kWdQXx414+CdjH+nF44Ylc/vw4qKiiNNIa1f4+KThK
	MxXWBxFPSzCIdBOBzzf3e1y6bpukTbHAFc+NJKvQAtUkK3UZugk4DWhbxLk/XqhywA==
X-Received: by 2002:a17:90b:2b8e:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39e54c59c74mr5120122a91.2.1789704713961;
        Thu, 17 Sep 2026 21:11:53 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce046d96sm1126081c88.11.2026.09.17.21.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:11:53 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] samples/bpf: remove unused hash_func01.h header
Date: Thu, 17 Sep 2026 21:11:45 -0700
Message-ID: <20260918041148.602323-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

samples/bpf/hash_func01.h has been unused since commit 91dda69b08de
("samples/bpf: Remove the xdp_redirect* utilities"). Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 samples/bpf/hash_func01.h | 55 ---------------------------------------
 1 file changed, 55 deletions(-)
 delete mode 100644 samples/bpf/hash_func01.h

diff --git a/samples/bpf/hash_func01.h b/samples/bpf/hash_func01.h
deleted file mode 100644
index 38255812e376..000000000000
--- a/samples/bpf/hash_func01.h
+++ /dev/null
@@ -1,55 +0,0 @@
-/* SPDX-License-Identifier: LGPL-2.1
- *
- * Based on Paul Hsieh's (LGPG 2.1) hash function
- * From: http://www.azillionmonkeys.com/qed/hash.html
- */
-
-#define get16bits(d) (*((const __u16 *) (d)))
-
-static __always_inline
-__u32 SuperFastHash (const char *data, int len, __u32 initval) {
-	__u32 hash = initval;
-	__u32 tmp;
-	int rem;
-
-	if (len <= 0 || data == NULL) return 0;
-
-	rem = len & 3;
-	len >>= 2;
-
-	/* Main loop */
-#pragma clang loop unroll(full)
-	for (;len > 0; len--) {
-		hash  += get16bits (data);
-		tmp    = (get16bits (data+2) << 11) ^ hash;
-		hash   = (hash << 16) ^ tmp;
-		data  += 2*sizeof (__u16);
-		hash  += hash >> 11;
-	}
-
-	/* Handle end cases */
-	switch (rem) {
-        case 3: hash += get16bits (data);
-                hash ^= hash << 16;
-                hash ^= ((signed char)data[sizeof (__u16)]) << 18;
-                hash += hash >> 11;
-                break;
-        case 2: hash += get16bits (data);
-                hash ^= hash << 11;
-                hash += hash >> 17;
-                break;
-        case 1: hash += (signed char)*data;
-                hash ^= hash << 10;
-                hash += hash >> 1;
-	}
-
-	/* Force "avalanching" of final 127 bits */
-	hash ^= hash << 3;
-	hash += hash >> 5;
-	hash ^= hash << 4;
-	hash += hash >> 17;
-	hash ^= hash << 25;
-	hash += hash >> 6;
-
-	return hash;
-}
-- 
2.43.0

