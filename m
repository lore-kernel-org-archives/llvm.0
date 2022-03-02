Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E233FE3
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 17:07:31 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id p9so3778806wra.12
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 09:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+FBEODWlEwE4ZBpRu4pszv+L75J4ftu6Yw0by+ZcvnE=;
        b=hOrlpj9wIqQtiZ2iI5gabtXozHts++6EWfoyBCd9XE7smYEqH0D0OVdiWv1pcyWOmv
         drF40iR0EnF9vCeXmIYqfPop33M7aHpNtmCzSt5le3/11zOqSeexGyBz8MgQ4WEPa5oI
         IAkV+2cfB3IjRsBMxueIpgamXDtArN4GOSuNjFxfLz7eFSSMx7HDIJrnb/ZruGVPRQqm
         JuXSGImYl/NJQlq9JmPQ6uAcc6mnjQS0l7Y1oTTVRL9RQWBTmnnBopCO4aH4quRq43/G
         dc2kmxA0iGAwtQmMN6z3smEFOwKvl/1qLFFuPzojfYWvmcG8HPgoK2q2CCBdNQ2VmTBc
         0fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+FBEODWlEwE4ZBpRu4pszv+L75J4ftu6Yw0by+ZcvnE=;
        b=HN0If/VG0rQ6gVbSNwmTA7r2+5j1jKAjaaeQCWeYV9n95Fk/+WRILs+DgyAYSsRIbx
         cyWH0N3ozGRHBlfZJmyf7E7dCeF2K5Pqw09x4ZFf6GyLpwl98+64CHGihEC7bE6pv56U
         jO4+u2mZms//hKDsyQKMc1+l8bvf3grc+O9o2sNWHuI9TwZOb3SjCDziD3bhieYVDLWK
         t2wQRhFJ55frrRbNCjkZE+YkNc7+iNiC0u4pgUjKxIhZvOwqXfCte3ZkOziubxkH3/Ed
         UN5/GVcstizZA7WFu2GWfiHfZNhS7HGjwMqT/JRWcsLnO6fVdI74+skbLEdjYXr+B5ya
         f1bQ==
X-Gm-Message-State: AOAM533LYlRj+6QMVqrbv+fOIc39snHxGQequSyZZvXcdVcXEeHN7mAH
	TIOSkbgPlPfyr/6L4CL7mmo=
X-Google-Smtp-Source: ABdhPJyDPnbwGRm/gHFADgHnG9mY1P7DvsXiSdJn8zqflakPBj5aWX46fD1EGCCM5wnDqY8YQSkV6A==
X-Received: by 2002:adf:f201:0:b0:1ed:c254:c1a2 with SMTP id p1-20020adff201000000b001edc254c1a2mr23485713wro.106.1646240849938;
        Wed, 02 Mar 2022 09:07:29 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c4f0f00b0037d62a899b1sm6651200wmq.6.2022.03.02.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 09:07:29 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ALSA: echoaudio: remove redundant assignment to variable bytes
Date: Wed,  2 Mar 2022 17:07:28 +0000
Message-Id: <20220302170728.1094633-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable bytes is being assigned a value that is never read, it
is being re-assigned inside a following if block. The assignment is
redundant and can be removed.

Cleans up clang scan build warning:
sound/pci/echoaudio/midi.c:211:9: warning: Although the value stored
to 'bytes' is used in the enclosing expression, the value is never
actually read from 'bytes' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/pci/echoaudio/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/midi.c b/sound/pci/echoaudio/midi.c
index cb72d27e809e..7be5c3327b16 100644
--- a/sound/pci/echoaudio/midi.c
+++ b/sound/pci/echoaudio/midi.c
@@ -208,7 +208,7 @@ static void snd_echo_midi_output_write(struct timer_list *t)
 
 	/* No interrupts are involved: we have to check at regular intervals
 	if the card's output buffer has room for new data. */
-	sent = bytes = 0;
+	sent = 0;
 	spin_lock_irqsave(&chip->lock, flags);
 	chip->midi_full = 0;
 	if (!snd_rawmidi_transmit_empty(chip->midi_out)) {
-- 
2.34.1

