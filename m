Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5741A81
	for <llvm@lists.linux.dev>; Fri, 17 Nov 2023 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidtelang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tpWxnaiT"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5c59fa94f72so25735577b3.2
        for <llvm@lists.linux.dev>; Fri, 17 Nov 2023 10:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700244898; x=1700849698; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fbLTFjANqYgwgt64Svgj7yz/+GXWm87q5kHEmh7RHQ=;
        b=tpWxnaiTpQdAYQBBIDWt07ciUBX8FPdvDow08t2xTV5g6EBlXs/6jTkpWK6Xp4GI8r
         jtFUnomj/Q5TwCv/Bg6MDciyuRk0thgnTQVisrwTMX52fooAJBWc0ObR7nzoXOCPgstb
         EhWdFlhLhn5FGNawZibIpUB8xN/bA85nM8mfzJ3+xAc0/dvMUuru1jarbdc17xfKKpi7
         eNtiG1Tc6kiOq9NEfrfcMffFd46YY/6huY18v0NxG83nJKhXu57eJ9A/Rk71IvdJ509A
         gvMW/LmgRYhZCnYsYtOWF9s/fglEky6bA2P9cLtLD1krYd2+t2hDYjs0UMMN9ltlI8jL
         DIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700244898; x=1700849698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fbLTFjANqYgwgt64Svgj7yz/+GXWm87q5kHEmh7RHQ=;
        b=LKCKyxYpSaXV+mibX4Wm2h3j81GXmXxSCsTzF+2wBfrTPLtlzzIJbrxzmv47YBflX0
         JG4l6FC0JhXaO3LLyPH/sgsnSbUFiNX0YmYmihkWXa5pibVV1f85QepzmKDS/Z1ov11N
         c3lX24rfQQWRormf0E2i1e/Us+MJKbI6u6YQg5WXMpO4ZaAOWjCuQ2zKJEN9/IsFmYAF
         rvXWVPQyCRvo2+50+iMCNquhC3vkZJh0Wnn3iEPX+AG7zcof4mYD6NBs3wS/aYSA84FY
         lq70cl48E8jwmEgwzijhB+9OT81PvLAEeU4fRhchp15//bzte+hC61ihrrp0MF4Dhnj6
         hYlA==
X-Gm-Message-State: AOJu0YyLaF9GqWgbIy00094mXiOzaLCXOy/m92nQ7QcIYUVX7G3NOufH
	iJwl0SunQp/TRAXDofxKXi5EloVp7v0X998=
X-Google-Smtp-Source: AGHT+IEE+IIx7KMHZPN9vdQjcuy3teOmitlUWHKVwlM0G1+hdGFPfVjvcVb0+yiLXwEizmypJME+tSYRJanyIsw=
X-Received: from sidtelang2.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:1b8a])
 (user=sidtelang job=sendgmr) by 2002:a81:d512:0:b0:57a:118a:f31 with SMTP id
 i18-20020a81d512000000b0057a118a0f31mr11293ywj.7.1700244898771; Fri, 17 Nov
 2023 10:14:58 -0800 (PST)
Date: Fri, 17 Nov 2023 18:14:57 +0000
In-Reply-To: <CAA03e5Gb0BDn-e7Th8JPQqrX-EmFW3kGeiKfuFvwEzKe6xRadg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAA03e5Gb0BDn-e7Th8JPQqrX-EmFW3kGeiKfuFvwEzKe6xRadg@mail.gmail.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231117181458.2260258-1-sidtelang@google.com>
Subject: Re: [PATCH v2 RESEND] x86/asm: Force native_apic_mem_read to use mov
From: Sidharth Telang <sidtelang@google.com>
To: marcorr@google.com
Cc: acdunlap@google.com, ak@linux.intel.com, alpergun@google.com, 
	ben-linux@fluff.org, bp@alien8.de, dave.hansen@intel.com, 
	dave.hansen@linux.intel.com, hpa@zytor.com, jacobhxu@google.com, 
	kirill.shutemov@linux.intel.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, nathan@kernel.org, 
	ndesaulniers@google.com, pgonda@google.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, seanjc@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, trix@redhat.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Is this blocked on an item? There seems to be consensus that this
> patch fixes a bug and is taking the right high-level approach (i.e.,
> change the guest code to avoid triggering a sequence that isn't
> supported under CVM exception-based emulation). Without something like
> this, we weren't able to build the kernel w/ CLANG when it is
> configured to run under SEV-ES.

> We sent out two versions of the patch. One that does the mov directly
> [1] and a second that calls readl [2]. Is one of these two patches
> acceptable? Or do we need to follow up on something?
> 
> [1] https://lore.kernel.org/lkml/0D6A1E49-F21B-42AA-BBBF-13BFC308BB1E@zytor.com/T/
> [2] https://lore.kernel.org/all/20220812183501.3555820-1-acdunlap@google.com/

Signal-boosting this thread: is this blocked on any item?

We are still running into this issue (SEV-ES guest unexpectedly requests
termination minutes after booting) and applying this patch seems to fix it.

Thanks,
Sid
