Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08F53F4CF
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:18:28 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c3d6d88231so11484905ad.0
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696375108; x=1696979908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fgl9vQEJJbjNo7nW0Wg2fi9SpTiuajLNVx4n3kKMxac=;
        b=SmqSr0GbDJn/kF6zxOjNMieJ1+wnuS6DKcToxCp9eqB6sBbfvMctDNdlOiZasbFtgT
         chfLqrHjA/bLqhxjz/JYt571RsiokWihqI03GRsGfCcqljHuvS9h14yNQIqlMBLSjUMh
         CizhhrrEfTquXD6U5aj8K8rxy2ql0uKjFARyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375108; x=1696979908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fgl9vQEJJbjNo7nW0Wg2fi9SpTiuajLNVx4n3kKMxac=;
        b=gATAuESTB0FWPBE3RcXc5Sw0XZnENKY6Ab2T7gY2E+MQed81so/tfPMGesmqPTjUdO
         p2QZGoUpB8BSbNJ68aYfM6SAzi0wlIPfHozr4N9XsFYHO38gkUN4kdBVOGVeCOi7K5UO
         qpe0VrYm4tTgydcdtlKUoKSzbqIFcZZZGEX/iScO1KYEG/MRCeu+IktnMbALjq4CUc7x
         p33SpT+BDsF8ot/EZqY8SjNIRXeGpSJP+6lEfR4DOeBLmpJy3o4XK7Cn1gxvEzlpzhSc
         kZ+Jl/TNgq5GYiWlnvxTdYKHF2dJY+j3P2m3iw7zhuQW/LSP3Ly85MRHK7obOthiHt+Y
         U66A==
X-Gm-Message-State: AOJu0YwBfd/qWFjBWVprOJ7aj5f+DzEn2RG3iinXcVgy9Rj6ujhrJIgB
	dmON19Kl6Z5i6rL0/0Joc2Zuzg==
X-Google-Smtp-Source: AGHT+IENo5Q2eLmEdNEu7fkSSs1KgbtKqyGqHzL/hdWpw4mK4/awHV+Yesa9BOkmwpuqvxV9DEr94Q==
X-Received: by 2002:a17:902:8f97:b0:1c7:4973:7b34 with SMTP id z23-20020a1709028f9700b001c749737b34mr847042plo.50.1696375108193;
        Tue, 03 Oct 2023 16:18:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c3c600b001c55e13bf2asm2164183plj.283.2023.10.03.16.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:18:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Kees Cook <keescook@chromium.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] netem: Annotate struct disttable with __counted_by
Date: Tue,  3 Oct 2023 16:18:23 -0700
Message-Id: <20231003231823.work.684-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=keescook@chromium.org;
 h=from:subject:message-id; bh=QpdV3D/pVMVweNA2oq+ijy0Ps1fXCHwUqT0dHu1y9HI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKE/cn0ZGSBlVX+YLyS7A9haLOLgFWp/l+KGJ
 DE5lp8PcbuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyhPwAKCRCJcvTf3G3A
 JhyLD/4vRULjUhoTz+b+8DrLZnXEOUIpFIYJ+0ej73zTgRl+SU0hEtcV/IhKk4IxNZLKfg0zx3s
 sJ8zaDIZY/OuFu+YH5xbTOwAugAftkAjY+ZqN0XPxmkxOYjrx8zgEveE8iuwf2zxAL3xt9JDcQ/
 O1Wvsi3uEUzLs1QIrtaki9tOYku41VrQNQlOcpZjcyMh4DLPMBBVTejrG+8nyYlOOkmlwgjEMLz
 C158/Q8P5Be9//NQP1XZdULie/GNiaQZ7T4bQreXvgpQ0tr1lrQDbF6/8Q1gtWA1qAOIxqtkifw
 cXxGIe2woegB1Do1RgBumq0NIqYJRFl84RGqT0G5JuEzM0wecHS5QhEyObBw0vIYu6CV9NuAybw
 sZ7LAHZSSfP/+ZdIiaPsKV54lYYw56/txl25EgaxYjjZfRrPeNzjdjEAMXEvJKUXLSrGlqbnpwy
 IlG7RtvhLYPyIvOf4RrB/DoGUXO/JO18rAY8+spUsW4qU7M+F1ZvQNM5uqBF+PQSmCIEyM25wY5
 M/dKWVd7aB9oVyVBpNes2MNIglyizhxXKKMPwzXAeR5Ya0MOm1NsiJbRvV/7fJSfVJi0O7T9ZSA
 G4KV9HyfnLV8D0BhDlslXUjwAwImcRCCChBdzFfz+tx30E0nB3LsPPzZB8EgtetyzHqaMCBJNvL
 1JWISSN X18Ox4Ag==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct disttable.

Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/sched/sch_netem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 4ad39a4a3cf5..6ba2dc191ed9 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -67,7 +67,7 @@
 
 struct disttable {
 	u32  size;
-	s16 table[];
+	s16 table[] __counted_by(size);
 };
 
 struct netem_sched_data {
-- 
2.34.1

