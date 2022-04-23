Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6957A
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 11:38:33 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id v4so338349ljd.10
        for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 04:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nSOBiYrJmNaRQKYvQ7ACT7tJByUwQn0t0NjQZI493e4=;
        b=pqQDbw4RNWGcL08nmRqyvsk7VcZjZULEDn/DTHgGlSFCPd6rXe5laDjJpufm96j0Ns
         DLjKk4lBqxrzba7tl0m8WAB/iH7q0ypWZaqja4O6LXnx4GOuJaxWiyoKM4LQ/4pbOYJp
         V0toXlRCeB00f6oQ9J/OsbDeNSWYRmMfAaFySoA28A+B5PKmykTLMf+Q4vvrFJcxov0L
         veyLID366e70c/5NFbkkR6oHwTQ5F4gqmvWLOOQQ5NnzGLHWuMPu5qdi6AOiecpPvaxn
         eju9iPoH3jpmYxXiIlitaLqLCg3JU/pQNw9xHmwKFQOFJatB8MM8EPDxbydFSxkQZkY7
         nlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nSOBiYrJmNaRQKYvQ7ACT7tJByUwQn0t0NjQZI493e4=;
        b=4BVmCbe9S8caYd+zBxO2uaJMa0gOPI1GiuxhYhX5Ak7nvawxwECeRRdeWUZ4n3jIy1
         /wgnfJ5F5/FPLPAaUXCnTDVqTM8kCsCvPEOCmgWhfHFgjVNbDK0srHUUogVATJa3r8Iu
         QrBlCkCT0l1jPZLPeLA3BY1LsYHK4g10WgW/8TiOHEI5Jy051h43Yw55odpi98c3qSx8
         e0/9bWX9JiNzP3SG2Hr2YFg8oXRbNy+mHnGNSKZuLEN8rj1C62m0mX3iUUtcQwMTqFv5
         xFkR9NL+XE60IjG6PH2YhPHzzf424EXo41sv8zD25wsPjxZnzU65o3AI5TA082prOb4c
         IBlA==
X-Gm-Message-State: AOAM533/1rXcH4B0Oa7+Csi0rYMYoFQG/SIeHdqHTSkwGmdAl6anKX57
	gLRbEgT8YgIQ/7YVDa0GG5g=
X-Google-Smtp-Source: ABdhPJyd/PgxrOLjdrlaAYRz7cdirlOXUSeWNoFiBhHafKI7Ef6ntic9mpwNXmVl9XDmNjkGeMfFzg==
X-Received: by 2002:a2e:a40b:0:b0:24d:c4d4:5796 with SMTP id p11-20020a2ea40b000000b0024dc4d45796mr5370110ljn.202.1650713911189;
        Sat, 23 Apr 2022 04:38:31 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id g17-20020a2e9cd1000000b0024db538c2absm526411ljj.7.2022.04.23.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 04:38:30 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH RESEND v2 1/5] block/badblocks: Remove redundant assignments
Date: Sat, 23 Apr 2022 13:38:07 +0200
Message-Id: <20220423113811.13335-1-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignments to a variable sectors from functions
badblocks_check and badblocks_clear. This variable, that is a function
parameter, is being assigned a value that is never read until the end of
function.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
 block/badblocks.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/badblocks.c b/block/badblocks.c
index d39056630d9c..3afb550c0f7b 100644
--- a/block/badblocks.c
+++ b/block/badblocks.c
@@ -65,7 +65,6 @@ int badblocks_check(struct badblocks *bb, sector_t s, int sectors,
 		s >>= bb->shift;
 		target += (1<<bb->shift) - 1;
 		target >>= bb->shift;
-		sectors = target - s;
 	}
 	/* 'target' is now the first block after the bad range */
 
@@ -345,7 +344,6 @@ int badblocks_clear(struct badblocks *bb, sector_t s, int sectors)
 		s += (1<<bb->shift) - 1;
 		s >>= bb->shift;
 		target >>= bb->shift;
-		sectors = target - s;
 	}
 
 	write_seqlock_irq(&bb->lock);
-- 
2.25.1

