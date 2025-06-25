Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4115442A
	for <llvm@lists.linux.dev>; Wed, 25 Jun 2025 05:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750828528; cv=none; b=Zj/S6cKQlqrDAYlSDYwbQ/Hyky6QTowR5BthkUjM9BVXktbJ3HE86jBdND8kK/qiQvnPgDWQWxlFzYCXBfwvsITXLf1Dog9bf7mmbz8AKqKuyQfJJrXYMEcKSxyxzxF0SZQIGqJHD/98uDRG8R+U2dwU0t91HGwbc+OFeLctjLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750828528; c=relaxed/simple;
	bh=lhtkNSuzXSsKjmt0T3z4wl91aDwkJDnhCQdTrItbqic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=shmic0xWp8qVKuqPa5AvckzHSOZf1bobyzai+5eIlzJh2ltVG1MruslHOp9IzUl4LluWUGfQC3raSkkOb4capeWkY3UC3w/gLcDQnl2slkcC1beGFUuuD7YI+Z5Y431M9WUxaoCLGwa95nXlAqTQLH4x0BFAzLBEx1Cg9l0A/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBJRtvcZ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBJRtvcZ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d094ef02e5so65405685a.1
        for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 22:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750828525; x=1751433325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a2OOPxKWYk4hTUfw7nSlfH/YrkvOwqTvCn4QLXORMeU=;
        b=kBJRtvcZVRV5ubKOmAgvuf/DNApanuZ1ISpP8oMrGxfdB+q7ByOCk+TE2iGaEAUqBb
         nvl5IrpQSl7kIHKSQhKBKk1RFyR7yV0cyaZSjEKdEC6BI8nSeT1/Dzhkr6lTBHb1w/cI
         7CLQ5krk9RefsgAobCP+3dr++Ks5QUQNfcbkEBhOX0jkNDTqLUPnh1wASTDZpeVWtY+w
         HWV8hQ0PoZdxWdqC+x3nXiHU1k9mVkJAj3i55VWfzF61Fwkuva9akYolTGqbX9HpyRcE
         +tA6ImGlOWP6tlTQmLC42FeMMqMVAKdhAPjfqkm+UkG3DhaAMAbZICREx4Fxl0dvNf51
         1Dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750828525; x=1751433325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2OOPxKWYk4hTUfw7nSlfH/YrkvOwqTvCn4QLXORMeU=;
        b=PnbKzOP60Mzn+Jh12NEmg4Raks88Xw1ZRTN6VjOH3jYSzoLm3cKMIqFrRsDwSJcaj4
         MPPHIkXPmgksHSdItC02yYaM6dpkMfzMg/FBWTdrsjxXOycrUj2OT7UVPVLjkcSLG7Q8
         TIlTXsVijvLwBZoIEvfNWEDatlkO93walK4oZ4/A469mYkdu7/MpBWpjosIqSKGgrgjC
         CDj5pb7/fjGPiloACKItUMUZSJt+JCOZCfSsN5Ttwa3hgJQB5atI/qbo/13TqO1TCLmO
         MNrn5fNC2GBeBYqubXNyLC4dFeO2sguNr6SnXEJEORgUQjiiXKTrP0BhfguT2yUriL2x
         toMw==
X-Forwarded-Encrypted: i=1; AJvYcCUCWjIhRezxI1LLr+ujH35rtnls+PP07di1qrxJi+VwVSVrjE1Nmh/Ypr8fAgBXQvFB6tWu@lists.linux.dev
X-Gm-Message-State: AOJu0YykR0k8FMmv37VBOt5w98+I2pB4Dg/9LkyuUeimqr21mADh4sok
	lUo4Nx9tLrrjvx9do3PJ9S0GeUVCBu6351Lqg2GXHRHiYDYwLEW04HpC
X-Gm-Gg: ASbGnctipuLK/waVvXS7qm0MXk9b4x7RhuVBF9bfiZuxeQZM1TX861FhJWmEl733rb2
	s6aSX5T444eiqpcqQ2NLqJaS6yz/9GOvYRLltTMvdux4lgBYE+OCNaNKMUhrYTpwwVkhytqExK4
	kMmdnaXSqjRSH76V7RVso35Y4T2jlc4bsRV5qB5pNsFlF++Pjn9/ybuAwUuzBcHqu7EhEC01MPs
	/+WTGcRnxvUTJ0uvoqCumd3Mq3QXwq48h8xQ+9PanBGr6JnWSG5p7ZET6/UsjmFMFsjnGQTFOIi
	YkaRM97vJRIdbMJNuayzTx/R/BvbCugjEhkDBhoxlIfxmyJzoVUcI9I/R6L1KVLAETgVzH5syjl
	6oG8S+GvVACJzAQJhRAf+GLmkFYc8B6SXWB/Vdr2mGrAEZ+f7cza9
