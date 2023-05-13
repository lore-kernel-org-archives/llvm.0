Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7932583
	for <llvm@lists.linux.dev>; Sat, 13 May 2023 19:34:04 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3f36523e104so61030251cf.2
        for <llvm@lists.linux.dev>; Sat, 13 May 2023 12:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684006443; x=1686598443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/2Y0NnOA4rOyDN7e+HMDW4ZS3Xal4lAQgzHlbrtxb8=;
        b=TKvU88cEw94xxNGVXdWVlGX4SELbGq5Tjssy8H3d8emcgndXTF68PDTb11pNKBVd+v
         2pItfqbo5XJlLmB3N9FiVeR5pd3BbzyL9IaeeB7aOTyWr3EFWCOHZ4dR4K68KQcrnH6E
         v0Fa7f8peU8H9jE2WMjcun/Guui6XuV0qitpGJmYcJoU3iwMMgi+g7S4JY9y3WPNpQpo
         /5AHPXmHI1ijEJRG7vRrvgW6QX7FGR7yswHulAc0ZeGxEBRx39nctPVPUF/4zgQFna1t
         5QzwPm+wLWXL7VSNm1nAI4SAP1u0yUkiQdyExEydkjqZ0tN0OfxSwWBWhQDtUjKzOAkr
         CCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684006443; x=1686598443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/2Y0NnOA4rOyDN7e+HMDW4ZS3Xal4lAQgzHlbrtxb8=;
        b=OcTrYDiYz6C3I3Qa7vFlEsVusYH74/7FHoU2JtkO/CKFCxprfY9ITxKyU1i1Vxlf0W
         Py6CtuK/7deyM/+PsR4WjSCW94cBAt67j+QW8+eKo5f3No+eyC2aWkHMx3M8L3lGyHsQ
         9MRZFfCqa4O9T3M3V/HICTcXF8bdtBadpVqshmer7/Obf5bGgLzoAMwSjM4nZGDDEaRo
         1xwgt78yzuhy0sP41X/YdGdWAml9LulDl48oYGPf8YtH+wknDsu44eGn4s1D48DbeI8I
         0HuJ+cCIfqPTCuOKz6vpEkf4LmriJboFLsHrxBmNbA9meGq2TFAEXLl15zc/4Juze/f9
         N51Q==
X-Gm-Message-State: AC+VfDxr1UlLf+o1ATBvqY85PrbtQ3GBUarHBKQhNhbBbSQ4Lq3ykI4s
	TJ2/L2TBcLMA8RewW6PFhwc=
X-Google-Smtp-Source: ACHHUZ4e67Vm1wY0nJaNasVnetT4L1KyrgtLN+6+PVyfXg0nNvcoSJhF8DE502RICDRhxbWjSP0Tng==
X-Received: by 2002:a05:622a:1309:b0:3ef:415f:188 with SMTP id v9-20020a05622a130900b003ef415f0188mr49337463qtk.61.1684006443437;
        Sat, 13 May 2023 12:34:03 -0700 (PDT)
Received: from localhost.localdomain (2603-6000-8100-7fd4-0000-0000-0000-0c33.res6.spectrum.com. [2603:6000:8100:7fd4::c33])
        by smtp.gmail.com with ESMTPSA id s13-20020a05622a018d00b003f018e18c35sm4054115qtw.27.2023.05.13.12.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 12:34:03 -0700 (PDT)
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
	rust-for-linux@vger.kernel.org (open list:RUST),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Cc: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Subject: [PATCH] Fix libclang version check for out-of-tree builds
Date: Sat, 13 May 2023 14:32:37 -0500
Message-Id: <20230513193238.28208-1-ethan.twardy@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During out-of-tree builds where the path to the kernel source tree
contains a version string, scripts/rust_is_available.sh incorrectly
parses the version string of libclang, resulting in
CONFIG_RUST_IS_AVAILABLE erroneously set to 'n'.

To reproduce:

    $ cd ~/build && make -C ~/linux-6.4.0-rc1 O=$PWD rustavailable

Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>
---
 scripts/rust_is_available.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.40.1

