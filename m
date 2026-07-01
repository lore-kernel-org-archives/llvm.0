Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CEB376A11
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 04:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782879674; cv=none; b=VYWm4zaAgTwmU7akfEl/oB0cvtpL6KjB0LVWCX24EN9lIL26fHcC6AILAXkrdq8maSU0up77DGwHgfHxfJyeh5abvMQ72RDZu5lXoTZfOvIIvtYe7mp7LlZeqOONeJO8L3L0Ey3gD+jvi2cZCwvmA3DAVcE00EIvlHyGmnllDCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782879674; c=relaxed/simple;
	bh=ndidOr7I8IHgvxf1AeP1Ck+0PatfZjEXy4LWSt++W30=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=aWV/a+INeC/cnWrypQEULdFHrH/RlRuU4J1DmHKCKJz9qS+CE0qP4qda2sR1mkPMZHHnyV76zO14aRE6Kkx0MAnjvmdM9QY792HRP4tviVwr8L9uyiwCUfgq4HjHyhzr/33XNYOm+jZbn5XVki7X5kPpHQ7hLSDuFC2SuieiImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kmFLyz7u; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kmFLyz7u"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c9f44ddf26so836075ad.3
        for <llvm@lists.linux.dev>; Tue, 30 Jun 2026 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782879669; x=1783484469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIXJacBAyEaKz61QqT13AHUcLwATDSXxJV4uZgWwmww=;
        b=kmFLyz7uVlcN8sbqWWdoBiuDf0Sje1BMvWG86J7dGfjroIhp2lfAYnOgw1+8S0ZwGZ
         NthS4/buWofGOqitZvu2mByyDaxkfnbun/o7d6yD9nmjwxvxlu5WYOT/WupjDnhOOLYn
         GIk/3ukJN/T/DVB2BwhZdB0FIhrowUC0gQTslt6YB0EEukA9dOQ7z3kskdCVX1EPOrvG
         IczK1EJelaNBI7Mxe68F1yJwNtduTveK7F2tC/LVZz4SXZTQRjLPQZWuV8TGbnt3A653
         mFcpxfKOC6eCJLyDKyNgdBQhNj7pLtsHoNwufSvP+wbhbU/3rkHTkgBw2pKeKoCQDP6p
         HjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782879669; x=1783484469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIXJacBAyEaKz61QqT13AHUcLwATDSXxJV4uZgWwmww=;
        b=AAV4wPv95wYhL4JodRv9TSEfH7wdXVamIu9tW4CCTfczZFO+BgsM7V8kosI/+6wgKJ
         hdsu9wjXQuMSWjF8mVEKtz6HZs/M8jgdmtYgxBB3FphjTCaEIPWCWHutTBDi819MUQgd
         Jzn9W8pZx/inhDZjWJbCCE9/gytuCxpo/yGtTaI7ngHatp0HyCLabtMj3lJ+Xqsizqoh
         Bia/qQp6Jsmb4g1ZW+oPoguSxk5bi4s0C+rgK1W2y/+CQvJ1AMfV/0SqL3MqcrJ/ZGHz
         P1DYjP8xLrxip6n0wv0kCXd2E+ksDgSOMGApSzQBUwEyxu7Yl8QPfU6VuCWeKgJ9p2rm
         ou0w==
X-Forwarded-Encrypted: i=1; AHgh+RohUPaFzJBxOby+gA+p55Ccgl4NnPjWFX8Kt3JfucxsE8TOMTgGBfc4ur8DU/YNXF78ceNP@lists.linux.dev
X-Gm-Message-State: AOJu0Yywf235/Go14bjSuX6TzerhA202fOO+/pgQ0SkMrzXaFvzr12UO
	X/49s5gcBSSASSjYaga0KP6uuLFvSkpeSP/X+gCI4gUnLCuKxHJQ9l80s121ctuJL9E=
X-Gm-Gg: AfdE7ckbGK0pr6LC4h3V0ZorzqXE4sM1dysomsrcXy8Vodx8+52VRkN0rRfh3NUi87r
	mJVGecRkMjgn452kudwIbD7pgsyTJvYgYdbeYwmsShsj1J67vMTkoO3HcjBnNMLlYKVn3MDXaIo
	SNPNhNhzz/VG340CwOAI4VTeu35kUHfHNretagoCr8mGYfUCoAZH3EG5bLP+9e71mIvAt02G9uA
	dFBGEJcu7qGbW4YLbRJQGgwS4TVfKRNyufHXYpSQcCfKLMDGbiMUQTz32SOaSaLYtryp6j7+ryp
	qcOcf3F/iRVNLcZYBSdbjjXP79IMxeJQpoY8td8aNqkuUr1BFS36EmKCHaJxFodkP0TGYe7D1Ll
	6fWmcmRDg3Sjr9daj78nOt98jawg7FdBQyO+Xs+fiYELKkskqwVzkXD+s4qsfonk0aTW5O5UcS0
	MNN54seAydtzNycaN5V/ekvhMBQ7MprlXj4yM49XHezH8nbA==
X-Received: by 2002:a17:902:d54f:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2ca7e73b1bfmr1201915ad.21.1782879669155;
        Tue, 30 Jun 2026 21:21:09 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c73a9csm24450865ad.21.2026.06.30.21.20.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 21:21:08 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/3] riscv: improve percpu helpers and PIO mapping
Date: Wed,  1 Jul 2026 12:20:38 +0800
Message-Id: <cover.1782877663.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v5:
- Keep the PIO helper fix local to RISC-V: drop the generic
  HAS_IOPORT_MAP dependency change and the generic ioport_map() change
  from v4.
- Add the missing linux/bits.h include for GENMASK and BITS_PER_BYTE.
- Fix the 8/16-bit LR/SC fallback to mask subword results before writing
  them back.
- Use early-clobber constraints in the 8/16-bit add_return LR/SC fallback.
- Fix this_cpu_and_4/8 to pass the intended operand to RISC-V amoand.
- Initialize the secondary idle task pcpu_offset before starting the CPU.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |  26 ++-
 arch/riscv/include/asm/percpu.h      | 287 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   8 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 326 insertions(+), 22 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5

