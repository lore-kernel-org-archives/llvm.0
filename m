Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152030DD23
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556307; cv=none; b=f11jUmtTB23XB5+SB/TtpQ7V5Ex1Brpf0XnJgb+nNNTd7uQG7wJyngaSHU+tNCarHt8905XUO+UBaJqzaTpp7IFfQwcsr+TOAEyMgP7tDNRI+sddS5DdkXSiihkMUdem2dxlnW5R5fy4mr60WINXGObM9H8vci1wYwG9CUx2EEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556307; c=relaxed/simple;
	bh=/6FAAPliz9JMtIVhSN5WM1U6uwaxaWrmdWOweTW7QYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XK20j7xmVd4YOCxK62VuQAmSGp0ijimljIyWkHK2x/ERqfVUhIFOOrHIjUrIs5IDEyntWm8slhSa7vcWFI1dPxNFaw3SdEUn8/9/bAfKQakxazkhFB1TI1sR97+Vh95kClNKoPVjactDwhuRamBzJCbkAiQMrKc+hmwVZnKrL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSmZZtGQ; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSmZZtGQ"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-791875a9071so92436436d6.1
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556304; x=1761161104; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+cfNHruMdPBuLxqLR3jBeCuq6DohSxciPX7+EKAG2M=;
        b=QSmZZtGQV/JfchKqniwNVJAmOok0GkXKY9xZDvY0JDmdtws1PMR6pcQIYyCgZ8iHk8
         hBv5q/nJeUoRcjBvz3TdRYa0mxclY8b13qD2LYAk3+sokb6kgkTIXIHgo5AoBWA9qom3
         rMvvL7Wn50iFVl1FIeMUeTYVQNJYgaeAH0fkWnnWp71cgIRtkBq9QEue2/dTE19lUOVj
         frycGWF6hpH7gUf3+vaMjsEQ8eSMKMGD1r+k7xWFjk6nMqxClRNu9DMvlglZfIB3xyU1
         BkuP0R9lFShW4sxfm+zsjyJs2Dp3CJ43ZDCyMlXm8Cp2s+J5LC9sfJsHL1HRZMpsbLQx
         XkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556304; x=1761161104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+cfNHruMdPBuLxqLR3jBeCuq6DohSxciPX7+EKAG2M=;
        b=X4GHyda3AjwuIr9TKwSb+m5zjtOjIJYQFznliisSnLpl0SHwxRz9N6jbH8DMI9MqRY
         wRkzNRWe2s04JvFUFhWkyS/Vy9bxEWW2DanOIlYBVWPxumqMU8hm0iXbIwVpkFDFYiRx
         HRSYDJKTUyBrV4TKkcb9y21iUyb1YGwCNJVdL0kzdXcX7K8oyD1vzsYMVzepx9/JQdXm
         cogeoWUkhVIduWt1L6deaygMMyX9v6c7JCAxa548TRom+PAZ04/f/Lp83HzqQ9esY6Ch
         DmoO5KhdnToNs78U90I0qoE2sUIBzgNkQ766HNpLHBWOeHM7lZlrEIjDq+Ra9vP8T2OC
         S6Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXPppgCgsx5OtHwRMuuJzT+Gz6IbkGSmNZtAdSKeEz6l8CtXD0UTCA5/In1KGLQM7Kc9fW6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/22ImMADHoJZdtAwDUJy4GqigodirDZ4/wBMhMiG9ZU1IngAP
	viZUsMun/auvz8mLFjMzFAo/yxJhJLlmRQmY/0Z82gO1epvWMGxLwK0m
X-Gm-Gg: ASbGncuaIlR/tT8ZuVGEuuSs4tpPbHNHFPe2lugr1ppNhv2Txq0o0tAdyHl/2gFoPCB
	+wJKd6qFVB1mKe05aJAMbrVeBuIyMKPt3ovAsr+sKHXx4mosi49D2zNp6+z3ACQGflHj1Lxz9Zm
	xn9C68+4llpN+56sk4MdQz/BZBsStTGX4U/LsScEcQQ1MXQZ3WisGV+7alvUEHQxOQS7o8jFGA1
	IpCCkQqFjIUnA+v875HmAUHPibJYwloPUlc6UKAPMpzs2RSxMqMsmibdbnHkBwsxHOc2SzkKZuK
	ZDDLFenDvs/OkCGjxCxE1EvOUaWkQPviuwxq1TWI4YwdmVVGNu0xe/2xFNEEXaQD6v5u1KYrRU5
	MpZYpl3oXcl8iukSRkqer3hVJEPrwrL2hH/jlThbp2ACwcTNiW+CxltZHzAUOAm5obvvajeX+aS
	pQyZpVf0+vBDLHKcN13g+m/ONVYabYLZA73dDTOWJ0A7E2Ie321pHjfYXCTp3fSxRVKbIkefr63
	YEuzP2YrAvNpQQonIAX7UXf/Wte
X-Google-Smtp-Source: AGHT+IEX9u1kD253LkrUXYqr3dEKSTO5L1DiyQsTG96pQUi26l2qBcGyddQYo91Es/OcoCoyz3pFyw==
X-Received: by 2002:a05:6214:2b0e:b0:87c:115e:47c6 with SMTP id 6a1803df08f44-87c115e4a3cmr1082086d6.60.1760556303575;
        Wed, 15 Oct 2025 12:25:03 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:03 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:32 -0400
Subject: [PATCH v17 02/11] rust_binder: remove trailing comma
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-2-dc5e7aec870d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=933;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=/6FAAPliz9JMtIVhSN5WM1U6uwaxaWrmdWOweTW7QYA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH7AeKnZyD8ngl4+hPz+8Rz7zx2cNxYrkgP+Fzg1nzu/J1gZ5lAhrwaQqIaNPJOGnMwEnAQZVmN
 mf304LMVVag4=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This prepares for a later commit in which we introduce a custom
formatting macro; that macro doesn't handle trailing commas so just
remove this one.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/process.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index f13a747e784c..d8111c990f21 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -596,7 +596,7 @@ pub(crate) fn debug_print(&self, m: &SeqFile, ctx: &Context, print_all: bool) ->
                     "  ref {}: desc {} {}node {debug_id} s {strong} w {weak}",
                     r.debug_id,
                     r.handle,
-                    if dead { "dead " } else { "" },
+                    if dead { "dead " } else { "" }
                 );
             }
         }

-- 
2.51.0