X-Google-Smtp-Source: AGHT+IFT5SEYKNYQmQtuyu/Uzh51mp9bJuGn28ALvttvIJjRc9ik/mxqgQs83zOisQSg8uoeVy315w==
X-Received: by 2002:a05:620a:191d:b0:7cd:45ec:aac6 with SMTP id af79cd13be357-7d42993bc63mr194192185a.24.1750828522822;
        Tue, 24 Jun 2025 22:15:22 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f992f21bsm581457085a.0.2025.06.24.22.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:15:22 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4FD67F40066;
	Wed, 25 Jun 2025 01:15:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 01:15:21 -0400
X-ME-Sender: <xms:6YVbaOyVSJcbYZAvZJKym4BlhhEw2mwtcLC194hMfX_VezftFQ8lMg>
    <xme:6YVbaKT5H8amyh-WG1EFryMubAIARx_K1MsclJfOyhxaWwMJbsQWE1BDElhO1Mm6c
    DwVt1Qd-t2CPpHl2Q>
X-ME-Received: <xmr:6YVbaAX7dmiPsWlLF1i5jqWGaTOvC8lZWXZ6CHmjmNezyKtuTMWvF1YGjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeeuohhquhhnucfhvghn
    ghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    epgeegueekgefhvedukedtveejhefhkeffveeufeduiedvleetledtkeehjefgieevnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngh
    eppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepfeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlhgvlh
    hlihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihhtthho
    theslhhinhgrrhhordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmhgrnh
    hnsegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhr
    ghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hmghhorhhmrghnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:6YVbaEjLrmPFhuS3qAzTL1kF7GcaDRZFvRMYrJn4Xt85ksVOigYroQ>
    <xmx:6YVbaAACs47NIlhwSowVmDy5oFOD-9-M6wyO0XNWAuooaNtqdiEDbA>
    <xmx:6YVbaFJ26u595Bgm2RbmcVFs8bo-hmkEYDgT-upJpycidUtbsOnRnA>
    <xmx:6YVbaHCeVwKxy0FrQ-ckIWFrRAsQf00F-OKnSmZ3pvShYurEn6zAJQ>
    <xmx:6YVbaIzil-_nsJvVnMUVhuXgtcScToVW96Ss-PxK09iDPxynXgfwnxhL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 01:15:20 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev
Subject: [GIT PULL] [PATCH v2 0/5] rust: Task & schedule related changes for v6.17
Date: Tue, 24 Jun 2025 22:15:13 -0700
Message-Id: <20250625051518.15255-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ingo & Peter,

This is the updated version from my pull request last cycle:

v1: https://lore.kernel.org/rust-for-linux/20250506045843.51258-1-boqun.feng@gmail.com/

Please take a look, thanks!

Changes since v1:

- `Location::file_with_nul()` is used to avoid the C changes of
  __might_sleep()

Regards,
Boqun


The following changes since commit 5bc34be478d09c4d16009e665e020ad0fcd0deea:

  sched/core: Reorganize cgroup bandwidth control interface file writes (2025-06-18 13:59:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sched.2025.06.24

for you to fetch changes up to 7e611710acf966df1e14bcf4e067385e38e549a1:

  rust: task: Add Rust version of might_sleep() (2025-06-24 15:53:50 -0700)

----------------------------------------------------------------
Rust task & schedule changes for v6.17:

- Make Task, CondVar and PollCondVar methods inline to avoid unnecessary
  function calls

- Add might_sleep() support for Rust code: Rust's "#[track_caller]"
  mechanism is used so that Rust's might_sleep() doesn't need to be
  defined as a macro

----------------------------------------------------------------
Boqun Feng (1):
  rust: Introduce file_from_location()

FUJITA Tomonori (1):
  rust: task: Add Rust version of might_sleep()

Kunwu Chan (2):
  rust: sync: Mark CondVar::notify_*() inline
  rust: sync: Mark PollCondVar::drop() inline

Panagiotis Foliadis (1):
  rust: task: Mark Task methods inline

 init/Kconfig                |  3 +++
 rust/helpers/task.c         |  6 +++++
 rust/kernel/lib.rs          | 48 +++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/condvar.rs |  3 +++
 rust/kernel/sync/poll.rs    |  1 +
 rust/kernel/task.rs         | 33 +++++++++++++++++++++++++
 6 files changed, 94 insertions(+)

-- 
2.39.5 (Apple Git-154)

