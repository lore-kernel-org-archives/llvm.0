Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107921;
	b=IivS01b0sIkVfBJ2uj7v5WDmQ+fv05hjfyQKNwU+Vsz0xsMDMzESfP6sGpKYxthsqBfv
	 fB6wAP1h/Usr7Dh1+ubw1XZaBJhgWjCoguE8SAw4CH6tsFAlZ5s5FTR8W1fpfWZM+NbiU
	 eWIDy5JFEIBqHSRwfjQIjuDnkf86pKxc/bvNoKiGefLn7tpolKw3RrYY7qBs9jHJ32ZMC
	 KKtIACur33UVngL2xwBOUPos6WHV8v9+8aAjvodBNBY2dqqWbq34/xPxTY5/QCr/rF5Fc
	 fqJL3igioXD1LtEIWdoNlRmZFfrwF53bzfhfCGiZ3X8C2quGYVYX7L/x6iIsRRy7hnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=lxyKrcrROgSrDO2SJS728Cqlccn0RMILLNUr3hcKYMg=;
	b=xVkv6cDBo7uBKMbgZg0JMcGB5oe1lsYIv7MedSId2yVV/RrEkUtDo2ofn6PsYKT658yx
	 imdP+JC28SveyJ2INiJ+yhkJxwa/yKCOC22UkzDVRruXuxYYJxwWiJNiGy2WHKvZHxMsN
	 rKzZd6ELqmEhHO1/yhfa8dsVmYbzSOdWNQsgGq3S1WqZridGM+Y09cE4pAe5Nvu0zOI0p
	 ddRX7T3OiQScKNNLMk6GIHhJwk002Qer7kRHlMbyDD1z8EAR6Mjns5aA50ZwzyTef6XWc
	 M2Q4Xc6GU291Q7gma1jQpp3/N2u11f1LJ/NgB8eZU8G0rxVusjv1pWhvIMF+uZe+A+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQgJqqXT;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D9E606A331
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D9E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQgJqqXT
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so6015202eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107920; x=1795712720; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxyKrcrROgSrDO2SJS728Cqlccn0RMILLNUr3hcKYMg=;
        b=XQgJqqXTnHm+y33iM5RX/8f6S4rLMpcb36vuHfcJeKiZy6DwWGS8JBTFL7XXv7gWNK
         yjh5+RBGKg0bqRDimpkIIFe16YB1GvA/DvJdu9kBz7JiLS9gcKayqAyEAlanz8yMV8KK
         YCNzm83tjTCnlRbdUdhDP5rxTQqR77c5vxcJ007kZC5K13FC6xyo3sNZDkqGaYHgqgjo
         s++fdUD7CaxR8FoUisqYrhjNURh1QFwHx7Mevm9prr13zBghIUTyqF+BC7RSuY8+SsVC
         kGPdDLhjjHVM++/6Ux8RhrZIKcDFhZyXF4bS5aHhJgCtX/h1fW2gKMNXibHF4HFRnSU0
         Qfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107920; x=1795712720;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxyKrcrROgSrDO2SJS728Cqlccn0RMILLNUr3hcKYMg=;
        b=23gI2SUjUkfpM6XcpBTPTnVCsq4wvbojmzjV4eETzuK/x/9qycQOmjAwCYJmkm/mgI
         IOUZ3VHk8+j6irR1nGh/W7BoKP0cVkDlwfGQ5xCYETwdTxFDRkoR7xA7ZYNHgH73JPK1
         aEzG7dl0SwajiZLA84YopPJpHiwdyuMrFeh7sImuMiNV2UhwRi1o775czpzRfvAnhDkL
         XnPeo7I9SmpM94MP33hyP+G3ZkC6lrkKHwOJBgtlflVaec+r3F6ArDFvYxHUJ8giuaNr
         895My9pLShzLK0dNS+V8CyQygwlaOXNPMK5aJpvym4ZP9IIZRL0iK0OzXs3MeHr2SNZ7
         ZFtw==
X-Forwarded-Encrypted: i=1; AL+hErH82azSslZgCtXemSlH/nIdVZxwaCJhw0H/KtBPdfc2mToxlua01E/eslff/pbNvTth7S3F@lists.linux.dev
X-Gm-Message-State: APuU4Z8frqPoRL89qz5q55891gYXOy0xUNfad44vxCBCnLDTzsV8m5Ab
	LWetE6SC2h2RbGO0UdkV14fr3oWVGQNMFx7nR3Sr4R9kbkkNoWu5AIlybLC8RV6AdqcFtZTsFa9
	2h2TuBprqVw==
X-Received: from dybgp2.prod.google.com ([2002:a05:7301:2102:b0:384:7a9f:7f2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d211:b0:384:6a72:4e91
 with SMTP id 5a478bee46e88-3846a724fddmr2026727eec.31.1795107919998; Thu, 19
 Nov 2026 09:05:19 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:17 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170517.1515872-1-irogers@google.com>
Subject: [PATCH] mm/backing-dev: pass "%s" format string to device_create() in bdi_register_va()
From: Ian Rogers <irogers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

bdi_register_va() formats (fmt, args) into bdi->dev_name via vsnprintf()
and then passes bdi->dev_name directly as the format string argument to
device_create(), causing vsnprintf() to run a second time on the already
formatted device name with no variadic arguments. If a caller formats an
identifier containing '%', device_create() interprets it as format
specifiers and reads arbitrary stack slots.

Pass "%s", bdi->dev_name to device_create().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wformat-security enabled; fix and changelog drafted with an AI coding
assistant. Build-tested under LLVM=1 W=1 and -Wformat-security; not
runtime-tested with '%' in backing-device names.

Fixes: 6bd87eec23cb ("bdi: add a ->dev_name field to struct backing_dev_info")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 mm/backing-dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index fad1495d3b20..58373d494d92 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1097,7 +1097,8 @@ int bdi_register_va(struct backing_dev_info *bdi, const char *fmt, va_list args)
 		return 0;
 
 	vsnprintf(bdi->dev_name, sizeof(bdi->dev_name), fmt, args);
-	dev = device_create(&bdi_class, NULL, MKDEV(0, 0), bdi, bdi->dev_name);
+	dev = device_create(&bdi_class, NULL, MKDEV(0, 0), bdi, "%s",
+			    bdi->dev_name);
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
-- 
2.56.1.708.g77570a6a1d-goog

