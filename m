Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CFF7A
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 11:38:40 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id p10so18480863lfa.12
        for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Ev9c+aQfJ7ziXboVPkC046QKOXTPSKhl1eNr/1ea/k=;
        b=q1R7jkimPBYNFPNI2CYFzTvfKXY046g833+P7K0KaIwCsJoTR9y46F/3Ul1+YtqavO
         GoyjUmrSKh44/tRcPs9iUobc4Ydbnyb9V2TQU8pZQxFIQ2XyhElzpw7uGpVNR3DXRQzY
         m9n0Kq60W8He9V3HhmqSZUKFVgt4mySs1DtLF/D+MPDap8dbVt8Gti7t2NwE507r5mXZ
         3clLM6NKJMc+Zd9+kfdrgLjJRExHozEtwhC/M74SmSKnWQ1AtLne4YIFJVcgjubWa2bO
         2Tusb6XXYbMDegSudmDHkjoLVX2FHAaH5iZSSMOnWTye6cIqQhgsH+74vMD2QrnoOYst
         O1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Ev9c+aQfJ7ziXboVPkC046QKOXTPSKhl1eNr/1ea/k=;
        b=uPiDfatAikfy+gBWQgwxftvmctKbYQl6YyHWmMETrlddtsK7WuzK2hJJPIogg7U3+Y
         eh4FM4H1dErp8XgR77yIt/At66vvrWDvH3QuHS02guWxR59Nct1xxSg9t90WZ0ZqvCF8
         FoAhpQFk8SnMuDWuZlp9IIU8o8hQ97JwXHJhh1UpaFvkEGtaNDnXNJUbCSp7Vs0vnl5v
         J3uzJtDBxz28z5OH+b1kMYR1h57SdZNx8/NEfN4T5oYnNCdx6FU6+l9x1cSAMCKiUjwY
         LgyiSd4eN2lJ6ZX/1hJqOLg8cqG5g0Hsz5gowWBxgHT1Vb5IHIdH1/Ts18I7Acesu1Kr
         I0sA==
X-Gm-Message-State: AOAM533vC9BlLlzC3C0dmoSU2UUaYqN/9oiEwUVP7fLJcu925LlihK9y
	9lWwDtYtRJZtfgRyYYGGKl0=
X-Google-Smtp-Source: ABdhPJyB4OUxiICa7Qfg6q4ykypeL5HiK8Dtl8PVPKWvzS3a3V+PKR8t0PBmguoJ7Og7goWDJ6G2Dg==
X-Received: by 2002:a05:6512:1093:b0:471:953c:6ffa with SMTP id j19-20020a056512109300b00471953c6ffamr6378337lfg.618.1650713918816;
        Sat, 23 Apr 2022 04:38:38 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id g17-20020a2e9cd1000000b0024db538c2absm526411ljj.7.2022.04.23.04.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 04:38:38 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH RESEND v2 4/5] block/partitions/atari: Remove redundant assignment
Date: Sat, 23 Apr 2022 13:38:10 +0200
Message-Id: <20220423113811.13335-4-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220423113811.13335-1-michalorzel.eng@gmail.com>
References: <20220423113811.13335-1-michalorzel.eng@gmail.com>
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

