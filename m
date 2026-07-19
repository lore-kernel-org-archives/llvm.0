Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFBE3B19DB
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484043; cv=none; b=RO0fY3ADkL+9q5knIEswuyNlCWBt6mg3jYXnk1IJ4wh4UQe0YW16SgyuaPkEYhyMGA2zz+W6M26X2gfZ1VLd9bNeV/rcOVwdCb+GmJyz5L8qmQcmQdUuAGyrFMPW1jsa7HnFBT9a9qPBDCoKIqQwYgV1G6mV8uOJ6zsg3rVbTW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484043; c=relaxed/simple;
	bh=3ZUCrrDmOM7VZSnp6sdBGE5jCnwQNOc5dOPQ5kzHMhY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EYdOZf8LlKbt/KAe9HsPZVdC6T5AwyLRofFbpmyrpqanKfKnhqYYN3uFL3WGspyTKn5EY9q3as8dm1H9rOhZC8Pct35TGlpeBiZmF6u5fo1o/ekM3x6jBTLmHe45g7wpO+jK5Ke1N0rvt1WzagkYOBbD2XbOonAo3zYdDqWlAIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7aPZbqd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7aPZbqd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so103407775ad.1
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484037; x=1785088837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gQVLUSh0YdJH3i5yQlMay6TXyEhugldDrvm9uMupsBE=;
        b=q7aPZbqdwUXe1l8pCcDbyfOj96qDinOLcb4jFvWCg2F92Lyq+Ma4Kqj+JS3/cDvkun
         +ZtY5wzT7jjAM+DmQN4tjIJsZp0yhQgqipUUdPsfCXWEafNLRnbv4vHYsgqBzYmYsiis
         z+4UBWlfMJiZ+4Bclh4SqsCizsMkOR1MdvEEn61RZnjatOCZIYp2JomWliozu9gs+Dqt
         8PJil3718s410dU5pjAteW6l6pX5+6B5zpCtaZ7VL4cRP0+P8Ff64XcNhM8jDuKPWvEz
         YKZBSJqPMDpWS+rS4G3SKCvRetlIG8IkMqrwk066/7GVgkZxvHd/ykMtazJh72IqlxVz
         wbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484037; x=1785088837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gQVLUSh0YdJH3i5yQlMay6TXyEhugldDrvm9uMupsBE=;
        b=BN8GCjeqa3djurwICL2vMPl/B8hcM3LYdtMAhZniVNCEljzuTTN7I51UJCtxao6K8a
         RZqW9hha7jQUYj1kmMjvYY7BrWqTJgB8QUelzgtFfcsU2VDbkQbnH3NCnrObeNOGnRza
         dU2/KMLtOdUvssqUdgPDhjgGaweIkKJanLuN6O0lwzufdQkSuW4FMUjSvPt3iHz5MrGc
         sNqKn1X7ZjV/ib3S0SXwJWla+DUH+1jan/kwDKjjA97FWdjzNu47meKTNZcUt8kFcEgz
         rc2QSjC0gHT5Oiztn1z4um3HKO7jvMvmGItyRC1xeF6ohgs0RoYyHPbesb5awC91mlu/
         BqXw==
X-Forwarded-Encrypted: i=1; AHgh+RrADXP5ktRcBJkGaen1gVHBrBwWOAndVP0BBUtpk77DxfrJ73RCy7nRIEdVPqISCaHluBBa@lists.linux.dev
X-Gm-Message-State: AOJu0YzxeHOoTf8AOQHCwU86Y7GfEBMiMFLA7Ajzv+q3IM7FxlKIl3ZS
	xX8rVpfIvGe/WFUvO4H1FbZx7qYoExcWxaWIGsEjtUIuXX21Gr+qIFJY
X-Gm-Gg: AfdE7cknmv7ApPZdjwigxHmcNZJjw9VqIbRzk+xltdSiYFCTE/5lKT2nMBAfJYNaRR5
	+MT47W2nzyfcOOVlje1nPPGfNjGD5hjw6VhIO9WlpMUOE4/699Pajx1/81dbzzO5O4D6+81uxI2
	PUHX5iQ4VdtkJKQH0EcICfUr++sPvAUz2FFNvFPGEvys9yAkHwFiXN6F8R0WifHTT9XQPWlixfj
	aejAFlQPIUYkxWgtn3cvHecdmyT+Zqdny6uzc3+4OaJ4RiLdKA7FB+LWTQtDhVJOE+Bk5vorWqf
	jiC4Re//l+OSj+z0rRDK4l+/pOGdj0QjcSzo9r9NCV6zMXKGlCKnr7oGRWfCFR6pnRuIrgTrI5X
	APc/vO8dLAio9PTvYyaHQEyLyLwbz9N4b/op3/nSo9KwPLzLm2lM5cheTiTeXSwwvgw==
X-Received: by 2002:a17:902:fc44:b0:2cc:b480:28ba with SMTP id d9443c01a7336-2cf34a25ab6mr120497085ad.44.1784484037543;
        Sun, 19 Jul 2026 11:00:37 -0700 (PDT)
Received: from ap.. ([182.213.254.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34769bd6sm43511065ad.74.2026.07.19.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:00:36 -0700 (PDT)
From: Taehee Yoo <ap420073@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	Alexei Starovoitov <ast@kernel.org>,
	amd-gfx@lists.freedesktop.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrii Nakryiko <andrii@kernel.org>,
	Bill Wendling <morbo@google.com>,
	bpf@vger.kernel.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Airlie <airlied@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Eric Dumazet <edumazet@google.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Hoyeon Lee <hoyeon.rhee@gmail.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Michael Chan <michael.chan@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Simon Horman <horms@kernel.org>,
	Song Liu <song@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Taehee Yoo <ap420073@gmail.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [RFC PATCH net-next 05/13] bpf: offload: allow PERCPU_ARRAY maps for offloaded programs
Date: Sun, 19 Jul 2026 17:58:49 +0000
Message-ID: <20260719175857.4071636-6-ap420073@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719175857.4071636-1-ap420073@gmail.com>
References: <20260719175857.4071636-1-ap420073@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The knod BPF offload keeps hot per-CPU statistics in a PERCPU_ARRAY
map that is mirrored into accelerator memory and aggregated back on the
host.  Permit this map type on the offload path.

Signed-off-by: Taehee Yoo <ap420073@gmail.com>
(cherry picked from commit c447c9012940d48c1ec20a8ebac8d779e7d5a6fa)
---
 kernel/bpf/offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
index 0d6f5569588c..36e747a12cbe 100644
--- a/kernel/bpf/offload.c
+++ b/kernel/bpf/offload.c
@@ -510,7 +510,8 @@ struct bpf_map *bpf_map_offload_map_alloc(union bpf_attr *attr)
 	if (!capable(CAP_SYS_ADMIN))
 		return ERR_PTR(-EPERM);
 	if (attr->map_type != BPF_MAP_TYPE_ARRAY &&
-	    attr->map_type != BPF_MAP_TYPE_HASH)
+	    attr->map_type != BPF_MAP_TYPE_HASH &&
+	    attr->map_type != BPF_MAP_TYPE_PERCPU_ARRAY)
 		return ERR_PTR(-EINVAL);
 
 	offmap = bpf_map_area_alloc(sizeof(*offmap), NUMA_NO_NODE);
-- 
2.43.0

