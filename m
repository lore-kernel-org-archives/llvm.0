Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91FA448B8A
	for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761817; cv=none; b=M/FcuEN/6goxD3nff2LrTW13IvoTQwRVsWVMTPe9GN0zbAQYGbd4pX87GX3XvElcb+NAW87zUZyGgfPL/WB5J6uQ6MJVSpXwaes2eu6ELSkYatIFaApNdsCGXEwHvzjebjBUHBJDgEoW3d2MM2DnJ8Z/TpXFm1eS3fIqtabJzw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761817; c=relaxed/simple;
	bh=gwIfm3sCQyiILWZQ7xFw6yNp7td9RDcFDuU2pI//xdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DpUa1buqVrovvE15v+i0PirEhkKrbgn5soKPwaeX/KNOgCUcJ2CLlG7dqn9GIbqf2LFaV3cKYZJdkfrGrovg5smNsf5t4B9Fk6iV/NNolovYSf3CdJsaLpKh0P2kGb+SzGwYsno6VKqj1ahZojCqjNS+N5235aPEHh015g7nmIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=qKDncTo6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="qKDncTo6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so10801675e9.0
        for <llvm@lists.linux.dev>; Wed, 26 Aug 2026 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761814; x=1788366614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5JqemKnba64Z3g/kh1rqnazfKcGKeW7SjV07q49wE8=;
        b=qKDncTo6DnL9LQ5Lp0jFkbT5YL07WCbFjO1jOpUoabydhRqlmSCjUhV+0/7Vuzfbbp
         qIdjLehS/3eP4NcImU/2NW7RdBXXRbGpRG0eANV+Bj1Y0wu4im5i4PbzbKOr9HziNpWi
         NRTj6vzIn7cLDUhx/EofoHe1meTdafXt36RnuG5gnX2vauQpfCFmX4mnjYjo3iBvVrQ7
         uM/IIvBsyxTBmzbXZqGljC31xLblCCqpvU9ISnYH+S8rD6Fnp0Af/1WPCYS69RgCXeTg
         fOJIlj4koZgyJkRT550GJnbW2LedsIr7/8apYkers9HKelc1wvEXAWOHrx9xX/xfR177
         h7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761814; x=1788366614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5JqemKnba64Z3g/kh1rqnazfKcGKeW7SjV07q49wE8=;
        b=hVQN3cnTsSsQGpvDCxT5idUV1S2Sihvs7IaE3xv848wuhw23pwBxySglVujgdpd1fK
         2nQUQFdwxo/DfK9fbJL8aR4Y4lItH+1GiImHmIEP2rYxIYMkE8VdDELsBeaC12pzqY3j
         3sOBOFGEpI/d7aciVPHsEG9wn3iOD+ledoX2XV5hpEbxcbQK/eTmxkYeEeE/Ccjjd34+
         pEcZH0u+Zf/xBYs56Vd8gxe3TactB13iSaWPF9C163sYooHGBWGELQOfTMSdnuG225vI
         yjQNe+LWhNjeKNCl0q6WVfNCeq9mnxV60eyakpeJS7t64zKaTmcyauhvEkYjs6cP6Dmk
         Sf1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr14u+5fet97SPo6ji3Qwy+qRWiAMyFlRIEd/93v4mjqwqBFdnGv5UpfXKxbI/K++MB/P2Z@lists.linux.dev
X-Gm-Message-State: AFuF++kegfji109YYnCB+0J4BoLWpcGa6NHOi2/hEqO9AZpON3KAEWOw
	ieQsyWRLBgDz5ozjqNI8DxzGqRdUc8gtvLEneFGqr8COfT83LaCvbN1BOLlD8h03sQ==
X-Gm-Gg: AR+sD12dN5yDR52IJTQccE0+xxYecM2rSO6ogZm+zn9OFlCrsFifwM8IeaSA+02nDNo
	3ViZHvloOVt26xPG+vP0HOAdAc5ztmxXKSwxivfxlzYn23F7P6soFVkhs28TUU4xnjOi6RyZv3x
	Nl85prrdSDv6a78BPL/+YxExdtdR7BBoU33oGypMaJOpCjA+gazqjhCue7n7mcddSJqgbIWQULS
	4KtSMGuh+925TkogpUn27TozAqJdgcYFMlLlRdOZWy5USM5acv9YZQ2N8WANM9bY63GQy1SaT7x
	EArh6RL7NJnrbwbH2/kytlAKRrVsqqHEz2AR6DI86whrfkXRKuU/YauZRy1SRkP+eW9mcYWWBKN
	vCxAMtbYa4dujGRKDou7W2pq26KmnCTgQQeD5rdOLgfl2eNjGSe2AIw/maqOgPn5vb15WkM1XTD
	RALreNXBPtOZ7jjzrxx+OWV0pjpVF98K5lH/CECMIfb21RVniqE1NBakMTTIazMU8xZQ3a0PcTV
	srbpvLct+9FFm6x9bEPnYj/t8F10CptRbrf
