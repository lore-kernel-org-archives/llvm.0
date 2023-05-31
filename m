Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D851100
	for <llvm@lists.linux.dev>; Wed, 31 May 2023 01:35:07 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-626195b4909so17683166d6.0
        for <llvm@lists.linux.dev>; Tue, 30 May 2023 18:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685496907; x=1688088907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMSUAIzAABF4Dds+SMcyk4c0VPg+DkSfaML9RK0MaQU=;
        b=o4yu9VXVx0+PhpGvAJBS9FUEuVLZQFg95Oapn4amLeSNcvo74e+hD9BKdJ3a5RQVFd
         TQlVQ/1L3qVOOr0D6gus/8HtKg4UAKf3AJdPwkkf90ELERuTcfjahmZnecczwTCilgtU
         UIt/Z+XGvtvuaix8kzC9NCVItKsk/E4/1/1DHGs9I3SFyzEBjGKz68exFauMKPLhbYuO
         KyMvreiMVP5HwSZoIGhdvWAxpxwsmk4J0Uev4s/dU+XZDcQOR7d7Wm9X3QyEEmKOv16X
         KQOPl7czev0Ew0E86EeI/kIPSC5rdz4Ex40bVl5mC165E+KanR9V/VGnmnDeCa/dQbld
         4dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685496907; x=1688088907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMSUAIzAABF4Dds+SMcyk4c0VPg+DkSfaML9RK0MaQU=;
        b=STkvXA7GpXI6kan6j5KGY4iqMK3rPkypEbgBs/E0fz3zmM1vROvlC6cO+RKM/qrHuj
         A+QUilYpZKTvCMXm6KpKfEoYfrC9JHb0zk8LMlcHKtutuq9pOWEKUUrDt+Eeo0S2nnzS
         Nw3fj4fPLOmg0DkSLpNHSOocX+44OUL5fDqul/ZqVMIT9DrnGdDKJ1sMcoGC/6bZiS4+
         q3UHAQJWo8RxhtQFFWjo9josA9ZkU+Odt2Wffn+ayzQ4QzT7tiK0fs2zgw6Xr3VD8ePV
         wNKTGCDLfUgP78qKrevMfhSTMJ/7EFIgNNIqT5sOCX9WU9362wmql9bFyxXAOANfaCKR
         krww==
X-Gm-Message-State: AC+VfDzmQYJNRIQy8uO8dJw9LU2ITZI8iZiJBvi0GZzuCu6lwGUIVLT6
	/Mc9Av4LN7NVRbZfKo/bilg=
X-Google-Smtp-Source: ACHHUZ5bYzXnvzzuInBywt/p/Waes6JQMdcwGCxFFldsnk74MWixpZZS8wyzVcftXv539hIdf3NvRQ==
X-Received: by 2002:a05:6214:c6b:b0:614:da60:f44a with SMTP id t11-20020a0562140c6b00b00614da60f44amr3506501qvj.46.1685496906699;
        Tue, 30 May 2023 18:35:06 -0700 (PDT)
Received: from localhost.localdomain (2603-6000-8100-7fd4-0000-0000-0000-0619.res6.spectrum.com. [2603:6000:8100:7fd4::619])
        by smtp.gmail.com with ESMTPSA id h19-20020a0cf213000000b0062383edece8sm4249123qvk.91.2023.05.30.18.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:35:06 -0700 (PDT)
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
	Tiago Lam <tiagolam@gmail.com>,
	Finn Behrens <me@kloenk.de>,
	Kees Cook <keescook@chromium.org>,
	rust-for-linux@vger.kernel.org (open list:RUST),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Cc: "Ethan D. Twardy" <ethan.twardy@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: [PATCH v3 1/1] scripts/rust_is_available: Fix clang version check
Date: Tue, 30 May 2023 20:32:11 -0500
Message-Id: <20230531013211.27408-2-ethan.twardy@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531013211.27408-1-ethan.twardy@gmail.com>
References: <20230531013211.27408-1-ethan.twardy@gmail.com>
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
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Tested-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

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

