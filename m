Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841762F4A
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 17:08:04 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id z20so840309iof.1
        for <llvm@lists.linux.dev>; Fri, 20 May 2022 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i9RUNA8HR+3LMt6aSWi5aaLx+ys609H8mKFKAqfMPg0=;
        b=fi8Mi0svNJsbGMxAZlv113yYTnugqYauhfAsCUjx6xSentLsfoGMTD6TThGnvsRwTo
         5V85jyeVzRrM2JRDguntsgHeUP2UvmuQarXoztfrsWUfLf0fu/+Yut87wQdMj0CyN/7G
         HXNmvNoRXKz8IzDmIU92PtZsvMCvhczDbMzl/QLZReCMgfhD7hM8t0es/DethhdUDKvR
         NBPyDA4bGLJmiV7+8vuF2ELVeeUhiFgiPYYWhUbW66GBc78jExJkY1RBZF3tmlaCfXVY
         eKw73WLuhZaNHsFn+5E/EY+FQH0fLLcu3F9aovWsHm5DWAUdvto/9V1Vhv0r86IEy4Kg
         RrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i9RUNA8HR+3LMt6aSWi5aaLx+ys609H8mKFKAqfMPg0=;
        b=U0GafWBJHlkoZuVUGSzUhRHoAizimY+U3nY1D33EIha9ejUPTuOyPZqVwYe2LPcBtf
         9cteTUMhCBaXJv7Sw6v+XYsan47OsR/CcjtROxdoMrLVyInO87rs+QNDbz2yAGvupc8d
         EHYXRhGzQ/4i8nKDDviVsd/W7qUF/KtbMrCM+DICD3+W8WUCC+ZLpKil8hVrfqJF+URB
         o5+cBmota+dVYpuOZTmh7uhdr45aDAWoOFaT+toNANMME8mwt8VjN1jYY1YXYlR4q3qt
         hT6rv0fAbWF1BZhW3TB0mQHN/Ny3EMwJTnv23Q4sG3J7EYAxvRUziBDpKMXRvrb65J7v
         QOyA==
X-Gm-Message-State: AOAM530SFO9L5UFfeaZG70MJTqhLyHAz49F8WBD2T5mOczI/h0r0tj9C
	zsIO6KufWWW3NkOszwigjXVHnYKmLq8oXjDqGUs=
X-Google-Smtp-Source: ABdhPJx0Wxbb+MrHMlPDahkSrsVbBco0rEU7ibhFy6N5zjeUlbIkyQBb+iddFyu3mMBkraqNHFu1vga1jEp2stAeLiw=
X-Received: by 2002:a05:6638:f89:b0:32e:89f4:e150 with SMTP id
 h9-20020a0566380f8900b0032e89f4e150mr4780556jal.308.1653066483631; Fri, 20
 May 2022 10:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220506160106.522341-1-mic@digikod.net> <20220506160106.522341-4-mic@digikod.net>
In-Reply-To: <20220506160106.522341-4-mic@digikod.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 May 2022 19:07:52 +0200
Message-ID: <CANiq72=75oefMG_GFO5scHZQ1Swk+oBLST83VWM6pvUuf-R-4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clang-format: Fix goto labels indentation
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
	Brian Norris <briannorris@chromium.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Paul Moore <paul@paul-moore.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2022 at 6:00 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> w=
rote:
>
> Thanks to IndentGotoLabels introduced with clang-format-10 [1], we can
> avoid goto labels identation.  This follows the current coding style and
> it is then in line with the checkpatch.pl rules [2].

To be consistent, this should increase the minimum to clang-format-10
-- I will fix it on my side.

Cheers,
Miguel
