Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2644C28EB
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 10:56:42 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-536af432ee5so238663207b3.0
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 02:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678186601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPOHIY+gc8hcUU6SBmeBbgRx0IvK4FL5OmeKKmmeG0c=;
        b=PFdukvBPDDh0hDaR0PstyR2iC4hbrhIkphg1WMlxchabdYYe2Twc9ALPRctsDXh66a
         87KfbWOTKvcIGkhvH6+ML8X5Z+0VL4Es0451Qu370/K8u/mEc3WS/mCKa4OU3i2f5noE
         QFYnVm/1ePinq+SbMpDWAUnLgNQaqxkexF1yKa+XakdjqxmvgdquTy1/O7pcvSEQEZH+
         eh4k1B7/LNejIIEKKvwc0/7kXp46yNfUFFQ5NCYVeGdCbwtHF8vp1qqRTlcLQbPlkdrz
         7dkwWdOPL1rq+9esaqYlvvePBXVcWh+BQPTGsZxKMyNVxhZ58nriRWAsj0aVr8dkGzxH
         DN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678186601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPOHIY+gc8hcUU6SBmeBbgRx0IvK4FL5OmeKKmmeG0c=;
        b=oKu9MvPhaS2yMdnhsoQZd+VMvyk4nrMvV9fzMld/jqw4Pkuatb9+6LZeINgok0CWw/
         nKEZvewnu6YwnNpJRgV6+HkXRLT58flvTiGTVZ+h6CNo9jtSHixkkJx1lmnpgK7iLiOJ
         tPqVzZPQ6VYwPuXjiGl/5TV4/C8p9gHYrou607P083EZRBZEdhTSD4Gnz3MiQ6PFm0aF
         s00ovnCmIFs8ZhfWA1+ilZyRKe6sOx4RjmixVrToruxLyamYl1V7bd1Gaxgud4ZCZe0Q
         esXBHl/If/BA+JA1l5g7N0SLh+LRxL9ivuKzvG6IaOFh1wd3H210qVjek3kEDbsubQ0f
         D0iQ==
X-Gm-Message-State: AO0yUKVE3EI4AJ7HeH2LU9X7Fntg7RQ4Qy8kQzQhYq8/B4aKQ1/fSeuX
	ysewNOohxWRcXAxHKAtBirpDt9nuWifNIgnG5EQ=
X-Google-Smtp-Source: AK7set/vZP5VgbdieRCGNt1P4MDgpVw9hkloznp6byCCn62NkrbtjZscaBSfnfsnnnnthyx3ZGOqFsywK3xzdXzGsPw=
X-Received: by 2002:a81:431e:0:b0:533:8080:16ee with SMTP id
 q30-20020a81431e000000b00533808016eemr9046679ywa.10.1678186601088; Tue, 07
 Mar 2023 02:56:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com> <20230307102441.94417-3-conor.dooley@microchip.com>
In-Reply-To: <20230307102441.94417-3-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 11:56:30 +0100
Message-ID: <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] RISC-V: enable building 64-bit kernels with rust support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 11:25=E2=80=AFAM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> While adding RISC-V to the table, I took the chance to re-sort it
> alphabetically.

For reference, there is a patch for this coming at:

    https://lore.kernel.org/rust-for-linux/I0YeaNjTtc4Nh47ZLJfAs6rgfAc_QZxh=
ynNfz-GQKssVZ1S2UI_cTScCkp9-oX-hPYVcP3EfF7N0HMB9iAlm1FcvOJagnQoLeHtiW3bGCgM=
=3D@bamelis.dev/

Cheers,
Miguel
