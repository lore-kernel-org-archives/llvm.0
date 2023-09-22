Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFFE43AA1
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:50:39 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1c3d6d88231so21224785ad.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405039; x=1696009839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMOJXPHQhZA0yS0fHoLI/plMshH0rTXOliwF499/DWE=;
        b=iIfninIndOauo9PDe0ZK2BD7EwhxXg6/sGbSGDUwWcYr3vInJ2Ufbo7GJ/p0tymD51
         siFiufTTpvO/I24quvLZcXsOweyOapTJKEw3LJQcC/cglSin00L9K/NhVRAkSQOY4xmw
         i8ersz72Xx3pY3QJmuJ6/pIrfqLWhjMZxjfl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405039; x=1696009839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMOJXPHQhZA0yS0fHoLI/plMshH0rTXOliwF499/DWE=;
        b=Rl+OQnOjij8/3pY1ClrNULWKWGXmQcesUeGGgwVG/tyTKizquA3nbMaTC+ZwcjKTve
         R9Aa/G36Cmeo5sRXzsTb53DYG62zupeYo83DsjEUMiOwZN89o9rh7j54IvOWCthpvgMZ
         TVIVA5k1L8WtOEr7xjCvhTkHV4EBd8DWdCfVWttP2t00YdZUafSmqJbVlEDTqVHxmIpG
         gUPUXpxy69mMhQf4Tnf6Tla2PDiU3WuA0hPCJS9Y+OSjMK7TdKGCKE3DRTJH0/VVnSUC
         mTW8va+EPoyhY145JwR9yLR9nwqzaB+LkgpqnehePgfZz7Zy4UtDG8uptHE9J1TBlFoW
         70GQ==
X-Gm-Message-State: AOJu0YwZBZyFxwrbuyZgXqF+whyu84v7bTRZ7jz7DG9iIMfnYhReGQG2
	zYmxKyznPOeJg8qWt2xCpLpi5g==
X-Google-Smtp-Source: AGHT+IGaIyx2bOgCC7mrztEEIfqHLjz9L9iLu8LZRcOyBfuSv77bh1GHVC2OQn0kqgo7aKfmi4Ad+Q==
X-Received: by 2002:a17:902:9892:b0:1c4:72c9:64ef with SMTP id s18-20020a170902989200b001c472c964efmr180522plp.40.1695405038816;
        Fri, 22 Sep 2023 10:50:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b05e96d859sm3777350plb.135.2023.09.22.10.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	linux-input@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] input: mt: Annotate struct input_mt with __counted_by
Date: Fri, 22 Sep 2023 10:50:37 -0700
Message-Id: <20230922175036.work.762-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=keescook@chromium.org;
 h=from:subject:message-id; bh=LEWy0l9zrvVMRn8ts7PWj/kuD09dSrXj4WnAazmlq9A=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPsQMKXeJm0ZhCGVnQLsQjIil2uivmvEwwNv
 Rzm0/Jc5EeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T7AAKCRCJcvTf3G3A
 JmKlEACd7wdpTzCBhXNjMStZK0q7mpoWAr0hNvgGleGXtkF7ihbchHc07XOV5oi29vSWQxoCGK+
 A7UqilH4l+s+SjoKasEgekNpcsNlUXnd5SyTJu3U6W75mUkecgGQTjckkOPMaA9J/CvHpHVgW3X
 8MzJRaI3wxLRetGWsIe/dJ05u4kqLqfR0dbRv5CS3V9N8qTARLC+X3xfasNxO4nqzjALnb9UZng
 fWkUTE1dyh6MN0wJGLszYB/snY2r4SUtv8XGRyLAVck/Sh65NPeGwMITGT/bzc0w0Zsvq/E/4BI
 Lpl0hEYbOGDbqjmsoNfA6pVOrPQCAgHT5C2nUlHDCqqdTL3mvsv2+Pf9o8kFi9hQUQumpSgo1Eo
 qbSrXyd/LG+ys3iOt1WL8Rs9+/Mc8M8LmCLvUE2cDXnYmJm7c56wkolM+b3GuFE0AQrKc9jnMrj
 AXxSWEKzMB48nHsnaaOLnB8IO876orcAGoJvPCPzEa67LgSTjV5eqROX10kIz8l+4Vz5YsaQp/m
 0yisfYjudZ8duUFfShH58IS6W3CxWKuNVW7x+d68ao2hstJlKFbk/V+mJrUC4QriWao69tsBd+D
 NtdrU7nVOR4lk9udHmUznHVvxi8YN3pje3duKPp+5O+bnFoh2ptu3/33bWMqKkHemMLKstvXYsf
 3iIwQc2 vWZX8QZg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct input_mt.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/input/mt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 3b8580bd33c1..2cf89a538b18 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -47,7 +47,7 @@ struct input_mt {
 	unsigned int flags;
 	unsigned int frame;
 	int *red;
-	struct input_mt_slot slots[];
+	struct input_mt_slot slots[] __counted_by(num_slots);
 };
 
 static inline void input_mt_set_value(struct input_mt_slot *slot,
-- 
2.34.1

