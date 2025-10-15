Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7D130E847
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556311; cv=none; b=f2cmxLIlmHMzcXRuDP/b7k91SOf9kQbnT+rh9yjBzgSw8gyOF4y4IR+2XAP2jRdOJxeGXVnTiFbaa0QU6/7fIQNSCvjSzkFwvj9wOSPWaJi2QX5uYZIsBbiLUR9yj41GbabrLJIUEWNLcN9yV7q8BbQUOJykvvDw9nM3amZ8SnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556311; c=relaxed/simple;
	bh=2D3oEpmQYcHuLZnWIpYHzvkvUja5YWzKptv7Pd2qprM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ibYATYy4WbJ+ASe8PDqodU4TIvxD3+4N10nFRSdq5kqofBT7Uhv3p4uFQdkkCFs6jgOjwz3VmIn44xdyaONtu4Pi+sIZ/wWSHOskHF+i+j9vvrBYqcCFxfyl9a+yEi8PDb2dOJf20QgV2UV2FWlizPWOsPxAitYD1SkUvqUompY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUI5osX4; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUI5osX4"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-88e68c0a7bfso186150285a.0
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556308; x=1761161108; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eY/3IsdbfI0mC9DM0+1rrUO6mTTZQIEYJMq8pO85TCM=;
        b=HUI5osX4vvkvFwatzlVxXwbJ1in2errQ9hmVg25H3vqSFupVnOOHfIHcE4sI95Hhp+
         965QljKXNwl95T7jj+asP+pzH+XNj8QJrxymct1mG6DRSS1ew0zzSK9Zhg6L46FohiXx
         sTGoZcog7Omv6x+7OYcWqNfi0+pM2aMCvoegSNFO3yDlU8ZzFuO0Z4oEKTzJe8JPNUed
         hXZaMruuXoy+7z+9pAUnDVOi+lmjJraGxOT1FQBA5JTsuULVgFgYm3R1ft7prcyMheBD
         xSYb2NLCsugHYBZOuFFPvmDZu0HR5WbY0GTx3qwpd9qMhFKBM7cJHQbvSllfWKcoBxxu
         x19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556308; x=1761161108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eY/3IsdbfI0mC9DM0+1rrUO6mTTZQIEYJMq8pO85TCM=;
        b=uFp51A4x6va9OMy8Cc8HdgVdHkzbbtbz0S2hhT/NMSmIHF3whp6uk/oZp24zeEqF1r
         QTqAAao8KUVbSDCCN9tB0Oy4riavRyUW139M00UGJ7rnJa2YXglX3v0JhJRo1+RHXSTo
         N76pp2Lp/oV0HLXp5AE3wbiKY8rJtuTcRGZO7HrNznSUYJyFZ/8UkV4US5I5Q0T5ooUp
         xo+Ibb2jDbpmZ5wIklhmQo++yRr6+09ghiIOgQWE4rYzxsEq5ZFiJ5q2JXgpL7NkhN6Z
         hdCSxvK6/IXVasmD+N0tfJ3eL/fmDYZIzApPCWiZBkFz3YTQnPSFoUYKWKa3IAvGPtjL
         Ta6g==
X-Forwarded-Encrypted: i=1; AJvYcCUnTXK7AIdCN3vcKqjleB1kDOilkKUqsJTXqeg0piPeZWY6z56ZwatoRb518BMjPrF5o7qh@lists.linux.dev
X-Gm-Message-State: AOJu0YyWhqWAPPW8BWbmBgqLI+gI5hIaawKM9nDqD7ma1dwVfEvg9E+D
	LrQegZogeOtaPhy9d54SwxuKGy+bvJ+IarMeXY35GEFXj36isqfLQdX5
X-Gm-Gg: ASbGncu6fQC77SmUEpczPQW/5XAW8whvpGYQhIMCq2G4ShRsNQqxoBPRgoEnBuWpvCJ
	UZlrKVbN1phbiajpgfTY5B5DRGGim62+EdjTIT9DYAoqWuZoHLQieF5HQ0vgG+MVG5qTIUE8xnl
	nOf9/zSSR2Kg8VKv8de/sfyCvR6+UOxFSC97QOM0egMwSrU31BU8qjZfBAZY+43QyY6w1t7YGjT
	1d3EN3p3b2FK/3obpVKxHiWyMpZisr2P36dtgbl0N9aE4LpFf1l4EqtUYmZdqVl41LlIugI4+dT
	AhtvKnl+rhyRygiOvj0q3AB3m9kE7JfvBQojMC7xnwJCsu2Pw/re/gEzf7Ywmkl9DS7S8c/K8cI
	yVcqeFsG6rayAilttYmGhq0rDn/FgIJKx4aGpCDBnLp6rnz+6ftITkM1qAEakM7vNcC4B/OD+7Z
	K94uOxLLY6IDiZK8MYKQIh/nELL/cEmHyxFW5INiWKFOViypKDTASlyNienMEsiG5UWsfqSMdN4
	3RsnLtkzojsE9OW29dLicngXYH9
X-Google-Smtp-Source: AGHT+IF/CUBVvLt2dkQCDA5YZrHOn4tHGJzgB3mXHJTBxXrUXPaXJyBN4wC5HBKmPT8DqAH/ADgWzg==
X-Received: by 2002:ac8:7f8f:0:b0:4db:aeb0:b624 with SMTP id d75a77b69052e-4e6eaceb3e7mr380441741cf.30.1760556307886;
        Wed, 15 Oct 2025 12:25:07 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:25:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Oct 2025 15:24:34 -0400
Subject: [PATCH v17 04/11] rust_binder: use `core::ffi::CStr` method names
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-cstr-core-v17-4-dc5e7aec870d@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556295; l=1790;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=2D3oEpmQYcHuLZnWIpYHzvkvUja5YWzKptv7Pd2qprM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLuOpLGTfFQjBZXdio1nayh5dtiHoR1n54dLy3fgkauJkhueXEntNbGxy1JTge4mrx8nVKiNy+z
 1vw2Aya3HWws=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoiding methods that only exist on the latter.

This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
driver").

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/stats.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/stats.rs b/drivers/android/binder/stats.rs
index a83ec111d2cb..10c43679d5c3 100644
--- a/drivers/android/binder/stats.rs
+++ b/drivers/android/binder/stats.rs
@@ -72,7 +72,7 @@ pub(super) fn command_string(i: usize) -> &'static str {
         // SAFETY: Accessing `binder_command_strings` is always safe.
         let c_str_ptr = unsafe { binder_command_strings[i] };
         // SAFETY: The `binder_command_strings` array only contains nul-terminated strings.
-        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.as_bytes();
+        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.to_bytes();
         // SAFETY: The `binder_command_strings` array only contains strings with ascii-chars.
         unsafe { from_utf8_unchecked(bytes) }
     }
@@ -81,7 +81,7 @@ pub(super) fn return_string(i: usize) -> &'static str {
         // SAFETY: Accessing `binder_return_strings` is always safe.
         let c_str_ptr = unsafe { binder_return_strings[i] };
         // SAFETY: The `binder_command_strings` array only contains nul-terminated strings.
-        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.as_bytes();
+        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.to_bytes();
         // SAFETY: The `binder_command_strings` array only contains strings with ascii-chars.
         unsafe { from_utf8_unchecked(bytes) }
     }

-- 
2.51.0

