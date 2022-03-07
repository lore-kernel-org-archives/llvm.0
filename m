Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FDE3B53
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 15:53:40 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t11so24037827wrm.5
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 07:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VCMF7JOePAGAD2TRuJoonUYYB1mQc1S3qSAF6RtOJWY=;
        b=mqvy472H4fpcBOM1bST+j5DbuOBj4z4Zd8s+2YSbdcQo6ChrFa6JapwmdFDuwZtvnd
         IMXCTSOD3UH8W3dh4affMWFJeG9t7zLBnzCseOxGwss+RhRaTMPJi9+Gh/LG+7NLJGwz
         09JtCCYz55HcoePAc8CIjItO5FFk01yWi1dhcVUJ6AVHygAdvQvYB4p1ugGTP4w3MwTb
         uaIOxR6/gl74GqxZlO3G2wzbCZNNDD641IE/0tc61jLvsgDmPQ3grbRpXBOgemIw45iZ
         p7rSjpQctaEvD9aDhcAvIOZS6aSSsxsjQcgomCvaIa8xTfhX6dc2wsFEEMmI+tYTrjEf
         r31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VCMF7JOePAGAD2TRuJoonUYYB1mQc1S3qSAF6RtOJWY=;
        b=VRsNO+2rckSapqQ5dxYB3qh8eU8y6CGRLf1SjyvH2kAZqb/kUlHBxkhveHrBkPFVQ2
         1KjLwdxl3e0PDBPk4o7383Sc/I+hMPx7+IMfRLfOEOWfWSXWinJQSUrzb+TncJH105vu
         eT+8h18pAH/z56OfE/X7vozcfo6H4oKWO/h81JSA79p4MYUN8kjBcmPQZd7x5kZu22Iy
         Z7RjfAMVoDO2TxAzbhjlYZqfl5ZtGW0ekTz9Mx596CNV74N+JmXFI7P9Oq2EggPbBW2X
         vHMPi15sU80rb2gVA83eN0FXy9FJCYsgLbhyF0Qkou36f1mqMdyqa2cf2n6gdmtqGBsV
         0b6A==
X-Gm-Message-State: AOAM531cgpskXkphY4RwU+vjEGhcnrNLFGmypy0haRfEQHUEZFu/ZxrR
	IKxU7vu5v77OEn9abyY6D4M=
X-Google-Smtp-Source: ABdhPJx9tp6UqpNijYut2CQMscnG37GHYd0RtPgRD/hiGSg3Txqamr2jn3+qrxh5a0lI0idxw+ZDGg==
X-Received: by 2002:a5d:6a47:0:b0:1f1:e562:bef9 with SMTP id t7-20020a5d6a47000000b001f1e562bef9mr7183983wrw.445.1646668419347;
        Mon, 07 Mar 2022 07:53:39 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id g17-20020adff411000000b001f03426827csm11727167wro.71.2022.03.07.07.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 07:53:39 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] Bluetooth: mgmt: remove redundant assignment to variable cur_len
Date: Mon,  7 Mar 2022 15:53:38 +0000
Message-Id: <20220307155338.140860-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable cur_len is being ininitialized with a value in the start of
a for-loop but this is never read, it is being re-assigned a new value
on the first statement in the for-loop.  The initialization is redundant
and can be removed.

Cleans up clang scan build warning:
net/bluetooth/mgmt.c:7958:14: warning: Although the value stored to 'cur_len'
is used in the enclosing expression, the value is never actually read
from 'cur_len' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 net/bluetooth/mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 8101a6a31841..e0137bc1080e 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -7955,7 +7955,7 @@ static bool tlv_data_is_valid(struct hci_dev *hdev, u32 adv_flags, u8 *data,
 		return false;
 
 	/* Make sure that the data is correctly formatted. */
-	for (i = 0, cur_len = 0; i < len; i += (cur_len + 1)) {
+	for (i = 0; i < len; i += (cur_len + 1)) {
 		cur_len = data[i];
 
 		if (!cur_len)
-- 
2.35.1

