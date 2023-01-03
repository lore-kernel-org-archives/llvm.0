Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6028F6B
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 20:48:17 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id g4so34416954ybg.7
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 12:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=duAdSZgkhcA7cc0zesMwNi8WiFxSphG7fXlOLJEeLBw=;
        b=BoHDK28hBRmwxKsS48EJAqumEn9XPz2jIk2d4T2n2f1GgS+6Gxs7VpTj6RzGGmvGCv
         V6ea4JDTaw2RMkP5koQDKrsBSmmR8O2QPnhm/H0twBrymEYyIvN3jQJKoULwztX4uPqb
         DZtP4lknvC2KAol9ytugiaLKOPUpus1Sa+X63KiCZEsN2ZyjIRKAkDHS2LkWNJRFWInf
         FN8JEPF0U+3T39cUjP562n61zU60UllhbxJuYA/WzBFX03JAhGJedjz6a6eKHqKe9oU5
         Zzbb1hzOhM61y494APqgqVlnGnSMqbawt0rJu1YvLEE+d9206aFlnGQhf5KP31+GwGfz
         62lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duAdSZgkhcA7cc0zesMwNi8WiFxSphG7fXlOLJEeLBw=;
        b=sGvLzgvaY/wATDG6xMQaLVjjnz2vuVd24DJO+P6Vn0qLyvQ8E+n/ASsviLoYwCUe5h
         t8jVl4ZNTHQ2Y6zcHlfXLIJBaloSavORGoQJA35nE1zvv3J2TBiFV8BjhEY3dFdkeqNB
         QEEssw16UMdd3+bFWIjDRoe2SjVLyyniGqiRtXYaVEhqjRcnb7ZGY8ZzkzrsokLK7c22
         VQ1ORpQq1PlfEgOv221EkTNsCf4JwAk7C1jz1vQ+SMbYnU0Oo0dUFOUl48+JnmOPB6Bf
         Ty3ioGaNJm8jhMejL0WW4MnJzxR63bBF0gsiOXKgBgmwCJa4w2sC+Rqlucity4UC9lk0
         YzRw==
X-Gm-Message-State: AFqh2kpaEe7qVz/iprt76Ok4YeV1kcPsQPSaClYvgcDySFiNN8C1UfXp
	Z7bxFW7uEQwaf4Jl4zJS48DcT84KtFiAOJ+lLVE=
X-Google-Smtp-Source: AMrXdXu7h3AK56tJ03BL4g1ut2vqiv8Nz5cNJiDAoHXKlID+o57/TAlbvZxogAXPir6kGBgsFXCH7DKPp+y6fH77Ieo=
X-Received: by 2002:a25:b95:0:b0:744:76b3:8aa3 with SMTP id
 143-20020a250b95000000b0074476b38aa3mr4416884ybl.581.1672778896953; Tue, 03
 Jan 2023 12:48:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231064203.1623793-1-masahiroy@kernel.org>
 <CANiq72m5E1MehfqdrkmJt43fAzUMc9kEKu7x4WaALdgDGJ30-g@mail.gmail.com> <CAK7LNAQOaLHizg24CrMUz7veX0fa0QYwgJzAi5tOT+-CDCmUzw@mail.gmail.com>
In-Reply-To: <CAK7LNAQOaLHizg24CrMUz7veX0fa0QYwgJzAi5tOT+-CDCmUzw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Jan 2023 21:48:05 +0100
Message-ID: <CANiq72nDTJyeS2Re9zayaUsE67W9cuTrOgpKjxqKmJ67u26Qaw@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: fix dep-file processing for rust
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, llvm@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 4:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Yes, my plan is to get it in the kbuild tree with your ack.

Done, also compile- and boot-tested each (on top of -rc1).

Cheers,
Miguel
