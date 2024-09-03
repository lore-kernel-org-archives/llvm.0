Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E440C1A724C
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725368905; cv=none; b=CM6NlPy0O9/mHtSk5mavpxC9vA3IWgHbyZypOqX478aXkH4Mn+ApYaTjCtlt3dTmCgifjucxBRyfdxo+F88fh1R81yRPy7r9rm7Oa4iiqo5uCkCPu5Khcsc67K165gAFkJUMYptjMehOM+Jv3i987ZFSbsKgrpSfPblQyS15VAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725368905; c=relaxed/simple;
	bh=Vhnmll9zt72GM45/4xbyanTxdOlRJq74euwmki9CYv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IhxcV8MhUQay+zw9qkqSQT2OI4nCjBugbz3rCEs+voAQHB2td/8+1qhKUkERquGOzQNNYANDLsFpcz3g+Nn4Ynha0wbQTeEVPXSFQUn+WKaEigmcP1xhCKMJFKICvnlKvxMcSEC5jgicne4Bm3IbPiYBTe6js6W/gQy497OmJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iorw.io; spf=none smtp.mailfrom=iorw.io; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iorw.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iorw.io
X-QQ-mid: bizesmtp88t1725368783t223hx0z
X-QQ-Originating-IP: qap3eIf9cahdFTsqlxew/Xldv5nVj7nlHj3Cnw0v890=
Received: from localhost.localdomain ( [203.119.160.23])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Sep 2024 21:06:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 186613237743599165
From: Zigit Zo <zig@iorw.io>
To: ojeda@kernel.org,
	bjorn3_gh@protonmail.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	gary@garyguo.net
Cc: zig@iorw.io,
	rust-for-linux@vger.kernel.org,
	linux-um@lists.infradead.org,
	llvm@lists.linux.dev,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] rust: arch/um: Rust modules support for UML
Date: Tue,  3 Sep 2024 21:06:04 +0800
Message-ID: <62F5EEA0B866E9E0+20240903130606.292935-1-zig@iorw.io>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:iorw.io:qybglogicsvrgz:qybglogicsvrgz8a-1

The series make Rust modules running under x86_64 UML, as a supplement
for the previous work:
- https://lore.kernel.org/rust-for-linux/20221217044436.4138642-1-davidgow@google.com/

The previous work by David (many thanks!) has made the Rust UML compiles,
and for the builtin modules, it works as expected. But for loadable
modules, the UML will complain

  'Unknown rela relocation: 9'

when we try to 'insmod rust_print.ko'. That's because the modules are
compiled against '-Crelocation-model=pie', makes the LLVM treat the
modules as PIE executables, but they are just static modules.

Besides, the Rust's code model for x86_64 UML is still 'kernel', leading
some relocations "overflowed", we keep it the same as 'KBUILD_CFLAGS'
set in UML ('large' here) to address it.

Now we can test our Rust modules in UML.

Regards,
-- Zigit

Zigit Zo (2):
  rust: arch/um: use 'static' relocation model for uml modules
  rust: arch/um: use 'large' code model for uml

 arch/um/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
-- 
2.46.0

