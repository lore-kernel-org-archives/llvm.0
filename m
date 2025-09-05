Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616C2229B02
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 05:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757049516; cv=none; b=fDvdlNH2uE9Ii3U2Xl5CyxYOWdjAQqRTmb34ADMQ3LzfMD/4/0YAshL9AirXKVF9XA+gLEMekBgXsXB8LICQn8fFh9nU8Y6eySBQrfAm1RjPfrORLe7Hg8Le4TggwEw4J9onNoTcRZ/5r71WR8jDe5BwomVX+VdBNHxH9iD4qqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757049516; c=relaxed/simple;
	bh=wpmO0hFfM2VgQGkXIZyViY1aGEMKTjVZYo7QrqzmOes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRekp6bU9pnAxV5YcLNemBVr+dljrgEAHOfi/LTe99mZc7ee1DDGDzSZZpSJPfCovZSxlFYSFGIWdmctdGawupYdo+xXnmTveMLJsyTf+Zdu/ZC5Jc5ckABLw4/4te6muW2qdwQIy9MRa9TBZaGmea+r8oQMf+r0rJHYTWySefs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Uo3ggf6m; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Uo3ggf6m"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo197122f8f.1
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 22:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757049513; x=1757654313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdc+XgLa8vnzNRXEWxwqJZPODrktrYfG66ZUFTEZ7aE=;
        b=Uo3ggf6moUDwR7SumCTvpSlLQNTl/ZoI7V+ItLj1ybRj7pLoHPQ+fLaOrHHPGaWuNN
         MngQNBeKSL4rZi4+2jNubOQBZzN+849GCthopV+mdWLmcbFsW5DM7Bk3Hu2/MtyYIACZ
         zNGvvlsbnHG891nCCqaKiWLbRNZRiugCeFiXMXEf+ebXxfbSDzBAh5n5ZaxjzBun2tY5
         iELI09RQC/YOaoLz4l+haNfKwGwFUVpsIZSy00/qno0fqYcc3cFWhPySTx1SvAN+uQv+
         zCUgzm01H7Yb3nM/SReaX5IscCcmN/FQBJJzmwkK3Jj70WgUORjeDAEFYhYXuHI1MA+f
         jZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757049513; x=1757654313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdc+XgLa8vnzNRXEWxwqJZPODrktrYfG66ZUFTEZ7aE=;
        b=vP+dCoTIfNqmBN+Ukh5XRccDJPf8Hdg4dPsml70FVRy/E65eC1oN2CTLDsDw2YQlOf
         okgUJFABPjfQ2TgrE4JjM39TZVGxTZad58i2d+aYCKb4j+jOyC0IWWz9tEBKZv/dkSB4
         y6Pb4z+ClkwidVgDU37uznVsPJK9Ulj8Gn3ia1aCKF326WVDTm46/6j8M9L/jPBjf9It
         8auPzuGWKU514o/ZR7QpbgjSu30vIzMCAxSMEtNT0ixv/ywdsOyOsgsloFmmsZWYK4L6
         UF4W+gwY128R9hQsE09UgdSiWEUpujvJmR6nXsUNYof0c7CWG36qYfIdwuH71vDToZmS
         fZiw==
X-Forwarded-Encrypted: i=1; AJvYcCWd+HPNNDFOXQAIdmrI25LslMqR5Wnxw73Uo7AnbIu+AhZwsalcyAqS/+LWn6y1ezLqQGFq@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg77k1di9535TAYgYTCK8ZySEnGrDLIRl0eV+/julv9G4Pqy5i
	QZU6H0ldP6nvVTAbVO8uXjSMQvZmLo7o7JPuhN93X9VbZpAMJ4pQGEGSm9hkzB1enWU=
