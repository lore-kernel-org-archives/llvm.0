Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ABE10E6
	for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 01:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859A2C433EF;
	Tue, 20 Dec 2022 01:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671499330;
	bh=iZwilCZPwFxW4zw6txHPVtYalv07cIEoOcj980Lb6Wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XhT0oc7mW6YOA79ho94ibeOdebfc/uK6doSlfD84HXgK/e/rCjjsBq9JI8XQznFxJ
	 MpkYuDEYcwQ5RDnKF77xWpIWj9sJ443HiXlRjxJ82Hsjh5xEMLhEFpch5zDrjX9IEX
	 DgD4Fz3k/79Kk1silpU+EqekaIjKWuz2VhfnyfsrOf0HzXRg7z4OYyboTkGd/enxeW
	 MR6g43id23CSOiZm2IL07yk+vaV5AO9yHjS7ukKLg0T8M/YH8Bsohpgu/I3N1IB4jx
	 9S1FKeZvnvzmhXvNxlxdGUDajT5ZYv/kK1z+CN3bzaoxqmA7oXPIpDsToY384ArgUq
	 OzWqS3N2uqf9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	james.smart@broadcom.com,
	ram.vegesna@broadcom.com,
	jejb@linux.ibm.com,
	ndesaulniers@google.com,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 4/9] scsi: elx: libefc: Fix second parameter type in state callbacks
Date: Mon, 19 Dec 2022 20:21:54 -0500
Message-Id: <20221220012159.1222517-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220012159.1222517-1-sashal@kernel.org>
References: <20221220012159.1222517-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 3d75e766b58a7410d4e835c534e1b4664a8f62d0 ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function pointer
prototype to make sure the call target is valid to help mitigate ROP
attacks. If they are not identical, there is a failure at run time, which
manifests as either a kernel panic or thread getting killed. A proposed
warning in clang aims to catch these at compile time, which reveals:

  drivers/scsi/elx/libefc/efc_node.c:811:22: error: incompatible function pointer types assigning to 'void (*)(struct efc_sm_ctx *, u32, void *)' (aka 'void (*)(struct efc_sm_ctx *, unsigned int, void *)') from 'void (*)(struct efc_sm_ctx *, enum efc_sm_event, void *)' [-Werror,-Wincompatible-function-pointer-types-strict]
                  ctx->current_state = state;
                                    ^ ~~~~~
  drivers/scsi/elx/libefc/efc_node.c:878:21: error: incompatible function pointer types assigning to 'void (*)(struct efc_sm_ctx *, u32, void *)' (aka 'void (*)(struct efc_sm_ctx *, unsigned int, void *)') from 'void (*)(struct efc_sm_ctx *, enum efc_sm_event, void *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          node->nodedb_state = state;
                            ^ ~~~~~
  drivers/scsi/elx/libefc/efc_node.c:905:6: error: incompatible function pointer types assigning to 'void (*)(struct efc_sm_ctx *, enum efc_sm_event, void *)' from 'void (*)(struct efc_sm_ctx *, u32, void *)' (aka 'void (*)(struct efc_sm_ctx *, unsigned int, void *)') [-Werror,-Wincompatible-function-pointer-types-strict]
                  pf = node->nodedb_state;
                    ^ ~~~~~~~~~~~~~~~~~~

  drivers/scsi/elx/libefc/efc_device.c:455:22: error: incompatible function pointer types assigning to 'void (*)(struct efc_sm_ctx *, u32, void *)' (aka 'void (*)(struct efc_sm_ctx *, unsigned int, void *)') from 'void (struct efc_sm_ctx *, enum efc_sm_event, void *)' [-Werror,-Wincompatible-function-pointer-types-strict]
                  node->nodedb_state = __efc_d_init;
                                    ^ ~~~~~~~~~~~~

  drivers/scsi/elx/libefc/efc_sm.c:41:22: error: incompatible function pointer types assigning to 'void (*)(struct efc_sm_ctx *, u32, void *)' (aka 'void (*)(struct efc_sm_ctx *, unsigned int, void *)') from 'void (*)(struct efc_sm_ctx *, enum efc_sm_event, void *)' [-Werror,-Wincompatible-function-pointer-types-strict]
                  ctx->current_state = state;
                                    ^ ~~~~~

The type of the second parameter in the prototypes of ->current_state() and
->nodedb_state() ('u32') does not match the implementations, which have a
second parameter type of 'enum efc_sm_event'. Update the prototypes to have
the correct second parameter type, clearing up all the warnings and CFI
failures.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20221102161906.2781508-1-nathan@kernel.org
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/elx/libefc/efclib.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/elx/libefc/efclib.h b/drivers/scsi/elx/libefc/efclib.h
index ee291cabf7e0..b14e516be7d5 100644
--- a/drivers/scsi/elx/libefc/efclib.h
+++ b/drivers/scsi/elx/libefc/efclib.h
@@ -58,10 +58,12 @@ enum efc_node_send_ls_acc {
 #define EFC_LINK_STATUS_UP		0
 #define EFC_LINK_STATUS_DOWN		1
 
+enum efc_sm_event;
+
 /* State machine context header  */
 struct efc_sm_ctx {
 	void (*current_state)(struct efc_sm_ctx *ctx,
-			      u32 evt, void *arg);
+			      enum efc_sm_event evt, void *arg);
 
 	const char	*description;
 	void		*app;
@@ -364,7 +366,7 @@ struct efc_node {
 	int			prev_evt;
 
 	void (*nodedb_state)(struct efc_sm_ctx *ctx,
-			     u32 evt, void *arg);
+			     enum efc_sm_event evt, void *arg);
 	struct timer_list	gidpt_delay_timer;
 	u64			time_last_gidpt_msec;
 
-- 
2.35.1

