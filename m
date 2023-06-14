Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249698C1B
	for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 12:08:56 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3f9df7eb837so18355661cf.2
        for <llvm@lists.linux.dev>; Wed, 14 Jun 2023 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686744536; x=1689336536;
        h=in-reply-to:references:message-id:from:subject:to:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICyOrpP9yZ8UNQouKztYfYpCQHNzL6t2U9KVRuzbBV4=;
        b=CVttXEgcnxek3hQKtlR8hsjF23X01S5bgOt7ZLYziuJ8d/zESBQC1GJtAryd+G6Ra8
         NiRdZ4DJhO0E23mqq0HJk/IhAnok/2l/6yZAvMAGxW9GgWWabRYRBG47i6AvJYWc1Qst
         dHqkHaWIqs1pHhEgq1e/5T4TPSk76zUFqpJBBdVP63mM+XCeMP8XQwM9o9HaG5Gcu0IC
         2toIH0v5Te0+zu5iNdQxaHNPvqcxBt7nuq1pCorFshQQZvtAwvztpvAQ5KyMaPJbjTOF
         clssKGom4EwSFfBrAKp3NKk7uXUOL6rCSExmVUQL3+NlEfZwJvOGbgTyYZTGW61Lp6Hr
         wvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686744536; x=1689336536;
        h=in-reply-to:references:message-id:from:subject:to:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ICyOrpP9yZ8UNQouKztYfYpCQHNzL6t2U9KVRuzbBV4=;
        b=WB+Fy/4/LFCm4dhnE4v1SewHfzBsbcbH+tTzh04Ukbfc+/WxbiSISiiOL6C3X1lbll
         s0AB8D/DYF7XzR9C6DGujt4JTDPpHd4VZFoj3K9qNtPJ2JMkNHMqZ+ZVG0AejBAJIoUh
         +6uFi8v54uFpWNfOSzNl8dWCzV8meWltQC3dcaaN7jiFLO2j8JM1gdQCOF7WXRXmOCBA
         vlbPTnB/R0I3lxqDoV1kyYStE69uTeSZkS7W43VMQhTd9Z/GvI7VSNX9z7RUNcIANKk6
         7Pj8cei8nkk6cf1ZjCrtoVr2yCsXaXQTzgRja75SJobxpFMTPdw6O/ccNxGy0t9cgnB4
         /zdA==
X-Gm-Message-State: AC+VfDx2QiPB9NdszxqfE5Wrg3KdI7oETrx0HSvsTGZZejAHyVtTpgpb
	FK/t/mumI7WWLF3cQhtnKgw=
X-Google-Smtp-Source: ACHHUZ6hxmTpEnrPsU0Ea16L7G6meCduItfLC5GnO65BPUihWPKuwA51vM4DK6qE0dZ4TkoPHD5CKw==
X-Received: by 2002:a05:622a:1888:b0:3ef:6c09:edcc with SMTP id v8-20020a05622a188800b003ef6c09edccmr2399709qtc.22.1686744535717;
        Wed, 14 Jun 2023 05:08:55 -0700 (PDT)
Received: from localhost (2603-6000-8100-7fd4-0000-0000-0000-0619.res6.spectrum.com. [2603:6000:8100:7fd4::619])
        by smtp.gmail.com with ESMTPSA id a22-20020ac844b6000000b003f6c9f8f0a8sm4931656qto.68.2023.06.14.05.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 05:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jun 2023 07:08:53 -0500
To: "Martin Rodriguez Reboredo" <yakoyoku@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Wedson Almeida
 Filho" <wedsonaf@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Tom Rix" <trix@redhat.com>, "Tiago Lam"
 <tiagolam@gmail.com>, "Kees Cook" <keescook@chromium.org>, "Finn Behrens"
 <me@kloenk.de>, "open list:RUST" <rust-for-linux@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>, "open list:CLANG/LLVM BUILD SUPPORT"
 <llvm@lists.linux.dev>
Subject: Re: [PATCH v2 1/1] scripts/rust_is_available: Fix clang version
 check
From: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Message-Id: <CTCD11G9NVTB.3SYR2GFA5VAB3@hackbook>
X-Mailer: aerc 9999
References: <20230528131802.6390-1-ethan.twardy@gmail.com>
 <20230528131802.6390-2-ethan.twardy@gmail.com>
 <525fee98-c694-6a38-cd1e-dd7efd806620@gmail.com>
In-Reply-To: <525fee98-c694-6a38-cd1e-dd7efd806620@gmail.com>

Greetings, Martin!

Thanks very much for your testing and review. Do I need to take any
further action to make this patch ready for review? I sent out a v3
version of the patch, where the only change was adding Reviewed-By and
Tested-By tags to my git commit--since this is my first time
contributing to this community, I wasn't sure whether I needed to do
that. Thanks!

Sincerely,

Ethan Twardy
