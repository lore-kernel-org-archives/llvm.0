Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA43C11CA2
	for <llvm@lists.linux.dev>; Fri, 14 Jul 2023 10:20:59 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-99388334de6so97198566b.0
        for <llvm@lists.linux.dev>; Fri, 14 Jul 2023 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689330058; x=1691922058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ake/2lNPSYG4Kup6Znr90jxcuDjnCQa+kK9QxHmxIwE=;
        b=FdFgSbE9EX08KPCV3DFRa0KauNWmUSSKQuD9KCfK4mOB1MOb00hUTblNSomfgkxhXE
         lktUE68J2GJstAUj/3c+jsVLoFGKsyNmD+spCDoSEq9pliOoU/eTeGKuECVOQJrW96JW
         0DVOb7zMv+7uYhP2k11Kxl4mudnbg+7chPKt8ON/beLgn35QBKRpxoMgV1d5B1uNfFG3
         AgxMMV52IQLUcoM3lpUr88qrhOm889EDxsbpie2PXgMV/VEPfl+Rvtil+sLok6f8e1nb
         hqEwDY8sB3TJuxoDWtQB6lvtOAXTfuQNn+0jvX40UPp1Eoy/88cODPzkhRG3lBSO3Q1c
         ul/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689330058; x=1691922058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ake/2lNPSYG4Kup6Znr90jxcuDjnCQa+kK9QxHmxIwE=;
        b=S+7s7SDxMOKjtqNYwN99q/qXbLi+PtlLRX9Tc5qGKeCUfdlMop7h0ETo7Izr0jkAv2
         1YSSkpuB60to+aFh0dNaStEyTJHsNt8mKk2n6wTA/z19JnG/BpEaYbusVD0G5LY74bJQ
         Pwroyxu1oj9/xSraABFsxrs6aHF6q1YQK22pjBV90xWaond751hVClX0OViw8lLUFIyE
         3IETsr7r4J545jaUOxi+XB0ryJDyFNF2haV+i6j17VA6EsW3JThywRmuTioMC3Ksc1FX
         1YrX8sgksDBe2M8iXC9oeoNt5i7TDFZmWD25+yXuTffB0R+MPol+VX/K0nl6p1YhUnRf
         mZgw==
X-Gm-Message-State: ABy/qLajpEVnTT1Hmf3ZEhZ6YrYZp98z8htAD0+zDjXCRLMW65mUUyUj
	Zl8QWC34R6TboEa6Rj/egOGQfZhJv0sLgtM=
X-Google-Smtp-Source: APBJJlFUTjwiYHQXGcSMMNCtJzQc7XCp95jN1C2fnAoH9M2eakhZaTVLYzm8MTgye2tlwRUOsp8FX+gnfVMrb1M=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:8a62:b0:978:67a2:f503 with SMTP
 id hy2-20020a1709068a6200b0097867a2f503mr8783ejc.12.1689330057916; Fri, 14
 Jul 2023 03:20:57 -0700 (PDT)
Date: Fri, 14 Jul 2023 10:15:01 +0000
In-Reply-To: <20230714-classless_lockdep-v1-1-229b9671ce31@asahilina.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230714-classless_lockdep-v1-1-229b9671ce31@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714101501.2194205-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 01/11] rust: types: Add Opaque::zeroed()
From: Alice Ryhl <aliceryhl@google.com>
To: lina@asahilina.net
Cc: alex.gaynor@gmail.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	daniel@ffwll.ch, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, marcan@marcan.st, 
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	nicolas@fjasle.eu, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	sven@svenpeter.dev, trix@redhat.com, wedsonaf@gmail.com, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

Asahi Lina <lina@asahilina.net> writes:
> Opaque types are internally MaybeUninit, so it's safe to actually
> zero-initialize them as long as we don't claim they are initialized.
> This is useful for many FFI types that are expected to be zero-inited by
> the user.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

LGTM. This is useful on its own.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

