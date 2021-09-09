Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ED772
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 00:01:44 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b9-20020a5b07890000b0290558245b7eabso78810ybq.10
        for <llvm@lists.linux.dev>; Wed, 08 Sep 2021 17:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=o8PDKzqZH5YnDx25CbdHIwEItPJ7rMvUJBtgP5mFYfg=;
        b=FBFtm342q8giAehQf40xGgLSuw3lM1gsmX52JN146g5aDYG+WU0u7zAP026p6L3vZN
         TKzeme4N56M2tzwWC6e3PgXW7e9e8G23Q5hx76eEOCVNcdb+IQUHLQGa60ObgmrnSZ6T
         5mu2SWGpFVW0xCORrpU/KuWPVJVGS9uEtF9zmvUSuVpm00p5FB2bPOcZpLBLMfkjhjTX
         HhUdycqqcXrNl24bmrWcOaTwRYFr5O1QXYwiN0BpeXHGhldehaSZ9b3UHgYj+NrT5hCo
         mBGy2jc+xFbO3G3CK1hDX8C03catENyq9nSsADmQGkKEtmB7kjxlaI4Ml6eI8Oiqio2c
         kr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=o8PDKzqZH5YnDx25CbdHIwEItPJ7rMvUJBtgP5mFYfg=;
        b=zD+tsnvicXb3Bm8lnHAfNfiDuLK875RRK6W6h9YfP2byCFcel6LVVQIEzOF4dXIclX
         TI1kym+HdAO3NQF573q4QfUSg+BemN5LZA5Sg0YzwigbNi5bSN81ZB9tLPWWr442IMMs
         c4y/6DuP1da+yjLUv8Bg8UHv9Y6zJhuW/K0+RRJXUfqxdlPVahKjad3MCcDIcqMmdM52
         A9H9v4cl519au5NAzGWk0QPW+XWuBIYnASZUShA1a1iKism0PO8hXPCO4gJ6P7xuKgKy
         6vQgSEvdtOdj6E7/SWZtfDSNebVrbIkZTA91mttT4n4OyXBG0B9BZa1y615SP5++oBDY
         q/xg==
X-Gm-Message-State: AOAM530Hia9iaEOSMCZTSBPh1087fFUpr8HmZd4f4dJnnFRPoUbvDowI
	ypaV1TafADcsx59MnuV0KmZRzTQ24QxmZ+KA16Q=
X-Google-Smtp-Source: ABdhPJwwkdww7Py5G40Xq57UJ6i+9ju3eG7gPNOGMVYD3lJJ85Sv7neRHNIbGG/yXsoWkR4T/pG+zWigQ7SoKaH6eek=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:73d2:a834:c835:2de6])
 (user=ndesaulniers job=sendgmr) by 2002:a25:47c4:: with SMTP id
 u187mr82103yba.225.1631145703826; Wed, 08 Sep 2021 17:01:43 -0700 (PDT)
Date: Wed,  8 Sep 2021 17:01:41 -0700
In-Reply-To: <20210908234751.GA8052@kernel.org>
Message-Id: <20210909000141.3136241-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210908234751.GA8052@kernel.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: Re: [GIT PULL] Compiler Attributes for v5.15-rc1
From: Nick Desaulniers <ndesaulniers@google.com>
To: ojeda@kernel.org
Cc: elver@google.com, geert@linux-m68k.org, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

What about
https://lore.kernel.org/lkml/20210802202326.1817503-1-ndesaulniers@google.com/
(modified to mention clang-14 rather than clang-13)?
