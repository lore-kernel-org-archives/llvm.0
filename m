Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DC22222D0;
	Thu, 18 Jun 2026 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793178; cv=none; b=Pg4zRpnWbu09UfdECOaCLhh68yNdTnQ86IKhVXBYI9dzvHGKzpXuwZTV/I2mRJ7lEeH2KvVfHnnSRTXm1AYivfl2rcpP+K3VTF4yxt1Vg7Pxr9s5GATtBk4ByLrI9vYXD7uNHb/irSebqMn/IBWt6NOnQUs6IyoPSnKL97haW2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793178; c=relaxed/simple;
	bh=GcwmUk2CHSFWqPzZF0Syq5X7lELTJtORCRgtXdT7Ze0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tt67SigwWqLJpw0xKfNdWq8lNAmBMUVCr4+C/ltU4D0s1COek1hIm52Bhyxc/PMETPL/e9NgNDU5Uw8X9VTr5bh3Uj91zBXc2f3GeJnzkRAPgkbKpEMyUgxEuBprWoTcyw6mt/dU/Nd4e4Sn7/OeebPKuqlYGfaUTva/fpZVSe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYLRQVgn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYLRQVgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECAA1F000E9;
	Thu, 18 Jun 2026 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781793177;
	bh=YD1Hh5+NvW5FZU6rOeZOC3ILpi05MqQ7oOuIhRrupMc=;
	h=From:To:Cc:Subject:Date;
	b=mYLRQVgnAIOBsMAuYh3BomFtUFNxlFPT7YRCp7HhsfMG5xB9BrYR7pGmtQjlnlwoD
	 sY8hR/PqmFU+sf5cMh6KxIqB4nVEV2VaFqxvGSUVsrfpzdY0ydZjFAJUwWX8vZFuRd
	 zN4JiI01ZF3AxL/31ReChcKyfABXXs8uLIJ006Juzd4MQsFkl+w2DV84yVIqVDPqGN
	 Izvi/ISyJasyY1PHh/b6mZVSD4ouS8FAVqGsXsR/6h/z05rtsgkMcfEoIsfxo15LCq
	 3dTSb6Bpz6SYq1NBNe+Muj5RJdiFa02ic0CUtalo4QHienN01xDznjj8T7n4nQzvaP
	 QN2wPtnXGewLw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] media: v4l2-tpg: reduce stack usage for kasan builds
Date: Thu, 18 Jun 2026 16:32:47 +0200
Message-Id: <20260618143252.1885475-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

tpg_fill_plane_buffer() is a rather complex function. While there is
nothing wrong with it per se, I have run into corner cases with clang-22
on s390 using KASAN that makes it run out of registers and blow the
stack warning limit from excessive spills:

drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2629:6: error: stack frame size (1560) exceeds limit (1536)
      in 'tpg_fill_plane_buffer' [-Werror,-Wframe-larger-than]
 2629 | void tpg_fill_plane_buffer(struct tpg_data *tpg, v4l2_std_id std,

Forcing the two largest callees out of line completely avoids the problem
and prevents all the register spills, with the stack usage for each function
going down to a few bytes for the local variables.

Arguably this is a problem caused by clang rather than the code, but
a noinline_for_stack annotation is an easy workaround.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
If anyone thinks we should track this as an llvm bug, I can help
come up with a reproducer
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 931e5dc453b9..e1d5c220f738 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -2346,9 +2346,11 @@ static void tpg_fill_params_extras(const struct tpg_data *tpg,
 			(params->is_60hz ? V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM);
 }
 
-static void tpg_fill_plane_extras(const struct tpg_data *tpg,
-				  const struct tpg_draw_params *params,
-				  unsigned p, unsigned h, u8 *vbuf)
+/* noinline to work around clang KASAN issues */
+static noinline_for_stack void
+tpg_fill_plane_extras(const struct tpg_data *tpg,
+		      const struct tpg_draw_params *params,
+		      unsigned p, unsigned h, u8 *vbuf)
 {
 	unsigned twopixsize = params->twopixsize;
 	unsigned img_width = params->img_width;
@@ -2483,9 +2485,9 @@ static void tpg_fill_plane_extras(const struct tpg_data *tpg,
 	}
 }
 
-static void tpg_fill_plane_pattern(const struct tpg_data *tpg,
-				   const struct tpg_draw_params *params,
-				   unsigned p, unsigned h, u8 *vbuf)
+static noinline_for_stack void
+tpg_fill_plane_pattern(const struct tpg_data *tpg, const struct tpg_draw_params *params,
+		       unsigned p, unsigned h, u8 *vbuf)
 {
 	unsigned twopixsize = params->twopixsize;
 	unsigned img_width = params->img_width;
-- 
2.39.5

