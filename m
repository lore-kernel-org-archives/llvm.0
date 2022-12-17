Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886E463F
	for <llvm@lists.linux.dev>; Sat, 17 Dec 2022 04:44:44 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id z4-20020a17090ab10400b002195a146546so5184298pjq.9
        for <llvm@lists.linux.dev>; Fri, 16 Dec 2022 20:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lq5qLaqjn47UolL4tsokkeSChCFRg4lpAueP7xiyK5c=;
        b=hI3GPjV+otMa4Ye095FQjaGiWFlvwbSCtpy0DBUgqx9lFQzUf2P0+VMQ+0p2TVTqA5
         RWgmwjx++Vat5TAo6ZfBcEzl2ZRlK0ZvijwVXFFrEBj2H0CDfCxn7T4YMffcWbCjNa1k
         OJ1EPcqIFGczYb7jLwFDNuh3dCqMPAyPDyafE9GbwooLR5G9wHsJJe+T94Zh3w3gAyx+
         mdEDkdd8xr1Tfwaqf9PpBiVqe0nyLrdo8K7KCclSR7jY4bh0MjIjPp0ejIeHUmkRkjI1
         wnNzvdOhssab9K/qDUX2tlWPiLFv8SGiFbH+aFMdn+xsjdYLaNd8mNcT9S/wPq2j5kby
         0GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lq5qLaqjn47UolL4tsokkeSChCFRg4lpAueP7xiyK5c=;
        b=TvfXVFO+isB7dGSY5xJ7qhlf8winqKlKq/ELLuXUb0IV1BY4/Gkiu28XOYIwajDOkl
         wQbSHWuzWnznsUxMrM9ZqpY7+1v0jhATy+zEp/s6pl9N9Fc+ZqzUX1Hs8AIC/RR5oA3q
         AZKgcqiUgidXoxibtx3OYSGc7NxIIJiH/BzsAG3T+LIKga/rNCNgtzeiFRD1k9Bta8TV
         Tb1bmckMvosgTxvT8EdTUtWTwfxg3S/lLO7F6w4obW26wN701EahLBUN2iBmExdhkW7M
         VkCpSm0CZOX/SmvmuDPsjovt0VFpdUDVJZ+MxFvhNP9r0/WhdV4DPKYt2C1k0gMWFoxn
         S5fw==
X-Gm-Message-State: AFqh2kqlNUXu7oT01G/HWFNt4zbOw+2RSZT7MRXKzYTOexn3MeDOenNb
	es4J/Jk+J79nLiL9nLBjujguqkXBOozWpA==
X-Google-Smtp-Source: AMrXdXvH1QaOoHmXxQnjA4mtzl2imb7fSbG7jRPeov73t2X0+amIt1J7VPlYImsSKZuDLTlFJocq/RGIXZxZFA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90a:d318:b0:220:1f03:129b with SMTP
 id p24-20020a17090ad31800b002201f03129bmr138587pju.0.1671252283386; Fri, 16
 Dec 2022 20:44:43 -0800 (PST)
Date: Sat, 17 Dec 2022 12:44:33 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221217044436.4138642-1-davidgow@google.com>
Subject: [PATCH 0/3] rust: arch/um: Rust support for UML
From: David Gow <davidgow@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: David Gow <davidgow@google.com>, rust-for-linux@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	kunit-dev@googlegroups.com, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Latypov <dlatypov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

This series adds support for building and running code in the Rust
programming language under x86_64 UML kernels.

It is based on two Pull Requests from the Rust-for-Linux GitHub page:
- https://github.com/Rust-for-Linux/linux/pull/766
- https://github.com/Rust-for-Linux/linux/pull/881

The series consists of three patches: the first two set up various
compiler options to match both the UML and the X86 CFLAGS.

Rust support can be enabled by setting CONFIG_RUST=y, when the suitable
Rust compiler and bindgen versions are available (run make rustavaiable
to check). LLVM=1 is also required at present with all Rust builds.

The whole thing can be built and tested with kunit.py:
./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=y --make_options LLVM=1

(Note that there are no Rust-based KUnit tests upstream yet. The "rust"
branch of the Rust-for-Linux GitHub repository does use KUnit for its
"doctests", and all of those tests pass under UML with these patches.)

This series is currently based on the uml/next branch: I'm happy to
rebase it next year once we're past the 6.2 merge window (though it
applies cleanly to torvalds/master at the moment). Equally, it
should be possible to take these changes in via the rust tree instead,
but since it's mostly UML Makefile changes, it probably makes more sense
for it to go in via the uml tree.

Also note that this series marks UML as a "maintained" architecture for
Rust support. It's definitely my intention to keep this working, but if
anyone has serious concerns, we can downgrade that.

Cheers,
-- David

David Gow (3):
  rust: arch/um: Use 'pie' relocation mode under UML
  rust: arch/um: Disable FP/SIMD instruction to match x86
  rust: arch/um: Add support for CONFIG_RUST under x86_64 UML

 Documentation/rust/arch-support.rst | 2 ++
 arch/um/Kconfig                     | 1 +
 arch/um/Makefile                    | 2 ++
 arch/x86/Makefile.um                | 6 ++++++
 4 files changed, 11 insertions(+)

-- 
2.39.0.314.g84b9a713c41-goog

