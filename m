Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A903063D6
	for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 05:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y6i/s3IH"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bb53e20a43so46846b6e.1
        for <llvm@lists.linux.dev>; Sun, 17 Dec 2023 21:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702878742; x=1703483542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvwPqpJZdoxCPgLCCQ91PkXr1gejT72qQ4VC8gFnpTs=;
        b=y6i/s3IHfvm1t/mIp3rXkLaV/BcjoN6Z2UndxymPFDjidZGp7ssd5COTHpxy4Xj0ao
         13NXnki2YA9dghuLqGvZT+bGvzxL2cPqat4bdM2bdkrU1ne/McYTWsaWVYi6rICpqRcO
         pmVC+kEpJe8GcqTiiNbMnUUKCg6Bzr4u2H18K965fIdf+rcHHV4tefx1xohrDJAERTuG
         tvCq97UD+9vWvcJOO+62bbP+JZaaXETVDcvDSB4Ue6X4EVaR5H6wo0EZneHtho1dX2yQ
         d1HHl49S3QBBHxYTqaiF/uqJPQDuUVgvHVJVNFrp3KYEu2FyiYNbHP2+hmau+3HEj7oB
         +QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702878742; x=1703483542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvwPqpJZdoxCPgLCCQ91PkXr1gejT72qQ4VC8gFnpTs=;
        b=iZMu30nJAqtb0dLGb0Qy96UvqR4t8liqrDBAGseffIJdM2Qg95zfnDyVTb5ayE3tNy
         /c6Yc2er3ahDYk3rbJOKdyzfLz/A1AOTRwT/jP2pFgNScUPu1qLlCWBSK33RpT8BA5v2
         iIAzScdbdTxEF0RpKa62qT1o409DgRn4pYL0JiW6XmjZyj4Gxk3a9/QW0LXcqAus37YM
         Fs/7j9vtPeYbKAtYiICoYRAfZd+RcAKR8trkH8yuh2ArtWVmBPgiV7UQrg9LNrIvJv10
         +Kbe0b1xDwyKuYm7S+1YO0UhnKqYV8qxLt4Z5Q/U/k0AX0MNcpnZlcjrvpUDCjXvA0yM
         qPyw==
X-Gm-Message-State: AOJu0Yxre818aMgMBmW6JnbbTMRJZKHvJOaMFAGv39ewPIs/1lGTajC4
	+ToqFKSJB+Rjn96nI548yT7vzg==
X-Google-Smtp-Source: AGHT+IHWHiyRld+78HNnonHpwfExXg/FXJeL90CmfG3Tsyqw7E5D1sTLDotXmziyEbh9oFThjWFZvA==
X-Received: by 2002:a05:6808:17a0:b0:3b9:d53f:452a with SMTP id bg32-20020a05680817a000b003b9d53f452amr20483672oib.70.1702878742764;
        Sun, 17 Dec 2023 21:52:22 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a0021d300b006ce77ffcc75sm16344940pfj.165.2023.12.17.21.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 21:52:22 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V3] docs: rust: Document the rustupoverride target
Date: Mon, 18 Dec 2023 11:22:16 +0530
Message-Id: <c22eca4c308b72cdf750087622b61d3839ca40cc.1702878682.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the newly added Make target: rustupoverride.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2->V3:
- Remove the O= part and document rustupoverride target.

 Documentation/rust/quick-start.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index f382914f4191..c13e2e479e29 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -33,10 +33,9 @@ A particular version of the Rust compiler is required. Newer versions may or
 may not work because, for the moment, the kernel depends on some unstable
 Rust features.
 
-If ``rustup`` is being used, enter the checked out source code directory
-and run::
+If ``rustup`` is being used, run the following Make target::
 
-	rustup override set $(scripts/min-tool-version.sh rustc)
+	make LLVM=1 rustupoverride
 
 This will configure your working directory to use the correct version of
 ``rustc`` without affecting your default toolchain. If you are not using
-- 
2.31.1.272.g89b43f80a514

