Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E546BB
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 11:44:52 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id r71so1946649pgr.0
        for <llvm@lists.linux.dev>; Wed, 18 May 2022 04:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e46I4qIXdzquI9xFD+cV1ACVVNgw+INdEKQ9QEnr4OI=;
        b=Nh0/Gtjh+a2IoDWF2IsH6LjJsbfFa2ls+RGo/YWXGFgUkeucd2niQ5WCVQPYpf7y/U
         Cmx7pTzDQ9PP7tNRsnHmU/9qAi3OmK/wmyx0mwTd43+fQjvAPKpQvyRobrqOUIpfYS0F
         BG2A7C0p12X4zCfzNvUX5A+eLouTQSkWu6dcUMwnQ2ue1CqLrYL2cG3libYJjprTw7Y1
         YW1N3/mdmXaPY+HtNABFX05KqegIBIotIqJyW45Y/6gv7g3Oi/bfNhZpark+UsHId/tA
         A5xAUzQaT2R2SzuL34L0HlW73CMoooDFXUTKbqr8g4DPAY7oQY8GzPPfXhe2JfYajuaH
         fytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=e46I4qIXdzquI9xFD+cV1ACVVNgw+INdEKQ9QEnr4OI=;
        b=xOBAyX1QVHt894/mboJxyZPWl4XdHqKYF7kzSg1SHnY8/XR9GhZM5mU3r9riYtiEXu
         8wmOUVgM4GMOXilVolcwyE190Hp1ICO/Hhtz9IE8QyR9oIqYN4dBf/CNTRAhwN4DfsOa
         jKbvKS+XkK21NFKpDgHiB8yLljKdJC3xOnTxuyfMi9FpbVYU/6vxXLLok+YI2Jrt4iqJ
         TmqxIJyMQkgXxKhllIISKkpN4Kiu29vwEVl2w8vjZ24JhmiBdfmrr1Fokp8+orL35XjG
         hOTHd9apEZDBhuqHxpXEBVJpAHvg/pO8QGU0mEN5oxli12maofL4Nv/ZeDulOO+pB8XO
         Xkkg==
X-Gm-Message-State: AOAM533l9yVCd7phe84RC8EROKWaONOG4g6uB3OZFd4nXBdXsE+5hZC1
	gzHKBpN1a3FJb3RiZjQJs0A=
X-Google-Smtp-Source: ABdhPJzYBLHwICpNdU1uIc/fY0ueEsP71iwvxE76n7L9d8J1eiIBw//HBvohkbNgfUiutXbkZMTFNA==
X-Received: by 2002:a05:6a00:14cf:b0:510:5549:ad8a with SMTP id w15-20020a056a0014cf00b005105549ad8amr27233402pfu.24.1652874291646;
        Wed, 18 May 2022 04:44:51 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id 23-20020a631557000000b003db8691008esm1332158pgv.12.2022.05.18.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 04:44:51 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH] can: mcp251xfd: silence clang's -Wunaligned-access warning
Date: Wed, 18 May 2022 20:43:57 +0900
Message-Id: <20220518114357.55452-1-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518070517.q53bjzo6lbnq3f2i@pengutronix.de>
References: <20220518070517.q53bjzo6lbnq3f2i@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Actually, I do not have llvm 14 installed so I am not able to test
(this check was introduced in v14). But as explained in [1], adding
__packed should fix the warning.

Because this is a false positive, I did not add a Fixes tag, nor a
Reported-by: kernel test robot.
---
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd.h b/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
index 1d43bccc29bf..2b0309fedfac 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd.h
@@ -441,7 +441,7 @@ struct mcp251xfd_hw_tef_obj {
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

