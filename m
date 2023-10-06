Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C4DF9DF
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AlSrTDJb"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a21e8ee1b7so24915247b3.1
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696585189; x=1697189989; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEXT3zqowOcMEROZsvFX4v+s9GuyI4jw/O9QWyH3wnk=;
        b=AlSrTDJbTPuuos7cgyjayAerOl+hH3O2yqMUu180++Ls0Lmn6EFd94Yb54tutLnTd7
         lv9cuY0ZUOAySmqX46sHQwKPU8BACJtmmvGqWNIlMMExxRSZGScHE1R3qj1xTw6OuGWv
         H1Thup0MalXkFbknfmunSRe5D4W+5O0kwOtVNC7CMuK0RoQkGyBur90yRiyed13FYcvI
         Z3z7HInlNR7mOzRa5PCSHqpz6ppBHIo36V/z63xXUvNPVxtONKnLq7Tgduktf00AQIxZ
         Llj4BELMfThn86FrWHrgz1vvYLXIakn+d4bUExWk83NHTlxvkX6vPINCrp0mjCILOETx
         cIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696585189; x=1697189989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEXT3zqowOcMEROZsvFX4v+s9GuyI4jw/O9QWyH3wnk=;
        b=YNeWFdfE4KTwy+IbVyw1mANH1HJhD+Xe6xO+6X+TApNjm35LdZ0Etp9eQ0olZNfZ3i
         x7EJYpDkPILPx18WEVfNnAUxTXYuTpe4/+PPLdKhOyhC3RU8S+w8YtA0ztUaTw8RYIfA
         3bAm7cJq8mVRyFGCfZoemyvYTSx73oAX9Hbl/5eY5uDifp5w8joKysOjzmC7qyM0Toor
         kAo31yBJPR7hVY1OMzLuD08us9n+44qbU6kZv+4Jal9rn+Td/NhCCKTJaClLS2iVYfFd
         HP8vuV0gmhTi9a8JIPLqpy5NRGoWQyguE7GHMnuP6hGGzvEZvwWdAtQqeyRO7tBJEyIc
         w+xw==
X-Gm-Message-State: AOJu0Yy0lj8EfQyyV7JUJgNR+cguEW3tspiUVPMCbbgBYDlUje9rFmVS
	d8E0h3rGq0uhr3lqVVgn6a6Cmqj/SrvyaM0=
X-Google-Smtp-Source: AGHT+IFQZBWfdCaXSSBlDUFgpHkcIgBKA74bFHPu54DP8HGTzVNML46hu40WvzPmiCHJHHBqFZplWFGw1pok0Uo=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:1682:0:b0:ca3:3341:6315 with SMTP id
 124-20020a251682000000b00ca333416315mr107661ybw.0.1696585189364; Fri, 06 Oct
 2023 02:39:49 -0700 (PDT)
Date: Fri,  6 Oct 2023 09:39:41 +0000
In-Reply-To: <20231005214057.759089-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005214057.759089-1-mmaurer@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231006093941.1151819-1-aliceryhl@google.com>
Subject: [PATCH v4] rust: Respect HOSTCC when linking for host
From: Alice Ryhl <aliceryhl@google.com>
To: mmaurer@google.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, masahiroy@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, trix@redhat.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

Matthew Maurer <mmaurer@google.com> writes:
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
> 
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly. The linker-flavor selects both which linker to search
> for if the linker is unset, and which kind of linker flags to pass.
> Without this flag, `rustc` would attempt to determine which flags to
> pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> name of the linker-flavor used by `rustc` for all C compilers, including
> both `gcc` and `clang`.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Tested-by: Alice Ryhl <aliceryhl@google.com>

