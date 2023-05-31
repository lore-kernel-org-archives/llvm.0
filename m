Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845E210E1
	for <llvm@lists.linux.dev>; Wed, 31 May 2023 01:35:06 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-3f6bb5e8ed2so29541211cf.0
        for <llvm@lists.linux.dev>; Tue, 30 May 2023 18:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685496905; x=1688088905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2/x4JOomTNoYK68TGeo1jbdWXKZOEcQ5s6x1ltkZ2s=;
        b=gST+wZxaCix9hoL3YTUbKzF9UZTLP3WZExwHZQ9c5yg7/uIRQmf+7eS/AnsRf5rwbN
         6ipTDdIl65s5NqSHG3NQ8gKl7fDv0dkfUPAkb/Opjs5k/lf6vo6DGF5JpS5188zhxTP/
         bCytnHenP8lGxB34qffNlJIQcGaXNPh9w+zzpL1J0Pa1V2wzF/WRqxkNJNll9xe+Kj4v
         wbGjc8O+uW6wBfKmi0UM7D+dDx0O8NJ28d92BJQiNAhlhFOEDwwJLzqCOoYPRrvJHhuK
         MrY6GKl9jN+0mmZMxVnhyYKDipBqwyQSKy4DoBnFSIb2FnGX5Hb/SLmbuks9vNgePDJb
         nbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685496905; x=1688088905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2/x4JOomTNoYK68TGeo1jbdWXKZOEcQ5s6x1ltkZ2s=;
        b=bRnnbMA/lsQZ8ul4drwfW28SnJAB9Fo/dMNvqepV2cP9n2mLitdykm7EFrM+g+onZT
         YGkUwoJUkruZfVzVXOvaZe2HmMJN4/Jy1dyaSkz5BhrtELtfk2FQZ3t4XI24ZfHvcItA
         +xXacws2ethpz581b+o0eUPwJKTt5hqhH2/HqQyysMBJ1ej5hIVQHJEhIi/FuQNG9myZ
         JIoAxvJq2LkHgRuEGrx2Fv8E5nJclmW7oYht8nB+VnQ5eWcVCUwikbV+B//oZCDJljJW
         O1uJJ+Qcv/DOQulYrLqWU9YEBlVfndTLYZ040+cxP+wKQfHHXIfp6nEUGKvZ5CgoSETQ
         bfoA==
X-Gm-Message-State: AC+VfDxP+Ag+R4CDbFLALxnQCyVUngp7HxGVrT5yXT75FWf+l9PI681F
	KhbgBWdqTKP5ZeKj+OEjDPo=
X-Google-Smtp-Source: ACHHUZ68LDwF97pTiFd+PZTyp94MfgdTWWbMyz0f1+uhbqIGGxI03MrrcAei9wCkNdSxx8u8qhdYgQ==
X-Received: by 2002:a05:6214:1d0a:b0:626:37fe:218c with SMTP id e10-20020a0562141d0a00b0062637fe218cmr4735734qvd.24.1685496905230;
        Tue, 30 May 2023 18:35:05 -0700 (PDT)
Received: from localhost.localdomain (2603-6000-8100-7fd4-0000-0000-0000-0619.res6.spectrum.com. [2603:6000:8100:7fd4::619])
        by smtp.gmail.com with ESMTPSA id h19-20020a0cf213000000b0062383edece8sm4249123qvk.91.2023.05.30.18.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:35:04 -0700 (PDT)
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
	Kees Cook <keescook@chromium.org>,
	Miguel Cano <macanroj@gmail.com>,
	Tiago Lam <tiagolam@gmail.com>,
	rust-for-linux@vger.kernel.org (open list:RUST),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Cc: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Subject: [PATCH v3 0/1] Fix libclang version check for rustavailable
Date: Tue, 30 May 2023 20:32:10 -0500
Message-Id: <20230531013211.27408-1-ethan.twardy@gmail.com>
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

Changes from v2:
* Add tags from review and testing

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

