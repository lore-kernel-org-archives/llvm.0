Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16736168
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 00:05:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s1so1413543wra.6
        for <llvm@lists.linux.dev>; Wed, 05 Jan 2022 16:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FnzkRWLzepXxAMjNVjPvfR47H7qbw8DB459JXttSo+A=;
        b=CJJfnt7VeK3fYXD3SpfRjfSmqXHgP6N1vPY8mD2BxMo+pvMF9qQGOOg/dY5ymD6xda
         WoG3d5YWo4kXAWPdBFVWLPHyeCL/oLzjH+PvIQlb3tZgOaqJ1/zcdPdVQ4Ctwhsbee06
         Wma1Fp32WTFooABjENT+3vNnoYoprisJ/gWxTMHINOaFGOUNhhtxUs9LqVranj35b1ki
         Rm2dzjq2kGnRmcFaLtOlkAi6GUkMxE3jEmyNH4Hgsob2gJe922VFqFSG1iJO9LvSuzBm
         XXgjH1u0/9j/VvWUWlJAD5Vm4xN583dAcDbbjq4ckR0kmnegqQ1IaVYOFUXbcdASrfw4
         f7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FnzkRWLzepXxAMjNVjPvfR47H7qbw8DB459JXttSo+A=;
        b=Y+ltkNSH2sU1jmDzNBq61C5A4bXR+Ic6AefRXUPTz0o3QmiBOf8OR80o2jTJUTGske
         coyOkNR7NY0ypWATEuo2mh/yeUrb9ZFCmMniIECnvETCxOego0IacSjxOAi2ZZRsA83a
         OrT0JpXBFd+kFwt1/5GVTeo4Vs5VW/jzPylNvbNdcn1Bjm6b/D9y34/qEqB19dZ9U2NC
         ufcOWYh+IurIa2SO8cpeaQ2jQqp8SeHKofeqLUc7iQRP+cY089+Vs7ix00uU1EXNSFYq
         PdeX0MZMiOXZyt9xYbMsmsL51OGiKH/xQbF0SxKi1U8DhC1mGxpfafn9dDT5V7/3/QlV
         XM7A==
X-Gm-Message-State: AOAM532IC4eyEX13UcbsXdsoa/x0p4l0JDpfjwqWkjUNcDBejR1czVa7
	07UhFWfI0MLjMlKotYMl1Ao=
X-Google-Smtp-Source: ABdhPJwro27l6KBxlFDbtFIo70Bq9eBSR2wpwEGNQmMlA3WxGM2eaUM5zUlezl6osUooqtBVyRRDHw==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr50424122wri.541.1641427530374;
        Wed, 05 Jan 2022 16:05:30 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id ba18sm412779wrb.40.2022.01.05.16.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 16:05:29 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Steve French <sfrench@samba.org>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH][next] cifs: remove unused variable ses_selected
Date: Thu,  6 Jan 2022 00:05:28 +0000
Message-Id: <20220106000528.1104337-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable ses_selected is being assigned values but it is never
being used. The variable is redundant and can be removed.

Cleans up clang scan build warning:
fs/cifs/smb2pdu.c:3810:19: warning: Although the value stored
to 'ses_selected' is used in the enclosing expression, the value is
never actually read from 'ses_selected' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/cifs/smb2pdu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 19c54b309e39..9a72c22bb189 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -3790,7 +3790,7 @@ void smb2_reconnect_server(struct work_struct *work)
 	struct cifs_tcon *tcon, *tcon2;
 	struct list_head tmp_list, tmp_ses_list;
 	bool tcon_exist = false, ses_exist = false;
-	bool tcon_selected = false, ses_selected = false;
+	bool tcon_selected = false;
 	int rc;
 	bool resched = false;
 
@@ -3807,7 +3807,7 @@ void smb2_reconnect_server(struct work_struct *work)
 	spin_lock(&cifs_tcp_ses_lock);
 	list_for_each_entry(ses, &pserver->smb_ses_list, smb_ses_list) {
 
-		tcon_selected = ses_selected = false;
+		tcon_selected = false;
 
 		list_for_each_entry(tcon, &ses->tcon_list, tcon_list) {
 			if (tcon->need_reconnect || tcon->need_reopen_files) {
@@ -3833,7 +3833,7 @@ void smb2_reconnect_server(struct work_struct *work)
 		spin_lock(&ses->chan_lock);
 		if (!tcon_selected && cifs_chan_needs_reconnect(ses, server)) {
 			list_add_tail(&ses->rlist, &tmp_ses_list);
-			ses_selected = ses_exist = true;
+			ses_exist = true;
 			ses->ses_count++;
 		}
 		spin_unlock(&ses->chan_lock);
-- 
2.33.1

