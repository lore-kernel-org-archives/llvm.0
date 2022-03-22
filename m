Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70228C6A
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 15:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9FD2C340EC;
	Tue, 22 Mar 2022 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647962987;
	bh=/wuEi/uvh9kikMVTzBLXcTmFI7rUcMU9g6h8WZNahOo=;
	h=From:To:Cc:Subject:Date:From;
	b=EVFcIZdn2T2OgMOmHo6W2hdIUGauN/2ICQ4guSLkCKzKzyqQ8WfXaCbRHHYww3TzJ
	 mXgi7Xjp2AOvOzizJzkInSiM+Pbl2ujkBtKv91xa64shP83PfV7G5E6DI1ye9nN9sb
	 tPUpA8lVMJTmg002dbHBLUXpg93+i4a90S6tlPYc6E3JucrZ311RnYqFqQASpxWnRA
	 yl+iG/L6qhqHt7prt2uMj9r4hwDwQxAsv6UoGpxTazGxrMhU01QKAW7y5G6c25vKOJ
	 Wy/VPs4MpT3QaCbvEc8ju8Zf5yAsCzZKwVbOAZHOyAT9cM8AYAswv90Wp57e0wl0MN
	 q52QnKjboEpng==
From: Nathan Chancellor <nathan@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] KVM: x86: Fix clang -Wimplicit-fallthrough in do_host_cpuid()
Date: Tue, 22 Mar 2022 08:29:06 -0700
Message-Id: <20220322152906.112164-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

  arch/x86/kvm/cpuid.c:739:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
          default:
          ^
  arch/x86/kvm/cpuid.c:739:2: note: insert 'break;' to avoid fall-through
          default:
          ^
          break;
  1 error generated.

Clang is a little more pedantic than GCC, which does not warn when
falling through to a case that is just break or return. Clang's version
is more in line with the kernel's own stance in deprecated.rst, which
states that all switch/case blocks must end in either break,
fallthrough, continue, goto, or return. Add the missing break to silence
the warning.

Fixes: f144c49e8c39 ("KVM: x86: synthesize CPUID leaf 0x80000021h if useful")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/kvm/cpuid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 58b0b4e0263c..a3c87d2882ad 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -735,6 +735,7 @@ static struct kvm_cpuid_entry2 *do_host_cpuid(struct kvm_cpuid_array *array,
 			if (function > READ_ONCE(max_cpuid_80000000))
 				return entry;
 		}
+		break;
 
 	default:
 		break;

base-commit: c9b8fecddb5bb4b67e351bbaeaa648a6f7456912
-- 
2.35.1

