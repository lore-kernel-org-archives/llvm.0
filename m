Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA38130F931
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556691; cv=none; b=ZBxKR5WAO5SvGcQQ//9c4evvY57Fu7Q2LzDB1/Gz2tlyKrocyEtshPaSjf8qyCLaKS7BESGAgf8l/Y9n+GvEjedn+402OvdNpTkibTXXCyH6nLr3tyIfHvJSJUKnAZ3inIGesNP0mUF3mV+JXsVlFfDdb6oO0IayPl1Wk0Mbui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556691; c=relaxed/simple;
	bh=kNflbdkxnSak8W84DQ9chfjwf1iwPVGgDeWnudi49IY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GvxxliKb3U3Zw3dXaUuVrKk0obYsX+98i7EnRll6fqL2rKU99PGyN+V5FDsnV+Fv6Ko9j9ryp7mGwzwTOaCDG6czmhndCDXFfjDCB+J2huh9xbe1zPdCbKSO2Lz+7eDMSZIwJqZPAYu+wZUjwmuxi6BzlSD17mSCtbexVF06lms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ArOu5eLz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ArOu5eLz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e35baddc1so71479705e9.2
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760556688; x=1761161488; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YYTBGsDd4ZJL1eAQVxl6XdilN8lmC3un8gI57oa+wc=;
        b=ArOu5eLz7BRW3NOKQwBKlT+FVYRXtlzPI/CjcNSXv1iCMvrcQZQ6GDkLfvU5zEuqdo
         /2ntoEbLSojG5/TFfXf1Df4QdxNza/P0WxtRPa/6JrHBfWWfJuO8WdmCHIVk+a6XL71I
         Fhql9uWi0nysI5pTTZSjXDCsCriP17ObyGAUziQ/BQr42e94+6BEaSHGfk5k5kV8uAju
         0u+fSTyaJt0w9ulheON+yVDxQGvxzCvFrts35/a9p0Lq+6TxzetWll/yQr/snPTGzUEF
         d4vDYfMfwulZawJ9+M2QVXGU27OOKcXxfbyyRPy7oVx80qb0mzMsh09p+LhQRxqwk1Oe
         Pr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556688; x=1761161488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YYTBGsDd4ZJL1eAQVxl6XdilN8lmC3un8gI57oa+wc=;
        b=hVQpXKg+3huxhLzKip0ir+3+OqJiOgxMan7phL6Ku8xfqOZX322svrCAvADLU+NjHN
         Q1dnJdqn5pUihmeocb9aZo0+7HPqwylyUXyArTXV9P+UnUaX5WYFIDfhNc0gCzPbn5GF
         b2V1IJPQhSaMJXv2uJgnjLigcpEIrSYv1jlALrK4JHG6A49UB/0miyoffyZkjrU3Ru02
         mOlR86WZme4gL1ULfhieuZ6QZwc87+k5yoafVcEkPgYquiGJ6cn1+vrbmfzl0nb9vyt+
         OpnUV1kouVWmucstLfY2Ns5/qsMb955vt9Wq+ZtkAsTCkeyEx8qK0lJhaME2xs8E4S4v
         A7uw==
X-Forwarded-Encrypted: i=1; AJvYcCVUJ8LMDTZ4iaP/bWhCsP5zygnaU7U+pBpdhKljJJO+ZO9AjyEYpuj3sul2mOEQm3nx/PYR@lists.linux.dev
X-Gm-Message-State: AOJu0YxjnTANlyqPmpK2gornT3jQs90aRTnr5c8zQ0Fkzt5nOOSAw9AO
	2gITuo6jth4SigunljjTWlkhT3TKJLdNesiImr7aQnbS5wsMz8sJyFfv7IOwd/o7qxHP57YELoS
	vYxRI3bqddZATGQQESQ==
X-Google-Smtp-Source: AGHT+IHkXgCUD/Xg8mwfvq5rsw1NsD7V33g7iy9bartydYztNdh4V9vcMXz0z1HOSr9X/M95RapHcDYXFrnCOyo=
X-Received: from wmoo1.prod.google.com ([2002:a05:600d:101:b0:45d:e2f3:c626])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:529a:b0:46e:59bb:63cf with SMTP id 5b1f17b1804b1-46fa9af31d9mr184569055e9.24.1760556688057;
 Wed, 15 Oct 2025 12:31:28 -0700 (PDT)
Date: Wed, 15 Oct 2025 19:31:27 +0000
In-Reply-To: <20251015-cstr-core-v17-4-dc5e7aec870d@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <20251015-cstr-core-v17-4-dc5e7aec870d@gmail.com>
Message-ID: <aO_2j7uQGLbXmZVS@google.com>
Subject: Re: [PATCH v17 04/11] rust_binder: use `core::ffi::CStr` method names
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

On Wed, Oct 15, 2025 at 03:24:34PM -0400, Tamir Duberstein wrote:
> Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
> avoiding methods that only exist on the latter.
> 
> This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
> driver").
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
