Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08D211A
	for <llvm@lists.linux.dev>; Sun, 28 May 2023 13:21:03 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6260a2522d9so10515036d6.3
        for <llvm@lists.linux.dev>; Sun, 28 May 2023 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685280062; x=1687872062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ggyLkGv6g0jo85hrXvJLdeY1eXxDxkX/cg7GhTS4sI=;
        b=aIBF6b59zCRUAFbsviZO2vgNM+XM7mLFoWPVhWAuTOkeq320Ub6GSuS925yI0+uIQg
         YZAPupRUPu36GoC6sG6P1NaOHkcR/qWgBwJJJoEzEcajnfkmSYZrrznxahNUUQ3O7jlj
         A9REwphBY3TX2DE4xZ86Bmva0sn/eP2AffDJ24UtrivbhPdS6z+ScZqC5e8ueCubNNU2
         x8zlgeMt4vdx2L5iirnlglRnYLof0b1zriQ6GwZg+6w/bIi1+XneBfV0kAhWgMOLIIH/
         tn1pXiDs4p4HvW3TnYpCUuxMl8WZCWl4zIFK9QJl1XpufZsps3hNIwwQD9ySqGv4bRzi
         reVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685280062; x=1687872062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ggyLkGv6g0jo85hrXvJLdeY1eXxDxkX/cg7GhTS4sI=;
        b=RplpFkZyNqO6r66CpZcS4H0LfUY4LMGjwEE0bTjparGZUBxT0swjft/irn3ZLPPnWF
         L6azBznUNCMn3i6wxxlYNZSfk2pGOgGoE9LREuot/m93XzdFxxp9XSOYUloq9nWtoZdv
         P1QVw4aUSxMYQ2ePz3sqtztf7/TgnzzBZpYImGYDz7iKvQrcnQQ8f/cFer4/TxCa4YbO
         BW/OWKu6o5xvFTArbp/5zz67bQ/GJdQ/rduTtLGE9Cwor+XLVNPcMlLAvy3+M4er2gFt
         PlLhBg7Wl+X7Snhvxvz26iZjhHxqQDKcyA1kUBE6b+y2bmpm27NBn2BDxjyz73+Xiun1
         v08g==
X-Gm-Message-State: AC+VfDyPcvwkgt8xdsgkdMNWf2Hq8XPsJtKihe/NyvuKCO/Tqjl7OZxp
	HxPPD8uiu+fusUJLcATukfw=
X-Google-Smtp-Source: ACHHUZ5Z9y8gbyIHcZ/hfBctPRdliNDg9tOMLiNyj/Ez85Nq8VRnR3pN8fizYKYsBYAg+gP7l9WCvA==
X-Received: by 2002:ad4:5f08:0:b0:626:1ca6:5efe with SMTP id fo8-20020ad45f08000000b006261ca65efemr1344446qvb.9.1685280062336;
        Sun, 28 May 2023 06:21:02 -0700 (PDT)
Received: from localhost.localdomain (2603-6000-8100-7fd4-0000-0000-0000-0619.res6.spectrum.com. [2603:6000:8100:7fd4::619])
        by smtp.gmail.com with ESMTPSA id x5-20020ad44585000000b005dd8b9345b9sm87190qvu.81.2023.05.28.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 06:21:02 -0700 (PDT)
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
	Tiago Lam <tiagolam@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	Finn Behrens <me@kloenk.de>,
	rust-for-linux@vger.kernel.org (open list:RUST),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Cc: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Subject: [PATCH v2 1/1] scripts/rust_is_available: Fix clang version check
Date: Sun, 28 May 2023 08:18:02 -0500
Message-Id: <20230528131802.6390-2-ethan.twardy@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230528131802.6390-1-ethan.twardy@gmail.com>
References: <20230528131802.6390-1-ethan.twardy@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During out-of-tree builds where the path to the kernel source tree
contains a version string, scripts/rust_is_available.sh incorrectly
identified the version string of libclang to be the version string in
the kernel sources path, resulting in CONFIG_RUST_IS_AVAILABLE
erroneously set to 'n'.

This issue was previously affecting builds on distributions, such as
Gentoo Linux, where the kernel source tree is under version control,
and placed under a path containing the current kernel version string
in /usr/src.

The fix is to take special care to match only the version string
following the string 'clang version' in the output.

To reproduce:

  $ cd ~/build && make -C ~/linux-6.2.0 O=$PWD LLVM=1 rustavailable
  [...]
  *** libclang (used by the Rust bindings generator 'bindgen') is too old.
  ***   Your version:    6.2.0
  ***   Minimum version: 11.0.0
  [...]

Fixes: 78521f3399ab ("scripts: add `rust_is_available.sh`")
Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>

diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index aebbf1913970..e8a1439be9f8 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -102,8 +102,8 @@ fi
 # Check that the `libclang` used by the Rust bindings generator is suitable.
 bindgen_libclang_version=$( \
 	LC_ALL=C "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_libclang.h 2>&1 >/dev/null \
-		| grep -F 'clang version ' \
-		| grep -oE '[0-9]+\.[0-9]+\.[0-9]+' \
+		| grep -oE 'clang version [0-9]+\.[0-9]+\.[0-9]+' \
+		| cut -d' ' -f3 \
 		| head -n 1 \
 )
 bindgen_libclang_min_version=$($min_tool_version llvm)
-- 
2.40.1

