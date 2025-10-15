Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586C306D40
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556785; cv=none; b=XCuYmIrqKr5x9BBEi+25pE7ULh72jsxZWjojsuVAhde9UyVwIu1tcSPmrzXaiQC8tew1GxtG2TybVGFiSHuqjuPJ0RvpT1OJRGCOaZ7+cbgzoBEfBW9ky/Wlb66y5KRi37s7P4KMmgQ1ciQYFfjhFkLv7JhZhG22+c3MrFZHhgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556785; c=relaxed/simple;
	bh=ScQQFFkpeGO6loW/Fw6rKSCOy2E7ESI95v/KoWzWsv8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gZk6LPje60FIoiDPsi4TljwI0IpxyArQ4ZYptjWGlXta+e4hyUURm3SFCtoY5fcpeLj0m2VLp00lNCgyiYzd+qEJne/xJkZkYE1aqkr+YVS9NUuymLdiWUCFElPeMc6TP5uq7GmEzk+r9ygffDmPQb97ZmatzW7BMeUX0NFFasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ejhag6vr; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ejhag6vr"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47106a388cfso4767055e9.0
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760556782; x=1761161582; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UAevwT93im92Z5B9wqQwoYCZ5JIudJs6adex10E8WZI=;
        b=ejhag6vrg5yDvm4twZFX4r2g5wLXR6dhpF3c84wjrK1JkbdMi3vbaYnUtBykOsudki
         EHoo2sEM45hItDWNebUnxnsC8CxDsyv07drN/uJbLFTp3Hk9V4b9l0pKP16naFSYD7s4
         tRwkVTScGvOAJy9OboyQ54wBNEmJfPFYTPDre2K3FqvODUu34gO/AFb7SCAA6pyjtUp9
         98Mo49NDy43Uyh6/1nkeBB3aUPkuN5aKbjIFPm5FvId+0meip9LKSttSAwK4ksGYavGZ
         DVBzSRIhCUIEkwFZdt2DH0e5pCIslR2QZ9ENYH53aTGCJEiyQgs3xosSBwbRprG5YVS6
         tImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556782; x=1761161582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UAevwT93im92Z5B9wqQwoYCZ5JIudJs6adex10E8WZI=;
        b=G/nlLR/kzXFCQgh7u+MTN7QKvh9faVCoHpLtIbK/NdkDSwx6XabXXtCuX81uYIoWkT
         Ff/aF0giCkjykzHR4nVtiGjLIx7Sfvui/nHGYA2hp3gylG3ZzezFt2QhxbY+fS+PGfSi
         bBAqj+GEuwh3UOAYzPEUdsxyRlFsacNHH6pxgExH0ukNwc/lPKyur5I6TDKEdDGZLReB
         OFQQ0QhTG3+jMVcBg9zNygvxX+I+441ZyO6F72t2o4ElPqLfDJb4CYbvmCbvyqVdffJ3
         +i5vPD7VCw6ZqI9unCfIwehEBZ5nf8W9JdWwbSwg75LNAvzm8FMBEWGgUe7xNDy/vz/q
         +dLA==
X-Forwarded-Encrypted: i=1; AJvYcCWJKsmGR7iCSvxM8AQhggsK/MoNI2nqaUfD6D38mWZN0sPTFvIO81vr/NVSCPPM/E65X8Li@lists.linux.dev
X-Gm-Message-State: AOJu0YxjKvETLnBmebpTWgtTxMxWj0cfzsxRFolZo/CADUHgdJ7rAJYJ
	QKP5iSHi+Cch1zNwh3YeUtQO9pShlNjc4jtQg9c+kz1ccVtriVuTLhvmnRMA/1L6E7GNdDPkzbX
	iFkutXfG3JmAp/WDV0w==
X-Google-Smtp-Source: AGHT+IGwzEplF/i+o3IChMoByalJPkPhIN2u4u73RuMgfnJGb89VTvklkfzoM/vxf4PIDBos9Yu+r9TLw3kNcog=
X-Received: from wmbh27.prod.google.com ([2002:a05:600c:a11b:b0:46e:2f1b:4ceb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0d6:b0:471:c04:a352 with SMTP id 5b1f17b1804b1-4710c04a443mr1959265e9.4.1760556782126;
 Wed, 15 Oct 2025 12:33:02 -0700 (PDT)
Date: Wed, 15 Oct 2025 19:33:01 +0000
In-Reply-To: <20251015-cstr-core-v17-9-dc5e7aec870d@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <20251015-cstr-core-v17-9-dc5e7aec870d@gmail.com>
Message-ID: <aO_27dG0j3zbnBCX@google.com>
Subject: Re: [PATCH v17 09/11] rust: remove spurious `use core::fmt::Debug`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 15, 2025 at 03:24:39PM -0400, Tamir Duberstein wrote:
> We want folks to use `kernel::fmt` but this is only used for `derive` so
> can be removed entirely.
> 
> This backslid in commit ea60cea07d8c ("rust: add `Alignment` type").
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
