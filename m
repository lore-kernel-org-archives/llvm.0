Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3B1FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:17:19 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id u19so15317376ljd.11
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0tAAZ8nWND6iWQe5ckcG8uvHfods3CtU4lwfTyOmYaI=;
        b=P+jLBKX0lpPGEJDenTcQ8nNR+S8cat/m2iEWf1NP4gAjPnwzidmQpPgPHBcCc4kKe2
         w/uuwItrGWEfPC+Eea2i1u2p0oYg+7WXUtAkc8pr59ThryB46qQTbKRrt2qWHAZ6p8R2
         wBjR0NBO1MiBXJXzBITpSe2d5KIn+aZ1b0IWOLMqzhIgeNJwExfCz15XJ6Su3WVvNkfq
         GNpLNbHcfJtY/6g2zMraF7OGNH1qoIFt+UqRhPjO/22lD95420U7AdFBqX4QXfbaoo7h
         QIM1C8ky5Tu2axePg360V/K69JACeM9D+OD7zXIDllY41OYLRBYyFrpaQihW+es9bGar
         NgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0tAAZ8nWND6iWQe5ckcG8uvHfods3CtU4lwfTyOmYaI=;
        b=PUjqucMsM727k4NypoX9twtDiSNmpg6ZN4rVo4yRzPz7UEMA5OuIQ48N6Sl0kFYpO7
         UWPpfjs0c5Fs1OUbR1OgqoaXzk1U2oVlewePeHE0QXc0jQwjqyAm74cEw+f6EjPHiNLh
         bugQwsC4iCWSlk0FM+vNWGs7bxv9Grj+9Jr59NEaBfMhOZoMVkBfHUgabWn7mcwS568B
         17BoL5ya1Bzxj5IT37+S5gt4VocQj86wympBFkjzavxkIMokr6AiwvweKPy9XW/i19fH
         JAtyVva3yBOZu/SE+FUOFHlGNBPmiVw6tKiyqLuifNvjc8noLo9OOm3/n5l+7ddCikoR
         3uXA==
X-Gm-Message-State: AOAM533rX4+6nwQ81eiLmzhpItOOx/LyCJsVRntisDzXlaKavSYEzl7X
	iu/kgIgG3jQHqpDUUJpOVso=
X-Google-Smtp-Source: ABdhPJwgTaQRDKsBOqNhTp5LfrDR6NAQoC+bYFVClkNqwTwLa6OF3EsvEX3doFC23IUc4gZlPWIIFA==
X-Received: by 2002:a2e:8094:0:b0:24b:5f25:8bda with SMTP id i20-20020a2e8094000000b0024b5f258bdamr8792373ljg.122.1649783837515;
        Tue, 12 Apr 2022 10:17:17 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id m2-20020a05651202e200b0046ba665cd6dsm723928lfq.141.2022.04.12.10.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:17:17 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 4/5] block/partitions/atari: Remove redundant assignment
Date: Tue, 12 Apr 2022 19:16:50 +0200
Message-Id: <20220412171651.19812-4-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412171651.19812-1-michalorzel.eng@gmail.com>
References: <20220412171651.19812-1-michalorzel.eng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignment to a variable part_fmt from function
atari_partition. It is being assigned a value that is never read until
the end of function.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
Changes since v1:
-move the change into a separate patch
-add analysis
---
 block/partitions/atari.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/partitions/atari.c b/block/partitions/atari.c
index da5994175416..9655c728262a 100644
--- a/block/partitions/atari.c
+++ b/block/partitions/atari.c
@@ -140,7 +140,6 @@ int atari_partition(struct parsed_partitions *state)
 				/* accept only GEM,BGM,RAW,LNX,SWP partitions */
 				if (!((pi->flg & 1) && OK_id(pi->id)))
 					continue;
-				part_fmt = 2;
 				put_partition (state, slot,
 						be32_to_cpu(pi->st),
 						be32_to_cpu(pi->siz));
-- 
2.25.1

