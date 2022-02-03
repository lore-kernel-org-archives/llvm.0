Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647782F28
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 22:28:46 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id n17so5177975iod.4
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 14:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S/15KBLqn1+gI3LiLP1R73ftno+g+PTM/BnKtRnTzes=;
        b=XeoOMW8rz2plGCJkP1Hq+gvOdXCxElLRsfLFbRPK1MKqE/qKO1Gg1LfogwnVY39AIL
         Hp0Z/TuETiLGIi4Cyztdknx8aZnxSYpQP20zyiQ/nMRWYFZlali2sFcLeXMgG9UcB6Nx
         W5NNbNmj73WLAQ801WQDpaAIZWIJV/0w9piukfFSo7dkwJOiTv51SKaQs205OjPBkznF
         g6tXIeZby0omLzXyv7o5py0JuQdMYRx6WZFx25G326xHGWOiWqnO2q81rdrelaAYwyUj
         RsXH9qVMJEHV0ldMd0W4YRasZ3/3VVC9ALUfrOqITkoT2Ip9qdxfhCHfYMTAeGkoj9WR
         ANWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S/15KBLqn1+gI3LiLP1R73ftno+g+PTM/BnKtRnTzes=;
        b=CJVyS7tDRrtXsr6RagwQ1QZwaQzkOX8PLUudGdUdGxTnQVmpusY9sfEuFP8pETaeyY
         H+xiqxVsUxOGD1v/jIyLqHV+RAl6hDm3dxHqeRnSnK6CMW2QvxuGtMbsJnlsNXywm22o
         qrDI+O+XyQRlEzlhxnkZ1fPPJbcM6UZ7ifuNSEjcca9K1+paJBBQZzHfZjNryFlZYtSI
         5dGvHIi1lESHWnublLYp5MEf6hLdSMvzYAbFFOOWeuPYnNrSVf0hLTc1wuDWD+F1pV6J
         SMNwX9x9Hc/qKwNnRyZWH7W0a/S6g4lt+aRnm3VHa0sq76biUp+7/P/rh55eaEnYVSFk
         yCdA==
X-Gm-Message-State: AOAM531h/bNjJHcIEPFmRL15y6J5QgbRXZx8w5PIEqhIN6xMAFzL9vkS
	wPoiWkz1ZWR9e5RKs4sShS2YjjsL6eeMFJkGkb0=
X-Google-Smtp-Source: ABdhPJzZsdNJOjt+GX0Uuga8TdJsl6rG51vnNyjJrvbrD8awrY/QTkKIEqJcSIPuFjmMEXqn2jQ0mRXAlR2waIbxok4=
X-Received: by 2002:a05:6602:2b10:: with SMTP id p16mr63882iov.44.1643927325471;
 Thu, 03 Feb 2022 14:28:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202003033.704951-1-keescook@chromium.org>
 <20220202003033.704951-5-keescook@chromium.org> <CAKwvOdkvd=2DcwEpQWBtS3p-hKB6Rvp4YXB4k+81Me6E5H+mqQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkvd=2DcwEpQWBtS3p-hKB6Rvp4YXB4k+81Me6E5H+mqQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Feb 2022 23:28:34 +0100
Message-ID: <CANiq72m1QtGK6_UC0Bkcuu2UK1wKgsrg7wOrSj10bLM+sLceMQ@mail.gmail.com>
Subject: Re: [PATCH 4/4 v5] fortify: Add Clang support
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, George Burgess IV <gbiv@google.com>, llvm@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 11:13 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Sorry, I just noticed this line (already) uses a mix of open coding
> __attribute__ and not. Would you mind also please changing the open
> coded gnu_inline to simply __gnu_inline to make the entire line
> consistent?

+1

Cheers,
Miguel
