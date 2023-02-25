Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284AE7C
	for <llvm@lists.linux.dev>; Sat, 25 Feb 2023 08:37:41 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-536bbef1c5eso42113937b3.9
        for <llvm@lists.linux.dev>; Sat, 25 Feb 2023 00:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cz98R7Ca78KCbduT2+9H7VwReVgB2OnNZzHlXdg3vPg=;
        b=LslJvRDEXLo8YVQdMr+NYNiAU+2KWc+5HoLP4elf+87SnngnzsWjSRG3ZP1v2tH1Vc
         ddgHtrk8mJCTJzMgbZ2BDxvt3sY5a75hxfx3qcqc/1WEUGJvZbYJnpDRFoeR2DEKm0L5
         Tzb+OfXPYDgsLg2+4/K3Hz2vWBFMJ3LHj2ND+65Q6g+uSnn2eYN0Swb/k6kYCnON/D8Y
         cW+cZyRn+cEVHWBsxQZQrYbsva1lI9AhJN6C6aB9wLPgdBtBNIXxMdcfdhONhY5HkI8X
         pgDjKPr6YL6jopKLbCsYCzj0yxEY9juoLF/FG8v21O/vhddsBND+QmTbxxW3hvPz5tVl
         3pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cz98R7Ca78KCbduT2+9H7VwReVgB2OnNZzHlXdg3vPg=;
        b=TeIofwbwM+r0G3+VtXsdSyuEa6CQNexTMWTJtdcNIjhImBG2evvTgWZlPo/kiQp1PE
         6W95nAlZu1kixe1kERhnsiu1qoxVXtPHRUUmKsr+EiVFe3z9Fop4nJrB5GvZ/WWhV4uI
         JI7vHff4Zg+dwoXEl/pkn0Ehy4Jto5QUiaeZqDz8gKCiJjQcrhMG4pIwLURVu11Z0A89
         nFbx7k6CdMESPunCY5d9jDNrO57a9ytrhXn5rWSFWGRfb8R6exwVunGu5Q9awaw7pKqW
         wAZx8xvQ062nwqVr2pC16k8ypRrCTkXGZEvL5+qKoN7oSa0LIvdTvsGOBVbbOSvJw9S8
         QKNA==
X-Gm-Message-State: AO0yUKWWzBc6yTKL5k3qKzBvEiAS6CUJXtqfCgu8TAKb/dc/pCAHzv7j
	sJut8I6cLpSzwy46XRC0/M5wqh9y4JKzKd+WTF8=
X-Google-Smtp-Source: AK7set+hqtmF+D+rwbu85iQ+EPP3JZXUmywWfrmNyRB+ZMfHnjDwseewKGZ/t0grf+BbEU4WY0+ueRg+zQ4rY2MteRw=
X-Received: by 2002:a81:af50:0:b0:533:9ffb:cb12 with SMTP id
 x16-20020a81af50000000b005339ffbcb12mr6270206ywj.10.1677314260110; Sat, 25
 Feb 2023 00:37:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72nfGfqnk4QyKsf3kmjgBVPG3WFLQqd7_+jLcYh9jG+fQw@mail.gmail.com>
 <mhng-b792c358-a678-4ab3-aba4-4bc38da55744@palmer-ri-x1c9a>
In-Reply-To: <mhng-b792c358-a678-4ab3-aba4-4bc38da55744@palmer-ri-x1c9a>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Feb 2023 09:37:29 +0100
Message-ID: <CANiq72ndkF0JM1kV=ewnO4uGirDowHDGLkhvjQgtLnuPEk_hTQ@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 25, 2023 at 12:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> Works for me.
>
> I've got a few other things in the pipeline for this merge window so
> this probably won't make it, but I'll dig in after that.  We've got a
> bunch of Rust-types floating around Rivos as well, so with any luck
> someone else will have some time to poke around.  Having a full cycle in
> linux-next is probably the right way to go for this sort of thing
> anyway, as it's likely to shake out some long-tail issues.

Thanks a lot! That would be great.

At least from our side, no rush. In fact, we are letting users (or
arch maintainers) to request/submit the architectures themselves as
they need/want them.

Cheers,
Miguel