X-Gm-Gg: ASbGncuh6bXYrU7uezJjOfm12fSKLeeufkwh/UVx5+zpkGPYK5EmL3jFW9eHtCQNDw5
	/kMJ4V4svkRtlVrzQW6eWHN621GwCO7sr3MIlv03x0CIVuROIxPnZ7QiB1VyztR1qTT5fOxu4bA
	gGN0BXwzVbJQzXO2/e+vBVuPcs8GjHuwHYbeULRJXxkpDzyEf83xqwIaxsnmqxA6J9E2Bv9NibZ
	DZfA0UWcf4mRGcGJDv6yV4s4ymc4e1Npn0liPcvSL1jQhJB2nMxcDQ9JunM73AUtFtH8PglPGyN
	wcRiySewBul9Hh4tng0vFJ4iyUcAgv9ws5PABnvG1FfxBjtcJUrt0LC0eocGJBQ0i65HKgFtNRt
	5YIga+8ncDnhufbCoCHNyZZ5BjRLt2Qw3G6SENg==
X-Google-Smtp-Source: AGHT+IFXhtb15fSGTgJUm/RSgvPU2QTGa/U5u3mZEixb9PxoYwaKSDKGTBYD0NW39LBiENve9cjFMg==
X-Received: by 2002:a05:6000:178c:b0:3d6:4c4d:beff with SMTP id ffacd0b85a97d-3d64c4dc940mr12083056f8f.6.1757049512757;
        Thu, 04 Sep 2025 22:18:32 -0700 (PDT)
Received: from F5.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm27410154a91.26.2025.09.04.22.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 22:18:32 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: 
Cc: netdev@vger.kernel.org,
	Hoyeon Lee <hoyeon.lee@suse.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	bpf@vger.kernel.org (open list:BPF [LIBRARY] (libbpf)),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [RFC bpf-next v2 1/1] libbpf: add compile-time OOB warning to bpf_tail_call_static
Date: Fri,  5 Sep 2025 14:18:12 +0900
Message-ID: <20250905051814.291254-2-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905051814.291254-1-hoyeon.lee@suse.com>
References: <20250905051814.291254-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compile-time check to bpf_tail_call_static() to warn when a
constant slot(index) >= map->max_entries. This uses a small
BPF_MAP_ENTRIES() macro together with Clang's diagnose_if attribute.

Clang front-end keeps the map type with a '(*max_entries)[N]' field,
so the expression

    sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)

is resolved to N entirely at compile time. This allows diagnose_if()
to emit a warning when a constant slot index is out of range.

Out-of-bounds tail calls are currently silent no-ops at runtime, so
emitting a compile-time warning helps detect logic errors earlier.
This is currently limited to Clang (due to diagnose_if) and only for
constant indices, but should still catch the common cases.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
Changes in V2:
- add function definition for __bpf_tail_call_warn for compile error

 tools/lib/bpf/bpf_helpers.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
index 80c028540656..98bc1536c497 100644
--- a/tools/lib/bpf/bpf_helpers.h
+++ b/tools/lib/bpf/bpf_helpers.h
@@ -173,6 +173,27 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
 		     :: [ctx]"r"(ctx), [map]"r"(map), [slot]"i"(slot)
 		     : "r0", "r1", "r2", "r3", "r4", "r5");
 }
+
+#if __has_attribute(diagnose_if)
+static __always_inline void __bpf_tail_call_warn(int oob)
+	__attribute__((diagnose_if(oob, "bpf_tail_call: slot >= max_entries",
+				   "warning"))) {};
+
+#define BPF_MAP_ENTRIES(m) \
+	((__u32)(sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)))
+
+#ifndef bpf_tail_call_static
+#define bpf_tail_call_static(ctx, map, slot)				      \
+({									      \
+	/* wrapped to avoid double evaluation. */                             \
+	const __u32 __slot = (slot);                                          \
+	__bpf_tail_call_warn(__slot >= BPF_MAP_ENTRIES(map));                 \
+	/* Avoid re-expand & invoke original as (bpf_tail_call_static)(..) */ \
+	(bpf_tail_call_static)(ctx, map, __slot);                             \
+})
+#endif /* bpf_tail_call_static */
+#endif
+
 #endif
 #endif

--
2.51.0
