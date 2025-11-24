Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1714369A
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943809; cv=none; b=IYIVWP5zNdsYEZboBR6ZJKj0BkSNB2F2iinUVQgWSWfoYLmtftr8TIfLL8dYTzI9sdJH+s0V371jmdq0s5wD3t6Vu4EtuHe62B59wU7MvxVVYLRXRN9UcJz6zhRTqP90KOeGoW85eqMqhpOdHr82NI0tkl/MQHDyAEBv6BGzlcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943809; c=relaxed/simple;
	bh=sTkBdKF2Bl395/5OqRTBusVdJ6qB+Rw9uaO1n0TJDaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLzEa8aWdOE9cUuTKKq/pRK/K6H0942IVvceSybUAPNJ/zakZ8pFU1AMRe1oFxS93r8f+JAAQ6nSUJvqt9sY+PMejetY2LaGPmm6fnb+7FTC/q4ikdITKFppoImshn1MF7WFK0ytlBd0opB5ox4g9CuXo+OMoTvjTdPBuvSGd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaaPgTeh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaaPgTeh"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-596a055b1b8so3245383e87.0
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 16:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943806; x=1764548606; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GKE54eSllGJNXgg9hY2liAKdUIlhKXmX5Ag1NTay1Y=;
        b=NaaPgTehEeV+lrRdsYzqMIE4WfzGx7knZ0ZK7rQPI1sFzwrPcxskkc4AK2DGbwecIP
         0yGsDaviyyqHFTBPObjiHPme+fHmaBGUIB9ezhR9RZvD0/Mm/aDPawL8ILTSEicul2WA
         nDU8r5vMjkBkjg9nEfr7KvF/6X9bJU3OvfTgiBgACeGy7XSSYr77xHRI6wQbn5Ora21D
         DD+2qWI9MVPzXHxteiRwKPgNIM6UULe2DCbAzGLTXOSJl/XDXwWrrscoQGtgvF7rrSOc
         5P48400B5akbeRVaLmqFOfRFbHoabO/r9atCZTZqmK+F5Q2qtwTHwZPcQRQqzQ3Ouvdd
         pXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943806; x=1764548606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GKE54eSllGJNXgg9hY2liAKdUIlhKXmX5Ag1NTay1Y=;
        b=Esz5AdWEpi0WYHDbGS4J/mBFz8W09u6qwsWISl644Xw1vBLOr0aZxTiMunwhN0Uone
         OfCCmjOBu3n7u5JL1M817ZYUPvZjts/Wcjyv7Ax3wQm3unNvydBwVQ/ENwNsFpiyp9ME
         Fl/PSxvhCRO15SnA4X+yxMxZidd8B3mL354i43a59qoVJsB4USuxqGcyND99zPlUQX6R
         398RlnK9v6qMcNr/n0MQQ+BOdvk8+MjzFVmQ02SHmdtlQKiLLTzX3/2znY5tQ0FhhV6s
         0YpZTXi2v4/IePzHPozsKxj8vGCOYyvWUdfy5h6Z8NvJJsEhQZ+gS1c60QWJmOfc3K8W
         hMWg==
X-Forwarded-Encrypted: i=1; AJvYcCXUKoi2pMcdvCsOvsGxXM7z6gpWqeNUl0qACYjJhPQlMus/MASni8QaPAEJTUlvpI16H7b1@lists.linux.dev
X-Gm-Message-State: AOJu0YyScVoZn074UIls7zt4o3521UAw5h9+x/evcA+czj0xt9W5DKM2
	/hdjQfj5j+hwMvBmSrnU08uxo4W9NgPhVYfx+r7VFReeI9m2faZOP5P7
X-Gm-Gg: ASbGncvJkK+Cvnxmm/tnk0ttQD1E0ib8Ymfde4czQicUMQcpAGOLoXZFT3AcXf/uM6C
	eI5xEJCPqk7sIJ/KGvNPv6qYt7b9CmUn2xxog9A9y6qQ/UKYnbBKl0uSqWPPeYj2rIAvCiBgnMc
	y6jdqG+fhZSXgWxJVvddnz4MeVgpilryy0uz+V1+jIdlfQenmnQjibjTwFprnUB2KryOxHfrHgQ
	0TwNV3Snj9zLnYE06K826soKXYuJafEQYR7soEQiHXJilHDgB5K7ktKX1lv6h98A7keXjdGKDUx
	j5xpH0cZ0dTzz1kg5fGOIXAI5xEtSFS/8FQNk1SzdpvhJfcYCV7JdAW6Oo4y07sBfS81wl2mTh7
	SYLtQo4VVr0gsAo4lIM2WL4tuM7N6HUViddMYjpWdKkocf39lPMYDYdzXrUfwFj+Q6SUkbw==
X-Google-Smtp-Source: AGHT+IEWwT4/ncaiOLuV73qylxP6v1jd62XgFGSBRwTlD52FtVaOl9gnPmEY64M2GGXzMxQbpMXxnA==
X-Received: by 2002:a05:6512:3188:b0:595:7e9c:cdfa with SMTP id 2adb3069b0e04-596a3eb5e25mr3770473e87.6.1763943805776;
        Sun, 23 Nov 2025 16:23:25 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:25 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:22 +0100
Subject: [PATCH v4 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

Generate a friendly fatal error if the target triplet is undefined for
bindgen, rather than having the compiler generate obscure error messages
during the build stage.

This piece of code is copied from `scripts/Makefile.clang`.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Makefile.rust | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index 5c12b4b8c8b6..b219244cd051 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -6,4 +6,8 @@ BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to scripts/Makefile.rust)
+else
 export BINDGEN_TARGET
+endif

-- 
2.51.1

