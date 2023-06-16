Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B21D30F
	for <llvm@lists.linux.dev>; Fri, 16 Jun 2023 09:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A29AC433C8;
	Fri, 16 Jun 2023 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686906284;
	bh=ZIfwN7dOKIbw077DPRJk3QvTD8i+PX9joN3XwIVd+S4=;
	h=From:To:Cc:Subject:Date:From;
	b=niagvxX+xZgRBkm7C+5UOsMAzDVNBPf2P6YfN8GJVEbuR9LLPyGBI1Ze0/8OkqPHH
	 5Eo2SLeUs+boCURI5yINU2SZdHjASmTKRE31nhPUCf+oBHbPwXolxGkpJN/G18WPf2
	 xr1sBtcTkFPgWblY+xRVvXHqtp5tTvd2TwjcfttzxQyJ6cy5Aqrnh67dgzVNIsL3ap
	 0Uq4gXNrl1nl/qT2KOwe6MPKv+la4iwplFfir2ZoySdn/VixobzkILcvyaUTP07W0B
	 nk4IikvGP5tH+pN+9Ee8QV7KEAoax2XB3PHXluqu/s675J2Rjfs7e1idrGFcLJbXWa
	 gKas7TYDSeE0g==
From: Arnd Bergmann <arnd@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ath10k: improve structure padding
Date: Fri, 16 Jun 2023 11:04:21 +0200
Message-Id: <20230616090439.2484857-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Including an aligned structure inside of a packed one is ambiguous
and can lead to misaligned data, as pointed out by this clang warning:

drivers/net/wireless/ath/ath10k/htt.h:715:34: error: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
        struct htt_rx_indication_prefix prefix;
                                        ^
drivers/net/wireless/ath/ath10k/htt.h:736:34: error: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
        struct htt_rx_indication_prefix prefix;
                                        ^
drivers/net/wireless/ath/ath10k/htt.h:1564:2: error: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1564:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
        union {
        ^
drivers/net/wireless/ath/ath10k/htt.h:1702:2: error: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1702:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]

These structures appear to actually need the packing since they
are embedded at misaligned offsets. Add even more such annotations
here to enforce bytewise access throughout the driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/htt.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index c051a22fce145..e0c9f45e74761 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -707,7 +707,7 @@ struct htt_rx_indication_prefix {
 	__le16 fw_rx_desc_bytes;
 	u8 pad0;
 	u8 pad1;
-};
+} __packed;
 
 struct htt_rx_indication {
 	struct htt_rx_indication_hdr hdr;
@@ -1565,7 +1565,7 @@ struct htt_tx_fetch_ind {
 		/* ath10k_htt_get_tx_fetch_ind_resp_ids() */
 		DECLARE_FLEX_ARRAY(__le32, resp_ids);
 		DECLARE_FLEX_ARRAY(struct htt_tx_fetch_record, records);
-	};
+	} __packed;
 } __packed;
 
 static inline void *
@@ -1723,7 +1723,7 @@ struct htt_resp {
 		struct htt_tx_mode_switch_ind tx_mode_switch_ind;
 		struct htt_channel_change chan_change;
 		struct htt_peer_tx_stats peer_tx_stats;
-	};
+	} __packed;
 } __packed;
 
 /*** host side structures follow ***/
-- 
2.39.2

