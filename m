Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136BA310623
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556321; cv=none; b=clUqmR9HRxLIZu9eb5M3wBN1ftOslE+fYm7j7IuYv9i6t1MUHvTcpO7trR2rN2JxZXwDerNRPAFxKOSfpprrnvW9THg1s0anglylXirOoGGvJnwKc4k/4hkOTR9jEz+iOol2kBo6zTvckoXdVTama0xnkPesQMlwRS1UuZLcl3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556321; c=relaxed/simple;
	bh=Kd0EzPTdfyblnmo1RxE7jLLbIDYVUJvE5DzKX0nK5ME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vf0Zyfzg98Z8jorSnZ68dUS79EpYFlpgR270GoIT3VAzx1bP3NsmP49TsNKHiLT4lwPFP1qNF+SDfRd3obR1v5Qxg8KEFLmiZr2PnPFxHxVVsGlrZ7/KefJ2MrM7wO+9nPhtRHBMC9lpK80Wh1dQ7RopTl75WrhSinN2Vff0PSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hd2ymfv1; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hd2ymfv1"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-87bf3d1e7faso47867926d6.3
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556318; x=1761161118; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfKLoaIE6m6YAqIlpySfZ0ebyLDDrsoOWfky8dWsuu8=;
        b=Hd2ymfv1gZoLCQumE23xYu99Iw5ZpnS4v5cnxiY+v3TXCaY29p7fC0aEue0PnqBfMS
         sL/PalKYME1hICys+1hadH9PeNeexy36UaFhAgU9+8jmkrFMmWFocBJepNEFncwrwIeK
         I/CCliHpeN2nLIIdaUQfV7l1SwKpPiFBw76NaIr/VoFODzkcBIlnqd7WiQ+a4RhhQD5r
         nN7fr8wIAb9bzhlqQzIjlld5kV/sY5ey947wzrTit86dwAHN+YVrwXaEqU3a/Rv/2OnR
         ULtNzQd5GQ6kIQJtaZOKy0xG99SmNONDkrzS74xAFdPj9h6LhXOssmgHJnG3T2sWjUVw
         4Hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556318; x=1761161118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfKLoaIE6m6YAqIlpySfZ0ebyLDDrsoOWfky8dWsuu8=;
        b=Ln+vPF6xznk7WJlsUzDivMh/n5jw+8UmnTUwDQ5i846Jb9QJILJiPP9obMMRtOphkF
         qjbWKXHZEoOwSskKyonzYSdmimodwS16ybYfaS4kSspuv6gn4SBG1t8gjjp/ERmjpYni
         QMz5QlDEalLWGo3OSkGd7tPWZ0AVhajjFfZAUjGEkuGYy9oggYeQGBE92cBU1jxsoqlC
         EGmX64Uax1zzY+J0OaWPJ+D5GVnASOgdrVujdDgzpKrARzdsa/+8UNXA7YyKFbkFphil
         ngoRsFa9DcrXOHidCgo3Mu0xHJnkrDJNGEunyB68lDQMZkW6IOza2ESXy5L62cNGXCEq
         1LUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBjMp8Cb9cdyaGuzfp6GEecg44FUAlp63Y5KtSQBTFbYL1QHXhxApaiAxeDHvdSNW+QL3+@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Iv7YBzFgAF/ytK7PCU7lxW1mubG+4QMh78tdn/ty394vf093
	LIb2a9pIvawGV39AD1T4q+1fLSB17CTUxwMNon4CZnXehePqjh8ORrUY
X-Gm-Gg: ASbGncv0FiBNR8CVSr4q8f73JGjdo8Zwbtb1t/3GMQfAa0fXc+8XezEW1FRH3PmjOhk
	HSzZyDhCkBx2iIAfLql6VV1qiVHjsWsWUBhPOSaXgrCktnoWMp55Qi3L0glhFxNSiQw0ZaiTs1b
	7ATpih7RsmV5S8nUBQ0an1ra8EgxyBbKTcAvi7IGDfxNuVWc0Okwrz72L96xlQmODAuS2enP+mB
	e06cAqf08IFYyot2peb0zN1MGxH4ElamEj1YZt2riqRpfwcwHfJeZ/YQnR4vORZemtbl45s/r00
	7IPArvI4zihQ1Rvd1T84ckJXllUWWIcTskvYYkVNxL6UMngMyzT+/7vdAYT/AfD0gP8bq4oPZMY
	BqQDHbNAWhwWOSqaIaQpSk9gS7dx46fWd8T0CxUVwPKpO4NCdFoXzEnMhg23k6YEIHPyR8c1wT+
	POQfNRxaAuunWyU3UKdqcg/Sf9pQSrijyNATvZxjx8y3vlS+ZJKlENP8dzYO4bfayLqCOaom5Xg
	4CIAKjaC/JLtGbA5mhxwjqoCHUHOhFqHXoQASM8n5HEx29Hsfnx
X-Google-Smtp-Source: AGHT+IEyJ4wXPRNVHomX6M4YCh9mUoGoZWRpoOJh8NtSqhKRuXmvyAnybqGcRN9E15RRAuo/qFdyWw==
X-Received: by 2002:a05:622a:5809:b0:4dd:8dcc:17f5 with SMTP id d75a77b69052e-4e6ead15d7dmr389497071cf.28.1760556317628;
        Wed, 15 Oct 2025 12:25:17 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:17 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:38 -0400
Subject: [PATCH v17 08/11] rust: pci: use `kernel::fmt`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-8-dc5e7aec870d@gmail.com>
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
In-Reply-To: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556296; l=872;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=Kd0EzPTdfyblnmo1RxE7jLLbIDYVUJvE5DzKX0nK5ME=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEhfQevpl/RzFxxXnpbY5oPfpzKL1+vKftdtwGLN29QKlCkDGEX76xd9UdrJV0rHFhQ062F1yi6
 DHt74TqCP1g4=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit ed78a01887e2 ("rust: pci: provide access to PCI
Class and Class-related items").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/pci/id.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
index 7f2a7f57507f..5f5d59ff49fc 100644
--- a/rust/kernel/pci/id.rs
+++ b/rust/kernel/pci/id.rs
@@ -4,8 +4,7 @@
 //!
 //! This module contains PCI class codes, Vendor IDs, and supporting types.
 
-use crate::{bindings, error::code::EINVAL, error::Error, prelude::*};
-use core::fmt;
+use crate::{bindings, error::code::EINVAL, error::Error, fmt, prelude::*};
 
 /// PCI device class codes.
 ///

-- 
2.51.0

