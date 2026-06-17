Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209673B14B2
	for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736389; cv=none; b=tvxnGmgAQA4FTjcRHrv6GMX8KII2IV/qx+iBFdqhGq6Jf8Kwx2+n++rK1/h5tsyqhmCWIHNW3nTC8paBCNH3D3jdl5WKzDxBGtvDj3KTnjWSU3tz31nVe1p3G6j2CP3vxHMp9iEo5A9n1O5e0zzi1obdz2s/9iT46UCEbdXNbPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736389; c=relaxed/simple;
	bh=+/QKlOIR/Jr67gkgPxhq8MLLwh/htDAN7XbEy7/DgTo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QQT9zTKI0bx4lNi4NpS+PJBX6oVkMpjxOo90YsaeEsJBYuMiAzRRY5onCM8O4/tYCQXH8tqrrjV/XweebtlKcQyffQPjdDRzXscpaqXUyPb+juyUmepHXJKym0lT8TImUHGEFK9iAd/kyi9armCaXLoGTc24Eq64Q7Td6VWTpw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N5av+tA4; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N5av+tA4"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-139871a52c2so555220c88.1
        for <llvm@lists.linux.dev>; Wed, 17 Jun 2026 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781736386; x=1782341186; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2vpC34LH3O3p+3l3izwB2YQX2KfU7uT2tc5IZugSQEI=;
        b=N5av+tA403Oh5iGVKaKkIF1BghZorva86ndFXeeuugO2qd0kO8ocVoKRJkDSrPZ3gF
         0MgUCxH7yPj+I8egtaSNKjTQQUJgbVJOL0A4vLcTYxXPPXxvYflKlhg7r6pBJaMbSYZu
         VCj+hPpGCfplzFLxKDtDe0YZ/IHMrfo8IH5c+T7qlmF3XyBE3xCcKa5kAO3DIP0ixSBd
         1YDAKSvTwGDjTQYrzert58zTLi9ZPG4F9KJm4jzfhFGMvR3tcLNaQF92uznCTUwFjT2+
         oPc/eAuCroZ+LrxME0JBeXUJVQpdwU0PU70junZmxXK+ia5ElXpjvEzwz6dpSyX6ltsl
         6OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781736386; x=1782341186;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vpC34LH3O3p+3l3izwB2YQX2KfU7uT2tc5IZugSQEI=;
        b=hzovw5w1cg5zPmuiToQaxP/FF6MXjHuULbGBPxwdf3qdhdWbBx+iAzhnWDmAe9Gg8h
         NzKVQh/VbCeENCCJbn98+4YLQ7TZ1h/3knVeVmvfcY66OiM77wRDMK1V7ldYWi5RhXw0
         uWT84iVEE/h9aGXuPQcBWSpcUEz1JClaNu7HeG7wV9Uq3R+aADckj13ZXh+JIpDnuDoQ
         tZcfK3PeY5vZSWYsid2dIiNDo5GCt6C9fXtDC+y7WY0DABhZbSsJ9NdXsz65KJ5LZpik
         lFpTdC6swXxsVwNuSDOZprle56YupYmGbM3knES7ceKZo2nc/2FcbFkwm5bspeELin66
         D1tA==
X-Forwarded-Encrypted: i=1; AFNElJ9jP3jkHs1EqmJAUjxq4uvqsnaSmN7jXyPkGZtphMxapm9cn7gNbx2AT/xoH4XXhj9/Rfg/@lists.linux.dev
X-Gm-Message-State: AOJu0YwFYgT7Yv26uRe5dgL8YFHguYKYJZOJvwN1vKZu06DMFhD8XY7m
	/1CrySKK7hD9wZAFa8qvCQmMgRpG+3TK8uw1xqSwMv/fbjxr7OmLa+dK81U1wIl9h7OMTg==
X-Received: from dldyr3-n1.prod.google.com ([2002:a05:701b:4503:10b0:138:18c:c8d1])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1b18:b0:136:ff02:d00b
 with SMTP id a92af1059eb24-1398f6de2c7mr2355256c88.25.1781736385698; Wed, 17
 Jun 2026 15:46:25 -0700 (PDT)
Date: Wed, 17 Jun 2026 15:46:23 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260617224623.1346309-1-xur@google.com>
Subject: [PATCH v2] modpost: Ignore Clang LTO suffixes in symbol matching
From: xur@google.com
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Rong Xu <xur@google.com>, Eric Dumazet <edumazet@google.com>, 
	"=?UTF-8?q?Ren=C3=A9=20Rebe?=" <rene@exactco.de>, Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

When building the kernel with Clang ThinLTO enabled, the compiler
can mangle static variable names by appending suffixes such as
".llvm.<hash>" to prevent naming collisions across translation units.

This name mangling breaks the section mismatch whitelisting in modpost.
modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
safe references between permanent data and initialization code. Because
the LTO suffix modifies the end of the symbol name, legitimately
whitelisted structures fail the match, resulting in false positive
warnings.

For example, a static pernet_operations struct triggers the following:

  WARNING: modpost: vmlinux: section mismatch in reference: \
  ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
  ping_v4_proc_init_net (section: .init.text)

Fix this by ignoring "*_ops.llvm.*" in "from" symbol names (the same
as "*_ops").

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d592548cbd60..a7b72a81d248 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -969,7 +969,7 @@ static int secref_whitelist(const char *fromsec, const char *fromsym,
 	/* symbols in data sections that may refer to any init/exit sections */
 	if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
 	    match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
-	    match(fromsym, PATTERNS("*_ops", "*_console")))
+	    match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")))
 		return 0;
 
 	/* Check for pattern 3 */

base-commit: e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog

