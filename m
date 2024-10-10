Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB41BC094
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553118; cv=none; b=RiDFO9SHn5ONSxJP9VH5140TZuuR13j7ojWTXkqAPjwMEbh3Ig3d6oxImCYcKV2hby5jkvypCaGhcu3SAXJeUlpi6Um1AM/xQT7OP869HJopnWYO/1OG7wc6d3oLBJ7hqtFgRPDuzS1QLEvS0uTfZiYWP4/7QTlpxMn4f0Y60Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553118; c=relaxed/simple;
	bh=LGl5v64OdaSMCvZyhXlX9gOE4oO4AJVSVwQjgTem8xY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tydjNSssu2n+O72gxsXcmh6SugUeaHThVqmqWzftaNIw5extgTXLby31TQU2+ygoB+nB+YUgVJZTnwuv9Ui2qJ7Cd/AgstJ3VpXDW+130aUbsDf4gim2M1K+esqDcy0GcKRqoAAEfcps4nXagROOAsXSG433uj0Cge+aLmo6jBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Im1ECf6S; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Im1ECf6S"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e3245ed6b8so15175177b3.0
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728553116; x=1729157916; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3JrvS7ZL7zZ+JbiSh4qJJvQSqhwC8oRf994IWaVyGGc=;
        b=Im1ECf6SWYSsGS7giu/LjNCyXRjW7ZjJAVBBJn/4X/vfIbY51c9lwXLJMn+v2XZd38
         7S/6YB/kmfpESBHfxHk7+Y8Bxj58mGS7oO6ngPxwA6xEggiDo932/Cb05Gzu6NavSfXw
         lHbVikJh868hr6rZN1cEqF483B1nFhTXHVEHjSRFb4HGfNuHsywF9ApOp9RZ/e98gT8w
         gNIy+btNW+MF0Q4RN2LVcPSHYZGbQWnW/8+vMWDuIf4T1k+GqxpEEKko3ocNy655lWwT
         GM1FQeemDfD5fKS+ZtnnXihG5WD5KFgxg6qvKFUQZBBmqcKNOvVxvwLneTyO5kDl2Akm
         KMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553116; x=1729157916;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JrvS7ZL7zZ+JbiSh4qJJvQSqhwC8oRf994IWaVyGGc=;
        b=SqEKxgyj+oYso1wDu3uyleJEPukesuXY7H7fHG5s9UekNHVb4dIUVlBx75wvMWiVty
         wXCHas5n7y/8+VmhfYooc4Fl19ORc/FU57Xdd4PldC8R8kBGAQlEd6YBNeWfKuZG+Jno
         WPG9FEK+LxFP9vOXnT3nwhBpNlKk4cI1eOkSDJf88vw2Mi/jWkFBvQoZ+GHEThkmtky5
         no/GYnEuj3ewXPyfvVKqlA0D/priVb2r8SlYalW77dpaJ/c1MDtoVkaCPIlnKkijWzMZ
         waCeSCmHs2Zlj/PYeFdNXNgUFm2syBqe6WCrBI1zUtHdace0n6lnlD4v52YQ+iUuOoJb
         SlIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7DBbDI2Gbilebk4B5Hyqfs4IRtUE7BGH3qb74z12QdlTmdDdoB/g2wqmexQpSuFokPEP4@lists.linux.dev
X-Gm-Message-State: AOJu0YxbOKlK8VIp6gCTOfDkIs1jDEvOd7eBO/TdMejkibWPl3rCPbqr
	FvNWgxgwbeQKRpm5iIjWYtRESnFw5GRV2u3oDs+WjxfoaY7/BseSkLvMjh0hZKfTcmh46U5OJfh
	3GsCf6Hf4gaafIg==
X-Google-Smtp-Source: AGHT+IFhzGY5t3RkyXoIJV0d1EOFgaxtw5njawDVgbAaGCAdITCJbDElc3h7tzDkVGhbspHmhomdM4Hhz71cxBg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:4281:b0:6e3:2bc1:da17 with SMTP
 id 00721157ae682-6e32bc1dc1amr499067b3.4.1728553115778; Thu, 10 Oct 2024
 02:38:35 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:38:25 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJGgB2cC/x3MMQqAMAxA0auUzAbaKoheRRwkiRooVVoRoXh3i
 +Mb/i+QJalkGE2BJLdmPWKFawzQvsRNULkavPWds86i0hICslxCF96SMvYDeaaWuHMMtTuTrPr 8z2l+3w91fDo+YwAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=778; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=LGl5v64OdaSMCvZyhXlX9gOE4oO4AJVSVwQjgTem8xY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnB6CXpiAgpO06WePqhI7wIEZSiscJcvGy/If/7
 3KVs6ACM5aJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZweglwAKCRAEWL7uWMY5
 RktWD/9SpAYXqZHXhNSIniY2ws6yScZqR5wRrCqUJtVHBNLOKqw4Dp8vAwve/18pzRMmPpvwx1p
 2QO8gShh0uMKct8VIDW2QuGZqRNolmlOZ9+kIvPqA+b3mApSnwI7a8uCX6a+3d/TI3S+ExTN4hw
 bSW6UdpqsOzsiPIb27tkLIm1Em5LPF44KqZ6xhhFvVNrJsAKyv9iaDRsVTjqwJ9dImdqPoDj/5R
 LRVyoilklHhQvsAMPDkMGzMYC4XQTmqmLhWoSiPTKJXRvvkG0WlLr+8mjlfipLvv6mXdT53LqAK
 Zz7f964P3L+33xB1Ul6y555EBO2YTVf0uuEYx99UTcDM9tmL6ytSv8lkR1hqk/nCR+xwHUaAqKJ
 OsW5xXbQayaohCFTi1B3XdmhpSy+3hWyLuL9rOagP5ARsWHRT7rZtscahS5hCI+MGz369cbkkQL
 fTk6O+SmRru522Dfk8ZBzReicGS8ZHO27uN/bONlWvi4URRhzndjPel09OQlBWbj98UZgfbQ+cm
 BPVIEGrUJEZCJ58976wM0fmsr5IKGwFK4tlpUBp1Bx/G0FkvdCVo/54tuMSNPy44GIK7D2dmHa8
 HP+PMTc/gZYzoZEtkxnUz3Xlom4hJxSqJ+Luxldj9EymFzNWVcaLf30ts5LS4nOw/HPZfe94Ldj UZKkGoV0asyqb1A==
X-Mailer: b4 0.13.0
Message-ID: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
Subject: [PATCH 0/2] Normalized CFI integer tags Kconfig fixes
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series adds a config option for the LLVM version in rustc and uses
it to fix the detection for the CFI integer tags constructors bugfix.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (1):
      cfi: fix conditions for HAVE_CFI_ICALL_NORMALIZE_INTEGERS

Gary Guo (1):
      kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`

 arch/Kconfig             | 26 ++++++++++++--------------
 init/Kconfig             |  8 ++++++--
 scripts/Kconfig.include  |  4 ++++
 scripts/rustc-version.sh | 31 +++++++++++++++++++++++++------
 4 files changed, 47 insertions(+), 22 deletions(-)
---
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
change-id: 20241010-icall-detect-vers-79c2dc3cd41d

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

