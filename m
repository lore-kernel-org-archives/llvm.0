Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A52D11718
	for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 15:04:18 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4142ca41b89so31996311cf.0
        for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694444658; x=1695049458; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72EyxoHPMhyqLAN1Oi5hC6bDHujWPuBTVHMDoLceg0U=;
        b=lEubZhVx0a7u4YwK8QO6Ll8/CELSokjGkgx2CGpcKUYsE4+U94GGdX0JeGDG9hBcIN
         EbVScNEP/s9lbMBWj5efaHukY2soQiJATLuDU0WMDfEOte0xXjAKciAhrHsm7Dn4vzUD
         +5hT+rspmC/qs+EplpEiDU/cR6DjHh/nhUZXK7Cvc+7LPWD7WF001NReGQIqFpNWuNl1
         43pjHC7i3B01DKgmUfYbLkjlkEQo154H60K6Loehi22zkXrB9x9ulBCsYQ1o3ljiw4ni
         VjvJ0PbwAZmctexCFtBfhkneiZnbi0ngj2FOea0gWtyfZsmV0qlLa1o7y4UzyvRVlqma
         lwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694444658; x=1695049458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72EyxoHPMhyqLAN1Oi5hC6bDHujWPuBTVHMDoLceg0U=;
        b=RBKtkWDj/j6v8cWGiNRiiaXVDX2K6cpLaBPbRjWMg207NLkJLOpWbl9nWixopwhiYZ
         VLkT/f4xm6XgdnrR41AFnFjSgBcrIZ9WxD7xmrvBti5sg4nQK1lVsEaO73kDQbHRouCx
         M85d//Zn9mSCieFy+R5xb3RRfN2T7hH4YDK4+xq8/w4pqw1PwxetP6GOHqj/7V8WkocC
         q+Pi4BPUytDpoMz/L6BhSFh3qCrFASGrdTGn+lhP1CT69ZGUzqmwkITavg0Vbx0qwC1l
         Blcnxa1ZGye5fvT8FkMCbl0F7DubhTxlh/jY/eFX4Dlpdkx8dX5IlONTYfDUdabLJluY
         JBOg==
X-Gm-Message-State: AOJu0YwPFN5+S6UC1rXYz3MUOCaqUIVrJghVAsGb3Bv0qe3WlHG1ctrL
	2DbGROzr7orkEv1ELA4JHP1MR7FBlSxy61K/rexYAg==
X-Google-Smtp-Source: AGHT+IEy+PPH0r7bh0RyH/liXMUverdXDjbmX5RZMKLrtXIE9sF+UTS35KMMBa00g3J4ID/JpCvC9ESAIt2ZGXz6O90=
X-Received: by 2002:a0c:b30c:0:b0:64f:4dbe:c675 with SMTP id
 s12-20020a0cb30c000000b0064f4dbec675mr9695545qve.25.1694444657841; Mon, 11
 Sep 2023 08:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230909003715.3579761-25-sashal@kernel.org> <mhng-e2cedb63-0933-4752-bfd8-592e4e1f6e2c@palmer-ri-x1c9>
In-Reply-To: <mhng-e2cedb63-0933-4752-bfd8-592e4e1f6e2c@palmer-ri-x1c9>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 11 Sep 2023 08:03:38 -0700
Message-ID: <CABCJKucm3KjYKgjP9OT4GLe8KZ3QxpRk9GqPD5JgwMaoZumnQQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.4 25/25] riscv: Add CFI error handling
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: sashal@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	keescook@chromium.org, Conor Dooley <conor.dooley@microchip.com>, nathan@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ndesaulniers@google.com, 
	peterz@infradead.org, ajones@ventanamicro.com, heiko@sntech.de, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, liaochang1@huawei.com, 
	namcaov@gmail.com, andy.chiu@sifive.com, guoren@kernel.org, 
	alexghiti@rivosinc.com, Bjorn Topel <bjorn@rivosinc.com>, jeeheng.sia@starfivetech.com, 
	jszhang@kernel.org, greentime.hu@sifive.com, masahiroy@kernel.org, 
	apatel@ventanamicro.com, mnissler@rivosinc.com, coelacanthushex@gmail.com, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 8:33=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com> =
wrote:
> Sami probably understands the dependencies better than I do, but I don't
> think this one is sane to just backport -- there's a whole series here,
> and IIRC we had to set up some clang bits for it to work correctly.

Agreed, it doesn't really make sense to backport this patch.

Sami