X-Received: by 2002:a05:600c:c178:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-499dc6efe07mr77963895e9.3.1787761814121;
        Wed, 26 Aug 2026 09:30:14 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc981bf3sm32323615e9.8.2026.08.26.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:30:12 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-crypto@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/2] rust: crypto: AES, CMAC, SHA-256, HMAC and RSA bindings
Date: Wed, 26 Aug 2026 17:29:47 +0100
Message-ID: <20260826163004.3365-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Synchronous crypto bindings for a driver that has to authenticate a device
before it is allowed to drive it

The first patch covers AES-128, AES-CMAC, SHA-256 and HMAC over the existing
synchronous crypto API. The second adds RSA through akcipher, which HDCP 2.2
needs to verify a device certificate and wrap a session key

Changes since v2:

  The hand-rolled AES-CMAC is gone, along with its own dbl() subkey
    derivation. It delegates to the in-tree aes_cmac library through
    include/crypto/aes-cbc-macs.h, which is what Eric Biggers asked for
  There is no private RSA primitive either. Modexp goes through
    crypto_alloc_akcipher("rsa"), and OAEP padding and the HDCP key material
    are held in a memory-wiping secret type
  v2's separate CMAC fix is folded into the commit that introduces the CMAC,
    so this is two patches rather than three

Nothing here knows what HDCP is. The consumer is the DisplayLink driver at the
end of the chain, whose control plane is sealed with AES-CTR and keyed by an
HDCP 2.2 exchange

v2: https://lore.kernel.org/r/20260703030056.2763-1-mike@fireburn.co.uk

The rest of the posting, which is one series per subsystem:

  rust-core, 9 patches, rust-for-linux and linux-kernel
  https://lore.kernel.org/r/20260826162851.2497-1-mike@fireburn.co.uk
  rust-crypto, 2 patches, this one
  rust-usb, 5 patches, to linux-usb and rust-for-linux, not sent yet
  rust-drm, 23 patches, to dri-devel and rust-for-linux, not sent yet
  rust-firmware, 1 patch, to linux-kernel and rust-for-linux, not sent yet
  drm-vino, 13 patches, to dri-devel, not sent yet

Vino is the user for all of them. The abstractions themselves are generic and
carry no knowledge of DisplayLink

The whole thing is one branch, base and prerequisites included, which is the
quickest way to read it:

  git clone -b vino-v3 https://github.com/FireBurn/linux
  cd linux
  make LLVM=1 rustavailable
  make LLVM=1 -j$(nproc)
  make LLVM=1 -j$(nproc) modules

CONFIG_RUST=y and CONFIG_DRM_VINO=m are the two to set; DRM_VINO selects the
rest of what it needs

It is the exact tree these patches were generated from, at 4c9ba407018e, the
drm-rust-next tip of 2026-08-06. drm-next has moved on since, and this follows
drm-rust-next deliberately: the KMS layer underneath this work lives only there,
and that tree picks up drm-next on its own schedule

Two commits on the branch are not in any of the series above, because they
enable no part of Vino: a scheduler call site that stops compiling under the
locking-guard series, and the Kms associated type Tyr needs once the KMS
registration trait requires one

It applies to the base above on its own, with no unmerged work under it, so it
can be taken without waiting for anything else here

The reference branch also carries Boqun Feng's counted interrupt disabling
series, which SpinLockIrq needs. One patch of it is already in tip locking/core
as e901c1510e24

These patches were written with the assistance of Claude (Anthropic), used
through Claude Code as an interactive coding assistant, across the design, the
implementation and the tests. Every patch it contributed to carries an
Assisted-by trailer. The Signed-off-by is mine: I have reviewed and tested what
is here and I stand behind it

Mike Lothian (2):
  rust: crypto: add AES-128, AES-CMAC, SHA-256, and HMAC bindings
  rust: crypto: add synchronous RSA akcipher support

 9 files changed, 592 insertions(+), 6 deletions(-)

base-commit: 4c9ba407018e8deb06dbc643112bac8f40404f95
