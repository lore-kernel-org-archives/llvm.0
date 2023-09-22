Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AAA44489
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:23 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-578a3069f1eso1888252a12.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405262; x=1696010062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ISP2L+rvg6dxZG1wcmYnXloNsZywrTUtixv49IhJ0I=;
        b=hX/59WhGbxMEMC7cWfe4OJMoBu82qVjlOyF3Nv3B/YbZYt5OCTGGYW/dgU0eg9Ljpd
         +VpnTvpe4DzH6ghXak9pUHsokjxcew15q/GumZsUtYG7YNt/s+T1KaRcAlkcNYEzy3ms
         0WPC+5WwrBBFIGcXN9HCaI6/sSjoYwfo84q9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405262; x=1696010062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ISP2L+rvg6dxZG1wcmYnXloNsZywrTUtixv49IhJ0I=;
        b=Rfzrxkn6I0/ZVLAFSMwjkugwTnzE2CtOGQgZSDAmm71DUWBc4LR/DNftDjstNd9scK
         5qli4MpYcdTFSJiMM5DwuFovP+9sODQbXXhHm180sUQRne5OHWxBpvADVnrlNiWK+OPa
         YZyroQgb2xQ6Zjk4/aJtu3nbaBYTOO6GhHzvn6ZWEVpf1ouh27qxQ6kw9c+rMxQfpaDb
         zVrZqW1Lv+IdbgVIlYg0onhSYNp2xxVKc53QozOZdyaHNS9X2RWjJFz7GicI1aJi686M
         qylSPbgnhZogNZnbrXJFChJynvLqcaLfzgQLBijCcfJdel91y7edixK97wsquMW5GQzh
         v2Qw==
X-Gm-Message-State: AOJu0Yw7/nO8MDVafZCC5UfpJfQfKOKUPGzPOKrx1Pom8+1YeO/FYMuO
	vE7/XzVUpJ4j5aw5Wo+oDLKn3Q==
X-Google-Smtp-Source: AGHT+IGxW0pO6A2XYuuil33uTylCAIbRaQSzobX5s7nUCpWCckLaGOgJJl/22O16HRisYCP+P0WYhg==
X-Received: by 2002:a05:6a20:9499:b0:13b:a2c9:922e with SMTP id hs25-20020a056a20949900b0013ba2c9922emr268710pzb.27.1695405262686;
        Fri, 22 Sep 2023 10:54:22 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c7-20020aa78c07000000b006878cc942f1sm3457800pfd.54.2023.09.22.10.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jorge Lopez <jorge.lopez2@hp.com>
Cc: Kees Cook <keescook@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] platform/x86: hp-bioscfg: Annotate struct bios_args with __counted_by
Date: Fri, 22 Sep 2023 10:54:21 -0700
Message-Id: <20230922175420.work.701-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418; i=keescook@chromium.org;
 h=from:subject:message-id; bh=kt0VlUdlEwKUKwWP1rv6tofv8fjvexz2uhyfkXWj6p8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTMfB+LYH5eKEwcBoqoFlTtLOyMMpn1kR2Sa
 TizrkR/ooiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UzAAKCRCJcvTf3G3A
 JsfnD/wN2QM835WwG5VD399xvmpEfqV/waSzTryLMYZxcqIlyuTG4pL75mWspCtqsPuHkcPq/5+
 dS56aaMDY1kiOZILGtGY/o+GWgizQ0X87eI7vpaVFKNq5aVB81SWua/rKAzQ02ogL1ld6i21Bax
 iKS3RQ4mhGVuAyMeSzgYg6LVxU7VHCAX1MzNuZBEbxxYYc9ePrN+y0Hkr39IRDtkwVWcx2PaZr+
 ZPLbM7Gr1c73OWGB0bhxLfHaX1rgfqmB9gXC3lJW/WyMNt2wnbyTplB/202KUySHEVGpzzl7+TK
 1cMerBWqiNFK3BmK1tZOZh3L/GUu6t+hXEG1zkNP3sFOGOsRItI8w2yDQEocODb2NVCQZr5t3B+
 HELziLz9sxbCa7uWd78WEaYlS+jm4KnMPuXwIOm49XG7eeyCEqDz1zHK07JijFrG3CMQkyWttQ/
 J92lXH7PGL8Jnme0WvdP5OUM1swG3A1kKndnO4G2vXJ464QIOn+OsvQC02MTg4EG2OF2cvXaXuz
 V7+ZvYpLopVQKGVbWWY5H2WfbsVTdPZQHrTdnHLHVkmL6vLAD8wnzqR4fR9rDCWgCGtAzfNnpDD
 MMUbIToTezIl9ipPdd7j5G99rxqHhdMNHOS6KM1DGgOhQzpxGIl2uXlE55Wb3yx3OZcsI/MIXov
 dMn7rbm UmQyK2GQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct bios_args.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jorge Lopez <jorge.lopez2@hp.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <markgross@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
index dea54f35b8b5..4da99cb7218d 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
@@ -19,7 +19,7 @@ struct bios_args {
 	u32 command;
 	u32 commandtype;
 	u32 datasize;
-	u8 data[];
+	u8 data[] __counted_by(datasize);
 };
 
 /**
-- 
2.34.1

