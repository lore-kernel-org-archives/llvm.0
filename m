Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683E2F5B
	for <llvm@lists.linux.dev>; Sun, 21 Aug 2022 17:12:06 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id e21so6340380edc.7
        for <llvm@lists.linux.dev>; Sun, 21 Aug 2022 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2IG7yxCXKhrrmlYS5yO7XY8+9kSj2TtQKMSIeXBcBeM=;
        b=KzixGCuDnswaMadZqR4ynhhwNXnoXEVyUxEjeuDGHd5tL+ljlGzsi+LE8LF7F5lwRn
         v9mjz4V1ufMkIAeKimYo9EAgIy0HyOy9AOd/PAq3eqylpiDSkisiUMxEQp1Y8V7AtTGo
         NbrWgFjyqJ/5NmxocTy3bgtBX7ufagCwkWDhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2IG7yxCXKhrrmlYS5yO7XY8+9kSj2TtQKMSIeXBcBeM=;
        b=MChl054pDSIW32si2RtUB2kzXQKoSI84Aa+fKHE1mKvDKgcemiZMm9Vhq4H4gOTcNS
         eSaF50sJE+HP70jIkGwPm5riGB2sscIGXbV5BBx95Cf3Wnqqfwn0Ig7FBZJDhNiWJ9kK
         7YsjjG5x6+LZFZYTa31ID2Ejw1akO4tw3CsMODwAQUNL50HSpxU9hUaL7w2e26SZ6RWL
         X5KerIJBAjI8zdsO0cEdqdQ04aleAu687sf6r0n/Sr9inEuLhJqsCRjdPT9Ymr+G2eD2
         DAFSrc8fjZordYNp/5KIKlk9LeAuaiunrwoFy76VZoqYxC2t36LI2XEgPw9hM3sQvw+3
         SB9Q==
X-Gm-Message-State: ACgBeo05XzOt3uZWieb+Za9HTfMK2xRx6ThejY8Zj9omDSeFdzHmj6qH
	AYHwYt/82NQypBHR7k/Yqh/UO6UZ4XJb78Q7
X-Google-Smtp-Source: AA6agR5HKZkJfW9Q8FIMFCNrciF57eO016LC4iDpkGfSyvYSFc+Vt3fTMZHZr1ULeUnHvMWBxB23xQ==
X-Received: by 2002:a05:6402:328c:b0:446:bcc8:bf49 with SMTP id f12-20020a056402328c00b00446bcc8bf49mr1583871eda.309.1661101924358;
        Sun, 21 Aug 2022 10:12:04 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906218900b0072af92fa086sm5111292eju.32.2022.08.21.10.12.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Aug 2022 10:12:03 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso6580751wma.2
        for <llvm@lists.linux.dev>; Sun, 21 Aug 2022 10:12:03 -0700 (PDT)
X-Received: by 2002:a7b:c399:0:b0:3a5:f3fb:85e0 with SMTP id
 s25-20020a7bc399000000b003a5f3fb85e0mr10127541wmj.38.1661101922857; Sun, 21
 Aug 2022 10:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAADnVQJFc9AnH_9CW+bSRotkKvOmkO9jq-RF6dmyPYOpq691Yg@mail.gmail.com>
 <20220819190640.2763586-1-ndesaulniers@google.com>
In-Reply-To: <20220819190640.2763586-1-ndesaulniers@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 21 Aug 2022 10:11:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLcuvDDS3rZfEgDrwbdJrTx8HCRNiZ5cDc80-_gzHCxw@mail.gmail.com>
Message-ID: <CAHk-=whLcuvDDS3rZfEgDrwbdJrTx8HCRNiZ5cDc80-_gzHCxw@mail.gmail.com>
Subject: Re: [PATCH v2] asm goto: eradicate CC_HAS_ASM_GOTO
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	kvm@vger.kernel.org, llvm@lists.linux.dev, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Borislav Petkov <bp@suse.de>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Applied directly, just because I love seeing old nasty stuff like this go away.

             Linus
