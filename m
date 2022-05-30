Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4EB2F38
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 13:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D36C36AE9;
	Mon, 30 May 2022 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917867;
	bh=CEB7zLhOIcLwSOQl4CUWTYbGqt5Qvom65s0Ym0hUi8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iXWV4B2W3zkXEdSKhPQyb63ZNdvU+panq4YymTnXXmZ5b7ZwMdaxfWArslA+ELbKS
	 qlXndvr5HgVS7GiWeWnRkQUgQ0ZEso895SXZYTNnXvPA0ToseB9PdGCXzvJBnY+TxU
	 u82p3W/FC0xtOjD7zSiZk9N5BZLuYB2rALAUg/XulT8D9KBNuKizCb+iRyLpTkRTf5
	 WGYU+1neUjatMZTSVBWTGOcg5KvvPVL5F6QkMJ4itcDrR924zqBKSxiDCAHsDSoxMI
	 l11dG5/h3cjpi2bdlxgWGdQDtMJ8vhWqruvxJldKC9az301Ej8orVoACO8j48JcZwE
	 /Jh+5BMiNk42w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	wg@grandegger.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ndesaulniers@google.com,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.17 122/135] can: mcp251xfd: silence clang's -Wunaligned-access warning
Date: Mon, 30 May 2022 09:31:20 -0400
Message-Id: <20220530133133.1931716-122-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

[ Upstream commit 1a6dd9996699889313327be03981716a8337656b ]

clang emits a -Wunaligned-access warning on union
mcp251xfd_tx_ojb_load_buf.

The reason is that field hw_tx_obj (not declared as packed) is being
packed right after a 16 bits field inside a packed struct:

| union mcp251xfd_tx_obj_load_buf {
| 	struct __packed {
| 		struct mcp251xfd_buf_cmd cmd;
| 		  /* ^ 16 bits fields */
| 		struct mcp251xfd_hw_tx_obj_raw hw_tx_obj;
| 		  /* ^ not declared as packed */
| 	} nocrc;
| 	struct __packed {
| 		struct mcp251xfd_buf_cmd_crc cmd;
| 		struct mcp251xfd_hw_tx_obj_raw hw_tx_obj;
| 		__be16 crc;
| 	} crc;
| } ____cacheline_aligned;

Starting from LLVM 14, having an unpacked struct nested in a packed
struct triggers a warning. c.f. [1].

This is a false positive because the field is always being accessed
with the relevant put_unaligned_*() function. Adding __packed to the
structure declaration silences the warning.

[1] https://github.com/llvm/llvm-project/issues/55520

Link: https://lore.kernel.org/all/20220518114357.55452-1-mailhol.vincent@wanadoo.fr
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd.h b/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
index f551c900803e..aed6e9d47517 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
@@ -434,7 +434,7 @@ struct mcp251xfd_hw_tef_obj {
 /* The tx_obj_raw version is used in spi async, i.e. without
  * regmap. We have to take care of endianness ourselves.
  */
-struct mcp251xfd_hw_tx_obj_raw {
+struct __packed mcp251xfd_hw_tx_obj_raw {
 	__le32 id;
 	__le32 flags;
 	u8 data[sizeof_field(struct canfd_frame, data)];
-- 
2.35.1

