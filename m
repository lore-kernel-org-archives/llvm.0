Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D22F9DA4
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809566; cv=none; b=iXo1SRCbKdtT4qZB8+wae0G7PvfLrTGXfdbEHUIC+EdpzxrApUNahwasB9lYBcIVgdeKTJwEGbjNy/xU6PYetRbkKu01xa3SptXpwXnOQ5NFt4kS7syXI03/PzczawB67Ky0+NyX7yE57XbxbYKTBeRPvUftd+DpuEMNe0mU58Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809566; c=relaxed/simple;
	bh=uLnXUd5iHMMEJTAMJKY0bsxZkX3e5rGAkuIO16n9SP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oaPMZiKnzvW69b9xHU8eQ7D39Z9Pz2yu6u8oXK8X5F4iYpS60lOkogIiBr+UOVRfWfuxpUsgugTGNrs6w+AfJym62OHl7xvv9oF1NfXUTAPjnXRMC2G9yHlfRQQemoc3hughdoohSpBdtd7ErC50zSijjAVNn0SMPeIyAXFDI4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlFk9tOY; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlFk9tOY"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-87c20106cbeso39543036d6.1
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809564; x=1761414364; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ycwx31K2mxLEujn4A81pZPUGOjv1ArmgOKcrq9XGsoU=;
        b=HlFk9tOYDvltFGlnK5nFwieDycz3c5wluyHjY7fQl9RUtNKGmJXBRCqcyX57J/7s78
         eQWMJ3DNxMjKYmMX5YGGyr+l9yoOPOnamNdvTub+Gb3LCgZFpM4EifCNKxmxTsEMUB4D
         1J9qy1c2p/kwcJOkCP8973wJIpna6HI36mYbQTOp7gbY7nrFqfSKVu8t0cD1Fox4j386
         sXO+mXeqiZZM3QLwgNY4tWNn2HjIX7MOz2EwRARFXQ5hMVvlT52dMITQNLazpDaqY8iF
         kv+Dh6rWA7HCX/CSiGqtAFaIV4AsWLpfDwDOqOOod789eSUD999J8kFDHx228/r3t/EJ
         /CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809564; x=1761414364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ycwx31K2mxLEujn4A81pZPUGOjv1ArmgOKcrq9XGsoU=;
        b=X6qdwdw61M8PIXsGxhO2C/H9iQmNVWGuyuUpLfiAe0YMkt56+EycABLYJWHK78p26g
         /YFxAcaZFbGzxq7xEKEvLBSslrVQGO73NHStlGxrMd4ai8bhub3FEBS+5Vk78Gx1dcl4
         5QnNQ8KxnCmh621qEsRwug1CzT/VBR0MzOkJ7xxnpwSUE5V0ZCNLbaewe5sfH8qVV6lw
         s7Zvgzh5uquNnoUUA11DJ3+Awui1LKx2agpD4Xnx3rIFdpI9UJdDoY8JMa9AK/YsKjp7
         CpE8mgDc/wB3SSdfqrUK9zXeSxJAhmSeAVu74kmnCxymq4YzxX41alm70DLbfXKJLOTq
         10AQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1MwIJlPiQhJCbDEXTqSoUl7AuxaSBQxJd042/4KQ614SMt97itJceHZwcVLpydFkHb0O3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq7ypEcqcmU29enebO/dl4/3+RFFWPaIvwjai998nH6K1zJNg9
	clopKfFUNO4pdTkct9flwt2HqeFqt6pXZ30EAN+05OKvMVuI6eIpIQ4k
X-Gm-Gg: ASbGnctT3oqH32ZMtonxMO7VE9DDOxDc9O3gxVwn0WLnaBNIc4oNsNvOxUPf93IyFLK
	44ludCdKbn9sZWEvsZ6mr5i5ydVf/4C24vgaH8y0jfFWBGRS3FVPrRfIkrKCE7iDZz5KNrl5msq
	ekr7ME5+Q9ZrLsrzG5sPk0z271dK/B4OpjcqnA2bhrm91oavZQAXcAAUvtw7biSVEgNuWLopSeu
	k2ff44j8ejDlvbbCL1iIlkxcYVg1AgA+lynRNJjlKrZrrtXZoOY6cYYZNjejjsemqsEIOf5NgT0
	ixRv2JY0Uk2awQMuMVD5kv8qhw9VKMeuQRSTGVBVdvoq7ebJqiyn3zTqRFsqo1K1d2bogkx1fmE
	keVkdW3qrf2u06kpsC8Fvjf0P9stJz7lhECGGJZ1RhRgGDGdPfQTorBolxTlxCyQ7Mzy/k78GLf
	aY1oqRy/vmFyQow7UkiRoNEUO+gWIBew0dORqh8IZNchwju3tkmkn3bTq9yt1OXE99CDOnGabPu
	1fHswIiUi6qhuqW0u9xtLqPt34pBc50h1vpvMo/h6laB7nyAsfO4a7J5BG7Oiy6IMO1T+V2hQ==
X-Google-Smtp-Source: AGHT+IGG7z7f3MNU21/Rti4PmtrZca4GFxKfblibRIkboUBwmpGvzYHP42u9XCSh6vTqFJ+cvotYfQ==
X-Received: by 2002:ac8:5910:0:b0:4e8:9596:ee77 with SMTP id d75a77b69052e-4e89d1eca83mr102709391cf.10.1760809563421;
        Sat, 18 Oct 2025 10:46:03 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:46:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:20 -0400
Subject: [PATCH v18 09/16] rust: remove spurious `use core::fmt::Debug`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-9-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
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
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=668;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=uLnXUd5iHMMEJTAMJKY0bsxZkX3e5rGAkuIO16n9SP8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGXXqQt9RHGxpoBFZLlXeLUPAugoqd/q2N96Ig7iFhgm9rnqX6mshM+HDXmtIVBN7F9GI6CbJIb
 k7xYI3LBrrwQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

We want folks to use `kernel::fmt` but this is only used for `derive` so
can be removed entirely.

This backslid in commit ea60cea07d8c ("rust: add `Alignment` type").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/ptr.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 2e5e2a090480..e3893ed04049 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,7 +2,6 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::fmt::Debug;
 use core::mem::align_of;
 use core::num::NonZero;
 

-- 
2.51.1

