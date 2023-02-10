Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AFD63AB
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 17:22:15 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B00A43F5E0
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676049725;
	bh=S/oztqFWeJmzmDr/U8nZfNkMKK2hxPAiujJO+Umo16I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=qvyPWeT34QkKF1H90NqcC7RCf83vXhwFnQhk/wrRuX5Aj1g5g7vpqiTmwCiveUY+5
	 GJpnPDgXs3N+jMEd3F+8OvKLzE16LZkNR8LxRqT1+iKbJ4eNs6r00t6J28sCzTuszk
	 T2S/vCt+ckG6nnjKo8ilJBFkxAVGuPYaX4HV/hBE3L3oDJMcIPQafV+ozpsZxsNCLh
	 e2O3zHef9VITfFTI6UOD1EChWAuvwOGzsfV7rlPfEe1yQ4YGCGPc29KGC4FDVbU53g
	 MGLt9aZILvjU5kphfwZPeneeZAhVB4T1TG7V5W7SUaAFUcJkGZxjaMvag+X//qgoIX
	 UhXTyXfVeJtXQ==
Received: by mail-ej1-f69.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso3957341ejb.14
        for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 09:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/oztqFWeJmzmDr/U8nZfNkMKK2hxPAiujJO+Umo16I=;
        b=CpeVFaSOicsH8K2uow8XnS9mV07gB7TRqkzl+saJg8NKQq59rpQ4L46KgO9N/Kdmw9
         7HNvd0NTGQf9fzzADtsNXkmYzFlcuNPJbVxckrrU/otqfhtIQKLGEOTKqDrSVc/Og/j/
         fg8f3fMedpQ3yWtT3U5pbcsR4QyBAtpuspgXDEBrGOHnPj1Sf0XLXMkLfplLj45yvwm/
         hUbxS2skk2eI4i+7XLvJgHdyFrP2K1nVuVntp320JagdkiEmzMERK6Q7SHNJi6EMmoNB
         2VG5VUrlFcA9Y8dyEZx4AZB7fuEKeGoKxIFsc2lDCnAClZubG/167XwXhi5O5E8M/lMk
         374A==
X-Gm-Message-State: AO0yUKVsLIBP/2yyp9h4f6MF1vl+tdnyLnzKW7hq3t2Sh5vWPMEOv03Q
	zDzbjG/x/kcqG0uf0scxq2Us2hgGfcSB+sx55aLf8xp3bRx+tbwBwZgK1InQ2IztrTX5KR584io
	HCgRwrE1tN5bNjj8mbOn7C3e+nyDvX/Q=
X-Received: by 2002:a17:906:1614:b0:87b:dba1:1bf3 with SMTP id m20-20020a170906161400b0087bdba11bf3mr16347219ejd.30.1676049725207;
        Fri, 10 Feb 2023 09:22:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/YIySZYVz31YG5CrgtiBo3ntekvjcI08pZJN9QSahhumZtZTxLAgUnewRtPJBbaHEL0+GH+g==
X-Received: by 2002:a17:906:1614:b0:87b:dba1:1bf3 with SMTP id m20-20020a170906161400b0087bdba11bf3mr16347206ejd.30.1676049725036;
        Fri, 10 Feb 2023 09:22:05 -0800 (PST)
Received: from righiandr-XPS-13-7390.homenet.telecomitalia.it (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id i12-20020a170906250c00b008adc971f5acsm2655543ejb.178.2023.02.10.09.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:22:04 -0800 (PST)
From: Andrea Righi <andrea.righi@canonical.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: allow to use INIT_STACK_ALL_ZERO
Date: Fri, 10 Feb 2023 18:22:03 +0100
Message-Id: <20230210172203.101331-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_INIT_STACK_ALL_ZERO enabled, bindgen is passing
-ftrivial-auto-var-init=zero to clang, that triggers the following:

  error: '-ftrivial-auto-var-init=zero' hasn't been enabled; enable it at your own peril for benchmarking purpose only with '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang'

This flag should be dropped in clang-17, but at the moment it seems more
reasonable to add it to the bindgen CFLAGS to prevent the error above.

In this way we can enable CONFIG_INIT_STACK_ALL_ZERO with CONFIG_RUST
without triggering any build error.

Link: https://reviews.llvm.org/D125142
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index ff70c4c916f8..5e26db07a1dc 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -267,7 +267,8 @@ BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
-bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
+bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET) \
+			-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 
 bindgen_c_flags = $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
 	$(bindgen_extra_c_flags)
-- 
2.37.2

