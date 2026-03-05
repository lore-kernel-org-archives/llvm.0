Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6AB384250;
	Thu,  5 Mar 2026 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772724421; cv=none; b=Y4jSC2QHomvNlh6ZMhZneDeWTDhDbZ3gZX/lE16jYxoX0zphQsYxbqFP4BtsTPNjA7Ew3GR44zgeIFqzYRaJbVIiq3G+Fhysk1P9tbNwkuW8nMm+Z3z7gphWjPBIboX5Zckdr4pJrpAnkygLdC7oKj1+gX378pm1cWhYeifug04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772724421; c=relaxed/simple;
	bh=9che9S/rfD6SJcfVDz2SXnU+7MBs/hKF8MhWtpvGqig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hlGwHU5Mjf+P6NePTpW/4CTts8XEkoDRWoZyVK4kUJYMJJglppldKUty+U/4ie7Qs/qysDa42vV7pLCxYgOB/BEOoCT1BRLeLrnWMLqDk01njSiDt6Of1nNbumb7QpA1gNVF0guErduemqDmvWrQpy/MEt9CVcnve+9eZ9155EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWiqRWLb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWiqRWLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86731C19423;
	Thu,  5 Mar 2026 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772724421;
	bh=9che9S/rfD6SJcfVDz2SXnU+7MBs/hKF8MhWtpvGqig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IWiqRWLbDF94tCasvan1T3MoT25tOqEQkcz2TfW2kmEyKjFyzSCCCJ1pf4Fg+oiGc
	 Kvn6Oc7nCZ5oxJpvT3tYbKQHSNu27DF8jvm7mglAxodFk7mVbnTDOk+tfr6TpoOktl
	 nEr0kndNA06XG2HZahfe32ZqmvLHBiqUB/sWfSnGVaTwgf4OD6XzGmSjf5PMjJyhA1
	 sS0DgbPR/h7cH41OJYAu1Isx0Hv/8z1BkChrPxUHgqpGHfALXptkLCm0e/NbGQELI7
	 pPcidjKrhH4P4g4gbevtk+rLC4rkFY1Eb5uZqvmk64mRAFLQawZzkgWzfHj+YRVESP
	 LgSEUjZOpch9g==
From: Arnd Bergmann <arnd@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Alex Bee <knaerzche@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/2] [v2] media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()
Date: Thu,  5 Mar 2026 16:26:17 +0100
Message-Id: <20260305152644.791897-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260305152644.791897-1-arnd@kernel.org>
References: <20260305152644.791897-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The deeply nested loop in rkvdec_init_v4l2_vp9_count_tbl() needs a lot
of registers, so when the clang register allocator runs out, it ends up
spilling countless temporaries to the stack:

drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: stack frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-Wframe-larger-than]

Split out the innermost loop into a separate function that is marked
noinline_for_stack. I tried out all combinations of having some of
the inner loops inside of the separate function, but this was the only
veriant that creates reasonable code with clang-22 on arm64.

Link: https://lore.kernel.org/linux-media/20260202094804.1231706-1-arnd@kernel.org/T/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
--
v2: rework after sering more of the same warning with v1 applied.

My earlier version was much simpler but still exceeded 1280 bytes of
stack space in some configurations for unnecessary variable spills.
---
 .../platform/rockchip/rkvdec/rkvdec-vp9.c     | 48 ++++++++++---------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index e4cdd2122873..ecb2819bd566 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -893,12 +893,36 @@ static void rkvdec_vp9_done(struct rkvdec_ctx *ctx,
 	update_ctx_last_info(vp9_ctx);
 }
 
+/* noinline to ensure clang's register allocator doesn't run out of registers */
+static noinline void
+rkvdec_init_v4l2_vp9_count_tbl_loop(struct rkvdec_vp9_ctx *vp9_ctx, int i, int j, int k, int l)
+{
+	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts = vp9_ctx->count_tbl.cpu;
+	struct rkvdec_vp9_inter_frame_symbol_counts *inter_cnts = vp9_ctx->count_tbl.cpu;
+
+	for (int m = 0; m < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0][0][0][0]); ++m) {
+		vp9_ctx->inter_cnts.coeff[i][j][k][l][m] =
+			&inter_cnts->ref_cnt[k][i][j][l][m].coeff;
+		vp9_ctx->inter_cnts.eob[i][j][k][l][m][0] =
+			&inter_cnts->ref_cnt[k][i][j][l][m].eob[0];
+		vp9_ctx->inter_cnts.eob[i][j][k][l][m][1] =
+			&inter_cnts->ref_cnt[k][i][j][l][m].eob[1];
+										\
+		vp9_ctx->intra_cnts.coeff[i][j][k][l][m] =
+			&intra_cnts->ref_cnt[k][i][j][l][m].coeff;
+		vp9_ctx->intra_cnts.eob[i][j][k][l][m][0] =
+			&intra_cnts->ref_cnt[k][i][j][l][m].eob[0];
+		vp9_ctx->intra_cnts.eob[i][j][k][l][m][1] =
+			&intra_cnts->ref_cnt[k][i][j][l][m].eob[1];
+	}
+}
+
 static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts = vp9_ctx->count_tbl.cpu;
 	struct rkvdec_vp9_inter_frame_symbol_counts *inter_cnts = vp9_ctx->count_tbl.cpu;
-	int i, j, k, l, m;
+	int i, j, k, l;
 
 	vp9_ctx->inter_cnts.partition = &inter_cnts->partition;
 	vp9_ctx->inter_cnts.skip = &inter_cnts->skip;
@@ -936,31 +960,11 @@ static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
 	vp9_ctx->inter_cnts.class0_hp = &inter_cnts->class0_hp;
 	vp9_ctx->inter_cnts.hp = &inter_cnts->hp;
 
-#define INNERMOST_LOOP \
-	do {										\
-		for (m = 0; m < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0][0][0][0]); ++m) {\
-			vp9_ctx->inter_cnts.coeff[i][j][k][l][m] =			\
-				&inter_cnts->ref_cnt[k][i][j][l][m].coeff;		\
-			vp9_ctx->inter_cnts.eob[i][j][k][l][m][0] =			\
-				&inter_cnts->ref_cnt[k][i][j][l][m].eob[0];		\
-			vp9_ctx->inter_cnts.eob[i][j][k][l][m][1] =			\
-				&inter_cnts->ref_cnt[k][i][j][l][m].eob[1];		\
-											\
-			vp9_ctx->intra_cnts.coeff[i][j][k][l][m] =			\
-				&intra_cnts->ref_cnt[k][i][j][l][m].coeff;		\
-			vp9_ctx->intra_cnts.eob[i][j][k][l][m][0] =			\
-				&intra_cnts->ref_cnt[k][i][j][l][m].eob[0];		\
-			vp9_ctx->intra_cnts.eob[i][j][k][l][m][1] =			\
-				&intra_cnts->ref_cnt[k][i][j][l][m].eob[1];		\
-		}									\
-	} while (0)
-
 	for (i = 0; i < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff); ++i)
 		for (j = 0; j < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0]); ++j)
 			for (k = 0; k < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0][0]); ++k)
 				for (l = 0; l < ARRAY_SIZE(vp9_ctx->inter_cnts.coeff[0][0][0]); ++l)
-					INNERMOST_LOOP;
-#undef INNERMOST_LOOP
+					rkvdec_init_v4l2_vp9_count_tbl_loop(vp9_ctx, i, j, k, l);
 }
 
 static int rkvdec_vp9_start(struct rkvdec_ctx *ctx)
-- 
2.39.5

