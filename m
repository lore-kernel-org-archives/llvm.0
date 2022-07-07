Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F322CA5
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 22:15:18 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id k13-20020a25240d000000b0066e32c61c25so10178643ybk.3
        for <llvm@lists.linux.dev>; Thu, 07 Jul 2022 15:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=FgNJR3N4HuEzik8BFbsoxsCKMlA6Q79TXfo2nVTvHXw=;
        b=aA00TODOScLx5rfKCpO+pAVqEX73pui8cCx+3XpnCCyru+fT+ofb/Ab2TS9xNDNU99
         YNKaOBTsA7ff9EZZ8xUcR6VLuO3JXPvfBsrunTIT2rDulAbfyKZPIfD0jv7m8Tno8JXY
         +T82Ab/D0pYfuaUmvFtngjFXFFMc5T/BVO6ypDoulJZ75kMRvYHKQB86864y10eH2uEw
         4d3PUryKB7/phRYE0n7zvCY/JzTFCQSei9cMSVgBAyjxLTch+vrSPufB05tcgg9vjG2i
         vuM1YjWMW1zfvqSXyEnoZLyTtO/m+9YJbYPez+Izg4VE+po1sFIWI3ZbN2N7STiUOkcA
         SUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=FgNJR3N4HuEzik8BFbsoxsCKMlA6Q79TXfo2nVTvHXw=;
        b=27k8qVRJYcE7SP9dlxZsNRb5GwuixpetxeC6BZaW8fTP2r/Wkxe5ffro4rOclaCVPl
         IBgM8aTmKwPFLWsrxJBTV2aqGiws6cT5zPJPcu0tKVsoU1tJbyVDU4/9OR5HlLklyVkQ
         Vv8IrwBTO9VMwbKJXRzq9iRgekWRLSqxDRlMn3yMUQlWRV3HVc385eWtykIuIhYBxfbh
         K37s+qyQvjSd73bW2CycLF7g/tCwk48rHt6c3d7rHdINXTZ6b4laLqhENaZshNeWw0aj
         2hKdwQVfDLegE8XHqSOFqpPXj+QWbvidfYf1VViV4GKpyY5vR2ho2rxyRdj0y2RINeS2
         7yxw==
X-Gm-Message-State: AJIora/yzAxIXKIgmTefBIzO/IHTrdzagrtmAFJu/b1e1s9H/gOcFfDY
	/oKv2tU0g14AixPHybE7n1Qi06IBMeHf3lu0mg==
X-Google-Smtp-Source: AGRyM1vsybvdyGETyP8/pCMszh/hivglrkQc+shq/bl09u6ogz5eozWp/OTQeXLsPPeDx31CWy9PP42+u4bdaUY5Ow==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:4640:519a:f833:9a5])
 (user=justinstitt job=sendgmr) by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP
 id 195-20020a8101cc000000b00317a0fa7a61mr516504ywb.10.1657232117460; Thu, 07
 Jul 2022 15:15:17 -0700 (PDT)
Date: Thu,  7 Jul 2022 15:14:56 -0700
Message-Id: <20220707221456.1782048-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH] l2tp: l2tp_debugfs: fix Clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Tom Parkin <tparkin@katalix.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter the following warnings:
| net/l2tp/l2tp_debugfs.c:187:40: error: format specifies type 'unsigned
| short' but the argument has type 'u32' (aka 'unsigned int')
| [-Werror,-Wformat] seq_printf(m, "   nr %hu, ns %hu\n", session->nr,
| session->ns);
-
| net/l2tp/l2tp_debugfs.c:196:32: error: format specifies type 'unsigned
| short' but the argument has type 'int' [-Werror,-Wformat]
| session->l2specific_type, l2tp_get_l2specific_len(session));
-
| net/l2tp/l2tp_debugfs.c:219:6: error: format specifies type 'unsigned
| short' but the argument has type 'u32' (aka 'unsigned int')
| [-Werror,-Wformat] session->nr, session->ns,

Both session->nr and ->nc are of type `u32`. The currently used format
specifier is `%hu` which describes a `u16`. My proposed fix is to listen
to Clang and use the correct format specifier `%u`.

For the warning at line 196, l2tp_get_l2specific_len() returns an int
and should therefore be using the `%d` format specifier.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Related l2tp -Wformat patch:
https://lore.kernel.org/all/20220706230833.535238-1-justinstitt@google.com/

 net/l2tp/l2tp_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/l2tp/l2tp_debugfs.c b/net/l2tp/l2tp_debugfs.c
index 9d1aafe75f92..4595b56d175d 100644
--- a/net/l2tp/l2tp_debugfs.c
+++ b/net/l2tp/l2tp_debugfs.c
@@ -184,7 +184,7 @@ static void l2tp_dfs_seq_session_show(struct seq_file *m, void *v)
 		   session->pwtype == L2TP_PWTYPE_PPP ? "PPP" :
 		   "");
 	if (session->send_seq || session->recv_seq)
-		seq_printf(m, "   nr %hu, ns %hu\n", session->nr, session->ns);
+		seq_printf(m, "   nr %u, ns %u\n", session->nr, session->ns);
 	seq_printf(m, "   refcnt %d\n", refcount_read(&session->ref_count));
 	seq_printf(m, "   config 0/0/%c/%c/-/%s %08x %u\n",
 		   session->recv_seq ? 'R' : '-',
@@ -192,7 +192,7 @@ static void l2tp_dfs_seq_session_show(struct seq_file *m, void *v)
 		   session->lns_mode ? "LNS" : "LAC",
 		   0,
 		   jiffies_to_msecs(session->reorder_timeout));
-	seq_printf(m, "   offset 0 l2specific %hu/%hu\n",
+	seq_printf(m, "   offset 0 l2specific %hu/%d\n",
 		   session->l2specific_type, l2tp_get_l2specific_len(session));
 	if (session->cookie_len) {
 		seq_printf(m, "   cookie %02x%02x%02x%02x",
@@ -215,7 +215,7 @@ static void l2tp_dfs_seq_session_show(struct seq_file *m, void *v)
 		seq_puts(m, "\n");
 	}
 
-	seq_printf(m, "   %hu/%hu tx %ld/%ld/%ld rx %ld/%ld/%ld\n",
+	seq_printf(m, "   %u/%u tx %ld/%ld/%ld rx %ld/%ld/%ld\n",
 		   session->nr, session->ns,
 		   atomic_long_read(&session->stats.tx_packets),
 		   atomic_long_read(&session->stats.tx_bytes),
-- 
2.37.0.rc0.161.g10f37bed90-goog

