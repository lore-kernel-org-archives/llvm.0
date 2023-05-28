Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9BF1384
	for <llvm@lists.linux.dev>; Sun, 28 May 2023 13:21:02 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3f6b20ad49dso12364151cf.2
        for <llvm@lists.linux.dev>; Sun, 28 May 2023 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685280061; x=1687872061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=akn0AE9vZX3RUwIDlCTRF2LZpWprpBuLBZTHq39XBig=;
        b=JBw3AojYSTklvJ6xiPAG2k+keaiXutzjPJbOl2oI0HkreXVMZ7dUwFaTxEMoRyM9hg
         nJFbQqhLpkRNkuC0MnnssGB4gme25TAdjuPMiLyTCSncytmlvE2jMPX3Z47zBQeQWCBB
         M9GAR/N6Q/0vIt1yfeXsi4XQ3xyXmBHCpNzfVwmPygZQlvDrRkl5mK/BfhaLYxcil5Jo
         PWV/xmdOrUlzxqHq9VCWJBvDyi6+vnJW9NnUQYMDrR+/2Ox2MOT9ljWFi8GCCRHBLYBH
         r1p1FBuUMWnCw5zSWAqgobYZz4JpCbuNCveq+Waju2EUSzwaB5MlEkKQqOkRZPuTb1PQ
         a4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685280061; x=1687872061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akn0AE9vZX3RUwIDlCTRF2LZpWprpBuLBZTHq39XBig=;
        b=O6R7GV+WVWgxS8NF1sbgGEnn5pKcMd4kroBOVoUQnUcrq3KB9BtdsJiG+CyexYwSlP
         8zqJb6i7jzx7oBorlWxMKelf+FHI5RXiYZzEMfZv487asrpzfD5gbsmj15UfXBm2V+rp
         HMFXw/vF3oCjmjKZHm56dbxxbEJWw0TR31SttvTzUYL2qMcUn6n/LsdGEXiyms+XXr8C
         jZNS3nubdMZ6E9QPKh4LmSQ2/g9GMZA4njBZ1BOQweIrx+TY9m7IAjpKR1bby+SMyYEN
         jCIRxUXxIYWfAz5la+k1y1nHsUZ6uNpcmkPhN2qqiEFKo+0llwZF1Xx00tpLqYANt9hT
         8pKg==
X-Gm-Message-State: AC+VfDzhHYnFQBxCZYZUT2TAvMkOBDifRlS5kRGQVyaXU2ADSEA0Y+g3
	GhSk1CE1lWmB8MeVoUtQ4N8=
X-Google-Smtp-Source: ACHHUZ5XS2rAH9OMWmDO3CuoXmoGucKRX7XvOLPY2e5l3GbsmpudomJZrrkaQHpKd/Muy97e7/XMaA==
X-Received: by 2002:a05:6214:e62:b0:5ef:8ae8:9adb with SMTP id jz2-20020a0562140e6200b005ef8ae89adbmr7067556qvb.37.1685280060963;
        Sun, 28 May 2023 06:21:00 -0700 (PDT)
Received: from localhost.localdomain (2603-6000-8100-7fd4-0000-0000-0000-0619.res6.spectrum.com. [2603:6000:8100:7fd4::619])
        by smtp.gmail.com with ESMTPSA id x5-20020ad44585000000b005dd8b9345b9sm87190qvu.81.2023.05.28.06.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 06:21:00 -0700 (PDT)
From: "Ethan D. Twardy" <ethan.twardy@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Miguel Cano <macanroj@gmail.com>,
	Finn Behrens <me@kloenk.de>,
	Tiago Lam <tiagolam@gmail.com>,
	rust-for-linux@vger.kernel.org (open list:RUST),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Cc: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Subject: [PATCH v2 0/1] Fix libclang version check for rustavailable
Date: Sun, 28 May 2023 08:18:01 -0500
Message-Id: <20230528131802.6390-1-ethan.twardy@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains just one two-line patch, to fix a small issue
in scripts/rust_is_available.sh. This issue is currently affecting
kernel builds with Rust on Gentoo Linux (and potentially other
distributions/workflows where the kernel source path contains a
version string).

Changes from v1:
* Patch formatting. I believe there were some serious issues with the
  formatting that caused it to be lost/ignored by the mailing list.
  I sincerely hope that the formatting of this patch is acceptable,
  this is my first contribution to the kernel so I haven't mastered
  the patch workflow yet.

Ethan D. Twardy (1):
  scripts/rust_is_available: Fix clang version check

 scripts/rust_is_available.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.40.1

